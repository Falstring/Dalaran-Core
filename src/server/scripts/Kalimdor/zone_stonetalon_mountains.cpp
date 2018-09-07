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
SDName: Stonetalon_Mountains
SD%Complete: 95
SDComment: Quest support: 6627, 6523
SDCategory: Stonetalon Mountains
EndScriptData */

/* ContentData
npc_braug_dimspirit
npc_kaya_flathoof
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "Player.h"
#include "Group.h"

/*######
## npc_braug_dimspirit
######*/

#define GOSSIP_HBD1 "Ysera"
#define GOSSIP_HBD2 "Neltharion"
#define GOSSIP_HBD3 "Nozdormu"
#define GOSSIP_HBD4 "Alexstrasza"
#define GOSSIP_HBD5 "Malygos"

class npc_braug_dimspirit : public CreatureScript
{
public:
    npc_braug_dimspirit() : CreatureScript("npc_braug_dimspirit") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player, 6766, false);

        }
        if (action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();
            player->AreaExploredOrEventHappens(6627);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(6627) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HBD1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HBD2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HBD3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HBD4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HBD5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

            player->SEND_GOSSIP_MENU(5820, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(5819, creature->GetGUID());

        return true;
    }

};

/*######
## npc_kaya_flathoof
######*/

enum Kaya
{
    FACTION_ESCORTEE_H          = 775,

    NPC_GRIMTOTEM_RUFFIAN       = 11910,
    NPC_GRIMTOTEM_BRUTE         = 11912,
    NPC_GRIMTOTEM_SORCERER      = 11913,

    SAY_START                   = 0,
    SAY_AMBUSH                  = 1,
    SAY_END                     = 2,

    QUEST_PROTECT_KAYA          = 6523
};

class npc_kaya_flathoof : public CreatureScript
{
public:
    npc_kaya_flathoof() : CreatureScript("npc_kaya_flathoof") { }

    struct npc_kaya_flathoofAI : public npc_escortAI
    {
        npc_kaya_flathoofAI(Creature* creature) : npc_escortAI(creature) { }

        void WaypointReached(uint32 waypointId) override
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 16:
                    Talk(SAY_AMBUSH);
                    me->SummonCreature(NPC_GRIMTOTEM_BRUTE, -48.53f, -503.34f, -46.31f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_GRIMTOTEM_RUFFIAN, -38.85f, -503.77f, -45.90f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_GRIMTOTEM_SORCERER, -36.37f, -496.23f, -45.71f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 18:
                    me->SetInFront(player);
                    Talk(SAY_END);
                    player->GroupEventHappens(QUEST_PROTECT_KAYA, me);
                    break;
            }
        }

        void JustSummoned(Creature* summoned) override
        {
            summoned->AI()->AttackStart(me);
        }

        void Reset() override { }
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_PROTECT_KAYA)
        {
            if (npc_escortAI* pEscortAI = CAST_AI(npc_kaya_flathoof::npc_kaya_flathoofAI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());

            creature->AI()->Talk(SAY_START);
            creature->setFaction(113);
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_kaya_flathoofAI(creature);
    }

};

/*######
## npc_piznik
######*/

enum PinzikMisc
{
	// Quests
	QUEST_GERENZOS_ORDER = 1090,

	// Creatures
	NPC_WINDSHEAR_DIGGER = 3999,
};

Position const PinzikSummonPositions[3] =
{
	{ 954.349976f, -257.600006f, -3.477842f, 5.753643f },
	{ 956.172607f, -254.613449f, -3.107884f, 5.408071f },
	{ 953.306152f, -261.492126f, -3.711920f, 5.973548f },
};

class npc_piznik : public CreatureScript
{
public:
	npc_piznik() : CreatureScript("npc_piznik") { }

	bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest) override
	{
		if (quest->GetQuestId() == QUEST_GERENZOS_ORDER)
			creature->AI()->SetGUID(player->GetGUID(), 0);

		return true;
	}

	struct npc_piznikAI : public ScriptedAI
	{
		npc_piznikAI(Creature* c) : ScriptedAI(c), summons(me) {}

		void SetGUID(ObjectGuid guid, int32 /*type*/) override
		{
			start = true;
			playerGUID = guid;
		}

		void Reset() override
		{
			step = 0;
			start = false;
			waitTimer = 1 * IN_MILLISECONDS;
			playerGUID = ObjectGuid::Empty;
			summons.DespawnAll();
		}

		void JustDied(Unit* /*killer*/) override
		{
			SetGroupQuestStatus(false);
			Reset();
		}

		void JustSummoned(Creature* summoned) override
		{
			summons.Summon(summoned);
		}

		void SetGroupQuestStatus(bool complete)
		{
			Player* player = ObjectAccessor::GetPlayer(*me, playerGUID);
			if (!player)
				return;

			if (Group* group = player->GetGroup())
			{
				for (GroupReference* groupRef = group->GetFirstMember(); groupRef != NULL; groupRef = groupRef->next())
					if (Player* member = groupRef->GetSource())
						if (member->GetQuestStatus(QUEST_GERENZOS_ORDER) == QUEST_STATUS_INCOMPLETE)
						{
							if (complete)
								member->CompleteQuest(QUEST_GERENZOS_ORDER);
							else
								member->FailQuest(QUEST_GERENZOS_ORDER);
						}
			}
			else
			{
				if (player->GetQuestStatus(QUEST_GERENZOS_ORDER) == QUEST_STATUS_INCOMPLETE)
				{
					if (complete)
						player->CompleteQuest(QUEST_GERENZOS_ORDER);
					else
						player->FailQuest(QUEST_GERENZOS_ORDER);
				}
			}
		}

		void MustResetCheck()
		{
			bool allDeadOrNoPlayer = true;

			std::list<Player*> players = me->GetNearestPlayersList(100.0f, true);
			for (std::list<Player*>::const_iterator itr = players.begin(); itr != players.end(); ++itr)
			{
				Player* player = *itr;
				if (player->GetQuestStatus(QUEST_GERENZOS_ORDER) != QUEST_STATUS_INCOMPLETE)
					return;

				float dist = me->GetDistance2d(player);
				if (dist <= 50.0f)
					allDeadOrNoPlayer = false;
				else
					player->FailQuest(QUEST_GERENZOS_ORDER);
			}

			if (allDeadOrNoPlayer)
				Reset();
		}

		void UpdateAI(uint32 diff) override
		{
			if (!start || !playerGUID)
				return;

			if (waitTimer <= diff)
			{
				switch (step)
				{
				case 0:
				case 1:
					for (uint8 i = 0; i < 3; ++i)
						me->SummonCreature(NPC_WINDSHEAR_DIGGER, PinzikSummonPositions[i], TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120 * IN_MILLISECONDS);
					waitTimer = step ? 20 * IN_MILLISECONDS : 25 * IN_MILLISECONDS;
					++step;
				case 2:
					summons.RemoveNotExisting();
					if (summons.empty())
					{
						SetGroupQuestStatus(true);
						Reset();
					}
					waitTimer = 2 * IN_MILLISECONDS;
				}
			}
			else
				waitTimer -= diff;
		}

	private:
		bool start;
		uint32 waitTimer;
		uint8 step;
		ObjectGuid playerGUID;
		SummonList summons;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_piznikAI(creature);
	}
};


/*######
## AddSC
######*/

void AddSC_stonetalon_mountains()
{
    new npc_braug_dimspirit();
    new npc_kaya_flathoof();
	new npc_piznik();
}
