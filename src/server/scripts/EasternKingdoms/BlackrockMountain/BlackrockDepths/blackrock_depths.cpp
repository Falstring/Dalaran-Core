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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"
#include "LFGMgr.h"
#include "Group.h"
#include "blackrock_depths.h"
#include "Player.h"
#include "WorldSession.h"

//go_shadowforge_brazier
class go_shadowforge_brazier : public GameObjectScript
{
public:
    go_shadowforge_brazier() : GameObjectScript("go_shadowforge_brazier") { }

    bool OnGossipHello(Player* /*player*/, GameObject* go) override
    {
        if (InstanceScript* instance = go->GetInstanceScript())
        {
            if (instance->GetData(TYPE_LYCEUM) == IN_PROGRESS)
                instance->SetData(TYPE_LYCEUM, DONE);
            else
                instance->SetData(TYPE_LYCEUM, IN_PROGRESS);
            // If used brazier open linked doors (North or South)
            if (go->GetGUID() == instance->GetGuidData(DATA_SF_BRAZIER_N))
                instance->HandleGameObject(instance->GetGuidData(DATA_GOLEM_DOOR_N), true);
            else if (go->GetGUID() == instance->GetGuidData(DATA_SF_BRAZIER_S))
                instance->HandleGameObject(instance->GetGuidData(DATA_GOLEM_DOOR_S), true);
        }
        return false;
    }
};

// npc_grimstone
enum Grimstone
{
    NPC_GRIMSTONE                                          = 10096,
    NPC_THELDREN                                           = 16059,

    //4 or 6 in total? 1+2+1 / 2+2+2 / 3+3. Depending on this, code should be changed.
    MAX_NPC_AMOUNT                                         = 4
};

uint32 RingMob[]=
{
    8925,                                                   // Dredge Worm
    8926,                                                   // Deep Stinger
    8927,                                                   // Dark Screecher
    8928,                                                   // Burrowing Thundersnout
    8933,                                                   // Cave Creeper
    8932,                                                   // Borer Beetle
};

uint32 RingBoss[]=
{
    9027,                                                   // Gorosh
    9028,                                                   // Grizzle
    9029,                                                   // Eviscerator
    9030,                                                   // Ok'thor
    9031,                                                   // Anub'shiah
    9032,                                                   // Hedrum
};

class at_ring_of_law : public AreaTriggerScript
{
public:
    at_ring_of_law() : AreaTriggerScript("at_ring_of_law") { }

    bool OnTrigger(Player* player, const AreaTriggerEntry* /*at*/) override
    {
        if (InstanceScript* instance = player->GetInstanceScript())
        {
            if (instance->GetData(TYPE_RING_OF_LAW) == IN_PROGRESS || instance->GetData(TYPE_RING_OF_LAW) == DONE)
                return false;

            instance->SetData(TYPE_RING_OF_LAW, IN_PROGRESS);
            player->SummonCreature(NPC_GRIMSTONE, 625.559f, -205.618f, -52.735f, 2.609f, TEMPSUMMON_DEAD_DESPAWN, 0);

            return false;
        }
        return false;
    }
};

// npc_grimstone
enum GrimstoneTexts
{
    SAY_TEXT1          = 0,
    SAY_TEXT2          = 1,
    SAY_TEXT3          = 2,
    SAY_TEXT4          = 3,
    SAY_TEXT5          = 4,
    SAY_TEXT6          = 5
};

/// @todo implement quest part of event (different end boss)
class npc_grimstone : public CreatureScript
{
public:
    npc_grimstone() : CreatureScript("npc_grimstone") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<npc_grimstoneAI>(creature);
    }

    struct npc_grimstoneAI : public npc_escortAI
    {
        npc_grimstoneAI(Creature* creature) : npc_escortAI(creature)
        {
            Initialize();
            instance = creature->GetInstanceScript();
            MobSpawnId = rand32() % 6;
        }

        void Initialize()
        {
            EventPhase = 0;
            Event_Timer = 1000;

            MobCount = 0;
            MobDeath_Timer = 0;

            for (uint8 i = 0; i < MAX_NPC_AMOUNT; ++i)
                RingMobGUID[i].Clear();

            RingBossGUID.Clear();

            CanWalk = false;
        }

        InstanceScript* instance;

        uint8 EventPhase;
        uint32 Event_Timer;

        uint8 MobSpawnId;
        uint8 MobCount;
        uint32 MobDeath_Timer;

        ObjectGuid RingMobGUID[4];
        ObjectGuid RingBossGUID;

        bool CanWalk;

        void Reset() override
        {
            Initialize();

            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }

        /// @todo move them to center
        void SummonRingMob()
        {
            if (Creature* tmp = me->SummonCreature(RingMob[MobSpawnId], 608.960f, -235.322f, -53.907f, 1.857f, TEMPSUMMON_DEAD_DESPAWN, 0))
                RingMobGUID[MobCount] = tmp->GetGUID();

            ++MobCount;

            if (MobCount == MAX_NPC_AMOUNT)
                MobDeath_Timer = 2500;
        }

        /// @todo move them to center
        void SummonRingBoss()
        {
            if (Creature* tmp = me->SummonCreature(RingBoss[rand32() % 6], 644.300f, -175.989f, -53.739f, 3.418f, TEMPSUMMON_DEAD_DESPAWN, 0))
                RingBossGUID = tmp->GetGUID();

            MobDeath_Timer = 2500;
        }

        void WaypointReached(uint32 waypointId) override
        {
            switch (waypointId)
            {
                case 0:
                    Talk(SAY_TEXT1);
                    CanWalk = false;
                    Event_Timer = 5000;
                    break;
                case 1:
                    Talk(SAY_TEXT2);
                    CanWalk = false;
                    Event_Timer = 5000;
                    break;
                case 2:
                    CanWalk = false;
                    break;
                case 3:
                    Talk(SAY_TEXT3);
                    break;
                case 4:
                    Talk(SAY_TEXT4);
                    CanWalk = false;
                    Event_Timer = 5000;
                    break;
                case 5:
                    instance->UpdateEncounterState(ENCOUNTER_CREDIT_KILL_CREATURE, NPC_GRIMSTONE, me);
                    instance->SetData(TYPE_RING_OF_LAW, DONE);
                    TC_LOG_DEBUG("scripts", "npc_grimstone: event reached end and set complete.");
                    break;
            }
        }

        void HandleGameObject(uint32 id, bool open)
        {
            instance->HandleGameObject(instance->GetGuidData(id), open);
        }

        void UpdateAI(uint32 diff) override
        {
            if (MobDeath_Timer)
            {
                if (MobDeath_Timer <= diff)
                {
                    MobDeath_Timer = 2500;

                    if (RingBossGUID)
                    {
                        Creature* boss = ObjectAccessor::GetCreature(*me, RingBossGUID);
                        if (boss && !boss->IsAlive() && boss->isDead())
                        {
                            RingBossGUID.Clear();
                            Event_Timer = 5000;
                            MobDeath_Timer = 0;
                            return;
                        }
                        return;
                    }

                    for (uint8 i = 0; i < MAX_NPC_AMOUNT; ++i)
                    {
                        Creature* mob = ObjectAccessor::GetCreature(*me, RingMobGUID[i]);
                        if (mob && !mob->IsAlive() && mob->isDead())
                        {
                            RingMobGUID[i].Clear();
                            --MobCount;

                            //seems all are gone, so set timer to continue and discontinue this
                            if (!MobCount)
                            {
                                Event_Timer = 5000;
                                MobDeath_Timer = 0;
                            }
                        }
                    }
                } else MobDeath_Timer -= diff;
            }

            if (Event_Timer)
            {
                if (Event_Timer <= diff)
                {
                    switch (EventPhase)
                    {
                    case 0:
                        Talk(SAY_TEXT5);
                        HandleGameObject(DATA_ARENA4, false);
                        Start(false, false);
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 1:
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 2:
                        Event_Timer = 2000;
                        break;
                    case 3:
                        HandleGameObject(DATA_ARENA1, true);
                        Event_Timer = 3000;
                        break;
                    case 4:
                        CanWalk = true;
                        me->SetVisible(false);
                        SummonRingMob();
                        Event_Timer = 8000;
                        break;
                    case 5:
                        SummonRingMob();
                        SummonRingMob();
                        Event_Timer = 8000;
                        break;
                    case 6:
                        SummonRingMob();
                        Event_Timer = 0;
                        break;
                    case 7:
                        me->SetVisible(true);
                        HandleGameObject(DATA_ARENA1, false);
                        Talk(SAY_TEXT6);
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 8:
                        HandleGameObject(DATA_ARENA2, true);
                        Event_Timer = 5000;
                        break;
                    case 9:
                        me->SetVisible(false);
                        SummonRingBoss();
                        Event_Timer = 0;
                        break;
                    case 10:
                        //if quest, complete
                        HandleGameObject(DATA_ARENA2, false);
                        HandleGameObject(DATA_ARENA3, true);
                        HandleGameObject(DATA_ARENA4, true);
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    }
                    ++EventPhase;
                } else Event_Timer -= diff;
            }

            if (CanWalk)
                npc_escortAI::UpdateAI(diff);
           }
    };
};

// npc_phalanx
enum PhalanxSpells
{
    SPELL_THUNDERCLAP                   = 8732,
    SPELL_FIREBALLVOLLEY                = 22425,
    SPELL_MIGHTYBLOW                    = 14099
};

class npc_phalanx : public CreatureScript
{
public:
    npc_phalanx() : CreatureScript("npc_phalanx") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_phalanxAI(creature);
    }

    struct npc_phalanxAI : public ScriptedAI
    {
        npc_phalanxAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            ThunderClap_Timer = 12000;
            FireballVolley_Timer = 0;
            MightyBlow_Timer = 15000;
        }

        uint32 ThunderClap_Timer;
        uint32 FireballVolley_Timer;
        uint32 MightyBlow_Timer;

        void Reset() override
        {
            Initialize();
        }

        void UpdateAI(uint32 diff) override
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            //ThunderClap_Timer
            if (ThunderClap_Timer <= diff)
            {
                DoCastVictim(SPELL_THUNDERCLAP);
                ThunderClap_Timer = 10000;
            } else ThunderClap_Timer -= diff;

            //FireballVolley_Timer
            if (HealthBelowPct(51))
            {
                if (FireballVolley_Timer <= diff)
                {
                    DoCastVictim(SPELL_FIREBALLVOLLEY);
                    FireballVolley_Timer = 15000;
                } else FireballVolley_Timer -= diff;
            }

            //MightyBlow_Timer
            if (MightyBlow_Timer <= diff)
            {
                DoCastVictim(SPELL_MIGHTYBLOW);
                MightyBlow_Timer = 10000;
            } else MightyBlow_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

// npc_kharan_mighthammer
enum KharamQuests
{
    QUEST_4001                          = 4001,
    QUEST_4342                          = 4342
};

#define GOSSIP_ITEM_KHARAN_1    "I need to know where the princess are, Kharan!"
#define GOSSIP_ITEM_KHARAN_2    "All is not lost, Kharan!"
#define GOSSIP_ITEM_KHARAN_3    "Gor'shak is my friend, you can trust me."
#define GOSSIP_ITEM_KHARAN_4    "Not enough, you need to tell me more."
#define GOSSIP_ITEM_KHARAN_5    "So what happened?"
#define GOSSIP_ITEM_KHARAN_6    "Continue..."
#define GOSSIP_ITEM_KHARAN_7    "So you suspect that someone on the inside was involved? That they were tipped off?"
#define GOSSIP_ITEM_KHARAN_8    "Continue with your story please."
#define GOSSIP_ITEM_KHARAN_9    "Indeed."
#define GOSSIP_ITEM_KHARAN_10   "The door is open, Kharan. You are a free man."

class npc_kharan_mighthammer : public CreatureScript
{
public:
    npc_kharan_mighthammer() : CreatureScript("npc_kharan_mighthammer") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                player->SEND_GOSSIP_MENU(2475, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
                player->SEND_GOSSIP_MENU(2476, creature->GetGUID());
                break;

            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
                player->SEND_GOSSIP_MENU(2477, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(2478, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                 player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
                player->SEND_GOSSIP_MENU(2479, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_8, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7);
                player->SEND_GOSSIP_MENU(2480, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_9, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8);
                player->SEND_GOSSIP_MENU(2481, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+8:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_10, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9);
                player->SEND_GOSSIP_MENU(2482, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+9:
                player->CLOSE_GOSSIP_MENU();
                if (player->GetTeam() == HORDE)
                    player->AreaExploredOrEventHappens(QUEST_4001);
                else
                    player->AreaExploredOrEventHappens(QUEST_4342);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_4001) == QUEST_STATUS_INCOMPLETE)
             player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        if (player->GetQuestStatus(4342) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);

        if (player->GetTeam() == HORDE)
            player->SEND_GOSSIP_MENU(2473, creature->GetGUID());
        else
            player->SEND_GOSSIP_MENU(2474, creature->GetGUID());

        return true;
    }
};

// npc_lokhtos_darkbargainer
enum LokhtosItems
{
    ITEM_THRORIUM_BROTHERHOOD_CONTRACT                     = 18628,
    ITEM_SULFURON_INGOT                                    = 17203
};

enum LokhtosQuests
{
    QUEST_A_BINDING_CONTRACT                               = 7604
};

enum LokhtosSpells
{
    SPELL_CREATE_THORIUM_BROTHERHOOD_CONTRACT_DND          = 23059
};

#define GOSSIP_ITEM_SHOW_ACCESS     "Show me what I have access to, Lothos."
#define GOSSIP_ITEM_GET_CONTRACT    "Get Thorium Brotherhood Contract"

class npc_lokhtos_darkbargainer : public CreatureScript
{
public:
    npc_lokhtos_darkbargainer() : CreatureScript("npc_lokhtos_darkbargainer") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->CLOSE_GOSSIP_MENU();
            player->CastSpell(player, SPELL_CREATE_THORIUM_BROTHERHOOD_CONTRACT_DND, false);
        }
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->IsVendor() && player->GetReputationRank(59) >= REP_FRIENDLY)
              player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_ITEM_SHOW_ACCESS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        if (player->GetQuestRewardStatus(QUEST_A_BINDING_CONTRACT) != 1 &&
            !player->HasItemCount(ITEM_THRORIUM_BROTHERHOOD_CONTRACT, 1, true) &&
            player->HasItemCount(ITEM_SULFURON_INGOT))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_GET_CONTRACT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        if (player->GetReputationRank(59) < REP_FRIENDLY)
            player->SEND_GOSSIP_MENU(3673, creature->GetGUID());
        else
            player->SEND_GOSSIP_MENU(3677, creature->GetGUID());

        return true;
    }
};

// npc_dughal_stormwing
enum DughalQuests
{
    QUEST_JAIL_BREAK                      = 4322
};

#define SAY_DUGHAL_FREE         "Thank you, $N! I'm free!!!"
#define GOSSIP_DUGHAL           "You're free, Dughal! Get out of here!"

// npc_marshal_windsor
#define SAY_WINDSOR_AGGRO1          "You locked up the wrong Marshal. Prepare to be destroyed!"
#define SAY_WINDSOR_AGGRO2          "I bet you're sorry now, aren't you !?!!"
#define SAY_WINDSOR_AGGRO3          "You better hold me back $N or they are going to feel some prison house beatings."
#define SAY_WINDSOR_1               "Let's get a move on. My gear should be in the storage area up this way..."
#define SAY_WINDSOR_4_1             "Check that cell, $N. If someone is alive in there, we need to get them out."
#define SAY_WINDSOR_4_2             "Get him out of there!"
#define SAY_WINDSOR_4_3             "Good work! We're almost there, $N. This way."
#define SAY_WINDSOR_6               "This is it, $N. My stuff should be in that room. Cover me, I'm going in!"
#define SAY_WINDSOR_9               "Ah, there it is!"

enum MarshalWindsor
{
    NPC_REGINALD_WINDSOR            = 9682
};

// npc_marshal_reginald_windsor
#define SAY_REGINALD_WINDSOR_0_1    "Can you feel the power, $N??? It's time to ROCK!"
#define SAY_REGINALD_WINDSOR_0_2    "Now we just have to free Tobias and we can get out of here. This way!"
#define SAY_REGINALD_WINDSOR_5_1    "Open it."
#define SAY_REGINALD_WINDSOR_5_2    "I never did like those two. Let's get moving."
#define SAY_REGINALD_WINDSOR_7_1    "Open it and be careful this time!"
#define SAY_REGINALD_WINDSOR_7_2    "That intolerant dirtbag finally got what was coming to him. Good riddance!"
#define SAY_REGINALD_WINDSOR_7_3    "Alright, let's go."
#define SAY_REGINALD_WINDSOR_13_1   "Open it. We need to hurry up. I can smell those Dark Irons coming a mile away and I can tell you one thing, they're COMING!"
#define SAY_REGINALD_WINDSOR_13_2   "Administering fists of fury on Crest Killer!"
#define SAY_REGINALD_WINDSOR_13_3   "He has to be in the last cell. Unless... they killed him."
#define SAY_REGINALD_WINDSOR_14_1   "Get him out of there!"
#define SAY_REGINALD_WINDSOR_14_2   "Excellent work, $N. Let's find the exit. I think I know the way. Follow me!"
#define SAY_REGINALD_WINDSOR_20_1   "We made it!"
#define SAY_REGINALD_WINDSOR_20_2   "Meet me at Maxwell's encampment. We'll go over the next stages of the plan there and figure out a way to decode my tablets without the decryption ring."

enum MarshalReginaldWindor
{
    NPC_SHILL_DINGER                = 9678,
    NPC_CREST_KILLER                = 9680
};

// npc_rocknot
enum RocknotSays
{
    SAY_GOT_BEER                       = 0
};

enum RocknotSpells
{
    SPELL_DRUNKEN_RAGE                 = 14872
};

enum RocknotQuests
{
    QUEST_ALE                          = 4295
};

class npc_rocknot : public CreatureScript
{
public:
    npc_rocknot() : CreatureScript("npc_rocknot") { }

    bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*item*/) override
    {
        InstanceScript* instance = creature->GetInstanceScript();
        if (!instance)
            return true;

        if (instance->GetData(TYPE_BAR) == DONE || instance->GetData(TYPE_BAR) == SPECIAL)
            return true;

        if (quest->GetQuestId() == QUEST_ALE)
        {
            if (instance->GetData(TYPE_BAR) != IN_PROGRESS)
                instance->SetData(TYPE_BAR, IN_PROGRESS);

            instance->SetData(TYPE_BAR, SPECIAL);

            //keep track of amount in instance script, returns SPECIAL if amount ok and event in progress
            if (instance->GetData(TYPE_BAR) == SPECIAL)
            {
                creature->AI()->Talk(SAY_GOT_BEER);
                creature->CastSpell(creature, SPELL_DRUNKEN_RAGE, false);

                if (npc_escortAI* escortAI = CAST_AI(npc_rocknot::npc_rocknotAI, creature->AI()))
                    escortAI->Start(false, false);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<npc_rocknotAI>(creature);
    }

    struct npc_rocknotAI : public npc_escortAI
    {
        npc_rocknotAI(Creature* creature) : npc_escortAI(creature)
        {
            Initialize();
            instance = creature->GetInstanceScript();
        }

        void Initialize()
        {
            BreakKeg_Timer = 0;
            BreakDoor_Timer = 0;
        }

        InstanceScript* instance;

        uint32 BreakKeg_Timer;
        uint32 BreakDoor_Timer;

        void Reset() override
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                return;

            Initialize();
        }

        void DoGo(uint32 id, uint32 state)
        {
            if (GameObject* go = instance->instance->GetGameObject(instance->GetGuidData(id)))
                go->SetGoState((GOState)state);
        }

        void WaypointReached(uint32 waypointId) override
        {
            switch (waypointId)
            {
                case 1:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                    break;
                case 2:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_UNARMED);
                    break;
                case 3:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_UNARMED);
                    break;
                case 4:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                    break;
                case 5:
                    me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                    BreakKeg_Timer = 2000;
                    break;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (BreakKeg_Timer)
            {
                if (BreakKeg_Timer <= diff)
                {
                    DoGo(DATA_GO_BAR_KEG, 0);
                    BreakKeg_Timer = 0;
                    BreakDoor_Timer = 1000;
                } else BreakKeg_Timer -= diff;
            }

            if (BreakDoor_Timer)
            {
                if (BreakDoor_Timer <= diff)
                {
                    DoGo(DATA_GO_BAR_DOOR, 2);
                    DoGo(DATA_GO_BAR_KEG_TRAP, 0);               //doesn't work very well, leaving code here for future
                    //spell by trap has effect61, this indicate the bar go hostile

                    if (Unit* tmp = ObjectAccessor::GetUnit(*me, instance->GetGuidData(DATA_PHALANX)))
                        tmp->setFaction(14);

                    //for later, this event(s) has alot more to it.
                    //optionally, DONE can trigger bar to go hostile.
                    instance->SetData(TYPE_BAR, DONE);

                    BreakDoor_Timer = 0;
                } else BreakDoor_Timer -= diff;
            }

            npc_escortAI::UpdateAI(diff);
        }
    };
};


enum CorenDirebrew
{
	SPELL_DISARM = 47310,
	SPELL_DISARM_PRECAST = 47407,
	SPELL_MOLE_MACHINE_EMERGE = 50313,
	NPC_ILSA_DIREBREW = 26764,
	NPC_URSULA_DIREBREW = 26822,
	NPC_DIREBREW_MINION = 26776,
	EQUIP_ID_TANKARD = 48663,
	FACTION_HOSTILE_CORE = 736
};

#define GOSSIP_TEXT_INSULT "Insult Coren Direbrew's brew."

static Position _pos[] =
{
	{ 890.87f, -133.95f, -48.0f, 1.53f },
	{ 892.47f, -133.26f, -48.0f, 2.16f },
	{ 893.54f, -131.81f, -48.0f, 2.75f }
};

class npc_coren_direbrew : public CreatureScript
{
public:
	npc_coren_direbrew() : CreatureScript("npc_coren_direbrew") { }

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (creature->IsQuestGiver())
			player->PrepareQuestMenu(creature->GetGUID());

		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_INSULT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
		player->SEND_GOSSIP_MENU(15858, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
	{
		player->PlayerTalkClass->ClearMenus();

		if (action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			creature->setFaction(FACTION_HOSTILE_CORE);
			creature->AI()->AttackStart(player);
			creature->AI()->DoZoneInCombat();
			player->CLOSE_GOSSIP_MENU();
		}

		return true;
	}

	struct npc_coren_direbrewAI : public ScriptedAI
	{
		npc_coren_direbrewAI(Creature* c) : ScriptedAI(c), _summons(me)
		{
		}

		void Reset()
		{
			me->RestoreFaction();
			me->SetCorpseDelay(90); // 1.5 minutes

			_addTimer = 20000;
			_disarmTimer = urand(10, 15) *IN_MILLISECONDS;

			_spawnedIlsa = false;
			_spawnedUrsula = false;
			_summons.DespawnAll();

			for (uint8 i = 0; i < 3; ++i)
				if (Creature* creature = me->SummonCreature(NPC_DIREBREW_MINION, _pos[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000))
					_add[i] = creature->GetGUID();
		}

		void EnterCombat(Unit* /*who*/)
		{
			SetEquipmentSlots(false, EQUIP_ID_TANKARD, EQUIP_ID_TANKARD, EQUIP_NO_CHANGE);

			for (uint8 i = 0; i < 3; ++i)
			{
				if (_add[i])
				{
					Creature* creature = ObjectAccessor::GetCreature((*me), _add[i]);
					if (creature && creature->IsAlive())
					{
						creature->setFaction(FACTION_HOSTILE_CORE);
						creature->SetInCombatWithZone();
					}
					_add[i] = ObjectGuid::Empty;
				}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			// disarm
			if (_disarmTimer <= diff)
			{
				DoCast(SPELL_DISARM_PRECAST);
				DoCastVictim(SPELL_DISARM, false);
				_disarmTimer = urand(20, 25) *IN_MILLISECONDS;
			}
			else
				_disarmTimer -= diff;

			// spawn non-elite adds
			if (_addTimer <= diff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
				{
					float posX, posY, posZ;
					target->GetPosition(posX, posY, posZ);
					target->CastSpell(target, SPELL_MOLE_MACHINE_EMERGE, true, 0, 0, me->GetGUID());
					me->SummonCreature(NPC_DIREBREW_MINION, posX, posY, posZ, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);

					_addTimer = 15000;
					if (_spawnedIlsa)
						_addTimer -= 3000;
					if (_spawnedUrsula)
						_addTimer -= 3000;
				}
			}
			else
				_addTimer -= diff;

			if (!_spawnedIlsa && HealthBelowPct(66))
			{
				DoSpawnCreature(NPC_ILSA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
				_spawnedIlsa = true;
			}

			if (!_spawnedUrsula && HealthBelowPct(33))
			{
				DoSpawnCreature(NPC_URSULA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
				_spawnedUrsula = true;
			}

			DoMeleeAttackIfReady();
		}

			void JustSummoned(Creature* summon)
		{
			if (me->getFaction() == FACTION_HOSTILE_CORE)
			{
				summon->setFaction(FACTION_HOSTILE_CORE);

				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					summon->AI()->AttackStart(target);
			}

			_summons.Summon(summon);
		}

		void JustDied(Unit* /*killer*/)
		{
			_summons.DespawnAll();

			Map::PlayerList const& players = me->GetMap()->GetPlayers();
			if (!players.isEmpty())
			{
				if (Group* group = players.begin()->GetSource()->GetGroup())
					if (group->isLFGGroup())
						sLFGMgr->FinishDungeon(group->GetGUID(), 287);
			}			
		}

	private:
		SummonList _summons;
		ObjectGuid _add[3];
		uint32 _addTimer;
		uint32 _disarmTimer;
		bool _spawnedIlsa;
		bool _spawnedUrsula;
	};

	CreatureAI* GetAI(Creature* c) const
	{
		return new npc_coren_direbrewAI(c);
	}
};

/*######
## dark iron brewmaiden
######*/

enum Brewmaiden
{
	SPELL_SEND_FIRST_MUG = 47333,
	SPELL_SEND_SECOND_MUG = 47339,
	//SPELL_CREATE_BREW = 47345,
	SPELL_HAS_BREW_BUFF = 47376,
	//SPELL_HAS_BREW = 47331,
	//SPELL_DARK_BREWMAIDENS_STUN = 47340,
	SPELL_CONSUME_BREW = 47377,
	SPELL_BARRELED = 47442,
	SPELL_CHUCK_MUG = 50276
};

class npc_brewmaiden : public CreatureScript
{
public:
	npc_brewmaiden() : CreatureScript("npc_brewmaiden") { }

	struct npc_brewmaidenAI : public ScriptedAI
	{
		npc_brewmaidenAI(Creature* c) : ScriptedAI(c)
		{
		}

		void Reset()
		{
			_brewTimer = 2000;
			_barrelTimer = 5000;
			_chuckMugTimer = 10000;
		}

		void EnterCombat(Unit* /*who*/)
		{
			me->SetInCombatWithZone();
		}

		void AttackStart(Unit* who)
		{
			if (!who)
				return;

			if (me->Attack(who, true))
			{
				me->AddThreat(who, 1.0f);
				me->SetInCombatWith(who);
				who->SetInCombatWith(me);

				if (me->GetEntry() == NPC_URSULA_DIREBREW)
					me->GetMotionMaster()->MoveFollow(who, 10.0f, 0.0f);
				else
					me->GetMotionMaster()->MoveChase(who);
			}
		}

		void SpellHitTarget(Unit* target, SpellInfo const* spell)
		{
			// TODO: move to DB

			if (spell->Id == SPELL_SEND_FIRST_MUG)
				target->CastSpell(target, SPELL_HAS_BREW_BUFF, true);

			if (spell->Id == SPELL_SEND_SECOND_MUG)
				target->CastSpell(target, SPELL_CONSUME_BREW, true);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (_brewTimer <= diff)
			{
				if (!me->IsNonMeleeSpellCast(false))
				{
					Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);

					if (target && me->GetDistance(target) > 5.0f)
					{
						DoCast(target, SPELL_SEND_FIRST_MUG);
						_brewTimer = 12000;
					}
				}
			}
			else
				_brewTimer -= diff;

			if (_chuckMugTimer <= diff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					DoCast(target, SPELL_CHUCK_MUG);

				_chuckMugTimer = 15000;
			}
			else
				_chuckMugTimer -= diff;

			if (me->GetEntry() == NPC_URSULA_DIREBREW)
			{
				if (_barrelTimer <= diff)
				{
					if (!me->IsNonMeleeSpellCast(false))
					{
						DoCastVictim(SPELL_BARRELED);
						_barrelTimer = urand(15, 18) *IN_MILLISECONDS;
					}
				}
				else
					_barrelTimer -= diff;
			}
			else
				DoMeleeAttackIfReady();
		}

	private:
		uint32 _brewTimer;
		uint32 _barrelTimer;
		uint32 _chuckMugTimer;
	};

	CreatureAI* GetAI(Creature* c) const
	{
		return new npc_brewmaidenAI(c);
	}
};

enum QuestWhatIsGoingOn
{
    QUEST_WHAT_IS_GOING_ON = 3982,
    NPC_ANVILRAGE_WARDEN = 8890,
    NPC_ANVILRAGE_GUARDSMAN = 8891,
    ACTION_START_EVENT = 1
};

Position WhatIsGoingOnSpawnPos[] =
{
    { 382.459f, -191.257f, -68.848f, 3.001f },
    { 381.098f, -194.544f, -69.419f, 2.459f },
    { 378.039f, -196.116f, -70.081f, 1.921f },
    { 374.3f, -195.719f, -70.874f, 1.269f }
};

class npc_commander_gorshak : public CreatureScript
{
public:
    npc_commander_gorshak() : CreatureScript("npc_commander_gorshak") { }

    bool OnQuestAccept(Player* /*player*/, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_WHAT_IS_GOING_ON)
            creature->AI()->DoAction(ACTION_START_EVENT);
        return true;
    }

    struct npc_commander_gorshakAI : public ScriptedAI
    {
        npc_commander_gorshakAI(Creature* creature) : ScriptedAI(creature), Summons(me)
        {
            EventRunning = false;
            NextWave = 0;
            WaveNumber = 1;
        }

        void DoAction(int32 action) override
        {
            if (!EventRunning && action == ACTION_START_EVENT)
            {
                EventRunning = true;
                NextWave = 1 * IN_MILLISECONDS;
                WaveNumber = 1;
            }
        }

        void JustSummoned(Creature* summon) override
        {
            if (Player* player = summon->SelectNearestPlayer(50.0f))
                summon->AI()->AttackStart(player);

            Summons.Summon(summon);
        }

        void UpdateAI(uint32 diff) override
        {
            if (EventRunning)
            {
                if (WaveNumber <= 2)
                {
                    if ((NextWave <= diff))
                    {
                        for (uint8 i = 0; i < 4; i++)
                        {
                            if (WaveNumber == 1)
                                me->SummonCreature(NPC_ANVILRAGE_WARDEN, WhatIsGoingOnSpawnPos[i]);
                            else
                                me->SummonCreature(NPC_ANVILRAGE_GUARDSMAN, WhatIsGoingOnSpawnPos[i]);
                        }
                        WaveNumber++;
                        NextWave = 30 * IN_MILLISECONDS;
                    }
                    else
                    {
                        NextWave -= diff;
                    }
                }
                else
                {
                    uint8 deadsummons = 0;
                    for (std::list<ObjectGuid>::const_iterator itr = Summons.begin(); itr != Summons.end(); ++itr)
                    {
                        if (Creature* creature = ObjectAccessor::GetCreature(*me, *itr))
                        {
                            if (creature->isDead())
                                deadsummons++;
                        }
                    }

                    if (deadsummons == Summons.size())
                    {
                        std::list<Player*> players = me->GetNearestPlayersList(50.0f);
                        for (std::list<Player*>::const_iterator pitr = players.begin(); pitr != players.end(); ++pitr)
                        {
                            Player* player = *pitr;
                            if (player->GetQuestStatus(QUEST_WHAT_IS_GOING_ON) == QUEST_STATUS_INCOMPLETE)
                                player->AreaExploredOrEventHappens(QUEST_WHAT_IS_GOING_ON);
                        }

                        EventRunning = false;
                    }
                }
            }

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

    private:
        bool EventRunning;
        uint32 NextWave;
        uint8 WaveNumber;
        SummonList Summons;

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_commander_gorshakAI(creature);
    }
};

void AddSC_blackrock_depths()
{
    new go_shadowforge_brazier();
    new at_ring_of_law();
    new npc_grimstone();
    new npc_phalanx();
    new npc_kharan_mighthammer();
    new npc_lokhtos_darkbargainer();
    new npc_rocknot();

	new npc_coren_direbrew();
	new npc_brewmaiden();
    new npc_commander_gorshak();
}
