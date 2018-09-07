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
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "SpellHistory.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "Vehicle.h"
#include "CombatAI.h"
#include "Player.h"
#include "WorldSession.h"

/////////////////////
///npc_injured_goblin
/////////////////////

enum InjuredGoblinMiner
{
    QUEST_BITTER_DEPARTURE     = 12832,
    SAY_QUEST_ACCEPT           = 0,
    SAY_END_WP_REACHED         = 1,
    GOSSIP_ID                  = 9859,
    GOSSIP_OPTION_ID           = 0
};

class npc_injured_goblin : public CreatureScript
{
public:
    npc_injured_goblin() : CreatureScript("npc_injured_goblin") { }

    struct npc_injured_goblinAI : public npc_escortAI
    {
        npc_injured_goblinAI(Creature* creature) : npc_escortAI(creature) { }

        void WaypointReached(uint32 waypointId) override
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 26:
                    Talk(SAY_END_WP_REACHED, player);
                    break;
                case 27:
                    player->GroupEventHappens(QUEST_BITTER_DEPARTURE, me);
                    break;
            }
        }

        void EnterCombat(Unit* /*who*/) override { }

        void Reset() override { }

        void JustDied(Unit* /*killer*/) override
        {
            Player* player = GetPlayerForEscort();
            if (HasEscortState(STATE_ESCORT_ESCORTING) && player)
                player->FailQuest(QUEST_BITTER_DEPARTURE);
        }

       void UpdateAI(uint32 uiDiff) override
        {
            npc_escortAI::UpdateAI(uiDiff);
            if (!UpdateVictim())
                return;
            DoMeleeAttackIfReady();
        }

       void sGossipSelect(Player* player, uint32 menuId, uint32 gossipListId) override
        {
            if (menuId == GOSSIP_ID && gossipListId == GOSSIP_OPTION_ID)
            {
                player->CLOSE_GOSSIP_MENU();
                me->setFaction(113);
                Start(true, true, player->GetGUID());
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_injured_goblinAI(creature);
    }

    bool OnQuestAccept(Player* /*player*/, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_BITTER_DEPARTURE)
            creature->AI()->Talk(SAY_QUEST_ACCEPT);

        return false;
    }
};

/*######
## npc_roxi_ramrocket
######*/

enum RoxiRamrocket
{
    SPELL_MECHANO_HOG               = 60866,
    SPELL_MEKGINEERS_CHOPPER        = 60867
};

class npc_roxi_ramrocket : public CreatureScript
{
public:
    npc_roxi_ramrocket() : CreatureScript("npc_roxi_ramrocket") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        //Quest Menu
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        //Trainer Menu
        if ( creature->IsTrainer() )
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, GOSSIP_TEXT_TRAIN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRAIN);

        //Vendor Menu
        if ( creature->IsVendor() )
            if (player->HasSpell(SPELL_MECHANO_HOG) || player->HasSpell(SPELL_MEKGINEERS_CHOPPER))
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
        case GOSSIP_ACTION_TRAIN:
            player->GetSession()->SendTrainerList(creature->GetGUID());
            break;
        case GOSSIP_ACTION_TRADE:
            player->GetSession()->SendListInventory(creature->GetGUID());
            break;
        }
        return true;
    }
};

/*######
## npc_brunnhildar_prisoner
######*/

enum BrunnhildarPrisoner
{
    SPELL_ICE_PRISON           = 54894,
    SPELL_ICE_LANCE            = 55046,
    SPELL_FREE_PRISONER        = 55048,
    SPELL_RIDE_DRAKE           = 55074,
    SPELL_SHARD_IMPACT         = 55047
};

class npc_brunnhildar_prisoner : public CreatureScript
{
public:
    npc_brunnhildar_prisoner() : CreatureScript("npc_brunnhildar_prisoner") { }

    struct npc_brunnhildar_prisonerAI : public ScriptedAI
    {
        npc_brunnhildar_prisonerAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            freed = false;
        }

        bool freed;

        void Reset() override
        {
            Initialize();
            me->CastSpell(me, SPELL_ICE_PRISON, true);
        }

        void JustRespawned() override
        {
            Reset();
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (!freed)
                return;

            if (!me->GetVehicle())
                me->DespawnOrUnsummon();
        }

        void SpellHit(Unit* caster, const SpellInfo* spell) override
        {
            if (spell->Id != SPELL_ICE_LANCE)
                return;

            if (caster->GetVehicleKit()->GetAvailableSeatCount() != 0)
            {
                me->CastSpell(me, SPELL_FREE_PRISONER, true);
                me->CastSpell(caster, SPELL_RIDE_DRAKE, true);
                me->CastSpell(me, SPELL_SHARD_IMPACT, true);
                freed = true;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_brunnhildar_prisonerAI(creature);
    }
};

/*######
## npc_freed_protodrake
######*/

enum FreedProtoDrake
{
    NPC_DRAKE                           = 29709,

    AREA_VALLEY_OF_ANCIENT_WINTERS      = 4437,

    TEXT_EMOTE                          = 0,

    SPELL_KILL_CREDIT_PRISONER          = 55144,
    SPELL_SUMMON_LIBERATED              = 55073,
    SPELL_KILL_CREDIT_DRAKE             = 55143,

    EVENT_CHECK_AREA                    = 1,
    EVENT_REACHED_HOME                  = 2,
};

class npc_freed_protodrake : public CreatureScript
{
public:
    npc_freed_protodrake() : CreatureScript("npc_freed_protodrake") { }

    struct npc_freed_protodrakeAI : public VehicleAI
    {
        npc_freed_protodrakeAI(Creature* creature) : VehicleAI(creature) { }

        EventMap events;

        void Reset() override
        {
            events.ScheduleEvent(EVENT_CHECK_AREA, 5000);
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != WAYPOINT_MOTION_TYPE)
                return;

            if (id == 15)
            // drake reached village
            events.ScheduleEvent(EVENT_REACHED_HOME, 2000);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            switch (events.ExecuteEvent())
            {
                case EVENT_CHECK_AREA:
                    if (me->GetAreaId() == AREA_VALLEY_OF_ANCIENT_WINTERS)
                    {
                        if (Vehicle* vehicle = me->GetVehicleKit())
                            if (Unit* passenger = vehicle->GetPassenger(0))
                            {
                                Talk(TEXT_EMOTE, passenger);
                                me->GetMotionMaster()->MovePath(NPC_DRAKE, false);
                            }
                    }
                    else
                        events.ScheduleEvent(EVENT_CHECK_AREA, 5000);
                    break;
                case EVENT_REACHED_HOME:
                    if (Vehicle* vehicle = me->GetVehicleKit())
                        if (Unit* player = vehicle->GetPassenger(0))
                            if (player->GetTypeId() == TYPEID_PLAYER)
                            {
                                // for each prisoner on drake, give credit
                                for (uint8 i = 1; i < 4; ++i)
                                    if (Unit* prisoner = me->GetVehicleKit()->GetPassenger(i))
                                    {
                                        if (prisoner->GetTypeId() != TYPEID_UNIT)
                                            return;
                                        prisoner->CastSpell(player, SPELL_KILL_CREDIT_PRISONER, true);
                                        prisoner->CastSpell(prisoner, SPELL_SUMMON_LIBERATED, true);
                                        prisoner->ExitVehicle();
                                    }
                                me->CastSpell(me, SPELL_KILL_CREDIT_DRAKE, true);
                                player->ExitVehicle();
                            }
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_freed_protodrakeAI(creature);
    }
};

class npc_icefang : public CreatureScript
{
public:
    npc_icefang() : CreatureScript("npc_icefang") { }

    struct npc_icefangAI : public npc_escortAI
    {
        npc_icefangAI(Creature* creature) : npc_escortAI(creature) { }

        void AttackStart(Unit* /*who*/) override { }
        void EnterCombat(Unit* /*who*/) override { }
        void EnterEvadeMode() override { }

        void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply) override
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                if (apply)
                    Start(false, true, who->GetGUID());
            }
        }

        void WaypointReached(uint32 /*waypointId*/) override { }
        void JustDied(Unit* /*killer*/) override { }
        void OnCharmed(bool /*apply*/) override { }

        void UpdateAI(uint32 diff) override
        {
            npc_escortAI::UpdateAI(diff);

            if (!UpdateVictim())
                return;
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_icefangAI(creature);
    }
};


/*#####
# npc_brann_bronzebeard for Quest 13285 "Forging the Keystone"
#####*/

enum BrannBronzebeard
{
    NPC_BRANN_BRONZEBEARD = 31810,
    NPC_A_DISTANT_VOICE   = 31814,
    OBJECT_TOL_SIGNAL_1   = 193590,
    OBJECT_TOL_SIGNAL_2   = 193591,
    OBJECT_TOL_SIGNAL_3   = 193592,
    OBJECT_TOL_SIGNAL_4   = 193593,
    OBJECT_TOL_SIGNAL_5   = 193594,
    SPELL_RESURRECTION    = 58854,
    SAY_BRANN_1           = 0,
    SAY_BRANN_2           = 1,
    SAY_BRANN_3           = 2,
    SAY_VOICE_1           = 0,
    SAY_VOICE_2           = 1,
    SAY_VOICE_3           = 2,
    SAY_VOICE_4           = 3,
    SAY_VOICE_5           = 4,

    EVENT_SCRIPT_1        = 3,
    EVENT_SCRIPT_2        = 4,
    EVENT_SCRIPT_3        = 5,
    EVENT_SCRIPT_4        = 6,
    EVENT_SCRIPT_5        = 7,
    EVENT_SCRIPT_6        = 8,
    EVENT_SCRIPT_7        = 9,
    EVENT_SCRIPT_8        = 10,
    EVENT_SCRIPT_9        = 11,
    EVENT_SCRIPT_10       = 12,
    EVENT_SCRIPT_11       = 13,
    EVENT_SCRIPT_12       = 14,
    EVENT_SCRIPT_13       = 15
};

class npc_brann_bronzebeard_keystone : public CreatureScript
{
public:
    npc_brann_bronzebeard_keystone() : CreatureScript("npc_brann_bronzebeard_keystone") { }

    struct npc_brann_bronzebeard_keystoneAI : public ScriptedAI
    {
        npc_brann_bronzebeard_keystoneAI(Creature* creature) : ScriptedAI(creature)
        {
            objectCounter = 0;
        }

        void Reset() override
        {
            for (ObjectGuid& guid : objectGUID)
                guid.Clear();

            playerGUID.Clear();
            voiceGUID.Clear();
            objectCounter = 0;
        }

        void sGossipSelect(Player* player, uint32 /*menuId*/, uint32 /*gossipListId*/) override
        {
            player->CLOSE_GOSSIP_MENU();
            playerGUID = player->GetGUID();
            events.ScheduleEvent(EVENT_SCRIPT_1, 100);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SCRIPT_1:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            Talk(SAY_BRANN_1, player);
                        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
                        if (Creature* voice = me->SummonCreature(NPC_A_DISTANT_VOICE, 7863.43f, -1396.585f, 1538.076f, 2.949606f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 49000))
                            voiceGUID = voice->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_2, 4000);
                        break;
                    case EVENT_SCRIPT_2:
                        me->SetWalk(true);
                        me->GetMotionMaster()->MovePoint(0, 7861.488f, -1396.376f, 1534.059f, false);
                        events.ScheduleEvent(EVENT_SCRIPT_3, 6000);
                        break;
                    case EVENT_SCRIPT_3:
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_WORK_MINING);
                        events.ScheduleEvent(EVENT_SCRIPT_4, 6000);
                        break;
                    case EVENT_SCRIPT_4:
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_NONE);
                        if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                        {
                            voice->CastSpell(voice, SPELL_RESURRECTION);
                            if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                                voice->AI()->Talk(SAY_VOICE_1, player);
                        }
                        if (GameObject* go = me->SummonGameObject(OBJECT_TOL_SIGNAL_1, 7860.273f, -1383.622f, 1538.302f, -1.658062f, 0, 0,  -0.737277f, 0.6755905f, 0))
                            objectGUID[objectCounter++] = go->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_5, 6000);
                        break;
                    case EVENT_SCRIPT_5:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                                voice->AI()->Talk(SAY_VOICE_2, player);
                        if (GameObject* go = me->SummonGameObject(OBJECT_TOL_SIGNAL_2, 7875.67f, -1387.266f, 1538.323f, -2.373644f, 0, 0,  -0.9271832f, 0.3746083f, 0))
                            objectGUID[objectCounter++] = go->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_6, 6000);
                        break;
                    case EVENT_SCRIPT_6:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                                voice->AI()->Talk(SAY_VOICE_3, player);
                        if (GameObject* go = me->SummonGameObject(OBJECT_TOL_SIGNAL_3, 7879.212f, -1401.175f, 1538.279f, 2.967041f, 0, 0,  0.9961939f, 0.08716504f, 0))
                            objectGUID[objectCounter++] = go->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_7, 6000);
                        break;
                    case EVENT_SCRIPT_7:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                                voice->AI()->Talk(SAY_VOICE_4, player);
                        if (GameObject* go = me->SummonGameObject(OBJECT_TOL_SIGNAL_4, 7868.944f, -1411.18f, 1538.213f, 2.111848f, 0, 0,  0.8703556f, 0.4924237f, 0))
                            objectGUID[objectCounter++] = go->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_8, 6000);
                        break;
                    case EVENT_SCRIPT_8:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                                voice->AI()->Talk(SAY_VOICE_5, player);
                        if (GameObject* go = me->SummonGameObject(OBJECT_TOL_SIGNAL_5, 7855.11f, -1406.839f, 1538.42f, 1.151916f, 0, 0,  0.5446386f, 0.8386708f, 0))
                            objectGUID[objectCounter] = go->GetGUID();
                        events.ScheduleEvent(EVENT_SCRIPT_9, 6000);
                        break;
                    case EVENT_SCRIPT_9:
                        if (Creature* voice = ObjectAccessor::GetCreature(*me, voiceGUID))
                            voice->CastSpell(voice, SPELL_RESURRECTION);
                        events.ScheduleEvent(EVENT_SCRIPT_10, 6000);
                        break;
                    case EVENT_SCRIPT_10:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                        {
                            Talk(SAY_BRANN_2, player);
                            player->KilledMonsterCredit(me->GetEntry());
                        }
                        events.ScheduleEvent(EVENT_SCRIPT_11, 6000);
                        break;
                    case EVENT_SCRIPT_11:
                        me->SetFacingTo(2.932153f);
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            Talk(SAY_BRANN_3, player);

                        for (uint8 i = 0; i < 5; ++i)
                            if (GameObject* go = ObjectAccessor::GetGameObject(*me, objectGUID[i]))
                                go->Delete();

                        events.ScheduleEvent(EVENT_SCRIPT_12, 6000);
                        break;
                    case EVENT_SCRIPT_12:
                        me->GetMotionMaster()->Clear();
                        me->SetWalk(false);
                        me->GetMotionMaster()->MovePoint(0, 7799.908f, -1413.561f, 1534.829f, false);
                        events.ScheduleEvent(EVENT_SCRIPT_13, 10000);
                        break;
                    case EVENT_SCRIPT_13:
                        me->DisappearAndDie();
                        break;
                }
            }
        }

    private:
        EventMap events;
        ObjectGuid playerGUID;
        ObjectGuid objectGUID[5];
        ObjectGuid voiceGUID;
        uint8 objectCounter;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_brann_bronzebeard_keystoneAI(creature);
    }
};

/*#####
# npc_wild_wyrm for Quest 13003 "Thrusting Hodir's Spear"
#####*/

enum WildWyrm
{
	NPC_WILD_WYRM = 30275,
	SPELL_SPEAR_OF_HODIR = 56671,
	SPELL_FIGHT_WYRM = 56673,
	SPELL_GRAB_ON = 60533,
	SPELL_DODGE_CLAWS = 56704,
	SPELL_THRUST_SPEAR = 56690,
	SPELL_MIGHTY_SPEAR_THRUST = 60586,
	SPELL_PRY_JAWS_OPEN = 56706,
	SPELL_FATAL_STRIKE = 60881,
	SPELL_JAWS_OF_DEATH = 56692,
	SPELL_GRIP = 56689,
	SPELL_CLAW_SWIPE = 60689,
	SPELL_CLAW_SWIPE_DAMAGE = 60776,
	SPELL_WYRM_KILL_CREDIT = 56703,
	SAY_WILD_WYRM_1 = 0,
	SAY_WILD_WYRM_2 = 1,
	SAY_WILD_WYRM_3 = 2,
	SAY_WILD_WYRM_4 = 3,
	SAY_WILD_WYRM_5 = 4,
};

class npc_wild_wyrm : public CreatureScript
{
public:
	npc_wild_wyrm() : CreatureScript("npc_wild_wyrm") { }

	struct npc_wild_wyrmAI : public VehicleAI
	{
		npc_wild_wyrmAI(Creature* creature) : VehicleAI(creature) { }

		void Reset() override
		{
			me->m_spells[0] = SPELL_GRAB_ON;
			me->m_spells[1] = SPELL_DODGE_CLAWS;
			me->m_spells[2] = SPELL_THRUST_SPEAR;
			me->m_spells[3] = SPELL_MIGHTY_SPEAR_THRUST;

			bIsPhase2 = false;
			bCanReset = false;
			PlayerGUID = 0;

			me->RemoveAllAuras();

			if (me->HasFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD))
			{
				me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
				me->Kill(me);
			}
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (Vehicle* vehicle = me->GetVehicleKit())
				if (spell->Id == SPELL_SPEAR_OF_HODIR && !vehicle->GetPassenger(0) && !PlayerGUID)
				{
				me->GetMotionMaster()->MoveFollow(caster, 3.0f, 0.0f);
				PlayerGUID = caster->GetGUID();
				}

		}

		void MoveInLineOfSight(Unit* who) override
		{
			if (who && who->GetDistance2d(me) < 3.5f)
				if (who->GetGUID() == PlayerGUID)
				{
				who->CastSpell(me, SPELL_FIGHT_WYRM, false);
				me->CastCustomSpell(SPELL_GRIP, SPELLVALUE_AURA_STACK, 50, me, false);
				DoCast(SPELL_CLAW_SWIPE);

				PlayerGUID = 0;
				bCanReset = true;

				me->GetMotionMaster()->Clear();
				}
		}

		void DamageTaken(Unit* /*doneBy*/, uint32& damage) override
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->SetHealth(1);
			}
		}

		void UpdateAI(uint32 /*diff*/) override
		{
			if (Vehicle* vehicle = me->GetVehicleKit())
			{
				if (!vehicle->GetPassenger(0) && bCanReset)
					Reset();

				if (vehicle->GetPassenger(0) && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != WAYPOINT_MOTION_TYPE)
				{
					me->GetMotionMaster()->MoveIdle();
					me->SetCanFly(true);
					me->GetMotionMaster()->MovePath(NPC_WILD_WYRM, true);
				}
			}

			if (!bIsPhase2 && !me->HasAura(SPELL_GRIP))
			{
				if (Vehicle* vehicle = me->GetVehicleKit())
					if (Unit* player = vehicle->GetPassenger(0))
						player->RemoveAura(SPELL_FIGHT_WYRM);

				me->RemoveAura(SPELL_FIGHT_WYRM);
			}
			else if (!bIsPhase2 && me->HealthBelowPct(25))
			{
				me->RemoveAura(SPELL_GRIP);
				me->RemoveAura(SPELL_CLAW_SWIPE);
				DoCast(SPELL_JAWS_OF_DEATH);

				me->m_spells[0] = SPELL_PRY_JAWS_OPEN;
				me->m_spells[1] = 0;
				me->m_spells[2] = SPELL_FATAL_STRIKE;
				me->m_spells[3] = 0;

				if (Vehicle* vehicle = me->GetVehicleKit())
					if (Unit* player = vehicle->GetPassenger(0))
					{
					player->ToPlayer()->VehicleSpellInitialize();
					me->AI()->Talk(SAY_WILD_WYRM_3, player);
					}

				bIsPhase2 = true;
			}
			else if (bIsPhase2 && !me->HasFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD) && me->GetHealth() == 1)
			{
				me->m_spells[0] = 0;
				me->m_spells[2] = 0;

				if (Vehicle* vehicle = me->GetVehicleKit())
					if (Unit* player = vehicle->GetPassenger(0))
						player->ToPlayer()->VehicleSpellInitialize();

				DoCast(SPELL_WYRM_KILL_CREDIT);

				me->RemoveAura(SPELL_JAWS_OF_DEATH);
				me->RemoveAura(SPELL_PRY_JAWS_OPEN);
				me->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
				me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);

				float floorZ = me->GetMap()->GetHeight(me->GetPhaseMask(), me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
				me->GetMotionMaster()->MoveCharge(me->GetPositionX(), me->GetPositionY(), floorZ, me->GetSpeed(MOVE_RUN), 0);
			}
			else if (bIsPhase2 && me->HasFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD) && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE)
			{
				me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
				me->Kill(me);
			}
		}

	private:
		bool bIsPhase2;
		bool bCanReset;
		uint64 PlayerGUID;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_wild_wyrmAI(creature);
	}
};

/*#####
# Quest 13010 Krolmir, Hammer of Storms
#####*/

enum JokkumScriptcast
{
    NPC_KINGJOKKUM                   = 30331,
    NPC_THORIM                       = 30390,
    PATH_JOKKUM                      = 2072200,
    PATH_JOKKUM_END                  = 2072201,
    SAY_HOLD_ON                      = 0,
    SAY_JOKKUM_1                     = 1,
    SAY_JOKKUM_2                     = 2,
    SAY_JOKKUM_3                     = 3,
    SAY_JOKKUM_4                     = 4,
    SAY_JOKKUM_5                     = 5,
    SAY_JOKKUM_6                     = 6,
    SAY_JOKKUM_7                     = 7,
    SAY_JOKKUM_8                     = 8,
    SAY_THORIM_1                     = 0,
    SAY_THORIM_2                     = 1,
    SAY_THORIM_3                     = 2,
    SAY_THORIM_4                     = 3,
    SPELL_JOKKUM_SUMMON              = 56541,
    SPELL_JOKKUM_KILL_CREDIT         = 56545,
    SPELL_EJECT_ALL_PASSENGERS       = 50630,
    SPELL_PLAYER_CAST_VERANUS_SUMMON = 56650,
    SPELL_SUMMON_VERANUS_AND_THORIM  = 56649,
    EVENT_KROLMIR_1                  = 16,
    EVENT_KROLMIR_2                  = 17,
    EVENT_KROLMIR_3                  = 18,
    EVENT_KROLMIR_4                  = 19,
    EVENT_KROLMIR_5                  = 20,
    EVENT_KROLMIR_6                  = 21,
    EVENT_KROLMIR_7                  = 22,
    EVENT_KROLMIR_8                  = 23,
    EVENT_KROLMIR_9                  = 24,
};

class spell_jokkum_scriptcast : public SpellScriptLoader
{
    public: spell_jokkum_scriptcast() : SpellScriptLoader("spell_jokkum_scriptcast") { }

        class spell_jokkum_scriptcast_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_jokkum_scriptcast_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_JOKKUM_SUMMON))
                    return false;
                return true;
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                    target->CastSpell(target, SPELL_JOKKUM_SUMMON, true);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_jokkum_scriptcast_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_jokkum_scriptcast_AuraScript();
        }
};

class spell_veranus_summon : public SpellScriptLoader
{
    public: spell_veranus_summon() : SpellScriptLoader("spell_veranus_summon") { }

        class spell_veranus_summon_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_veranus_summon_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_VERANUS_AND_THORIM))
                    return false;
                return true;
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                    target->CastSpell(target, SPELL_SUMMON_VERANUS_AND_THORIM, true);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_veranus_summon_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_veranus_summon_AuraScript();
        }
};

enum CloseRift
{
    SPELL_DESPAWN_RIFT          = 61665
};

class spell_close_rift : public SpellScriptLoader
{
    public:
        spell_close_rift() : SpellScriptLoader("spell_close_rift") { }

        class spell_close_rift_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_close_rift_AuraScript);

        public:
            spell_close_rift_AuraScript()
            {
                _counter = 0;
            }

        private:
            bool Validate(SpellInfo const* /*spell*/) override
            {
                return sSpellMgr->GetSpellInfo(SPELL_DESPAWN_RIFT) != nullptr;
            }

            void HandlePeriodic(AuraEffect const* /* aurEff */)
            {
                if (++_counter == 5)
                    GetTarget()->CastSpell((Unit*)NULL, SPELL_DESPAWN_RIFT, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_close_rift_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

        private:
            uint8 _counter;

        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_close_rift_AuraScript();
        }
};

class spell_grip : public SpellScriptLoader
{
public:
	spell_grip() : SpellScriptLoader("spell_grip") { }

	class spell_grip_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_grip_AuraScript);

		void DummyTick(AuraEffect const* /*aurEff*/)
		{
			Creature* caster = GetCaster()->ToCreature();

			caster->RemoveAuraFromStack(SPELL_GRIP);

			if (!warning && caster->GetAuraCount(SPELL_GRIP) < 15)
			{
				if (Vehicle* vehicle = caster->GetVehicleKit())
					if (Unit* player = vehicle->GetPassenger(0))
					{
					caster->AI()->Talk(SAY_WILD_WYRM_4, player);
					warning = true;
					}
			}
			else if (caster->GetAuraCount(SPELL_GRIP) > 30)
				warning = false;
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_grip_AuraScript::DummyTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}

	private:
		bool warning;
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_grip_AuraScript();
	}
};

class spell_grab_on : public SpellScriptLoader
{
public:
	spell_grab_on() : SpellScriptLoader("spell_grab_on") { }

	class spell_grab_on_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_grab_on_SpellScript);

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			GetCaster()->CastCustomSpell(SPELL_GRIP, SPELLVALUE_AURA_STACK, GetSpellInfo()->Effects[EFFECT_0].CalcValue(), GetCaster(), false);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_grab_on_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_grab_on_SpellScript();
	}
};

class spell_thrust_spear : public SpellScriptLoader
{
public:
	spell_thrust_spear() : SpellScriptLoader("spell_thrust_spear") { }

	class spell_thrust_spear_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_thrust_spear_SpellScript);

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (Aura* grip = GetCaster()->GetAura(SPELL_GRIP))
				grip->ModStackAmount(-5);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_thrust_spear_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_thrust_spear_SpellScript();
	}
};

class spell_mighty_spear_thrust : public SpellScriptLoader
{
public:
	spell_mighty_spear_thrust() : SpellScriptLoader("spell_mighty_spear_thrust") { }

	class spell_mighty_spear_thrust_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mighty_spear_thrust_SpellScript);

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (Aura* grip = GetCaster()->GetAura(SPELL_GRIP))
				grip->ModStackAmount(-15);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_mighty_spear_thrust_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mighty_spear_thrust_SpellScript();
	}
};

class spell_jaws_of_death_and_spell_claw_swipe_damage : public SpellScriptLoader
{
public:
	spell_jaws_of_death_and_spell_claw_swipe_damage() : SpellScriptLoader("spell_jaws_of_death_and_spell_claw_swipe_damage") { }

	class spell_jaws_of_death_and_spell_claw_swipe_damage_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_jaws_of_death_and_spell_claw_swipe_damage_SpellScript);

		void HandleDamage(SpellEffIndex /*effIndex*/)
		{
			int32 value = int32(GetHitUnit()->CountPctFromMaxHealth(GetSpellInfo()->Effects[EFFECT_0].CalcValue(GetCaster())));
			SetEffectValue(value);
		}

		void Register() override
		{
			OnEffectLaunchTarget += SpellEffectFn(spell_jaws_of_death_and_spell_claw_swipe_damage_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
		}

	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_jaws_of_death_and_spell_claw_swipe_damage_SpellScript();
	}
};

class spell_claw_swipe_check : public SpellScriptLoader
{
public: spell_claw_swipe_check() : SpellScriptLoader("spell_claw_swipe_check") { }

		class spell_claw_swipe_check_AuraScript : public AuraScript
		{
			PrepareAuraScript(spell_claw_swipe_check_AuraScript);

			void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
			{
				Creature* caster = GetCaster()->ToCreature();
				if (caster)
					if (Vehicle* vehicle = caster->GetVehicleKit())
						if (Unit* player = vehicle->GetPassenger(0))
							caster->AI()->Talk(SAY_WILD_WYRM_1, player);
			}

			void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
			{
				Creature* caster = GetCaster()->ToCreature();
				if (caster)
				{
					if (Vehicle* vehicle = caster->GetVehicleKit())
						if (Unit* player = vehicle->GetPassenger(0))
						{
						if (player->HasAura(SPELL_DODGE_CLAWS))
							caster->AI()->Talk(SAY_WILD_WYRM_2, player);
						else
							caster->AI()->DoCast(SPELL_CLAW_SWIPE_DAMAGE);
						}
				}
			}

			void Register() override
			{
				AfterEffectApply += AuraEffectApplyFn(spell_claw_swipe_check_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
				AfterEffectRemove += AuraEffectApplyFn(spell_claw_swipe_check_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
			}
		};

		AuraScript* GetAuraScript() const override
		{
			return new spell_claw_swipe_check_AuraScript();
		}
};

class spell_fatal_strike : public SpellScriptLoader
{
public:
	spell_fatal_strike() : SpellScriptLoader("spell_fatal_strike") { }

	class spell_fatal_strike_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_fatal_strike_SpellScript);

		void HandleDamage(SpellEffIndex /*effIndex*/)
		{
			Creature* caster = GetCaster()->ToCreature();
			if (caster)
			{
				if ((urand(1, 100) > caster->GetAuraCount(SPELL_PRY_JAWS_OPEN) * 5))
				{
					if (Vehicle* vehicle = caster->GetVehicleKit())
						if (Unit* player = vehicle->GetPassenger(0))
							caster->AI()->Talk(SAY_WILD_WYRM_5, player);

					SetHitDamage(0);
				}
				/*caster->_AddCreatureSpellCooldown(SPELL_FATAL_STRIKE, time(NULL) + 3);
				caster->_AddCreatureSpellCooldown(SPELL_PRY_JAWS_OPEN, time(NULL) + 3);*/
			}
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_fatal_strike_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
		}

	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_fatal_strike_SpellScript();
	}
};

/*######
## Quest 12886: The Drakkensryd
## npc_gretta_the_arbiter
## npc_hyldsmeet_drakerider
## npc_hyldsmeet_protodrake
######*/

enum TheDrakkensryd
{
	NPC_DRAKKENSRYD_KC = 29800,
	SPELL_MORTAL_STRIKE = 32736,
	QUEST_THE_DRAKKENSRYD = 12886,
	NPC_HYLDSMEET_PROTO_DRAKE = 29625,
	SPELL_HYLDNIR_HARPOON = 54933,
	DATA_DESPAWN_EMPTY = 1
};

class npc_hyldsmeet_drakerider : public CreatureScript
{
public:
	npc_hyldsmeet_drakerider() : CreatureScript("npc_hyldsmeet_drakerider") { }

	struct npc_hyldsmeet_drakeriderAI : public ScriptedAI
	{
		npc_hyldsmeet_drakeriderAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 MortalStrikeTimer;

		void Reset()
		{
			MortalStrikeTimer = urand(2000, 5000);
		}

		void JustDied(Unit* who)
		{
			if (Player* player = who->ToPlayer())
			{
				player->KilledMonsterCredit(NPC_DRAKKENSRYD_KC, ObjectGuid::Empty);
			}
		}

		void UpdateAI(uint32 diff)
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

			if (!UpdateVictim())
				return;

			if (Unit* victim = me->GetVictim())
			{
				if (victim->GetDistance(me) > 10.0f)
				{
					EnterEvadeMode();
					return;
				}

				if (MortalStrikeTimer <= diff)
				{
					DoCast(victim, SPELL_MORTAL_STRIKE, true);
					MortalStrikeTimer = urand(5000, 9000);
				}
				else
				{
					MortalStrikeTimer -= diff;
				}

				DoMeleeAttackIfReady();
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hyldsmeet_drakeriderAI(creature);
	}
};

class npc_hyldsmeet_protodrake : public CreatureScript
{
	enum NPCs
	{
		NPC_HYLDSMEET_DRAKERIDER = 29694
	};

public:
	npc_hyldsmeet_protodrake() : CreatureScript("npc_hyldsmeet_protodrake") { }

	class npc_hyldsmeet_protodrakeAI : public CreatureAI
	{
	public:
		npc_hyldsmeet_protodrakeAI(Creature* creature) : CreatureAI(creature), _accessoryRespawnTimer(0), _vehicleKit(creature->GetVehicleKit()) {}

		void PassengerBoarded(Unit* who, int8 /*seat*/, bool apply)
		{
			if (apply)
				return;

			if (who->GetEntry() == NPC_HYLDSMEET_DRAKERIDER)
				_accessoryRespawnTimer = 5 * MINUTE * IN_MILLISECONDS;
		}

		void UpdateAI(uint32 diff)
		{
			//! We need to manually reinstall accessories because the vehicle itself is friendly to players,
			//! so EnterEvadeMode is never triggered. The accessory on the other hand is hostile and killable.
			if (_accessoryRespawnTimer && _accessoryRespawnTimer <= diff && _vehicleKit)
			{
				_vehicleKit->InstallAllAccessories(true);
				_accessoryRespawnTimer = 0;
			}
			else
				_accessoryRespawnTimer -= diff;

			if (despawnEmpty)
			{
				if (_vehicleKit->HasEmptySeat(0))
				{
					me->DespawnOrUnsummon();
				}
			}
		}

		void SetData(uint32 id, uint32 /*data*/)
		{
			if (id == DATA_DESPAWN_EMPTY)
				despawnEmpty = true;
		}

		void Reset()
		{
			despawnEmpty = false;
		}

	private:
		uint32 _accessoryRespawnTimer;
		Vehicle* _vehicleKit;
		bool despawnEmpty;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hyldsmeet_protodrakeAI(creature);
	}
};

enum Q12915MendingFences
{
	SPELL_SUMMON_EARTHEN = 55528
};

class spell_q12915_mending_fences : public SpellScriptLoader
{
public:
	spell_q12915_mending_fences() : SpellScriptLoader("spell_q12915_mending_fences") { }

	class spell_q12915_mending_fences_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_q12915_mending_fences_SpellScript);

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			Unit* target = GetHitUnit();
			if (!target)
				return;

			for (uint8 i = 0; i < 4; ++i)
				GetCaster()->CastSpell(GetCaster(), SPELL_SUMMON_EARTHEN, true);
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_q12915_mending_fences_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_q12915_mending_fences_SpellScript();
	};
};

class npc_sparksocket_AA_cannon : public CreatureScript
{
    enum SPELLS
    {
        SPELL_PERIODIC_AURA = 54434,
        SPELL_HOSTILE_AIRSPACE = 54433,
        SPELL_POSITIVE_RESPONSE = 56320
    };

    public:
        npc_sparksocket_AA_cannon() : CreatureScript("npc_sparksocket_AA_cannon") { }

        class npc_sparksocket_AA_cannonAI : public CreatureAI
        {
            public:
                npc_sparksocket_AA_cannonAI(Creature* creature) : CreatureAI(creature)
                {
                    Initialize();
                }

                void Initialize()
                {
                    _auraTimer = 1500;
                }

                void Reset() override
                {
                    Initialize();
                }

                void UpdateAI(uint32 diff) override
                {

                    if (_auraTimer && _auraTimer <= diff)
                    {
                        if(Player* player = me->SelectNearestPlayer(55.0f))
                            if (player->IsMounted() && player->IsFlying())
                                me->CastSpell(player, SPELL_HOSTILE_AIRSPACE, true);
                        _auraTimer = 1500;
                    }
                    else
                        _auraTimer -= diff;
                }

            private:
                uint32 _auraTimer;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_sparksocket_AA_cannonAI(creature);
        }
};

enum TerritorialTrespassMisc
{
    GO_SMALL_PROTO_DRAKE_EGG = 192538,
    NPC_VERANUS              = 30461,
};

class spell_place_stolen_eggs : public SpellScriptLoader
{
public:
    spell_place_stolen_eggs() : SpellScriptLoader("spell_place_stolen_eggs") { }

    class spell_place_stolen_eggs_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_place_stolen_eggs_SpellScript);

        void HandleAfterCast()
        {
            GetCaster()->SummonGameObject(GO_SMALL_PROTO_DRAKE_EGG, 7081.91f, -906.408f, 1065.91f, 0.95993f, 0, 0, 0, 0, 300 * IN_MILLISECONDS);
            GetCaster()->SummonGameObject(GO_SMALL_PROTO_DRAKE_EGG, 7080.19f, -912.123f, 1066.74f, -0.541051f, 0, 0, 0, 0, 300 * IN_MILLISECONDS);
            GetCaster()->SummonGameObject(GO_SMALL_PROTO_DRAKE_EGG, 7085.54f, -912.668f, 1066.48f, 1.81514f, 0, 0, 0, 0, 300 * IN_MILLISECONDS);
            GetCaster()->SummonGameObject(GO_SMALL_PROTO_DRAKE_EGG, 7090.95f, -908.667f, 1065.04f, -0.994837f, 0, 0, 0, 0, 300 * IN_MILLISECONDS);
            GetCaster()->SummonGameObject(GO_SMALL_PROTO_DRAKE_EGG, 7082.19f, -916.648f, 1068.39f, 2.23402f, 0, 0, 0, 0, 300 * IN_MILLISECONDS);
            if (GetCaster()->GetTypeId() == TYPEID_PLAYER)
				GetCaster()->ToPlayer()->KilledMonsterCredit(NPC_VERANUS, ObjectGuid::Empty);
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_place_stolen_eggs_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_place_stolen_eggs_SpellScript();
    }
};

/*######
## npc_vyragosa_tlpd
######*/

enum TlpdData
{
    SPELL_TLPD_TIME_LAPSE   = 51020,
    SPELL_TLPD_TIME_SHIFT   = 61084,
    SPELL_VYRA_FROST_BREATH = 47425,
    SPELL_VYRA_FROST_CLEAVE = 51857,

    NPC_VYRAGOSA            = 32630,
    NPC_TLPD                = 32491,

    WORLDSTATE_TLPD         = 30001,

    // db guids
    GUID_TLPD_1             = 202461,
    GUID_TLPD_2             = 202462,
    GUID_TLPD_3             = 202463,
    GUID_TLPD_4             = 202464,
                            
    GUID_VYRA_1             = 202441,
    GUID_VYRA_2             = 202442,
    GUID_VYRA_3             = 202443,
    GUID_VYRA_4             = 202444
};

class npc_vyragosa_tlpd : public CreatureScript
{
    public:
        npc_vyragosa_tlpd() : CreatureScript("npc_vyragosa_tlpd") { }
    
        struct npc_vyragosa_tlpdAI : public npc_escortAI
        {
            npc_vyragosa_tlpdAI(Creature* creature) : npc_escortAI(creature)
            {
                creature->setActive(true);
                waypointId = 0;
    
                switch (me->GetGUID().GetCounter())
                {
                    case GUID_TLPD_1:
                    case GUID_VYRA_1:
                        waypointId = 0;
                        break;
                    case GUID_TLPD_2:
                    case GUID_VYRA_2:
                        waypointId = 97;
                        break;
                    case GUID_TLPD_3:
                    case GUID_VYRA_3:
                        waypointId = 157;
                        break;
                    case GUID_TLPD_4:
                    case GUID_VYRA_4:
                        waypointId = 245;
                        break;
                }
                Start(true, true, ObjectGuid::Empty, NULL);
                SetNextWaypoint(waypointId);
            }
    
            uint32 saveTick, castTimer, waypointId;
            time_t respawn;
    
            void SetVisibleAndReactState(bool x)
            {
                me->SetVisible(x);
                me->SetReactState(x == true ? REACT_AGGRESSIVE : REACT_PASSIVE);
            }
    
            void Reset()
            {
                me->SetByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_HOVER);
                me->setActive(true);
                respawn =  sWorld->getWorldState(WORLDSTATE_TLPD);
                SetVisibleAndReactState(respawn > time(0) ? false : true);
                castTimer = 500;
                saveTick = 1 * MINUTE * IN_MILLISECONDS;
    
                SetNextWaypoint(waypointId);
            }
    
            void JustRespawned()
            {
                me->setActive(true);
                waypointId = 0;
    
                switch (me->GetGUID().GetCounter())
                {
                    case GUID_TLPD_1:
                    case GUID_VYRA_1:
                        waypointId = 0;
                        break;
                    case GUID_TLPD_2:
                    case GUID_VYRA_2:
                        waypointId = 97;
                        break;
                    case GUID_TLPD_3:
                    case GUID_VYRA_3:
                        waypointId = 157;
                        break;
                    case GUID_TLPD_4:
                    case GUID_VYRA_4:
                        waypointId = 245;
                        break;
                }
                Start(true, true, ObjectGuid::Empty, NULL);
                SetNextWaypoint(waypointId);
            }
    
            void JustDied(Unit* /*victim*/)
            {
                time_t newTime = time(0) + urand(6, 48) * HOUR;
                sWorld->setWorldState(WORLDSTATE_TLPD, newTime);
            }
    
            void JustReachedHome() override { } // overwrite or creature becomes inactive again
    
            void WaypointReached(uint32 pointId) override
            {
                waypointId = pointId;
                switch (pointId)
                {
                    case 96:
                        SetNextWaypoint(11, true, false); // path 1 startpoint is 0
                        break;                   
                    case 156:
                        SetNextWaypoint(98, true, false); // path 2 startpoint is 97
                        break;                   
                    case 244:
                        SetNextWaypoint(167, true, false); // path 3 startpoint is 157
                        break;                    
                    case 376:
                        SetNextWaypoint(247, true, false); // path 4 startpoint is 245
                        break;
                }
            }
    
            void UpdateAI(uint32 diff) override
            {
                npc_escortAI::UpdateAI(diff);
    
                // make visible if "respawntime" is over
                if (saveTick <= diff)
                {
                    if (respawn > time(0))
                    {
                        if (me->IsVisible())
                            SetVisibleAndReactState(false);
                    }
                    else
                    {
                        if (!me->IsVisible())
                        {
                            sWorld->setWorldState(WORLDSTATE_TLPD, time_t(0));
                            SetVisibleAndReactState(true);
                        }
                    }
                    saveTick = 1 * MINUTE * IN_MILLISECONDS;
                }
                else
                    saveTick -= diff;
    
                if (!UpdateVictim())
                    return;
    
                // has target, cast stuff!
                if (castTimer <= diff)
                {
                    switch (me->GetEntry())
                    {
                        case NPC_VYRAGOSA:
                            DoCast(me->GetVictim(), me->IsWithinMeleeRange(me->GetVictim()) ? SPELL_VYRA_FROST_CLEAVE : SPELL_VYRA_FROST_BREATH, false);
                            break;
                        case NPC_TLPD:
                            DoCast(me->GetVictim(), urand(0, 1) ? SPELL_TLPD_TIME_SHIFT : SPELL_TLPD_TIME_LAPSE, false);
                            break;
                        default:
                            return;
                    }
                    castTimer = 3000 + urand(0, 1500);
                }
                else
                    castTimer -= diff;
    
                if (me->GetVictim() && me->IsVisible())
                    DoMeleeAttackIfReady();
            }
    
        };
    
        CreatureAI *GetAI(Creature *creature) const override
        {
            return new npc_vyragosa_tlpdAI(creature);
        }
};

void AddSC_storm_peaks()
{
    new npc_injured_goblin();
    new npc_roxi_ramrocket();
    new npc_brunnhildar_prisoner();
    new npc_freed_protodrake();
    new npc_icefang();
    new npc_hyldsmeet_protodrake();
    new npc_brann_bronzebeard_keystone();
    new spell_jokkum_scriptcast();
    new spell_veranus_summon();
    new spell_close_rift();
	new npc_wild_wyrm();
	new spell_grip();
	new spell_grab_on();
	new spell_thrust_spear();
	new spell_mighty_spear_thrust();
	new spell_jaws_of_death_and_spell_claw_swipe_damage();
	new spell_claw_swipe_check();
	new spell_fatal_strike();

	new npc_hyldsmeet_drakerider();
	new spell_q12915_mending_fences();

    new npc_sparksocket_AA_cannon();
    new spell_place_stolen_eggs();
    new npc_vyragosa_tlpd();
}
