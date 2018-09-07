/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Npcs_Special
SD%Complete: 100
SDComment: To be used for special NPCs that are located globally.
SDCategory: NPCs
EndScriptData
*/

/* ContentData
npc_air_force_bots       80%    support for misc (invisible) guard bots in areas where player allowed to fly. Summon guards after a preset time if tagged by spell
npc_lunaclaw_spirit      80%    support for quests 6001/6002 (Body and Heart)
npc_chicken_cluck       100%    support for quest 3861 (Cluck!)
npc_dancing_flames      100%    midsummer event NPC
npc_guardian            100%    guardianAI used to prevent players from accessing off-limits areas. Not in use by SD2
npc_garments_of_quests   80%    NPC's related to all Garments of-quests 5621, 5624, 5625, 5648, 565
npc_injured_patient     100%    patients for triage-quests (6622 and 6624)
npc_doctor              100%    Gustaf Vanhowzen and Gregory Victor, quest 6622 and 6624 (Triage)
npc_sayge               100%    Darkmoon event fortune teller, buff player based on answers given
npc_snake_trap_serpents  80%    AI for snakes that summoned by Snake Trap
npc_shadowfiend         100%   restore 5% of owner's mana when shadowfiend die from damage
npc_locksmith            75%    list of keys needs to be confirmed
npc_firework            100%    NPC's summoned by rockets and rocket clusters, for making them cast visual
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PassiveAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellHistory.h"
#include "SpellAuras.h"
#include "Pet.h"
#include "CreatureTextMgr.h"
#include "SmartAI.h"
#include "LFGMgr.h"

/*########
# npc_air_force_bots
#########*/

enum SpawnType
{
    SPAWNTYPE_TRIPWIRE_ROOFTOP,                             // no warning, summon Creature at smaller range
    SPAWNTYPE_ALARMBOT,                                     // cast guards mark and summon npc - if player shows up with that buff duration < 5 seconds attack
};

struct SpawnAssociation
{
    uint32 thisCreatureEntry;
    uint32 spawnedCreatureEntry;
    SpawnType spawnType;
};

enum AirFoceBots
{
    //SPELL_GUARDS_MARK               = 38067,
    AURA_DURATION_TIME_LEFT         = 5000
};

float const RANGE_TRIPWIRE          = 15.0f;
float const RANGE_GUARDS_MARK       = 50.0f;

SpawnAssociation spawnAssociations[] =
{
    {2614,  15241, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Alliance)
    {2615,  15242, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Horde)
    {21974, 21976, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Area 52)
    {21993, 15242, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Horde - Bat Rider)
    {21996, 15241, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Alliance - Gryphon)
    {21997, 21976, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Goblin - Area 52 - Zeppelin)
    {21999, 15241, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Alliance)
    {22001, 15242, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Horde)
    {22002, 15242, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Ground (Horde)
    {22003, 15241, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Ground (Alliance)
    {22063, 21976, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Goblin - Area 52)
    {22065, 22064, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Ethereal - Stormspire)
    {22066, 22067, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Scryer - Dragonhawk)
    {22068, 22064, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Ethereal - Stormspire)
    {22069, 22064, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Stormspire)
    {22070, 22067, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Scryer)
    {22071, 22067, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Scryer)
    {22078, 22077, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Aldor)
    {22079, 22077, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Aldor - Gryphon)
    {22080, 22077, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Aldor)
    {22086, 22085, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Sporeggar)
    {22087, 22085, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Sporeggar - Spore Bat)
    {22088, 22085, SPAWNTYPE_TRIPWIRE_ROOFTOP},             //Air Force Trip Wire - Rooftop (Sporeggar)
    {22090, 22089, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Toshley's Station - Flying Machine)
    {22124, 22122, SPAWNTYPE_ALARMBOT},                     //Air Force Alarm Bot (Cenarion)
    {22125, 22122, SPAWNTYPE_ALARMBOT},                     //Air Force Guard Post (Cenarion - Stormcrow)
    {22126, 22122, SPAWNTYPE_ALARMBOT}                      //Air Force Trip Wire - Rooftop (Cenarion Expedition)
};

class npc_air_force_bots : public CreatureScript
{
public:
    npc_air_force_bots() : CreatureScript("npc_air_force_bots") { }

    struct npc_air_force_botsAI : public ScriptedAI
    {
        npc_air_force_botsAI(Creature* creature) : ScriptedAI(creature)
        {
            SpawnAssoc = NULL;
            SpawnedGUID.Clear();

            // find the correct spawnhandling
            static uint32 entryCount = sizeof(spawnAssociations) / sizeof(SpawnAssociation);

            for (uint8 i = 0; i < entryCount; ++i)
            {
                if (spawnAssociations[i].thisCreatureEntry == creature->GetEntry())
                {
                    SpawnAssoc = &spawnAssociations[i];
                    break;
                }
            }

            if (!SpawnAssoc)
                TC_LOG_ERROR("sql.sql", "TCSR: Creature template entry %u has ScriptName npc_air_force_bots, but it's not handled by that script", creature->GetEntry());
            else
            {
                CreatureTemplate const* spawnedTemplate = sObjectMgr->GetCreatureTemplate(SpawnAssoc->spawnedCreatureEntry);

                if (!spawnedTemplate)
                {
                    TC_LOG_ERROR("sql.sql", "TCSR: Creature template entry %u does not exist in DB, which is required by npc_air_force_bots", SpawnAssoc->spawnedCreatureEntry);
                    SpawnAssoc = NULL;
                    return;
                }
            }
        }

        SpawnAssociation* SpawnAssoc;
        ObjectGuid SpawnedGUID;

        void Reset() override { }

        Creature* SummonGuard()
        {
            Creature* summoned = me->SummonCreature(SpawnAssoc->spawnedCreatureEntry, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 300000);

            if (summoned)
                SpawnedGUID = summoned->GetGUID();
            else
            {
                TC_LOG_ERROR("sql.sql", "TCSR: npc_air_force_bots: wasn't able to spawn Creature %u", SpawnAssoc->spawnedCreatureEntry);
                SpawnAssoc = NULL;
            }

            return summoned;
        }

        Creature* GetSummonedGuard()
        {
            Creature* creature = ObjectAccessor::GetCreature(*me, SpawnedGUID);

            if (creature && creature->IsAlive())
                return creature;

            return NULL;
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (!SpawnAssoc)
                return;

            if (me->IsValidAttackTarget(who))
            {
                Player* playerTarget = who->ToPlayer();

                // airforce guards only spawn for players
                if (!playerTarget)
                    return;

                Creature* lastSpawnedGuard = SpawnedGUID.IsEmpty() ? NULL : GetSummonedGuard();

                // prevent calling Unit::GetUnit at next MoveInLineOfSight call - speedup
                if (!lastSpawnedGuard)
                    SpawnedGUID.Clear();

                switch (SpawnAssoc->spawnType)
                {
                    /*case SPAWNTYPE_ALARMBOT:
                    {
                        if (!who->IsWithinDistInMap(me, RANGE_GUARDS_MARK))
                            return;

                        /*Aura* markAura = who->GetAura(SPELL_GUARDS_MARK);
                        if (markAura)
                        {
                            // the target wasn't able to move out of our range within 25 seconds
                            if (!lastSpawnedGuard)
                            {
                                lastSpawnedGuard = SummonGuard();

                                if (!lastSpawnedGuard)
                                    return;
                            }

                            if (markAura->GetDuration() < AURA_DURATION_TIME_LEFT)
                                if (!lastSpawnedGuard->GetVictim())
                                    lastSpawnedGuard->AI()->AttackStart(who);
                        }
                        else
                        {
                            if (!lastSpawnedGuard)
                                lastSpawnedGuard = SummonGuard();

                            if (!lastSpawnedGuard)
                                return;

                            lastSpawnedGuard->CastSpell(who, SPELL_GUARDS_MARK, true);
                        }
                        break;
                    }*/
                    case SPAWNTYPE_TRIPWIRE_ROOFTOP:
                    {
                        if (!who->IsWithinDistInMap(me, RANGE_TRIPWIRE))
                            return;

                        if (!lastSpawnedGuard)
                            lastSpawnedGuard = SummonGuard();

                        if (!lastSpawnedGuard)
                            return;

                        // ROOFTOP only triggers if the player is on the ground
                        if (!playerTarget->IsFlying() && !lastSpawnedGuard->GetVictim())
                            lastSpawnedGuard->AI()->AttackStart(who);

                        break;
                    }
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_air_force_botsAI(creature);
    }
};

/*######
## npc_lunaclaw_spirit
######*/

enum LunaclawSpirit
{
    QUEST_BODY_HEART_A      = 6001,
    QUEST_BODY_HEART_H      = 6002,

    TEXT_ID_DEFAULT         = 4714,
    TEXT_ID_PROGRESS        = 4715
};

#define GOSSIP_ITEM_GRANT   "You have thought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."

class npc_lunaclaw_spirit : public CreatureScript
{
public:
    npc_lunaclaw_spirit() : CreatureScript("npc_lunaclaw_spirit") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(QUEST_BODY_HEART_A) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(QUEST_BODY_HEART_H) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_GRANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        player->SEND_GOSSIP_MENU(TEXT_ID_DEFAULT, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->SEND_GOSSIP_MENU(TEXT_ID_PROGRESS, creature->GetGUID());
            player->AreaExploredOrEventHappens(player->GetTeam() == ALLIANCE ? QUEST_BODY_HEART_A : QUEST_BODY_HEART_H);
        }
        return true;
    }
};

/*########
# npc_chicken_cluck
#########*/

enum ChickenCluck
{
    EMOTE_HELLO_A       = 0,
    EMOTE_HELLO_H       = 1,
    EMOTE_CLUCK_TEXT    = 2,

    QUEST_CLUCK         = 3861,
    FACTION_FRIENDLY    = 35,
    FACTION_CHICKEN     = 31
};

class npc_chicken_cluck : public CreatureScript
{
public:
    npc_chicken_cluck() : CreatureScript("npc_chicken_cluck") { }

    struct npc_chicken_cluckAI : public ScriptedAI
    {
        npc_chicken_cluckAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            ResetFlagTimer = 120000;
        }

        uint32 ResetFlagTimer;

        void Reset() override
        {
            Initialize();
            me->setFaction(FACTION_CHICKEN);
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        }

        void EnterCombat(Unit* /*who*/) override { }

        void UpdateAI(uint32 diff) override
        {
            // Reset flags after a certain time has passed so that the next player has to start the 'event' again
            if (me->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
            {
                if (ResetFlagTimer <= diff)
                {
                    EnterEvadeMode();
                    return;
                }
                else
                    ResetFlagTimer -= diff;
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }

        void ReceiveEmote(Player* player, uint32 emote) override
        {
            switch (emote)
            {
                case TEXT_EMOTE_CHICKEN:
                    if (player->GetQuestStatus(QUEST_CLUCK) == QUEST_STATUS_NONE && rand32() % 30 == 1)
                    {
                        me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        me->setFaction(FACTION_FRIENDLY);
                        Talk(player->GetTeam() == HORDE ? EMOTE_HELLO_H : EMOTE_HELLO_A);
                    }
                    break;
                case TEXT_EMOTE_CHEER:
                    if (player->GetQuestStatus(QUEST_CLUCK) == QUEST_STATUS_COMPLETE)
                    {
                        me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        me->setFaction(FACTION_FRIENDLY);
                        Talk(EMOTE_CLUCK_TEXT);
                    }
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_chicken_cluckAI(creature);
    }

    bool OnQuestAccept(Player* /*player*/, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_CLUCK)
            ENSURE_AI(npc_chicken_cluck::npc_chicken_cluckAI, creature->AI())->Reset();

        return true;
    }

    bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*opt*/) override
    {
        if (quest->GetQuestId() == QUEST_CLUCK)
            ENSURE_AI(npc_chicken_cluck::npc_chicken_cluckAI, creature->AI())->Reset();

        return true;
    }
};

/*######
## npc_dancing_flames
######*/

enum DancingFlames
{
    SPELL_BRAZIER           = 45423,
    SPELL_SEDUCTION         = 47057,
    SPELL_FIERY_AURA        = 45427
};

class npc_dancing_flames : public CreatureScript
{
public:
    npc_dancing_flames() : CreatureScript("npc_dancing_flames") { }

    struct npc_dancing_flamesAI : public ScriptedAI
    {
        npc_dancing_flamesAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            Active = true;
            CanIteract = 3500;
        }

        bool Active;
        uint32 CanIteract;

        void Reset() override
        {
            Initialize();
            DoCast(me, SPELL_BRAZIER, true);
            DoCast(me, SPELL_FIERY_AURA, false);
            float x, y, z;
            me->GetPosition(x, y, z);
            me->Relocate(x, y, z + 0.94f);
            me->SetDisableGravity(true);
            me->HandleEmoteCommand(EMOTE_ONESHOT_DANCE);
            WorldPacket data;                       //send update position to client
            me->BuildHeartBeatMsg(&data);
            me->SendMessageToSet(&data, true);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!Active)
            {
                if (CanIteract <= diff)
                {
                    Active = true;
                    CanIteract = 3500;
                    me->HandleEmoteCommand(EMOTE_ONESHOT_DANCE);
                }
                else
                    CanIteract -= diff;
            }
        }

        void EnterCombat(Unit* /*who*/) override { }

        void ReceiveEmote(Player* player, uint32 emote) override
        {
            if (me->IsWithinLOS(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ()) && me->IsWithinDistInMap(player, 30.0f))
            {
                me->SetInFront(player);
                Active = false;

                WorldPacket data;
                me->BuildHeartBeatMsg(&data);
                me->SendMessageToSet(&data, true);
                switch (emote)
                {
                    case TEXT_EMOTE_KISS:
                        me->HandleEmoteCommand(EMOTE_ONESHOT_SHY);
                        break;
                    case TEXT_EMOTE_WAVE:
                        me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                        break;
                    case TEXT_EMOTE_BOW:
                        me->HandleEmoteCommand(EMOTE_ONESHOT_BOW);
                        break;
                    case TEXT_EMOTE_JOKE:
                        me->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
                        break;
                    case TEXT_EMOTE_DANCE:
                        if (!player->HasAura(SPELL_SEDUCTION))
                            DoCast(player, SPELL_SEDUCTION, true);
                        break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_dancing_flamesAI(creature);
    }
};

/*######
## Triage quest
######*/

enum Doctor
{
    SAY_DOC             = 0,

    DOCTOR_ALLIANCE     = 12939,
    DOCTOR_HORDE        = 12920,
    ALLIANCE_COORDS     = 7,
    HORDE_COORDS        = 6
};

Position const AllianceCoords[]=
{
    {-3757.38f, -4533.05f, 14.16f, 3.62f},                      // Top-far-right bunk as seen from entrance
    {-3754.36f, -4539.13f, 14.16f, 5.13f},                      // Top-far-left bunk
    {-3749.54f, -4540.25f, 14.28f, 3.34f},                      // Far-right bunk
    {-3742.10f, -4536.85f, 14.28f, 3.64f},                      // Right bunk near entrance
    {-3755.89f, -4529.07f, 14.05f, 0.57f},                      // Far-left bunk
    {-3749.51f, -4527.08f, 14.07f, 5.26f},                      // Mid-left bunk
    {-3746.37f, -4525.35f, 14.16f, 5.22f},                      // Left bunk near entrance
};

//alliance run to where
#define A_RUNTOX -3742.96f
#define A_RUNTOY -4531.52f
#define A_RUNTOZ 11.91f

Position const HordeCoords[]=
{
    {-1013.75f, -3492.59f, 62.62f, 4.34f},                      // Left, Behind
    {-1017.72f, -3490.92f, 62.62f, 4.34f},                      // Right, Behind
    {-1015.77f, -3497.15f, 62.82f, 4.34f},                      // Left, Mid
    {-1019.51f, -3495.49f, 62.82f, 4.34f},                      // Right, Mid
    {-1017.25f, -3500.85f, 62.98f, 4.34f},                      // Left, front
    {-1020.95f, -3499.21f, 62.98f, 4.34f}                       // Right, Front
};

//horde run to where
#define H_RUNTOX -1016.44f
#define H_RUNTOY -3508.48f
#define H_RUNTOZ 62.96f

uint32 const AllianceSoldierId[3] =
{
    12938,                                                  // 12938 Injured Alliance Soldier
    12936,                                                  // 12936 Badly injured Alliance Soldier
    12937                                                   // 12937 Critically injured Alliance Soldier
};

uint32 const HordeSoldierId[3] =
{
    12923,                                                  //12923 Injured Soldier
    12924,                                                  //12924 Badly injured Soldier
    12925                                                   //12925 Critically injured Soldier
};

/*######
## npc_doctor (handles both Gustaf Vanhowzen and Gregory Victor)
######*/
class npc_doctor : public CreatureScript
{
public:
    npc_doctor() : CreatureScript("npc_doctor") { }

    struct npc_doctorAI : public ScriptedAI
    {
        npc_doctorAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            PlayerGUID.Clear();

            SummonPatientTimer = 10000;
            SummonPatientCount = 0;
            PatientDiedCount = 0;
            PatientSavedCount = 0;

            Patients.clear();
            Coordinates.clear();

            Event = false;
        }

        ObjectGuid PlayerGUID;

        uint32 SummonPatientTimer;
        uint32 SummonPatientCount;
        uint32 PatientDiedCount;
        uint32 PatientSavedCount;

        bool Event;

        GuidList Patients;
        std::vector<Position const*> Coordinates;

        void Reset() override
        {
            Initialize();
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void BeginEvent(Player* player)
        {
            PlayerGUID = player->GetGUID();

            SummonPatientTimer = 10000;
            SummonPatientCount = 0;
            PatientDiedCount = 0;
            PatientSavedCount = 0;

            switch (me->GetEntry())
            {
                case DOCTOR_ALLIANCE:
                    for (uint8 i = 0; i < ALLIANCE_COORDS; ++i)
                        Coordinates.push_back(&AllianceCoords[i]);
                    break;
                case DOCTOR_HORDE:
                    for (uint8 i = 0; i < HORDE_COORDS; ++i)
                        Coordinates.push_back(&HordeCoords[i]);
                    break;
            }

            Event = true;
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void PatientDied(Position const* point)
        {
            Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
            if (player && ((player->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE) || (player->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE)))
            {
                ++PatientDiedCount;

                if (PatientDiedCount > 5 && Event)
                {
                    if (player->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE)
                        player->FailQuest(6624);
                    else if (player->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE)
                        player->FailQuest(6622);

                    Reset();
                    return;
                }

                Coordinates.push_back(point);
            }
            else
                // If no player or player abandon quest in progress
                Reset();
        }

        void PatientSaved(Creature* /*soldier*/, Player* player, Position const* point)
        {
            if (player && PlayerGUID == player->GetGUID())
            {
                if ((player->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE) || (player->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE))
                {
                    ++PatientSavedCount;

                    if (PatientSavedCount == 15)
                    {
                        if (!Patients.empty())
                        {
                            for (GuidList::const_iterator itr = Patients.begin(); itr != Patients.end(); ++itr)
                            {
                                if (Creature* patient = ObjectAccessor::GetCreature(*me, *itr))
                                    patient->setDeathState(JUST_DIED);
                            }
                        }

                        if (player->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE)
                            player->AreaExploredOrEventHappens(6624);
                        else if (player->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE)
                            player->AreaExploredOrEventHappens(6622);

                        Reset();
                        return;
                    }

                    Coordinates.push_back(point);
                }
            }
        }

        void UpdateAI(uint32 diff) override;

        void EnterCombat(Unit* /*who*/) override { }
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if ((quest->GetQuestId() == 6624) || (quest->GetQuestId() == 6622))
            ENSURE_AI(npc_doctor::npc_doctorAI, creature->AI())->BeginEvent(player);

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_doctorAI(creature);
    }
};

/*#####
## npc_injured_patient (handles all the patients, no matter Horde or Alliance)
#####*/

class npc_injured_patient : public CreatureScript
{
public:
    npc_injured_patient() : CreatureScript("npc_injured_patient") { }

    struct npc_injured_patientAI : public ScriptedAI
    {
        npc_injured_patientAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            DoctorGUID.Clear();
            Coord = NULL;
        }

        ObjectGuid DoctorGUID;
        Position const* Coord;

        void Reset() override
        {
            Initialize();

            //no select
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            //no regen health
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

            //to make them lay with face down
            me->SetUInt32Value(UNIT_FIELD_BYTES_1, UNIT_STAND_STATE_DEAD);

            uint32 mobId = me->GetEntry();

            switch (mobId)
            {                                                   //lower max health
                case 12923:
                case 12938:                                     //Injured Soldier
                    me->SetHealth(me->CountPctFromMaxHealth(75));
                    break;
                case 12924:
                case 12936:                                     //Badly injured Soldier
                    me->SetHealth(me->CountPctFromMaxHealth(50));
                    break;
                case 12925:
                case 12937:                                     //Critically injured Soldier
                    me->SetHealth(me->CountPctFromMaxHealth(25));
                    break;
            }
        }

        void EnterCombat(Unit* /*who*/) override { }

        void SpellHit(Unit* caster, SpellInfo const* spell) override
        {
            Player* player = caster->ToPlayer();
            if (!player || !me->IsAlive() || spell->Id != 20804)
                return;

            if (player->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE)
                if (DoctorGUID)
                    if (Creature* doctor = ObjectAccessor::GetCreature(*me, DoctorGUID))
                        ENSURE_AI(npc_doctor::npc_doctorAI, doctor->AI())->PatientSaved(me, player, Coord);

            //make not selectable
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            //regen health
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

            //stand up
            me->SetUInt32Value(UNIT_FIELD_BYTES_1, UNIT_STAND_STATE_STAND);

            Talk(SAY_DOC);

            uint32 mobId = me->GetEntry();
            me->SetWalk(false);

            switch (mobId)
            {
                case 12923:
                case 12924:
                case 12925:
                    me->GetMotionMaster()->MovePoint(0, H_RUNTOX, H_RUNTOY, H_RUNTOZ);
                    break;
                case 12936:
                case 12937:
                case 12938:
                    me->GetMotionMaster()->MovePoint(0, A_RUNTOX, A_RUNTOY, A_RUNTOZ);
                    break;
            }
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            //lower HP on every world tick makes it a useful counter, not officlone though
            if (me->IsAlive() && me->GetHealth() > 6)
                me->ModifyHealth(-5);

            if (me->IsAlive() && me->GetHealth() <= 6)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->setDeathState(JUST_DIED);
                me->SetFlag(UNIT_DYNAMIC_FLAGS, 32);

                if (DoctorGUID)
                    if (Creature* doctor = ObjectAccessor::GetCreature((*me), DoctorGUID))
                        ENSURE_AI(npc_doctor::npc_doctorAI, doctor->AI())->PatientDied(Coord);
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_injured_patientAI(creature);
    }
};

void npc_doctor::npc_doctorAI::UpdateAI(uint32 diff)
{
    if (Event && SummonPatientCount >= 20)
    {
        Reset();
        return;
    }

    if (Event)
    {
        if (SummonPatientTimer <= diff)
        {
            if (Coordinates.empty())
                return;

            uint32 patientEntry = 0;

            switch (me->GetEntry())
            {
                case DOCTOR_ALLIANCE:
                    patientEntry = AllianceSoldierId[rand32() % 3];
                    break;
                case DOCTOR_HORDE:
                    patientEntry = HordeSoldierId[rand32() % 3];
                    break;
                default:
                    TC_LOG_ERROR("scripts", "Invalid entry for Triage doctor. Please check your database");
                    return;
            }

            std::vector<Position const*>::iterator point = Coordinates.begin();
            std::advance(point, urand(0, Coordinates.size() - 1));

            if (Creature* Patient = me->SummonCreature(patientEntry, **point, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000))
            {
                //303, this flag appear to be required for client side item->spell to work (TARGET_SINGLE_FRIEND)
                Patient->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);

                Patients.push_back(Patient->GetGUID());
                ENSURE_AI(npc_injured_patient::npc_injured_patientAI, Patient->AI())->DoctorGUID = me->GetGUID();
                ENSURE_AI(npc_injured_patient::npc_injured_patientAI, Patient->AI())->Coord = *point;

                Coordinates.erase(point);
            }

            SummonPatientTimer = 10000;
            ++SummonPatientCount;
        }
        else
            SummonPatientTimer -= diff;
    }
}

/*######
## npc_garments_of_quests
######*/

/// @todo get text for each NPC

enum Garments
{
	SPELL_LESSER_HEAL_R2 = 2052,
	SPELL_FORTITUDE_R1 = 1243,

	QUEST_MOON = 5621,
	QUEST_LIGHT_1 = 5624,
	QUEST_LIGHT_2 = 5625,
	QUEST_SPIRIT = 5648,
	QUEST_DARKNESS = 5650,
	QUEST_TAVARA = 9586,

	ENTRY_SHAYA = 12429,
	ENTRY_ROBERTS = 12423,
	ENTRY_DOLF = 12427,
	ENTRY_KORJA = 12430,
	ENTRY_DG_KEL = 12428,
	ENTRY_TAVARA = 17551,

	// used by 12429, 12423, 12427, 12430, 12428, but signed for 12429
	SAY_THANKS = 0,
	SAY_GOODBYE = 1,
	SAY_HEALED = 2,
};

class npc_garments_of_quests : public CreatureScript
{
public:
	npc_garments_of_quests() : CreatureScript("npc_garments_of_quests") { }

	struct npc_garments_of_questsAI : public npc_escortAI
	{
		npc_garments_of_questsAI(Creature* creature) : npc_escortAI(creature)
		{
            switch (me->GetEntry())
            {
                case ENTRY_SHAYA:
                    quest = QUEST_MOON;
                    break;
                case ENTRY_ROBERTS:
                    quest = QUEST_LIGHT_1;
                    break;
                case ENTRY_DOLF:
                    quest = QUEST_LIGHT_2;
                    break;
                case ENTRY_KORJA:
                    quest = QUEST_SPIRIT;
                    break;
                case ENTRY_DG_KEL:
                    quest = QUEST_DARKNESS;
                    break;
				case ENTRY_TAVARA:
					quest = QUEST_TAVARA;
					break;
                default:
                    quest = 0;
                    break;
            }

			Reset();
		}

		ObjectGuid CasterGUID;

		bool IsHealed;
		bool CanRun;

		uint32 RunAwayTimer;
        uint32 quest;

		void Reset() override
		{
			CasterGUID.Clear();

			IsHealed = false;
			CanRun = false;

			RunAwayTimer = 5000;

			me->SetStandState(UNIT_STAND_STATE_KNEEL);
			// expect database to have RegenHealth=0
			me->SetHealth(me->CountPctFromMaxHealth(70));
		}

		void EnterCombat(Unit* /*who*/) override { }

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_LESSER_HEAL_R2 || spell->Id == SPELL_FORTITUDE_R1)
			{
				//not while in combat
				if (me->IsInCombat())
					return;

				//nothing to be done now
				if (IsHealed && CanRun)
					return;

				if (Player* player = caster->ToPlayer())
				{
					if (quest && player->GetQuestStatus(quest) == QUEST_STATUS_INCOMPLETE)
					{

						if (IsHealed && !CanRun && spell->Id == SPELL_FORTITUDE_R1)
						{
							Talk(SAY_THANKS, caster);
							CanRun = true;
						}
						else if (!IsHealed && spell->Id == SPELL_LESSER_HEAL_R2)
						{
							CasterGUID = caster->GetGUID();
							me->SetStandState(UNIT_STAND_STATE_STAND);
							Talk(SAY_HEALED, caster);
							IsHealed = true;
						}
					}

					// give quest credit, not expect any special quest objectives
					if (CanRun)
						player->TalkedToCreature(me->GetEntry(), me->GetGUID());
				}
			}
		}

		void WaypointReached(uint32 /*waypointId*/) override
		{

		}

		void UpdateAI(uint32 diff) override
		{
			if (CanRun && !me->IsInCombat())
			{
				if (RunAwayTimer <= diff)
				{
					if (Unit* unit = ObjectAccessor::GetUnit(*me, CasterGUID))
					{
						switch (me->GetEntry())
						{
						case ENTRY_SHAYA:
						case ENTRY_ROBERTS:
						case ENTRY_DOLF:
						case ENTRY_KORJA:
						case ENTRY_DG_KEL:
						case ENTRY_TAVARA:
							Talk(SAY_GOODBYE, unit);
							break;
						}

						if (me->GetEntry() == ENTRY_TAVARA)
							me->DespawnOrUnsummon(4000);
						else
							Start(false, true);

					}
					else
						EnterEvadeMode();                       //something went wrong

					RunAwayTimer = 30000;
				}
				else
					RunAwayTimer -= diff;
			}

			npc_escortAI::UpdateAI(diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_garments_of_questsAI(creature);
	}
};

/*######
## npc_guardian
######*/

enum GuardianSpells
{
    SPELL_DEATHTOUCH            = 5
};

class npc_guardian : public CreatureScript
{
public:
    npc_guardian() : CreatureScript("npc_guardian") { }

    struct npc_guardianAI : public ScriptedAI
    {
        npc_guardianAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }

        void EnterCombat(Unit* /*who*/) override
        {
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (!UpdateVictim())
                return;

            if (me->isAttackReady())
            {
                DoCastVictim(SPELL_DEATHTOUCH, true);
                me->resetAttackTimer();
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_guardianAI(creature);
    }
};

/*######
## npc_sayge
######*/

enum Sayge
{
    SPELL_DMG      = 23768, // dmg
    SPELL_RES      = 23769, // res
    SPELL_ARM      = 23767, // arm
    SPELL_SPI      = 23738, // spi
    SPELL_INT      = 23766, // int
    SPELL_STM      = 23737, // stm
    SPELL_STR      = 23735, // str
    SPELL_AGI      = 23736, // agi
    SPELL_FORTUNE  = 23765  // faire fortune
};

#define GOSSIP_HELLO_SAYGE          "Yes"
#define GOSSIP_SENDACTION_SAYGE1    "Slay the Man"
#define GOSSIP_SENDACTION_SAYGE2    "Turn him over to liege"
#define GOSSIP_SENDACTION_SAYGE3    "Confiscate the corn"
#define GOSSIP_SENDACTION_SAYGE4    "Let him go and have the corn"
#define GOSSIP_SENDACTION_SAYGE5    "Execute your friend painfully"
#define GOSSIP_SENDACTION_SAYGE6    "Execute your friend painlessly"
#define GOSSIP_SENDACTION_SAYGE7    "Let your friend go"
#define GOSSIP_SENDACTION_SAYGE8    "Confront the diplomat"
#define GOSSIP_SENDACTION_SAYGE9    "Show not so quiet defiance"
#define GOSSIP_SENDACTION_SAYGE10   "Remain quiet"
#define GOSSIP_SENDACTION_SAYGE11   "Speak against your brother openly"
#define GOSSIP_SENDACTION_SAYGE12   "Help your brother in"
#define GOSSIP_SENDACTION_SAYGE13   "Keep your brother out without letting him know"
#define GOSSIP_SENDACTION_SAYGE14   "Take credit, keep gold"
#define GOSSIP_SENDACTION_SAYGE15   "Take credit, share the gold"
#define GOSSIP_SENDACTION_SAYGE16   "Let the knight take credit"
#define GOSSIP_SENDACTION_SAYGE17   "Thanks"

class npc_sayge : public CreatureScript
{
public:
    npc_sayge() : CreatureScript("npc_sayge") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetSpellHistory()->HasCooldown(SPELL_INT) ||
            player->GetSpellHistory()->HasCooldown(SPELL_ARM) ||
            player->GetSpellHistory()->HasCooldown(SPELL_DMG) ||
            player->GetSpellHistory()->HasCooldown(SPELL_RES) ||
            player->GetSpellHistory()->HasCooldown(SPELL_STR) ||
            player->GetSpellHistory()->HasCooldown(SPELL_AGI) ||
            player->GetSpellHistory()->HasCooldown(SPELL_STM) ||
            player->GetSpellHistory()->HasCooldown(SPELL_SPI))
            player->SEND_GOSSIP_MENU(7393, creature->GetGUID());
        else
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_SAYGE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(7339, creature->GetGUID());
        }

        return true;
    }

    void SendAction(Player* player, Creature* creature, uint32 action)
    {
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE1,            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE2,            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE3,            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE4,            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                player->SEND_GOSSIP_MENU(7340, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE5,            GOSSIP_SENDER_MAIN + 1, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE6,            GOSSIP_SENDER_MAIN + 2, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE7,            GOSSIP_SENDER_MAIN + 3, GOSSIP_ACTION_INFO_DEF);
                player->SEND_GOSSIP_MENU(7341, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE8,            GOSSIP_SENDER_MAIN + 4, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE9,            GOSSIP_SENDER_MAIN + 5, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE10,           GOSSIP_SENDER_MAIN + 2, GOSSIP_ACTION_INFO_DEF);
                player->SEND_GOSSIP_MENU(7361, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE11,           GOSSIP_SENDER_MAIN + 6, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE12,           GOSSIP_SENDER_MAIN + 7, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE13,           GOSSIP_SENDER_MAIN + 8, GOSSIP_ACTION_INFO_DEF);
                player->SEND_GOSSIP_MENU(7362, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 5:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE14,           GOSSIP_SENDER_MAIN + 5, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE15,           GOSSIP_SENDER_MAIN + 4, GOSSIP_ACTION_INFO_DEF);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE16,           GOSSIP_SENDER_MAIN + 3, GOSSIP_ACTION_INFO_DEF);
                player->SEND_GOSSIP_MENU(7363, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SENDACTION_SAYGE17,           GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
                player->SEND_GOSSIP_MENU(7364, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 6:
                creature->CastSpell(player, SPELL_FORTUNE, false);
                player->SEND_GOSSIP_MENU(7365, creature->GetGUID());
                break;
        }
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        uint32 spellId = 0;
        switch (sender)
        {
            case GOSSIP_SENDER_MAIN:
                SendAction(player, creature, action);
                break;
            case GOSSIP_SENDER_MAIN + 1:
                spellId = SPELL_DMG;
                break;
            case GOSSIP_SENDER_MAIN + 2:
                spellId = SPELL_RES;
                break;
            case GOSSIP_SENDER_MAIN + 3:
                spellId = SPELL_ARM;
                break;
            case GOSSIP_SENDER_MAIN + 4:
                spellId = SPELL_SPI;
                break;
            case GOSSIP_SENDER_MAIN + 5:
                spellId = SPELL_INT;
                break;
            case GOSSIP_SENDER_MAIN + 6:
                spellId = SPELL_STM;
                break;
            case GOSSIP_SENDER_MAIN + 7:
                spellId = SPELL_STR;
                break;
            case GOSSIP_SENDER_MAIN + 8:
                spellId = SPELL_AGI;
                break;
        }

        if (spellId)
        {
            creature->CastSpell(player, spellId, false);
            player->GetSpellHistory()->AddCooldown(spellId, 0, std::chrono::hours(2));
            SendAction(player, creature, action);
        }
        return true;
    }
};

class npc_steam_tonk : public CreatureScript
{
public:
    npc_steam_tonk() : CreatureScript("npc_steam_tonk") { }

    struct npc_steam_tonkAI : public ScriptedAI
    {
        npc_steam_tonkAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override { }
        void EnterCombat(Unit* /*who*/) override { }

        void OnPossess(bool apply)
        {
            if (apply)
            {
                // Initialize the action bar without the melee attack command
                me->InitCharmInfo();
                me->GetCharmInfo()->InitEmptyActionBar(false);

                me->SetReactState(REACT_PASSIVE);
            }
            else
                me->SetReactState(REACT_AGGRESSIVE);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_steam_tonkAI(creature);
    }
};

enum TonkMine
{
    SPELL_TONK_MINE_DETONATE    = 25099
};

class npc_tonk_mine : public CreatureScript
{
public:
    npc_tonk_mine() : CreatureScript("npc_tonk_mine") { }

    struct npc_tonk_mineAI : public ScriptedAI
    {
        npc_tonk_mineAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
            me->SetReactState(REACT_PASSIVE);
        }

        void Initialize()
        {
            ExplosionTimer = 3000;
        }

        uint32 ExplosionTimer;

        void Reset() override
        {
            Initialize();
        }

        void EnterCombat(Unit* /*who*/) override { }
        void AttackStart(Unit* /*who*/) override { }
        void MoveInLineOfSight(Unit* /*who*/) override { }


        void UpdateAI(uint32 diff) override
        {
            if (ExplosionTimer <= diff)
            {
                DoCast(me, SPELL_TONK_MINE_DETONATE, true);
                me->setDeathState(DEAD); // unsummon it
            }
            else
                ExplosionTimer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tonk_mineAI(creature);
    }
};

enum TrainingDummy
{
    NPC_ADVANCED_TARGET_DUMMY                  = 2674,
    NPC_TARGET_DUMMY                           = 2673,

    EVENT_TD_CHECK_COMBAT                      = 1,
    EVENT_TD_DESPAWN                           = 2
};

class npc_training_dummy : public CreatureScript
{
public:
    npc_training_dummy() : CreatureScript("npc_training_dummy") { }

    struct npc_training_dummyAI : ScriptedAI
    {
        npc_training_dummyAI(Creature* creature) : ScriptedAI(creature)
        {
            SetCombatMovement(false);
        }

        EventMap _events;
        std::unordered_map<ObjectGuid, time_t> _damageTimes;

        void Reset() override
        {
            me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);//imune to knock aways like blast wave

            _events.Reset();
            _damageTimes.clear();
            if (me->GetEntry() != NPC_ADVANCED_TARGET_DUMMY && me->GetEntry() != NPC_TARGET_DUMMY)
                _events.ScheduleEvent(EVENT_TD_CHECK_COMBAT, 1000);
            else
                _events.ScheduleEvent(EVENT_TD_DESPAWN, 15000);
        }

        void EnterEvadeMode() override
        {
            if (!_EnterEvadeMode())
                return;

            Reset();
        }

        void DamageTaken(Unit* doneBy, uint32& damage) override
        {
            me->AddThreat(doneBy, float(damage));    // just to create threat reference
            _damageTimes[doneBy->GetGUID()] = time(NULL);
            damage = 0;
        }

        void UpdateAI(uint32 diff) override
        {
            if (!me->IsInCombat())
                return;

            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate

            _events.Update(diff);

            if (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_TD_CHECK_COMBAT:
                    {
                        time_t now = time(NULL);
                        for (std::unordered_map<ObjectGuid, time_t>::iterator itr = _damageTimes.begin(); itr != _damageTimes.end();)
                        {
                            // If unit has not dealt damage to training dummy for 5 seconds, remove him from combat
                            if (itr->second < now - 5)
                            {
                                if (Unit* unit = ObjectAccessor::GetUnit(*me, itr->first))
                                    unit->getHostileRefManager().deleteReference(me);

                                itr = _damageTimes.erase(itr);
                            }
                            else
                                ++itr;
                        }
                        _events.ScheduleEvent(EVENT_TD_CHECK_COMBAT, 1000);
                        break;
                    }
                    case EVENT_TD_DESPAWN:
                        me->DespawnOrUnsummon(1);
                        break;
                    default:
                        break;
                }
            }
        }

        void MoveInLineOfSight(Unit* /*who*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_training_dummyAI(creature);
    }
};

/*######
# npc_wormhole
######*/

#define GOSSIP_ENGINEERING1   "Borean Tundra"
#define GOSSIP_ENGINEERING2   "Howling Fjord"
#define GOSSIP_ENGINEERING3   "Sholazar Basin"
#define GOSSIP_ENGINEERING4   "Icecrown"
#define GOSSIP_ENGINEERING5   "Storm Peaks"
#define GOSSIP_ENGINEERING6   "Underground..."

enum WormholeSpells
{
    SPELL_BOREAN_TUNDRA         = 67834,
    SPELL_SHOLAZAR_BASIN        = 67835,
    SPELL_ICECROWN              = 67836,
    SPELL_STORM_PEAKS           = 67837,
    SPELL_HOWLING_FJORD         = 67838,
    SPELL_UNDERGROUND           = 68081,

    TEXT_WORMHOLE               = 907,

    DATA_SHOW_UNDERGROUND       = 1,
};

class npc_wormhole : public CreatureScript
{
    public:
        npc_wormhole() : CreatureScript("npc_wormhole") { }

        struct npc_wormholeAI : public PassiveAI
        {
            npc_wormholeAI(Creature* creature) : PassiveAI(creature)
            {
                Initialize();
            }

            void Initialize()
            {
                _showUnderground = urand(0, 100) == 0; // Guessed value, it is really rare though
            }

            void InitializeAI() override
            {
                Initialize();
            }

            uint32 GetData(uint32 type) const override
            {
                return (type == DATA_SHOW_UNDERGROUND && _showUnderground) ? 1 : 0;
            }

        private:
            bool _showUnderground;
        };

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (creature->IsSummon())
            {
                if (player == creature->ToTempSummon()->GetSummoner())
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

                    if (creature->AI()->GetData(DATA_SHOW_UNDERGROUND))
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ENGINEERING6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);

                    player->PlayerTalkClass->SendGossipMenu(TEXT_WORMHOLE, creature->GetGUID());
                }
            }

            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
        {
            player->PlayerTalkClass->ClearMenus();

            switch (action)
            {
                case GOSSIP_ACTION_INFO_DEF + 1: // Borean Tundra
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_BOREAN_TUNDRA, false);
                    break;
                case GOSSIP_ACTION_INFO_DEF + 2: // Howling Fjord
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_HOWLING_FJORD, false);
                    break;
                case GOSSIP_ACTION_INFO_DEF + 3: // Sholazar Basin
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_SHOLAZAR_BASIN, false);
                    break;
                case GOSSIP_ACTION_INFO_DEF + 4: // Icecrown
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_ICECROWN, false);
                    break;
                case GOSSIP_ACTION_INFO_DEF + 5: // Storm peaks
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_STORM_PEAKS, false);
                    break;
                case GOSSIP_ACTION_INFO_DEF + 6: // Underground
                    player->CLOSE_GOSSIP_MENU();
                    creature->CastSpell(player, SPELL_UNDERGROUND, false);
                    break;
            }

            return true;
        }

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_wormholeAI(creature);
        }
};

/*######
## npc_pet_trainer
######*/

enum PetTrainer
{
    TEXT_ISHUNTER               = 5838,
    TEXT_NOTHUNTER              = 5839,
    TEXT_PETINFO                = 13474,
    TEXT_CONFIRM                = 7722
};

#define GOSSIP_PET1             "How do I train my pet?"
#define GOSSIP_PET2             "I wish to untrain my pet."
#define GOSSIP_PET_CONFIRM      "Yes, please do."

class npc_pet_trainer : public CreatureScript
{
public:
    npc_pet_trainer() : CreatureScript("npc_pet_trainer") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->getClass() == CLASS_HUNTER)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_PET1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            if (player->GetPet() && player->GetPet()->getPetType() == HUNTER_PET)
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_PET2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

            player->PlayerTalkClass->SendGossipMenu(TEXT_ISHUNTER, creature->GetGUID());
            return true;
        }
        player->PlayerTalkClass->SendGossipMenu(TEXT_NOTHUNTER, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->PlayerTalkClass->SendGossipMenu(TEXT_PETINFO, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_PET_CONFIRM, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                    player->PlayerTalkClass->SendGossipMenu(TEXT_CONFIRM, creature->GetGUID());
                }
                break;
            case GOSSIP_ACTION_INFO_DEF + 3:
                {
                    player->ResetPetTalents();
                    player->CLOSE_GOSSIP_MENU();
                }
                break;
        }
        return true;
    }
};

/*######
## npc_locksmith
######*/

enum LockSmith
{
    QUEST_HOW_TO_BRAKE_IN_TO_THE_ARCATRAZ = 10704,
    QUEST_DARK_IRON_LEGACY                = 3802,
    QUEST_THE_KEY_TO_SCHOLOMANCE_A        = 5505,
    QUEST_THE_KEY_TO_SCHOLOMANCE_H        = 5511,
    QUEST_HOTTER_THAN_HELL_A              = 10758,
    QUEST_HOTTER_THAN_HELL_H              = 10764,
    QUEST_RETURN_TO_KHAGDAR               = 9837,
    QUEST_CONTAINMENT                     = 13159,
    QUEST_ETERNAL_VIGILANCE               = 11011,
    QUEST_KEY_TO_THE_FOCUSING_IRIS        = 13372,
    QUEST_HC_KEY_TO_THE_FOCUSING_IRIS     = 13375,

    ITEM_ARCATRAZ_KEY                     = 31084,
    ITEM_SHADOWFORGE_KEY                  = 11000,
    ITEM_SKELETON_KEY                     = 13704,
    ITEM_SHATTERED_HALLS_KEY              = 28395,
    ITEM_THE_MASTERS_KEY                  = 24490,
    ITEM_VIOLET_HOLD_KEY                  = 42482,
    ITEM_ESSENCE_INFUSED_MOONSTONE        = 32449,
    ITEM_KEY_TO_THE_FOCUSING_IRIS         = 44582,
    ITEM_HC_KEY_TO_THE_FOCUSING_IRIS      = 44581,

    SPELL_ARCATRAZ_KEY                    = 54881,
    SPELL_SHADOWFORGE_KEY                 = 54882,
    SPELL_SKELETON_KEY                    = 54883,
    SPELL_SHATTERED_HALLS_KEY             = 54884,
    SPELL_THE_MASTERS_KEY                 = 54885,
    SPELL_VIOLET_HOLD_KEY                 = 67253,
    SPELL_ESSENCE_INFUSED_MOONSTONE       = 40173,
};

#define GOSSIP_LOST_ARCATRAZ_KEY                "I've lost my key to the Arcatraz."
#define GOSSIP_LOST_SHADOWFORGE_KEY             "I've lost my key to the Blackrock Depths."
#define GOSSIP_LOST_SKELETON_KEY                "I've lost my key to the Scholomance."
#define GOSSIP_LOST_SHATTERED_HALLS_KEY         "I've lost my key to the Shattered Halls."
#define GOSSIP_LOST_THE_MASTERS_KEY             "I've lost my key to the Karazhan."
#define GOSSIP_LOST_VIOLET_HOLD_KEY             "I've lost my key to the Violet Hold."
#define GOSSIP_LOST_ESSENCE_INFUSED_MOONSTONE   "I've lost my Essence-Infused Moonstone."
#define GOSSIP_LOST_KEY_TO_THE_FOCUSING_IRIS    "I've lost my Key to the Focusing Iris."
#define GOSSIP_LOST_HC_KEY_TO_THE_FOCUSING_IRIS "I've lost my Heroic Key to the Focusing Iris."

class npc_locksmith : public CreatureScript
{
public:
    npc_locksmith() : CreatureScript("npc_locksmith") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        // Arcatraz Key
        if (player->GetQuestRewardStatus(QUEST_HOW_TO_BRAKE_IN_TO_THE_ARCATRAZ) && !player->HasItemCount(ITEM_ARCATRAZ_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_ARCATRAZ_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        // Shadowforge Key
        if (player->GetQuestRewardStatus(QUEST_DARK_IRON_LEGACY) && !player->HasItemCount(ITEM_SHADOWFORGE_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_SHADOWFORGE_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

        // Skeleton Key
        if ((player->GetQuestRewardStatus(QUEST_THE_KEY_TO_SCHOLOMANCE_A) || player->GetQuestRewardStatus(QUEST_THE_KEY_TO_SCHOLOMANCE_H)) &&
            !player->HasItemCount(ITEM_SKELETON_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_SKELETON_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

        // Shatered Halls Key
        if ((player->GetQuestRewardStatus(QUEST_HOTTER_THAN_HELL_A) || player->GetQuestRewardStatus(QUEST_HOTTER_THAN_HELL_H)) &&
            !player->HasItemCount(ITEM_SHATTERED_HALLS_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_SHATTERED_HALLS_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

        // Master's Key
        if (player->GetQuestRewardStatus(QUEST_RETURN_TO_KHAGDAR) && !player->HasItemCount(ITEM_THE_MASTERS_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_THE_MASTERS_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

        // Violet Hold Key
        if (player->GetQuestRewardStatus(QUEST_CONTAINMENT) && !player->HasItemCount(ITEM_VIOLET_HOLD_KEY, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_VIOLET_HOLD_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);

        // Essence-Infused Moonstone
        if (player->GetQuestRewardStatus(QUEST_ETERNAL_VIGILANCE) && !player->HasItemCount(ITEM_ESSENCE_INFUSED_MOONSTONE, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_ESSENCE_INFUSED_MOONSTONE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);

        // Key to the Focusing Iris
        if (player->GetQuestRewardStatus(QUEST_KEY_TO_THE_FOCUSING_IRIS) && !player->HasItemCount(ITEM_KEY_TO_THE_FOCUSING_IRIS, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_KEY_TO_THE_FOCUSING_IRIS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);

        // Heroic Key to the Focusing Iris
        if (player->GetQuestRewardStatus(QUEST_HC_KEY_TO_THE_FOCUSING_IRIS) && !player->HasItemCount(ITEM_HC_KEY_TO_THE_FOCUSING_IRIS, 1, true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOST_HC_KEY_TO_THE_FOCUSING_IRIS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_ARCATRAZ_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_SHADOWFORGE_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 3:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_SKELETON_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 4:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_SHATTERED_HALLS_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 5:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_THE_MASTERS_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 6:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_VIOLET_HOLD_KEY, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 7:
                player->CLOSE_GOSSIP_MENU();
                player->CastSpell(player, SPELL_ESSENCE_INFUSED_MOONSTONE, false);
                break;
            case GOSSIP_ACTION_INFO_DEF + 8:
                player->CLOSE_GOSSIP_MENU();
                player->AddItem(ITEM_KEY_TO_THE_FOCUSING_IRIS, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF + 9:
                player->CLOSE_GOSSIP_MENU();
                player->AddItem(ITEM_HC_KEY_TO_THE_FOCUSING_IRIS, 1);
                break;
        }
        return true;
    }
};

/*######
## npc_experience
######*/

#define EXP_COST                100000 //10 00 00 copper (10golds)
#define GOSSIP_TEXT_EXP         14736
#define GOSSIP_XP_OFF           "I no longer wish to gain experience."
#define GOSSIP_XP_ON            "I wish to start gaining experience again."

class npc_experience : public CreatureScript
{
public:
    npc_experience() : CreatureScript("npc_experience") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_XP_OFF, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_XP_ON, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        player->PlayerTalkClass->SendGossipMenu(GOSSIP_TEXT_EXP, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        bool noXPGain = player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_XP_GAIN);
        bool doSwitch = false;

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1://xp off
                {
                    if (!noXPGain)//does gain xp
                        doSwitch = true;//switch to don't gain xp
                }
                break;
            case GOSSIP_ACTION_INFO_DEF + 2://xp on
                {
                    if (noXPGain)//doesn't gain xp
                        doSwitch = true;//switch to gain xp
                }
                break;
        }
        if (doSwitch)
        {
            if (!player->HasEnoughMoney(EXP_COST))
                player->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, 0, 0, 0);
            else if (noXPGain)
            {
                player->ModifyMoney(-EXP_COST);
                player->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_XP_GAIN);
            }
            else if (!noXPGain)
            {
                player->ModifyMoney(-EXP_COST);
                player->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_XP_GAIN);
            }
        }
        player->PlayerTalkClass->SendCloseGossip();
        return true;
    }
};

enum Fireworks
{
    NPC_OMEN                = 15467,
    NPC_MINION_OF_OMEN      = 15466,
    NPC_FIREWORK_BLUE       = 15879,
    NPC_FIREWORK_GREEN      = 15880,
    NPC_FIREWORK_PURPLE     = 15881,
    NPC_FIREWORK_RED        = 15882,
    NPC_FIREWORK_YELLOW     = 15883,
    NPC_FIREWORK_WHITE      = 15884,
    NPC_FIREWORK_BIG_BLUE   = 15885,
    NPC_FIREWORK_BIG_GREEN  = 15886,
    NPC_FIREWORK_BIG_PURPLE = 15887,
    NPC_FIREWORK_BIG_RED    = 15888,
    NPC_FIREWORK_BIG_YELLOW = 15889,
    NPC_FIREWORK_BIG_WHITE  = 15890,

    NPC_CLUSTER_BLUE        = 15872,
    NPC_CLUSTER_RED         = 15873,
    NPC_CLUSTER_GREEN       = 15874,
    NPC_CLUSTER_PURPLE      = 15875,
    NPC_CLUSTER_WHITE       = 15876,
    NPC_CLUSTER_YELLOW      = 15877,
    NPC_CLUSTER_BIG_BLUE    = 15911,
    NPC_CLUSTER_BIG_GREEN   = 15912,
    NPC_CLUSTER_BIG_PURPLE  = 15913,
    NPC_CLUSTER_BIG_RED     = 15914,
    NPC_CLUSTER_BIG_WHITE   = 15915,
    NPC_CLUSTER_BIG_YELLOW  = 15916,
    NPC_CLUSTER_ELUNE       = 15918,

    GO_FIREWORK_LAUNCHER_1  = 180771,
    GO_FIREWORK_LAUNCHER_2  = 180868,
    GO_FIREWORK_LAUNCHER_3  = 180850,
    GO_CLUSTER_LAUNCHER_1   = 180772,
    GO_CLUSTER_LAUNCHER_2   = 180859,
    GO_CLUSTER_LAUNCHER_3   = 180869,
    GO_CLUSTER_LAUNCHER_4   = 180874,

    SPELL_ROCKET_BLUE       = 26344,
    SPELL_ROCKET_GREEN      = 26345,
    SPELL_ROCKET_PURPLE     = 26346,
    SPELL_ROCKET_RED        = 26347,
    SPELL_ROCKET_WHITE      = 26348,
    SPELL_ROCKET_YELLOW     = 26349,
    SPELL_ROCKET_BIG_BLUE   = 26351,
    SPELL_ROCKET_BIG_GREEN  = 26352,
    SPELL_ROCKET_BIG_PURPLE = 26353,
    SPELL_ROCKET_BIG_RED    = 26354,
    SPELL_ROCKET_BIG_WHITE  = 26355,
    SPELL_ROCKET_BIG_YELLOW = 26356,
    SPELL_LUNAR_FORTUNE     = 26522,

    ANIM_GO_LAUNCH_FIREWORK = 3,
    ZONE_MOONGLADE          = 493,
};

Position omenSummonPos = {7558.993f, -2839.999f, 450.0214f, 4.46f};

class npc_firework : public CreatureScript
{
public:
    npc_firework() : CreatureScript("npc_firework") { }

    struct npc_fireworkAI : public ScriptedAI
    {
        npc_fireworkAI(Creature* creature) : ScriptedAI(creature) { }

        bool isCluster()
        {
            switch (me->GetEntry())
            {
                case NPC_FIREWORK_BLUE:
                case NPC_FIREWORK_GREEN:
                case NPC_FIREWORK_PURPLE:
                case NPC_FIREWORK_RED:
                case NPC_FIREWORK_YELLOW:
                case NPC_FIREWORK_WHITE:
                case NPC_FIREWORK_BIG_BLUE:
                case NPC_FIREWORK_BIG_GREEN:
                case NPC_FIREWORK_BIG_PURPLE:
                case NPC_FIREWORK_BIG_RED:
                case NPC_FIREWORK_BIG_YELLOW:
                case NPC_FIREWORK_BIG_WHITE:
                    return false;
                case NPC_CLUSTER_BLUE:
                case NPC_CLUSTER_GREEN:
                case NPC_CLUSTER_PURPLE:
                case NPC_CLUSTER_RED:
                case NPC_CLUSTER_YELLOW:
                case NPC_CLUSTER_WHITE:
                case NPC_CLUSTER_BIG_BLUE:
                case NPC_CLUSTER_BIG_GREEN:
                case NPC_CLUSTER_BIG_PURPLE:
                case NPC_CLUSTER_BIG_RED:
                case NPC_CLUSTER_BIG_YELLOW:
                case NPC_CLUSTER_BIG_WHITE:
                case NPC_CLUSTER_ELUNE:
                default:
                    return true;
            }
        }

        GameObject* FindNearestLauncher()
        {
            GameObject* launcher = NULL;

            if (isCluster())
            {
                GameObject* launcher1 = GetClosestGameObjectWithEntry(me, GO_CLUSTER_LAUNCHER_1, 0.5f);
                GameObject* launcher2 = GetClosestGameObjectWithEntry(me, GO_CLUSTER_LAUNCHER_2, 0.5f);
                GameObject* launcher3 = GetClosestGameObjectWithEntry(me, GO_CLUSTER_LAUNCHER_3, 0.5f);
                GameObject* launcher4 = GetClosestGameObjectWithEntry(me, GO_CLUSTER_LAUNCHER_4, 0.5f);

                if (launcher1)
                    launcher = launcher1;
                else if (launcher2)
                    launcher = launcher2;
                else if (launcher3)
                    launcher = launcher3;
                else if (launcher4)
                    launcher = launcher4;
            }
            else
            {
                GameObject* launcher1 = GetClosestGameObjectWithEntry(me, GO_FIREWORK_LAUNCHER_1, 0.5f);
                GameObject* launcher2 = GetClosestGameObjectWithEntry(me, GO_FIREWORK_LAUNCHER_2, 0.5f);
                GameObject* launcher3 = GetClosestGameObjectWithEntry(me, GO_FIREWORK_LAUNCHER_3, 0.5f);

                if (launcher1)
                    launcher = launcher1;
                else if (launcher2)
                    launcher = launcher2;
                else if (launcher3)
                    launcher = launcher3;
            }

            return launcher;
        }

        uint32 GetFireworkSpell(uint32 entry)
        {
            switch (entry)
            {
                case NPC_FIREWORK_BLUE:
                    return SPELL_ROCKET_BLUE;
                case NPC_FIREWORK_GREEN:
                    return SPELL_ROCKET_GREEN;
                case NPC_FIREWORK_PURPLE:
                    return SPELL_ROCKET_PURPLE;
                case NPC_FIREWORK_RED:
                    return SPELL_ROCKET_RED;
                case NPC_FIREWORK_YELLOW:
                    return SPELL_ROCKET_YELLOW;
                case NPC_FIREWORK_WHITE:
                    return SPELL_ROCKET_WHITE;
                case NPC_FIREWORK_BIG_BLUE:
                    return SPELL_ROCKET_BIG_BLUE;
                case NPC_FIREWORK_BIG_GREEN:
                    return SPELL_ROCKET_BIG_GREEN;
                case NPC_FIREWORK_BIG_PURPLE:
                    return SPELL_ROCKET_BIG_PURPLE;
                case NPC_FIREWORK_BIG_RED:
                    return SPELL_ROCKET_BIG_RED;
                case NPC_FIREWORK_BIG_YELLOW:
                    return SPELL_ROCKET_BIG_YELLOW;
                case NPC_FIREWORK_BIG_WHITE:
                    return SPELL_ROCKET_BIG_WHITE;
                default:
                    return 0;
            }
        }

        uint32 GetFireworkGameObjectId()
        {
            uint32 spellId = 0;

            switch (me->GetEntry())
            {
                case NPC_CLUSTER_BLUE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BLUE);
                    break;
                case NPC_CLUSTER_GREEN:
                    spellId = GetFireworkSpell(NPC_FIREWORK_GREEN);
                    break;
                case NPC_CLUSTER_PURPLE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_PURPLE);
                    break;
                case NPC_CLUSTER_RED:
                    spellId = GetFireworkSpell(NPC_FIREWORK_RED);
                    break;
                case NPC_CLUSTER_YELLOW:
                    spellId = GetFireworkSpell(NPC_FIREWORK_YELLOW);
                    break;
                case NPC_CLUSTER_WHITE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_WHITE);
                    break;
                case NPC_CLUSTER_BIG_BLUE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_BLUE);
                    break;
                case NPC_CLUSTER_BIG_GREEN:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_GREEN);
                    break;
                case NPC_CLUSTER_BIG_PURPLE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_PURPLE);
                    break;
                case NPC_CLUSTER_BIG_RED:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_RED);
                    break;
                case NPC_CLUSTER_BIG_YELLOW:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_YELLOW);
                    break;
                case NPC_CLUSTER_BIG_WHITE:
                    spellId = GetFireworkSpell(NPC_FIREWORK_BIG_WHITE);
                    break;
                case NPC_CLUSTER_ELUNE:
                    spellId = GetFireworkSpell(urand(NPC_FIREWORK_BLUE, NPC_FIREWORK_WHITE));
                    break;
            }

            const SpellInfo* spellInfo = sSpellMgr->GetSpellInfo(spellId);

            if (spellInfo && spellInfo->Effects[0].Effect == SPELL_EFFECT_SUMMON_OBJECT_WILD)
                return spellInfo->Effects[0].MiscValue;

            return 0;
        }

        void Reset() override
        {
            if (GameObject* launcher = FindNearestLauncher())
            {
                launcher->SendCustomAnim(ANIM_GO_LAUNCH_FIREWORK);
                me->SetOrientation(launcher->GetOrientation() + float(M_PI) / 2);
            }
            else
                return;

            if (isCluster())
            {
                // Check if we are near Elune'ara lake south, if so try to summon Omen or a minion
                if (me->GetZoneId() == ZONE_MOONGLADE)
                {
                    if (!me->FindNearestCreature(NPC_OMEN, 100.0f, false) && me->GetDistance2d(omenSummonPos.GetPositionX(), omenSummonPos.GetPositionY()) <= 100.0f)
                    {
                        switch (urand(0, 9))
                        {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                                if (Creature* minion = me->SummonCreature(NPC_MINION_OF_OMEN, me->GetPositionX()+frand(-5.0f, 5.0f), me->GetPositionY()+frand(-5.0f, 5.0f), me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000))
                                    minion->AI()->AttackStart(me->SelectNearestPlayer(20.0f));
                                break;
                            case 9:
                                me->SummonCreature(NPC_OMEN, omenSummonPos);
                                break;
                        }
                    }
                }
                if (me->GetEntry() == NPC_CLUSTER_ELUNE)
                    DoCast(SPELL_LUNAR_FORTUNE);

                float displacement = 0.7f;
                for (uint8 i = 0; i < 4; i++)
                    me->SummonGameObject(GetFireworkGameObjectId(), me->GetPositionX() + (i%2 == 0 ? displacement : -displacement), me->GetPositionY() + (i > 1 ? displacement : -displacement), me->GetPositionZ() + 4.0f, me->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 1);
            }
            else
                //me->CastSpell(me, GetFireworkSpell(me->GetEntry()), true);
                me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), GetFireworkSpell(me->GetEntry()), true);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_fireworkAI(creature);
    }
};

/*#####
# npc_spring_rabbit
#####*/

enum rabbitSpells
{
    SPELL_SPRING_FLING          = 61875,
    SPELL_SPRING_RABBIT_JUMP    = 61724,
    SPELL_SPRING_RABBIT_WANDER  = 61726,
    SPELL_SUMMON_BABY_BUNNY     = 61727,
    SPELL_SPRING_RABBIT_IN_LOVE = 61728,
    NPC_SPRING_RABBIT           = 32791
};

class npc_spring_rabbit : public CreatureScript
{
public:
    npc_spring_rabbit() : CreatureScript("npc_spring_rabbit") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_spring_rabbitAI(creature);
    }

    struct npc_spring_rabbitAI : public ScriptedAI
    {
        npc_spring_rabbitAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            inLove = false;
            rabbitGUID.Clear();
            jumpTimer = urand(5000, 10000);
            bunnyTimer = urand(10000, 20000);
            searchTimer = urand(5000, 10000);
        }

        bool inLove;
        uint32 jumpTimer;
        uint32 bunnyTimer;
        uint32 searchTimer;
        ObjectGuid rabbitGUID;

        void Reset() override
        {
            Initialize();
            if (Unit* owner = me->GetOwner())
                me->GetMotionMaster()->MoveFollow(owner, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
        }

        void EnterCombat(Unit* /*who*/) override { }

        void DoAction(int32 /*param*/) override
        {
            inLove = true;
            if (Unit* owner = me->GetOwner())
                owner->CastSpell(owner, SPELL_SPRING_FLING, true);
        }

        void UpdateAI(uint32 diff) override
        {
            if (inLove)
            {
                if (jumpTimer <= diff)
                {
                    if (Unit* rabbit = ObjectAccessor::GetUnit(*me, rabbitGUID))
                        DoCast(rabbit, SPELL_SPRING_RABBIT_JUMP);
                    jumpTimer = urand(5000, 10000);
                } else jumpTimer -= diff;

                if (bunnyTimer <= diff)
                {
                    DoCast(SPELL_SUMMON_BABY_BUNNY);
                    bunnyTimer = urand(20000, 40000);
                } else bunnyTimer -= diff;
            }
            else
            {
                if (searchTimer <= diff)
                {
                    if (Creature* rabbit = me->FindNearestCreature(NPC_SPRING_RABBIT, 10.0f))
                    {
                        if (rabbit == me || rabbit->HasAura(SPELL_SPRING_RABBIT_IN_LOVE))
                            return;

                        me->AddAura(SPELL_SPRING_RABBIT_IN_LOVE, me);
                        DoAction(1);
                        rabbit->AddAura(SPELL_SPRING_RABBIT_IN_LOVE, rabbit);
                        rabbit->AI()->DoAction(1);
                        rabbit->CastSpell(rabbit, SPELL_SPRING_RABBIT_JUMP, true);
                        rabbitGUID = rabbit->GetGUID();
                    }
                    searchTimer = urand(5000, 10000);
                } else searchTimer -= diff;
            }
        }
    };
};

class npc_imp_in_a_ball : public CreatureScript
{
private:
    enum
    {
        SAY_RANDOM,

        EVENT_TALK = 1,
    };

public:
    npc_imp_in_a_ball() : CreatureScript("npc_imp_in_a_ball") { }

    struct npc_imp_in_a_ballAI : public ScriptedAI
    {
        npc_imp_in_a_ballAI(Creature* creature) : ScriptedAI(creature)
        {
            summonerGUID.Clear();
        }

        void IsSummonedBy(Unit* summoner) override
        {
            if (summoner->GetTypeId() == TYPEID_PLAYER)
            {
                summonerGUID = summoner->GetGUID();
                events.ScheduleEvent(EVENT_TALK, 3000);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            if (events.ExecuteEvent() == EVENT_TALK)
            {
                if (Player* owner = ObjectAccessor::GetPlayer(*me, summonerGUID))
                {
                    sCreatureTextMgr->SendChat(me, SAY_RANDOM, owner,
                        owner->GetGroup() ? CHAT_MSG_MONSTER_PARTY : CHAT_MSG_MONSTER_WHISPER, LANG_ADDON, TEXT_RANGE_NORMAL);
                }
            }
        }

    private:
        EventMap events;
        ObjectGuid summonerGUID;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_imp_in_a_ballAI(creature);
    }
};

enum StableMasters
{
	SPELL_MINIWING = 54573,
	SPELL_JUBLING = 54611,
	SPELL_DARTER = 54619,
	SPELL_WORG = 54631,
	SPELL_SMOLDERWEB = 54634,
	SPELL_CHIKEN = 54677,
	SPELL_WOLPERTINGER = 54688,

	STABLE_MASTER_GOSSIP_SUB_MENU = 9820
};

class npc_stable_master : public CreatureScript
{
public:
	npc_stable_master() : CreatureScript("npc_stable_master") { }

	struct npc_stable_masterAI : public SmartAI
	{
		npc_stable_masterAI(Creature* creature) : SmartAI(creature) { }

		void sGossipSelect(Player* player, uint32 menuId, uint32 gossipListId) override
		{
			SmartAI::sGossipSelect(player, menuId, gossipListId);
			if (menuId != STABLE_MASTER_GOSSIP_SUB_MENU)
				return;

			switch (gossipListId)
			{
			case 0:
				player->CastSpell(player, SPELL_MINIWING, false);
				break;
			case 1:
				player->CastSpell(player, SPELL_JUBLING, false);
				break;
			case 2:
				player->CastSpell(player, SPELL_DARTER, false);
				break;
			case 3:
				player->CastSpell(player, SPELL_WORG, false);
				break;
			case 4:
				player->CastSpell(player, SPELL_SMOLDERWEB, false);
				break;
			case 5:
				player->CastSpell(player, SPELL_CHIKEN, false);
				break;
			case 6:
				player->CastSpell(player, SPELL_WOLPERTINGER, false);
				break;
			default:
				return;
			}

			player->PlayerTalkClass->SendCloseGossip();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_stable_masterAI(creature);
	}
};

class npc_zeppeling_power_core : public CreatureScript
{
private:
	enum
	{
		SAY_RANDOM,

		EVENT_ENERGIZE = 1,
		EVENT_STOP_ENERGIZE = 2,
	};

	enum spells
	{
		SPELL_PERIODIC_ENERGIZE = 42491
	};

public:
	npc_zeppeling_power_core() : CreatureScript("npc_zeppeling_power_core") { }

	struct npc_zeppeling_power_coreAI : public ScriptedAI
	{
		npc_zeppeling_power_coreAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.ScheduleEvent(EVENT_ENERGIZE, urand(15 * IN_MILLISECONDS, 30 * IN_MILLISECONDS));
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_ENERGIZE:
					if (!me->HasAura(SPELL_PERIODIC_ENERGIZE))
					{
						me->AddAura(SPELL_PERIODIC_ENERGIZE, me);
					}
					events.ScheduleEvent(EVENT_STOP_ENERGIZE, urand(25 * IN_MILLISECONDS, 40 * IN_MILLISECONDS));
					break;
				case EVENT_STOP_ENERGIZE:
					if (me->HasAura(SPELL_PERIODIC_ENERGIZE))
					{
						me->RemoveAurasDueToSpell(SPELL_PERIODIC_ENERGIZE);
					}
					events.ScheduleEvent(EVENT_ENERGIZE, urand(15 * IN_MILLISECONDS, 30 * IN_MILLISECONDS));
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		ObjectGuid summonerGUID;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_zeppeling_power_coreAI(creature);
	}
};

class npc_argent_tournament_mount : public CreatureScript
{
public:
	npc_argent_tournament_mount() : CreatureScript("npc_argent_tournament_mount") { }

	struct npc_argent_tournament_mountAI : public PassiveAI
	{
		npc_argent_tournament_mountAI(Creature* creature) : PassiveAI(creature)
		{
		}

		void OnCharmed(bool /*apply*/) override
		{
			if (Unit* charmer = me->GetCharmer())
				if (charmer->GetTypeId() == TYPEID_PLAYER)
					charmer->AddAura(63034, charmer);
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_argent_tournament_mountAI(creature);
	}
};


// Dark Iron Guzzler in the Brewfest achievement 'Down With The Dark Iron'
enum DarkIronGuzzler
{
	NPC_DARK_IRON_GUZZLER = 23709,
	NPC_DARK_IRON_HERALD = 24536,
	NPC_DARK_IRON_SPAWN_BUNNY = 23894,

	NPC_FESTIVE_KEG_1 = 23702, // Thunderbrew Festive Keg
	NPC_FESTIVE_KEG_2 = 23700, // Barleybrew Festive Keg
	NPC_FESTIVE_KEG_3 = 23706, // Gordok Festive Keg
	NPC_FESTIVE_KEG_4 = 24373, // T'chalis's Festive Keg
	NPC_FESTIVE_KEG_5 = 24372, // Drohn's Festive Keg

	SPELL_GO_TO_NEW_TARGET = 42498,
	SPELL_ATTACK_KEG = 42393,
	SPELL_RETREAT = 42341,
	SPELL_DRINK = 42436,

	SAY_RANDOM = 0,
};

class npc_dark_iron_guzzler : public CreatureScript
{
public:
	npc_dark_iron_guzzler() : CreatureScript("npc_dark_iron_guzzler") { }

	CreatureAI *GetAI(Creature* creature) const
	{
		return new npc_dark_iron_guzzlerAI(creature);
	}

	struct npc_dark_iron_guzzlerAI : public ScriptedAI
	{
		npc_dark_iron_guzzlerAI(Creature* creature) : ScriptedAI(creature) { }

		bool atKeg;
		bool playersLost;
		bool barleyAlive;
		bool thunderAlive;
		bool gordokAlive;
		bool drohnAlive;
		bool tchaliAlive;

		uint32 AttackKegTimer;
		uint32 TalkTimer;

		void Reset()
		{
			AttackKegTimer = 5000;
			TalkTimer = (urand(4000, 12000));
			me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			me->GetMotionMaster()->MoveRandom(75.0f);
		}

			void SpellHit(Unit* caster, const SpellInfo* spell) override
		{
			if (spell->Id == SPELL_DRINK)
			{
				// Fake death - it's only visual!
				me->StopMoving();
				me->SetUInt32Value(UNIT_FIELD_BYTES_1, UNIT_STAND_STATE_DEAD);

				// Time based on information from videos
				me->DespawnOrUnsummon(7000);
			}



		}

			void MovementInform(uint32 Type, uint32 PointId) override
		{
			if (Type != POINT_MOTION_TYPE)
			return;

			// Arrived at the retreat spot, we should despawn
			if (PointId == 1 || PointId == 2)
				me->DespawnOrUnsummon(7000);

			// Arrived at the new keg - the spell has conditions in database
			/*if (PointId == 4 || PointId == 5 || PointId == 6 || PointId == 7 || PointId == 8 || PointId == 9)
			{
			DoCast(SPELL_ATTACK_KEG);
			me->SetByteFlag(UNIT_FIELD_BYTES_1, 1, 0x01); // Sit down
			atKeg = true;
			}*/
		}

			void UpdateAI(uint32 diff) override
		{
			if (!IsHolidayActive(HOLIDAY_BREWFEST))
			return;

			// If all kegs are dead we should retreat because we have won

			/*if (Player* p = me->SelectNearestPlayer(8.0f))
			me->AI()->DoCast(p, 42299); // Knockback*/

			if (TalkTimer <= diff)
			{
				me->AI()->Talk(SAY_RANDOM);
				TalkTimer = (urand(12000, 22000));
			}
			else TalkTimer -= diff;

			// Only happens if we're at keg
			/*if (atKeg)
			{
			if (AttackKegTimer <= diff)
			{
			DoCast(SPELL_ATTACK_KEG);
			AttackKegTimer = 5000;
			}
			else AttackKegTimer -= diff;
			}*/
		}
	};
};



// Brewfest Reveler.

enum BrewfestReveler
{
	SPELL_BREWFEST_TOAST = 41586
};

class npc_brewfest_reveler : public CreatureScript
{
public:
	npc_brewfest_reveler() : CreatureScript("npc_brewfest_reveler") {}

	struct npc_brewfest_revelerAI : public ScriptedAI
	{
		npc_brewfest_revelerAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_DANCE);
		}

		void ReceiveEmote(Player* player, uint32 emote) override
		{

			if (emote == TEXT_EMOTE_DANCE)
			me->CastSpell(player, SPELL_BREWFEST_TOAST, false);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_brewfest_revelerAI(creature);
	}
};

uint32 brewfestDunMoroghSounds[3] = { 11810, 11812, 11813 };
uint32 brewfestGoblinsSounds[3] = { 11811, 11814, 11815 };

uint32 darkIronEventSound = 11832;

// Down with the Dark Iron - event generator.

class npc_dark_iron_event_generator : public CreatureScript
{

private:

	enum MyNPCs
	{
		NPC_MEKKATORQUE = 39271,
		NPC_VOLJIN = 31649
	};

	enum MyEvents
	{
		EVENT_START_EVENT = 1,
		EVENT_SUMMON_MOLE_MACHINES,
		EVENT_HIDE_MYSELF,
		EVENT_PLAY_AMBIENCE_MUSIC,
		EVENT_HERALD_ACTION,
		EVENT_SUMMON_KEG_SELECTION,
		EVENT_FINISH_EVENT,
		EVENT_FINISH_EVENT_1,
		EVENT_FINISH_EVENT_2,

		EVENT_START_BOSS_EVENT
	};

	enum MySpells
	{
		SPELL_SUMMON_MOLE_MACHINE = 62899,

		// Quest
		SPELL_PLANS_A = 48145,
		SPELL_PLANS_H = 49318,
	};

public:
	npc_dark_iron_event_generator() : CreatureScript("npc_dark_iron_event_generator") { }

	struct npc_dark_iron_event_generatorAI : public ScriptedAI
	{
		npc_dark_iron_event_generatorAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void Reset() override
		{
			eventStarted = false;
			eventStartTimer = urand(1800 * IN_MILLISECONDS, 2400 * IN_MILLISECONDS); // 1800
			eventFinishTimer = 90 * IN_MILLISECONDS; // 300
			bossEventTimer = 600 * IN_MILLISECONDS; // 10 minutes after the generator's reset - Mekkatorque / Vol'Jin event.

			eventStartLeftTime = eventStartTimer;

			events.ScheduleEvent(EVENT_START_BOSS_EVENT, bossEventTimer);
			events.ScheduleEvent(EVENT_START_EVENT, eventStartTimer);
			events.ScheduleEvent(EVENT_PLAY_AMBIENCE_MUSIC, 30 * IN_MILLISECONDS);
		}

			void ActivateRevelers()
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, 24484, 150.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(150.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
				{
					if ((*i)->IsAlive())
						(*i)->AI()->Talk(0);
					(*i)->GetMotionMaster()->MovePoint(0, me->GetPositionX() + 55, me->GetPositionY() + 60, me->GetPositionZ());
					(*i)->DespawnOrUnsummon(8 * IN_MILLISECONDS);
				}
			}
		}


		void EnterCombat(Unit* /*who*/) override{}

			void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			if (eventStartLeftTime >= diff)
				eventStartLeftTime -= diff;


			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_EVENT:
					if (herald = me->SummonCreature(24536, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
					{
						herald->PlayDirectSound(darkIronEventSound); // Music
						herald->AI()->Talk(0);
						events.ScheduleEvent(EVENT_HERALD_ACTION, 40 * IN_MILLISECONDS);
					}

					ActivateRevelers();
					eventStarted = true;
					events.ScheduleEvent(EVENT_SUMMON_MOLE_MACHINES, 8 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_SUMMON_KEG_SELECTION, 9 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_FINISH_EVENT, eventFinishTimer);

					break;
				case EVENT_HERALD_ACTION:
					if (herald && eventStarted)
					{
						me->PlayDirectSound(darkIronEventSound); // Music
						herald->AI()->Talk(1);
						events.ScheduleEvent(EVENT_HERALD_ACTION, 40 * IN_MILLISECONDS);
					}
					break;
				case EVENT_PLAY_AMBIENCE_MUSIC:
					if (!eventStarted)
						if (eventStartLeftTime >= (120 * IN_MILLISECONDS))
						{
							switch (me->GetAreaId())
							{
							case 1: // Dun Morogh
								me->PlayDirectSound(brewfestDunMoroghSounds[urand(0, 2)]);
								break;
							case 1296:// Durotar
								me->PlayDirectSound(brewfestGoblinsSounds[urand(0, 2)]);
								break;
							default:
								break;
							}
						}
					events.ScheduleEvent(EVENT_PLAY_AMBIENCE_MUSIC, 120 * IN_MILLISECONDS);
					break;
				case EVENT_SUMMON_KEG_SELECTION:

					switch (me->GetAreaId())
					{
					case 1: // Dun Morogh
					if (me->SummonCreature(23706, -5145.75f, -575.66f, 397.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60 * IN_MILLISECONDS)) {} // Gordok
					if (me->SummonCreature(23700, -5187.22f, -599.66f, 397.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60 * IN_MILLISECONDS)) {} // Barleybrew
					if (me->SummonCreature(23702, -5160.22f, -632.63f, 397.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60 * IN_MILLISECONDS)) {} // Thunderbrew
					break;
					case 1296:// Durotar
					if (me->SummonCreature(24373, 1182.75f, -4272.66f, 21.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60 * IN_MILLISECONDS)) {} // T'chalis's
					if (me->SummonCreature(24372, 1183.75f, -4315.66f, 21.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60* IN_MILLISECONDS)) {} // Drohn's
					if (me->SummonCreature(23706, 1223.75f, -4296.66f, 21.17f, 0, TEMPSUMMON_TIMED_DESPAWN, 60 * IN_MILLISECONDS)) {} // Gordok
					break;
					default:
					break;
					}
					break;
				case EVENT_SUMMON_MOLE_MACHINES:

					for (uint8 i = 0; i < 3; i++)
					{
						float x;
						float y;
						switch (me->GetAreaId())
						{
						case 1: // Dun Morogh
							x = float(irand(5154, 5190));
							y = float(irand(575, 625));
							if (Creature* trigger = me->SummonCreature(198722, -x, -y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 9000)){}
							break;
						case 1296:// Durotar
							x = float(irand(1197, 1202));
							y = float(irand(4267, 4363));
							if (Creature* trigger = me->SummonCreature(198722, x, -y, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 9000)){}
							break;
						default:
							break;
						}
					}

					events.ScheduleEvent(EVENT_SUMMON_MOLE_MACHINES, 22 * IN_MILLISECONDS);
					break;
				case EVENT_FINISH_EVENT:

					if (herald)
					{
						switch (me->GetAreaId())
						{
						case 1: // Dun Morogh
							herald->AI()->Talk(2);
							break;
						case 1296:// Durotar
							herald->AI()->Talk(3);
							break;
						default:
							break;
						}
					}

					eventStarted = false;
					events.ScheduleEvent(EVENT_FINISH_EVENT_1, 8 * IN_MILLISECONDS);
					break;
				case EVENT_FINISH_EVENT_1:

					switch (me->GetAreaId())
					{
					case 1: // Dun Morogh
						DoCast(SPELL_PLANS_A);
						break;
					case 1296:// Durotar
						DoCast(SPELL_PLANS_H);
						break;
					default:
						break;
					}
					herald->DespawnOrUnsummon(1000);
					events.Reset();
					Reset();
					break;
				case EVENT_START_BOSS_EVENT:
					switch (me->GetAreaId())
					{
					case 1: // Dun Morogh, Mekkatorque.
						me->SummonCreature(NPC_MEKKATORQUE, -5242.0f, -567.72f, 403.68f, 1.522f);
						break;
					case 1296:// Durotar, Vol'Jin.
						me->SummonCreature(NPC_VOLJIN, 1200.81f, -4410.32f, 22.50f, 1.522f);
						break;
					}
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		bool eventStarted;
		uint32 eventStartTimer;
		uint32 eventStartLeftTime;
		uint32 eventFinishTimer;

		Creature* herald;

		uint32 bossEventTimer;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_dark_iron_event_generatorAI(creature);
	}
};


class npc_dark_iron_mole_spawner : public CreatureScript
{

private:

	enum MySpells
	{
		SPELL_SUMMON_MOLE_MACHINE = 62899,
	};

public:
	npc_dark_iron_mole_spawner() : CreatureScript("npc_dark_iron_mole_spawner") { }

	struct npc_dark_iron_mole_spawnerAI : public ScriptedAI
	{
		npc_dark_iron_mole_spawnerAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED);
		}

		uint32 SummonGobTimer;
		uint32 SummonNpcTimer;
		uint32 DissapearTimer;
		bool GobSummoned;
		bool NpcSummoned;

		void Reset() override
		{
			SummonGobTimer = 2000;
			SummonNpcTimer = 8000;
			DissapearTimer = 8000;
			GobSummoned = false;
			NpcSummoned = false;
		}

			void UpdateAI(uint32 Diff) override
		{
			if (!GobSummoned && SummonGobTimer <= Diff)
			{
				DoCast(SPELL_SUMMON_MOLE_MACHINE);
				GobSummoned = true;
			}
			else
				SummonGobTimer -= Diff;

			if (!NpcSummoned && SummonNpcTimer <= Diff)
			{

				for (uint8 i = 0; i < 2; i++)		// Summon 3 Dwarves per Mole Machine.
				{
					if (Creature* darkIron = me->SummonCreature(23709, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 20000)){}
				}


				NpcSummoned = true;
			}
			else
				SummonNpcTimer -= Diff;

			if (DissapearTimer <= Diff)
			{
				if (GameObject* molemachine = me->FindNearestGameObject(194316, 1))
					molemachine->Delete();

				me->DisappearAndDie();
			}
			else
				DissapearTimer -= Diff;
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_dark_iron_mole_spawnerAI(creature);
	}
};

class npc_brewfest_music_controller : public CreatureScript
{
private:
	enum MyEvents
	{
		EVENT_PLAY_AMBIENCE_MUSIC = 1
	};
public:
	npc_brewfest_music_controller() : CreatureScript("npc_brewfest_music_controller") {}

	struct npc_brewfest_music_controllerAI : public ScriptedAI
	{
		npc_brewfest_music_controllerAI(Creature* creature) : ScriptedAI(creature) { me->SetDisplayId(me->GetCreatureTemplate()->Modelid2); }


		void Reset()
		{
			events.ScheduleEvent(EVENT_PLAY_AMBIENCE_MUSIC, 20 * IN_MILLISECONDS);
		}


		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PLAY_AMBIENCE_MUSIC:
					switch (me->GetAreaId())
					{
					case 1: // Dun Morogh
						me->PlayDirectSound(brewfestDunMoroghSounds[urand(0, 2)]);
						break;
					case 14:// Durotar
						me->PlayDirectSound(brewfestGoblinsSounds[urand(0, 2)]);
						break;
					default:
						break;
					}
					events.ScheduleEvent(EVENT_PLAY_AMBIENCE_MUSIC, 120 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}
	private:
		EventMap events;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_brewfest_music_controllerAI(creature);
	}
};


// Mekkatorque, King of Gnomes.

class npc_brewmaster_mekkatorque : public CreatureScript
{
private:
	enum MyEvents
	{
		EVENT_START_MOVING = 1,
		EVENT_MOVE_POINT_2 = 2,
		EVENT_MOVE_POINT_3 = 3,
		EVENT_MOVE_UNMOUNT = 4,
		EVENT_MOVE_MOVE_TO_FINAL_POINT = 5,
		EVENT_FINAL_POINT_REACHED = 6,

		EVENT_SPEECH_1 = 7,
		EVENT_SPEECH_2 = 8,
		EVENT_SPEECH_3 = 9,
		EVENT_SPEECH_4 = 10,
		EVENT_SPEECH_5 = 11,
		EVENT_SPEECH_6 = 12,
		EVENT_SPEECH_7 = 13,
		EVENT_SPEECH_8 = 14,
		EVENT_SPEECH_9 = 15,
		EVENT_SPEECH_10 = 16,
		EVENT_SPEECH_11 = 17,
		EVENT_SPEECH_12 = 18,
		EVENT_SPEECH_13 = 19,
		EVENT_SPEECH_14 = 20,
		EVENT_SPEECH_15 = 21,
		EVENT_SPEECH_16 = 22,
	};

	enum MyNPCs
	{
		NPC_MEKKATORQUE_MOUNT = 40057,
	};

public:
	npc_brewmaster_mekkatorque() : CreatureScript("npc_brewmaster_mekkatorque") {}

	struct npc_brewmaster_mekkatorqueAI : public ScriptedAI
	{
		npc_brewmaster_mekkatorqueAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset()
		{

			if (mount = me->SummonCreature(NPC_MEKKATORQUE_MOUNT, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				me->EnterVehicle(mount, 0);

			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			events.ScheduleEvent(EVENT_START_MOVING, 3 * IN_MILLISECONDS);
		}


		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_MOVING:
					if (mount)
						mount->GetMotionMaster()->MovePoint(0, -5213.0f, -537.00f, 393.240f);
					events.ScheduleEvent(EVENT_MOVE_POINT_2, 7 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_POINT_2:
					if (mount)
						mount->GetMotionMaster()->MovePoint(0, -5186.0f, -559.72f, 397.240f);
					events.ScheduleEvent(EVENT_MOVE_POINT_3, 10 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_POINT_3:
					if (mount)
						mount->GetMotionMaster()->MovePoint(0, -5134.0f, -609.72f, 397.240f);
					events.ScheduleEvent(EVENT_MOVE_UNMOUNT, 10 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_UNMOUNT:
					me->ExitVehicle();
					if (mount)
						mount->DespawnOrUnsummon(2 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_MOVE_MOVE_TO_FINAL_POINT, 1 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_MOVE_TO_FINAL_POINT:
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(0, -5133.61f, -619.082f, 398.65f);
					events.ScheduleEvent(EVENT_FINAL_POINT_REACHED, 5 * IN_MILLISECONDS);
					break;
				case EVENT_FINAL_POINT_REACHED:
					me->SetOrientation(2.417f);
					me->SetFacingTo(2.417f);
					events.ScheduleEvent(EVENT_SPEECH_1, 3 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_1:
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
					Talk(0);
					events.ScheduleEvent(EVENT_SPEECH_2, 10 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_2:
					Talk(1);
					events.ScheduleEvent(EVENT_SPEECH_3, 15 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_3:
					Talk(2);
					events.ScheduleEvent(EVENT_SPEECH_4, 15 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_4:
					Talk(3);
					events.ScheduleEvent(EVENT_SPEECH_5, 10 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_5:
					// Maeve
					if (Creature* maeve = me->FindNearestCreature(23683, 150.0f))
						maeve->AI()->Talk(0);
					events.ScheduleEvent(EVENT_SPEECH_6, 4 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_6:
					Talk(4);
					events.ScheduleEvent(EVENT_SPEECH_7, 7 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_7:
					if (Creature* maeve = me->FindNearestCreature(23683, 150.0f))
						maeve->AI()->Talk(1);
					events.ScheduleEvent(EVENT_SPEECH_8, 4 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_8:
					Talk(5);
					events.ScheduleEvent(EVENT_SPEECH_9, 6 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_9:
					if (Creature* crowd = me->SummonCreature(23488, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000))
						crowd->AI()->Talk(0); // Five
					events.ScheduleEvent(EVENT_SPEECH_11, 2 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_11:
					me->AI()->Talk(6);
					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(1); // Four

					events.ScheduleEvent(EVENT_SPEECH_12, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_12:

					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(2); // Three

					events.ScheduleEvent(EVENT_SPEECH_13, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_13:

					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(3); // Two

					events.ScheduleEvent(EVENT_SPEECH_14, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_14:

					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(4); // One

					events.ScheduleEvent(EVENT_SPEECH_15, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_15:
					me->AI()->Talk(7);

					events.ScheduleEvent(EVENT_SPEECH_16, 6 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_16:
					me->AI()->Talk(8);
					DoCastAOE(42138);
					me->DespawnOrUnsummon(6 * IN_MILLISECONDS);

					break;
				default:
					break;
				}
			}
		}
	private:
		Creature* mount;
		EventMap events;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_brewmaster_mekkatorqueAI(creature);
	}
};
// 39271

// 63635

class npc_brewmaster_voljin : public CreatureScript
{
private:
	enum MyEvents
	{
		EVENT_START_MOVING = 1,
		EVENT_MOVE_POINT_2 = 2,
		EVENT_MOVE_POINT_3 = 3,
		EVENT_MOVE_UNMOUNT = 4,
		EVENT_MOVE_MOVE_TO_FINAL_POINT = 5,
		EVENT_FINAL_POINT_REACHED = 6,

		EVENT_SPEECH_1 = 7,
		EVENT_SPEECH_2 = 8,
		EVENT_SPEECH_3 = 9,
		EVENT_SPEECH_4 = 10,
		EVENT_SPEECH_5 = 11,
		EVENT_SPEECH_6 = 12,
		EVENT_SPEECH_7 = 13,
		EVENT_SPEECH_8 = 14,
		EVENT_SPEECH_9 = 15,
		EVENT_SPEECH_10 = 16,
		EVENT_SPEECH_11 = 17,
		EVENT_SPEECH_12 = 18,
		EVENT_SPEECH_13 = 19,
		EVENT_SPEECH_14 = 20,
		EVENT_SPEECH_15 = 21,
		EVENT_SPEECH_16 = 22,
	};

	enum MySpells
	{
		SPELL_RAPTOR_MOUNT = 63635,
	};

public:
	npc_brewmaster_voljin() : CreatureScript("npc_brewmaster_voljin") {}

	struct npc_brewmaster_voljinAI : public ScriptedAI
	{
		npc_brewmaster_voljinAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset()
		{

			DoCast(SPELL_RAPTOR_MOUNT);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			events.ScheduleEvent(EVENT_START_MOVING, 4 * IN_MILLISECONDS);
		}


		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_MOVING:
					//me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(0, 1201.56f, -4270.0f, 21.222f);
					events.ScheduleEvent(EVENT_MOVE_POINT_2, 16 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_POINT_2:
					me->RemoveAura(63635);
					me->GetMotionMaster()->MovePoint(0, 1209.0f, -4268.62f, 22.340f);
					events.ScheduleEvent(EVENT_MOVE_POINT_3, 4 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_POINT_3:
					me->SetOrientation(4.23f);
					me->SetFacingTo(4.23f);
					events.ScheduleEvent(EVENT_MOVE_UNMOUNT, 4 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_UNMOUNT: // Reutilizo el del Mekkatorque, no tengo tiempo ahora mismo.
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
					Talk(0);
					events.ScheduleEvent(EVENT_MOVE_MOVE_TO_FINAL_POINT, 10 * IN_MILLISECONDS);
					break;
				case EVENT_MOVE_MOVE_TO_FINAL_POINT:
					Talk(1);
					events.ScheduleEvent(EVENT_FINAL_POINT_REACHED, 6 * IN_MILLISECONDS);
					break;
				case EVENT_FINAL_POINT_REACHED:
					if (Creature* drohn = me->FindNearestCreature(24492, 150.0f))
						drohn->AI()->Talk(0);
					events.ScheduleEvent(EVENT_SPEECH_1, 4 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_1:
					Talk(2);
					events.ScheduleEvent(EVENT_SPEECH_2, 8 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_2:
					if (Creature* crowd = me->SummonCreature(23488, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000))
						crowd->AI()->Talk(0); // Five
					events.ScheduleEvent(EVENT_SPEECH_3, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_3:
					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(1); // Four
					events.ScheduleEvent(EVENT_SPEECH_4, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_4:
					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(2); // Three
					events.ScheduleEvent(EVENT_SPEECH_5, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_5:
					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(3); // Two
					events.ScheduleEvent(EVENT_SPEECH_6, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_6:
					if (Creature* crowd = me->FindNearestCreature(23488, 150.0f))
						crowd->AI()->Talk(4); // One
					events.ScheduleEvent(EVENT_SPEECH_7, 1 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_7:
					Talk(3);
					events.ScheduleEvent(EVENT_SPEECH_8, 9 * IN_MILLISECONDS);
					break;
				case EVENT_SPEECH_8:
					Talk(4);
					DoCastAOE(42138);
					me->DespawnOrUnsummon(6 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}
	private:
		Creature* mount;
		EventMap events;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_brewmaster_voljinAI(creature);
	}
};




/* Hallows End Event */



enum
{
	NPC_SHADE_HORSEMAN		= 23543,
	NPC_HH_EVENT_CONTROLLER = 255000,
	NPC_HH_FIRE_SPOT		= 255001,
	NPC_HH_FIRE_DND_TRIGGER = 23537, // Fire created with the HH cast.
};

enum EventActions
{
	ACTION_START_EVENT		= 1,
	ACTION_START_FLIGHT		= 2,

	ACTION_FORCE_FINISH		=3,
};

enum HallowsEndQuests
{
	QUEST_LET_THE_FIRE_COME_A = 12135,
	QUEST_LET_THE_FIRE_COME_H = 12139,
};

enum HallowsEndSpells
{
	SPELL_VICTORY  = 42265, // After the event.

	SPELL_HH_LAUGH = 43873, //

	SPELL_HH_THROW_FIRE = 42118,
	SPELL_HH_FIRE_AURA = 42075,
	SPELL_HH_FIRE_EXTINGUISH = 42114,

	SPELL_QUESTS_CREDIT = 42242,

	SPELL_SUMMON_LARGELANTERN = 44255,
};

enum HHEvents
{
	EVENT_START			= 1,
	EVENT_FINISH		= 2,

	EVENT_START_YELLS	= 3,
	EVENT_LAUGH			= 4,
	EVENT_THROW_FIRE	= 5,

	EVENT_REMOVE_LANTERN = 6,

	EVENT_FLY_DOWN	= 7,
	EVENT_ATTACK	= 8,

	EVENT_RANDOM_SAY = 9,
};

enum GameObjects
{
	GO_LARGE_JACK_O_LANTERN = 186887,
};


const Position HHSpawnPosition[] =
{
	{ -9400.277344f, 97.464272f, 81.712349f, 3.574561f }, // 0 - Elwynn
	{ 2170.844482f, 260.724609f, 60.327682f, 0.223572f }, // 1 - Brill
};

G3D::Vector3 const HHMovePoints[] =
{
	{ -9515.011719f, 88.121918f, 72.345390f }, // 0 - Elwynn
	{ -9520.200195f, 56.274529f, 77.342247f }, // 1 - Elwynn
	{ -9429.588867f, 33.208378f, 80.089806f }, // 2 - Elwynn
	{ -9423.809570f, 82.079887f, 77.193123f }, // 3 - Elwynn Volver al punto 0


	{ 2229.244629f, 305.680481f, 55.103230f }, // 0+4 - Brill
	{ 2298.840576f, 257.502136f, 58.855381f }, // 1+4 - Brill
	{ 2247.314697f, 212.048416f, 59.816650f }, // 2+4 - Brill
	{ 2204.260010f, 267.204712f, 55.921436f }, // 3+4 - Brill
};

const Position HHGroundPosition[] =
{
	{ -9449.977539f, 63.172909f, 55.967022f, 6.196290f }, // Elwyn
	{ 2257.275146f, 289.671906f, 34.114117f, 3.911988f }, // Brill
};



class npc_fire_brigade : public CreatureScript
{
private:

public:
	npc_fire_brigade() : CreatureScript("npc_fire_brigade") {}

	struct npc_fire_brigadeAI : public ScriptedAI
	{
		npc_fire_brigadeAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset()
		{
			if (Creature* spot = me->FindNearestCreature(NPC_HH_FIRE_SPOT, 5.0f, true))
				DoCast(42075);
			else
				DoCast(42074);
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (spell->Id != 42339)
				return;

				if (caster)
				{
					caster->ToPlayer()->KilledMonsterCredit(23537);
					DoCast(SPELL_HH_FIRE_EXTINGUISH);
					me->DespawnOrUnsummon(1500);
				}
		}

	private:
		EventMap events;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_fire_brigadeAI(creature);
	}
};


class npc_shade_horseman : public CreatureScript
{
private:

public:
	npc_shade_horseman() : CreatureScript("npc_shade_horseman") {}


	struct npc_shade_horsemanAI : public ScriptedAI
	{
		npc_shade_horsemanAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			me->SetCanFly(true);
			_groundPhase = false;
			wp_reached = true;
			id = 0;
			events.ScheduleEvent(EVENT_START_YELLS, 2 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_FLY_DOWN, 150 * IN_MILLISECONDS);

			areaModifier = me->GetZoneId() == 85 ? 4 : 0;
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type != POINT_MOTION_TYPE || pointId !=id)
				return;

			wp_reached = true;

			if (id == 3)
				id = 0;
			else
				++id;
		}

		void DamageTaken(Unit* /*attacker*/, uint32& damage) override
		{

			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->AttackStop();
				me->CombatStop();
				me->StopMoving();
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				Talk(5);
				if (Creature* controller = me->FindNearestCreature(NPC_HH_EVENT_CONTROLLER, 75.0f))
					controller->AI()->DoAction(ACTION_FORCE_FINISH);
			}
		}

		void UpdateAI(uint32 diff) override
		{

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_YELLS:
					Talk(0);
					events.ScheduleEvent(EVENT_THROW_FIRE, 8 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_RANDOM_SAY, 18 * IN_MILLISECONDS);
					break;
				case EVENT_RANDOM_SAY:
					Talk(urand(1, 3));
					events.RescheduleEvent(EVENT_RANDOM_SAY, 15 * IN_MILLISECONDS);
					break;
				case EVENT_THROW_FIRE:
					//DoCast(SPELL_HH_LAUGH);

					if (Creature* fireTrigger = me->FindNearestCreature(NPC_HH_FIRE_SPOT, 30.f, true))
						DoCast(fireTrigger, SPELL_HH_THROW_FIRE);

					if (me->GetZoneId()==85)
						events.RescheduleEvent(EVENT_THROW_FIRE, urand(3 * IN_MILLISECONDS, 10 * IN_MILLISECONDS));
					else
						events.RescheduleEvent(EVENT_THROW_FIRE, urand(5 * IN_MILLISECONDS, 15 * IN_MILLISECONDS));
					break;
				case EVENT_FLY_DOWN:
					_groundPhase = true;
					me->GetMotionMaster()->Clear(false);
					Talk(4);
					me->GetZoneId() == 85 ? me->GetMotionMaster()->MovePoint(5, HHGroundPosition[1]) : me->GetMotionMaster()->MovePoint(5, HHGroundPosition[0]);

					events.CancelEvent(EVENT_RANDOM_SAY);
					events.CancelEvent(EVENT_THROW_FIRE);
					events.ScheduleEvent(EVENT_ATTACK, 7 * IN_MILLISECONDS);
					break;
				case EVENT_ATTACK:

					if (me->GetZoneId() == 85)
					{
						if (me->GetPositionZ() > 35.0f)
						{
							events.RescheduleEvent(EVENT_ATTACK, 1500);
							return;
						}
					}
					else
					{
						if (me->GetPositionZ() > 56.0f)
						{
							events.RescheduleEvent(EVENT_ATTACK, 1500);
							return;
						}
					}

					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
					me->Dismount();
					me->SetReactState(REACT_AGGRESSIVE);
					break;
				default:
					break;
				}
			}

			if (wp_reached)
			{
				wp_reached = false;
				me->GetMotionMaster()->Clear(false);
				me->GetMotionMaster()->MovePoint(id, HHMovePoints[id+areaModifier].x, HHMovePoints[id+areaModifier].y, HHMovePoints[id+areaModifier].z);
			}

			if (_groundPhase)
				DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
		bool wp_reached;
		uint32 id;

		uint32 areaModifier;
		bool _groundPhase;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_shade_horsemanAI(creature);
	}
};

class npc_hallowsend_event_controller : public CreatureScript
{

public:
	npc_hallowsend_event_controller() : CreatureScript("npc_hallowsend_event_controller") {}

	struct npc_hallowsend_event_controllerAI : public ScriptedAI
	{
		npc_hallowsend_event_controllerAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			_eventActive = false;
			me->SetPosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ() + 1, me->GetOrientation());
		}

		void DoAction(int32 action) override
		{
			switch (action)
			{
				case ACTION_START_EVENT:
				{
					if (!_eventActive)
					{
						_eventActive = true;
						events.ScheduleEvent(EVENT_START, 5 * IN_MILLISECONDS);
						//Activar event.
					}
					break;
				}
				case ACTION_FORCE_FINISH:
					events.RescheduleEvent(EVENT_FINISH, 8 * IN_MILLISECONDS);
					break;
				default:
					break;

			}
		}

		void DespawnFires()
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, NPC_HH_FIRE_DND_TRIGGER, 60.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(60.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
					(*i)->DespawnOrUnsummon();
			}
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START:
					if (Creature* horseman = me->SummonCreature(NPC_SHADE_HORSEMAN, me->GetZoneId() == 85 ? HHSpawnPosition[1] : HHSpawnPosition[0], TEMPSUMMON_MANUAL_DESPAWN))
					{
						_horsemanGUID = horseman->GetGUID();
						events.ScheduleEvent(EVENT_FINISH, 300 * IN_MILLISECONDS);  // 5 MINUTES, as security measure to ensure the event finish.
					}
					break;
				case EVENT_FINISH:
					// Summon Calabaza
					// Limpiar los fuegos (buscar en radio X y despawnear?)
					// Castear spells de credito
					if (_horsemanGUID)
						if (Creature* horseman = ObjectAccessor::GetCreature(*me, _horsemanGUID))
						{
							horseman->DespawnOrUnsummon(); // maybe say something?
						}
					_eventActive = false;
					DespawnFires();

					DoCastAOE(SPELL_QUESTS_CREDIT);
					DoCastAOE(SPELL_VICTORY);
					DoCast(SPELL_SUMMON_LARGELANTERN);
					events.ScheduleEvent(EVENT_REMOVE_LANTERN, 25 * IN_MILLISECONDS);
					break;
				case EVENT_REMOVE_LANTERN:
					if (GameObject* goLantern = me->FindNearestGameObject(GO_LARGE_JACK_O_LANTERN, 10.0f))
						goLantern->RemoveFromWorld();
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		bool _eventActive;

		ObjectGuid _horsemanGUID;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hallowsend_event_controllerAI(creature);
	}
};

class npc_hallowsend_orphan_matron : public CreatureScript
{
private:

public:
	npc_hallowsend_orphan_matron() : CreatureScript("npc_hallowsend_orphan_matron") {}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override  // Tiene que ser en Creature Script el override, no en ScriptedAI struct.
	{
		if (quest->GetQuestId() == QUEST_LET_THE_FIRE_COME_A || quest->GetQuestId() == QUEST_LET_THE_FIRE_COME_H)
			if (Creature* controller = creature->FindNearestCreature(NPC_HH_EVENT_CONTROLLER, 100.0f, true))
				controller->AI()->DoAction(ACTION_START_EVENT);

		return true;
	}

	struct npc_hallowsend_orphan_matronAI : public ScriptedAI
	{
		npc_hallowsend_orphan_matronAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{

		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hallowsend_orphan_matronAI(creature);
	}
};


class npc_hallowsend_cat : public CreatureScript
{
private:

public:
	npc_hallowsend_cat() : CreatureScript("npc_hallowsend_cat") {}

	struct npc_hallowsend_catAI : public ScriptedAI
	{
		npc_hallowsend_catAI(Creature* creature) : ScriptedAI(creature) { }


		void DamageTaken(Unit* who, uint32& /*damage*/) override
		{
			if (who)
				DoCast(who, 39477);
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hallowsend_catAI(creature);
	}
};

// Achievement: The Turkinator
enum WildTurkey
{
	SPELL_TURKEY_TRACKER = 62014,
};

class npc_wild_turkey : public CreatureScript
{
public:
	npc_wild_turkey() : CreatureScript("npc_wild_turkey") { }

	struct npc_wild_turkeyAI : public ScriptedAI
	{
		npc_wild_turkeyAI(Creature* creature) : ScriptedAI(creature) {}

		void JustDied(Unit* killer)
		{
			if (killer && killer->GetTypeId() == TYPEID_PLAYER)
				killer->CastSpell(killer, SPELL_TURKEY_TRACKER);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_wild_turkeyAI(creature);
	}
};

// Item: Turkey Caller
enum LonelyTurkey
{
	SPELL_STINKER_BROKEN_HEART = 62004,
};

class npc_lonely_turkey : public CreatureScript
{
public:
	npc_lonely_turkey() : CreatureScript("npc_lonely_turkey") { }

	struct npc_lonely_turkeyAI : public ScriptedAI
	{
		npc_lonely_turkeyAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			if (me->IsSummon())
				if (Unit* owner = me->ToTempSummon()->GetSummoner())
					me->GetMotionMaster()->MovePoint(0, owner->GetPositionX() + 25 * cos(owner->GetOrientation()), owner->GetPositionY() + 25 * cos(owner->GetOrientation()), owner->GetPositionZ());

			_stinkerBrokenHeartTimer = 3.5 * IN_MILLISECONDS;
		}

		void UpdateAI(uint32 diff)
		{
			if (_stinkerBrokenHeartTimer <= diff)
			{
				DoCast(SPELL_STINKER_BROKEN_HEART);
				me->setFaction(31);
			}
			_stinkerBrokenHeartTimer -= diff;
		}
	private:
		uint32 _stinkerBrokenHeartTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lonely_turkeyAI(creature);
	}
};

class npc_pilgrim_chair : public CreatureScript
{
public:
	npc_pilgrim_chair() : CreatureScript("npc_pilgrim_chair") { }

	struct npc_pilgrim_chairAI : public ScriptedAI
	{
		npc_pilgrim_chairAI(Creature* creature) : ScriptedAI(creature) {}

		void OnCharmed(bool /*apply*/) override
		{
			me->SetControlled(false, UNIT_STATE_ROOT);
			me->SetControlled(true, UNIT_STATE_ROOT);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_pilgrim_chairAI(creature);
	}
};

// Midsummer Fire Festival.

enum eBonfire
{
	GO_MIDSUMMER_BONFIRE = 181288,

	SPELL_STAMP_OUT_BONFIRE = 45437,
	SPELL_LIGHT_BONFIRE = 29831,
};


class npc_midsummer_bonfire : public CreatureScript
{
public:
	npc_midsummer_bonfire() : CreatureScript("npc_midsummer_bonfire") { }

	struct npc_midsummer_bonfireAI : public ScriptedAI
	{
		npc_midsummer_bonfireAI(Creature* c) : ScriptedAI(c)
		{
			me->IsAIEnabled = true;
			if (GameObject* go = me->SummonGameObject(GO_MIDSUMMER_BONFIRE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 0))
			{
				me->RemoveGameObject(go, false);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_midsummer_bonfireAI(creature);
	}
};

///////////////////////////////////////
////// BOSS
///////////////////////////////////////

enum Hummel
{
    QUEST_YOUVE_BEEN_SERVED = 14488,
    NPC_APOTHECARY_HUMMEL = 36296,
    NPC_APOTHECARY_FRYE = 36272,
    NPC_APOTHECARY_BAXTER = 36565,

    SPELL_COLOGNE_IMMUNE = 68530,
    SPELL_COLOGNE_PASSIVE_DAMAGE = 68947,
    SPELL_PERFUME_PASSIVE_DAMAGE = 68641,

    SPELL_THROW_COLOGNE = 68614,
    SPELL_THROW_PERFUME = 68798,

    // Real fight
    SPELL_COLOGNE_SPRAY = 68948,
    SPELL_ALLURING_PERFUME_SPRAY = 68607,
    SPELL_CHAIN_REACTION = 68821,

    ACTION_START_EVENT_HUMMEL = 1,
    ACTION_RELEASE_HELPER = 2,

    EVENT_CALL_BAXTER = 1,
    EVENT_CALL_FRYE = 2,
    EVENT_SPELL_PERFUME_SPRAY = 3,
    EVENT_SPELL_CHAIN_REACTION = 4,
    EVENT_SPELL_THROW = 5,
    EVENT_SAY_ENCOURAGEMENT = 6,
};

enum HummelTexts
{
    SAY_HUMMEL_1 = 0,
    SAY_HUMMEL_2 = 1,
    SAY_HUMMEL_3 = 2,
    SAY_HUMMEL_DEATH = 3,
    SAY_CALL_BAXXTER = 4,
    SAY_CALL_FRYE    = 5,
    SAY_ENCOURAGEMENT = 6,
};

enum HelpersTexts
{
    SAY_HELPER_DEATH = 0,
};

#define GOSSIP_OPTION  "Begin the Battle."

class npc_love_in_air_hummel : public CreatureScript
{
public:
    npc_love_in_air_hummel() : CreatureScript("npc_love_in_air_hummel") { }

    struct npc_love_in_air_hummelAI : public ScriptedAI
    {
        npc_love_in_air_hummelAI(Creature* creature) : ScriptedAI(creature), summons(me)
        {
        }

        SummonList summons;
        EventMap events;
        uint32 speachTimer;

        void Reset()
        {
            speachTimer = 0;
            me->setFaction(35);
            summons.DespawnAll();
            events.Reset();
            me->SummonCreature(NPC_APOTHECARY_FRYE, -205.449f, 2219.56f, 79.7633f, 0.7f);
            me->SummonCreature(NPC_APOTHECARY_BAXTER, -209.602f, 2215.42f, 79.7633f, 0.723503f);
        }

        void DoAction(int32 param)
        {
            if (param == ACTION_START_EVENT_HUMMEL)
                speachTimer = 1;
        }

        void JustDied(Unit*)
        {
            Talk(SAY_HUMMEL_DEATH);
            Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (!players.isEmpty() && players.begin()->GetSource() && players.begin()->GetSource()->GetGroup())
                sLFGMgr->FinishDungeon(players.begin()->GetSource()->GetGroup()->GetGUID(), 288);
        }

        void JustSummoned(Creature* cr)
        {
            summons.Summon(cr);
            cr->setFaction(35);
            cr->SetControlled(true, UNIT_STATE_STUNNED);
            cr->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }

        void UpdateAI(uint32 diff)
        {
            if (speachTimer)
            {
                speachTimer += diff;
                if (speachTimer < 10000)
                {
                    Talk(SAY_HUMMEL_1);
                    speachTimer = 10000;
                }
                else if (speachTimer >= 16000 && speachTimer < 20000)
                {
                    Talk(SAY_HUMMEL_2);
                    speachTimer = 20000;
                }
                else if (speachTimer >= 26000 && speachTimer < 30000)
                {
                    Talk(SAY_HUMMEL_3);
                    speachTimer = 0;
                    me->setFaction(16);
                    me->SetInCombatWithZone();
                    if (Unit* target = SelectTargetFromPlayerList(40.0f))
                    {
                        AttackStart(target);
                        events.ScheduleEvent(EVENT_CALL_BAXTER, 10000);
                        events.ScheduleEvent(EVENT_CALL_FRYE, 20000);
                        events.ScheduleEvent(EVENT_SPELL_PERFUME_SPRAY, 7000);
                        events.ScheduleEvent(EVENT_SPELL_CHAIN_REACTION, 12000);
                    }
                    else
                        EnterEvadeMode();
                }
                return;
            }

            if (!UpdateVictim())
                return;

            events.Update(diff);
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch (uint32 eventId = events.ExecuteEvent())
            {
            case EVENT_CALL_BAXTER:
            {
                Talk(SAY_CALL_BAXXTER);
                EntryCheckPredicate pred(NPC_APOTHECARY_BAXTER);
                summons.DoAction(ACTION_RELEASE_HELPER, pred);                
                break;
            }
            case EVENT_CALL_FRYE:
            {
                Talk(SAY_CALL_FRYE);
                EntryCheckPredicate pred(NPC_APOTHECARY_FRYE);
                summons.DoAction(ACTION_RELEASE_HELPER, pred);
                events.ScheduleEvent(EVENT_SAY_ENCOURAGEMENT, 5 * IN_MILLISECONDS);
                break;
            }
            case EVENT_SAY_ENCOURAGEMENT:
                Talk(SAY_ENCOURAGEMENT);
                break;
            case EVENT_SPELL_PERFUME_SPRAY:
                me->CastSpell(me->GetVictim(), SPELL_ALLURING_PERFUME_SPRAY, false);
                events.RescheduleEvent(EVENT_SPELL_PERFUME_SPRAY, 6 * IN_MILLISECONDS);
                break;
            case EVENT_SPELL_CHAIN_REACTION:
                me->CastSpell(me->GetVictim(), SPELL_CHAIN_REACTION, false);
                events.RescheduleEvent(EVENT_SPELL_CHAIN_REACTION, 12 * IN_MILLISECONDS);
                break;
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_love_in_air_hummelAI(creature);
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF:

            if (player)
            {
                if (player->getLevel() < 80)
                    return false;

                player->CLOSE_GOSSIP_MENU();
                creature->AI()->DoAction(ACTION_START_EVENT_HUMMEL);
            }                                        
            break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        InstanceScript* instance = creature->GetInstanceScript();
        if (instance && player)
        {
            if (player->getLevel() < 80)
                return false;

            player->PrepareGossipMenu(creature);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
                          
        }
        return true;
    }

    bool OnQuestReward(Player* /*player*/, Creature* creature, const Quest *_Quest, uint32 /*slot*/)
    {
        if (_Quest->GetQuestId() == QUEST_YOUVE_BEEN_SERVED)
            creature->AI()->DoAction(ACTION_START_EVENT_HUMMEL);

        return true;
    }

};

class npc_love_in_air_hummel_helper : public CreatureScript
{
public:
    npc_love_in_air_hummel_helper() : CreatureScript("npc_love_in_air_hummel_helper") { }

    struct npc_love_in_air_hummel_helperAI : public ScriptedAI
    {
        npc_love_in_air_hummel_helperAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        EventMap events;

        void Reset()
        {
        }

        void DoAction(int32 param)
        {
            if (param == ACTION_RELEASE_HELPER)
            {
                me->SetControlled(false, UNIT_STATE_STUNNED);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->setFaction(16);
                me->SetInCombatWithZone();
                if (Unit* target = SelectTargetFromPlayerList(40.0f))
                    AttackStart(target);

                if (me->GetEntry() == NPC_APOTHECARY_BAXTER)
                {
                    events.ScheduleEvent(EVENT_SPELL_PERFUME_SPRAY, 7000);
                    events.ScheduleEvent(EVENT_SPELL_CHAIN_REACTION, 12000);
                }
                else
                    events.ScheduleEvent(EVENT_SPELL_THROW, 5000);
            }
        }

        void JustDied(Unit*)
        { 
            Talk(SAY_HELPER_DEATH);
        }


        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch (uint32 eventId = events.ExecuteEvent())
            {
            case EVENT_SPELL_PERFUME_SPRAY:
                me->CastSpell(me->GetVictim(), SPELL_COLOGNE_SPRAY, false);
                events.RescheduleEvent(EVENT_SPELL_PERFUME_SPRAY, 6 * IN_MILLISECONDS);
            break;
            case EVENT_SPELL_CHAIN_REACTION:
                me->CastSpell(me->GetVictim(), SPELL_CHAIN_REACTION, false);
                events.RescheduleEvent(EVENT_SPELL_CHAIN_REACTION, 12 * IN_MILLISECONDS);
                break;
            case EVENT_SPELL_THROW:
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                {
                    Position pos(*me);
                    me->Relocate(target);
                    me->CastSpell(me, RAND(SPELL_THROW_COLOGNE, SPELL_THROW_PERFUME), true, NULL, NULL, me->GetGUID());
                    me->Relocate(pos);
                }
                events.RescheduleEvent(EVENT_SPELL_THROW, 10 * IN_MILLISECONDS);
                break;
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_love_in_air_hummel_helperAI(creature);
    }
};

class spell_love_in_air_perfume_immune : public SpellScriptLoader
{
public:
    spell_love_in_air_perfume_immune() : SpellScriptLoader("spell_love_in_air_perfume_immune") { }

    class spell_love_in_air_perfume_immune_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_love_in_air_perfume_immune_AuraScript);

        void HandleEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* target = GetTarget();
            if (GetId() == SPELL_COLOGNE_IMMUNE)
            {
                target->ApplySpellImmune(SPELL_COLOGNE_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_COLOGNE_PASSIVE_DAMAGE, true);
                target->ApplySpellImmune(SPELL_COLOGNE_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_COLOGNE_SPRAY, true);
                target->ApplySpellImmune(68934, IMMUNITY_ID, 68934, true);
            }
            else
            {
                target->ApplySpellImmune(SPELL_PERFUME_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_PERFUME_PASSIVE_DAMAGE, true);
                target->ApplySpellImmune(SPELL_ALLURING_PERFUME_SPRAY, IMMUNITY_ID, SPELL_ALLURING_PERFUME_SPRAY, true);
                target->ApplySpellImmune(68927, IMMUNITY_ID, 68927, true);
            }
        }

        void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* target = GetTarget();
            if (GetId() == SPELL_COLOGNE_IMMUNE)
            {
                target->ApplySpellImmune(SPELL_COLOGNE_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_COLOGNE_PASSIVE_DAMAGE, false);
                target->ApplySpellImmune(SPELL_COLOGNE_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_COLOGNE_SPRAY, false);
                target->ApplySpellImmune(68934, IMMUNITY_ID, 68934, false);
            }
            else
            {
                target->ApplySpellImmune(SPELL_PERFUME_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_PERFUME_PASSIVE_DAMAGE, false);
                target->ApplySpellImmune(SPELL_PERFUME_PASSIVE_DAMAGE, IMMUNITY_ID, SPELL_ALLURING_PERFUME_SPRAY, false);
                target->ApplySpellImmune(68927, IMMUNITY_ID, 68927, false);
            }
        }

        void Register()
        {
            OnEffectApply += AuraEffectApplyFn(spell_love_in_air_perfume_immune_AuraScript::HandleEffectApply, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_love_in_air_perfume_immune_AuraScript::HandleEffectRemove, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_love_in_air_perfume_immune_AuraScript();
    }
};

class spell_love_in_air_periodic_perfumes : public SpellScriptLoader
{
public:
    spell_love_in_air_periodic_perfumes() : SpellScriptLoader("spell_love_in_air_periodic_perfumes") { }

    class spell_love_in_air_periodic_perfumes_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_love_in_air_periodic_perfumes_AuraScript);

        void PeriodicTick(AuraEffect const* /*aurEff*/)
        {
            if (Unit* target = GetTarget())
            {
                uint32 spellId = (GetId() == SPELL_THROW_COLOGNE ? 68934 : 68927);
                if (target->IsImmunedToSpell(sSpellMgr->GetSpellInfo(spellId)))
                    return;

                target->CastSpell(target, spellId, true, NULL, NULL);
            }
        }

        void Register()
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_love_in_air_periodic_perfumes_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_love_in_air_periodic_perfumes_AuraScript();
    }
};

class npc_target_dummy : public CreatureScript
{
public:
    npc_target_dummy() : CreatureScript("npc_target_dummy") { }

    struct npc_target_dummyAI : ScriptedAI
    {
        npc_target_dummyAI(Creature* creature) : ScriptedAI(creature)
        {
            SetCombatMovement(false);
            deathTimer = 15000;
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);      // imune to knock aways like blast wave
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true); // imune to knock aways like blast wave
        }

        void Reset() override
        {
            me->SetControlled(true, UNIT_STATE_STUNNED); //disable rotate
            me->SetLootRecipient(me->GetOwner());
            me->SelectLevel();
        }

        void MoveInLineOfSight(Unit* /*who*/) override { }

        void EnterEvadeMode() override
        {
            if (!_EnterEvadeMode())
                return;

            Reset();
        }

        void UpdateAI(uint32 diff) override
        {
            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate

            if (deathTimer <= diff)
            {
                me->SetLootRecipient(me->GetOwner());
                me->LowerPlayerDamageReq(me->GetMaxHealth());
                me->Kill(me);
                deathTimer = 600000;
            }
            else
                deathTimer -= diff;
        }

    private:
        uint32 deathTimer;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_target_dummyAI(creature);
    }
};

enum GoblinLandMineMisc
{
    SPELL_DETONATION = 4043,
    SPELL_ARMING_AURA = 11816,
    SAY_ARMING_0 = 0,
    SAY_ARMING_1 = 1,
    SAY_ARMING_2 = 2,
};

class npc_goblin_land_mine : public CreatureScript
{
public:
    npc_goblin_land_mine() : CreatureScript("npc_goblin_land_mine") { }

    struct npc_goblin_land_mineAI : public ScriptedAI
    {
        npc_goblin_land_mineAI(Creature* creature) : ScriptedAI(creature) { }

        void InitializeAI() override
        {
            Activated = false;
            SayArming_0_Timer = 1 * IN_MILLISECONDS;
        }

        void AttackStart(Unit* /*who*/) override { }

        void MoveInLineOfSight(Unit* who) override
        {
            if (Creature* creature = who->ToCreature())
                if (me->IsValidAttackTarget(who) && me->IsWithinMeleeRange(who) && Activated)
                {
                    me->CastSpell(me, SPELL_DETONATION);
                    me->DespawnOrUnsummon();
                    Activated = false;
                }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!Activated)
            {
                if (SayArming_0_Timer <= diff)
                {
                    Talk(SAY_ARMING_0);
                    me->CastSpell(me, SPELL_ARMING_AURA);
                    SayArming_0_Timer = 120 * IN_MILLISECONDS;
                    SayArming_1_Timer = 5 * IN_MILLISECONDS;
                }
                else
                    SayArming_0_Timer -= diff;

                if (SayArming_1_Timer <= diff)
                {
                    Talk(SAY_ARMING_1);
                    SayArming_1_Timer = 120 * IN_MILLISECONDS;
                    SayArming_2_Timer = 10 * IN_MILLISECONDS;
                }
                else
                    SayArming_1_Timer -= diff;

                if (SayArming_2_Timer <= diff)
                {
                    Talk(SAY_ARMING_2);
                    SayArming_2_Timer = 120 * IN_MILLISECONDS;
                    me->RemoveAurasDueToSpell(SPELL_ARMING_AURA);
                    Activated = true;
                }
                else
                    SayArming_2_Timer -= diff;
            }
        }

    private:
        bool Activated;
        uint32 SayArming_0_Timer;
        uint32 SayArming_1_Timer;
        uint32 SayArming_2_Timer;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_goblin_land_mineAI(creature);
    }
};

void AddSC_npcs_special()
{
    new npc_air_force_bots();
    new npc_lunaclaw_spirit();
    new npc_chicken_cluck();
    new npc_dancing_flames();
    new npc_doctor();
    new npc_injured_patient();
    new npc_garments_of_quests();
    new npc_guardian();
    new npc_sayge();
    new npc_steam_tonk();
    new npc_tonk_mine();
    new npc_training_dummy();
    new npc_wormhole();
    new npc_pet_trainer();
    new npc_locksmith();
    new npc_experience();
    new npc_firework();
    new npc_spring_rabbit();
    new npc_imp_in_a_ball();
	new npc_stable_master();
	new npc_zeppeling_power_core();
	new npc_argent_tournament_mount();

	new npc_dark_iron_guzzler();

	new npc_dark_iron_event_generator();
	new npc_brewfest_reveler();
	new npc_brewfest_music_controller();
	new npc_dark_iron_mole_spawner();

	new npc_brewmaster_mekkatorque();
	new npc_brewmaster_voljin();

	new npc_fire_brigade();
	new npc_hallowsend_event_controller();
	new npc_hallowsend_orphan_matron();

	new npc_shade_horseman();

	new npc_hallowsend_cat();

	new npc_lonely_turkey();
	new npc_wild_turkey();
	new npc_pilgrim_chair();

	// Midsummer Fire Festival

	new npc_midsummer_bonfire();
	//new npc_love_in_air_hummel();

    new npc_love_in_air_hummel();
    new npc_love_in_air_hummel_helper();
    new spell_love_in_air_perfume_immune();
    new spell_love_in_air_periodic_perfumes();

    new npc_target_dummy();
    new npc_goblin_land_mine();
}
