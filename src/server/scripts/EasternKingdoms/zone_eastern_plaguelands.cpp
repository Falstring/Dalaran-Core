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
SDName: Eastern_Plaguelands
SD%Complete: 100
SDComment: Quest support: 5211, 5742. Special vendor Augustus the Touched
SDCategory: Eastern Plaguelands
EndScriptData */

/* ContentData
npc_ghoul_flayer
npc_augustus_the_touched
npc_darrowshire_spirit
npc_tirion_fordring
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "WorldSession.h"
#include "Group.h"

/*######
## npc_eris_heavenfire
######*/

enum Says
{
    SAY_DEATH = 0,
    SAY_SPAWN = 1,
    SAY_SAVED = 2,
    SAY_EMPOWER = 0,
    SAY_COMPLETE = 1,
    SAY_FAILED1 = 2,
    SAY_FAILED2 = 3
};

enum ErisHavenfireMisc
{
    QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW = 7622,

    NPC_INJURED_PEASANT = 14484,
    NPC_SCOURGE_ARCHER = 14489,
    NPC_SCOURGE_FOOTSOLDIER = 14486,
    NPC_PLAGUED_PEASANT = 14485,

    SPELL_BLESSING_OF_NORDRASSIL = 23108,
    SPELL_DEATH_DOOR = 23127,
    SPELL_ENTER_THE_LIGHT_DND = 23107,
    SPELL_SHOOT = 6660,
    SPELL_SEETHING_PLAGUE = 23072,

    ACTION_START_SPAWN = 0,
    SUCCESS = 50,
    FAILED = 15,
    MAX_PEASANTS = 12,
    MAX_ARCHERS = 8,
};

Position const ArcherPositions[11] =
{
    // Archer
    { 3327.42f, -3021.11f, 170.57f, 6.01f },
    { 3335.4f, -3054.3f, 173.63f, 0.49f },
    { 3351.3f, -3079.08f, 178.67f, 1.15f },
    { 3358.93f, -3076.1f, 174.87f, 1.57f },
    { 3371.58f, -3069.24f, 175.20f, 1.99f },
    { 3369.46f, -3023.11f, 171.83f, 3.69f },
    { 3383.25f, -3057.01f, 181.53f, 2.21f },
    { 3380.03f, -3062.73f, 181.90f, 2.31f },

    // Footsoldiers
    { 3347.603271f, -3045.536377f, 164.029877f, 1.814429f },
    { 3363.609131f, -3037.187256f, 163.541885f, 2.277649f },
    { 3349.105469f, -3056.500977f, 168.079468f, 1.857460f },
};

Position const PeasantsPos[12] =
{
    { 3364.47f, -3048.50f, 165.17f, 1.86f },
    { 3363.242f, -3052.06f, 165.264f, 2.095f },
    { 3362.33f, -3049.37f, 165.23f, 1.54f },
    { 3360.13f, -3052.63f, 165.31f, 1.88f },
    { 3361.05f, -3055.49f, 165.31f, 2.041f },
    { 3363.92f, -3046.96f, 165.09f, 2.13f },
    { 3366.83f, -3052.23f, 165.41f, 2.044f },
    { 3367.79f, -3047.80f, 165.16f, 2.08f },
    { 3358.76f, -3050.37f, 165.2f, 2.05f },
    { 3366.63f, -3045.29f, 164.99f, 2.19f },
    { 3357.45f, -3052.82f, 165.50f, 2.006f },
    { 3363.00f, -3044.21f, 164.80f, 2.182f },
};

Position const PeasantMoveLoc = { 3335.0f, -2994.04f, 161.14f };

class npc_eris_havenfire : public CreatureScript
{
public:
    npc_eris_havenfire() : CreatureScript("npc_eris_havenfire") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW)
        {
            creature->AI()->DoAction(ACTION_START_SPAWN);
            if (npc_eris_havenfireAI* eris = ENSURE_AI(npc_eris_havenfireAI, creature->AI()))
                eris->_playerGUID = player->GetGUID();
        }
        return true;
    }

    struct npc_eris_havenfireAI : public ScriptedAI
    {
        npc_eris_havenfireAI(Creature* creature) : ScriptedAI(creature), _summons(me) { }

        SummonList _summons;
        uint8 failCounter;
        uint8 winCounter;
        bool eventActive;
        TaskScheduler scheduler;
        ObjectGuid _playerGUID;

        void Reset()
        {
            scheduler.CancelAll();
            _summons.DespawnAll();
            failCounter = 0;
            winCounter = 0;
            eventActive = false;
        }

        void JustSummoned(Creature* summon) override
        {
            _summons.Summon(summon);

            if (summon->GetEntry() == NPC_PLAGUED_PEASANT)
                summon->CastSpell(summon, SPELL_SEETHING_PLAGUE, false);
            else if (summon->GetEntry() == NPC_INJURED_PEASANT)
                summon->CastSpell(summon, SPELL_DEATH_DOOR, false);
        }

        void QuestFinished(bool success)
        {
            if (Player* player = ObjectAccessor::FindPlayer(_playerGUID))
            {
                if (Group* group = player->GetGroup())
                {
                    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                        if (Player* member = itr->GetSource())
                            if (success)
                                member->CompleteQuest(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW);
                            else if (player->GetQuestStatus(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW) == QUEST_STATUS_INCOMPLETE)
                                member->FailQuest(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW);
                }
                else
                {
                    if (success)
                        player->CompleteQuest(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW);
                    else if (player->GetQuestStatus(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW) == QUEST_STATUS_INCOMPLETE)
                        player->FailQuest(QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW);
                }
            }
            if (success)
                me->Yell(SAY_COMPLETE);
            else
            {
                me->Yell(SAY_FAILED1);
                me->Say(SAY_FAILED2);
            }
            Reset();
        }

        void SummonedCreatureDies(Creature* summon, Unit* /*killer*/) override
        {
            if (summon->GetEntry() == NPC_INJURED_PEASANT ||
                summon->GetEntry() == NPC_PLAGUED_PEASANT)
                ++failCounter;

            if (failCounter >= FAILED)
                QuestFinished(false);
        }

        void SetData(uint32 /*data*/, uint32 /*value*/) override
        {
            ++winCounter;

            if (winCounter >= SUCCESS)
                QuestFinished(true);
        }

        void DoAction(int32 action) override
        {
            if (!eventActive && action == ACTION_START_SPAWN)
            {
                eventActive = true;

                for (uint8 i = 0; i < MAX_ARCHERS; i++)
                    if (Creature* archer = me->SummonCreature(NPC_SCOURGE_ARCHER, ArcherPositions[i], TEMPSUMMON_TIMED_DESPAWN, 5 * MINUTE*IN_MILLISECONDS))
                    {
                        archer->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
                        archer->SetReactState(REACT_AGGRESSIVE);
                    }

                scheduler.Schedule(Seconds(10), [this](TaskContext waves)
                {
                    if (waves.GetRepeatCounter() > 5)
                        scheduler.CancelAll();

                    for (uint8 i = 0; i <= MAX_PEASANTS; i++)
                        me->SummonCreature(roll_chance_i(70) ? NPC_INJURED_PEASANT : NPC_PLAGUED_PEASANT, PeasantsPos[i], TEMPSUMMON_MANUAL_DESPAWN);

                    if (Creature* peasant = me->FindNearestCreature(NPC_INJURED_PEASANT, 100.0f, true))
                        peasant->Yell(SAY_SPAWN);

                    waves.Repeat(Seconds(60));
                });

                scheduler.Schedule(Seconds(72), [this](TaskContext soldiers)
                {
                    for (uint8 i = 0; i < urand(2, 3); ++i)
                        if (Creature* soldier = me->SummonCreature(NPC_SCOURGE_FOOTSOLDIER, PeasantsPos[urand(0, 11)], TEMPSUMMON_CORPSE_DESPAWN))
                        {
                            if (Player* priest = ObjectAccessor::FindPlayer(_playerGUID))
                                soldier->getThreatManager().addThreat(priest, 1.0f);
                        }
                    soldiers.Repeat(Seconds(20), Seconds(40));
                });
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!eventActive)
                return;

            scheduler.Update(diff);

            if (Player* priest = ObjectAccessor::FindPlayer(_playerGUID))
                if (!priest->HasAuraEffect(SPELL_BLESSING_OF_NORDRASSIL, EFFECT_0) && (100.0f * priest->GetPower(POWER_MANA) / priest->GetMaxPower(POWER_MANA)) < 35.0f)
                {
                    me->CastSpell(priest, SPELL_BLESSING_OF_NORDRASSIL, true);
                    me->Yell(SAY_EMPOWER);
                }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_eris_havenfireAI(creature);
    }
};

class ArcherTargetSelector
{
public:
    ArcherTargetSelector() { }

    bool operator()(WorldObject* target) const
    {
        if (Unit* unit = target->ToUnit())
            return !(unit->GetEntry() & (NPC_INJURED_PEASANT | NPC_PLAGUED_PEASANT));
        return true;
    }
};

class npc_scourge_archer : public CreatureScript
{
public:
    npc_scourge_archer() : CreatureScript("npc_scourge_archer") { }

    struct npc_scourge_archerAI : public ScriptedAI
    {
        npc_scourge_archerAI(Creature *creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        TaskScheduler scheduler;

        void Initialize()
        {
            scheduler.Schedule(Seconds(1), [this](TaskContext shoot)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, ArcherTargetSelector()))
                    me->CastSpell(target, SPELL_SHOOT);
                shoot.Repeat(Milliseconds(1517));
            });
        }

        void UpdateAI(uint32 diff) override
        {
            scheduler.Update(diff);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_scourge_archerAI(creature);
    }
};

class npc_fleeing_peasant : public CreatureScript
{
public:
    npc_fleeing_peasant() : CreatureScript("npc_fleeing_peasant") { }

    struct npc_fleeing_peasantAI : public ScriptedAI
    {
        npc_fleeing_peasantAI(Creature *creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            me->SetSpeed(MOVE_WALK, 0.45f);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);
            me->GetMotionMaster()->MovePoint(0, PeasantMoveLoc);
        }

        void MovementInform(uint32 type, uint32 point) override
        {
            if (type != POINT_MOTION_TYPE)
                return;

            if (point == 0)
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->RemoveAllAuras();
                me->CastSpell(me, SPELL_ENTER_THE_LIGHT_DND, false);
                me->Say(SAY_SAVED);
                me->DespawnOrUnsummon(2000);

                if (Unit* eris = me->FindNearestCreature(14494, 200.0f, true))
                    eris->ToCreature()->AI()->SetData(1, 1);
            }
        }

        void JustDied(Unit* /*killer*/) override
        {
            me->Say(SAY_DEATH);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_fleeing_peasantAI(creature);
    }
};

class npc_ghoul_flayer : public CreatureScript
{
public:
    npc_ghoul_flayer() : CreatureScript("npc_ghoul_flayer") { }

    struct npc_ghoul_flayerAI : public ScriptedAI
    {
        npc_ghoul_flayerAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override { }

        void EnterCombat(Unit* /*who*/) override { }

        void JustDied(Unit* killer) override
        {
            if (killer->GetTypeId() == TYPEID_PLAYER)
                me->SummonCreature(11064, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 60000);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ghoul_flayerAI(creature);
    }
};

/*######
## npc_augustus_the_touched
######*/

class npc_augustus_the_touched : public CreatureScript
{
public:
    npc_augustus_the_touched() : CreatureScript("npc_augustus_the_touched") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->IsVendor() && player->GetQuestRewardStatus(6164))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
};

/*######
## npc_darrowshire_spirit
######*/

enum DarrowshireSpirit
{
    SPELL_SPIRIT_SPAWNIN    = 17321
};

class npc_darrowshire_spirit : public CreatureScript
{
public:
    npc_darrowshire_spirit() : CreatureScript("npc_darrowshire_spirit") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        player->SEND_GOSSIP_MENU(3873, creature->GetGUID());
        player->TalkedToCreature(creature->GetEntry(), creature->GetGUID());
        creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_darrowshire_spiritAI(creature);
    }

    struct npc_darrowshire_spiritAI : public ScriptedAI
    {
        npc_darrowshire_spiritAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            DoCast(me, SPELL_SPIRIT_SPAWNIN);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void EnterCombat(Unit* /*who*/) override { }
    };
};

/*######
## npc_tirion_fordring
######*/

#define GOSSIP_HELLO    "I am ready to hear your tale, Tirion."
#define GOSSIP_SELECT1  "Thank you, Tirion.  What of your identity?"
#define GOSSIP_SELECT2  "That is terrible."
#define GOSSIP_SELECT3  "I will, Tirion."

class npc_tirion_fordring : public CreatureScript
{
public:
    npc_tirion_fordring() : CreatureScript("npc_tirion_fordring") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(4493, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(4494, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(4495, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(5742);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(5742) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

void AddSC_eastern_plaguelands()
{
    new npc_ghoul_flayer();
    new npc_augustus_the_touched();
    new npc_darrowshire_spirit();
    new npc_tirion_fordring();
    new npc_eris_havenfire();
    new npc_scourge_archer();
    new npc_fleeing_peasant();
}
