/*
* Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
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

#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "PoolMgr.h"
#include "Group.h"
#include "icecrown_citadel.h"
#include "SpellInfo.h"
#include "Player.h"

enum ScriptTexts
{
    // Lady Deathwhisper
    SAY_INTRO_1 = 0,
    SAY_INTRO_2 = 1,
    SAY_INTRO_3 = 2,
    SAY_INTRO_4 = 3,
    SAY_INTRO_5 = 4,
    SAY_INTRO_6 = 5,
    SAY_INTRO_7 = 6,
    SAY_AGGRO = 7,
    SAY_PHASE_2 = 8,
    EMOTE_PHASE_2 = 9,
    SAY_DOMINATE_MIND = 10,
    SAY_DARK_EMPOWERMENT = 11,
    SAY_DARK_TRANSFORMATION = 12,
    SAY_ANIMATE_DEAD = 13,
    SAY_KILL = 14,
    SAY_BERSERK = 15,
    SAY_DEATH = 16,

    // Darnavan
    SAY_DARNAVAN_AGGRO = 0,
    SAY_DARNAVAN_RESCUED = 1,
};

enum Spells
{
    // Lady Deathwhisper
    SPELL_SHADOW_CHANNELING = 43897, // during intro
    SPELL_MANA_BARRIER = 70842,
    SPELL_DEATH_AND_DECAY = 71001,
    SPELL_DOMINATE_MIND_25 = 71289,
    SPELL_SHADOW_BOLT = 71254,
    SPELL_DARK_MARTYRDOM_T = 70897,
    SPELL_DARK_TRANSFORMATION_T = 70895,
    SPELL_DARK_EMPOWERMENT_T = 70896,
    SPELL_FROSTBOLT = 71420,
    SPELL_FROSTBOLT_VOLLEY = 72905,
    SPELL_TOUCH_OF_INSIGNIFICANCE = 71204,
    SPELL_SUMMON_SHADE = 71363,

    // Fanatics
    SPELL_NECROTIC_STRIKE = 70659,
    SPELL_SHADOW_CLEAVE = 70670,
    SPELL_VAMPIRIC_MIGHT = 70674,
    SPELL_DARK_MARTYRDOM_FANATIC = 71236,
    SPELL_FANATIC_S_DETERMINATION = 71235,
    SPELL_DARK_TRANSFORMATION = 70900,

    //  Adherents
    SPELL_FROST_FEVER = 67767,
    SPELL_DEATHCHILL_BOLT = 70594,
    SPELL_DEATHCHILL_BLAST = 70906,
    SPELL_CURSE_OF_TORPOR = 71237,
    SPELL_SHORUD_OF_THE_OCCULT = 70768,
    SPELL_DARK_MARTYRDOM_ADHERENT = 70903,
    SPELL_ADHERENT_S_DETERMINATION = 71234,
    SPELL_DARK_EMPOWERMENT = 70901,

    // Vengeful Shade
    SPELL_VENGEFUL_BLAST_PASSIVE = 71494,
    SPELL_VENGEFUL_BLAST_10N = 71544,
    SPELL_VENGEFUL_BLAST_25N = 72010,
    SPELL_VENGEFUL_BLAST_10H = 72011,
    SPELL_VENGEFUL_BLAST_25H = 72012,

    // Darnavan
    SPELL_BLADESTORM = 65947,
    SPELL_CHARGE = 65927,
    SPELL_INTIMIDATING_SHOUT = 65930,
    SPELL_MORTAL_STRIKE = 65926,
    SPELL_SHATTERING_THROW = 65940,
    SPELL_SUNDER_ARMOR = 65936,

    // misc
    SPELL_FULL_HOUSE = 72827, // achievement
    SPELL_TELEPORT_VISUAL = 52096, // used by adds

    //spells for chained
    //warlock
    SPELL_CURSE_OF_AGONY_LD = 47864,
    SPELL_SHADOW_BOLT_LD = 47809,
    //shaman
    SPELL_EARTH_SHOCK_LD = 49231,
    SPELL_HEALING_WAVE_LD = 49273,
    //mage
    SPELL_FROST_FIREBOLT_LD = 47610,
    SPELL_ARCANE_MISSILES_LD = 42846,
    //rogue
    SPELL_HEMORRHAGE_LD = 48660,
    SPELL_MUTILATE_LD = 48666,
    //paladin
    SPELL_HOLY_SHOCK_LD = 48825,
    SPELL_HAMMER_OF_JUSTICE_LD = 10308,
    //priest
    SPELL_VAMPIRIC_TOUCH_LD = 48160,
    SPELL_RENEW_LD = 48068,
    //hunter
    SPELL_MULTI_SHOT_LD = 49048,
    SPELL_VOLLEY_LD = 58434,
    //warrior
    SPELL_BLADESTORM_LD = 46924,
    SPELL_CLEAVE_LD = 47520,
    SPELL_WHIRLWIND_LD = 1680,
    SPELL_SUNDER_ARMOR_LD = 7386,
    //druid
    SPELL_MOONFIRE_LD = 48463,
    SPELL_LIFEBLOOM_LD = 48451,
    //death knight
    SPELL_PLAGUE_STRIKE_LD = 49921,
    SPELL_HOWLING_BLAST_LD = 51411
};

enum EventTypes
{
    // Lady Deathwhisper:
    EVENT_INTRO_2 = 1,
    EVENT_INTRO_3,
    EVENT_INTRO_4,
    EVENT_INTRO_5,
    EVENT_INTRO_6,
    EVENT_INTRO_7,

    EVENT_BERSERK,
    EVENT_SPELL_DEATH_AND_DECAY,
    EVENT_SPELL_DOMINATE_MIND_25,

    // Phase 1:
    EVENT_SPELL_SHADOW_BOLT,
    EVENT_SUMMON_WAVE_P1,
    EVENT_REANIMATE_CULTIST,
    EVENT_EMPOWER_CULTIST,

    // Phase 2:
    EVENT_SPELL_FROSTBOLT,
    EVENT_SPELL_FROSTBOLT_VOLLEY,
    EVENT_SPELL_TOUCH_OF_INSIGNIFICANCE,
    EVENT_SPELL_SUMMON_SHADE,
    EVENT_SUMMON_WAVE_P2,

    // Shared adds events:
    EVENT_SPELL_CULTIST_DARK_MARTYRDOM,
    EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL,

    // Cult Fanatic:
    EVENT_SPELL_FANATIC_NECROTIC_STRIKE,
    EVENT_SPELL_FANATIC_SHADOW_CLEAVE,
    EVENT_SPELL_FANATIC_VAMPIRIC_MIGHT,

    // Cult Adherent:
    EVENT_SPELL_ADHERENT_FROST_FEVER,
    EVENT_SPELL_ADHERENT_DEATHCHILL,
    EVENT_SPELL_ADHERENT_CURSE_OF_TORPOR,
    EVENT_SPELL_ADHERENT_SHORUD_OF_THE_OCCULT,

    // Darnavan:
    EVENT_DARNAVAN_BLADESTORM,
    EVENT_DARNAVAN_CHARGE,
    EVENT_DARNAVAN_INTIMIDATING_SHOUT,
    EVENT_DARNAVAN_MORTAL_STRIKE,
    EVENT_DARNAVAN_SHATTERING_THROW,
    EVENT_DARNAVAN_SUNDER_ARMOR,

    // Special
    EVENT_DOMINATE_MIND_CAST_AI
};

enum WarriorTalentChecks
{
    SPELL_WARRIOR_SHOCKWAVE_LD = 46968,
    SPELL_WARRIOR_TITANS_GRIP_LD = 46917,
    SPELL_WARRIOR_BLADESTORM_LD = 46924
};

enum Phases
{
    PHASE_ALL = 0,
    PHASE_INTRO = 1,
    PHASE_ONE = 2,
    PHASE_TWO = 3,

    PHASE_INTRO_MASK = 1 << (PHASE_INTRO - 1),
    PHASE_ONE_MASK = 1 << (PHASE_ONE - 1),
    PHASE_TWO_MASK = 1 << (PHASE_TWO - 1),
};

enum Data
{
    DATA_PHASE = 0,
};

enum DeprogrammingData
{
    NPC_DARNAVAN_10 = 38472,
    NPC_DARNAVAN_25 = 38485,
    NPC_DARNAVAN_CREDIT_10 = 39091,
    NPC_DARNAVAN_CREDIT_25 = 39092,

    ACTION_COMPLETE_QUEST = -384720,
    POINT_DESPAWN = 384721,
};

#define NPC_DARNAVAN        RAID_MODE<uint32>(NPC_DARNAVAN_10, NPC_DARNAVAN_25, NPC_DARNAVAN_10, NPC_DARNAVAN_25)
#define NPC_DARNAVAN_CREDIT RAID_MODE<uint32>(NPC_DARNAVAN_CREDIT_10, NPC_DARNAVAN_CREDIT_25, NPC_DARNAVAN_CREDIT_10, NPC_DARNAVAN_CREDIT_25)
#define QUEST_DEPROGRAMMING RAID_MODE<uint32>(QUEST_DEPROGRAMMING_10, QUEST_DEPROGRAMMING_25, QUEST_DEPROGRAMMING_10, QUEST_DEPROGRAMMING_25)

#define GUID_CULTIST    1

uint32 const SummonEntries[2] = { NPC_CULT_FANATIC, NPC_CULT_ADHERENT };
Position const SummonPositions[7] =
{
    { -578.7066f, 2154.167f, 51.01529f, 1.692969f }, // 1 Left Door 1 (Cult Fanatic)
    { -598.9028f, 2155.005f, 51.01530f, 1.692969f }, // 2 Left Door 2 (Cult Adherent)
    { -619.2864f, 2154.460f, 51.01530f, 1.692969f }, // 3 Left Door 3 (Cult Fanatic)
    { -578.6996f, 2269.856f, 51.01529f, 4.590216f }, // 4 Right Door 1 (Cult Adherent)
    { -598.9688f, 2269.264f, 51.01529f, 4.590216f }, // 5 Right Door 2 (Cult Fanatic)
    { -619.4323f, 2268.523f, 51.01530f, 4.590216f }, // 6 Right Door 3 (Cult Adherent)
    { -524.2480f, 2211.920f, 62.90960f, 3.141592f }, // 7 Upper (Random Cultist)
};

class DaranavanMoveEvent : public BasicEvent
{
public:
    DaranavanMoveEvent(Creature& darnavan) : _darnavan(darnavan) { }

    bool Execute(uint64 /*time*/, uint32 /*diff*/) override
    {
        _darnavan.GetMotionMaster()->MovePoint(POINT_DESPAWN, SummonPositions[6]);
        return true;
    }

private:
    Creature& _darnavan;
};

// predicate function to select not charmed target
struct NotCharmedTargetSelector
{
    NotCharmedTargetSelector() {}

    bool operator() (Unit* target) const
    {
        return (!target->IsCharmed());
    }
};

struct IsNotTankTargetSelector
{
    IsNotTankTargetSelector() { }

    bool operator() (Unit* target) const
    {
        return (target->GetTypeId() == TYPEID_PLAYER && !target->ToPlayer()->IsTank() && !target->HasAura(SPELL_DOMINATE_MIND_25));
    }
};

class boss_lady_deathwhisper : public CreatureScript
{
public:
    boss_lady_deathwhisper() : CreatureScript("boss_lady_deathwhisper") { }

    struct boss_lady_deathwhisperAI : public BossAI
    {
        boss_lady_deathwhisperAI(Creature* creature) : BossAI(creature, DATA_LADY_DEATHWHISPER), _dominateMindCount(RAID_MODE<uint8>(0, 1, 1, 3)), _introDone(false), _darnavanGUID(ObjectGuid::Empty)
        {
        }

        void Reset()
        {
            if (Creature* darnavan = ObjectAccessor::GetCreature(*me, _darnavanGUID))
                darnavan->DespawnOrUnsummon();
            _waveCounter = 0;
            DominadeCounter = 0;
            _reanimationQueue.clear();
            _Reset();
            me->SetPower(POWER_MANA, me->GetMaxPower(POWER_MANA));
            events.SetPhase(PHASE_ONE);
            me->CastSpell(me, SPELL_SHADOW_CHANNELING, false);
        }

        void AttackStart(Unit* victim)
        {
            if (victim && me->Attack(victim, true) && !(events.GetPhaseMask() & PHASE_ONE_MASK))
                me->GetMotionMaster()->MoveChase(victim);
        }

        void EnterCombat(Unit* who)
        {
            if (!instance->CheckRequiredBosses(DATA_LADY_DEATHWHISPER, who->ToPlayer()))
            {
                EnterEvadeMode();
                instance->DoCastSpellOnPlayers(LIGHT_S_HAMMER_TELEPORT);
                return;
            }

            me->setActive(true);
            me->CallForHelp(200.0f);
            DoZoneInCombat();

            events.Reset();
            events.SetPhase(PHASE_ONE);
            events.ScheduleEvent(EVENT_BERSERK, 600000);
            events.ScheduleEvent(EVENT_SPELL_DEATH_AND_DECAY, 10000);
            if (GetDifficulty() != RAID_DIFFICULTY_10MAN_NORMAL)
                events.ScheduleEvent(EVENT_SPELL_DOMINATE_MIND_25, 27000);
            events.ScheduleEvent(EVENT_SPELL_SHADOW_BOLT, urand(5500, 6000), 0, PHASE_ONE);
            events.ScheduleEvent(EVENT_SUMMON_WAVE_P1, 5000, 0, PHASE_ONE);
            events.ScheduleEvent(EVENT_EMPOWER_CULTIST, urand(20000, 30000), 0, PHASE_ONE);

            Talk(SAY_AGGRO);
            me->RemoveAurasDueToSpell(SPELL_SHADOW_CHANNELING);
            me->CastSpell(me, SPELL_MANA_BARRIER, true);

            instance->SetBossState(DATA_LADY_DEATHWHISPER, IN_PROGRESS);
        }

        void DamageTaken(Unit*, uint32& damage)
        {
            if (events.GetPhaseMask() & PHASE_ONE_MASK && damage >= me->GetPower(POWER_MANA))
            {
                // reset threat
                ThreatContainer::StorageType const& threatlist = me->getThreatManager().getThreatList();
                for (ThreatContainer::StorageType::const_iterator itr = threatlist.begin(); itr != threatlist.end(); ++itr)
                {
                    Unit* unit = ObjectAccessor::GetUnit((*me), (*itr)->getUnitGuid());

                    if (unit && DoGetThreat(unit))
                        DoModifyThreatPercent(unit, -100);
                }

                Talk(SAY_PHASE_2);
                Talk(EMOTE_PHASE_2);
                DoStartMovement(me->GetVictim());
                damage -= me->GetPower(POWER_MANA);
                me->SetPower(POWER_MANA, 0);
                me->RemoveAurasDueToSpell(SPELL_MANA_BARRIER);
                events.SetPhase(PHASE_TWO);
                events.ScheduleEvent(EVENT_SPELL_FROSTBOLT, urand(10000, 12000), 0, PHASE_TWO);
                events.ScheduleEvent(EVENT_SPELL_FROSTBOLT_VOLLEY, urand(19000, 21000), 0, PHASE_TWO);
                events.ScheduleEvent(EVENT_SPELL_TOUCH_OF_INSIGNIFICANCE, urand(6000, 9000), 0, PHASE_TWO);
                events.ScheduleEvent(EVENT_SPELL_SUMMON_SHADE, urand(12000, 15000), 0, PHASE_TWO);
                events.CancelEvent(EVENT_EMPOWER_CULTIST);
                if (IsHeroic())
                    events.ScheduleEvent(EVENT_SUMMON_WAVE_P2, 45000, 0, PHASE_TWO);
            }
        }

        void UpdateAI(uint32 diff)
        {
            if ((!UpdateVictim() && !(events.GetPhaseMask() & PHASE_INTRO_MASK)) || !CheckInRoom())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING) && !(events.GetPhaseMask() & PHASE_INTRO_MASK))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 0:
                    break;
                case EVENT_INTRO_2:
                    Talk(SAY_INTRO_2);
                    events.CancelEvent(EVENT_INTRO_2);
                    break;
                case EVENT_INTRO_3:
                    Talk(SAY_INTRO_3);
                    events.CancelEvent(EVENT_INTRO_3);
                    break;
                case EVENT_INTRO_4:
                    Talk(SAY_INTRO_4);
                    events.CancelEvent(EVENT_INTRO_4);
                    break;
                case EVENT_INTRO_5:
                    Talk(SAY_INTRO_5);
                    events.CancelEvent(EVENT_INTRO_5);
                    break;
                case EVENT_INTRO_6:
                    Talk(SAY_INTRO_6);
                    events.CancelEvent(EVENT_INTRO_6);
                    break;
                case EVENT_INTRO_7:
                    Talk(SAY_INTRO_7);
                    events.CancelEvent(EVENT_INTRO_7);
                    break;
                case EVENT_BERSERK:
                    me->CastSpell(me, SPELL_BERSERK, true);
                    Talk(SAY_BERSERK);
                    events.CancelEvent(EVENT_BERSERK);
                    break;
                case EVENT_SPELL_DEATH_AND_DECAY:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                        me->CastSpell(target, SPELL_DEATH_AND_DECAY, false);
                    events.RescheduleEvent(EVENT_SPELL_DEATH_AND_DECAY, urand(22000, 30000));
                    break;
                case EVENT_SPELL_DOMINATE_MIND_25:
                {

                    std::list<HostileReference*> t_list = me->getThreatManager().getThreatList();
                    ObjectGuid _offTankGUID = ObjectGuid::Empty;
                    uint32 counter = 1;
                    for (std::list<HostileReference*>::const_iterator itr = t_list.begin(); itr!= t_list.end(); ++itr)
                    {
                        if (counter == 2)
                        {
                            Unit* offtank = ObjectAccessor::GetUnit(*me, (*itr)->getUnitGuid());

                            if (offtank && offtank->GetTypeId() == TYPEID_PLAYER)
                                _offTankGUID = offtank->GetGUID();

                            break;
                        }
                        counter++;
                    }


                    std::vector<Player*> validPlayers;
                    Map::PlayerList const &pList = me->GetMap()->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = pList.begin(); itr != pList.end(); ++itr)
                        if (Player* plr = itr->GetSource())
                            if (plr->IsAlive() && !plr->IsGameMaster() && plr->GetExactDist2dSq(me) < (150.0f * 150.0f))
                                if ((!me->GetVictim() || me->GetVictim()->GetGUID() != plr->GetGUID()) && (plr->GetGUID() != _offTankGUID))
                                {
                                    // shouldn't be casted on any victim of summoned mobs
                                    bool valid = true;
                                    for (std::list<ObjectGuid>::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
                                        if (Creature* c = ObjectAccessor::GetCreature(*me, (*itr)))
                                            if (c->IsAlive() && c->GetVictim() && c->GetVictim()->GetGUID() == plr->GetGUID())
                                            {
                                                valid = false;
                                                break;
                                            }
                                    if (valid)
                                        validPlayers.push_back(plr);
                                }

                    std::vector<Player*>::iterator begin = validPlayers.begin(), end = validPlayers.end();
                    std::random_shuffle(begin, end);

                    for (uint8 i = 0; i < RAID_MODE<uint8>(0, 1, 1, 3) && i < validPlayers.size(); i++)
                    {
                        Unit* target = validPlayers[i];
                        me->CastSpell(target, SPELL_DOMINATE_MIND_25, true);
                        float scale = target->GetFloatValue(OBJECT_FIELD_SCALE_X);
                        chained.insert(std::make_pair(target->GetGUID(), scale));
                    }


                    Talk(SAY_DOMINATE_MIND);
                    events.ScheduleEvent(EVENT_DOMINATE_MIND_CAST_AI, 2 * IN_MILLISECONDS);
                    events.ScheduleEvent(EVENT_SPELL_DOMINATE_MIND_25, urand(40, 45)*IN_MILLISECONDS);
                }
                break;
                case EVENT_SPELL_SHADOW_BOLT:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                        me->CastSpell(target, SPELL_SHADOW_BOLT, false);
                    events.RescheduleEvent(EVENT_SPELL_SHADOW_BOLT, urand(5000, 8000), 0, PHASE_ONE);
                    break;
                case EVENT_SUMMON_WAVE_P1:
                    SummonWaveP1();
                    events.RescheduleEvent(EVENT_SUMMON_WAVE_P1, IsHeroic() ? 45000 : 60000, 0, PHASE_ONE);
                    break;
                case EVENT_REANIMATE_CULTIST:
                    ReanimateCultist();
                    //events.CancelEvent(EVENT_REANIMATE_CULTIST);
                    break;
                case EVENT_EMPOWER_CULTIST:
                    EmpowerCultist();
                    events.RescheduleEvent(EVENT_EMPOWER_CULTIST, urand(18000, 25000));
                    break;
                case EVENT_SPELL_FROSTBOLT:
                    me->CastSpell(me->GetVictim(), SPELL_FROSTBOLT, false);
                    events.RescheduleEvent(EVENT_SPELL_FROSTBOLT, urand(10000, 11000));
                    break;
                case EVENT_SPELL_FROSTBOLT_VOLLEY:
                    me->CastSpell((Unit*)NULL, SPELL_FROSTBOLT_VOLLEY, false);
                    events.RescheduleEvent(EVENT_SPELL_FROSTBOLT_VOLLEY, urand(13000, 15000));
                    break;
                case EVENT_SPELL_TOUCH_OF_INSIGNIFICANCE:
                    me->CastSpell(me->GetVictim(), SPELL_TOUCH_OF_INSIGNIFICANCE, false);
                    events.RescheduleEvent(EVENT_SPELL_TOUCH_OF_INSIGNIFICANCE, urand(9000, 13000));
                    break;
                case EVENT_SUMMON_WAVE_P2:
                    SummonWaveP2();
                    events.RescheduleEvent(EVENT_SUMMON_WAVE_P2, 45000);
                    break;
                case EVENT_SPELL_SUMMON_SHADE:
                {
                    uint8 count = 1;
                    if (GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
                        count = 2;
                    else if (GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
                        count = 3;

                    std::list<Unit*> targets;
                    SelectTargetList(targets, NonTankTargetSelector(me, true), count, SELECT_TARGET_RANDOM);
                    if (!targets.empty())
                        for (std::list<Unit*>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
                            me->CastSpell(*itr, SPELL_SUMMON_SHADE, true);
                }
                events.RescheduleEvent(EVENT_SPELL_SUMMON_SHADE, urand(11000, 15000));
                break;
                case EVENT_DOMINATE_MIND_CAST_AI:
                {
                    std::map<ObjectGuid, float>::iterator itr;
                    for (itr = chained.begin(); itr != chained.end();)
                    {
                        if (Unit* player = ObjectAccessor::GetPlayer(*me, (*itr).first))
                        {
                            if (!player->IsCharmed())
                            {
                                std::map<ObjectGuid, float>::iterator next = itr;
                                ++next;
                                chained.erase(itr);
                                itr = next;
                                continue;
                            }

                            if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0, NotCharmedTargetSelector()))
                            {
                                switch (player->getClass())
                                {
                                    case CLASS_DRUID:
                                        if (urand(0, 1))
                                            player->CastSpell(target, SPELL_MOONFIRE_LD, false);
                                        else
                                            player->CastSpell(me, SPELL_LIFEBLOOM_LD, false);
                                        break;
                                    case CLASS_HUNTER:
                                        player->CastSpell(target, RAND(SPELL_MULTI_SHOT_LD, SPELL_VOLLEY_LD), false);
                                        break;
                                    case CLASS_MAGE:
                                        player->CastSpell(target, RAND(SPELL_FROST_FIREBOLT_LD, SPELL_ARCANE_MISSILES_LD), false);
                                        break;
                                    case CLASS_WARLOCK:
                                        player->CastSpell(target, RAND(SPELL_CURSE_OF_AGONY_LD, SPELL_SHADOW_BOLT_LD), true);
                                        break;
                                    case CLASS_WARRIOR:
                                        if (player->HasSpell(SPELL_WARRIOR_BLADESTORM_LD))                               // arms warrior
                                            player->CastSpell(target, RAND(SPELL_BLADESTORM_LD, SPELL_CLEAVE_LD), false);
                                        else if (player->HasSpell(SPELL_WARRIOR_TITANS_GRIP_LD))                         // fury warrior
                                            player->CastSpell(target, RAND(SPELL_WHIRLWIND_LD, SPELL_CLEAVE_LD), false);
                                        else                                                                          //def warrior
                                            (player->CastSpell(target, RAND(SPELL_SUNDER_ARMOR_LD, SPELL_CLEAVE_LD), false));
                                        break;
                                    case CLASS_PALADIN:
                                        if (urand(0, 1))
                                            player->CastSpell(target, SPELL_HAMMER_OF_JUSTICE_LD, false);
                                        else
                                            player->CastSpell(me, SPELL_HOLY_SHOCK_LD, false);
                                        break;
                                    case CLASS_PRIEST:
                                        if (urand(0, 1))
                                            player->CastSpell(target, SPELL_VAMPIRIC_TOUCH_LD, false);
                                        else
                                            player->CastSpell(me, SPELL_RENEW_LD, false);
                                        break;
                                    case CLASS_SHAMAN:
                                        if (urand(0, 1))
                                            player->CastSpell(target, SPELL_EARTH_SHOCK_LD, false);
                                        else
                                            player->CastSpell(me, SPELL_HEALING_WAVE_LD, false);
                                        break;
                                    case CLASS_ROGUE:
                                        player->CastSpell(target, RAND(SPELL_HEMORRHAGE_LD, SPELL_MUTILATE_LD), false);
                                        break;
                                    case CLASS_DEATH_KNIGHT:
                                        if (urand(0, 1))
                                            player->CastSpell(target, SPELL_PLAGUE_STRIKE_LD, true);
                                        else
                                            player->CastSpell(target, SPELL_HOWLING_BLAST_LD, true);
                                        break;
                                }
                            }
                        }
                        ++itr;
                    }

                    if (!chained.empty())
                        events.Repeat(3000);

                    break;
                }
                }
            }

            if (me->HasAura(SPELL_MANA_BARRIER))
                return;

            DoMeleeAttackIfReady();
        }

        void JustSummoned(Creature* summon)
        {
            if (summon->GetEntry() == NPC_DARNAVAN)
                _darnavanGUID = summon->GetGUID();
            else
                summons.Summon(summon);

            Unit* target = NULL;
            if (summon->GetEntry() == NPC_VENGEFUL_SHADE)
            {

                float minrange = 250.0f;
                Map::PlayerList const& pl = me->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator itr = pl.begin(); itr != pl.end(); ++itr)
                    if (Player* p = itr->GetSource())
                        if (p != me->GetVictim() && summon->GetExactDist(p) < minrange && me->CanCreatureAttack(p)) // && me->_CanDetectFeignDeathOf(p)
                        {
                            target = p;
                            minrange = summon->GetExactDist(p);
                        }


                summon->ToTempSummon()->DespawnOrUnsummon(30000);
            }
            else
            {
                target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true);
            }

            summon->AI()->AttackStart(target);
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            summons.Despawn(summon);
        }

        void JustDied(Unit* killer)
        {
            Talk(SAY_DEATH);

            std::set<uint32> livingAddEntries;
            // Full House achievement
            for (SummonList::iterator itr = summons.begin(); itr != summons.end(); ++itr)
                if (Unit* unit = ObjectAccessor::GetUnit(*me, *itr))
                    if (unit->IsAlive() && unit->GetEntry() != NPC_VENGEFUL_SHADE)
                        livingAddEntries.insert(unit->GetEntry());

            if (livingAddEntries.size() >= 5)
                instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, SPELL_FULL_HOUSE, 0, me);

            if (Creature* darnavan = ObjectAccessor::GetCreature(*me, _darnavanGUID))
            {
                if (darnavan->IsAlive())
                {
                    darnavan->RemoveAllAuras();
                    darnavan->setFaction(35);
                    darnavan->DeleteThreatList();
                    darnavan->CombatStop(true);
                    darnavan->GetMotionMaster()->MoveIdle();
                    darnavan->StopMoving();
                    darnavan->SetReactState(REACT_PASSIVE);
                    darnavan->m_Events.AddEvent(new DaranavanMoveEvent(*darnavan), darnavan->m_Events.CalculateTime(10000));
                    darnavan->AI()->Talk(SAY_DARNAVAN_RESCUED);
                    if (Player* owner = killer->GetCharmerOrOwnerPlayerOrPlayerItself())
                    {
                        if (Group* group = owner->GetGroup())
                        {
                            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                                if (Player* member = itr->GetSource())
                                    if (member->IsInMap(owner))
                                        member->KilledMonsterCredit(NPC_DARNAVAN_CREDIT, ObjectGuid::Empty);
                        }
                        else
                            owner->KilledMonsterCredit(NPC_DARNAVAN_CREDIT, ObjectGuid::Empty);
                    }
                }
            }

            _JustDied();
        }

        void KilledUnit(Unit* victim)
        {
            if (victim->GetTypeId() == TYPEID_PLAYER)
                Talk(SAY_KILL);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!_introDone && me->IsWithinDistInMap(who, 110.0f))
            {
                _introDone = true;
                Talk(SAY_INTRO_1);
                events.SetPhase(PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_2, 11000, 0, PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_3, 21000, 0, PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_4, 31500, 0, PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_5, 39500, 0, PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_6, 48500, 0, PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_7, 58000, 0, PHASE_INTRO);
            }

            BossAI::MoveInLineOfSight(who);
        }

        void SummonWaveP1()
        {
            uint8 addIndex = _waveCounter & 1;
            uint8 addIndexOther = uint8(addIndex ^ 1);

            // Summon first add, replace it with Darnavan if weekly quest is active
            if (_waveCounter || instance->GetData(DATA_WEEKLY_QUEST_ID) != QUEST_DEPROGRAMMING_10)
                Summon(SummonEntries[addIndex], SummonPositions[addIndex * 3]);
            else
                Summon(NPC_DARNAVAN, SummonPositions[addIndex * 3]);

            Summon(SummonEntries[addIndexOther], SummonPositions[addIndex * 3 + 1]);
            Summon(SummonEntries[addIndex], SummonPositions[addIndex * 3 + 2]);
            if (Is25ManRaid())
            {
                Summon(SummonEntries[addIndexOther], SummonPositions[addIndexOther * 3]);
                Summon(SummonEntries[addIndex], SummonPositions[addIndexOther * 3 + 1]);
                Summon(SummonEntries[addIndexOther], SummonPositions[addIndexOther * 3 + 2]);
                Summon(SummonEntries[urand(0, 1)], SummonPositions[6]);
            }

            ++_waveCounter;
        }

        void SummonWaveP2()
        {
            if (Is25ManRaid())
            {
                uint8 addIndex = _waveCounter & 1;
                Summon(SummonEntries[addIndex], SummonPositions[addIndex * 3]);
                Summon(SummonEntries[addIndex ^ 1], SummonPositions[addIndex * 3 + 1]);
                Summon(SummonEntries[addIndex], SummonPositions[addIndex * 3 + 2]);
            }
            else
                Summon(SummonEntries[urand(0, 1)], SummonPositions[6]);

            ++_waveCounter;
        }

        // helper for summoning wave mobs
        void Summon(uint32 entry, const Position& pos)
        {
            if (TempSummon* summon = me->SummonCreature(entry, pos, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000))
                if (TempSummon* trigger = me->SummonCreature(WORLD_TRIGGER, pos, TEMPSUMMON_TIMED_DESPAWN, 2000))
                {
                    trigger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                    trigger->CastSpell(trigger, SPELL_TELEPORT_VISUAL, true);
                }
        }

        void SetGUID(ObjectGuid guid, int32 id/* = 0*/)
        {
            if (id != GUID_CULTIST)
                return;

            _reanimationQueue.push_back(guid);
            events.ScheduleEvent(EVENT_REANIMATE_CULTIST, 3000);
        }

        uint32 GetData(uint32 type) const
        {
            if (type != DATA_PHASE)
                return 0;

            return uint32(events.GetPhaseMask());
        }

        void ReanimateCultist()
        {
            if (_reanimationQueue.empty())
                return;

            ObjectGuid cultistGUID = _reanimationQueue.front();
            Creature* cultist = ObjectAccessor::GetCreature(*me, cultistGUID);
            _reanimationQueue.pop_front();

            if (!cultist)
                return;

            Talk(SAY_ANIMATE_DEAD);
            me->CastSpell(cultist, SPELL_DARK_MARTYRDOM_T, true);
        }

        void EmpowerCultist()
        {
            if (summons.empty())
                return;

            std::list<Creature*> temp;
            for (SummonList::iterator itr = summons.begin(); itr != summons.end(); ++itr)
                if (Creature* cre = ObjectAccessor::GetCreature(*me, *itr))
                    if (cre->IsAlive() && (cre->GetEntry() == NPC_CULT_FANATIC || cre->GetEntry() == NPC_CULT_ADHERENT) && cre->CanFreeMove())
                        temp.push_back(cre);

            // noone to empower
            if (temp.empty())
                return;

            // select random cultist
            if (Creature* cultist = Trinity::Containers::SelectRandomContainerElement(temp))
            {
                me->CastSpell(cultist, cultist->GetEntry() == NPC_CULT_FANATIC ? SPELL_DARK_TRANSFORMATION_T : SPELL_DARK_EMPOWERMENT_T, true);
                Talk(uint8(cultist->GetEntry() == NPC_CULT_FANATIC ? SAY_DARK_TRANSFORMATION : SAY_DARK_EMPOWERMENT));
            }
        }

        void SpellHitTarget(Unit* target, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_DARK_MARTYRDOM_T)
            {
                if (target->GetEntry() == NPC_CULT_FANATIC)
                    me->SummonCreature(NPC_REANIMATED_FANATIC, *target, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                else
                    me->SummonCreature(NPC_REANIMATED_ADHERENT, *target, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);

                if (TempSummon* summon = target->ToTempSummon())
                    summon->UnSummon();
            }
        }

    private:
        ObjectGuid _darnavanGUID;
        std::deque<ObjectGuid> _reanimationQueue;
        uint32 _waveCounter;
        bool _introDone;
        uint8 const _dominateMindCount;
        std::map<ObjectGuid, float> chained;
        uint8 DominadeCounter;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetIcecrownCitadelAI<boss_lady_deathwhisperAI>(creature);
    }
};

class npc_cult_fanatic : public CreatureScript
{
public:
    npc_cult_fanatic() : CreatureScript("npc_cult_fanatic") { }

    struct npc_cult_fanaticAI : public ScriptedAI
    {
        npc_cult_fanaticAI(Creature* creature) : ScriptedAI(creature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
            instance = me->GetInstanceScript();
        }

        EventMap events;
        InstanceScript* instance;

        void Reset()
        {
            events.Reset();
            events.ScheduleEvent(EVENT_SPELL_FANATIC_NECROTIC_STRIKE, urand(10000, 12000));
            events.ScheduleEvent(EVENT_SPELL_FANATIC_SHADOW_CLEAVE, urand(14000, 16000));
            events.ScheduleEvent(EVENT_SPELL_FANATIC_VAMPIRIC_MIGHT, urand(20000, 27000));
            if (me->GetEntry() == NPC_CULT_FANATIC)
                events.ScheduleEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM, urand(10000, 42000));
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_DARK_TRANSFORMATION)
                me->UpdateEntry(NPC_DEFORMED_FANATIC);
            else if (spell->Id == SPELL_DARK_TRANSFORMATION_T)
            {
                events.CancelEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM);
                me->InterruptNonMeleeSpells(true);
                me->CastSpell(me, SPELL_DARK_TRANSFORMATION, false);
            }
        }

        void DoAction(int32 a)
        {
            if (a == -1)
            {
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->SetReactState(REACT_PASSIVE);
                me->GetMotionMaster()->MoveIdle();
                me->StopMoving();
                events.Reset();
                events.ScheduleEvent(EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL, 500);
            }
        }

        void EnterCombat(Unit* who) { DoZoneInCombat(); }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 0:
                    break;
                case EVENT_SPELL_FANATIC_NECROTIC_STRIKE:
                    me->CastSpell(me->GetVictim(), SPELL_NECROTIC_STRIKE, false);
                    events.RescheduleEvent(EVENT_SPELL_FANATIC_NECROTIC_STRIKE, urand(11000, 13000));
                    break;
                case EVENT_SPELL_FANATIC_SHADOW_CLEAVE:
                    me->CastSpell(me->GetVictim(), SPELL_SHADOW_CLEAVE, false);
                    events.RescheduleEvent(EVENT_SPELL_FANATIC_SHADOW_CLEAVE, (9500, 11000));
                    break;
                case EVENT_SPELL_FANATIC_VAMPIRIC_MIGHT:
                    me->CastSpell(me, SPELL_VAMPIRIC_MIGHT, false);
                    events.RescheduleEvent(EVENT_SPELL_FANATIC_VAMPIRIC_MIGHT, urand(20000, 27000));
                    break;
                case EVENT_SPELL_CULTIST_DARK_MARTYRDOM:
                    if (Creature* lady = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LADY_DEATHWHISPER)))
                        if (lady->AI()->GetData(DATA_PHASE) & PHASE_TWO_MASK)
                            break;

                    if (me->CanFreeMove())
                    {
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
                    }
                    me->SetReactState(REACT_PASSIVE);
                    me->CastSpell(me, SPELL_DARK_MARTYRDOM_FANATIC, false);
                    events.RescheduleEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM, urand(16000, 25000));
                    break;
                case EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL:
                    me->Kill(me);
                    events.CancelEvent(EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetIcecrownCitadelAI<npc_cult_fanaticAI>(creature);
    }
};

class npc_cult_adherent : public CreatureScript
{
public:
    npc_cult_adherent() : CreatureScript("npc_cult_adherent") { }

    struct npc_cult_adherentAI : public ScriptedAI
    {
        npc_cult_adherentAI(Creature* creature) : ScriptedAI(creature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
            instance = me->GetInstanceScript();
        }

        EventMap events;
        InstanceScript* instance;

        void Reset()
        {
            events.Reset();
            events.ScheduleEvent(EVENT_SPELL_ADHERENT_FROST_FEVER, urand(10000, 12000));
            events.ScheduleEvent(EVENT_SPELL_ADHERENT_CURSE_OF_TORPOR, urand(14000, 16000));
            events.ScheduleEvent(EVENT_SPELL_ADHERENT_SHORUD_OF_THE_OCCULT, urand(32000, 39000));
            if (me->GetEntry() == NPC_CULT_ADHERENT)
                events.ScheduleEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM, urand(10000, 45000));
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_DARK_EMPOWERMENT)
                me->UpdateEntry(NPC_EMPOWERED_ADHERENT);
            else if (spell->Id == SPELL_DARK_EMPOWERMENT_T)
            {
                events.CancelEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM);
                me->InterruptNonMeleeSpells(true);
                me->CastSpell(me, SPELL_DARK_EMPOWERMENT, false);
            }
        }

        void DoAction(int32 a)
        {
            if (a == -1)
            {
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->SetReactState(REACT_PASSIVE);
                me->GetMotionMaster()->MovementExpired();
                me->GetMotionMaster()->MoveIdle();
                me->StopMoving();
                events.Reset();
                events.ScheduleEvent(EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL, 500);
            }
        }

        void EnterCombat(Unit* who) { DoZoneInCombat(); }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 0:
                    break;
                case EVENT_SPELL_ADHERENT_FROST_FEVER:
                    me->CastSpell(me->GetVictim(), SPELL_FROST_FEVER, false);
                    events.RescheduleEvent(EVENT_SPELL_ADHERENT_FROST_FEVER, urand(9000, 13000));
                    break;
                case EVENT_SPELL_ADHERENT_CURSE_OF_TORPOR:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                        me->CastSpell(target, SPELL_CURSE_OF_TORPOR, false);
                    events.RescheduleEvent(EVENT_SPELL_ADHERENT_CURSE_OF_TORPOR, urand(9000, 13000));
                    break;
                case EVENT_SPELL_ADHERENT_SHORUD_OF_THE_OCCULT:
                    me->CastSpell(me, SPELL_SHORUD_OF_THE_OCCULT, false);
                    events.RescheduleEvent(EVENT_SPELL_ADHERENT_SHORUD_OF_THE_OCCULT, urand(27000, 32000));
                    break;
                case EVENT_SPELL_CULTIST_DARK_MARTYRDOM:
                    if (Creature* lady = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LADY_DEATHWHISPER)))
                        if (lady->AI()->GetData(DATA_PHASE) & PHASE_TWO_MASK)
                            break;

                    if (me->CanFreeMove())
                    {
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
                    }
                    me->SetReactState(REACT_PASSIVE);
                    me->CastSpell(me, SPELL_DARK_MARTYRDOM_ADHERENT, false);
                    events.RescheduleEvent(EVENT_SPELL_CULTIST_DARK_MARTYRDOM, urand(16000, 28000));
                    break;
                case EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL:
                    me->Kill(me);
                    events.CancelEvent(EVENT_CULTIST_DARK_MARTYRDOM_SELF_KILL);
                    break;
                }
            }

            if (me->GetEntry() == NPC_CULT_ADHERENT)
                DoSpellAttackIfReady(SPELL_DEATHCHILL_BOLT);
            else if (me->GetEntry() == NPC_EMPOWERED_ADHERENT)
                DoSpellAttackIfReady(SPELL_DEATHCHILL_BLAST);
            else
                DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetIcecrownCitadelAI<npc_cult_adherentAI>(creature);
    }
};

class npc_vengeful_shade : public CreatureScript
{
public:
    npc_vengeful_shade() : CreatureScript("npc_vengeful_shade") { }

    struct npc_vengeful_shadeAI : public ScriptedAI
    {
        npc_vengeful_shadeAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetControlled(true, UNIT_STATE_ROOT);
            unroot_timer = 2000;
            targetGUID = ObjectGuid::Empty;
        }

        uint16 unroot_timer;
        ObjectGuid targetGUID;

        void Reset()
        {
            me->setAttackTimer(BASE_ATTACK, 2000);
            me->AddAura(SPELL_VENGEFUL_BLAST_PASSIVE, me);
        }

        void AttackStart(Unit* who)
        {
            if (!who)
                return;
            ScriptedAI::AttackStart(who);
            if (!targetGUID)
            {
                me->getThreatManager().resetAllAggro();
                me->AddThreat(who, 1000000.0f);
                targetGUID = who->GetGUID();
            }

        }

        void SpellHitTarget(Unit* /*target*/, SpellInfo const* spell)
        {
            switch (spell->Id)
            {
            case SPELL_VENGEFUL_BLAST_10N:
            case SPELL_VENGEFUL_BLAST_25N:
            case SPELL_VENGEFUL_BLAST_10H:
            case SPELL_VENGEFUL_BLAST_25H:
                me->GetMotionMaster()->MovementExpired();
                me->StopMoving();
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->DespawnOrUnsummon(500);
                break;
            default:
                break;
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (unroot_timer)
            {
                if (unroot_timer <= diff)
                {
                    me->SetControlled(false, UNIT_STATE_ROOT);
                    me->SetInCombatWithZone();
                    unroot_timer = 0;
                }
                else
                {
                    unroot_timer -= diff;
                    return;
                }
            }

            UpdateVictim();

            if (!me->GetVictim() || me->GetVictim()->GetGUID() != targetGUID)
            {
                me->DespawnOrUnsummon(1);
                return;
            }

            DoMeleeAttackIfReady();
        }

        void MoveInLineOfSight(Unit* who) {}
        void EnterEvadeMode() {}
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetIcecrownCitadelAI<npc_vengeful_shadeAI>(creature);
    }
};

class npc_darnavan : public CreatureScript
{
public:
    npc_darnavan() : CreatureScript("npc_darnavan") { }

    struct npc_darnavanAI : public ScriptedAI
    {
        npc_darnavanAI(Creature* creature) : ScriptedAI(creature) {}

        EventMap events;
        bool _canCharge;
        bool _canShatter;

        void Reset()
        {
            events.Reset();
            events.ScheduleEvent(EVENT_DARNAVAN_BLADESTORM, 10000);
            events.ScheduleEvent(EVENT_DARNAVAN_INTIMIDATING_SHOUT, urand(20000, 25000));
            events.ScheduleEvent(EVENT_DARNAVAN_MORTAL_STRIKE, urand(25000, 30000));
            events.ScheduleEvent(EVENT_DARNAVAN_SUNDER_ARMOR, urand(5000, 8000));
            _canCharge = true;
            _canShatter = true;
        }

        void JustDied(Unit* killer)
        {
            events.Reset();
            if (Player* owner = killer->GetCharmerOrOwnerPlayerOrPlayerItself())
            {
                if (Group* group = owner->GetGroup())
                {
                    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                        if (Player* member = itr->GetSource())
                            if (member->IsInMap(owner))
                                member->FailQuest(QUEST_DEPROGRAMMING);
                }
                else
                    owner->FailQuest(QUEST_DEPROGRAMMING);
            }
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE || id != POINT_DESPAWN)
                return;

            me->DespawnOrUnsummon();
        }

        void EnterCombat(Unit* /*victim*/)
        {
            DoZoneInCombat();
            Talk(SAY_DARNAVAN_AGGRO);
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if (_canShatter && me->GetVictim()) // && me->GetVictim()->IsImmunedToDamageOrSchool(SPELL_SCHOOL_MASK_NORMAL)
            {
                me->CastSpell(me->GetVictim(), SPELL_SHATTERING_THROW, false);
                _canShatter = false;
                events.ScheduleEvent(EVENT_DARNAVAN_SHATTERING_THROW, 30000);
                return;
            }

            if (_canCharge && !me->IsWithinMeleeRange(me->GetVictim()))
            {
                me->CastSpell(me->GetVictim(), SPELL_CHARGE, false);
                _canCharge = false;
                events.ScheduleEvent(EVENT_DARNAVAN_CHARGE, 20000);
                return;
            }

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case 0:
                    break;
                case EVENT_DARNAVAN_BLADESTORM:
                    me->CastSpell((Unit*)NULL, SPELL_BLADESTORM, false);
                    events.RescheduleEvent(EVENT_DARNAVAN_BLADESTORM, urand(90000, 100000));
                    break;
                case EVENT_DARNAVAN_CHARGE:
                    _canCharge = true;
                    events.CancelEvent(EVENT_DARNAVAN_CHARGE);
                    break;
                case EVENT_DARNAVAN_INTIMIDATING_SHOUT:
                    me->CastSpell((Unit*)NULL, SPELL_INTIMIDATING_SHOUT, false);
                    events.RescheduleEvent(EVENT_DARNAVAN_INTIMIDATING_SHOUT, (90000, 120000));
                    break;
                case EVENT_DARNAVAN_MORTAL_STRIKE:
                    me->CastSpell(me->GetVictim(), SPELL_MORTAL_STRIKE, false);
                    events.RescheduleEvent(EVENT_DARNAVAN_MORTAL_STRIKE, urand(15000, 30000));
                    break;
                case EVENT_DARNAVAN_SHATTERING_THROW:
                    _canShatter = true;
                    events.CancelEvent(EVENT_DARNAVAN_SHATTERING_THROW);
                    break;
                case EVENT_DARNAVAN_SUNDER_ARMOR:
                    me->CastSpell(me->GetVictim(), SPELL_SUNDER_ARMOR, false);
                    events.RescheduleEvent(EVENT_DARNAVAN_SUNDER_ARMOR, urand(3000, 7000));
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetIcecrownCitadelAI<npc_darnavanAI>(creature);
    }
};

class spell_deathwhisper_mana_barrier : public SpellScriptLoader
{
public:
    spell_deathwhisper_mana_barrier() : SpellScriptLoader("spell_deathwhisper_mana_barrier") { }

    class spell_deathwhisper_mana_barrier_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_deathwhisper_mana_barrier_AuraScript);

        void HandlePeriodicTick(AuraEffect const* /*aurEff*/)
        {
            PreventDefaultAction();
            if (Unit* caster = GetCaster())
            {
                int32 missingHealth = int32(caster->GetMaxHealth() - caster->GetHealth());
                caster->ModifyHealth(missingHealth);
                caster->ModifyPower(POWER_MANA, -missingHealth);
            }
        }

        void Register()
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_deathwhisper_mana_barrier_AuraScript::HandlePeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_deathwhisper_mana_barrier_AuraScript();
    }
};

class spell_cultist_dark_martyrdom : public SpellScriptLoader
{
public:
    spell_cultist_dark_martyrdom() : SpellScriptLoader("spell_cultist_dark_martyrdom") { }

    class spell_cultist_dark_martyrdom_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_cultist_dark_martyrdom_SpellScript);

        void HandleEffect(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster()->ToTempSummon())
                if (Unit* owner = GetCaster()->ToTempSummon()->GetSummoner())
                    owner->GetAI()->SetGUID(GetCaster()->GetGUID(), GUID_CULTIST);

            if (Creature* caster = GetCaster()->ToCreature())
                caster->AI()->DoAction(-1);
            GetCaster()->SetDisplayId(GetCaster()->GetEntry() == NPC_CULT_FANATIC ? 30968 : 30966);
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_cultist_dark_martyrdom_SpellScript::HandleEffect, EFFECT_2, SPELL_EFFECT_FORCE_DESELECT);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_cultist_dark_martyrdom_SpellScript();
    }
};

class spell_dominate_mind_icc : public SpellScriptLoader
{
    public:
        spell_dominate_mind_icc() : SpellScriptLoader("spell_dominate_mind_icc") { }

        class spell_dominate_mind_icc_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dominate_mind_icc_AuraScript);

            void HandleOnEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* target = GetTarget();
                if (!target)
                    return;
                target->SetObjectScale(4.0f);
            }

            void HandleOnEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* target = GetTarget();
                if (!target)
                    return;

                target->SetObjectScale(1.0f);
                target->GetMotionMaster()->Clear();

                if (!GetCaster())
                    return;

                target->RemoveCharmedBy(GetCaster());
                target->RemoveCharmAuras();
                // set back in combat with Lady deathwhisper
                /*if (Creature* lady = target->FindNearestCreature(NPC_LADY_DEATHWHISPER, 500.0f))
                {
                target->SetInCombatWith(lady);
                target->AddThreat(lady, 1.0f);
                lady->SetInCombatWith(target);
                lady->AddThreat(target, 1.0f);
                target->CombatStart(lady);
                lady->CombatStart(target);
                target->SetInCombatState(true, lady);
                }*/
                // set back in combat with Lady deathwhisper
                /*if (Creature* lady = target->FindNearestCreature(NPC_LADY_DEATHWHISPER, 500.0f))
                {
                    target->SetInCombatWith(lady);
                    target->AddThreat(lady, 1.0f);
                    lady->SetInCombatWith(target);
                    lady->AddThreat(target, 1.0f);
                    target->CombatStart(lady);
                    lady->CombatStart(target);
                    target->SetInCombatState(true, lady);
                }*/
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_dominate_mind_icc_AuraScript::HandleOnEffectApply, EFFECT_0, SPELL_AURA_AOE_CHARM, AURA_EFFECT_HANDLE_REAL);
                OnEffectRemove += AuraEffectRemoveFn(spell_dominate_mind_icc_AuraScript::HandleOnEffectRemove, EFFECT_0, SPELL_AURA_AOE_CHARM, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dominate_mind_icc_AuraScript();
        }
};


void AddSC_boss_lady_deathwhisper()
{
    new boss_lady_deathwhisper();
    new npc_cult_fanatic();
    new npc_cult_adherent();
    new npc_vengeful_shade();
    new npc_darnavan();
    new spell_deathwhisper_mana_barrier();
    new spell_cultist_dark_martyrdom();
    new spell_dominate_mind_icc();
}
