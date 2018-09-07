/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "SpellMgr.h"
#include "SpellInfo.h"
#include "ObjectMgr.h"
#include "SpellAuraDefines.h"
#include "SharedDefines.h"
#include "DBCStores.h"
#include "Chat.h"
#include "BattlegroundMgr.h"
#include "BattlefieldWG.h"
#include "BattlefieldMgr.h"
#include "InstanceScript.h"
#include "Player.h"

bool IsPrimaryProfessionSkill(uint32 skill)
{
    SkillLineEntry const* pSkill = sSkillLineStore.LookupEntry(skill);
    if (!pSkill)
        return false;

    if (pSkill->categoryId != SKILL_CATEGORY_PROFESSION)
        return false;

    return true;
}

bool IsPartOfSkillLine(uint32 skillId, uint32 spellId)
{
    SkillLineAbilityMapBounds skillBounds = sSpellMgr->GetSkillLineAbilityMapBounds(spellId);
    for (SkillLineAbilityMap::const_iterator itr = skillBounds.first; itr != skillBounds.second; ++itr)
        if (itr->second->skillId == skillId)
            return true;

    return false;
}

DiminishingGroup GetDiminishingReturnsGroupForSpell(SpellInfo const* spellproto, bool triggered)
{
    if (spellproto->IsPositive())
        return DIMINISHING_NONE;

    for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
    {
        if (spellproto->Effects[i].ApplyAuraName == SPELL_AURA_MOD_TAUNT)
            return DIMINISHING_TAUNT;
    }

    // Explicit Diminishing Groups
    switch (spellproto->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            // Pet charge effects (Infernal Awakening, Demon Charge)
            if (spellproto->SpellVisual[0] == 2816 && spellproto->SpellIconID == 15)
                return DIMINISHING_CONTROLLED_STUN;
            // Frost Tomb
            else if (spellproto->Id == 48400)
                return DIMINISHING_NONE;
            // Gnaw
            else if (spellproto->Id == 47481)
                return DIMINISHING_CONTROLLED_STUN;
            // ToC Icehowl Arctic Breath
            else if (spellproto->SpellVisual[0] == 14153)
                return DIMINISHING_NONE;
            // Black Plague
            else if (spellproto->Id == 64155)
                return DIMINISHING_NONE;
            // Screams of the Dead (King Ymiron)
			else if (spellproto->Id == 51750)
				return DIMINISHING_NONE;
			// Trample, trial of the champion 5.
			else if (spellproto->Id == 67868)
				return DIMINISHING_NONE;
            break;
        }
        // Event spells
        case SPELLFAMILY_UNK1:
            return DIMINISHING_NONE;
        case SPELLFAMILY_MAGE:
        {
            // Frostbite
            if (spellproto->SpellFamilyFlags[1] & 0x80000000)
                return DIMINISHING_ROOT;
            // Shattered Barrier
            else if (spellproto->SpellVisual[0] == 12297)
                return DIMINISHING_ROOT;
            // Deep Freeze
            else if (spellproto->SpellIconID == 2939 && spellproto->SpellVisual[0] == 9963)
                return DIMINISHING_CONTROLLED_STUN;
            // Frost Nova / Freeze (Water Elemental)
            else if (spellproto->SpellIconID == 193)
                return DIMINISHING_CONTROLLED_ROOT;
            // Dragon's Breath
            else if (spellproto->SpellFamilyFlags[0] & 0x800000)
                return DIMINISHING_DRAGONS_BREATH;
            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            // Hamstring - limit duration to 10s in PvP
            if (spellproto->SpellFamilyFlags[0] & 0x2)
                return DIMINISHING_LIMITONLY;
            // Charge Stun (own diminishing)
            else if (spellproto->SpellFamilyFlags[0] & 0x01000000)
                return DIMINISHING_CHARGE;
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Curses/etc
            if ((spellproto->SpellFamilyFlags[0] & 0x80000000) || (spellproto->SpellFamilyFlags[1] & 0x200))
                return DIMINISHING_LIMITONLY;
            // Seduction
            else if (spellproto->SpellFamilyFlags[1] & 0x10000000)
                return DIMINISHING_FEAR;
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            // Pounce
            if (spellproto->SpellFamilyFlags[0] & 0x20000)
                return DIMINISHING_OPENING_STUN;
            // Cyclone
            else if (spellproto->SpellFamilyFlags[1] & 0x20)
                return DIMINISHING_CYCLONE;
            // Entangling Roots
            // Nature's Grasp
            else if (spellproto->SpellFamilyFlags[0] & 0x00000200)
                return DIMINISHING_CONTROLLED_ROOT;
            // Faerie Fire
            else if (spellproto->SpellFamilyFlags[0] & 0x400)
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_ROGUE:
        {
            // Gouge
            if (spellproto->SpellFamilyFlags[0] & 0x8)
                return DIMINISHING_DISORIENT;
            // Blind
            else if (spellproto->SpellFamilyFlags[0] & 0x1000000)
                return DIMINISHING_FEAR;
            // Cheap Shot
            else if (spellproto->SpellFamilyFlags[0] & 0x400)
                return DIMINISHING_OPENING_STUN;
            // Crippling poison - Limit to 10 seconds in PvP (No SpellFamilyFlags)
            else if (spellproto->SpellIconID == 163)
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Hunter's Mark
            if ((spellproto->SpellFamilyFlags[0] & 0x400) && spellproto->SpellIconID == 538)
                return DIMINISHING_LIMITONLY;
            // Scatter Shot (own diminishing)
            else if ((spellproto->SpellFamilyFlags[0] & 0x40000) && spellproto->SpellIconID == 132)
                return DIMINISHING_SCATTER_SHOT;
            // Entrapment (own diminishing)
            else if (spellproto->SpellVisual[0] == 7484 && spellproto->SpellIconID == 20)
                return DIMINISHING_ENTRAPMENT;
            // Wyvern Sting mechanic is MECHANIC_SLEEP but the diminishing is DIMINISHING_DISORIENT
            else if ((spellproto->SpellFamilyFlags[1] & 0x1000) && spellproto->SpellIconID == 1721)
                return DIMINISHING_DISORIENT;
            // Freezing Arrow
            else if (spellproto->SpellFamilyFlags[0] & 0x8)
                return DIMINISHING_DISORIENT;
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Judgement of Justice - limit duration to 10s in PvP
            if (spellproto->SpellFamilyFlags[0] & 0x100000)
                return DIMINISHING_LIMITONLY;
            // Turn Evil
            else if ((spellproto->SpellFamilyFlags[1] & 0x804000) && spellproto->SpellIconID == 309)
                return DIMINISHING_FEAR;
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            // Storm, Earth and Fire - Earthgrab
            if (spellproto->SpellFamilyFlags[2] & 0x4000)
                return DIMINISHING_NONE;
            break;
        }
        case SPELLFAMILY_DEATHKNIGHT:
        {
            // Hungering Cold (no flags)
            if (spellproto->SpellIconID == 2797)
                return DIMINISHING_DISORIENT;
            // Mark of Blood
            else if ((spellproto->SpellFamilyFlags[0] & 0x10000000) && spellproto->SpellIconID == 2285)
                return DIMINISHING_LIMITONLY;
            break;
        }
        default:
            break;
    }

    // Lastly - Set diminishing depending on mechanic
    uint32 mechanic = spellproto->GetAllEffectsMechanicMask();
    if (mechanic & (1 << MECHANIC_CHARM))
        return DIMINISHING_MIND_CONTROL;
    if (mechanic & (1 << MECHANIC_SILENCE))
        return DIMINISHING_SILENCE;
    if (mechanic & (1 << MECHANIC_SLEEP))
        return DIMINISHING_SLEEP;
    if (mechanic & ((1 << MECHANIC_SAPPED) | (1 << MECHANIC_POLYMORPH) | (1 << MECHANIC_SHACKLE)))
        return DIMINISHING_DISORIENT;
    // Mechanic Knockout, except Blast Wave
    if (mechanic & (1 << MECHANIC_KNOCKOUT) && spellproto->SpellIconID != 292)
        return DIMINISHING_DISORIENT;
    if (mechanic & (1 << MECHANIC_DISARM))
        return DIMINISHING_DISARM;
    if (mechanic & (1 << MECHANIC_FEAR))
        return DIMINISHING_FEAR;
    if (mechanic & (1 << MECHANIC_STUN))
        return triggered ? DIMINISHING_STUN : DIMINISHING_CONTROLLED_STUN;
    if (mechanic & (1 << MECHANIC_BANISH))
        return DIMINISHING_BANISH;
    if (mechanic & (1 << MECHANIC_ROOT))
        return triggered ? DIMINISHING_ROOT : DIMINISHING_CONTROLLED_ROOT;
    if (mechanic & (1 << MECHANIC_HORROR))
        return DIMINISHING_HORROR;

    return DIMINISHING_NONE;
}

DiminishingReturnsType GetDiminishingReturnsGroupType(DiminishingGroup group)
{
    switch (group)
    {
        case DIMINISHING_TAUNT:
        case DIMINISHING_CONTROLLED_STUN:
        case DIMINISHING_STUN:
        case DIMINISHING_OPENING_STUN:
        case DIMINISHING_CYCLONE:
        case DIMINISHING_CHARGE:
            return DRTYPE_ALL;
        case DIMINISHING_LIMITONLY:
        case DIMINISHING_NONE:
            return DRTYPE_NONE;
        default:
            return DRTYPE_PLAYER;
    }
}

DiminishingLevels GetDiminishingReturnsMaxLevel(DiminishingGroup group)
{
    switch (group)
    {
        case DIMINISHING_TAUNT:
            return DIMINISHING_LEVEL_TAUNT_IMMUNE;
        default:
            return DIMINISHING_LEVEL_IMMUNE;
    }
}

int32 GetDiminishingReturnsLimitDuration(DiminishingGroup group, SpellInfo const* spellproto)
{
    if (!IsDiminishingReturnsGroupDurationLimited(group))
        return 0;

    // Explicit diminishing duration
    switch (spellproto->SpellFamilyName)
    {
        case SPELLFAMILY_DRUID:
        {
            // Faerie Fire - limit to 40 seconds in PvP (3.1)
            if (spellproto->SpellFamilyFlags[0] & 0x400)
                return 40 * IN_MILLISECONDS;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Wyvern Sting
            if (spellproto->SpellFamilyFlags[1] & 0x1000)
                return 6 * IN_MILLISECONDS;
            // Hunter's Mark
            if (spellproto->SpellFamilyFlags[0] & 0x400)
                return 120 * IN_MILLISECONDS;
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Repentance - limit to 6 seconds in PvP
            if (spellproto->SpellFamilyFlags[0] & 0x4)
                return 6 * IN_MILLISECONDS;
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Banish - limit to 6 seconds in PvP
            if (spellproto->SpellFamilyFlags[1] & 0x8000000)
                return 6 * IN_MILLISECONDS;
            // Curse of Tongues - limit to 12 seconds in PvP
            else if (spellproto->SpellFamilyFlags[2] & 0x800)
                return 12 * IN_MILLISECONDS;
            // Curse of Elements - limit to 120 seconds in PvP
            else if (spellproto->SpellFamilyFlags[1] & 0x200)
               return 120 * IN_MILLISECONDS;
            break;
        }
        default:
            break;
    }

    return 10 * IN_MILLISECONDS;
}

bool IsDiminishingReturnsGroupDurationLimited(DiminishingGroup group)
{
    switch (group)
    {
        case DIMINISHING_BANISH:
        case DIMINISHING_CONTROLLED_STUN:
        case DIMINISHING_CONTROLLED_ROOT:
        case DIMINISHING_CYCLONE:
        case DIMINISHING_DISORIENT:
        case DIMINISHING_ENTRAPMENT:
        case DIMINISHING_FEAR:
        case DIMINISHING_HORROR:
        case DIMINISHING_MIND_CONTROL:
        case DIMINISHING_OPENING_STUN:
        case DIMINISHING_ROOT:
        case DIMINISHING_STUN:
        case DIMINISHING_SLEEP:
        case DIMINISHING_LIMITONLY:
            return true;
        default:
            return false;
    }
}

SpellMgr::SpellMgr() { }

SpellMgr::~SpellMgr()
{
    UnloadSpellInfoStore();
}

/// Some checks for spells, to prevent adding deprecated/broken spells for trainers, spell book, etc
bool SpellMgr::IsSpellValid(SpellInfo const* spellInfo, Player* player, bool msg)
{
    // not exist
    if (!spellInfo)
        return false;

    bool needCheckReagents = false;

    // check effects
    for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
    {
        switch (spellInfo->Effects[i].Effect)
        {
            case 0:
                continue;

            // craft spell for crafting non-existed item (break client recipes list show)
            case SPELL_EFFECT_CREATE_ITEM:
            case SPELL_EFFECT_CREATE_ITEM_2:
            {
                if (spellInfo->Effects[i].ItemType == 0)
                {
                    // skip auto-loot crafting spells, its not need explicit item info (but have special fake items sometime)
                    if (!spellInfo->IsLootCrafting())
                    {
                        if (msg)
                        {
                            if (player)
                                ChatHandler(player->GetSession()).PSendSysMessage("Craft spell %u not have create item entry.", spellInfo->Id);
                            else
                                TC_LOG_ERROR("sql.sql", "Craft spell %u not have create item entry.", spellInfo->Id);
                        }
                        return false;
                    }

                }
                // also possible IsLootCrafting case but fake item must exist anyway
                else if (!sObjectMgr->GetItemTemplate(spellInfo->Effects[i].ItemType))
                {
                    if (msg)
                    {
                        if (player)
                            ChatHandler(player->GetSession()).PSendSysMessage("Craft spell %u create not-exist in DB item (Entry: %u) and then...", spellInfo->Id, spellInfo->Effects[i].ItemType);
                        else
                            TC_LOG_ERROR("sql.sql", "Craft spell %u create not-exist in DB item (Entry: %u) and then...", spellInfo->Id, spellInfo->Effects[i].ItemType);
                    }
                    return false;
                }

                needCheckReagents = true;
                break;
            }
            case SPELL_EFFECT_LEARN_SPELL:
            {
                SpellInfo const* spellInfo2 = sSpellMgr->GetSpellInfo(spellInfo->Effects[i].TriggerSpell);
                if (!IsSpellValid(spellInfo2, player, msg))
                {
                    if (msg)
                    {
                        if (player)
                            ChatHandler(player->GetSession()).PSendSysMessage("Spell %u learn to broken spell %u, and then...", spellInfo->Id, spellInfo->Effects[i].TriggerSpell);
                        else
                            TC_LOG_ERROR("sql.sql", "Spell %u learn to invalid spell %u, and then...", spellInfo->Id, spellInfo->Effects[i].TriggerSpell);
                    }
                    return false;
                }
                break;
            }
        }
    }

    if (needCheckReagents)
    {
        for (uint8 j = 0; j < MAX_SPELL_REAGENTS; ++j)
        {
            if (spellInfo->Reagent[j] > 0 && !sObjectMgr->GetItemTemplate(spellInfo->Reagent[j]))
            {
                if (msg)
                {
                    if (player)
                        ChatHandler(player->GetSession()).PSendSysMessage("Craft spell %u have not-exist reagent in DB item (Entry: %u) and then...", spellInfo->Id, spellInfo->Reagent[j]);
                    else
                        TC_LOG_ERROR("sql.sql", "Craft spell %u have not-exist reagent in DB item (Entry: %u) and then...", spellInfo->Id, spellInfo->Reagent[j]);
                }
                return false;
            }
        }
    }

    return true;
}

uint32 SpellMgr::GetSpellDifficultyId(uint32 spellId) const
{
    SpellDifficultySearcherMap::const_iterator i = mSpellDifficultySearcherMap.find(spellId);
    return i == mSpellDifficultySearcherMap.end() ? 0 : i->second;
}

void SpellMgr::SetSpellDifficultyId(uint32 spellId, uint32 id)
{
    if (uint32 i = GetSpellDifficultyId(spellId))
        TC_LOG_ERROR("spells", "SpellMgr::SetSpellDifficultyId: Spell %u has already spellDifficultyId %u. Will override with spellDifficultyId %u.", spellId, i, id);
    mSpellDifficultySearcherMap[spellId] = id;
}

uint32 SpellMgr::GetSpellIdForDifficulty(uint32 spellId, Unit const* caster) const
{
    if (!GetSpellInfo(spellId))
        return spellId;

    if (!caster || !caster->GetMap() || !caster->GetMap()->IsDungeon())
        return spellId;

    uint32 mode = uint32(caster->GetMap()->GetSpawnMode());
    if (mode >= MAX_DIFFICULTY)
    {
        TC_LOG_ERROR("spells", "SpellMgr::GetSpellIdForDifficulty: Incorrect Difficulty for spell %u.", spellId);
        return spellId; //return source spell
    }

    uint32 difficultyId = GetSpellDifficultyId(spellId);
    if (!difficultyId)
        return spellId; //return source spell, it has only REGULAR_DIFFICULTY

    SpellDifficultyEntry const* difficultyEntry = sSpellDifficultyStore.LookupEntry(difficultyId);
    if (!difficultyEntry)
    {
        TC_LOG_ERROR("spells", "SpellMgr::GetSpellIdForDifficulty: SpellDifficultyEntry not found for spell %u. This should never happen.", spellId);
        return spellId; //return source spell
    }

    if (difficultyEntry->SpellID[mode] <= 0 && mode > DUNGEON_DIFFICULTY_HEROIC)
    {
        TC_LOG_DEBUG("spells", "SpellMgr::GetSpellIdForDifficulty: spell %u mode %u spell is NULL, using mode %u", spellId, mode, mode - 2);
        mode -= 2;
    }

    if (difficultyEntry->SpellID[mode] <= 0)
    {
        TC_LOG_ERROR("sql.sql", "SpellMgr::GetSpellIdForDifficulty: spell %u mode %u spell is 0. Check spelldifficulty_dbc!", spellId, mode);
        return spellId;
    }

    TC_LOG_DEBUG("spells", "SpellMgr::GetSpellIdForDifficulty: spellid for spell %u in mode %u is %d", spellId, mode, difficultyEntry->SpellID[mode]);
    return uint32(difficultyEntry->SpellID[mode]);
}

SpellInfo const* SpellMgr::GetSpellForDifficultyFromSpell(SpellInfo const* spell, Unit const* caster) const
{
    if (!spell)
        return NULL;

    uint32 newSpellId = GetSpellIdForDifficulty(spell->Id, caster);
    SpellInfo const* newSpell = GetSpellInfo(newSpellId);
    if (!newSpell)
    {
        TC_LOG_DEBUG("spells", "SpellMgr::GetSpellForDifficultyFromSpell: spell %u not found. Check spelldifficulty_dbc!", newSpellId);
        return spell;
    }

    TC_LOG_DEBUG("spells", "SpellMgr::GetSpellForDifficultyFromSpell: Spell id for instance mode is %u (original %u)", newSpell->Id, spell->Id);
    return newSpell;
}

SpellChainNode const* SpellMgr::GetSpellChainNode(uint32 spell_id) const
{
    SpellChainMap::const_iterator itr = mSpellChains.find(spell_id);
    if (itr == mSpellChains.end())
        return NULL;

    return &itr->second;
}

uint32 SpellMgr::GetFirstSpellInChain(uint32 spell_id) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
        return node->first->Id;

    return spell_id;
}

uint32 SpellMgr::GetLastSpellInChain(uint32 spell_id) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
        return node->last->Id;

    return spell_id;
}

uint32 SpellMgr::GetNextSpellInChain(uint32 spell_id) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
        if (node->next)
            return node->next->Id;

    return 0;
}

uint32 SpellMgr::GetPrevSpellInChain(uint32 spell_id) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
        if (node->prev)
            return node->prev->Id;

    return 0;
}

uint8 SpellMgr::GetSpellRank(uint32 spell_id) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
        return node->rank;

    return 0;
}

uint32 SpellMgr::GetSpellWithRank(uint32 spell_id, uint32 rank, bool strict) const
{
    if (SpellChainNode const* node = GetSpellChainNode(spell_id))
    {
        if (rank != node->rank)
            return GetSpellWithRank(node->rank < rank ? node->next->Id : node->prev->Id, rank, strict);
    }
    else if (strict && rank > 1)
        return 0;
    return spell_id;
}

SpellRequiredMapBounds SpellMgr::GetSpellsRequiredForSpellBounds(uint32 spell_id) const
{
    return mSpellReq.equal_range(spell_id);
}

SpellsRequiringSpellMapBounds SpellMgr::GetSpellsRequiringSpellBounds(uint32 spell_id) const
{
    return mSpellsReqSpell.equal_range(spell_id);
}

bool SpellMgr::IsSpellRequiringSpell(uint32 spellid, uint32 req_spellid) const
{
    SpellsRequiringSpellMapBounds spellsRequiringSpell = GetSpellsRequiringSpellBounds(req_spellid);
    for (SpellsRequiringSpellMap::const_iterator itr = spellsRequiringSpell.first; itr != spellsRequiringSpell.second; ++itr)
    {
        if (itr->second == spellid)
            return true;
    }
    return false;
}

SpellLearnSkillNode const* SpellMgr::GetSpellLearnSkill(uint32 spell_id) const
{
    SpellLearnSkillMap::const_iterator itr = mSpellLearnSkills.find(spell_id);
    if (itr != mSpellLearnSkills.end())
        return &itr->second;
    else
        return NULL;
}

SpellLearnSpellMapBounds SpellMgr::GetSpellLearnSpellMapBounds(uint32 spell_id) const
{
    return mSpellLearnSpells.equal_range(spell_id);
}

bool SpellMgr::IsSpellLearnSpell(uint32 spell_id) const
{
    return mSpellLearnSpells.find(spell_id) != mSpellLearnSpells.end();
}

bool SpellMgr::IsSpellLearnToSpell(uint32 spell_id1, uint32 spell_id2) const
{
    SpellLearnSpellMapBounds bounds = GetSpellLearnSpellMapBounds(spell_id1);
    for (SpellLearnSpellMap::const_iterator i = bounds.first; i != bounds.second; ++i)
        if (i->second.spell == spell_id2)
            return true;
    return false;
}

SpellTargetPosition const* SpellMgr::GetSpellTargetPosition(uint32 spell_id, SpellEffIndex effIndex) const
{
    SpellTargetPositionMap::const_iterator itr = mSpellTargetPositions.find(std::make_pair(spell_id, effIndex));
    if (itr != mSpellTargetPositions.end())
        return &itr->second;
    return NULL;
}

SpellSpellGroupMapBounds SpellMgr::GetSpellSpellGroupMapBounds(uint32 spell_id) const
{
    spell_id = GetFirstSpellInChain(spell_id);
    return mSpellSpellGroup.equal_range(spell_id);
}

bool SpellMgr::IsSpellMemberOfSpellGroup(uint32 spellid, SpellGroup groupid) const
{
    SpellSpellGroupMapBounds spellGroup = GetSpellSpellGroupMapBounds(spellid);
    for (SpellSpellGroupMap::const_iterator itr = spellGroup.first; itr != spellGroup.second; ++itr)
    {
        if (itr->second == groupid)
            return true;
    }
    return false;
}

SpellGroupSpellMapBounds SpellMgr::GetSpellGroupSpellMapBounds(SpellGroup group_id) const
{
    return mSpellGroupSpell.equal_range(group_id);
}

void SpellMgr::GetSetOfSpellsInSpellGroup(SpellGroup group_id, std::set<uint32>& foundSpells) const
{
    std::set<SpellGroup> usedGroups;
    GetSetOfSpellsInSpellGroup(group_id, foundSpells, usedGroups);
}

void SpellMgr::GetSetOfSpellsInSpellGroup(SpellGroup group_id, std::set<uint32>& foundSpells, std::set<SpellGroup>& usedGroups) const
{
    if (usedGroups.find(group_id) != usedGroups.end())
        return;
    usedGroups.insert(group_id);

    SpellGroupSpellMapBounds groupSpell = GetSpellGroupSpellMapBounds(group_id);
    for (SpellGroupSpellMap::const_iterator itr = groupSpell.first; itr != groupSpell.second; ++itr)
    {
        if (itr->second < 0)
        {
            SpellGroup currGroup = (SpellGroup)abs(itr->second);
            GetSetOfSpellsInSpellGroup(currGroup, foundSpells, usedGroups);
        }
        else
        {
            foundSpells.insert(itr->second);
        }
    }
}

bool SpellMgr::AddSameEffectStackRuleSpellGroups(SpellInfo const* spellInfo, int32 amount, std::map<SpellGroup, int32>& groups) const
{
    uint32 spellId = spellInfo->GetFirstRankSpell()->Id;
    SpellSpellGroupMapBounds spellGroup = GetSpellSpellGroupMapBounds(spellId);
    // Find group with SPELL_GROUP_STACK_RULE_EXCLUSIVE_SAME_EFFECT if it belongs to one
    for (SpellSpellGroupMap::const_iterator itr = spellGroup.first; itr != spellGroup.second; ++itr)
    {
        SpellGroup group = itr->second;
        SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(group);
        if (found != mSpellGroupStack.end())
        {
            if (found->second == SPELL_GROUP_STACK_RULE_EXCLUSIVE_SAME_EFFECT)
            {
                // Put the highest amount in the map
                if (groups.find(group) == groups.end())
                    groups[group] = amount;
                else
                {
                    int32 curr_amount = groups[group];
                    // Take absolute value because this also counts for the highest negative aura
                    if (abs(curr_amount) < abs(amount))
                        groups[group] = amount;
                }
                // return because a spell should be in only one SPELL_GROUP_STACK_RULE_EXCLUSIVE_SAME_EFFECT group
                return true;
            }
        }
    }
    // Not in a SPELL_GROUP_STACK_RULE_EXCLUSIVE_SAME_EFFECT group, so return false
    return false;
}

SpellGroupStackRule SpellMgr::CheckSpellGroupStackRules(SpellInfo const* spellInfo1, SpellInfo const* spellInfo2) const
{
    uint32 spellid_1 = spellInfo1->GetFirstRankSpell()->Id;
    uint32 spellid_2 = spellInfo2->GetFirstRankSpell()->Id;
    if (spellid_1 == spellid_2)
        return SPELL_GROUP_STACK_RULE_DEFAULT;
    // find SpellGroups which are common for both spells
    SpellSpellGroupMapBounds spellGroup1 = GetSpellSpellGroupMapBounds(spellid_1);
    std::set<SpellGroup> groups;
    for (SpellSpellGroupMap::const_iterator itr = spellGroup1.first; itr != spellGroup1.second; ++itr)
    {
        if (IsSpellMemberOfSpellGroup(spellid_2, itr->second))
        {
            bool add = true;
            SpellGroupSpellMapBounds groupSpell = GetSpellGroupSpellMapBounds(itr->second);
            for (SpellGroupSpellMap::const_iterator itr2 = groupSpell.first; itr2 != groupSpell.second; ++itr2)
            {
                if (itr2->second < 0)
                {
                    SpellGroup currGroup = (SpellGroup)abs(itr2->second);
                    if (IsSpellMemberOfSpellGroup(spellid_1, currGroup) && IsSpellMemberOfSpellGroup(spellid_2, currGroup))
                    {
                        add = false;
                        break;
                    }
                }
            }
            if (add)
                groups.insert(itr->second);
        }
    }

    SpellGroupStackRule rule = SPELL_GROUP_STACK_RULE_DEFAULT;

    for (std::set<SpellGroup>::iterator itr = groups.begin(); itr!= groups.end(); ++itr)
    {
        SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(*itr);
        if (found != mSpellGroupStack.end())
            rule = found->second;
        if (rule)
            break;
    }
    return rule;
}

SpellGroupStackRule SpellMgr::GetSpellGroupStackRule(SpellGroup group) const
{
    SpellGroupStackMap::const_iterator itr = mSpellGroupStack.find(group);
    if (itr != mSpellGroupStack.end())
        return itr->second;

    return SPELL_GROUP_STACK_RULE_DEFAULT;
}

SpellProcEventEntry const* SpellMgr::GetSpellProcEvent(uint32 spellId) const
{
    SpellProcEventMap::const_iterator itr = mSpellProcEventMap.find(spellId);
    if (itr != mSpellProcEventMap.end())
        return &itr->second;
    return NULL;
}

bool SpellMgr::IsSpellProcEventCanTriggeredBy(SpellInfo const* spellProto, SpellProcEventEntry const* spellProcEvent, uint32 EventProcFlag, SpellInfo const* procSpell, uint32 procFlags, uint32 procExtra, bool active) const
{
    // No extra req need
    uint32 procEvent_procEx = PROC_EX_NONE;

    // check prockFlags for condition
    if ((procFlags & EventProcFlag) == 0)
        return false;

    bool hasFamilyMask = false;

    /**

    * @brief Check auras procced by periodics

    *Only damaging Dots can proc auras with PROC_FLAG_TAKEN_DAMAGE

    *Only Dots can proc if ONLY has PROC_FLAG_DONE_PERIODIC or PROC_FLAG_TAKEN_PERIODIC.

    *Hots can proc if ONLY has PROC_FLAG_DONE_PERIODIC and spellfamily != 0

    *Only Dots can proc auras with PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_NEG or PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_NEG

    *Only Hots can proc auras with PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS or PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_POS

    *Only Dots can proc auras with PROC_FLAG_TAKEN_SPELL_MAGIC_DMG_CLASS_NEG or PROC_FLAG_TAKEN_SPELL_NONE_DMG_CLASS_NEG

    *Only Hots can proc auras with PROC_FLAG_TAKEN_SPELL_MAGIC_DMG_CLASS_POS or PROC_FLAG_TAKEN_SPELL_NONE_DMG_CLASS_POS

    * @param procSpell the spell proccing the aura
    * @param procFlags proc_flags of spellProc
    * @param procExtra proc_EX of procSpell
    * @param EventProcFlag proc_flags of aura to be procced
    * @param spellProto SpellInfo of aura to be procced

    */

    /// Quick Check - If PROC_FLAG_TAKEN_DAMAGE is set for aura and procSpell dealt damage, proc no matter what kind of spell that deals the damage.
    if (procFlags & PROC_FLAG_TAKEN_DAMAGE && EventProcFlag & PROC_FLAG_TAKEN_DAMAGE)
        return true;

    if (procFlags & PROC_FLAG_DONE_PERIODIC && EventProcFlag & PROC_FLAG_DONE_PERIODIC)
    {
        if (procExtra & PROC_EX_INTERNAL_HOT)
        {
            if (EventProcFlag == PROC_FLAG_DONE_PERIODIC)
            {
                /// no aura with only PROC_FLAG_DONE_PERIODIC and spellFamilyName == 0 can proc from a HOT.
                if (!spellProto->SpellFamilyName)
                    return false;
            }
            /// Aura must have positive procflags for a HOT to proc
            else if (!(EventProcFlag & (PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS | PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_POS)))
                return false;
        }
        /// Aura must have negative or neutral(PROC_FLAG_DONE_PERIODIC only) procflags for a DOT to proc
        else if (EventProcFlag != PROC_FLAG_DONE_PERIODIC)
            if (!(EventProcFlag & (PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_NEG | PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_NEG)))
                return false;
    }

    if (procFlags & PROC_FLAG_TAKEN_PERIODIC && EventProcFlag & PROC_FLAG_TAKEN_PERIODIC)
    {
        if (procExtra & PROC_EX_INTERNAL_HOT)
        {
            /// No aura that only has PROC_FLAG_TAKEN_PERIODIC can proc from a HOT.
            if (EventProcFlag == PROC_FLAG_TAKEN_PERIODIC)
                return false;
            /// Aura must have positive procflags for a HOT to proc
            if (!(EventProcFlag & (PROC_FLAG_TAKEN_SPELL_MAGIC_DMG_CLASS_POS | PROC_FLAG_TAKEN_SPELL_NONE_DMG_CLASS_POS)))
                return false;
        }
        /// Aura must have negative or neutral(PROC_FLAG_TAKEN_PERIODIC only) procflags for a DOT to proc
        else if (EventProcFlag != PROC_FLAG_TAKEN_PERIODIC)
            if (!(EventProcFlag & (PROC_FLAG_TAKEN_SPELL_MAGIC_DMG_CLASS_NEG | PROC_FLAG_TAKEN_SPELL_NONE_DMG_CLASS_NEG)))
                return false;
    }
    // Trap casts are active by default
    if (procFlags & PROC_FLAG_DONE_TRAP_ACTIVATION)
        active = true;

    // Always trigger for this
    if (procFlags & (PROC_FLAG_KILLED | PROC_FLAG_KILL | PROC_FLAG_DEATH))
        return true;

    if (spellProcEvent)     // Exist event data
    {
        // Store extra req
        procEvent_procEx = spellProcEvent->procEx;

        // For melee triggers
        if (procSpell == NULL)
        {
            // Check (if set) for school (melee attack have Normal school)
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & SPELL_SCHOOL_MASK_NORMAL) == 0)
                return false;
        }
        else // For spells need check school/spell family/family mask
        {
            // Check (if set) for school
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & procSpell->SchoolMask) == 0)
                return false;

            // Check (if set) for spellFamilyName
            if (spellProcEvent->spellFamilyName && (spellProcEvent->spellFamilyName != procSpell->SpellFamilyName))
                return false;

            // spellFamilyName is Ok need check for spellFamilyMask if present
            if (spellProcEvent->spellFamilyMask)
            {
                if (!(spellProcEvent->spellFamilyMask & procSpell->SpellFamilyFlags))
                    return false;
                hasFamilyMask = true;
                // Some spells are not considered as active even with have spellfamilyflags
                if (!(procEvent_procEx & PROC_EX_ONLY_ACTIVE_SPELL))
                    active = true;
            }
        }
    }

    if (procExtra & (PROC_EX_INTERNAL_REQ_FAMILY))
    {
        if (!hasFamilyMask)
            return false;
    }

    // Check for extra req (if none) and hit/crit
    if (procEvent_procEx == PROC_EX_NONE)
    {
        // No extra req, so can trigger only for hit/crit - spell has to be active
        if ((procExtra & (PROC_EX_NORMAL_HIT|PROC_EX_CRITICAL_HIT)) && active)
            return true;
    }
    else // Passive spells hits here only if resist/reflect/immune/evade
    {
        if (procExtra & AURA_SPELL_PROC_EX_MASK)
        {
            // if spell marked as procing only from not active spells
            if (active && procEvent_procEx & PROC_EX_NOT_ACTIVE_SPELL)
                return false;
            // if spell marked as procing only from active spells
            if (!active && procEvent_procEx & PROC_EX_ONLY_ACTIVE_SPELL)
                return false;
            // Exist req for PROC_EX_EX_TRIGGER_ALWAYS
            if (procEvent_procEx & PROC_EX_EX_TRIGGER_ALWAYS)
                return true;
            // PROC_EX_NOT_ACTIVE_SPELL and PROC_EX_ONLY_ACTIVE_SPELL flags handle: if passed checks before
            if ((procExtra & (PROC_EX_NORMAL_HIT|PROC_EX_CRITICAL_HIT)) && ((procEvent_procEx & (AURA_SPELL_PROC_EX_MASK)) == 0))
                return true;
        }
        // Check Extra Requirement like (hit/crit/miss/resist/parry/dodge/block/immune/reflect/absorb and other)
        if (procEvent_procEx & procExtra)
            return true;
    }
    return false;
}

SpellProcEntry const* SpellMgr::GetSpellProcEntry(uint32 spellId) const
{
    SpellProcMap::const_iterator itr = mSpellProcMap.find(spellId);
    if (itr != mSpellProcMap.end())
        return &itr->second;
    return NULL;
}

bool SpellMgr::CanSpellTriggerProcOnEvent(SpellProcEntry const& procEntry, ProcEventInfo& eventInfo) const
{
    // proc type doesn't match
    if (!(eventInfo.GetTypeMask() & procEntry.typeMask))
        return false;

    // check XP or honor target requirement
    if (procEntry.attributesMask & PROC_ATTR_REQ_EXP_OR_HONOR)
        if (Player* actor = eventInfo.GetActor()->ToPlayer())
            if (eventInfo.GetActionTarget() && !actor->isHonorOrXPTarget(eventInfo.GetActionTarget()))
                return false;

    // always trigger for these types
    if (eventInfo.GetTypeMask() & (PROC_FLAG_KILLED | PROC_FLAG_KILL | PROC_FLAG_DEATH))
        return true;

    // check school mask (if set) for other trigger types
    if (procEntry.schoolMask && !(eventInfo.GetSchoolMask() & procEntry.schoolMask))
        return false;

    // check spell family name/flags (if set) for spells
    if (eventInfo.GetTypeMask() & (PERIODIC_PROC_FLAG_MASK | SPELL_PROC_FLAG_MASK | PROC_FLAG_DONE_TRAP_ACTIVATION))
    {
        if (procEntry.spellFamilyName && eventInfo.GetSpellInfo() && (procEntry.spellFamilyName != eventInfo.EnsureSpellInfo()->SpellFamilyName))
            return false;

        if (procEntry.spellFamilyMask && eventInfo.GetSpellInfo() && !(procEntry.spellFamilyMask & eventInfo.EnsureSpellInfo()->SpellFamilyFlags))
            return false;
    }

    // check spell type mask (if set)
    if (eventInfo.GetTypeMask() & (SPELL_PROC_FLAG_MASK | PERIODIC_PROC_FLAG_MASK))
    {
        if (procEntry.spellTypeMask && !(eventInfo.GetSpellTypeMask() & procEntry.spellTypeMask))
            return false;
    }

    // check spell phase mask
    if (eventInfo.GetTypeMask() & REQ_SPELL_PHASE_PROC_FLAG_MASK)
    {
        if (!(eventInfo.GetSpellPhaseMask() & procEntry.spellPhaseMask))
            return false;
    }

    // check hit mask (on taken hit or on done hit, but not on spell cast phase)
    if ((eventInfo.GetTypeMask() & TAKEN_HIT_PROC_FLAG_MASK) || ((eventInfo.GetTypeMask() & DONE_HIT_PROC_FLAG_MASK) && !(eventInfo.GetSpellPhaseMask() & PROC_SPELL_PHASE_CAST)))
    {
        uint32 hitMask = procEntry.hitMask;
        // get default values if hit mask not set
        if (!hitMask)
        {
            // for taken procs allow normal + critical hits by default
            if (eventInfo.GetTypeMask() & TAKEN_HIT_PROC_FLAG_MASK)
                hitMask |= PROC_HIT_NORMAL | PROC_HIT_CRITICAL;
            // for done procs allow normal + critical + absorbs by default
            else
                hitMask |= PROC_HIT_NORMAL | PROC_HIT_CRITICAL | PROC_HIT_ABSORB;
        }
        if (!(eventInfo.GetHitMask() & hitMask))
            return false;
    }

    return true;
}

SpellBonusEntry const* SpellMgr::GetSpellBonusData(uint32 spellId) const
{
    // Lookup data
    SpellBonusMap::const_iterator itr = mSpellBonusMap.find(spellId);
    if (itr != mSpellBonusMap.end())
        return &itr->second;
    // Not found, try lookup for 1 spell rank if exist
    if (uint32 rank_1 = GetFirstSpellInChain(spellId))
    {
        SpellBonusMap::const_iterator itr2 = mSpellBonusMap.find(rank_1);
        if (itr2 != mSpellBonusMap.end())
            return &itr2->second;
    }
    return NULL;
}

SpellThreatEntry const* SpellMgr::GetSpellThreatEntry(uint32 spellID) const
{
    SpellThreatMap::const_iterator itr = mSpellThreatMap.find(spellID);
    if (itr != mSpellThreatMap.end())
        return &itr->second;
    else
    {
        uint32 firstSpell = GetFirstSpellInChain(spellID);
        itr = mSpellThreatMap.find(firstSpell);
        if (itr != mSpellThreatMap.end())
            return &itr->second;
    }
    return NULL;
}

SkillLineAbilityMapBounds SpellMgr::GetSkillLineAbilityMapBounds(uint32 spell_id) const
{
    return mSkillLineAbilityMap.equal_range(spell_id);
}

PetAura const* SpellMgr::GetPetAura(uint32 spell_id, uint8 eff) const
{
    SpellPetAuraMap::const_iterator itr = mSpellPetAuraMap.find((spell_id<<8) + eff);
    if (itr != mSpellPetAuraMap.end())
        return &itr->second;
    else
        return NULL;
}

SpellEnchantProcEntry const* SpellMgr::GetSpellEnchantProcEvent(uint32 enchId) const
{
    SpellEnchantProcEventMap::const_iterator itr = mSpellEnchantProcEventMap.find(enchId);
    if (itr != mSpellEnchantProcEventMap.end())
        return &itr->second;
    return NULL;
}

bool SpellMgr::IsArenaAllowedEnchancment(uint32 ench_id) const
{
    return mEnchantCustomAttr[ench_id];
}

const std::vector<int32>* SpellMgr::GetSpellLinked(int32 spell_id) const
{
    SpellLinkedMap::const_iterator itr = mSpellLinkedMap.find(spell_id);
    return itr != mSpellLinkedMap.end() ? &(itr->second) : NULL;
}

PetLevelupSpellSet const* SpellMgr::GetPetLevelupSpellList(uint32 petFamily) const
{
    PetLevelupSpellMap::const_iterator itr = mPetLevelupSpellMap.find(petFamily);
    if (itr != mPetLevelupSpellMap.end())
        return &itr->second;
    else
        return NULL;
}

PetDefaultSpellsEntry const* SpellMgr::GetPetDefaultSpellsEntry(int32 id) const
{
    PetDefaultSpellsMap::const_iterator itr = mPetDefaultSpellsMap.find(id);
    if (itr != mPetDefaultSpellsMap.end())
        return &itr->second;
    return NULL;
}

SpellAreaMapBounds SpellMgr::GetSpellAreaMapBounds(uint32 spell_id) const
{
    return mSpellAreaMap.equal_range(spell_id);
}

SpellAreaForQuestMapBounds SpellMgr::GetSpellAreaForQuestMapBounds(uint32 quest_id) const
{
    return mSpellAreaForQuestMap.equal_range(quest_id);
}

SpellAreaForQuestMapBounds SpellMgr::GetSpellAreaForQuestEndMapBounds(uint32 quest_id) const
{
    return mSpellAreaForQuestEndMap.equal_range(quest_id);
}

SpellAreaForAuraMapBounds SpellMgr::GetSpellAreaForAuraMapBounds(uint32 spell_id) const
{
    return mSpellAreaForAuraMap.equal_range(spell_id);
}

SpellAreaForAreaMapBounds SpellMgr::GetSpellAreaForAreaMapBounds(uint32 area_id) const
{
    return mSpellAreaForAreaMap.equal_range(area_id);
}

bool SpellArea::IsFitToRequirements(Player const* player, uint32 newZone, uint32 newArea) const
{
    if (gender != GENDER_NONE)                   // not in expected gender
        if (!player || gender != player->getGender())
            return false;

    if (raceMask)                                // not in expected race
        if (!player || !(raceMask & player->getRaceMask()))
            return false;

    if (areaId)                                  // not in expected zone
        if (newZone != areaId && newArea != areaId)
            return false;

    if (questStart)                              // not in expected required quest state
        if (!player || (((1 << player->GetQuestStatus(questStart)) & questStartStatus) == 0))
            return false;

    if (questEnd)                                // not in expected forbidden quest state
        if (!player || (((1 << player->GetQuestStatus(questEnd)) & questEndStatus) == 0))
            return false;

    if (auraSpell)                               // not have expected aura
        if (!player || (auraSpell > 0 && !player->HasAura(auraSpell)) || (auraSpell < 0 && player->HasAura(-auraSpell)))
            return false;

    if (player)
    {
        if (Battleground* bg = player->GetBattleground())
            return bg->IsSpellAllowed(spellId, player);
    }

    // Extra conditions
    switch (spellId)
    {
        case 58600: // No fly Zone - Dalaran
        {
            if (!player)
                return false;

            AreaTableEntry const* pArea = GetAreaEntryByAreaID(player->GetAreaId());
            if (!(pArea && pArea->flags & AREA_FLAG_NO_FLY_ZONE))
                return false;
            if (!player->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED) && !player->HasAuraType(SPELL_AURA_FLY))
                return false;
            break;
        }
        case 58730: // No fly Zone - Wintergrasp
        {
            if (!player)
                return false;

            Battlefield* Bf = sBattlefieldMgr->GetBattlefieldToZoneId(player->GetZoneId());
            if (!Bf || Bf->CanFlyIn() || (!player->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED) && !player->HasAuraType(SPELL_AURA_FLY)))
                return false;
            break;
        }
        case 56618: // Horde Controls Factory Phase Shift
        case 56617: // Alliance Controls Factory Phase Shift
        {
            if (!player)
                return false;

            Battlefield* bf = sBattlefieldMgr->GetBattlefieldToZoneId(player->GetZoneId());

            if (!bf || bf->GetTypeId() != BATTLEFIELD_WG)
                return false;

            // team that controls the workshop in the specified area
            uint32 team = bf->GetData(newArea);

            if (team == TEAM_HORDE)
                return spellId == 56618;
            else if (team == TEAM_ALLIANCE)
                return spellId == 56617;
            break;
        }
        case 57940: // Essence of Wintergrasp - Northrend
        case 58045: // Essence of Wintergrasp - Wintergrasp
        {
            if (!player)
                return false;

            if (Battlefield* battlefieldWG = sBattlefieldMgr->GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_WG))
                return battlefieldWG->IsEnabled() && (player->GetTeamId() == battlefieldWG->GetDefenderTeam()) && !battlefieldWG->IsWarTime();
            break;
        }
        case 74411: // Battleground - Dampening
        {
            if (!player)
                return false;

            if (Battlefield* bf = sBattlefieldMgr->GetBattlefieldToZoneId(player->GetZoneId()))
                return bf->IsWarTime();
            break;
        }
		// Hellscream's Warsong
		case 73816:
		case 73818:
		case 73819:
		case 73820:
		case 73821:
		case 73822:
			// Strength of Wrynn
		case 73762:
		case 73824:
		case 73825:
		case 73826:
		case 73827:
		case 73828:
			if (player)
				if (InstanceScript* s = const_cast<Player*>(player)->GetInstanceScript())
					return s->GetData(251 /*DATA_BUFF_AVAILABLE*/) != 0;
			return false;
			break;

    }

    return true;
}

void SpellMgr::UnloadSpellInfoChains()
{
    for (SpellChainMap::iterator itr = mSpellChains.begin(); itr != mSpellChains.end(); ++itr)
        mSpellInfoMap[itr->first]->ChainEntry = NULL;

    mSpellChains.clear();
}

void SpellMgr::LoadSpellTalentRanks()
{
    // cleanup core data before reload - remove reference to ChainNode from SpellInfo
    UnloadSpellInfoChains();

    for (uint32 i = 0; i < sTalentStore.GetNumRows(); ++i)
    {
        TalentEntry const* talentInfo = sTalentStore.LookupEntry(i);
        if (!talentInfo)
            continue;

        SpellInfo const* lastSpell = NULL;
        for (uint8 rank = MAX_TALENT_RANK - 1; rank > 0; --rank)
        {
            if (talentInfo->RankID[rank])
            {
                lastSpell = GetSpellInfo(talentInfo->RankID[rank]);
                break;
            }
        }

        if (!lastSpell)
            continue;

        SpellInfo const* firstSpell = GetSpellInfo(talentInfo->RankID[0]);
        if (!firstSpell)
        {
            TC_LOG_ERROR("spells", "SpellMgr::LoadSpellTalentRanks: First Rank Spell %u for TalentEntry %u does not exist.", talentInfo->RankID[0], i);
            continue;
        }

        SpellInfo const* prevSpell = NULL;
        for (uint8 rank = 0; rank < MAX_TALENT_RANK; ++rank)
        {
            uint32 spellId = talentInfo->RankID[rank];
            if (!spellId)
                break;

            SpellInfo const* currentSpell = GetSpellInfo(spellId);
            if (!currentSpell)
            {
                TC_LOG_ERROR("spells", "SpellMgr::LoadSpellTalentRanks: Spell %u (Rank: %u) for TalentEntry %u does not exist.", spellId, rank + 1, i);
                break;
            }

            SpellChainNode node;
            node.first = firstSpell;
            node.last  = lastSpell;
            node.rank  = rank + 1;

            node.prev = prevSpell;
            node.next = node.rank < MAX_TALENT_RANK ? GetSpellInfo(talentInfo->RankID[node.rank]) : NULL;

            mSpellChains[spellId] = node;
            mSpellInfoMap[spellId]->ChainEntry = &mSpellChains[spellId];

            prevSpell = currentSpell;
        }
    }
}

void SpellMgr::LoadSpellRanks()
{
    // cleanup data and load spell ranks for talents from dbc
    LoadSpellTalentRanks();

    uint32 oldMSTime = getMSTime();

    //                                                     0             1      2
    QueryResult result = WorldDatabase.Query("SELECT first_spell_id, spell_id, rank from spell_ranks ORDER BY first_spell_id, rank");

    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell rank records. DB table `spell_ranks` is empty.");
        return;
    }

    uint32 count = 0;
    bool finished = false;

    do
    {
                        // spellid, rank
        std::list < std::pair < int32, int32 > > rankChain;
        int32 currentSpell = -1;
        int32 lastSpell = -1;

        // fill one chain
        while (currentSpell == lastSpell && !finished)
        {
            Field* fields = result->Fetch();

            currentSpell = fields[0].GetUInt32();
            if (lastSpell == -1)
                lastSpell = currentSpell;
            uint32 spell_id = fields[1].GetUInt32();
            uint32 rank = fields[2].GetUInt8();

            // don't drop the row if we're moving to the next rank
            if (currentSpell == lastSpell)
            {
                rankChain.push_back(std::make_pair(spell_id, rank));
                if (!result->NextRow())
                    finished = true;
            }
            else
                break;
        }
        // check if chain is made with valid first spell
        SpellInfo const* first = GetSpellInfo(lastSpell);
        if (!first)
        {
            TC_LOG_ERROR("sql.sql", "Spell rank identifier(first_spell_id) %u listed in `spell_ranks` does not exist!", lastSpell);
            continue;
        }
        // check if chain is long enough
        if (rankChain.size() < 2)
        {
            TC_LOG_ERROR("sql.sql", "There is only 1 spell rank for identifier(first_spell_id) %u in `spell_ranks`, entry is not needed!", lastSpell);
            continue;
        }
        int32 curRank = 0;
        bool valid = true;
        // check spells in chain
        for (std::list<std::pair<int32, int32> >::iterator itr = rankChain.begin(); itr!= rankChain.end(); ++itr)
        {
            SpellInfo const* spell = GetSpellInfo(itr->first);
            if (!spell)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u (rank %u) listed in `spell_ranks` for chain %u does not exist!", itr->first, itr->second, lastSpell);
                valid = false;
                break;
            }
            ++curRank;
            if (itr->second != curRank)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u (rank %u) listed in `spell_ranks` for chain %u does not have proper rank value(should be %u)!", itr->first, itr->second, lastSpell, curRank);
                valid = false;
                break;
            }
        }
        if (!valid)
            continue;
        int32 prevRank = 0;
        // insert the chain
        std::list<std::pair<int32, int32> >::iterator itr = rankChain.begin();
        do
        {
            ++count;
            int32 addedSpell = itr->first;

            if (mSpellInfoMap[addedSpell]->ChainEntry)
                TC_LOG_ERROR("sql.sql", "Spell %u (rank: %u, first: %u) listed in `spell_ranks` has already ChainEntry from dbc.", addedSpell, itr->second, lastSpell);

            mSpellChains[addedSpell].first = GetSpellInfo(lastSpell);
            mSpellChains[addedSpell].last = GetSpellInfo(rankChain.back().first);
            mSpellChains[addedSpell].rank = itr->second;
            mSpellChains[addedSpell].prev = GetSpellInfo(prevRank);
            mSpellInfoMap[addedSpell]->ChainEntry = &mSpellChains[addedSpell];
            prevRank = addedSpell;
            ++itr;

            if (itr == rankChain.end())
            {
                mSpellChains[addedSpell].next = NULL;
                break;
            }
            else
                mSpellChains[addedSpell].next = GetSpellInfo(itr->first);
        }
        while (true);
    }
    while (!finished);

    TC_LOG_INFO("server.loading", ">> Loaded %u spell rank records in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellRequired()
{
    uint32 oldMSTime = getMSTime();

    mSpellsReqSpell.clear();                                   // need for reload case
    mSpellReq.clear();                                         // need for reload case

    //                                                   0        1
    QueryResult result = WorldDatabase.Query("SELECT spell_id, req_spell from spell_required");

    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell required records. DB table `spell_required` is empty.");

        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 spell_id = fields[0].GetUInt32();
        uint32 spell_req = fields[1].GetUInt32();

        // check if chain is made with valid first spell
        SpellInfo const* spell = GetSpellInfo(spell_id);
        if (!spell)
        {
            TC_LOG_ERROR("sql.sql", "spell_id %u in `spell_required` table is not found in dbcs, skipped", spell_id);
            continue;
        }

        SpellInfo const* reqSpell = GetSpellInfo(spell_req);
        if (!reqSpell)
        {
            TC_LOG_ERROR("sql.sql", "req_spell %u in `spell_required` table is not found in dbcs, skipped", spell_req);
            continue;
        }

        if (spell->IsRankOf(reqSpell))
        {
            TC_LOG_ERROR("sql.sql", "req_spell %u and spell_id %u in `spell_required` table are ranks of the same spell, entry not needed, skipped", spell_req, spell_id);
            continue;
        }

        if (IsSpellRequiringSpell(spell_id, spell_req))
        {
            TC_LOG_ERROR("sql.sql", "duplicated entry of req_spell %u and spell_id %u in `spell_required`, skipped", spell_req, spell_id);
            continue;
        }

        mSpellReq.insert (std::pair<uint32, uint32>(spell_id, spell_req));
        mSpellsReqSpell.insert (std::pair<uint32, uint32>(spell_req, spell_id));
        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u spell required records in %u ms", count, GetMSTimeDiffToNow(oldMSTime));

}

void SpellMgr::LoadSpellLearnSkills()
{
    uint32 oldMSTime = getMSTime();

    mSpellLearnSkills.clear();                              // need for reload case

    // search auto-learned skills and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
	for (SpellInfo const* entry : mSpellInfoMap)
	{
		if (!entry)
			continue;

		for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
		{
			SpellLearnSkillNode dbc_node;
			switch (entry->Effects[i].Effect)
			{
			case SPELL_EFFECT_SKILL:
				dbc_node.skill = entry->Effects[i].MiscValue;
				dbc_node.step = entry->Effects[i].CalcValue();
				if (dbc_node.skill != SKILL_RIDING)
					dbc_node.value = 1;
				else
					dbc_node.value = dbc_node.step * 75;
				dbc_node.maxvalue = dbc_node.step * 75;
				break;
			case SPELL_EFFECT_DUAL_WIELD:
				dbc_node.skill = SKILL_DUAL_WIELD;
				dbc_node.step = 1;
				dbc_node.value = 1;
				dbc_node.maxvalue = 1;
				break;
			default:
				continue;
			}

			mSpellLearnSkills[entry->Id] = dbc_node;
			++dbc_count;
			break;
		}
	}

    TC_LOG_INFO("server.loading", ">> Loaded %u Spell Learn Skills from DBC in %u ms", dbc_count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellLearnSpells()
{
    uint32 oldMSTime = getMSTime();

    mSpellLearnSpells.clear();                              // need for reload case

    //                                                  0      1        2
    QueryResult result = WorldDatabase.Query("SELECT entry, SpellID, Active FROM spell_learn_spell");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell learn spells. DB table `spell_learn_spell` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 spell_id = fields[0].GetUInt16();

        SpellLearnSpellNode node;
        node.spell       = fields[1].GetUInt16();
        node.active      = fields[2].GetBool();
        node.autoLearned = false;

        if (!GetSpellInfo(spell_id))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_learn_spell` does not exist", spell_id);
            continue;
        }

        if (!GetSpellInfo(node.spell))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_learn_spell` learning not existed spell %u", spell_id, node.spell);
            continue;
        }

        if (GetTalentSpellCost(node.spell))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_learn_spell` attempt learning talent spell %u, skipped", spell_id, node.spell);
            continue;
        }

        mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell_id, node));

        ++count;
    } while (result->NextRow());

    // search auto-learned spells and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
    for (uint32 spell = 0; spell < GetSpellInfoStoreSize(); ++spell)
    {
        SpellInfo const* entry = GetSpellInfo(spell);

        if (!entry)
            continue;

        for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
        {
            if (entry->Effects[i].Effect == SPELL_EFFECT_LEARN_SPELL)
            {
                SpellLearnSpellNode dbc_node;
                dbc_node.spell = entry->Effects[i].TriggerSpell;
                dbc_node.active = true;                     // all dbc based learned spells is active (show in spell book or hide by client itself)

                // ignore learning not existed spells (broken/outdated/or generic learnig spell 483
                if (!GetSpellInfo(dbc_node.spell))
                    continue;

                // talent or passive spells or skill-step spells auto-cast and not need dependent learning,
                // pet teaching spells must not be dependent learning (cast)
                // other required explicit dependent learning
                dbc_node.autoLearned = entry->Effects[i].TargetA.GetTarget() == TARGET_UNIT_PET || GetTalentSpellCost(spell) > 0 || entry->IsPassive() || entry->HasEffect(SPELL_EFFECT_SKILL_STEP);

                SpellLearnSpellMapBounds db_node_bounds = GetSpellLearnSpellMapBounds(spell);

                bool found = false;
                for (SpellLearnSpellMap::const_iterator itr = db_node_bounds.first; itr != db_node_bounds.second; ++itr)
                {
                    if (itr->second.spell == dbc_node.spell)
                    {
                        TC_LOG_ERROR("sql.sql", "Spell %u auto-learn spell %u in spell.dbc then the record in `spell_learn_spell` is redundant, please fix DB.",
                            spell, dbc_node.spell);
                        found = true;
                        break;
                    }
                }

                if (!found)                                  // add new spell-spell pair if not found
                {
                    mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell, dbc_node));
                    ++dbc_count;
                }
            }
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u spell learn spells + %u found in DBC in %u ms", count, dbc_count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellTargetPositions()
{
    uint32 oldMSTime = getMSTime();

    mSpellTargetPositions.clear();                                // need for reload case

    //                                                0      1          2        3         4           5            6
    QueryResult result = WorldDatabase.Query("SELECT ID, EffectIndex, MapID, PositionX, PositionY, PositionZ, Orientation FROM spell_target_position");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell target coordinates. DB table `spell_target_position` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 Spell_ID = fields[0].GetUInt32();
        SpellEffIndex effIndex = SpellEffIndex(fields[1].GetUInt8());

        SpellTargetPosition st;

        st.target_mapId       = fields[2].GetUInt16();
        st.target_X           = fields[3].GetFloat();
        st.target_Y           = fields[4].GetFloat();
        st.target_Z           = fields[5].GetFloat();
        st.target_Orientation = fields[6].GetFloat();

        MapEntry const* mapEntry = sMapStore.LookupEntry(st.target_mapId);
        if (!mapEntry)
        {
            TC_LOG_ERROR("sql.sql", "Spell (Id: %u, effIndex: %u) target map (ID: %u) does not exist in `Map.dbc`.", Spell_ID, effIndex, st.target_mapId);
            continue;
        }

        if (st.target_X==0 && st.target_Y==0 && st.target_Z==0)
        {
            TC_LOG_ERROR("sql.sql", "Spell (Id: %u, effIndex: %u) target coordinates not provided.", Spell_ID, effIndex);
            continue;
        }

        SpellInfo const* spellInfo = GetSpellInfo(Spell_ID);
        if (!spellInfo)
        {
            TC_LOG_ERROR("sql.sql", "Spell (Id: %u) listed in `spell_target_position` does not exist.", Spell_ID);
            continue;
        }

        if (spellInfo->Effects[effIndex].TargetA.GetTarget() == TARGET_DEST_DB || spellInfo->Effects[effIndex].TargetB.GetTarget() == TARGET_DEST_DB)
        {
            std::pair<uint32, SpellEffIndex> key = std::make_pair(Spell_ID, effIndex);
            mSpellTargetPositions[key] = st;
            ++count;
        }
        else
        {
            TC_LOG_ERROR("sql.sql", "Spell (Id: %u, effIndex: %u) listed in `spell_target_position` does not have target TARGET_DEST_DB (17).", Spell_ID, effIndex);
            continue;
        }

    } while (result->NextRow());

    /*
    // Check all spells
    for (uint32 i = 1; i < GetSpellInfoStoreSize; ++i)
    {
        SpellInfo const* spellInfo = GetSpellInfo(i);
        if (!spellInfo)
            continue;

        bool found = false;
        for (int j = 0; j < MAX_SPELL_EFFECTS; ++j)
        {
            switch (spellInfo->Effects[j].TargetA)
            {
                case TARGET_DEST_DB:
                    found = true;
                    break;
            }
            if (found)
                break;
            switch (spellInfo->Effects[j].TargetB)
            {
                case TARGET_DEST_DB:
                    found = true;
                    break;
            }
            if (found)
                break;
        }
        if (found)
        {
            if (!sSpellMgr->GetSpellTargetPosition(i))
                TC_LOG_DEBUG("spells", "Spell (ID: %u) does not have record in `spell_target_position`", i);
        }
    }*/

    TC_LOG_INFO("server.loading", ">> Loaded %u spell teleport coordinates in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellGroups()
{
    uint32 oldMSTime = getMSTime();

    mSpellSpellGroup.clear();                                  // need for reload case
    mSpellGroupSpell.clear();

    //                                                0     1
    QueryResult result = WorldDatabase.Query("SELECT id, spell_id FROM spell_group");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell group definitions. DB table `spell_group` is empty.");
        return;
    }

    std::set<uint32> groups;
    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 group_id = fields[0].GetUInt32();
        if (group_id <= SPELL_GROUP_DB_RANGE_MIN && group_id >= SPELL_GROUP_CORE_RANGE_MAX)
        {
            TC_LOG_ERROR("sql.sql", "SpellGroup id %u listed in `spell_group` is in core range, but is not defined in core!", group_id);
            continue;
        }
        int32 spell_id = fields[1].GetInt32();

        groups.insert(std::set<uint32>::value_type(group_id));
        mSpellGroupSpell.insert(SpellGroupSpellMap::value_type((SpellGroup)group_id, spell_id));

    } while (result->NextRow());

    for (SpellGroupSpellMap::iterator itr = mSpellGroupSpell.begin(); itr!= mSpellGroupSpell.end();)
    {
        if (itr->second < 0)
        {
            if (groups.find(abs(itr->second)) == groups.end())
            {
                TC_LOG_ERROR("sql.sql", "SpellGroup id %u listed in `spell_group` does not exist", abs(itr->second));
                mSpellGroupSpell.erase(itr++);
            }
            else
                ++itr;
        }
        else
        {
            SpellInfo const* spellInfo = GetSpellInfo(itr->second);

            if (!spellInfo)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_group` does not exist", itr->second);
                mSpellGroupSpell.erase(itr++);
            }
            else if (spellInfo->GetRank() > 1)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_group` is not first rank of spell", itr->second);
                mSpellGroupSpell.erase(itr++);
            }
            else
                ++itr;
        }
    }

    for (std::set<uint32>::iterator groupItr = groups.begin(); groupItr != groups.end(); ++groupItr)
    {
        std::set<uint32> spells;
        GetSetOfSpellsInSpellGroup(SpellGroup(*groupItr), spells);

        for (std::set<uint32>::iterator spellItr = spells.begin(); spellItr != spells.end(); ++spellItr)
        {
            ++count;
            mSpellSpellGroup.insert(SpellSpellGroupMap::value_type(*spellItr, SpellGroup(*groupItr)));
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u spell group definitions in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellGroupStackRules()
{
    uint32 oldMSTime = getMSTime();

    mSpellGroupStack.clear();                                  // need for reload case

    //                                                       0         1
    QueryResult result = WorldDatabase.Query("SELECT group_id, stack_rule FROM spell_group_stack_rules");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell group stack rules. DB table `spell_group_stack_rules` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 group_id = fields[0].GetUInt32();
        uint8 stack_rule = fields[1].GetInt8();
        if (stack_rule >= SPELL_GROUP_STACK_RULE_MAX)
        {
            TC_LOG_ERROR("sql.sql", "SpellGroupStackRule %u listed in `spell_group_stack_rules` does not exist", stack_rule);
            continue;
        }

        SpellGroupSpellMapBounds spellGroup = GetSpellGroupSpellMapBounds((SpellGroup)group_id);

        if (spellGroup.first == spellGroup.second)
        {
            TC_LOG_ERROR("sql.sql", "SpellGroup id %u listed in `spell_group_stack_rules` does not exist", group_id);
            continue;
        }

        mSpellGroupStack[(SpellGroup)group_id] = (SpellGroupStackRule)stack_rule;

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u spell group stack rules in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellProcEvents()
{
    uint32 oldMSTime = getMSTime();

    mSpellProcEventMap.clear();                             // need for reload case

    //                                                0      1           2                3                 4                 5                 6          7       8        9             10
    QueryResult result = WorldDatabase.Query("SELECT entry, SchoolMask, SpellFamilyName, SpellFamilyMask0, SpellFamilyMask1, SpellFamilyMask2, procFlags, procEx, ppmRate, CustomChance, Cooldown FROM spell_proc_event");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell proc event conditions. DB table `spell_proc_event` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();

        int32 spellId = fields[0].GetInt32();

        bool allRanks = false;
        if (spellId < 0)
        {
            allRanks = true;
            spellId = -spellId;
        }

        SpellInfo const* spellInfo = GetSpellInfo(spellId);
        if (!spellInfo)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc_event` does not exist", spellId);
            continue;
        }

        if (allRanks)
        {
            if (!spellInfo->IsRanked())
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc_event` with all ranks, but spell has no ranks.", spellId);

            if (spellInfo->GetFirstRankSpell()->Id != uint32(spellId))
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc_event` is not first rank of spell.", spellId);
                continue;
            }
        }

        SpellProcEventEntry spellProcEvent;

        spellProcEvent.schoolMask         = fields[1].GetInt8();
        spellProcEvent.spellFamilyName    = fields[2].GetUInt16();
        spellProcEvent.spellFamilyMask[0] = fields[3].GetUInt32();
        spellProcEvent.spellFamilyMask[1] = fields[4].GetUInt32();
        spellProcEvent.spellFamilyMask[2] = fields[5].GetUInt32();
        spellProcEvent.procFlags          = fields[6].GetUInt32();
        spellProcEvent.procEx             = fields[7].GetUInt32();
        spellProcEvent.ppmRate            = fields[8].GetFloat();
        spellProcEvent.customChance       = fields[9].GetFloat();
        spellProcEvent.cooldown           = fields[10].GetUInt32();

        while (spellInfo)
        {
            if (mSpellProcEventMap.find(spellInfo->Id) != mSpellProcEventMap.end())
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc_event` already has its first rank in table.", spellInfo->Id);
                break;
            }

            if (!spellInfo->ProcFlags && !spellProcEvent.procFlags)
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc_event` probably not triggered spell", spellInfo->Id);

            mSpellProcEventMap[spellInfo->Id] = spellProcEvent;

            if (allRanks)
                spellInfo = spellInfo->GetNextRankSpell();
            else
                break;
        }

        ++count;
    }
    while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u extra spell proc event conditions in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellProcs()
{
    uint32 oldMSTime = getMSTime();

    mSpellProcMap.clear();                             // need for reload case

    //                                                 0        1           2                3                 4                 5                 6         7              8               9        10              11             12      13        14
    QueryResult result = WorldDatabase.Query("SELECT spellId, schoolMask, spellFamilyName, spellFamilyMask0, spellFamilyMask1, spellFamilyMask2, typeMask, spellTypeMask, spellPhaseMask, hitMask, attributesMask, ratePerMinute, chance, cooldown, charges FROM spell_proc");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell proc conditions and data. DB table `spell_proc` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        int32 spellId = fields[0].GetInt32();

        bool allRanks = false;
        if (spellId < 0)
        {
            allRanks = true;
            spellId = -spellId;
        }

        SpellInfo const* spellInfo = GetSpellInfo(spellId);
        if (!spellInfo)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc` does not exist", spellId);
            continue;
        }

        if (allRanks)
        {
            if (!spellInfo->IsRanked())
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc` with all ranks, but spell has no ranks.", spellId);

            if (spellInfo->GetFirstRankSpell()->Id != uint32(spellId))
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc` is not first rank of spell.", spellId);
                continue;
            }
        }

        SpellProcEntry baseProcEntry;

        baseProcEntry.schoolMask      = fields[1].GetInt8();
        baseProcEntry.spellFamilyName = fields[2].GetUInt16();
        baseProcEntry.spellFamilyMask[0] = fields[3].GetUInt32();
        baseProcEntry.spellFamilyMask[1] = fields[4].GetUInt32();
        baseProcEntry.spellFamilyMask[2] = fields[5].GetUInt32();
        baseProcEntry.typeMask        = fields[6].GetUInt32();
        baseProcEntry.spellTypeMask   = fields[7].GetUInt32();
        baseProcEntry.spellPhaseMask  = fields[8].GetUInt32();
        baseProcEntry.hitMask         = fields[9].GetUInt32();
        baseProcEntry.attributesMask  = fields[10].GetUInt32();
        baseProcEntry.ratePerMinute   = fields[11].GetFloat();
        baseProcEntry.chance          = fields[12].GetFloat();
        float cooldown                = fields[13].GetFloat();
        baseProcEntry.cooldown        = uint32(cooldown);
        baseProcEntry.charges         = fields[14].GetUInt32();

        while (spellInfo)
        {
            if (mSpellProcMap.find(spellInfo->Id) != mSpellProcMap.end())
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_proc` already has its first rank in table.", spellInfo->Id);
                break;
            }

            SpellProcEntry procEntry = SpellProcEntry(baseProcEntry);

            // take defaults from dbcs
            if (!procEntry.typeMask)
                procEntry.typeMask = spellInfo->ProcFlags;
            if (!procEntry.charges)
                procEntry.charges = spellInfo->ProcCharges;
            if (!procEntry.chance && !procEntry.ratePerMinute)
                procEntry.chance = float(spellInfo->ProcChance);

            // validate data
            if (procEntry.schoolMask & ~SPELL_SCHOOL_MASK_ALL)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has wrong `schoolMask` set: %u", spellInfo->Id, procEntry.schoolMask);
            if (procEntry.spellFamilyName && (procEntry.spellFamilyName < 3 || procEntry.spellFamilyName > 17 || procEntry.spellFamilyName == 14 || procEntry.spellFamilyName == 16))
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has wrong `spellFamilyName` set: %u", spellInfo->Id, procEntry.spellFamilyName);
            if (procEntry.chance < 0)
            {
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has negative value in `chance` field", spellInfo->Id);
                procEntry.chance = 0;
            }
            if (procEntry.ratePerMinute < 0)
            {
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has negative value in `ratePerMinute` field", spellInfo->Id);
                procEntry.ratePerMinute = 0;
            }
            if (cooldown < 0)
            {
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has negative value in `cooldown` field", spellInfo->Id);
                procEntry.cooldown = 0;
            }
            if (procEntry.chance == 0 && procEntry.ratePerMinute == 0)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u doesn't have `chance` and `ratePerMinute` values defined, proc will not be triggered", spellInfo->Id);
            if (procEntry.charges > 99)
            {
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has too big value in `charges` field", spellInfo->Id);
                procEntry.charges = 99;
            }
            if (!procEntry.typeMask)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u doesn't have `typeMask` value defined, proc will not be triggered", spellInfo->Id);
            if (procEntry.spellTypeMask & ~PROC_SPELL_TYPE_MASK_ALL)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has wrong `spellTypeMask` set: %u", spellInfo->Id, procEntry.spellTypeMask);
            if (procEntry.spellTypeMask && !(procEntry.typeMask & (SPELL_PROC_FLAG_MASK | PERIODIC_PROC_FLAG_MASK)))
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has `spellTypeMask` value defined, but it won't be used for defined `typeMask` value", spellInfo->Id);
            if (!procEntry.spellPhaseMask && procEntry.typeMask & REQ_SPELL_PHASE_PROC_FLAG_MASK)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u doesn't have `spellPhaseMask` value defined, but it's required for defined `typeMask` value, proc will not be triggered", spellInfo->Id);
            if (procEntry.spellPhaseMask & ~PROC_SPELL_PHASE_MASK_ALL)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has wrong `spellPhaseMask` set: %u", spellInfo->Id, procEntry.spellPhaseMask);
            if (procEntry.spellPhaseMask && !(procEntry.typeMask & REQ_SPELL_PHASE_PROC_FLAG_MASK))
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has `spellPhaseMask` value defined, but it won't be used for defined `typeMask` value", spellInfo->Id);
            if (procEntry.hitMask & ~PROC_HIT_MASK_ALL)
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has wrong `hitMask` set: %u", spellInfo->Id, procEntry.hitMask);
            if (procEntry.hitMask && !(procEntry.typeMask & TAKEN_HIT_PROC_FLAG_MASK || (procEntry.typeMask & DONE_HIT_PROC_FLAG_MASK && (!procEntry.spellPhaseMask || procEntry.spellPhaseMask & (PROC_SPELL_PHASE_HIT | PROC_SPELL_PHASE_FINISH)))))
                TC_LOG_ERROR("sql.sql", "`spell_proc` table entry for spellId %u has `hitMask` value defined, but it won't be used for defined `typeMask` and `spellPhaseMask` values", spellInfo->Id);

            mSpellProcMap[spellInfo->Id] = procEntry;

            if (allRanks)
                spellInfo = spellInfo->GetNextRankSpell();
            else
                break;
        }
        ++count;
    }
    while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u spell proc conditions and data in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellBonusess()
{
    uint32 oldMSTime = getMSTime();

    mSpellBonusMap.clear();                             // need for reload case

    //                                                0      1             2          3         4
    QueryResult result = WorldDatabase.Query("SELECT entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus FROM spell_bonus_data");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell bonus data. DB table `spell_bonus_data` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        uint32 entry = fields[0].GetUInt32();

        SpellInfo const* spell = GetSpellInfo(entry);
        if (!spell)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_bonus_data` does not exist", entry);
            continue;
        }

        SpellBonusEntry& sbe = mSpellBonusMap[entry];
        sbe.direct_damage = fields[1].GetFloat();
        sbe.dot_damage    = fields[2].GetFloat();
        sbe.ap_bonus      = fields[3].GetFloat();
        sbe.ap_dot_bonus   = fields[4].GetFloat();

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u extra spell bonus data in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellThreats()
{
    uint32 oldMSTime = getMSTime();

    mSpellThreatMap.clear();                                // need for reload case

    //                                                0      1        2       3
    QueryResult result = WorldDatabase.Query("SELECT entry, flatMod, pctMod, apPctMod FROM spell_threat");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 aggro generating spells. DB table `spell_threat` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 entry = fields[0].GetUInt32();

        if (!GetSpellInfo(entry))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_threat` does not exist", entry);
            continue;
        }

        SpellThreatEntry ste;
        ste.flatMod  = fields[1].GetInt32();
        ste.pctMod   = fields[2].GetFloat();
        ste.apPctMod = fields[3].GetFloat();

        mSpellThreatMap[entry] = ste;
        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u SpellThreatEntries in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSkillLineAbilityMap()
{
    uint32 oldMSTime = getMSTime();

    mSkillLineAbilityMap.clear();

    uint32 count = 0;

    for (uint32 i = 0; i < sSkillLineAbilityStore.GetNumRows(); ++i)
    {
        SkillLineAbilityEntry const* SkillInfo = sSkillLineAbilityStore.LookupEntry(i);
        if (!SkillInfo)
            continue;

        mSkillLineAbilityMap.insert(SkillLineAbilityMap::value_type(SkillInfo->spellId, SkillInfo));
        ++count;
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u SkillLineAbility MultiMap Data in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellPetAuras()
{
    uint32 oldMSTime = getMSTime();

    mSpellPetAuraMap.clear();                                  // need for reload case

    //                                                  0       1       2    3
    QueryResult result = WorldDatabase.Query("SELECT spell, effectId, pet, aura FROM spell_pet_auras");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell pet auras. DB table `spell_pet_auras` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 spell = fields[0].GetUInt32();
        uint8 eff = fields[1].GetUInt8();
        uint32 pet = fields[2].GetUInt32();
        uint32 aura = fields[3].GetUInt32();

        SpellPetAuraMap::iterator itr = mSpellPetAuraMap.find((spell<<8) + eff);
        if (itr != mSpellPetAuraMap.end())
            itr->second.AddAura(pet, aura);
        else
        {
            SpellInfo const* spellInfo = GetSpellInfo(spell);
            if (!spellInfo)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_pet_auras` does not exist", spell);
                continue;
            }
            if (spellInfo->Effects[eff].Effect != SPELL_EFFECT_DUMMY &&
               (spellInfo->Effects[eff].Effect != SPELL_EFFECT_APPLY_AURA ||
                spellInfo->Effects[eff].ApplyAuraName != SPELL_AURA_DUMMY))
            {
                TC_LOG_ERROR("spells", "Spell %u listed in `spell_pet_auras` does not have dummy aura or dummy effect", spell);
                continue;
            }

            SpellInfo const* spellInfo2 = GetSpellInfo(aura);
            if (!spellInfo2)
            {
                TC_LOG_ERROR("sql.sql", "Aura %u listed in `spell_pet_auras` does not exist", aura);
                continue;
            }

            PetAura pa(pet, aura, spellInfo->Effects[eff].TargetA.GetTarget() == TARGET_UNIT_PET, spellInfo->Effects[eff].CalcValue());
            mSpellPetAuraMap[(spell<<8) + eff] = pa;
        }

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u spell pet auras in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

// Fill custom data about enchancments
void SpellMgr::LoadEnchantCustomAttr()
{
    uint32 oldMSTime = getMSTime();

    uint32 size = sSpellItemEnchantmentStore.GetNumRows();
    mEnchantCustomAttr.resize(size);

    for (uint32 i = 0; i < size; ++i)
       mEnchantCustomAttr[i] = 0;

    uint32 count = 0;
    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
    {
        SpellInfo const* spellInfo = GetSpellInfo(i);
        if (!spellInfo)
            continue;

        /// @todo find a better check
        if (!spellInfo->HasAttribute(SPELL_ATTR2_PRESERVE_ENCHANT_IN_ARENA) || !spellInfo->HasAttribute(SPELL_ATTR0_NOT_SHAPESHIFT))
            continue;

        for (uint32 j = 0; j < MAX_SPELL_EFFECTS; ++j)
        {
            if (spellInfo->Effects[j].Effect == SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY)
            {
                uint32 enchId = spellInfo->Effects[j].MiscValue;
                SpellItemEnchantmentEntry const* ench = sSpellItemEnchantmentStore.LookupEntry(enchId);
                if (!ench)
                    continue;
                mEnchantCustomAttr[enchId] = true;
                ++count;
                break;
            }
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u custom enchant attributes in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellEnchantProcData()
{
    uint32 oldMSTime = getMSTime();

    mSpellEnchantProcEventMap.clear();                             // need for reload case

    //                                                  0         1           2         3
    QueryResult result = WorldDatabase.Query("SELECT entry, customChance, PPMChance, procEx FROM spell_enchant_proc_data");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell enchant proc event conditions. DB table `spell_enchant_proc_data` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 enchantId = fields[0].GetUInt32();

        SpellItemEnchantmentEntry const* ench = sSpellItemEnchantmentStore.LookupEntry(enchantId);
        if (!ench)
        {
            TC_LOG_ERROR("sql.sql", "Enchancment %u listed in `spell_enchant_proc_data` does not exist", enchantId);
            continue;
        }

        SpellEnchantProcEntry spe;

        spe.customChance = fields[1].GetUInt32();
        spe.PPMChance = fields[2].GetFloat();
        spe.procEx = fields[3].GetUInt32();

        mSpellEnchantProcEventMap[enchantId] = spe;

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u enchant proc data definitions in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellLinked()
{
    uint32 oldMSTime = getMSTime();

    mSpellLinkedMap.clear();    // need for reload case

    //                                                0              1             2
    QueryResult result = WorldDatabase.Query("SELECT spell_trigger, spell_effect, type FROM spell_linked_spell");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 linked spells. DB table `spell_linked_spell` is empty.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        int32 trigger = fields[0].GetInt32();
        int32 effect = fields[1].GetInt32();
        int32 type = fields[2].GetUInt8();

        SpellInfo const* spellInfo = GetSpellInfo(abs(trigger));
        if (!spellInfo)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_linked_spell` does not exist", abs(trigger));
            continue;
        }

        if (effect >= 0)
            for (uint8 j = 0; j < MAX_SPELL_EFFECTS; ++j)
            {
                if (spellInfo->Effects[j].CalcValue() == abs(effect))
                    TC_LOG_ERROR("sql.sql", "Spell %u Effect: %u listed in `spell_linked_spell` has same bp%u like effect (possible hack)", abs(trigger), abs(effect), j);
            }

        spellInfo = GetSpellInfo(abs(effect));
        if (!spellInfo)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_linked_spell` does not exist", abs(effect));
            continue;
        }

        if (type) //we will find a better way when more types are needed
        {
            if (trigger > 0)
                trigger += SPELL_LINKED_MAX_SPELLS * type;
            else
                trigger -= SPELL_LINKED_MAX_SPELLS * type;
        }
        mSpellLinkedMap[trigger].push_back(effect);

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u linked spells in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadPetLevelupSpellMap()
{
    uint32 oldMSTime = getMSTime();

    mPetLevelupSpellMap.clear();                                   // need for reload case

    uint32 count = 0;
    uint32 family_count = 0;

    for (uint32 i = 0; i < sCreatureFamilyStore.GetNumRows(); ++i)
    {
        CreatureFamilyEntry const* creatureFamily = sCreatureFamilyStore.LookupEntry(i);
        if (!creatureFamily)                                     // not exist
            continue;

        for (uint8 j = 0; j < 2; ++j)
        {
            if (!creatureFamily->skillLine[j])
                continue;

            for (uint32 k = 0; k < sSkillLineAbilityStore.GetNumRows(); ++k)
            {
                SkillLineAbilityEntry const* skillLine = sSkillLineAbilityStore.LookupEntry(k);
                if (!skillLine)
                    continue;

                //if (skillLine->skillId != creatureFamily->skillLine[0] &&
                //    (!creatureFamily->skillLine[1] || skillLine->skillId != creatureFamily->skillLine[1]))
                //    continue;

                if (skillLine->skillId != creatureFamily->skillLine[j])
                    continue;

                if (skillLine->AutolearnType != SKILL_LINE_ABILITY_LEARNED_ON_SKILL_LEARN)
                    continue;

                SpellInfo const* spell = GetSpellInfo(skillLine->spellId);
                if (!spell) // not exist or triggered or talent
                    continue;

                if (!spell->SpellLevel)
                    continue;

                PetLevelupSpellSet& spellSet = mPetLevelupSpellMap[creatureFamily->ID];
                if (spellSet.empty())
                    ++family_count;

                spellSet.insert(PetLevelupSpellSet::value_type(spell->SpellLevel, spell->Id));
                ++count;
            }
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u pet levelup and default spells for %u families in %u ms", count, family_count, GetMSTimeDiffToNow(oldMSTime));
}

bool LoadPetDefaultSpells_helper(CreatureTemplate const* cInfo, PetDefaultSpellsEntry& petDefSpells)
{
    // skip empty list;
    bool have_spell = false;
    for (uint8 j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
    {
        if (petDefSpells.spellid[j])
        {
            have_spell = true;
            break;
        }
    }
    if (!have_spell)
        return false;

    // remove duplicates with levelupSpells if any
    if (PetLevelupSpellSet const* levelupSpells = cInfo->family ? sSpellMgr->GetPetLevelupSpellList(cInfo->family) : NULL)
    {
        for (uint8 j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
        {
            if (!petDefSpells.spellid[j])
                continue;

            for (PetLevelupSpellSet::const_iterator itr = levelupSpells->begin(); itr != levelupSpells->end(); ++itr)
            {
                if (itr->second == petDefSpells.spellid[j])
                {
                    petDefSpells.spellid[j] = 0;
                    break;
                }
            }
        }
    }

    // skip empty list;
    have_spell = false;
    for (uint8 j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
    {
        if (petDefSpells.spellid[j])
        {
            have_spell = true;
            break;
        }
    }

    return have_spell;
}

void SpellMgr::LoadPetDefaultSpells()
{
    uint32 oldMSTime = getMSTime();

    mPetDefaultSpellsMap.clear();

    uint32 countCreature = 0;
    uint32 countData = 0;

    CreatureTemplateContainer const* ctc = sObjectMgr->GetCreatureTemplates();
    for (CreatureTemplateContainer::const_iterator itr = ctc->begin(); itr != ctc->end(); ++itr)
    {

        if (!itr->second.PetSpellDataId)
            continue;

        // for creature with PetSpellDataId get default pet spells from dbc
        CreatureSpellDataEntry const* spellDataEntry = sCreatureSpellDataStore.LookupEntry(itr->second.PetSpellDataId);
        if (!spellDataEntry)
            continue;

        int32 petSpellsId = -int32(itr->second.PetSpellDataId);
        PetDefaultSpellsEntry petDefSpells;
        for (uint8 j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
            petDefSpells.spellid[j] = spellDataEntry->spellId[j];

        if (LoadPetDefaultSpells_helper(&itr->second, petDefSpells))
        {
            mPetDefaultSpellsMap[petSpellsId] = petDefSpells;
            ++countData;
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded addition spells for %u pet spell data entries in %u ms", countData, GetMSTimeDiffToNow(oldMSTime));

    TC_LOG_INFO("server.loading", "Loading summonable creature templates...");
    oldMSTime = getMSTime();

    // different summon spells
    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
    {
        SpellInfo const* spellEntry = GetSpellInfo(i);
        if (!spellEntry)
            continue;

        for (uint8 k = 0; k < MAX_SPELL_EFFECTS; ++k)
        {
            if (spellEntry->Effects[k].Effect == SPELL_EFFECT_SUMMON || spellEntry->Effects[k].Effect == SPELL_EFFECT_SUMMON_PET)
            {
                uint32 creature_id = spellEntry->Effects[k].MiscValue;
                CreatureTemplate const* cInfo = sObjectMgr->GetCreatureTemplate(creature_id);
                if (!cInfo)
                    continue;

                // already loaded
                if (cInfo->PetSpellDataId)
                    continue;

                // for creature without PetSpellDataId get default pet spells from creature_template
                int32 petSpellsId = cInfo->Entry;
                if (mPetDefaultSpellsMap.find(cInfo->Entry) != mPetDefaultSpellsMap.end())
                    continue;

                PetDefaultSpellsEntry petDefSpells;
                for (uint8 j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
                    petDefSpells.spellid[j] = cInfo->spells[j];

                if (LoadPetDefaultSpells_helper(cInfo, petDefSpells))
                {
                    mPetDefaultSpellsMap[petSpellsId] = petDefSpells;
                    ++countCreature;
                }
            }
        }
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u summonable creature templates in %u ms", countCreature, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellAreas()
{
    uint32 oldMSTime = getMSTime();

    mSpellAreaMap.clear();                                  // need for reload case
    mSpellAreaForQuestMap.clear();
    mSpellAreaForQuestEndMap.clear();
    mSpellAreaForAuraMap.clear();

    //                                                  0     1         2              3               4                 5          6          7       8         9
    QueryResult result = WorldDatabase.Query("SELECT spell, area, quest_start, quest_start_status, quest_end_status, quest_end, aura_spell, racemask, gender, autocast FROM spell_area");
    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell area requirements. DB table `spell_area` is empty.");

        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();

        uint32 spell = fields[0].GetUInt32();
        SpellArea spellArea;
        spellArea.spellId             = spell;
        spellArea.areaId              = fields[1].GetUInt32();
        spellArea.questStart          = fields[2].GetUInt32();
        spellArea.questStartStatus    = fields[3].GetUInt32();
        spellArea.questEndStatus      = fields[4].GetUInt32();
        spellArea.questEnd            = fields[5].GetUInt32();
        spellArea.auraSpell           = fields[6].GetInt32();
        spellArea.raceMask            = fields[7].GetUInt32();
        spellArea.gender              = Gender(fields[8].GetUInt8());
        spellArea.autocast            = fields[9].GetBool();

        if (SpellInfo const* spellInfo = GetSpellInfo(spell))
        {
            if (spellArea.autocast)
                const_cast<SpellInfo*>(spellInfo)->Attributes |= SPELL_ATTR0_CANT_CANCEL;
        }
        else
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` does not exist", spell);
            continue;
        }

        {
            bool ok = true;
            SpellAreaMapBounds sa_bounds = GetSpellAreaMapBounds(spellArea.spellId);
            for (SpellAreaMap::const_iterator itr = sa_bounds.first; itr != sa_bounds.second; ++itr)
            {
                if (spellArea.spellId != itr->second.spellId)
                    continue;
                if (spellArea.areaId != itr->second.areaId)
                    continue;
                if (spellArea.questStart != itr->second.questStart)
                    continue;
                if (spellArea.auraSpell != itr->second.auraSpell)
                    continue;
                if ((spellArea.raceMask & itr->second.raceMask) == 0)
                    continue;
                if (spellArea.gender != itr->second.gender)
                    continue;

                // duplicate by requirements
                ok = false;
                break;
            }

            if (!ok)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` already listed with similar requirements.", spell);
                continue;
            }
        }

        if (spellArea.areaId && !GetAreaEntryByAreaID(spellArea.areaId))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong area (%u) requirement", spell, spellArea.areaId);
            continue;
        }

        if (spellArea.questStart && !sObjectMgr->GetQuestTemplate(spellArea.questStart))
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong start quest (%u) requirement", spell, spellArea.questStart);
            continue;
        }

        if (spellArea.questEnd)
        {
            if (!sObjectMgr->GetQuestTemplate(spellArea.questEnd))
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong end quest (%u) requirement", spell, spellArea.questEnd);
                continue;
            }
        }

        if (spellArea.auraSpell)
        {
            SpellInfo const* spellInfo = GetSpellInfo(abs(spellArea.auraSpell));
            if (!spellInfo)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong aura spell (%u) requirement", spell, abs(spellArea.auraSpell));
                continue;
            }

            if (uint32(abs(spellArea.auraSpell)) == spellArea.spellId)
            {
                TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have aura spell (%u) requirement for itself", spell, abs(spellArea.auraSpell));
                continue;
            }

            // not allow autocast chains by auraSpell field (but allow use as alternative if not present)
            if (spellArea.autocast && spellArea.auraSpell > 0)
            {
                bool chain = false;
                SpellAreaForAuraMapBounds saBound = GetSpellAreaForAuraMapBounds(spellArea.spellId);
                for (SpellAreaForAuraMap::const_iterator itr = saBound.first; itr != saBound.second; ++itr)
                {
                    if (itr->second->autocast && itr->second->auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell, spellArea.auraSpell);
                    continue;
                }

                SpellAreaMapBounds saBound2 = GetSpellAreaMapBounds(spellArea.auraSpell);
                for (SpellAreaMap::const_iterator itr2 = saBound2.first; itr2 != saBound2.second; ++itr2)
                {
                    if (itr2->second.autocast && itr2->second.auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell, spellArea.auraSpell);
                    continue;
                }
            }
        }

        if (spellArea.raceMask && (spellArea.raceMask & RACEMASK_ALL_PLAYABLE) == 0)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong race mask (%u) requirement", spell, spellArea.raceMask);
            continue;
        }

        if (spellArea.gender != GENDER_NONE && spellArea.gender != GENDER_FEMALE && spellArea.gender != GENDER_MALE)
        {
            TC_LOG_ERROR("sql.sql", "Spell %u listed in `spell_area` have wrong gender (%u) requirement", spell, spellArea.gender);
            continue;
        }

        SpellArea const* sa = &mSpellAreaMap.insert(SpellAreaMap::value_type(spell, spellArea))->second;

        // for search by current zone/subzone at zone/subzone change
        if (spellArea.areaId)
            mSpellAreaForAreaMap.insert(SpellAreaForAreaMap::value_type(spellArea.areaId, sa));

        // for search at quest start/reward
        if (spellArea.questStart)
            mSpellAreaForQuestMap.insert(SpellAreaForQuestMap::value_type(spellArea.questStart, sa));

        // for search at quest start/reward
        if (spellArea.questEnd)
            mSpellAreaForQuestEndMap.insert(SpellAreaForQuestMap::value_type(spellArea.questEnd, sa));

        // for search at aura apply
        if (spellArea.auraSpell)
            mSpellAreaForAuraMap.insert(SpellAreaForAuraMap::value_type(abs(spellArea.auraSpell), sa));

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u spell area requirements in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellInfoStore()
{
    uint32 oldMSTime = getMSTime();

    UnloadSpellInfoStore();
    mSpellInfoMap.resize(sSpellStore.GetNumRows(), NULL);

    for (uint32 i = 0; i < sSpellStore.GetNumRows(); ++i)
        if (SpellEntry const* spellEntry = sSpellStore.LookupEntry(i))
            mSpellInfoMap[i] = new SpellInfo(spellEntry);

    TC_LOG_INFO("server.loading", ">> Loaded SpellInfo store in %u ms", GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::UnloadSpellInfoStore()
{
    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
        delete mSpellInfoMap[i];

    mSpellInfoMap.clear();
}

void SpellMgr::UnloadSpellInfoImplicitTargetConditionLists()
{
    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
        if (mSpellInfoMap[i])
            mSpellInfoMap[i]->_UnloadImplicitTargetConditionLists();
}

void SpellMgr::LoadSpellInfoCustomAttributes()
{
    uint32 oldMSTime = getMSTime();
    uint32 oldMSTime2 = oldMSTime;
    SpellInfo* spellInfo = NULL;

    QueryResult result = WorldDatabase.Query("SELECT entry, attributes FROM spell_custom_attr");

    if (!result)
        TC_LOG_INFO("server.loading", ">> Loaded 0 spell custom attributes from DB. DB table `spell_custom_attr` is empty.");
    else
    {
        uint32 count = 0;
        do
        {
            Field* fields = result->Fetch();

            uint32 spellId = fields[0].GetUInt32();
            uint32 attributes = fields[1].GetUInt32();

            spellInfo = _GetSpellInfo(spellId);
            if (!spellInfo)
            {
                TC_LOG_ERROR("sql.sql", "Table `spell_custom_attr` has wrong spell (entry: %u), ignored.", spellId);
                continue;
            }

            // TODO: validate attributes

            spellInfo->AttributesCu |= attributes;
            ++count;
        } while (result->NextRow());

        TC_LOG_INFO("server.loading", ">> Loaded %u spell custom attributes from DB in %u ms", count, GetMSTimeDiffToNow(oldMSTime2));
    }

    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
    {
        spellInfo = mSpellInfoMap[i];
        if (!spellInfo)
            continue;

        for (uint8 j = 0; j < MAX_SPELL_EFFECTS; ++j)
        {
            switch (spellInfo->Effects[j].ApplyAuraName)
            {
                case SPELL_AURA_PERIODIC_HEAL:
                case SPELL_AURA_PERIODIC_DAMAGE:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                case SPELL_AURA_PERIODIC_LEECH:
                case SPELL_AURA_PERIODIC_MANA_LEECH:
                case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
                case SPELL_AURA_PERIODIC_ENERGIZE:
                case SPELL_AURA_OBS_MOD_HEALTH:
                case SPELL_AURA_OBS_MOD_POWER:
                case SPELL_AURA_POWER_BURN:
                    spellInfo->AttributesCu |= SPELL_ATTR0_CU_NO_INITIAL_THREAT;
                    break;
            }

            switch (spellInfo->Effects[j].Effect)
            {
                case SPELL_EFFECT_SCHOOL_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
                case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                case SPELL_EFFECT_HEAL:
                    spellInfo->AttributesCu |= SPELL_ATTR0_CU_DIRECT_DAMAGE;
                    break;
                case SPELL_EFFECT_POWER_DRAIN:
                case SPELL_EFFECT_POWER_BURN:
                case SPELL_EFFECT_HEAL_MAX_HEALTH:
                case SPELL_EFFECT_HEALTH_LEECH:
                case SPELL_EFFECT_HEAL_PCT:
                case SPELL_EFFECT_ENERGIZE_PCT:
                case SPELL_EFFECT_ENERGIZE:
                case SPELL_EFFECT_HEAL_MECHANICAL:
                    spellInfo->AttributesCu |= SPELL_ATTR0_CU_NO_INITIAL_THREAT;
                    break;
                case SPELL_EFFECT_CHARGE:
                case SPELL_EFFECT_CHARGE_DEST:
                case SPELL_EFFECT_JUMP:
                case SPELL_EFFECT_JUMP_DEST:
                case SPELL_EFFECT_LEAP_BACK:
                    spellInfo->AttributesCu |= SPELL_ATTR0_CU_CHARGE;
                    break;
                case SPELL_EFFECT_PICKPOCKET:
                    spellInfo->AttributesCu |= SPELL_ATTR0_CU_PICKPOCKET;
                    break;
                case SPELL_EFFECT_ENCHANT_ITEM:
                case SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY:
                case SPELL_EFFECT_ENCHANT_ITEM_PRISMATIC:
                case SPELL_EFFECT_ENCHANT_HELD_ITEM:
                {
                    // only enchanting profession enchantments procs can stack
                    if (IsPartOfSkillLine(SKILL_ENCHANTING, i))
                    {
                        uint32 enchantId = spellInfo->Effects[j].MiscValue;
                        SpellItemEnchantmentEntry const* enchant = sSpellItemEnchantmentStore.LookupEntry(enchantId);
                        if (!enchant)
                            break;

                        for (uint8 s = 0; s < MAX_ITEM_ENCHANTMENT_EFFECTS; ++s)
                        {
                            if (enchant->type[s] != ITEM_ENCHANTMENT_TYPE_COMBAT_SPELL)
                                continue;

                            SpellInfo* procInfo = _GetSpellInfo(enchant->spellid[s]);
                            if (!procInfo)
                                continue;

                            // if proced directly from enchantment, not via proc aura
                            // NOTE: Enchant Weapon - Blade Ward also has proc aura spell and is proced directly
                            // however its not expected to stack so this check is good
                            if (procInfo->HasAura(SPELL_AURA_PROC_TRIGGER_SPELL))
                                continue;

                            procInfo->AttributesCu |= SPELL_ATTR0_CU_ENCHANT_PROC;
                        }
                    }
                    break;
                }
            }
        }

        if (!spellInfo->_IsPositiveEffect(EFFECT_0, false))
            spellInfo->AttributesCu |= SPELL_ATTR0_CU_NEGATIVE_EFF0;

        if (!spellInfo->_IsPositiveEffect(EFFECT_1, false))
            spellInfo->AttributesCu |= SPELL_ATTR0_CU_NEGATIVE_EFF1;

        if (!spellInfo->_IsPositiveEffect(EFFECT_2, false))
            spellInfo->AttributesCu |= SPELL_ATTR0_CU_NEGATIVE_EFF2;

        if (spellInfo->SpellVisual[0] == 3879)
            spellInfo->AttributesCu |= SPELL_ATTR0_CU_CONE_BACK;


        spellInfo->_InitializeExplicitTargetMask();
    }

    TC_LOG_INFO("server.loading", ">> Loaded SpellInfo custom attributes in %u ms", GetMSTimeDiffToNow(oldMSTime));
}

void SpellMgr::LoadSpellInfoCorrections()
{
    uint32 oldMSTime = getMSTime();

    SpellInfo* spellInfo = NULL;
    for (uint32 i = 0; i < GetSpellInfoStoreSize(); ++i)
    {
        spellInfo = mSpellInfoMap[i];
        if (!spellInfo)
            continue;

        for (uint8 j = 0; j < MAX_SPELL_EFFECTS; ++j)
        {
            switch (spellInfo->Effects[j].Effect)
            {
                case SPELL_EFFECT_CHARGE:
                case SPELL_EFFECT_CHARGE_DEST:
                case SPELL_EFFECT_JUMP:
                case SPELL_EFFECT_JUMP_DEST:
                case SPELL_EFFECT_LEAP_BACK:
                    if (!spellInfo->Speed && !spellInfo->SpellFamilyName)
                        spellInfo->Speed = SPEED_CHARGE;
                    break;
            }

            // Passive talent auras cannot target pets
            if (spellInfo->IsPassive() && GetTalentSpellCost(i))
                if (spellInfo->Effects[j].TargetA.GetTarget() == TARGET_UNIT_PET)
                    spellInfo->Effects[j].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
        }

        if (spellInfo->ActiveIconID == 2158)  // flight
            spellInfo->Attributes |= SPELL_ATTR0_PASSIVE;

        switch (spellInfo->Id)
        {
			/////////////////////////////////
			///// ROGUE
			/////////////////////////////////
			// Master of Subtlety
		case 31221:
		case 31222:
		case 31223:
			spellInfo->SpellFamilyName = SPELLFAMILY_ROGUE;
			break;
			// Master of Subtlety triggers
		case 31666:
			// Overkill
		case 58428:
			spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_SCRIPT_EFFECT;
			break;
			// Kaelthas Mind control
		case 36797:
			spellInfo->MaxAffectedTargets = 1;
			break;
			/* Class related corrections */
		case 24259: // Spell Lock silence
			spellInfo->Speed = 80;
			break;
		case 1543: // Flare Hunter.
			spellInfo->Speed = 200;
			break;
		case 53257: // Cobra Strikes
			spellInfo->ProcCharges = 2;
			spellInfo->StackAmount = 0;
			break;
		case 48657: // Backstab
		case 48572: // Shred
			spellInfo->Attributes |= SPELL_ATTR0_IMPOSSIBLE_DODGE_PARRY_BLOCK;
			break;
		case 48785: // Flash of light
		case 48801: // The art of war - Exorcism do not reset swing timer.
			spellInfo->AttributesEx2 |= SPELL_ATTR2_NOT_RESET_AUTO_ACTIONS;
			//0x00020000
			break;
            case 63026: // Force Cast (HACK: Target shouldn't be changed)
            case 63137: // Force Cast (HACK: Target shouldn't be changed; summon position should be untied from spell destination)
                spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DB);
                break;
			case 16989: // Planting Banner
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_CASTER_FRONT_RIGHT);
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_4_YARDS);
			break;
			case 42490: // Energized! - Quest: Corrosion Prevention.
				spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;
				break;
            case 53096: // Quetz'lun's Judgment
            case 70743: // AoD Special
            case 70614: // AoD Special - Vegard
                spellInfo->MaxAffectedTargets = 1;
                break;
            case 42436: // Drink! (Brewfest)
            case 33388: // Apprentice Riding
            case 38202: // Heat Mold
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
                break;
            case 52611: // Summon Skeletons
            case 52612: // Summon Skeletons
                spellInfo->Effects[EFFECT_0].MiscValueB = 64;
                break;
            case 39793: // Call Cenarion Sparrowhawk
                spellInfo->Effects[EFFECT_0].MiscValueB = 61;
                break;
            case 40244: // Simon Game Visual
            case 40245: // Simon Game Visual
            case 40246: // Simon Game Visual
            case 40247: // Simon Game Visual
            case 42835: // Spout, remove damage effect, only anim is needed
                spellInfo->Effects[EFFECT_0].Effect = 0;
                break;
            case 64056: // Eating
                spellInfo->Effects[EFFECT_1].TriggerSpell = 1137;
                break;
            case 30657: // Quake
                spellInfo->Effects[EFFECT_0].TriggerSpell = 30571;
                break;
            case 30541: // Blaze (needs conditions entry)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo();
                break;
            case 63665: // Charge (Argent Tournament emote on riders)
            case 31298: // Sleep (needs target selection script)
            case 51904: // Summon Ghouls On Scarlet Crusade (this should use conditions table, script for this spell needs to be fixed)
            case 2895:  // Wrath of Air Totem rank 1 (Aura)
            case 68933: // Wrath of Air Totem rank 2 (Aura)
            case 29200: // Purify Helboar Meat
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo();
                break;
            case 31344: // Howl of Azgalor
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yards instead of 50000?!
                break;
            case 56746: // Punsh - nergeld
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(13);
                break;
            case 42818: // Headless Horseman - Wisp Flight Port
            case 42821: // Headless Horseman - Wisp Flight Missile
                spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6); // 100 yards
                break;
            case 38055: // Destroy Deathforged Infernal
                spellInfo->RecoveryTime = 0;
                spellInfo->CategoryRecoveryTime = 8 * IN_MILLISECONDS;
                spellInfo->StartRecoveryCategory = 133;
                spellInfo->StartRecoveryTime = 1.5 * IN_MILLISECONDS;
                break;
            case 38488: // Sonic - Boom
                spellInfo->RecoveryTime = 0;
                spellInfo->CategoryRecoveryTime = 15 * IN_MILLISECONDS;
                spellInfo->StartRecoveryCategory = 133;
                spellInfo->StartRecoveryTime = 1.5 * IN_MILLISECONDS;
                break;
            case 38006: // Worldbreaker
                spellInfo->RecoveryTime = 0;
                spellInfo->CategoryRecoveryTime = 10 * IN_MILLISECONDS;
                spellInfo->StartRecoveryCategory = 133;
                spellInfo->StartRecoveryTime = 1.5 * IN_MILLISECONDS;
                break;
            case 38054: // Random Rocket Missile
                spellInfo->Effects[0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_20_YARDS);
                break;
            case 37920: // Turbo Boost
                spellInfo->RecoveryTime = 0;
                spellInfo->CategoryRecoveryTime = 30 * IN_MILLISECONDS;
                spellInfo->StartRecoveryCategory = 133;
                spellInfo->StartRecoveryTime = 30 * IN_MILLISECONDS;
                break;
            case 36350: // They Must Burn Bomb Aura (self)
                spellInfo->Effects[EFFECT_0].TriggerSpell = 36325; // They Must Burn Bomb Drop (DND)
                break;
            case 49838: // Stop Time
            case 69438: // Sample Satisfaction
            case 69445: // Perfume Spritz
            case 69489: // Chocolate Sample
            case 69563: // Cologne Spritz
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
                break;
            case 61407: // Energize Cores
            case 62136: // Energize Cores
            case 54069: // Energize Cores
            case 56251: // Energize Cores
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENTRY);
                break;
            case 50785: // Energize Cores
            case 59372: // Energize Cores
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENEMY);
                break;
            case 8494: // Mana Shield (rank 2)
                // because of bug in dbc
                spellInfo->ProcChance = 0;
                break;
            case 20335: // Heart of the Crusader
            case 20336:
            case 20337:
            case 53228: // Rapid Killing (Rank 1)
            case 53232: // Rapid Killing (Rank 2)
            case 63320: // Glyph of Life Tap
                // Entries were not updated after spell effect change, we have to do that manually :/
                spellInfo->AttributesEx3 |= SPELL_ATTR3_CAN_PROC_WITH_TRIGGERED;
                break;
            case 5308:  // Execute (Rank 1)
            case 20658: // Execute (Rank 2)
            case 20660: // Execute (Rank 3)
            case 20661: // Execute (Rank 4)
            case 20662: // Execute (Rank 5)
            case 25234: // Execute (Rank 6)
            case 25236: // Execute (Rank 7)
            case 47470: // Execute (Rank 8)
            case 47471: // Execute (Rank 9)
                spellInfo->AttributesEx3 |= SPELL_ATTR3_CANT_TRIGGER_PROC;
                break;
            case 59725: // Improved Spell Reflection - aoe aura
                // Target entry seems to be wrong for this spell :/
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER_AREA_PARTY);
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_20_YARDS);
                break;
            case 47423: // Call Kor'kron War Rider
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_5_YARDS);
                break;
            case 44978: // Wild Magic
            case 45001:
            case 45002:
            case 45004:
            case 45006:
            case 45010:
            case 31347: // Doom
            case 41635: // Prayer of Mending
            case 44869: // Spectral Blast
            case 45027: // Revitalize
            case 45976: // Muru Portal Channel
            case 39365: // Thundering Storm
            case 41071: // Raise Dead (HACK)
            case 52124: // Sky Darkener Assault
            case 42442: // Vengeance Landing Cannonfire
            case 45863: // Cosmetic - Incinerate to Random Target
            case 25425: // Shoot
            case 45761: // Shoot
            case 42611: // Shoot
            case 61588: // Blazing Harpoon
            case 52479: // Gift of the Harvester
            case 48246: // Ball of Flame
            case 36327: // Shoot Arcane Explosion Arrow
            case 55479: // Force Obedience
                spellInfo->MaxAffectedTargets = 1;
                break;
            case 36384: // Skartax Purple Beam
                spellInfo->MaxAffectedTargets = 2;
                break;
            case 41376: // Spite
            case 39992: // Needle Spine
            case 29576: // Multi-Shot
            case 40816: // Saber Lash
            case 37790: // Spread Shot
            case 46771: // Flame Sear
            case 45248: // Shadow Blades
            case 41303: // Soul Drain
            case 54172: // Divine Storm (heal)
            case 29213: // Curse of the Plaguebringer - Noth
            case 28542: // Life Drain - Sapphiron
            case 66588: // Flaming Spear
            case 54171: // Divine Storm
                spellInfo->MaxAffectedTargets = 3;
                break;
            case 38310: // Multi-Shot
            case 53385: // Divine Storm (Damage)
                spellInfo->MaxAffectedTargets = 4;
                break;
            case 42005: // Bloodboil
            case 38296: // Spitfire Totem
            case 37676: // Insidious Whisper
            case 46008: // Negative Energy
            case 45641: // Fire Bloom
            case 55665: // Life Drain - Sapphiron (H)
            case 28796: // Poison Bolt Volly - Faerlina
                spellInfo->MaxAffectedTargets = 5;
                break;
			case 54097:// Widow's Embrance
				spellInfo->Attributes &= ~SPELL_ATTR0_CASTABLE_WHILE_DEAD;
				break;
            case 40827: // Sinful Beam
            case 40859: // Sinister Beam
            case 40860: // Vile Beam
            case 40861: // Wicked Beam
            case 54835: // Curse of the Plaguebringer - Noth (H)
            case 54098: // Poison Bolt Volly - Faerlina (H)
                spellInfo->MaxAffectedTargets = 10;
                break;
            case 50312: // Unholy Frenzy
                spellInfo->MaxAffectedTargets = 15;
                break;
			case 34074: // Aspect of the Viper (for Vezax)
			case 54428: // Divine plea (for Vezax)
				spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
				break;
            case 33711: // Murmur's Touch
            case 38794:
                spellInfo->MaxAffectedTargets = 1;
                spellInfo->Effects[EFFECT_0].TriggerSpell = 33760;
                break;
            case 17941: // Shadow Trance
            case 22008: // Netherwind Focus
            case 31834: // Light's Grace
            case 34754: // Clearcasting
            case 34936: // Backlash
            case 48108: // Hot Streak
            case 51124: // Killing Machine
            case 54741: // Firestarter
            case 57761: // Fireball!
            case 39805: // Lightning Overload
            case 64823: // Item - Druid T8 Balance 4P Bonus
            case 34477: // Misdirection
            case 44401: // Missile Barrage
            case 18820: // Insight
                spellInfo->ProcCharges = 1;
                break;
            case 36030: // Protecting Our Own
                spellInfo->Effects[EFFECT_1].Effect = 0;
                break;
            case 44544: // Fingers of Frost
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(685904631, 1151048, 0);
                break;
            case 74396: // Fingers of Frost visual buff
                spellInfo->ProcCharges = 2;
                spellInfo->StackAmount = 0;
                break;
            case 34471: // The Beast Within
                spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
                spellInfo->AttributesEx5 |= SPELL_ATTR5_USABLE_WHILE_CONFUSED | SPELL_ATTR5_USABLE_WHILE_FEARED | SPELL_ATTR5_USABLE_WHILE_STUNNED;
                break;
            case 28200: // Ascendance (Talisman of Ascendance trinket)
                spellInfo->ProcCharges = 6;
                break;
            case 49224: // Magic Suppression - DK
            case 49610: // Magic Suppression - DK
            case 49611: // Magic Suppression - DK
                spellInfo->ProcCharges = 0;
                break;
            case 37408: // Oscillation Field
                spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
                break;
            case 47201: // Everlasting Affliction
            case 47202:
            case 47203:
            case 47204:
            case 47205:
                // add corruption to affected spells
                spellInfo->Effects[EFFECT_1].SpellClassMask[0] |= 2;
                break;
            case 47198: // Death's Embrace
            case 47199:
            case 47200:
                spellInfo->Effects[EFFECT_1].SpellClassMask[0] |= 0x4000; // include Drain Soul
                break;
            case 57470: // Renewed Hope (Rank 1)
            case 57472: // Renewed Hope (Rank 2)
                // should also affect Flash Heal
                spellInfo->Effects[EFFECT_0].SpellClassMask[0] |= 0x800;
                break;
            case 51852: // The Eye of Acherus (no spawn in phase 2 in db)
                spellInfo->Effects[EFFECT_0].MiscValue |= 1;
                break;
            case 51912: // Crafty's Ultra-Advanced Proto-Typical Shortening Blaster
                spellInfo->Effects[EFFECT_0].Amplitude = 3000;
                break;
            case 29809: // Desecration Arm - 36 instead of 37 - typo? :/
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_7_YARDS);
                break;
			case 18754: // Improved Succubus (Rank 1)
			case 18755: // Improved Succubus (Rank 2)
			case 18756: // Improved Succubus (Rank 3)
				spellInfo->Effects[EFFECT_0].TargetA = TARGET_UNIT_CASTER;
			break;
            // Master Shapeshifter: missing stance data for forms other than bear - bear version has correct data
            // To prevent aura staying on target after talent unlearned
            case 48420:
                spellInfo->Stances = UI64LIT(1) << (FORM_CAT - 1);
                break;
            case 48421:
                spellInfo->Stances = UI64LIT(1) << (FORM_MOONKIN - 1);
                break;
            case 48422:
                spellInfo->Stances = UI64LIT(1) << (FORM_TREE - 1);
                break;
            case 51466: // Elemental Oath (Rank 1)
            case 51470: // Elemental Oath (Rank 2)
                spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_ADD_FLAT_MODIFIER;
                spellInfo->Effects[EFFECT_1].MiscValue = SPELLMOD_EFFECT2;
                spellInfo->Effects[EFFECT_1].SpellClassMask = flag96(0x00000000, 0x00004000, 0x00000000);
                break;
            case 47569: // Improved Shadowform (Rank 1)
                // with this spell atrribute aura can be stacked several times
                spellInfo->Attributes &= ~SPELL_ATTR0_NOT_SHAPESHIFT;
                break;
            case 64904: // Hymn of Hope
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_MOD_INCREASE_ENERGY_PERCENT;
                break;
            case 7328:  // Paladin - Redemption (Rank 1)
            case 10322: // Paladin - Redemption (Rank 2)
            case 10324: // Paladin - Redemption (Rank 3)
            case 20772: // Paladin - Redemption (Rank 4)
            case 20773: // Paladin - Redemption (Rank 5)
            case 48949: // Paladin - Redemption (Rank 6)
            case 48950: // Paladin - Redemption (Rank 7)
                spellInfo->SpellFamilyName = SPELLFAMILY_PALADIN;
                break;
            case 19465: // Improved Stings (Rank 2)
                spellInfo->Effects[EFFECT_2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                break;
            case 30421: // Nether Portal - Perseverence
                spellInfo->Effects[EFFECT_2].BasePoints += 30000;
                break;
            case 67721: // Expose Weakness 10man
            case 67847: // Expose Weakness 25man
                spellInfo->StackAmount = 9;
                spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
                spellInfo->Effects[EFFECT_1].BasePoints = 39;
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT;
                break;
            case 16834: // Natural shapeshifter
            case 16835:
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(21);
                break;
            case 4078: // Compact Harvest Reaper
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(6);  // 10 minutes
                break;
            case 65142: // Ebon Plague
                spellInfo->AttributesEx3 &= ~SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
                break;
            case 51735: // Ebon Plague
            case 51734:
            case 51726:
                spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
                spellInfo->SpellFamilyFlags[2] = 0x10;
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN;
                break;
            case 41913: // Parasitic Shadowfiend Passive
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_DUMMY; // proc debuff, and summon infinite fiends
                break;
            case 27892: // To Anchor 1
            case 27928: // To Anchor 1
            case 27935: // To Anchor 1
            case 27915: // Anchor to Skulls
            case 27931: // Anchor to Skulls
            case 27937: // Anchor to Skulls
                spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(13);
                break;
            // target allys instead of enemies, target A is src_caster, spells with effect like that have ally target
            // this is the only known exception, probably just wrong data
            case 29214: // Wrath of the Plaguebringer
            case 54836: // Wrath of the Plaguebringer
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ALLY);
                spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ALLY);
                break;
            case 57994: // Wind Shear - improper data for EFFECT_1 in 3.3.5 DBC, but is correct in 4.x
                spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_MODIFY_THREAT_PERCENT;
                spellInfo->Effects[EFFECT_1].BasePoints = -6; // -5%
                break;
            case 15290: // Vampiric Embrace
            case 50259: // Dazed - Feral Charge - Cat
            case 49376: // Feral Charge - Cat
            case 5171: // Slice and Dice (Rank 1)
            case 6774: // Slice and Dice (Rank 2)
            case 47755: // Rapture
			case 52916: // Honor Among Thieves
            case 53651: // Paladin - beacon of light trigger spell
            case 63652: // Priest - Rapture - energy trigger spell
            case 63653: // Priest - Rapture - energy trigger spell
            case 63654: // Priest - Rapture - energy trigger spell
            case 63655: // Priest - Rapture - energy trigger spell
			case 28441: // Corrupted Ashbringer (AB Effect 000)
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
                break;
            case 59892: // Cyclone Fall
                spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_APPLY_AREA_AURA_FRIEND;
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_10_YARDS);
                spellInfo->AttributesEx &= ~SPELL_ATTR0_CANT_CANCEL;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;
                break;
			case 50526: // Wandering Plague
				spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
				spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_DONE_BONUS;
				break;
			case 28282: // Ashbringer
				spellInfo->Effects[EFFECT_2].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				spellInfo->Effects[EFFECT_2].ApplyAuraName = SPELL_AURA_FORCE_REACTION;
				spellInfo->Effects[EFFECT_2].MiscValue = 56; // Scarlet Crusade
				spellInfo->Effects[EFFECT_2].BasePoints = 4; // Friendly
				break;
            case 3600:  // Shaman Earthbin Totem - should not generate threat
            case 34026: // Hunter - Kill Command
                spellInfo->AttributesEx |= SPELL_ATTR1_NO_THREAT;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
                break;
            case 12721: // Deep Wounds shouldnt ignore resillience or damage taken auras because its damage is not based off a spell.
                spellInfo->AttributesEx4 = 0;
                break;
            case 32645: // Envenom
            case 32684:
            case 57992:
            case 57993:
                spellInfo->Dispel = DISPEL_NONE;
                break;
            case 8145: // Tremor Totem (instant pulse)
            case 6474: // Earthbind Totem (instant pulse)
                spellInfo->AttributesEx5 |= SPELL_ATTR5_START_PERIODIC_AT_APPLY;
                break;
            case 52109: // Flametongue Totem rank 1 (Aura)
            case 52110: // Flametongue Totem rank 2 (Aura)
            case 52111: // Flametongue Totem rank 3 (Aura)
            case 52112: // Flametongue Totem rank 4 (Aura)
            case 52113: // Flametongue Totem rank 5 (Aura)
            case 58651: // Flametongue Totem rank 6 (Aura)
            case 58654: // Flametongue Totem rank 7 (Aura)
            case 58655: // Flametongue Totem rank 8 (Aura)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo();
                spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo();
                break;
            case 53241: // Marked for Death (Rank 1)
            case 53243: // Marked for Death (Rank 2)
            case 53244: // Marked for Death (Rank 3)
            case 53245: // Marked for Death (Rank 4)
            case 53246: // Marked for Death (Rank 5)
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x00067801, 0x10820001, 0x00000801);
                break;
            case 70728: // Exploit Weakness (needs target selection script)
            case 70840: // Devious Minds (needs target selection script)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_PET);
                break;
            case 70893: // Culling The Herd (needs target selection script)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_MASTER);
                break;
            case 54800: // Sigil of the Frozen Conscience - change class mask to custom extended flags of Icy Touch
                        // this is done because another spell also uses the same SpellFamilyFlags as Icy Touch
                        // SpellFamilyFlags[0] & 0x00000040 in SPELLFAMILY_DEATHKNIGHT is currently unused (3.3.5a)
                        // this needs research on modifier applying rules, does not seem to be in Attributes fields
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x00000040, 0x00000000, 0x00000000);
                break;
            case 64949: // Idol of the Flourishing Life
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x00000000, 0x02000000, 0x00000000);
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_ADD_FLAT_MODIFIER;
                break;
            case 34231: // Libram of the Lightbringer
            case 60792: // Libram of Tolerance
            case 64956: // Libram of the Resolute
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x80000000, 0x00000000, 0x00000000);
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_ADD_FLAT_MODIFIER;
                break;
            case 28851: // Libram of Light
            case 28853: // Libram of Divinity
            case 32403: // Blessed Book of Nagrand
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x40000000, 0x00000000, 0x00000000);
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_ADD_FLAT_MODIFIER;
                break;
            case 45602: // Ride Carpet
                spellInfo->Effects[EFFECT_0].BasePoints = 0; // force seat 0, vehicle doesn't have the required seat flags for "no seat specified (-1)"
                break;
            case 64745: // Item - Death Knight T8 Tank 4P Bonus
            case 64936: // Item - Warrior T8 Protection 4P Bonus
                spellInfo->Effects[EFFECT_0].BasePoints = 100; // 100% chance of procc'ing, not -10% (chance calculated in PrepareTriggersExecutedOnHit)
                break;
            case 19970: // Entangling Roots (Rank 6) -- Nature's Grasp Proc
            case 19971: // Entangling Roots (Rank 5) -- Nature's Grasp Proc
            case 19972: // Entangling Roots (Rank 4) -- Nature's Grasp Proc
            case 19973: // Entangling Roots (Rank 3) -- Nature's Grasp Proc
            case 19974: // Entangling Roots (Rank 2) -- Nature's Grasp Proc
            case 19975: // Entangling Roots (Rank 1) -- Nature's Grasp Proc
            case 27010: // Entangling Roots (Rank 7) -- Nature's Grasp Proc
            case 53313: // Entangling Roots (Rank 8) -- Nature's Grasp Proc
                spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(1);
                break;
            case 61719: // Easter Lay Noblegarden Egg Aura - Interrupt flags copied from aura which this aura is linked with
                spellInfo->AuraInterruptFlags = AURA_INTERRUPT_FLAG_HITBYSPELL | AURA_INTERRUPT_FLAG_TAKE_DAMAGE;
                break;
            case 3714:  // Path of Frost
            case 60068: // Path of Frost
                spellInfo->AuraInterruptFlags = AURA_INTERRUPT_FLAG_TAKE_DAMAGE;
				break;
            case 47424: // Korkron Wing Commander
                spellInfo->AuraInterruptFlags = 0;
                break;
            case 29832: // Attumen Shadow Cleave
                spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_SCHOOL_DAMAGE;
                spellInfo->Effects[EFFECT_0].BasePoints = 5000;
                break;
            case 26084: // Whirlwind - Battleguard Sartura
                spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_SCHOOL_DAMAGE;
                spellInfo->Effects[EFFECT_0].BasePoints = 999;
                break;
            case 47938: // Twisting Blade
                spellInfo->AttributesEx |= SPELL_ATTR1_CANT_TARGET_SELF;
                break;
            case 70650: // Death Knight T10 Tank 2P Bonus
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_ADD_PCT_MODIFIER;
                break;
            case 71838: // Drain Life - Bryntroll Normal
            case 71839: // Drain Life - Bryntroll Heroic
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CANT_CRIT;
                break;
            case 57840: // Killing Spree
            case 57841:
            case 61851:
            case 51696:
            case 51690:
                spellInfo->AttributesEx2 |= SPELL_ATTR2_NOT_RESET_AUTO_ACTIONS;
                break;
            case 56606: // Ride Jokkum
            case 61791: // Ride Vehicle (Yogg-Saron)
                /// @todo: remove this when basepoints of all Ride Vehicle auras are calculated correctly
                spellInfo->Effects[EFFECT_0].BasePoints = 1;
                break;
            case 59630: // Black Magic
                spellInfo->Attributes |= SPELL_ATTR0_PASSIVE;
                break;
				// Precious's Ribbon
			case 72968:
				spellInfo->AttributesEx3 |= SPELL_ATTR3_DEATH_PERSISTENT;
				break;
            case 17364: // Stormstrike
                spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
                break;
            case 24926: // Hallow's End Candy, apply pirate visual.
                spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
                spellInfo->Effects[EFFECT_1].BasePoints = 1;
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_TRANSFORM;
                spellInfo->Effects[EFFECT_1].MiscValue = 15373;
                spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
                break;
            case 51798: // Brewfest - Relay Race - Intro - Quest Complete
            case 47134: // Quest Complete
                //! HACK: This spell break quest complete for alliance and on retail not used °_O
                spellInfo->Effects[EFFECT_0].Effect = 0;
                break;
            case 52610: // Savage Roar
                spellInfo->AttributesEx |= SPELL_ATTR1_NOT_BREAK_STEALTH;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
                break;
            case 47476: // Deathknight - Strangulate
            case 15487: // Priest - Silence
            case 5211:  // Druid - Bash  - R1
            case 6798:  // Druid - Bash  - R2
            case 8983:  // Druid - Bash  - R3
                spellInfo->AttributesEx7 |= SPELL_ATTR7_INTERRUPT_ONLY_NONPLAYER;
                break;
            case 20424: // Seal of Command (Trigger)
                spellInfo->AttributesEx3 &= ~SPELL_ATTR3_CANT_TRIGGER_PROC;
                break;
            case 48391: // Owlkin Frenzy
            case 12328: // Sweeping Strikes
                spellInfo->Attributes |= SPELL_ATTR0_NOT_SHAPESHIFT;
                break;
            case 20230: // Retaliation
            case 871:   // Shield Wall
            case 1719:  // Recklessness
                spellInfo->AttributesEx6 |= SPELL_ATTR6_IGNORE_CATEGORY_COOLDOWN_MODS;
                break;
            case 70890: // DK - Scourge Strike
                spellInfo->AttributesEx6 &= ~SPELL_ATTR6_NO_DONE_PCT_DAMAGE_MODS;
                break;
            case 34650: // Mana Leech Proc (Shadowfiend)
            case 27681: // Prayer of Spirit
            case 32999:
            case 48074:
            case 21562: // Prayer of Fortitude
            case 21564:
            case 25392:
            case 48162:
            case 27683: // Prayer of Shadow Protection
            case 39236:
            case 39374:
            case 48170:
            case 44461: // Living Bomb
            case 55361:
            case 55362:
            case 47632: // Deathcoil Damage
            case 47633: // Deathcoil Heal
            case 48543: // Revitalize
            case 48540: // Revitalize
            case 48541: // Revitalize
            case 48542: // Revitalize
            case 63853: // Rapture
            case 57669: // Replenishment
            case 53517: // Roar of Recovery
            case 49769: // RPGG Trigger Missile
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                break;
            case 53480: // Roar of Sacrifice
                spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
                spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_DUMMY;
                spellInfo->Effects[EFFECT_1].MiscValue = 127;
                spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ALLY);
                break;
            case 50544: // Cosmetic - Parachute Stuck
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_DUMMY;
                break;
            case 56247: // Glyph of Voidwalker
                spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_ADD_FLAT_MODIFIER;
                spellInfo->Effects[EFFECT_0].MiscValue = SPELLMOD_EFFECT1;
                spellInfo->Effects[EFFECT_0].SpellClassMask = flag96(0x8000000, 0, 0);
                break;
            case 53434: // Call of the Wild
                spellInfo->Effects[EFFECT_0].TargetA = TARGET_UNIT_MASTER;
                spellInfo->Effects[EFFECT_1].TargetA = TARGET_UNIT_MASTER;
                spellInfo->Effects[EFFECT_0].TargetB = TARGET_UNIT_CASTER;
                spellInfo->Effects[EFFECT_1].TargetB = TARGET_UNIT_CASTER;
                break;
            case 53508: // Wolverine Bite
                spellInfo->CasterAuraState = AURA_STATE_DEFENSE;
                spellInfo->AttributesEx &= SPELL_ATTR1_REQ_COMBO_POINTS1;
                break;
			case 62758: // Wild Hunt (Rank 1)
			case 62762: // Wild Hunt (Rank 2)
				spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_DUMMY;
				spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_DUMMY;
				break;
            case 51560: // Improved Earth Shield (Rank 1)
            case 51561: // Improved Earth Shield (Rank 2)
                spellInfo->Effects[EFFECT_1].MiscValue = SPELLMOD_DAMAGE;
                break;
            case 63165: // Decimation
            case 63167:
            case 7376:  // Defensive Stance (Passive)
            case 49152: // Titan's Grip
                spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
                break;
            case 8349: // Fire Nova Trigger
            case 8502:
            case 8503:
            case 11306:
            case 11307:
            case 25535:
            case 25537:
            case 61650:
            case 61654:
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                break;
				// Impurity
			case 49220:
			case 49633:
			case 49635:
			case 49636:
			case 49638:
				spellInfo->Effects[0].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[0].ApplyAuraName = SPELL_AURA_DUMMY;
				spellInfo->Effects[0].TargetA = TARGET_UNIT_CASTER;
				spellInfo->SpellFamilyName = SPELLFAMILY_DEATHKNIGHT;
				break;
            case 52212: // Death and Decay
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                spellInfo->AttributesEx6 |= SPELL_ATTR6_CAN_TARGET_INVISIBLE;
                break;
            case 58875: // Feral Spirit Triggers
            case 58876:
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                break;
                // VIOLET HOLD SPELLS
                //
			case 54258: // Water Globule (Ichoron)
			case 54264: // Water Globule (Ichoron)
			case 54265: // Water Globule (Ichoron)
			case 54266: // Water Globule (Ichoron)
			case 54267: // Water Globule (Ichoron)
			// in 3.3.5 there is only one radius in dbc which is 0 yards in this case
			// use max radius from 4.3.4
			spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_25_YARDS);
			break;
			// ENDOF VIOLET HOLD
			//
			//////////////////////////////////////////
			////////// AZJOL'NERUB
			//////////////////////////////////////////


			case 52343: // Krik'Thir Subboss Aggro Trigger
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 52586: // Krik'thir - Mind Flay
			case 59367:
				spellInfo->ChannelInterruptFlags |= AURA_INTERRUPT_FLAG_MOVE;
				break;
			case 52440: // Summon swarm
				spellInfo->Effects[EFFECT_0].Amplitude = 2000;	// Summon Skittering Swarmer
				break;
			case 52448: // Summon Skittering Infector Periodic
				spellInfo->Effects[EFFECT_0].Amplitude = 3000;
				break;
			case 59363: // It must stack from different casters.
			case 52446:
				spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
				spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;
				break;
				//Death Grip
			case 49575:
				spellInfo->Effects[EFFECT_0].MiscValueB = 20;
				//count++;
				break;
				/* Obsidian Sanctum, portal issues. */
			case 61190: // Twilight Shift correction, in order to not pull the whole instance.
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6);
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_45_YARDS);
				break;
				/* Naxxramas */
			case 28062:
                break;
				// ULDUAR SPELLS
				//
			case 62522:
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_55_YARDS);   // It should be and it is 25, but players are complaining about the radius.
				break;
			case 62374: // Pursued (Flame Leviathan)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS);   // 50000yd
				break;
			case 63342: // Focused Eyebeam Summon Trigger (Kologarn)
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 65195:	//Assembly of iron kill credit on dead players.
			case 65074: //Freya kill credit on dead players.
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_DEAD | SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 62716: // Growth of Nature (Freya)
			case 65584: // Growth of Nature (Freya)
			case 64381: // Strength of the Pack (Auriaya)
				spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
				break;
			case 62834: // Boom (XT-002)
				// This hack is here because we suspect our implementation of spell effect execution on targets
				// is done in the wrong order. We suspect that EFFECT_0 needs to be applied on all targets,
				// then EFFECT_1, etc - instead of applying each effect on target1, then target2, etc.
				// The above situation causes the visual for this spell to be bugged, so we remove the instakill
				// effect and implement a script hack for that.
				spellInfo->Effects[EFFECT_1].Effect = 0;
				break;
			case 64389: // Sentinel Blast (Auriaya)
			case 64678: // Sentinel Blast (Auriaya)
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(28); // 5 seconds, wrong DBC data?
				break;
			case 64783: // Displacement Device Duration.
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(1); // 10 seconds
				break;
			case 64321: // Potent Pheromones (Freya)
				// spell should dispel area aura, but doesn't have the attribute
				// may be db data bug, or blizz may keep reapplying area auras every update with checking immunity
				// that will be clear if we get more spells with problem like this
				spellInfo->AttributesEx |= SPELL_ATTR1_DISPEL_AURAS_ON_IMMUNITY;
				break;
            case 63801: // Boomb from Boomer XP
                spellInfo->Effects[EFFECT_1].ApplyAuraName = 0;
                break;
				/* Mimiron */
				/*case 63679: // Heat Wave Aura, periodic triggering next spell.
				spellInfo->Effects[EFFECT_0].Amplitude = 9000;
				break;*/
			case 64533: // Triggered Heat wave 25 players.
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 3500;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				spellInfo->Effects[EFFECT_1].BasePoints = 3000;
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
			case 63677: // Triggered Heat wave 10 players.
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 2000;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				spellInfo->Effects[EFFECT_1].BasePoints = 2200;
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
				// Rapid burst.
			case 63387: // 10 players left.
			case 64019: // 10 players right.
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 1500;
				break;
			case 64531: // 25 players left.
			case 64532: // 25 players right.
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 1900;
				break;
			case 66351: // Proximity mines explosion, 10 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 11000;
				break;
				/* Kologarn */
			case 64224: // Hack for absorption spell.
			case 64225:
				spellInfo->Effects[EFFECT_0].BasePoints = 1;
				break;
			case 63009: // Proximity mines explosion, 25 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 14000;
				break;
			case 64383: // Self repair, pre nerf spell cast duration.
				spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(7); //10 seconds, instead of 15.
				break;
			case 63414: // Spinning Up (Mimiron)
				spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				spellInfo->ChannelInterruptFlags = 0;
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_CONE_LINE;
				break;
			case 64042:
			case 63293:
			case 63297:
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_40_YARDS);
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_CONE_LINE;
				break;
				// Mimiron - P3Wx2 Laser Barrage 63274 66490 63300
			case 63274:
			case 63300:
			case 66490:
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_CONE_LINE;
				break;

			case 63036: // Rocket Strike (Mimiron)
            case 62358: // Fire Cannon - Wintergrasp
            case 57609: // Fire Cannon - Wintergrasp
				spellInfo->Speed = 0;
				break;
            case 50516: // Typhoon trigger r1
            case 53223: // Typhoon trigger r2
            case 53225: // Typhoon trigger r3
            case 53226: // Typhoon trigger r4
            case 61384: // Typhoon trigger r5
                spellInfo->Speed = 0.0f; // This spell is instant
                break;
            case 61391: // Typhoon r1
            case 61390: // Typhoon r2
            case 61388: // Typhoon r3
            case 61387: // Typhoon r4
            case 53227: // Typhoon r5
                spellInfo->Speed = 40.0f;
                break;
			case 64668: // Magnetic Field (Mimiron)
				spellInfo->Mechanic = MECHANIC_NONE;
				break;
				break;
				/* Freya */
			case 62623: // Sunbeam 10
			case 62872: // Sunbeam 10
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_6_YARDS); // It should be 8, but players are complaining.
				break;
			case 62337:
				spellInfo->ProcCharges = 80;
				break;
				/*case 62386: // Stonebark essence
				spellInfo->Effects[EFFECT_0].BasePoints = 75;
				break;*/
			case 62713: // Ironbranch essence
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				break;
			case 62968: // Brightleaf essence
				//spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(156);
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				spellInfo->Effects[EFFECT_1].BasePoints = 0;
				//spellInfo->Effects[EFFECT_1].TargetA = 0;
				//spellInfo->Effects[EFFECT_1].TargetB = 0;
				break;
				/* DOMINATE MIND TESTS */
			case 63713:
				spellInfo->MaxAffectedTargets = 1;
				spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_0].TargetA = TARGET_UNIT_TARGET_ENEMY;
				spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_AOE_CHARM;
				spellInfo->Effects[EFFECT_0].BasePoints = 99;
				spellInfo->Attributes &= ~SPELL_ATTR0_DONT_AFFECT_SHEATH_STATE;
				//spellInfo->Attributes &= ~SPELL_ATTR3_ONLY_TARGET_PLAYERS;
				//spellInfo->Effects[EFFECT_1].
				break;
				/* Flame Leviathan, pre-nerf buff health increased per tower on Hard mode. Increased from 40% to 50% */
			case 65077:  // Tower of Frost
				spellInfo->Effects[EFFECT_0].BasePoints = 50;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_0_YARDS);   // 50000yd
				break;
			case 64482:  // Tower of Life
			case 65075:  // Tower of Flames
			case 65076:  // Tower of Storms
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_0_YARDS);   // 50000yd
				spellInfo->Effects[EFFECT_2].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_0_YARDS);   // 50000yd
				spellInfo->Effects[EFFECT_2].BasePoints = 50;
				break;
				/* Ignis */
			case 62549: // Scorch 10 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 3800;
				break;
			case 62530: // Molten, from the Iron Constructs.
				spellInfo->Effects[EFFECT_0].BasePoints = 3100;
				break;
			case 63475: // Scorch 25 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 5600;
				break;
				/*Venomhide Exploit*/
			case 14792:
				spellInfo->Effects[EFFECT_1].TargetA = 0;
				spellInfo->Effects[EFFECT_1].MiscValue = 0;
				break;
			case 63472:
			case 62681:
			case 62680:
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(31); // 8 Seconds, pre-nerf. Debuffs and silence.
				break;
			case 62324: // Throw Passenger
				spellInfo->Targets |= TARGET_UNIT_CASTER;
				break;
			case 62717:
			case 63477:
				/*spellInfo->Effects[EFFECT_2].Effect = SPELL_EFFECT_APPLY_AREA_AURA_ENEMY;
				spellInfo->Effects[EFFECT_2].TargetA = TARGET_UNIT_CASTER;
				spellInfo->Effects[EFFECT_2].ApplyAuraName = SPELL_AURA_MOD_PACIFY_SILENCE;
				spellInfo->Effects[EFFECT_2].Mechanic = MECHANIC_SILENCE;*/ // This needs to be researched, if the slag pot allows the victim to cast non-attacking spells.
				break;
			case 65723:
			case 65722: // Slag pot damage, the caster is casting it on himself.
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
				break;
			case 62488:
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 64599: // Arcane Barrage, Living Constellations.
			case 64607:
				spellInfo->Effects[EFFECT_0].TargetA = TARGET_UNIT_TARGET_ENEMY;
				spellInfo->Effects[EFFECT_0].TargetB = 0;
				spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(1);
				break;
			case 63802:
				spellInfo->MaxAffectedTargets = 2;
				break;
			case 62338: // Runic Barrier.
				spellInfo->Effects[EFFECT_1].BasePoints = 2500;
				break;
				/* Razorscale */
			case 64758: // Dark Rune Watcher, 10 man Chain Ligthning
				spellInfo->Effects[EFFECT_0].BasePoints = 8500;
				break;
			case 64759: // Dark Rune Watcher, 25 man Chain Ligthning
				spellInfo->Effects[EFFECT_0].BasePoints = 12000;
				break;
			case 64704: /* Devouring flame damage 10 players */
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_7_YARDS);
				spellInfo->Effects[EFFECT_0].BasePoints = 8500;
				break;
			case 64733: /* Devouring flame damage 25 players */
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_7_YARDS);
				spellInfo->Effects[EFFECT_0].BasePoints = 11500;
				break;
			case 62796: /* Razorscale's Fireball 10 players. */
				spellInfo->Effects[EFFECT_0].BasePoints = 8900;
				break;
			case 63815: /* Razorscale's Fireball 10 players. */
				spellInfo->Effects[EFFECT_0].BasePoints = 11400;
				break;
				/* XT-002 Deconstructor */
			case 63023: // Searing light periodic
				spellInfo->Effects[EFFECT_0].BasePoints = 3400;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_12_YARDS);
				break;
			case 65120: // Searing Light 25 periodic.
				spellInfo->Effects[EFFECT_0].BasePoints = 4400;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_12_YARDS);
				break;
			case 63018: // Searing Light (XT-002)
			case 65121: // Searing Light (25m) (XT-002)
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 63024: // Gravity Bomb (XT-002)
				spellInfo->Effects[EFFECT_2].BasePoints = 15500;
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 64234: // Gravity Bomb (25m) (XT-002)
				spellInfo->Effects[EFFECT_2].BasePoints = 20000;
				spellInfo->MaxAffectedTargets = 1;
				//spellInfo->Effects[EFFECT_2].BasePoints = 20000;
				break;
			case 63025: // Gravity bomb, explosion to allies. 10 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 15500;
				break;
			case 64233: // Gravity bomb, explosion to allies. 25 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 20500;
				break;
			case 64193: // Heartbreak 25
				spellInfo->Effects[EFFECT_1].BasePoints = 75;
				spellInfo->Effects[EFFECT_2].BasePoints = 25; // 25% extra damage, pre-nerf.
				break;
			case 65737: // Heartbreak 10
				spellInfo->Effects[EFFECT_1].BasePoints = 60;
				spellInfo->Effects[EFFECT_2].BasePoints = 25; // 25% extra damage, pre-nerf.
				break;
			case 64230: // Shock - Life Sark from XT002.
				spellInfo->Attributes &= ~SPELL_ATTR0_ON_NEXT_SWING;
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(7);
				spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_SCHOOL_DAMAGE;
				spellInfo->Effects[EFFECT_0].BasePoints = 8000;
				spellInfo->Effects[EFFECT_0].ChainTarget = 5;
				break;
			case 62789: // Heart Overload
				spellInfo->Effects[EFFECT_0].Amplitude = 8000;
				break;
			case 62775:
			case 62776: // Tympanic Tantrum
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->AttributesEx4 |= SPELL_ATTR4_IGNORE_RESISTANCES;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(29); // 12 seconds, pre-nerf.
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_150_YARDS);// 150 yard
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_150_YARDS);
				break;
				/*Assembly of Iron*/
				//case 61888: /* Overwhelming power from Steelbreaker 25 players. */	// AQUI, PRUEBA A QUITAR ÉSTO Y A VER SI HACE CORRECTAMENTE EL MELTDOWN.
				//spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(9); // Pre-nerf, 30 seconds, 42 entry (25 secs) is missing on the DBC.
				//break;
			case 63494: // Static disruption 25 players.
			case 61912: // Static disruption 10 players.
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 61902: // Electrical Charge, heal pct pre-nerf: from 20 to 30%.
				spellInfo->Effects[EFFECT_1].BasePoints = 20;
				break;
			case 61879: // Brundir's chain lightning 10 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 5600;
				break;
			case 63479: // Brundir's chain lightning 10 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 6999;
				break;
			case 61916: // Brundir's lightning whirl 10 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 4700;
				break;
			case 63482: // Brundir's lightning whirl 25 players.
				spellInfo->Effects[EFFECT_0].BasePoints = 7000;
				break;
			case 61878: // Overload from Brundir, radius increased.
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_23_YARDS);
				break;
				/* Kologarn */
			case 63783: // Shockwave 10 players. 63783
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 11000;
				break;
			case 63982:
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 15500;
				break;
			case 64290: // Stone Grip damage, 10 man. Pre-nerf. ONLY DAMAGE.
				spellInfo->AttributesEx4 |= SPELL_ATTR4_IGNORE_RESISTANCES;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->AttributesEx5 |= SPELL_ATTR5_USABLE_WHILE_CONFUSED | SPELL_ATTR5_USABLE_WHILE_FEARED | SPELL_ATTR5_USABLE_WHILE_STUNNED;
				spellInfo->Effects[EFFECT_0].BasePoints = 3600;
				break;
			case 64292: // Stone Grip damage, 25 man. Pre-nerf.
				spellInfo->AttributesEx4 |= SPELL_ATTR4_IGNORE_RESISTANCES;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->AttributesEx5 |= SPELL_ATTR5_USABLE_WHILE_CONFUSED | SPELL_ATTR5_USABLE_WHILE_FEARED | SPELL_ATTR5_USABLE_WHILE_STUNNED;
				spellInfo->Effects[EFFECT_0].BasePoints = 5800;
				break;
				/* Auriaya */
				/*case 64374: // Savage Pounce 25 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 7400; // Impact.
				spellInfo->Effects[EFFECT_1].BasePoints = 5200; // Periodic damage.
				break;
				case 64666: // Savage Pounce 10 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 4200; // Impact.
				spellInfo->Effects[EFFECT_1].BasePoints = 3800; // Periodic damage.
				break;*/
			case 64386: // Terrifying Screech (Auriaya)
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(32); // 6 seconds.
				break;
				/*case 64459: // Seeping Feral essence, 10 man (void zone)
				spellInfo->Effects[EFFECT_0].BasePoints = 6500;
				break;
				case 64675: // Seeping Feral essence, 25 man (void zone)
				spellInfo->Effects[EFFECT_0].BasePoints = 9500;
				break;*/
			case 64422: // Sonic Screech 10 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 80000;
				break;
			case 64688: // Sonic Screech 25 man.
				spellInfo->Effects[EFFECT_0].BasePoints = 240000;
				break;
				/* Thorim */
				/*case 62576:
				case 62602:
				/*	case 62577:
				case 62603:*/

				break;
			case 62526: // Rune Detonation from Ancient Rune Giant.
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 62466:
				spellInfo->AttributesEx2 &= ~SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 62577:  // Sif, Blizzard 10 man.
			case 62603: // Sif, Blizzard 25 man.*/
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_1_YARD);
				spellInfo->Effects[EFFECT_0].TargetB = 0;
				spellInfo->Effects[EFFECT_0].Amplitude = 5500;
				break;
				/* Hodir */
				/* Frozen Blows */
			case 62469: //Freeze
				spellInfo->Effects[EFFECT_0].BasePoints = 7000;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				break;
			case 62867: // Impact 10
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 41000;
				break;
			case 64544: // Periodic 10
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				spellInfo->Effects[EFFECT_0].BasePoints = 5000;
				break;
			case 63511: // Impact 25
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].BasePoints = 51000;
				break;
			case 64545: // Periodic 25
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				spellInfo->Effects[EFFECT_0].BasePoints = 5500;
				break;
			case 62039:
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
				break;
			case 62038: // Biting Cold aura.
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS);
				spellInfo->AttributesEx4 &= ~SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 62148:  // Flash freeze
				spellInfo->AttributesEx4 &= ~SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
				break;
			case 61968:
                spellInfo->AttributesEx2 &= ~SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0; // Hack, but it does work like a charm.
				break;
			case 62807: // Starlight, from 50% to 40%  haste bennefit.
				spellInfo->Effects[EFFECT_0].BasePoints = 40;
				break;
				/* Vezax */
				/*case 63337: Saronite Vapors
				spellInfo->Effects[EFFECT_0].TargetA = TARGET_UNIT_CASTER;
				break;*/
				/*case 62659: // Shadowcrash, knockback and damage triggers.
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_8_YARDS);
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_8_YARDS);*/ // Está bien, son 10 yardas.
				break;
			case 62660: // Shadow Crash spell, missile trajectory.
				spellInfo->Speed = 8;
				break;
			case 63322: // Saronite Vapors aura.
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_10_YARDS);
				break;
			case 63420: // Profound Darkness
				spellInfo->Effects[EFFECT_0].BasePoints = 850;
				break;
			case 64153: // Black plague, tentacles.
				spellInfo->Effects[EFFECT_0].Amplitude = 6000;
				break;
			case 64132: // Summon constrictor tentacles
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
			case 63795:
			case 65301: // Sara Psychosis
				spellInfo->MaxAffectedTargets = 1;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
			case 63830: // Sara Malady of the Mind
				spellInfo->MaxAffectedTargets = 1;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				spellInfo->Effects[EFFECT_2].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
				//case 64486: // Empowering Shadows (Yogg-Saron)
			case 64465: // Shadow Beacon (Yogg-Saron) Post nerf: 3 maximu.
				spellInfo->MaxAffectedTargets = 3;  // same for both modes?
				break;
				/* Algalon */
			case 65509: // Constellation Phase Effect
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 62301: // Cosmic Smash (Algalon the Observer)
				spellInfo->MaxAffectedTargets = 1;
				break;
			case 64598: // Cosmic Smash (Algalon the Observer)
				spellInfo->MaxAffectedTargets = 3;
				break;
			case 62293: // Cosmic Smash (Algalon the Observer)
				spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_DEST_CASTER);
				break;
			case 62311: // Cosmic Smash (Algalon the Observer)
			case 64596: // Cosmic Smash (Algalon the Observer)
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6);  // 100yd
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_25_YARDS);
				break;
			case 64014: // Expedition Base Camp Teleport
			case 64024: // Conservatory Teleport
			case 64025: // Halls of Invention Teleport
			case 64028: // Colossal Forge Teleport
			case 64029: // Shattered Walkway Teleport
			case 64030: // Antechamber Teleport
			case 64031: // Scrapyard Teleport
			case 64032: // Formation Grounds Teleport
			case 65042: // Prison of Yogg-Saron Teleport
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DB);
				break;
				// ENDOF ULDUAR SPELLS
            //
				// TRIAL OF THE CHAMPION SPELLS
				//spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DB);
			case 67868: //Trample

				//
				spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;

				break;
			case 66905: // Hammer of the Righteous.
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				break;
			case 68284: // ToC5 Charge
				spellInfo->Effects[1].Effect = SPELL_EFFECT_SCHOOL_DAMAGE;
				spellInfo->Effects[1].BasePoints = 20000;
				spellInfo->Effects[1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				break;
			case 68282: // ToC5 Charge
				spellInfo->Effects[1].Effect = 0;
				break;
			case 67705: // Raise Arelas Birhgtstar
			case 67715: // Raise Jaeren Sunworn
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_DEAD;
				break;
			case 67782: // Desecration
				spellInfo->Effects[0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_2_YARDS);
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENEMY);
				break;
			case 66545:
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				break;
			case 66543: // Summon memories.
			case 66691:
			case 66692:
			case 66694:
			case 66695: // Summon memory of Lucifron.
			case 66696:
			case 66697:
			case 66698:
			case 66699:
			case 66700:
			case 66701:
			case 66702:
			case 66703:
			case 66704:
			case 66705:
			case 66706:
			case 66707:
			case 66708:
			case 66709:
			case 66710:
			case 66711:
			case 66712:
			case 66713:
			case 66714:
			case 66715:
				spellInfo->AttributesEx5 |= SPELL_ATTR5_USABLE_WHILE_CONFUSED | SPELL_ATTR5_USABLE_WHILE_FEARED | SPELL_ATTR5_USABLE_WHILE_STUNNED;
				spellInfo->Effects[0].MiscValue = 0;
				spellInfo->Effects[0].ValueMultiplier = 0;
				spellInfo->Effects[0].MiscValueB = 0;
				spellInfo->Effects[0].BasePoints = 0;
				break;
			case 66798: // Death's respite INTRO.
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				spellInfo->AttributesEx &= ~SPELL_ATTR1_NO_THREAT;
				spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(1);
				break;
				// TRIAL OF THE CRUSADER SPELLS
				//
            // TRIAL OF THE CRUSADER SPELLS
            // Gormok the Impaler.
				// Trial of the Crusader, Gormok, player vehicle spell, CUSTOM! (default jump to hand, not used)
			case 66408: // Batter
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_VEHICLE);
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_VEHICLE);
				break;
			case 66407: // Head Crack
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_VEHICLE);
				break;
			case 66342:
				spellInfo->Effects[EFFECT_0].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_AURA_SET_VEHICLE_ID;
				spellInfo->Effects[EFFECT_0].MiscValue = 496;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(21);
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(1);
				spellInfo->Effects[EFFECT_0].TargetA = 25;
				spellInfo->Effects[EFFECT_0].TargetB = 0;
				spellInfo->AuraInterruptFlags = AURA_INTERRUPT_FLAG_CHANGE_MAP;
				break;
			case 66320: // Reduce the Fire bomb radius a bit.
			case 67472:
			case 67473:
			case 67475:
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_3_YARDS);
				break;
			// Jormungars.
			case 66901: // Paralytic spray from Acidmaw must trigger Paralytic toxin also.
			case 67615:
			case 67616:
			case 67617:
				spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_TRIGGER_SPELL;
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_DEST_AREA_ENEMY);
				spellInfo->Effects[EFFECT_1].TriggerSpell = 66823;
				spellInfo->Effects[EFFECT_1].BasePoints = 1;
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_9_YARDS); // 9yd
				break;
			case 66902: // Burning Spray from Dreadscale.
			case 67627:
			case 67628:
			case 67629:
				spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_TRIGGER_SPELL;
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_DEST_AREA_ENEMY);
				spellInfo->Effects[EFFECT_1].TriggerSpell = 66869;
				spellInfo->Effects[EFFECT_1].BasePoints = 1;
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_9_YARDS); // 9yd
				break;
				// Icehowl rage
			case 66759:
			case 67657:
			case 67658:
			case 67659:
				spellInfo->Dispel = 0;
				break;
			case 67345: // Icehowl's Whirl only target players.
			case 67663:
			case 67664:
			case 67665:
				spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;
				break;
			//Lord Jaraxxus
            case 66258: // Infernal Eruption (10N)
            case 67901: // Infernal Eruption (25N)
                // increase duration from 15 to 18 seconds because caster is already
                // unsummoned when spell missile hits the ground so nothing happen in result
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(85);
                break;
			case 66528: // Fel Lightning
			case 67029:
			case 67030:
			case 67031:
			case 66243: // Incinerate Flesh
				spellInfo->CategoryRecoveryTime = 0;
				spellInfo->Effects[EFFECT_1].Effect = 0;
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo();
				spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo();
				spellInfo->Effects[EFFECT_1].TriggerSpell = 0;
				break; // Incinerate flesh
			case 66237:
			case 66197: // Legion Flame
			case 68123:
			case 68124:
			case 68125:
				spellInfo->CategoryRecoveryTime = 0;
				spellInfo->ExcludeTargetAuraSpell = 0;
				break;
				// tempfix, make Nether Power not stealable
			case 66228:
			case 67106:
			case 67107:
			case 67108:
				spellInfo->AttributesEx4 |= SPELL_ATTR4_NOT_STEALABLE;
				break;
				// Twin Valkyrs - Bullet controller periodic(Orbs)
			case 65858: // Light / Darkness Shield 10 man.
			case 65874:
				spellInfo->Effects[EFFECT_0].BasePoints = 250000;
				break;
			case 67256: // Light / Darkness Shield 25 man.
			case 67259:
				spellInfo->Effects[EFFECT_0].BasePoints = 900000;
				break;
			case 67257: // Light / Darkness Shield 10 man HEROIC.
			case 67260:
				spellInfo->Effects[EFFECT_0].BasePoints = 400000;
				break;
			case 67258: // Light / Darkness Shield 25 man HEROIC.
			case 67261:
				spellInfo->Effects[EFFECT_0].BasePoints = 1500000;
				break;
			case 68396: // 10 players
				spellInfo->Effects[EFFECT_0].Amplitude = 16000;
			case 66149: // 25 players
				spellInfo->Effects[EFFECT_0].Amplitude = 12000;
				break;
				// Touch of Darkness faltan 25 y tal.
			case 67282:
			case 67297:
			break;
			case 66129: // Spider Frenzy
				spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
				spellInfo->Effects[EFFECT_0].Amplitude = 2000; // This is probably useless.
				break;
			case 65919: // Anub'arak - Impale. ---- Not right, on retail it doesn't knock up in the air to the players.
			case 67858:
			case 67859:
			case 67860:
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENEMY);
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_8_YARDS);
				break;
				/*
			case 67858:
			case 67859:
			case 67860:
				spellInfo->Effects[EFFECT_2].Effect = SPELL_EFFECT_KNOCK_BACK;
				spellInfo->Effects[EFFECT_2].BasePoints = 200;
				spellInfo->Effects[EFFECT_2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CONE_ENEMY_104);
				spellInfo->Effects[EFFECT_2].TargetB = SpellImplicitTargetInfo();
				spellInfo->Effects[EFFECT_2].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_6_YARDS);
				break;*/
            // ENDOF TRIAL OF THE CRUSADER SPELLS
            //
            // HALLS OF REFLECTION SPELLS
            //
            case 72830: // Achievement Check
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                break;
            case 72900: // Start Halls of Reflection Quest AE
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;            
            case 70737: // Vegard Summon Ghouls (Quest: The Sacred and the Corrupt)
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(1); // 10 seconds
                break;
            // ENDOF HALLS OF REFLECTION SPELLS
            //
            // ICECROWN CITADEL SPELLS
            //
            // THESE SPELLS ARE WORKING CORRECTLY EVEN WITHOUT THIS HACK
            // THE ONLY REASON ITS HERE IS THAT CURRENT GRID SYSTEM
            // DOES NOT ALLOW FAR OBJECT SELECTION (dist > 333)
            case 70781: // Light's Hammer Teleport
            case 70856: // Oratory of the Damned Teleport
            case 70857: // Rampart of Skulls Teleport
            case 70858: // Deathbringer's Rise Teleport
            case 70859: // Upper Spire Teleport
            case 70860: // Frozen Throne Teleport
            case 70861: // Sindragosa's Lair Teleport
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DB);
                break;
			case 70960: // Bone Flurry
			case 71258: // Adrenaline Rush (Ymirjar Battle-Maiden)
				spellInfo->AttributesEx &= ~SPELL_ATTR1_CHANNELED_2;
				break;
			case 69055: // Saber Lash (Lord Marrowgar)
			case 70814: // Saber Lash (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_5_YARDS); // 5yd
				break;
			case 69065: // Impaled (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0; // remove stun so Dispersion can be used
				break;
			case 72701: // Cold Flame (Lord Marrowgar)
			case 72702: // Cold Flame (Lord Marrowgar)
			case 72703: // Cold Flame (Lord Marrowgar)
			case 72704: // Cold Flame (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DEST);
				spellInfo->Effects[EFFECT_1].TargetB = 0;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(9); // 30 secs instead of 12, need him for longer, but will stop his actions after 12 secs
				break;
			case 69138: // Coldflame (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0;
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DEST);
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(9); // 30 secs instead of 12, need him for longer, but will stop his actions after 12 secs
				break;
			case 69146: // Coldflame (Lord Marrowgar) NH
				spellInfo->Effects[EFFECT_0].BasePoints = 9000;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(32); // 6 seconds instead of 3
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_3_YARDS); // 3yd instead of 5yd
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_IGNORE_RESISTANCES;
				break;
			case 70823:
				spellInfo->Effects[EFFECT_0].BasePoints = 13500;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(32); // 6 seconds instead of 3
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_3_YARDS); // 3yd instead of 5yd
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_IGNORE_RESISTANCES;
				break;
			case 70824:
				spellInfo->Effects[EFFECT_0].BasePoints = 14500;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(1); // 10 seconds instead of 3 in Hc
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_3_YARDS); // 3yd instead of 5yd
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_IGNORE_RESISTANCES;
				break;
			case 70825: // Coldflame (Lord Marrowgar) HC
				spellInfo->Effects[EFFECT_0].BasePoints = 16000;
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(1); // 10 seconds instead of 3 in Hc
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_3_YARDS); // 3yd instead of 5yd
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_IGNORE_RESISTANCES;
				break;
			case 69057:
			case 70826:
			case 72088:
			case 72089:
				spellInfo->AttributesEx &= ~SPELL_ATTR1_CHANNELED_2;
				break;
			case 69705: // Gunship Battle, spell Below Zero
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 69075: // Bone Storm (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].BasePoints = 9000;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 70834: // Bone Storm (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].BasePoints = 15000;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 70835: // Bone Storm (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].BasePoints = 14000;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 70836: // Bone Storm (Lord Marrowgar)
				spellInfo->Effects[EFFECT_0].BasePoints = 19000;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 72378: // Blood Nova (Deathbringer Saurfang)
			case 73058: // Blood Nova (Deathbringer Saurfang)
			case 72769: // Scent of Blood (Deathbringer Saurfang)
			case 72771: // Scent of Blood (Deathbringer Saurfang)
			case 71160: // Plague Stench (Stinky)
			case 71161: // Plague Stench (Stinky)
			case 71123: // Decimate (Stinky & Precious)
			case 71464: // Divine Surge (Sister Svalna)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 71169: // Shadow's Fate
				spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
				break;
			case 72864: // Death Plague (Rotting Frost Giant)
				spellInfo->ExcludeTargetAuraSpell = 0;
				break;
			case 70897: // Dark Martyrdom (Lady Deathwhisper)
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_DEAD;
				break;
			case 72380: // Blood Nova buff.
			case 72439:
				spellInfo->Effects[EFFECT_0].BasePoints = urand(8600, 10000);
				break;
			case 72438:
			case 72440:
				spellInfo->Effects[EFFECT_0].BasePoints = urand(14000, 17000);
				break;
			case 72385: // Boiling Blood (Deathbringer Saurfang)
			case 72441: // Boiling Blood (Deathbringer Saurfang)
			case 72442: // Boiling Blood (Deathbringer Saurfang)
			case 72443: // Boiling Blood (Deathbringer Saurfang)
				spellInfo->Effects[EFFECT_0].BasePoints = 9500;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
				break;
			case 72409:
			case 72447:
			case 72448:
			case 72449:
				spellInfo->Effects[EFFECT_0].BasePoints = spellInfo->Effects[EFFECT_0].BasePoints * 1.8;
				break;
			case 72255: // Mark of the Fallen Champion (Deathbringer Saurfang) // Patch 3.3.2 (2010-01-02): Deathbringer Saurfang will no longer gain blood power from Mark of the Fallen Champion.
			case 72444: // Mark of the Fallen Champion (Deathbringer Saurfang) // Xinef: prevented in script, effect needed for Prayer of Mending
			case 72445: // Mark of the Fallen Champion (Deathbringer Saurfang)
			case 72446: // Mark of the Fallen Champion (Deathbringer Saurfang)
				spellInfo->AttributesEx3 &= ~SPELL_ATTR3_CANT_TRIGGER_PROC;
				break;
			case 70460: // Coldflame Jets (Traps after Saurfang)
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(1);   // 10 seconds
				break;
			case 73261: // Scale Aura (used during Dominate Mind from Lady Deathwhisper)
				spellInfo->AuraInterruptFlags |= AURA_INTERRUPT_FLAG_CHANGE_MAP;
				break;
			case 70461: // Coldflame Jets (Traps after Saurfang)
			case 71289: // Dominate Mind (Lady Deathwhisper)
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 72293: // Mark of the Fallen Champion (Deathbringer Saurfang)
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_NEGATIVE_EFF0;
				break;
			case 71906: // Severed Essence (Val'kyr Herald)
			case 71942: // Severed Essence (Val'kyr Herald)
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				spellInfo->Effects[EFFECT_0].TargetB = 0;
				spellInfo->Effects[EFFECT_1].ApplyAuraName = 0;
				spellInfo->Effects[EFFECT_1].Effect = 0;
				break;
			case 71159: // Awaken Plagued Zombies (Precious)
			case 71302: // Awaken Ymirjar Fallen (Ymirjar Deathbringer)
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(21);
				break;
			case 71822: // Shadow Resonance - Hack, it needs a proper solution (Blood Prince Council)
				spellInfo->AttributesEx4 |= SPELL_ATTR4_FIXED_DAMAGE;
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6);  // 100yd
				break;
			case 70981: // Blood Prince Council, Invocation of Blood
			case 70982: // Blood Prince Council, Invocation of Blood
			case 70952: // Blood Prince Council, Invocation of Blood
				spellInfo->Effects[EFFECT_0].Effect = 0; // clear share health aura
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0; // clear share health aura
				break;
			case 72052: // Blood Prince Council, Kinetic bombs explosion must affect everyone in the room.
			case 72800:
			case 72801:
			case 72802:
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS);
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS);
				break;
			case 71274: // Ymirjar Frostbinder, Frozen Orb
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				break;
			case 69783: // Ooze Flood (Rotface)
			case 69797:
			case 69799:
			case 69802:
				spellInfo->AttributesEx |= SPELL_ATTR1_CANT_TARGET_SELF;
				break;
			case 70812: // Gaseous Bloat Protection
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(86); // 21 seconds
				break;
			case 70530: // Volatile Ooze Beam Protection
				//spellInfo->Effects[EFFECT_0].ApplyAuraName = SPELL_EFFECT_APPLY_AURA; // blizzard typo, 65 instead of 6, aura itself is defined (dummy)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_0_YARDS);
				break;
			case 72347: // Lock Players and Tap Chest (Gunship Battle)
                spellInfo->AttributesEx3 &= ~SPELL_ATTR3_NO_INITIAL_AGGRO;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_NEGATIVE_EFF0;
                break;
            case 72723: // Resistant Skin (Deathbringer Saurfang adds)
                // this spell initially granted Shadow damage immunity, however it was removed but the data was left in client
                spellInfo->Effects[EFFECT_2].Effect = 0;
                break;
			case 69159: // Gaseous Blight (Festergut)
			case 70135: // Gaseous Blight (Festergut)
			case 70136: // Gaseous Blight (Festergut)
			case 70137: // Gaseous Blight (Festergut)
			case 69161: // Gaseous Blight 1 Inhale (Festergut)
			case 70138: // Gaseous Blight 1 Inhale (Festergut)
			case 70139: // Gaseous Blight 1 Inhale (Festergut)
			case 70140: // Gaseous Blight 1 Inhale (Festergut)
			case 69163: // Gaseous Blight 2 Inhale (Festergut)
			case 70468: // Gaseous Blight 2 Inhale (Festergut)
			case 70469: // Gaseous Blight 2 Inhale (Festergut)
			case 70470: // Gaseous Blight 2 Inhale (Festergut)
				// Damage increase, for some reason it does a bit less than it should.
				spellInfo->Effects[EFFECT_0].BasePoints += 650;
				break;
			case 72296:// Malleable Good Festergut
				spellInfo->Speed = 11.5;
				break;
			case 70852: // Malleable Good Professor Putricide
				spellInfo->Speed = 5;
				break;
			case 70672: case 72455: case 72832: case 72833: // Professor Putricide, Gaseous Bloat (Orange Ooze Channel) -- copied attributes from Green Ooze Channel
				spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
            case 71412: // Green Ooze Summon (Professor Putricide)
            case 71415: // Orange Ooze Summon (Professor Putricide)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
                break;
			case 70475: // Spell Giant Insect
				spellInfo->AttributesEx3 |= SPELL_ATTR3_ONLY_TARGET_PLAYERS;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_80_YARDS);
				break;
				// Leap to a Random Location
			case 70485:
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6); // 100yd
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_10_YARDS);
				spellInfo->Effects[EFFECT_0].MiscValue = 100;
				break;
				// Empowered Blood
			case 70227:
			case 70232:
				spellInfo->AreaGroupId = 2452; // Whole icc instead of Crimson Halls only, remove when area calculation is fixed
				break;
			case 71621: case 72850: case 72851: case 72852: // Create Concoction (Professor Putricide)
			case 71893: case 73120: case 73121: case 73122: // Guzzle Potions (Professor Putricide)
				spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(15); // 4 seconds
				break;
            // THIS IS HERE BECAUSE COOLDOWN ON CREATURE PROCS IS NOT IMPLEMENTED
            case 71604: // Mutated Strength (Professor Putricide)
            case 72673: // Mutated Strength (Professor Putricide)
            case 72674: // Mutated Strength (Professor Putricide)
            case 72675: // Mutated Strength (Professor Putricide)
                spellInfo->Effects[EFFECT_1].Effect = 0;
                break;
            case 72454: // Mutated Plague (Professor Putricide)
            case 72464: // Mutated Plague (Professor Putricide)
            case 72506: // Mutated Plague (Professor Putricide)
            case 72507: // Mutated Plague (Professor Putricide)
				spellInfo->AttributesEx4 |= SPELL_ATTR4_IGNORE_RESISTANCES;
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                break;
            case 70911: // Unbound Plague (Professor Putricide) (needs target selection script)
            case 72854: // Unbound Plague (Professor Putricide) (needs target selection script)
            case 72855: // Unbound Plague (Professor Putricide) (needs target selection script)
            case 72856: // Unbound Plague (Professor Putricide) (needs target selection script)
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				spellInfo->AttributesEx4 |= SPELL_ATTR4_IGNORE_RESISTANCES;
                break;
			case 70345: // Grow Stacker
				spellInfo->Effects[EFFECT_0].Amplitude = 1800;
				break;
			case 70402: // Mutated Transformation (Professor Putricide)
			case 72511: // Mutated Transformation (Professor Putricide)
			case 72512: // Mutated Transformation (Professor Putricide)
			case 72513: // Mutated Transformation (Professor Putricide)
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CANT_CRIT;
				break;
				// Cannon blast - Gunship battle. Test -temporal - remove bandera.
			case 69400:
				spellInfo->Effects[EFFECT_0].BasePoints = 2000;
				spellInfo->Effects[EFFECT_1].BasePoints = 2000;
				break;
			case 70173:
				spellInfo->Effects[EFFECT_0].BasePoints = 2000;
				spellInfo->Effects[EFFECT_1].BasePoints = 2000;
				break;
			case 70410: // Polimorph: Spider - remove the confuse in order to avoid falling through textures. Blood Prince Council trash.
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0;
				spellInfo->Effects[EFFECT_0].Effect = 0;
				break;
            case 71518: // Unholy Infusion Quest Credit (Professor Putricide)
            case 72934: // Blood Infusion Quest Credit (Blood-Queen Lana'thel)
            case 72289: // Frost Infusion Quest Credit (Sindragosa)
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // another missing radius
                break;
            case 71708: // Empowered Flare (Blood Prince Council)
            case 72785: // Empowered Flare (Blood Prince Council)
            case 72786: // Empowered Flare (Blood Prince Council)
            case 72787: // Empowered Flare (Blood Prince Council)
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_DONE_BONUS;
                break;
            case 71266: // Swarming Shadows
            case 72890: // Swarming Shadows
                spellInfo->AreaGroupId = 0; // originally, these require area 4522, which is... outside of Icecrown Citadel
                break;
            case 70602: // Corruption
            case 48278: // Paralyze
                spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
                break;
			case 71301: // Summon Dream Portal (Valithria Dreamwalker)
			case 71977: // Summon Nightmare Portal (Valithria Dreamwalker)
				spellInfo->Effects[EFFECT_0].TargetA = TARGET_DEST_DEST;
				spellInfo->Effects[EFFECT_0].TargetB = 0;
				break;
            case 70715: // Column of Frost (visual marker)
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(32); // 6 seconds (missing)
                break;
            case 71085: // Mana Void (periodic aura)
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(9); // 30 seconds (missing)
                break;
            case 72015: // Frostbolt Volley (only heroic)
            case 72016: // Frostbolt Volley (only heroic)
                spellInfo->Effects[EFFECT_2].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_40_YARDS);
                break;
            case 70936: // Summon Suppressor (needs target selection script)
                spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
                spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo();
                break;
            case 72706: // Achievement Check (Valithria Dreamwalker)
            case 71357: // Order Whelp
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS);   // 200yd
                break;
			case 70123: // Blistering Cold (Sindragosa) Blistering cold should be avoidable by hiding behind the tombs.
			case 71047:
			case 71048:
			case 71049:
				spellInfo->AttributesEx2 &= ~SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 71077: // Tail Smash (Sindragosa)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_15_YARDS);   // 200yd
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_15_YARDS);   // 200yd
				spellInfo->Effects[EFFECT_0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_CASTER_BACK);
				spellInfo->Effects[EFFECT_0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_DEST_AREA_ENEMY);
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_DEST_CASTER_BACK);
				spellInfo->Effects[EFFECT_1].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_DEST_AREA_ENEMY);
				break;
			case 69846: // Frost Bomb
				spellInfo->Speed = 0.0f;    // This spell's summon happens instantly
				break;
			case 70127: // Mystic Buffet (Sindragosa) - remove obsolete spell effect with no targets
			case 72528:
			case 72529:
			case 72530:
				spellInfo->Effects[EFFECT_1].Effect = 0;
				spellInfo->Effects[EFFECT_1].ApplyAuraName = 0;
				break;
			case 70084: // Sindragosa, Frost Aura
			case 71050:
			case 71051:
			case 71052:
				spellInfo->Attributes &= ~SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
				break;
			case 71614: // Ice Lock
				spellInfo->Mechanic = MECHANIC_STUN;
				break;
            case 72743: // Defile
                spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(22); // 45 seconds
                break;
            case 72754: // Defile
            case 73708: // Defile
            case 73709: // Defile
            case 73710: // Defile
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;
            case 69030: // Val'kyr Target Search
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;
            case 73654: // Harvest Souls
            case 74295: // Harvest Souls
            case 74296: // Harvest Souls
            case 74297: // Harvest Souls
				spellInfo->CategoryRecoveryTime = 5000;
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                spellInfo->Effects[EFFECT_2].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                break;
            case 73655: // Harvest Soul
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_DONE_BONUS;
                break;
            case 72595: // Restore Soul
            case 73650: // Restore Soul
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;
            case 74086: // Destroy Soul
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;
            case 74302: // Summon Spirit Bomb
            case 74342: // Summon Spirit Bomb
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                spellInfo->MaxAffectedTargets = 1;
                break;
            case 74341: // Summon Spirit Bomb
            case 74343: // Summon Spirit Bomb
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                spellInfo->MaxAffectedTargets = 3;
                break;
            case 73579: // Summon Spirit Bomb
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_25_YARDS); // 25yd
                break;
            case 72350: // Fury of Frostmourne
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                break;
            case 75127: // Kill Frostmourne Players
            case 72351: // Fury of Frostmourne
            case 72431: // Jump (removes Fury of Frostmourne debuff)
            case 72429: // Mass Resurrection
            case 73159: // Play Movie
            case 73582: // Trigger Vile Spirit (Inside, Heroic)
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS); // 50000yd
                break;
            case 72405: // Broken Frostmourne
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 200yd
                break;

			case 70541: // 10 normal Lich King, Infest
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				spellInfo->Effects[EFFECT_0].BasePoints = 1250;
				break;
			case 73779: // 25 normal
				spellInfo->Effects[EFFECT_0].BasePoints = 1500;
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 73780: // 10 Heroic
				spellInfo->Effects[EFFECT_0].BasePoints = 1800;
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 73781:
				spellInfo->Effects[EFFECT_0].BasePoints = 2500;
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 69409: // 10 Normal Soul Reaper
				spellInfo->Effects[EFFECT_1].BasePoints = 68000;
				break;
			case 73797: // 25 Normal Soul Reaper
				spellInfo->Effects[EFFECT_1].BasePoints = 74000;
				break;
			case 73798: // 10 Heroic Soul Reaper
				spellInfo->Effects[EFFECT_1].BasePoints = 78000;
				break;
			case 73799: // 25 Heroic Soul Reaper
				spellInfo->Effects[EFFECT_1].BasePoints = 88000;
				break;
			case 70337: // Lich King, Necrotic Plague
			case 73912:
			case 73913:
			case 73914:
			case 70338:
			case 73785:
			case 73786:
			case 73787:
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 69099: // Ice Pulse 10n
			case 73776: // Ice Pulse 25n
			case 73777: // Ice Pulse 10h
			case 73778: // Ice Pulse 25h
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CANT_CRIT;
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_IGNORE_RESISTANCES;
				break;
			case 72376: // Raise Dead
				spellInfo->MaxAffectedTargets = 4;
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_50000_YARDS);   // 50000yd
				break;
			case 71809: // Jump
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(5); // 40yd
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_10_YARDS); // 10yd
				spellInfo->Effects[EFFECT_0].MiscValue = 190;
				break;
			case 73540: // Summon Shadow Trap
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(3);          // 60 seconds
				break;
			case 73530: // Shadow Trap (visual)
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(28);          // 5 seconds
				break;
			case 73529: // Shadow Trap
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_11_YARDS);   // 10yd
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_11_YARDS);   // 10yd
				break;
			case 74282: // Shadow Trap (searcher)
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_5_YARDS);   // 3yd
				break;
            case 69200: // Summon Raging Spirit, casted by Lich King
                spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
                break;
			case 69198: // Raging Spirit Visual
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(13);             // 50000yd
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 72762: // Defile
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(559); // 53 seconds
				spellInfo->ExcludeCasterAuraSpell = 0;
				spellInfo->Attributes |= SPELL_ATTR0_UNAFFECTED_BY_INVULNERABILITY;
				spellInfo->AttributesEx6 |= (SPELL_ATTR6_CAN_TARGET_INVISIBLE | SPELL_ATTR6_CAN_TARGET_UNTARGETABLE);
				break;
			case 72130: // Spirit Activate Visual Lady Deathwhisper
				spellInfo->CastTimeEntry = 0; // 1500ms
				break;
			case 71001: // Death and decay (Lady Deathwhisper)
				spellInfo->Effects[EFFECT_0].BasePoints = 6000;
				break;
			case 72108: // Death and decay (Lady Deathwhisper)
				spellInfo->Effects[EFFECT_0].BasePoints = 8000;
				break;
			case 72109: // Death and decay (Lady Deathwhisper)
				spellInfo->Effects[EFFECT_0].BasePoints = 8500;
				break;
			case 72110: // Death and decay (Lady Deathwhisper)
				spellInfo->Effects[EFFECT_0].BasePoints = 9500;
				break;
			case 71420: // Frostbolt (Lady Deathwhisper)
			case 72007:
			case 72501:
			case 72502:
			case 71254: // Shadow Bolt (Lady Deathwhisper)
			case 72008: // Shadow Bolt (Lady Deathwhisper)
			case 72503: // Shadow Bolt (Lady Deathwhisper)
			case 72504: // Shadow Bolt (Lady Deathwhisper)
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 64652: //Rotting frost giant Stomp
				spellInfo->Effects[EFFECT_0].Effect = 0;
				spellInfo->Effects[EFFECT_0].ApplyAuraName = 0;
				break;
			/*case 70173: // Cannon Blast - Gunship
			case 69400: // Cannon Blast - Gunship
				spellInfo->Effects[EFFECT_0].BasePoints = 1499;
				spellInfo->Effects[EFFECT_1].BasePoints = 1499;
				break;*/
            case 6918: // Summon Snufflenose (Quest: Blueleaf Tubers).
                spellInfo->RequiresSpellFocus = 0;
                break;
			case 69399: // Cannon Blast - Gunship
			case 70172: // Cannon Blast - Gunship
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(174); // 1000 Yards
				spellInfo->Speed = 0.0f;
				break;
			case 69401: // Incinerating Blast - Gunship
			case 70174: // Incinerating Blast - Gunship
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(174); // 1000 Yards
				spellInfo->Speed = 0.0f;
				break;
			case 69660: // Burning Pitch - Gunship
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 69188: // Rocket Pack
			case 73077: // Rocket Pack
				spellInfo->Attributes |= SPELL_ATTR0_CANT_CANCEL;
				break;
			case 71157: // ICC - Infected Wound by Zombies before Putricide
				spellInfo->StackAmount = 99;
				break;
			// Onyxia ICC.

				//////////////////////////////////////////
				////////// THE FORGE OF SOULS
				//////////////////////////////////////////
				// Soul Sickness (69131)
			case 69131:
				spellInfo->Effects[0].ApplyAuraName = SPELL_AURA_PERIODIC_TRIGGER_SPELL;
				spellInfo->Effects[0].Amplitude = 8000;
				spellInfo->Effects[0].TriggerSpell = 69133;
				break;
				// Phantom Blast (68982,70322)
			case 68982:
			case 70322:
				spellInfo->InterruptFlags |= SPELL_INTERRUPT_FLAG_INTERRUPT;
				break;
				//////////////////////////////////////////
				////////// PIT OF SARON
				//////////////////////////////////////////
				// Empowered Blizzard
			case 70131:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DEST);
				break;
				// Ice Lance Volley
			case 70464:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_SRC_CASTER);
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENTRY);
				spellInfo->Effects[0].RadiusEntry = sSpellRadiusStore.LookupEntry(25);
				break;
				// Multi-Shot
			case 70513:
				// Shriek of the Highborne
			case 59514:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CONE_ENTRY);
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(0);
				break;
				// Icicle
			case 69428:
			case 69426:
				spellInfo->InterruptFlags = 0;
				spellInfo->AuraInterruptFlags = 0;
				spellInfo->ChannelInterruptFlags = 0;
				break;
				// Jaina's Call
			case 70525:
				// Call of Sylvanas
			case 70639:
				spellInfo->Effects[0].Effect = 0;
				spellInfo->Effects[1].Effect = 0;
				spellInfo->Effects[2].TargetA = SpellImplicitTargetInfo(TARGET_SRC_CASTER);
				spellInfo->Effects[2].TargetB = SpellImplicitTargetInfo(TARGET_UNIT_SRC_AREA_ENTRY);
				spellInfo->Effects[2].RadiusEntry = sSpellRadiusStore.LookupEntry(30); // 500yd
				break;
				// Frost Nova
			case 68198:
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(13);
				spellInfo->Targets |= TARGET_FLAG_DEST_LOCATION;
				break;
				// Blight
			case 69604:
			case 70286:
				spellInfo->MaxAffectedTargets = 1;
				spellInfo->AttributesEx3 |= (SPELL_ATTR3_IGNORE_HIT_RESULT | SPELL_ATTR3_ONLY_TARGET_PLAYERS);
				break;
				// Chilling Wave
			case 68778:
			case 70333:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_TARGET_ENEMY);
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(0);
				break;
				// Permafrost
			case 68786:
			case 70336:
				spellInfo->AttributesEx3 |= (SPELL_ATTR3_IGNORE_HIT_RESULT | SPELL_ATTR3_ONLY_TARGET_PLAYERS);
				spellInfo->Effects[2].Effect = SPELL_EFFECT_DUMMY;
				break;
				// Pursuit:
			case 68987:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(0);
				spellInfo->Effects[1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
				spellInfo->Effects[1].TargetB = SpellImplicitTargetInfo(0);
				spellInfo->Effects[2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);
				spellInfo->Effects[2].TargetB = SpellImplicitTargetInfo(0);
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(6); // 100yd
				spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
				break;
			case 69029:
			case 70850:
				spellInfo->Effects[2].Effect = 0;
				break;
				// Explosive Barrage:
			case 69263:
				spellInfo->Effects[0].ApplyAuraName = SPELL_AURA_MOD_STUN;
				break;				
                // Hack and Slash - Hack, need review
            case 13964:
                spellInfo->ProcChance = 8;                
                break;
                // Overlord's Brand:
			case 69172:
				spellInfo->ProcFlags = DONE_HIT_PROC_FLAG_MASK & ~PROC_FLAG_DONE_PERIODIC;
				spellInfo->ProcChance = 100;
				break;
				// Icy Blast:
			case 69232:
				spellInfo->Effects[1].TriggerSpell = 69238;
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 69233:
			case 69646:
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
			case 69238:
			case 69628:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DEST);
				spellInfo->Effects[0].TargetB = SpellImplicitTargetInfo(TARGET_DEST_DYNOBJ_NONE);
				spellInfo->Effects[1].TargetA = SpellImplicitTargetInfo(TARGET_DEST_DEST);
				spellInfo->Effects[1].TargetB = SpellImplicitTargetInfo(TARGET_DEST_DYNOBJ_NONE);
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
				// Hoarfrost:
			case 69246:
			case 69245:
			case 69645:
				spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
				break;
				// Devour Humanoid:
			case 69503:
				spellInfo->ChannelInterruptFlags |= 0;
				spellInfo->AuraInterruptFlags = AURA_INTERRUPT_FLAG_MOVE | AURA_INTERRUPT_FLAG_TURNING;
				break;
				//////////////////////////////////////////
				////////// HALLS OF REFLECTION
				//////////////////////////////////////////
				// Falric: Defiling Horror
			case 72435: // Defiling Horror
			case 72452: // Defiling Horror
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 60yd
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_200_YARDS); // 60yd
				break;
				break;
				// Frostsworn General - Throw Shield
			case 69222:
			case 73076:
				spellInfo->Effects[2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ENEMY);
				break;
				// Halls of Reflection Clone
			case 69828:
				spellInfo->Effects[1].Effect = 0;
				spellInfo->Effects[2].Effect = 0;
				break;
				// Summon Ice Wall
			case 69768:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
				break;
			case 69767:
				spellInfo->Effects[0].TargetA = SpellImplicitTargetInfo(TARGET_DEST_TARGET_ANY);
				spellInfo->Effects[2].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_TARGET_ANY);
				break;
				// Essence of the Captured
			case 73035:
			case 70719:
				spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(13);
				break;
			case 69818: // Summon Ghouls
				spellInfo->AttributesEx &= ~SPELL_ATTR1_CHANNELED_2;
				break;
				// Achievement Check

				// Onyxia's Lair, Onyxia, Eruption:

			case 68960:// Ignite Weapon radius.
			case 68963:
				spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_7_YARDS); // 25yd
				break;
			case 17731:
			case 69294:
				spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_DUMMY;
				spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_18_YARDS);; // 18yd instead of 13yd to make sure all cracks erupt
				break;
				// Onyxia's Lair, Onyxia, Breath:
				// TODO: fix it by IconId / SpellVisual
			case 18576: case 18578: case 18579: case 18580:
			case 18581: case 18582: case 18583: case 18609: case 18611: case 18612: case 18613: case 18614:
			case 18615: case 18616: case 18584: case 18585: case 18586: case 18587: case 18588: case 18589:
			case 18590: case 18591: case 18592: case 18593: case 18594: case 18595: case 18564: case 18565:
			case 18566: case 18567: case 18568: case 18569: case 18570: case 18571: case 18572: case 18573:
			case 18574: case 18575: case 18596: case 18597: case 18598: case 18599: case 18600: case 18601:
			case 18602: case 18603: case 18604: case 18605: case 18606: case 18607: case 18617: case 18619:
			case 18620: case 18621: case 18622: case 18623: case 18624: case 18625: case 18626: case 18627:
			case 18628: case 18618: case 18351: case 18352: case 18353: case 18354: case 18355: case 18356:
			case 18357: case 18358: case 18359: case 18360: case 18361: case 17086: case 17087: case 17088:
			case 17089: case 17090: case 17091: case 17092: case 17093: case 17094: case 17095: case 17097:
			case 22267: case 22268: case 21132: case 21133: case 21135: case 21136: case 21137: case 21138:
			case 21139:
				spellInfo->DurationEntry = sSpellDurationStore.LookupEntry(328); // 250ms
				spellInfo->Effects[EFFECT_1].TargetA = SpellImplicitTargetInfo(TARGET_UNIT_CASTER);

				spellInfo->Effects[EFFECT_1].Effect = SPELL_EFFECT_APPLY_AURA;
				spellInfo->Effects[EFFECT_1].ApplyAuraName = SPELL_AURA_PERIODIC_TRIGGER_SPELL;
				spellInfo->Effects[EFFECT_1].Amplitude = ((spellInfo->CastTimeEntry == sSpellCastTimesStore.LookupEntry(170)) ? 50 : 215);
				break;
            case 71940: // Twisted Nightmare
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_DONE_BONUS;
                spellInfo->AttributesEx6 |= SPELL_ATTR6_NO_DONE_PCT_DAMAGE_MODS;
                break;
            // ENDOF ICECROWN CITADEL SPELLS
            //
            // RUBY SANCTUM SPELLS
            //
				// That's Abominable (13264)(13276)(13288)(13289)
			case 59565:
				spellInfo->Effects[EFFECT_0].MiscValueB = 1721; // controlable guardian
				break;
            case 74799: // Soul Consumption
                spellInfo->Effects[EFFECT_1].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_12_YARDS);
                break;
            case 74769: // Twilight Cutter
            case 77844: // Twilight Cutter
            case 77845: // Twilight Cutter
            case 77846: // Twilight Cutter
                spellInfo->Effects[EFFECT_0].RadiusEntry = sSpellRadiusStore.LookupEntry(EFFECT_RADIUS_100_YARDS); // 100yd
                break;
            case 75509: // Twilight Mending
                spellInfo->AttributesEx6 |= SPELL_ATTR6_CAN_TARGET_INVISIBLE;
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                break;
            case 13812: // Explosive Trap Effect
            case 14314: // Explosive Trap Effect
            case 14315: // Explosive Trap Effect
            case 27026: // Explosive Trap Effect
            case 43446: // Explosive Trap Effect
            case 49064: // Explosive Trap Effect
            case 49065: // Explosive Trap Effect
                spellInfo->AttributesEx6 |= SPELL_ATTR6_CAN_TARGET_INVISIBLE;
                break;
                // Explosive Shot (trigger)
            case 53352:
                spellInfo->AttributesEx3 |= SPELL_ATTR3_IGNORE_HIT_RESULT;
                break;
            case 75888: // Awaken Flames
            case 75889: // Awaken Flames
                spellInfo->AttributesEx |= SPELL_ATTR1_CANT_TARGET_SELF;
                break;
            // ENDOF RUBY SANCTUM SPELLS
            //
            // EYE OF ETERNITY SPELLS
            // All spells below work even without these changes. The LOS attribute is due to problem
            // from collision between maps & gos with active destroyed state.
            case 57473: // Arcane Storm bonus explicit visual spell
            case 57431: // Summon Static Field
            case 56091: // Flame Spike (Wyrmrest Skytalon)
            case 56092: // Engulf in Flames (Wyrmrest Skytalon)
            case 57090: // Revivify (Wyrmrest Skytalon)
            case 57143: // Life Burst (Wyrmrest Skytalon)
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS;
                break;
            // This would never crit on retail and it has attribute for SPELL_ATTR3_NO_DONE_BONUS because is handled from player,
            // until someone figures how to make scions not critting without hack and without making them main casters this should stay here.
            case 63934: // Arcane Barrage (cast by players and NONMELEEDAMAGELOG with caster Scion of Eternity (original caster)).
                spellInfo->AttributesEx2 |= SPELL_ATTR2_CANT_CRIT;
                break;
            // ENDOF EYE OF ETERNITY SPELLS
            //
            // OCULUS SPELLS
            // The spells below are here because their effect 1 is giving warning due to
            // triggered spell not found in any dbc and is missing from encounter source* of data.
            // Even judged as clientside these spells can't be guessed for* now.
            case 49462: // Call Ruby Drake
            case 49461: // Call Amber Drake
            case 49345: // Call Emerald Drake
                spellInfo->Effects[EFFECT_1].Effect = 0;
                break;
            // ENDOF OCULUS SPELLS
            //
            case 40055: // Introspection
            case 40165: // Introspection
            case 40166: // Introspection
            case 40167: // Introspection
                spellInfo->Attributes |= SPELL_ATTR0_NEGATIVE_1;
                break;
            case 45524: // Chains of Ice
                spellInfo->Effects[EFFECT_2].TargetA = SpellImplicitTargetInfo();
                break;
            case 2378: // Minor Fortitude
                spellInfo->ManaCost = 0;
                spellInfo->ManaPerSecond = 0;
                break;
            case 24314: // Threatening Gaze
                spellInfo->AuraInterruptFlags |= AURA_INTERRUPT_FLAG_CAST | AURA_INTERRUPT_FLAG_MOVE | AURA_INTERRUPT_FLAG_JUMP;
                break;
            case 45257: // Using Steam Tonk Controller
            case 45440: // Steam Tonk Controller
            case 60256: // Collect Sample
            case 70900: // Dark Transformation
            case 70901: // Dark Empowerment
            case 51469: // Frenzyheart's Fury
            case 54897: // Flaming Arrow
            case 57853: // Master Summoner's Staff
                // Crashes client on pressing ESC
                spellInfo->AttributesEx4 &= ~SPELL_ATTR4_CAN_CAST_WHILE_CASTING;
                break;
            case 49352: // Crashin' Thrashin' Racer Controller
            case 75111: // Blue Crashin' Thrashin' Racer Controller
                spellInfo->AttributesEx4 &= ~SPELL_ATTR4_CAN_CAST_WHILE_CASTING;
                spellInfo->CastTimeEntry = sSpellCastTimesStore.LookupEntry(1);
                break;
            // ISLE OF CONQUEST SPELLS
            //
            case 66551: // Teleport
                spellInfo->RangeEntry = sSpellRangeStore.LookupEntry(13); // 50000yd
                break;
            // ENDOF ISLE OF CONQUEST SPELLS
            //
			case 28374: // Gluth's Decimate
			case 28375:
			case 54426: // Gluth's Decimate
				spellInfo->AttributesEx |= SPELL_ATTR1_CANT_TARGET_SELF;
				spellInfo->AttributesCu |= SPELL_ATTR0_CU_IGNORE_ARMOR;
                spellInfo->AttributesEx3 |= SPELL_ATTR3_NO_INITIAL_AGGRO;
				break;
			case 29307: // Infected Wounds (Zombie Chow)
				spellInfo->AttributesEx3 |= SPELL_ATTR3_STACK_FOR_DIFF_CASTERS;
				break;
			case 59059:
				spellInfo->AttributesEx4 &= ~SPELL_ATTR4_CAN_CAST_WHILE_CASTING;
				break;
			case 38544: // The Smallest Creatures (10720)
				spellInfo->Effects[EFFECT_0].MiscValueB = 427;
				spellInfo->Effects[EFFECT_0].TargetA = 1;
				spellInfo->Effects[EFFECT_1].Effect = 0;
                break;
            // The Sum is Greater than the Parts (13043) - Chained Grip
            case 60540:
                spellInfo->Effects[EFFECT_0].MiscValue = 300;
                break;
            case 69683: // Lil' K.T. Passive
            case 40619: // Sleep Willy's laser
                spellInfo->Effects[EFFECT_0].Amplitude = 60000;
                break;
            default:
                break;
        }

        switch (spellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_HUNTER:
                // Silencing Shot / Scatter Shot
                 if (spellInfo->Id==34490)
                    spellInfo->Speed = 0; // instant
                break;
            case SPELLFAMILY_PALADIN:
                // Seals of the Pure should affect Seal of Righteousness
                if (spellInfo->SpellIconID == 25 && spellInfo->HasAttribute(SPELL_ATTR0_PASSIVE))
                    spellInfo->Effects[EFFECT_0].SpellClassMask[1] |= 0x20000000;
                break;
            case SPELLFAMILY_DEATHKNIGHT:
                // Icy Touch - extend FamilyFlags (unused value) for Sigil of the Frozen Conscience to use
                if (spellInfo->SpellIconID == 2721 && spellInfo->SpellFamilyFlags[0] & 0x2)
                    spellInfo->SpellFamilyFlags[0] |= 0x40;
                break;
        }
    }

    if (SummonPropertiesEntry* properties = const_cast<SummonPropertiesEntry*>(sSummonPropertiesStore.LookupEntry(121)))
        properties->Type = SUMMON_TYPE_TOTEM;
    if (SummonPropertiesEntry* properties = const_cast<SummonPropertiesEntry*>(sSummonPropertiesStore.LookupEntry(647))) // 52893
        properties->Type = SUMMON_TYPE_TOTEM;

    TC_LOG_INFO("server.loading", ">> Loaded SpellInfo corrections in %u ms", GetMSTimeDiffToNow(oldMSTime));
}
