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

/* Script Data Start
SDName: Dalaran
SDAuthor: WarHead, MaXiMiUS
SD%Complete: 99%
SDComment: For what is 63990+63991? Same function but don't work correct...
SDCategory: Dalaran
Script Data End */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "WorldSession.h"

/*******************************************************
 * npc_mageguard_dalaran
 *******************************************************/

enum Spells
{
    SPELL_TRESPASSER_A                     = 54028,
    SPELL_TRESPASSER_H                     = 54029,

    SPELL_SUNREAVER_DISGUISE_FEMALE        = 70973,
    SPELL_SUNREAVER_DISGUISE_MALE          = 70974,
    SPELL_SILVER_COVENANT_DISGUISE_FEMALE  = 70971,
    SPELL_SILVER_COVENANT_DISGUISE_MALE    = 70972,
};

enum NPCs // All outdoor guards are within 35.0f of these NPCs
{
    NPC_APPLEBOUGH_A                       = 29547,
    NPC_SWEETBERRY_H                       = 29715,
    NPC_SILVER_COVENANT_GUARDIAN_MAGE      = 29254,
    NPC_SUNREAVER_GUARDIAN_MAGE            = 29255,
};

class npc_mageguard_dalaran : public CreatureScript
{
public:
    npc_mageguard_dalaran() : CreatureScript("npc_mageguard_dalaran") { }

    struct npc_mageguard_dalaranAI : public ScriptedAI
    {
        npc_mageguard_dalaranAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_NORMAL, true);
            creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
        }

        void Reset() override { }

        void EnterCombat(Unit* /*who*/) override { }

        void AttackStart(Unit* /*who*/) override { }

        void MoveInLineOfSight(Unit* who) override
        {
            if (!who || !who->IsInWorld() || who->GetZoneId() != 4395)
                return;

            if (!me->IsWithinDist(who, 65.0f, false))
                return;

            Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();

            if (!player || player->IsGameMaster() || player->IsBeingTeleported() ||
                // If player has Disguise aura for quest A Meeting With The Magister or An Audience With The Arcanist, do not teleport it away but let it pass
                player->HasAura(SPELL_SUNREAVER_DISGUISE_FEMALE) || player->HasAura(SPELL_SUNREAVER_DISGUISE_MALE) ||
                player->HasAura(SPELL_SILVER_COVENANT_DISGUISE_FEMALE) || player->HasAura(SPELL_SILVER_COVENANT_DISGUISE_MALE))
                return;

            switch (me->GetEntry())
            {
                case NPC_SILVER_COVENANT_GUARDIAN_MAGE:
                    if (player->GetTeam() == HORDE)              // Horde unit found in Alliance area
                    {
                        if (GetClosestCreatureWithEntry(me, NPC_APPLEBOUGH_A, 32.0f))
                        {
                            if (me->isInBackInMap(who, 12.0f))   // In my line of sight, "outdoors", and behind me
                                DoCast(who, SPELL_TRESPASSER_A); // Teleport the Horde unit out
                        }
                        else                                      // In my line of sight, and "indoors"
                            DoCast(who, SPELL_TRESPASSER_A);     // Teleport the Horde unit out
                    }
                    break;
                case NPC_SUNREAVER_GUARDIAN_MAGE:
                    if (player->GetTeam() == ALLIANCE)           // Alliance unit found in Horde area
                    {
                        if (GetClosestCreatureWithEntry(me, NPC_SWEETBERRY_H, 32.0f))
                        {
                            if (me->isInBackInMap(who, 12.0f))   // In my line of sight, "outdoors", and behind me
                                DoCast(who, SPELL_TRESPASSER_H); // Teleport the Alliance unit out
                        }
                        else                                      // In my line of sight, and "indoors"
                            DoCast(who, SPELL_TRESPASSER_H);     // Teleport the Alliance unit out
                    }
                    break;
            }
            me->SetOrientation(me->GetHomePosition().GetOrientation());
            return;
        }

        void UpdateAI(uint32 /*diff*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mageguard_dalaranAI(creature);
    }
};

enum MinigobData
{
    ZONE_DALARAN            = 4395,

    SPELL_MANABONKED        = 61834,
    SPELL_TELEPORT_VISUAL   = 51347,
    SPELL_IMPROVED_BLINK    = 61995,

    EVENT_SELECT_TARGET     = 1,
    EVENT_BLINK             = 2,
    EVENT_DESPAWN_VISUAL    = 3,
    EVENT_DESPAWN           = 4,

    MAIL_MINIGOB_ENTRY      = 264,
    MAIL_DELIVER_DELAY_MIN  = 5*MINUTE,
    MAIL_DELIVER_DELAY_MAX  = 15*MINUTE
};


class npc_minigob_manabonk : public CreatureScript
{
    public:
        npc_minigob_manabonk() : CreatureScript("npc_minigob_manabonk") {}

        struct npc_minigob_manabonkAI : public ScriptedAI
        {
            npc_minigob_manabonkAI(Creature* creature) : ScriptedAI(creature)
            {
                me->setActive(true);
            }

            void Reset() override
            {
                me->SetVisible(false);
                events.ScheduleEvent(EVENT_SELECT_TARGET, IN_MILLISECONDS);
            }

            Player* SelectTargetInDalaran()
            {
                std::list<Player*> PlayerInDalaranList;
                PlayerInDalaranList.clear();

                Map::PlayerList const &players = me->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                    if (Player* player = itr->GetSource()->ToPlayer())
                        if (player->GetZoneId() == ZONE_DALARAN && !player->IsFlying() && !player->IsMounted() && !player->IsGameMaster())
                            PlayerInDalaranList.push_back(player);

                if (PlayerInDalaranList.empty())
                    return NULL;
                return Trinity::Containers::SelectRandomContainerElement(PlayerInDalaranList);
            }

            void SendMailToPlayer(Player* player)
            {
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                int16 deliverDelay = irand(MAIL_DELIVER_DELAY_MIN, MAIL_DELIVER_DELAY_MAX);
                MailDraft(MAIL_MINIGOB_ENTRY, true).SendMailTo(trans, MailReceiver(player), MailSender(MAIL_CREATURE, me->GetEntry()), MAIL_CHECK_MASK_NONE, deliverDelay);
                CharacterDatabase.CommitTransaction(trans);
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SELECT_TARGET:
                            me->SetVisible(true);
                            DoCast(me, SPELL_TELEPORT_VISUAL);
                            if (Player* player = SelectTargetInDalaran())
                            {
                                me->NearTeleportTo(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), 0.0f);
                                DoCast(player, SPELL_MANABONKED);
                                SendMailToPlayer(player);
                            }
                            events.ScheduleEvent(EVENT_BLINK, 3*IN_MILLISECONDS);
                            break;
                        case EVENT_BLINK:
                        {
                            DoCast(me, SPELL_IMPROVED_BLINK);
                            Position pos = me->GetRandomNearPosition(frand(15, 40));
                            me->GetMotionMaster()->MovePoint(0, pos.m_positionX, pos.m_positionY, pos.m_positionZ);
                            events.ScheduleEvent(EVENT_DESPAWN, 3 * IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_DESPAWN_VISUAL, 2.5*IN_MILLISECONDS);
                            break;
                        }
                        case EVENT_DESPAWN_VISUAL:
                            DoCast(me, SPELL_TELEPORT_VISUAL);
                            break;
                        case EVENT_DESPAWN:
                            me->DespawnOrUnsummon();
                            break;
                        default:
                            break;
                    }
                }
            }

        private:
            EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_minigob_manabonkAI(creature);
    }
};

// npc_archmage_landalock

enum ArchmagesEVENTS
{
	EVENT_CHECK_QUEST = 1,
};

enum ArchmageLandalockData
{
	/* DAILY HEROIC DUNGEON QUESTS */

	QUEST_LEY_EREGOS		= 13247,
	QUEST_KING_YMIRON		= 13248,
	QUEST_INGVAR			= 13245,
	QUEST_PROPHET_THARONJA	= 13249,
	QUEST_MALGANIS			= 13251,
	QUEST_LOKEN				= 13253,
	QUEST_HERALD_VOLAZJ		= 13255,
	QUEST_KERISTRASZA		= 13246,
	QUEST_GALDARAH			= 13250,
	QUEST_SJONNIR			= 13252,
	QUEST_ANUBARAK			= 13254,
	QUEST_CYANIGOSA			= 13256,


	/* IMAGES */

	IMAGE_LEY_EREGOS				= 31619,
	IMAGE_KING_YMIRON				= 31620,
	IMAGE_INGVAR					= 31584,
	IMAGE_PROPHET_THARONJA			= 31621,
	IMAGE_MALGANIS					= 31623,
	IMAGE_LOKEN						= 31625,
	IMAGE_HERALD_VOLAZJ				= 31627,
	IMAGE_KERISTRASZA				= 31618,
	IMAGE_GALDARAH					= 31622,
	IMAGE_SJONNIR					= 31624,
	IMAGE_ANUBARAK					= 31626,
	IMAGE_CYANIGOSA					= 31629,
};

Position const ImagePosition = { 5702.74f, 583.50f, 655.64f, 411.30f };

typedef std::map<uint32, uint32> QuestImageTemplate;

class npc_archmage_landalock : public CreatureScript
{
public:
	npc_archmage_landalock() : CreatureScript("npc_archmage_landalock") {}

	struct npc_archmage_landalockAI : public ScriptedAI
	{
		npc_archmage_landalockAI(Creature* creature) : ScriptedAI(creature)
		{
			imageSpawned = false;
		}

		void Initialize()
		{
			m_questImageList[QUEST_LEY_EREGOS]			= IMAGE_LEY_EREGOS;
			m_questImageList[QUEST_KING_YMIRON]			= IMAGE_KING_YMIRON;
			m_questImageList[QUEST_INGVAR]				= IMAGE_INGVAR;
			m_questImageList[QUEST_PROPHET_THARONJA]	= IMAGE_PROPHET_THARONJA;
			m_questImageList[QUEST_MALGANIS]			= IMAGE_MALGANIS;
			m_questImageList[QUEST_LOKEN]				= IMAGE_LOKEN;
			m_questImageList[QUEST_HERALD_VOLAZJ]		= IMAGE_HERALD_VOLAZJ;
			m_questImageList[QUEST_SJONNIR]				= IMAGE_SJONNIR;
			m_questImageList[QUEST_KERISTRASZA]			= IMAGE_KERISTRASZA;
			m_questImageList[QUEST_GALDARAH]			= IMAGE_GALDARAH;
			m_questImageList[QUEST_ANUBARAK]			= IMAGE_ANUBARAK;
			m_questImageList[QUEST_CYANIGOSA]			= IMAGE_CYANIGOSA;

		}

		void Reset() override
		{
			Initialize();
			imageSpawned = false;
			events.ScheduleEvent(EVENT_CHECK_QUEST, 15*IN_MILLISECONDS);
		}

		void SpawnImage(uint32 entry)
		{

			if (!entry)
				return;

			Creature* image = NULL;

			switch (entry)
			{
			case IMAGE_LEY_EREGOS:
			case IMAGE_KERISTRASZA:
				if (image = me->SummonCreature(entry, ImagePosition.GetPositionX(), ImagePosition.GetPositionY(), 657.0f))
					image->SetDisableGravity(true);
				break;
			case IMAGE_LOKEN:
			case IMAGE_MALGANIS:
			case IMAGE_HERALD_VOLAZJ:
			case IMAGE_SJONNIR:
			case IMAGE_ANUBARAK:
				if (image = me->SummonCreature(entry, ImagePosition.GetPositionX(), ImagePosition.GetPositionY(), 654.0f))
					image->SetDisableGravity(true);
				break;
			case IMAGE_GALDARAH:
				if (image = me->SummonCreature(entry, ImagePosition.GetPositionX(), ImagePosition.GetPositionY(), 657.0f))
					image->SetDisableGravity(true);
				break;
			default:
				image = me->SummonCreature(entry, ImagePosition);
				break;
			}

			if (image)
			{
				image->SetFacingTo(4.0f);
				imageEntry = entry;
				imageSpawned = true;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_QUEST:

					for (QuestImageTemplate::const_iterator itr = m_questImageList.begin(); itr != m_questImageList.end(); itr++)
					{
						if (me->hasQuest(itr->first))
						{
							if (imageSpawned && imageEntry)
							if (Creature* image = me->FindNearestCreature(imageEntry, 40.f))
								image->DespawnOrUnsummon();
							// If there is no image spawned or if we just despawned one, then we should summon the new one.

							SpawnImage(itr->second);

						}
					}

					events.ScheduleEvent(EVENT_CHECK_QUEST, 7200 * IN_MILLISECONDS); //
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		bool imageSpawned;
		uint32 imageEntry;
		QuestImageTemplate m_questImageList;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_archmage_landalockAI(creature);
	}
};

// Archmage Timear

enum ArchmageTimearData
{
	/* DAILY NORMAL DUNGEON QUESTS */

	QUEST_CENTRIFUGE	= 13240,
	QUEST_INFINITE		= 13243,
	QUEST_YMIRJAR		= 13241,
	QUEST_TITANIUM		= 13244,

	/* IMAGES */

	IMAGE_CENTRIFUGE_CONSTRUCTS = 31631,
	IMAGE_INFINITE_AGENT		= 31633,
	IMAGE_YMIRJAR				= 31632,
	IMAGE_TITANIUM				= 31634

};

Position const ImagePositionTimears = { 5772.00f, 530.00f, 654.64f, 411.30f };

class npc_archmage_timear : public CreatureScript
{
public:
	npc_archmage_timear() : CreatureScript("npc_archmage_timear") {}

	struct npc_archmage_timearAI : public ScriptedAI
	{
		npc_archmage_timearAI(Creature* creature) : ScriptedAI(creature)
		{
			imageSpawned = false;
		}

		void Initialize()
		{
			m_questImageList[QUEST_CENTRIFUGE] = IMAGE_CENTRIFUGE_CONSTRUCTS;
			m_questImageList[QUEST_INFINITE] = IMAGE_INFINITE_AGENT;
			m_questImageList[QUEST_YMIRJAR] = IMAGE_YMIRJAR;
			m_questImageList[QUEST_TITANIUM] = IMAGE_TITANIUM;
		}

		void Reset() override
		{
			Initialize();
			imageSpawned = false;
			events.ScheduleEvent(EVENT_CHECK_QUEST, 15 * IN_MILLISECONDS);
		}

		void SpawnImage(uint32 entry)
		{

			if (!entry)
				return;

			if (Creature* image = me->SummonCreature(entry, ImagePositionTimears))
			{
				image->SetFacingTo(4.0f);
				imageEntry = entry;
				imageSpawned = true;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_QUEST:

					for (QuestImageTemplate::const_iterator itr = m_questImageList.begin(); itr != m_questImageList.end(); itr++)
					{
						if (me->hasQuest(itr->first))
						{
							if (imageSpawned && imageEntry)
								if (Creature* image = me->FindNearestCreature(imageEntry, 40.f))
									image->DespawnOrUnsummon();
							// If there is no image spawned or if we just despawned one, then we should summon the new one.

							SpawnImage(itr->second);

						}
					}

					events.ScheduleEvent(EVENT_CHECK_QUEST, 7200 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		bool imageSpawned;
		uint32 imageEntry;
		QuestImageTemplate m_questImageList;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_archmage_timearAI(creature);
	}
};

/*######
## npc_dalaran_visitor
######*/

enum DalaranVisitorMisc
{
    // Creatures
    NPC_DALARAN_VISITOR_HORDE_1 = 32601,
    NPC_DALARAN_VISITOR_HORDE_2 = 32602,
    NPC_DALARAN_VISITOR_HORDE_3 = 32600,

    NPC_DALARAN_VISITOR_ALLIANCE_1 = 32596,
    NPC_DALARAN_VISITOR_ALLIANCE_2 = 32598,
    NPC_DALARAN_VISITOR_ALLIANCE_3 = 32597,
};

const Position VisitorWays[5] =
{
    { 5814.348f, 406.094f, 665.788f }, // right gate way
    { 5800.514f, 408.191f, 665.788f }, // left gate way
    { 5814.882f, 438.045f, 658.764f }, // Landing place 1
    { 5825.698f, 452.426f, 658.767f }, // landing place 2
    { 5804.465f, 446.407f, 658.761f }, // landing place 3
};

const uint32 FlyingMountHorde[] =
{
    17699, 17700, 17701, 17719, 17720, 17721, 17722, 17890, 20344, 21152, 21155, 21158, 21157, 21156, 21520, 21521, 21522, 21523, 21524, 21525, 22473, 22720, 22620, 23647, 24725, 27507, 27785, 25832, 25835, 27796, 25833, 25831, 28044, 28040, 28041, 28045, 28042, 28043, 25836, 27914, 28053, 28402, 28060, 28890, 22471, 28953, 28954, 25511, 25593, 29696, 29794, 30346, 31154, 31156, 28063
};

const uint32 FlyingMountAlliance[] =
{
    17696, 17717, 17703, 17718, 17759, 17890, 20344, 21152, 21155, 21158, 21157, 21156, 21520, 21521, 21522, 21523, 21524, 21525, 22473, 22720, 22620, 23647, 24725, 27507, 27525, 27785, 25832, 25835, 27796, 25833, 25831, 28044, 28040, 28041, 28045, 28042, 28043, 25836, 27913, 28053, 28060, 28890, 22471, 28953, 28954, 25511, 25593, 22474, 29794, 30346, 31154, 31156, 28063
};

class npc_dalaran_visitor : public CreatureScript
{
public:
    npc_dalaran_visitor() : CreatureScript("npc_dalaran_visitor") { }

    struct npc_dalaran_visitorAI : public ScriptedAI
    {
        npc_dalaran_visitorAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            wp = 0;
            way = 0;
            phaseTimer = 2 * IN_MILLISECONDS;
            me->AddUnitState(UNIT_STATE_IGNORE_PATHFINDING);
            me->SetCanFly(true);
            me->SetSpeed(MOVE_FLIGHT, 2.5f);
            me->SetCorpseDelay(1);
            me->SetRespawnDelay(0);
            me->SetVisible(false);
            if (me->GetEntry() == NPC_DALARAN_VISITOR_HORDE_1 || me->GetEntry() == NPC_DALARAN_VISITOR_HORDE_2 || me->GetEntry() == NPC_DALARAN_VISITOR_HORDE_3)
            {
                int Random = rand() % (sizeof(FlyingMountHorde) / sizeof(uint32));
                me->Mount(FlyingMountHorde[Random]);
            }
            if (me->GetEntry() == NPC_DALARAN_VISITOR_ALLIANCE_1 || me->GetEntry() == NPC_DALARAN_VISITOR_ALLIANCE_2 || me->GetEntry() == NPC_DALARAN_VISITOR_ALLIANCE_3)
            {
                int Random = rand() % (sizeof(FlyingMountAlliance) / sizeof(uint32));
                me->Mount(FlyingMountAlliance[Random]);
            }
            me->SetVisible(true);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!me->isMoving())
            {
                switch (wp)
                {
                case 0:
                    way = urand(0, 1);
                    if (way)
                        me->GetMotionMaster()->MovePoint(0, VisitorWays[0]);
                    else me->GetMotionMaster()->MovePoint(0, VisitorWays[1]);
                    wp++;
                    break;
                case 1:
                    way = urand(0, 3);
                    if (way == 0)
                        me->GetMotionMaster()->MovePoint(0, VisitorWays[2]);
                    else if (way == 1)
                        me->GetMotionMaster()->MovePoint(0, VisitorWays[3]);
                    else me->GetMotionMaster()->MovePoint(0, VisitorWays[4]);
                    wp++;
                    break;
                case 2:
                    me->Dismount();
                    me->SetCanFly(false);
                    me->SetWalk(false);
                    me->SetSpeed(MOVE_RUN, 1.0f);
                    me->SetDisableGravity(false);
                    me->SetHover(false);
                    me->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_HOVER);
                    me->SendMovementFlagUpdate();
                    me->SetInhabitType(INHABIT_GROUND);
                    me->GetMotionMaster()->MovePath(me->GetEntry() * 10, false);
                    wp++;
                    break;
                default:
                    me->DespawnOrUnsummon();
                    break;
                }
            }
        }

    private:
        uint8 wp;
        uint32 phaseTimer;
        Position pos;
        uint8 way;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_dalaran_visitorAI(creature);
    }
};


void AddSC_dalaran()
{
    new npc_mageguard_dalaran();
    new npc_minigob_manabonk();

	new npc_archmage_landalock();
	new npc_archmage_timear();
    new npc_dalaran_visitor();
}
