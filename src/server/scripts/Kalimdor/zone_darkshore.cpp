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
SDName: Darkshore
SD%Complete: 100
SDComment: Quest support: 731, 2078, 5321
SDCategory: Darkshore
EndScriptData */

/* ContentData
npc_kerlonian
npc_prospector_remtravel
npc_threshwackonator
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"
#include "Player.h"
#include "SpellInfo.h"

/*####
# npc_kerlonian
####*/

enum Kerlonian
{
    SAY_KER_START               = 0,
    EMOTE_KER_SLEEP             = 1,
    SAY_KER_SLEEP               = 2,
    SAY_KER_ALERT_1             = 3,
    SAY_KER_END                 = 4,
    EMOTE_KER_AWAKEN            = 5,

    SPELL_SLEEP_VISUAL          = 25148,
    SPELL_AWAKEN                = 17536,
    QUEST_SLEEPER_AWAKENED      = 5321,
    NPC_LILADRIS                = 11219,                    //attackers entries unknown
    FACTION_KER_ESCORTEE        = 113
};

/// @todo make concept similar as "ringo" -escort. Find a way to run the scripted attacks, _if_ player are choosing road.
class npc_kerlonian : public CreatureScript
{
public:
    npc_kerlonian() : CreatureScript("npc_kerlonian") { }

    struct npc_kerlonianAI : public FollowerAI
    {
        npc_kerlonianAI(Creature* creature) : FollowerAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            FallAsleepTimer = urand(10000, 45000);
        }

        uint32 FallAsleepTimer;

        void Reset() override
        {
            Initialize();
        }

        void MoveInLineOfSight(Unit* who) override

        {
            FollowerAI::MoveInLineOfSight(who);

            if (!me->GetVictim() && !HasFollowState(STATE_FOLLOW_COMPLETE) && who->GetEntry() == NPC_LILADRIS)
            {
                if (me->IsWithinDistInMap(who, INTERACTION_DISTANCE*5))
                {
                    if (Player* player = GetLeaderForFollower())
                    {
                        if (player->GetQuestStatus(QUEST_SLEEPER_AWAKENED) == QUEST_STATUS_INCOMPLETE)
                            player->GroupEventHappens(QUEST_SLEEPER_AWAKENED, me);

                        Talk(SAY_KER_END);
                    }

                    SetFollowComplete();
                }
            }
        }

        void SpellHit(Unit* /*pCaster*/, const SpellInfo* pSpell) override
        {
            if (HasFollowState(STATE_FOLLOW_INPROGRESS | STATE_FOLLOW_PAUSED) && pSpell->Id == SPELL_AWAKEN)
                ClearSleeping();
        }

        void SetSleeping()
        {
            SetFollowPaused(true);

            Talk(EMOTE_KER_SLEEP);

            Talk(SAY_KER_SLEEP);

            me->SetStandState(UNIT_STAND_STATE_SLEEP);
            DoCast(me, SPELL_SLEEP_VISUAL, false);
        }

        void ClearSleeping()
        {
            me->RemoveAurasDueToSpell(SPELL_SLEEP_VISUAL);
            me->SetStandState(UNIT_STAND_STATE_STAND);

            Talk(EMOTE_KER_AWAKEN);

            SetFollowPaused(false);
        }

        void UpdateFollowerAI(uint32 diff) override
        {
            if (!UpdateVictim())
            {
                if (!HasFollowState(STATE_FOLLOW_INPROGRESS))
                    return;

                if (!HasFollowState(STATE_FOLLOW_PAUSED))
                {
                    if (FallAsleepTimer <= diff)
                    {
                        SetSleeping();
                        FallAsleepTimer = urand(25000, 90000);
                    }
                    else
                        FallAsleepTimer -= diff;
                }

                return;
            }

            DoMeleeAttackIfReady();
        }
    };

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_SLEEPER_AWAKENED)
        {
            if (npc_kerlonianAI* pKerlonianAI = CAST_AI(npc_kerlonian::npc_kerlonianAI, creature->AI()))
            {
                creature->SetStandState(UNIT_STAND_STATE_STAND);
                creature->AI()->Talk(SAY_KER_START, player);
                pKerlonianAI->StartFollow(player, FACTION_KER_ESCORTEE, quest);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_kerlonianAI(creature);
    }
};

/*####
# npc_prospector_remtravel
####*/

enum Remtravel
{
    SAY_REM_START               = 0,
    SAY_REM_AGGRO               = 1,
    SAY_REM_RAMP1_1             = 2,
    SAY_REM_RAMP1_2             = 3,
    SAY_REM_BOOK                = 4,
    SAY_REM_TENT1_1             = 5,
    SAY_REM_TENT1_2             = 6,
    SAY_REM_MOSS                = 7,
    EMOTE_REM_MOSS              = 8,
    SAY_REM_MOSS_PROGRESS       = 9,
    SAY_REM_PROGRESS            = 10,
    SAY_REM_REMEMBER            = 11,
    EMOTE_REM_END               = 12,

    FACTION_ESCORTEE            = 10,
    QUEST_ABSENT_MINDED_PT2     = 731,
    NPC_GRAVEL_SCOUT            = 2158,
    NPC_GRAVEL_BONE             = 2159,
    NPC_GRAVEL_GEO              = 2160
};

class npc_prospector_remtravel : public CreatureScript
{
public:
    npc_prospector_remtravel() : CreatureScript("npc_prospector_remtravel") { }

    struct npc_prospector_remtravelAI : public npc_escortAI
    {
        npc_prospector_remtravelAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset() override { }

        void EnterCombat(Unit* who) override
        {
            if (urand(0, 1))
                Talk(SAY_REM_AGGRO, who);
        }

        void JustSummoned(Creature* /*pSummoned*/) override
        {
            //unsure if it should be any
            //pSummoned->AI()->AttackStart(me);
        }

        void WaypointReached(uint32 waypointId) override
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                    case 0:
                        Talk(SAY_REM_START, player);
                        break;
                    case 5:
                        Talk(SAY_REM_RAMP1_1, player);
                        break;
                    case 6:
                        DoSpawnCreature(NPC_GRAVEL_SCOUT, -10.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        DoSpawnCreature(NPC_GRAVEL_BONE, -10.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        break;
                    case 9:
                        Talk(SAY_REM_RAMP1_2, player);
                        break;
                    case 14:
                        //depend quest rewarded?
                        Talk(SAY_REM_BOOK, player);
                        break;
                    case 15:
                        Talk(SAY_REM_TENT1_1, player);
                        break;
                    case 16:
                        DoSpawnCreature(NPC_GRAVEL_SCOUT, -10.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        DoSpawnCreature(NPC_GRAVEL_BONE, -10.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        break;
                    case 17:
                        Talk(SAY_REM_TENT1_2, player);
                        break;
                    case 26:
                        Talk(SAY_REM_MOSS, player);
                        break;
                    case 27:
                        Talk(EMOTE_REM_MOSS, player);
                        break;
                    case 28:
                        Talk(SAY_REM_MOSS_PROGRESS, player);
                        break;
                    case 29:
                        DoSpawnCreature(NPC_GRAVEL_SCOUT, -15.0f, 3.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        DoSpawnCreature(NPC_GRAVEL_BONE, -15.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        DoSpawnCreature(NPC_GRAVEL_GEO, -15.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        break;
                    case 31:
                        Talk(SAY_REM_PROGRESS, player);
                        break;
                    case 41:
                        Talk(SAY_REM_REMEMBER, player);
                        break;
                    case 42:
                        Talk(EMOTE_REM_END, player);
                        player->GroupEventHappens(QUEST_ABSENT_MINDED_PT2, me);
                        break;
                }
            }
        }
    };

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_ABSENT_MINDED_PT2)
        {
            if (npc_escortAI* pEscortAI = CAST_AI(npc_prospector_remtravel::npc_prospector_remtravelAI, creature->AI()))
                pEscortAI->Start(false, false, player->GetGUID());

            creature->setFaction(FACTION_ESCORTEE);
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_prospector_remtravelAI(creature);
    }
};

/*####
# npc_threshwackonator
####*/

enum Threshwackonator
{
    EMOTE_START             = 0,
    SAY_AT_CLOSE            = 1,
    QUEST_GYROMAST_REV      = 2078,
    NPC_GELKAK              = 6667,
    FACTION_HOSTILE         = 14
};

#define GOSSIP_ITEM_INSERT_KEY  "[PH] Insert key"

class npc_threshwackonator : public CreatureScript
{
public:
    npc_threshwackonator() : CreatureScript("npc_threshwackonator") { }

    struct npc_threshwackonatorAI : public FollowerAI
    {
        npc_threshwackonatorAI(Creature* creature) : FollowerAI(creature) { }

        void Reset() override { }

        void MoveInLineOfSight(Unit* who) override

        {
            FollowerAI::MoveInLineOfSight(who);

            if (!me->GetVictim() && !HasFollowState(STATE_FOLLOW_COMPLETE) && who->GetEntry() == NPC_GELKAK)
            {
                if (me->IsWithinDistInMap(who, 10.0f))
                {
                    Talk(SAY_AT_CLOSE, who);
                    DoAtEnd();
                }
            }
        }

        void DoAtEnd()
        {
            me->setFaction(FACTION_HOSTILE);

            if (Player* pHolder = GetLeaderForFollower())
                AttackStart(pHolder);

            SetFollowComplete(true);
        }
    };

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();

            if (npc_threshwackonatorAI* pThreshAI = CAST_AI(npc_threshwackonator::npc_threshwackonatorAI, creature->AI()))
            {
                creature->AI()->Talk(EMOTE_START);
                pThreshAI->StartFollow(player);
            }
        }

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(QUEST_GYROMAST_REV) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_INSERT_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_threshwackonatorAI(creature);
    }
};

// Ours
enum murkdeep
{
	NPC_GREYMIST_HUNTER = 2206,
	NPC_GREYMIST_WARRIOR = 2205,
	NPC_GREYMIST_COASTRUNNER = 2202,

	SPELL_SUNDER_ARMOR = 11971,
	SPELL_NET = 6533,

	EVENT_SPELL_SUNDER_ARMOR = 2,
	EVENT_SPELL_NET = 3,
};

class npc_murkdeep : public CreatureScript
{
public:
	npc_murkdeep() : CreatureScript("npc_murkdeep") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_murkdeepAI(creature);
	}

	struct npc_murkdeepAI : public ScriptedAI
	{
		npc_murkdeepAI(Creature* c) : ScriptedAI(c) {}

		uint8 phase;
		uint32 spawnTimer;
		EventMap events;

		void Reset()
		{
			spawnTimer = 0;
			phase = 0;
			me->SetVisible(false);
			me->SetReactState(REACT_PASSIVE);
		}

		void EnterCombat(Unit*)
		{
			events.Reset();
			events.ScheduleEvent(EVENT_SPELL_SUNDER_ARMOR, 5000);
			events.ScheduleEvent(EVENT_SPELL_NET, 10000);
		}

		void UpdateAI(uint32 diff)
		{
			spawnTimer += diff;
			if (spawnTimer >= 5000)
			{
				spawnTimer = 0;
				switch (phase)
				{
				case 0:
					if (!me->FindNearestCreature(NPC_GREYMIST_WARRIOR, 80.0f, true) && !me->FindNearestCreature(NPC_GREYMIST_HUNTER, 80.0f, true))
					{
						Player *player = me->SelectNearestPlayer(100.0f);
						if (!player)
							return;

						phase++;
						for (int i = 0; i < 3; ++i)
							if (Creature* cr = me->SummonCreature(NPC_GREYMIST_COASTRUNNER, me->GetPositionX() + irand(-5, 5), me->GetPositionY() + irand(-5, 5), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
								cr->AI()->AttackStart(player);
					}
					return;
				case 1:
					if (!me->FindNearestCreature(NPC_GREYMIST_COASTRUNNER, 80.0f))
					{
						Player *player = me->SelectNearestPlayer(100.0f);
						if (!player)
							return;

						phase++;
						for (int i = 0; i < 2; ++i)
							if (Creature* cr = me->SummonCreature(NPC_GREYMIST_WARRIOR, me->GetPositionX() + irand(-5, 5), me->GetPositionY() + irand(-5, 5), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
								cr->AI()->AttackStart(player);
					}
					return;
				case 2:
					if (!me->FindNearestCreature(NPC_GREYMIST_WARRIOR, 80.0f))
					{
						Player *player = me->SelectNearestPlayer(100.0f);
						if (!player)
							return;

						phase++;
						if (Creature* cr = me->SummonCreature(NPC_GREYMIST_HUNTER, me->GetPositionX() + irand(-5, 5), me->GetPositionY() + irand(-5, 5), me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
							cr->AI()->AttackStart(player);

						me->SetReactState(REACT_AGGRESSIVE);
						me->SetVisible(true);
						AttackStart(player);
					}
					return;
				}
			}

			if (!me->IsVisible())
				return;

			if (!UpdateVictim())
				return;

			events.Update(diff);
			switch (events.ExecuteEvent())
			{
			case EVENT_SPELL_SUNDER_ARMOR:
				me->CastSpell(me->GetVictim(), SPELL_SUNDER_ARMOR, false);
				events.ScheduleEvent(EVENT_SPELL_SUNDER_ARMOR, 15000);
				break;
			case EVENT_SPELL_NET:
				me->CastSpell(me->GetVictim(), SPELL_NET, false);
				events.ScheduleEvent(EVENT_SPELL_NET, 25000);
				break;
			}

			DoMeleeAttackIfReady();
		}
	};
};

enum OneShotOneKillMisc
{
	// Quests
	QUEST_ONESHOTONEKILL = 5713,

	// Creatures
	NPC_BLACKWOOD_TRACKER = 11713,
	NPC_MAROSH_THE_DEVIOUS = 11714,

	// Actions
	ACTION_ONESHOTONEKILL_START = 1,

	// Spells
	SPELL_SHOOT = 19767,

	// Items
	ITEM_EQUIP = 22969,

	// Texts
	SAY_START = 0,
	SAY_OUT_OF_ARROWS = 1,
	SAY_END = 2,
	SAY_END2 = 3,
	SAY_END3 = 4
};

class npc_aynasha : public CreatureScript
{
public:
	npc_aynasha() : CreatureScript("npc_aynasha") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_ONESHOTONEKILL)
		{
			CAST_AI(npc_aynasha::npc_aynashaAI, creature->AI())->StartEvent();
			CAST_AI(npc_aynasha::npc_aynashaAI, creature->AI())->PlayerGUID = (player->GetGUID());

			if (npc_escortAI* pEscortAI = CAST_AI(npc_aynasha::npc_aynashaAI, creature->AI()))
				pEscortAI->Start(true, true, player->GetGUID());

		}
		return true;
	}

	struct npc_aynashaAI : public npc_escortAI
	{
		npc_aynashaAI(Creature* creature) : npc_escortAI(creature)
		{
			bArrow_said = 0;
			Emote_done = 0;
			uiWait_Controller = 0;
		}

		ObjectGuid PlayerGUID;

		void Reset() override
		{
			uiShoot_Timer = 1 * IN_MILLISECONDS;
		}

		void WaypointReached(uint32 waypointId) override { }

		void JustSummoned(Creature* summoned) override
		{
			summoned->AI()->AttackStart(me);
		}

		void JustDied(Unit* /*killer*/) override
		{
			if (PlayerGUID)
				if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
					player->FailQuest(QUEST_ONESHOTONEKILL);
		}

		void UpdateAI(uint32 diff) override
		{
			if (uiWait_Controller)
			{
				if (uiWait_Timer <= diff)
				{
					switch (uiWait_Controller)
					{
					case 1:
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4374.425781f, -55.801338f, 87.653648f, 5.664735f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4377.024414f, -53.647842f, 86.534828f, 5.495090f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4379.248535f, -50.534988f, 85.865311f, 5.363142f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						++uiWait_Controller;
						uiWait_Timer = 30 * IN_MILLISECONDS;
						break;
					case 2:
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4374.425781f, -55.801338f, 87.653648f, 5.664735f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4377.024414f, -53.647842f, 86.534828f, 5.495090f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 379.248535f, -50.534988f, 85.865311f, 5.363142f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						me->SummonCreature(NPC_BLACKWOOD_TRACKER, 4370.991211f, -50.038376f, 86.439560f, 5.530042f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						++uiWait_Controller;
						uiWait_Timer = 30 * IN_MILLISECONDS;
						break;
					case 3:
						me->SummonCreature(NPC_MAROSH_THE_DEVIOUS, 4377.024414f, -53.647842f, 86.534828f, 5.495090f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10 * IN_MILLISECONDS);
						++uiWait_Controller;
						uiWait_Timer = 20 * IN_MILLISECONDS;
						break;
					case 4:
						if (!UpdateVictim())
						{
							Talk(SAY_END);
							Emote_done = 1;
							uiWait_Timer = 10 * IN_MILLISECONDS;
							++uiWait_Controller;
						}
						break;
					case 5:
						if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
							player->GroupEventHappens(QUEST_ONESHOTONEKILL, me);
						Talk(SAY_END2);
						me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
						bArrow_said = 0;
						++uiWait_Controller;
						uiWait_Timer = 5 * IN_MILLISECONDS;
						break;
					case 6:
						Talk(SAY_END3);
						uiWait_Controller = 0;
						me->DespawnOrUnsummon();
						me->SetRespawnTime(1);
						me->SetCorpseDelay(1);
						break;
					default:
						break;
					}
				}
				else uiWait_Timer -= diff;
			}

			if (uiArrow_Timer <= diff && !bArrow_said && uiWait_Controller)
			{
				Talk(SAY_OUT_OF_ARROWS);
				bArrow_said = 1;
			}
			else uiArrow_Timer -= diff;

			if (uiEmote_Timer <= diff && !Emote_done && uiWait_Controller)
			{
				me->HandleEmoteCommand(EMOTE_ONESHOT_USE_STANDING);
				uiEmote_Timer = 1 * IN_MILLISECONDS;
			}
			else uiEmote_Timer -= diff;

			if (uiShoot_Timer <= diff && !bArrow_said)
			{
				DoCast(me->GetVictim(), SPELL_SHOOT);
				uiShoot_Timer = 1 * IN_MILLISECONDS;
			}
			else uiShoot_Timer -= diff;
		}

		void StartEvent()
		{
			uiWait_Controller = 1;
			Emote_done = 0;
			uiWait_Timer = 5 * IN_MILLISECONDS;
			me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			Talk(SAY_START);
			uiArrow_Timer = 40 * IN_MILLISECONDS;
			uiEmote_Timer = 2 * IN_MILLISECONDS;
		}

	private:
		uint32 uiWait_Controller;
		uint32 uiWait_Timer;
		uint32 uiShoot_Timer;
		uint32 uiArrow_Timer;
		uint32 uiEmote_Timer;
		bool bArrow_said;
		bool Emote_done;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_aynashaAI(creature);
	}
};


void AddSC_darkshore()
{
    new npc_kerlonian();
    new npc_prospector_remtravel();
    new npc_threshwackonator();
	new npc_murkdeep();

	// Dalaran WoW Code
	new npc_aynasha();
}
