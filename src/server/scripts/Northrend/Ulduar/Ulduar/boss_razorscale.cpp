/*
* Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
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
#include "SpellScript.h"
#include "ulduar.h"
#include "SpellInfo.h"
#include "Player.h"

enum Says
{
	// Expedition Commander
	SAY_INTRO = 0,
	SAY_GROUND_PHASE = 1,
	SAY_AGGRO_2 = 2,

	// Expedition Engineer
	SAY_AGGRO_1 = 0,
	SAY_AGGRO_3 = 1,
	SAY_TURRETS = 2, // unused

	// Razorscale Controller
	EMOTE_HARPOON = 0,

	// Razorscale
	EMOTE_PERMA = 0,
	EMOTE_BREATH = 1
};

enum Spells
{
	SPELL_FLAMEBUFFET = 64016,
	SPELL_FIREBALL = 62796,
	SPELL_FLAME_GROUND = 64734,
	SPELL_WINGBUFFET = 62666,
	SPELL_FLAMEBREATH = 63317,
	SPELL_FUSEARMOR = 64771,
	SPELL_FLAMED = 62696,
	SPELL_STUN = 9032,
	SPELL_BERSERK = 47008,
	// Additonal Spells
	// Devouring Flame Spells
	SPELL_DEVOURING_FLAME = 63308,
	SPELL_DEVOURING_FLAME_DAMAGE = 64704,
	SPELL_DEVOURING_FLAME_TRIGGER = 64709,
	// HarpoonSpells
	SPELL_HARPOON_TRIGGER = 62505,
	SPELL_HARPOON_SHOT_1 = 63658,
	SPELL_HARPOON_SHOT_2 = 63657,
	SPELL_HARPOON_SHOT_3 = 63659,
	SPELL_HARPOON_SHOT_4 = 63524,
	// MoleMachine Spells
	SPELL_SUMMON_MOLE_MACHINE = 62899,
	SPELL_SUMMON_IRON_DWARVES = 63116,
	SPELL_SUMMON_IRON_DWARVES_2 = 63114,
	SPELL_SUMMON_IRON_DWARVE_GUARDIAN = 62926,
	SPELL_SUMMON_IRON_DWARVE_WATCHER = 63135,
	SPELL_SUMMON_IRON_VYRKUL_SENTINEL = 63798,

	SPELL_SELF_STUN = 31539,
};

enum NPC
{
	NPC_DARK_RUNE_GUARDIAN = 33388,
	NPC_DARK_RUNE_SENTINEL = 33846,
	NPC_DARK_RUNE_WATCHER = 33453,
	MOLE_MACHINE_TRIGGER = 33245,
	NPC_COMMANDER = 33210,
	NPC_ENGINEER = 33287,
	NPC_DEFENDER = 33816,
};

enum DarkRuneSpells
{
	// Dark Rune Watcher
	SPELL_CHAIN_LIGHTNING = 64758,
	SPELL_LIGHTNING_BOLT = 63809,
	// Dark Rune Guardian
	SPELL_STORMSTRIKE = 64757,
	// Dark Rune Sentinel
	SPELL_BATTLE_SHOUT = 46763,
	SPELL_HEROIC_STRIKE = 45026,
	SPELL_WHIRLWIND = 63808,
};

enum Actions
{
	ACTION_EVENT_START = 1,
	ACTION_GROUND_PHASE = 2,
	ACTION_HARPOON_BUILD = 3,
	ACTION_PLACE_BROKEN_HARPOON = 4,
	ACTION_COMMANDER_RESET = 7,
	ACTION_DO_START_CHECKING = 8,
};

enum Phases
{
	PHASE_PERMAGROUND = 1,
	PHASE_GROUND = 2,
	PHASE_FLIGHT = 3,
};

enum Events
{
	EVENT_BERSERK = 1,
	EVENT_BREATH = 2,
	EVENT_BUFFET = 3,
	EVENT_FIREBALL = 5,
	EVENT_FLIGHT = 6,
	EVENT_DEVOURING = 7,
	EVENT_FLAME = 8,
	EVENT_LAND = 9,
	EVENT_GROUND = 10,
	EVENT_FUSE = 11,
	EVENT_SUMMON = 12,
	// Razorscale Controller
	EVENT_BUILD_HARPOON_1 = 13,
	EVENT_BUILD_HARPOON_2 = 14,
	EVENT_BUILD_HARPOON_3 = 15,
	EVENT_BUILD_HARPOON_4 = 16,

	EVENT_PROCESS_SUMMON = 17,
};

#define GROUND_Z                                 391.517f
#define GOSSIP_ITEM_1                            "Activate Harpoons!"

enum Misc
{
	DATA_QUICK_SHAVE = 29192921, // 2919, 2921 are achievement IDs
	DATA_IRON_DWARF_MEDIUM_RARE = 29232924
};

const Position PosEngRepair[4] =
{
	{ 590.442f, -130.550f, GROUND_Z, 4.789f },
	{ 574.850f, -133.687f, GROUND_Z, 4.252f },
	{ 606.567f, -143.369f, GROUND_Z, 4.434f },
	{ 560.609f, -142.967f, GROUND_Z, 5.074f },
};

const Position PosDefSpawn[4] =
{
	{ 600.75f, -104.850f, GROUND_Z, 0 },
	{ 596.38f, -110.262f, GROUND_Z, 0 },
	{ 566.47f, -103.633f, GROUND_Z, 0 },
	{ 570.41f, -108.791f, GROUND_Z, 0 },
};

const Position PosDefCombat[4] =
{
	{ 614.975f, -155.138f, GROUND_Z, 4.154f },
	{ 609.814f, -204.968f, GROUND_Z, 5.385f },
	{ 563.531f, -201.557f, GROUND_Z, 4.108f },
	{ 560.231f, -153.677f, GROUND_Z, 5.403f },
};

const Position PosHarpoon[4] =
{
	{ 571.901f, -136.554f, GROUND_Z, 0 },
	{ 589.450f, -134.888f, GROUND_Z, 0 },
	{ 559.119f, -140.505f, GROUND_Z, 0 },
	{ 606.229f, -136.721f, GROUND_Z, 0 },
};

const Position RazorFlight = { 588.050f, -251.191f, 470.536f, 1.498f };
const Position RazorGround = { 586.966f, -175.534f, GROUND_Z, 4.682f };
const Position PosEngSpawn = { 591.951f, -95.9680f, GROUND_Z, 0.000f };

class boss_razorscale_controller : public CreatureScript
{
public:
	boss_razorscale_controller() : CreatureScript("boss_razorscale_controller") { }

	struct boss_razorscale_controllerAI : public BossAI
	{
		boss_razorscale_controllerAI(Creature* creature) : BossAI(creature, DATA_RAZORSCALE_CONTROL)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void Reset() override
		{
			_Reset();
			me->SetReactState(REACT_PASSIVE);
		}

			void DamageTaken(Unit* /*killer*/, uint32 &damage)
		{
			// just making them immortal
			damage = 0;
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
		{
			switch (spell->Id)
			{
			case SPELL_FLAMED:
				if (GameObject* Harpoon1 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_1)))
					Harpoon1->RemoveFromWorld();
				if (GameObject* Harpoon2 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_2)))
					Harpoon2->RemoveFromWorld();
				if (GameObject* Harpoon3 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_3)))
					Harpoon3->RemoveFromWorld();
				if (GameObject* Harpoon4 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_4)))
					Harpoon4->RemoveFromWorld();
				me->AI()->DoAction(ACTION_HARPOON_BUILD);
				me->AI()->DoAction(ACTION_PLACE_BROKEN_HARPOON);
				break;
			case SPELL_HARPOON_SHOT_1:
			case SPELL_HARPOON_SHOT_2:
			case SPELL_HARPOON_SHOT_3:
			case SPELL_HARPOON_SHOT_4:
				DoCast(SPELL_HARPOON_TRIGGER);
				break;
			}
		}

			void JustDied(Unit* /*killer*/) override
		{
			_JustDied();
		}

			void DoAction(int32 action) override
		{
			if (instance->GetBossState(BOSS_RAZORSCALE) != IN_PROGRESS)
			return;

			switch (action)
			{
			case ACTION_HARPOON_BUILD:
				events.ScheduleEvent(EVENT_BUILD_HARPOON_1, 50000);
				if (me->GetMap()->GetSpawnMode() == RAID_DIFFICULTY_25MAN_NORMAL)
					events.ScheduleEvent(EVENT_BUILD_HARPOON_3, 90000);
				break;
			case ACTION_PLACE_BROKEN_HARPOON:
				for (uint8 n = 0; n < RAID_MODE(2, 4); n++)
					me->SummonGameObject(GO_RAZOR_BROKEN_HARPOON, PosHarpoon[n].GetPositionX(), PosHarpoon[n].GetPositionY(), PosHarpoon[n].GetPositionZ(), 2.286f, 0, 0, 0, 0, 180000);
				break;
			}
		}

			void UpdateAI(uint32 Diff) override
		{
			events.Update(Diff);
			if (instance->GetBossState(BOSS_RAZORSCALE) != IN_PROGRESS)
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_BUILD_HARPOON_1:
					Talk(EMOTE_HARPOON);
					if (GameObject* Harpoon = me->SummonGameObject(GO_RAZOR_HARPOON_1, PosHarpoon[0].GetPositionX(), PosHarpoon[0].GetPositionY(), PosHarpoon[0].GetPositionZ(), 4.790f, 0.0f, 0.0f, 0.0f, 0.0f, uint32(me->GetRespawnTime())))
					{
						/*Harpoon->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
						Harpoon->SetGoState(GO_STATE_ACTIVE);*/
						std::cout << "HARPOON SET \n";
						if (GameObject* BrokenHarpoon = Harpoon->FindNearestGameObject(GO_RAZOR_BROKEN_HARPOON, 5.0f)) //only nearest broken harpoon
							BrokenHarpoon->RemoveFromWorld();
						events.ScheduleEvent(EVENT_BUILD_HARPOON_2, 20000);
						events.CancelEvent(EVENT_BUILD_HARPOON_1);
					}
					return;
				case EVENT_BUILD_HARPOON_2:
					Talk(EMOTE_HARPOON);
					if (GameObject* Harpoon = me->SummonGameObject(GO_RAZOR_HARPOON_2, PosHarpoon[1].GetPositionX(), PosHarpoon[1].GetPositionY(), PosHarpoon[1].GetPositionZ(), 4.659f, 0, 0, 0, 0, uint32(me->GetRespawnTime())))
					{
						if (GameObject* BrokenHarpoon = Harpoon->FindNearestGameObject(GO_RAZOR_BROKEN_HARPOON, 5.0f))
							BrokenHarpoon->RemoveFromWorld();
						events.CancelEvent(EVENT_BUILD_HARPOON_2);
					}
					return;
				case EVENT_BUILD_HARPOON_3:
					Talk(EMOTE_HARPOON);
					if (GameObject* Harpoon = me->SummonGameObject(GO_RAZOR_HARPOON_3, PosHarpoon[2].GetPositionX(), PosHarpoon[2].GetPositionY(), PosHarpoon[2].GetPositionZ(), 5.382f, 0, 0, 0, 0, uint32(me->GetRespawnTime())))
					{
						if (GameObject* BrokenHarpoon = Harpoon->FindNearestGameObject(GO_RAZOR_BROKEN_HARPOON, 5.0f))
							BrokenHarpoon->RemoveFromWorld();
						events.ScheduleEvent(EVENT_BUILD_HARPOON_4, 20000);
						events.CancelEvent(EVENT_BUILD_HARPOON_3);
					}
					return;
				case EVENT_BUILD_HARPOON_4:
					Talk(EMOTE_HARPOON);
					if (GameObject* Harpoon = me->SummonGameObject(GO_RAZOR_HARPOON_4, PosHarpoon[3].GetPositionX(), PosHarpoon[3].GetPositionY(), PosHarpoon[3].GetPositionZ(), 4.266f, 0, 0, 0, 0, uint32(me->GetRespawnTime())))
					{
						if (GameObject* BrokenHarpoon = Harpoon->FindNearestGameObject(GO_RAZOR_BROKEN_HARPOON, 5.0f))
							BrokenHarpoon->RemoveFromWorld();
						events.CancelEvent(EVENT_BUILD_HARPOON_4);
					}
					return;
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<boss_razorscale_controllerAI>(creature);
	}
};

class go_razorscale_harpoon : public GameObjectScript
{
public:
	go_razorscale_harpoon() : GameObjectScript("go_razorscale_harpoon") { }

	bool OnGossipHello(Player* /*player*/, GameObject* go) override
	{

		if (go->HasFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE))
		return true;

		InstanceScript* instance = go->GetInstanceScript();

		if (ObjectAccessor::GetCreature(*go, instance->GetGuidData(BOSS_RAZORSCALE))) // If the encounter is in progress
			go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
		return false;
	}
};

class boss_razorscale : public CreatureScript
{
public:
	boss_razorscale() : CreatureScript("boss_razorscale") { }

	struct boss_razorscaleAI : public BossAI
	{
		boss_razorscaleAI(Creature* creature) : BossAI(creature, BOSS_RAZORSCALE)
		{
			// Do not let Razorscale be affected by Battle Shout buff
			me->ApplySpellImmune(0, IMMUNITY_ID, (SPELL_BATTLE_SHOUT), true);
		}

		Phases phase;

		uint32 EnrageTimer;
		uint8 FlyCount;
		uint8 HarpoonCounter;
		bool PermaGround;
		bool Enraged;

		uint8 MoleMachinesCount;

		void DespawnAdds(uint32 addID)
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, addID, 400.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(400.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
					(*i)->DespawnOrUnsummon();
			}

		}

		void Reset() override
		{
			me->RemoveAllAuras();

			_Reset();

			me->RemoveAura(SPELL_SELF_STUN);
			me->SetCanFly(true);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_PASSIVE);

			PermaGround = false;
			HarpoonCounter = 0;
			MoleMachinesCount = 0;

			if (Creature* commander = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_EXPEDITION_COMMANDER)))
				commander->AI()->DoAction(ACTION_COMMANDER_RESET);

			if (Creature* controller = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RAZORSCALE_CONTROL)))
				controller->AI()->Reset();

			DespawnAdds(NPC_DARK_RUNE_GUARDIAN);
			DespawnAdds(NPC_DARK_RUNE_SENTINEL);
			DespawnAdds(NPC_DARK_RUNE_WATCHER);
			DespawnAdds(NPC_ENGINEER);
			DespawnAdds(MOLE_MACHINE_TRIGGER);

			if (GameObject* Harpoon1 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_1)))
				Harpoon1->RemoveFromWorld();
			if (GameObject* Harpoon2 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_2)))
				Harpoon2->RemoveFromWorld();
			if (GameObject* Harpoon3 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_3)))
				Harpoon3->RemoveFromWorld();
			if (GameObject* Harpoon4 = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(GO_RAZOR_HARPOON_4)))
				Harpoon4->RemoveFromWorld();

			/* Despawn de los engineers */

			DespawnAdds(NPC_DEFENDER);
		}

			void EnterCombat(Unit* /*who*/) override
		{
			_EnterCombat();

			if (Creature* resetController = me->FindNearestCreature(225167, 200.0f, true)) // npc_razorscale_reset_controller
				resetController->AI()->DoAction(ACTION_DO_START_CHECKING);

			if (Creature* controller = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RAZORSCALE_CONTROL)))
				controller->AI()->DoAction(ACTION_HARPOON_BUILD);
			me->SetSpeed(MOVE_FLIGHT, 3.0f, true);
			me->SetReactState(REACT_PASSIVE);
			phase = PHASE_GROUND;
			events.SetPhase(PHASE_GROUND);
			FlyCount = 0;
			EnrageTimer = 480000; // Pre-nerf.
			Enraged = false;
			events.ScheduleEvent(EVENT_FLIGHT, 0, 0, PHASE_GROUND);

		}

			void JustDied(Unit* /*killer*/) override
		{
			_JustDied();
			if (Creature* controller = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RAZORSCALE_CONTROL)))
				controller->AI()->Reset();
		}

			void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_HARPOON_TRIGGER)
			++HarpoonCounter;
		}

			void MovementInform(uint32 type, uint32 id) override
		{
			if (type == EFFECT_MOTION_TYPE && id == 1)
			{
				phase = PHASE_GROUND;
				events.SetPhase(PHASE_GROUND);
				events.ScheduleEvent(EVENT_LAND, 0, 0, PHASE_GROUND);
			}
		}

			uint32 GetData(uint32 type) const override
		{
			if (type == DATA_QUICK_SHAVE)
			if (FlyCount <= 2)
				return 1;

			return 0;
		}

			void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			events.Update(Diff);

			if (HealthBelowPct(50) && !PermaGround)
			{
				if (me->HasAura(SPELL_SELF_STUN))
					me->RemoveAura(SPELL_SELF_STUN);

				EnterPermaGround();
			}

			if (EnrageTimer <= Diff && !Enraged)
			{
				DoCast(me, SPELL_BERSERK);
				Enraged = true;
			}
			else
				EnrageTimer -= Diff;

			if (HarpoonCounter == RAID_MODE(2, 4))
			{
				/*if (Player* player = me->SelectNearestPlayer(250.0f))
				me->Kill(player);*/

				HarpoonCounter = 0;
				//events.CancelEvent(EVENT_SUMMON);

				events.CancelEvent(EVENT_SUMMON);
				events.DelayEvents(48000);
				me->GetMotionMaster()->MoveLand(1, RazorGround);
				//me->RemoveAurasDueToSpell(SPELL_HARPOON_TRIGGER);
				/*me->SetCanFly(false);


				me->RemoveUnitMovementFlag(MOVEMENTFLAG_FLYING | MOVEMENTFLAG_DISABLE_GRAVITY);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
				me->SetDisableGravity(true);*/
				/*me->GetMotionMaster()->Clear();
				me->GetMotionMaster()->MoveIdle();
				me->GetMotionMaster()->MoveLand(1, RazorGround);*/
				//587.35f, -175.59f, 391.51, 1.57f
				//me->GetMotionMaster()->Move

				/*





				INHABYT A 4.



				*/
			}

			if (phase == PHASE_GROUND)
			{
				while (uint32 eventId = events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_FLIGHT:
						/* EVENT FLIGHT, cuando empiece a volar para arriba */
						me->RemoveAura(SPELL_SELF_STUN);
						phase = PHASE_FLIGHT;
						events.SetPhase(PHASE_FLIGHT);
						me->SetCanFly(true);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
						me->SetReactState(REACT_PASSIVE);
						me->AttackStop();
						me->GetMotionMaster()->MoveTakeoff(0, RazorFlight);
						me->RemoveAllAuras();
						events.RescheduleEvent(EVENT_FIREBALL, 7000, 0, PHASE_FLIGHT);
						events.RescheduleEvent(EVENT_DEVOURING, 10000, 0, PHASE_FLIGHT);
						events.RescheduleEvent(EVENT_SUMMON, 5000, 0, PHASE_FLIGHT);
						++FlyCount;
						return;
					case EVENT_LAND:
						me->SetCanFly(false);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
						DoCast(me, SPELL_SELF_STUN);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);
						if (Creature* commander = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_EXPEDITION_COMMANDER)))
							commander->AI()->DoAction(ACTION_GROUND_PHASE);
						events.ScheduleEvent(EVENT_BREATH, 40000, 0, PHASE_GROUND);
						events.ScheduleEvent(EVENT_BUFFET, 43000, 0, PHASE_GROUND);
						events.ScheduleEvent(EVENT_FLIGHT, 45000, 0, PHASE_GROUND);
						return;
					case EVENT_BREATH:
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);
						me->SetReactState(REACT_AGGRESSIVE);
						Talk(EMOTE_BREATH);
						DoCastAOE(SPELL_FLAMEBREATH);
						events.CancelEvent(EVENT_BREATH);
						return;
					case EVENT_BUFFET:
						DoCastAOE(SPELL_WINGBUFFET);
						if (Creature* controller = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RAZORSCALE_CONTROL)))
							controller->CastSpell(controller, SPELL_FLAMED, true);
						events.CancelEvent(EVENT_BUFFET);
						return;
					}
				}
			}
			if (phase == PHASE_PERMAGROUND)
			{
				while (uint32 eventId = events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_FLAME:
						DoCastAOE(SPELL_FLAMEBUFFET);
						events.RescheduleEvent(EVENT_FLAME, 10000, 0, PHASE_PERMAGROUND);
						return;
					case EVENT_BREATH:
						Talk(EMOTE_BREATH);
						DoCastVictim(SPELL_FLAMEBREATH);
						events.RescheduleEvent(EVENT_BREATH, urand(13000, 18000), 0, PHASE_PERMAGROUND);
						return;
					case EVENT_FIREBALL:
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
							DoCast(target, SPELL_FIREBALL);
						events.RescheduleEvent(EVENT_FIREBALL, 3000, 0, PHASE_PERMAGROUND);
						return;
					case EVENT_DEVOURING:
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
							DoCast(target, SPELL_DEVOURING_FLAME);
						events.RescheduleEvent(EVENT_DEVOURING, urand(8000, 9000), 0, PHASE_PERMAGROUND);
						return;
					case EVENT_BUFFET:
						DoCastAOE(SPELL_WINGBUFFET);
						events.CancelEvent(EVENT_BUFFET);
						return;
					case EVENT_FUSE:
						DoCastVictim(SPELL_FUSEARMOR);
						events.RescheduleEvent(EVENT_FUSE, 11000, 0, PHASE_PERMAGROUND);
						return;
					}
				}

				DoMeleeAttackIfReady();
			}
			else
			{
				if (uint32 eventId = events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_FIREBALL:
						me->SetOrientation(1.5598f);
						me->SetFacingTo(1.5598f);
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
							DoCast(target, SPELL_FIREBALL);
						events.ScheduleEvent(EVENT_FIREBALL, 3000, 0, PHASE_FLIGHT);
						return;
					case EVENT_DEVOURING:
						if (Unit* target = me->SelectNearestTarget(200.0f, true)) /* It must be casted on the nearest player/pet */
							me->CastSpell(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), SPELL_DEVOURING_FLAME, true);
						events.ScheduleEvent(EVENT_DEVOURING, 9000, 0, PHASE_FLIGHT);
						return;
					case EVENT_SUMMON:
						SummonMoleMachines();
						events.ScheduleEvent(EVENT_SUMMON, 45000, 0, PHASE_FLIGHT);
						return;

					}
				}
			}
		}

			void EnterPermaGround()
		{
			Talk(EMOTE_PERMA);
			phase = PHASE_PERMAGROUND;
			events.SetPhase(PHASE_PERMAGROUND);
			me->SetCanFly(false);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED | UNIT_FLAG_NON_ATTACKABLE);
			me->SetReactState(REACT_AGGRESSIVE);
			me->RemoveAurasDueToSpell(SPELL_HARPOON_TRIGGER);
			me->SetSpeed(MOVE_FLIGHT, 1.0f, true);
			PermaGround = true;
			DoCastAOE(SPELL_FLAMEBREATH);
			events.RescheduleEvent(EVENT_FLAME, 15000, 0, PHASE_PERMAGROUND);
			//events.RescheduleEvent(EVENT_DEVOURING, 15000, 0, PHASE_PERMAGROUND);
			events.RescheduleEvent(EVENT_BREATH, 18000, 0, PHASE_PERMAGROUND);
			events.RescheduleEvent(EVENT_FIREBALL, 3000, 0, PHASE_PERMAGROUND);
			events.RescheduleEvent(EVENT_DEVOURING, 6000, 0, PHASE_PERMAGROUND);
			events.RescheduleEvent(EVENT_BUFFET, 2500, 0, PHASE_PERMAGROUND);
			events.RescheduleEvent(EVENT_FUSE, 5000, 0, PHASE_PERMAGROUND);
		}

		void SummonMoleMachines()
		{
			// Adds will come in waves from mole machines. One mole can spawn a Dark Rune Watcher
			// with 1-2 Guardians, or a lone Sentinel. Up to 4 mole machines can spawn adds at any given time.

			for (uint8 n = 0; n < RAID_MODE(2, 3); n++)
			{
				float x = float(irand(540, 640));       // Safe range is between 500 and 650
				float y = float(irand(-230, -195));     // Safe range is between -235 and -145
				float z = GROUND_Z;
				me->SummonCreature(100000, x, y, z, 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
				me->SetFacingTo(1.5598f);
				me->SetOrientation(1.5598f);
			}
		}

		void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_EVENT_START:

				//Algo como, find nearest player -> entercombat(who) y deja el entercombat(sdadfsda /**/)
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				me->SetReactState(REACT_AGGRESSIVE);

				if (Player* p = me->SelectNearestPlayer(175.0f))
					EnterCombat(p);

				DoZoneInCombat(me, 175.0f);
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_razorscaleAI>(creature);
	}
};

class npc_expedition_commander : public CreatureScript
{
public:
	npc_expedition_commander() : CreatureScript("npc_expedition_commander") { }

	struct npc_expedition_commanderAI : public ScriptedAI
	{
		npc_expedition_commanderAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			Greet = false;
		}

		InstanceScript* instance;
		std::list<uint64> summons;

		bool Greet;
		uint32 AttackStartTimer;
		uint8  Phase;
		ObjectGuid Engineer[4];
		ObjectGuid Defender[4];

		void Reset() override
		{
			AttackStartTimer = 0;
			Phase = 0;
			Greet = false;
			summons.clear();
		}

			void MoveInLineOfSight(Unit* who) override

		{
			if (!Greet && me->IsWithinDistInMap(who, 10.0f) && who->GetTypeId() == TYPEID_PLAYER)
			{
				Talk(SAY_INTRO);
				Greet = true;
			}
		}

			void JustSummoned(Creature* summoned) override
		{
			summons.push_back(summoned->GetGUID());
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_GROUND_PHASE:
				Talk(SAY_GROUND_PHASE);
				break;
			case ACTION_COMMANDER_RESET:
				summons.clear();
				me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				break;
			}
		}

			void UpdateAI(uint32 Diff) override
		{
			if (AttackStartTimer <= Diff)
			{
				switch (Phase)
				{
				case 1:
					instance->SetBossState(BOSS_RAZORSCALE, IN_PROGRESS);
					summons.clear();
					AttackStartTimer = 1000;
					Phase = 2;
					break;
				case 2:
					for (uint8 n = 0; n < RAID_MODE(2, 4); n++)
					{
						if (Creature* summonedEngineer = me->SummonCreature(NPC_ENGINEER, PosEngSpawn, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000))
						{
							summonedEngineer->SetWalk(false);
							summonedEngineer->SetSpeed(MOVE_RUN, 0.5f);
							summonedEngineer->SetHomePosition(PosEngRepair[n]);
							summonedEngineer->GetMotionMaster()->MoveTargetedHome();
							Engineer[n] = summonedEngineer->GetGUID();
						}
					}
					if (Creature* firstSummon = ObjectAccessor::GetCreature(*me, Engineer[0]))
						firstSummon->AI()->Talk(SAY_AGGRO_3);
					Phase = 3;
					AttackStartTimer = 14000;
					break;
				case 3:
					for (uint8 n = 0; n < 4; n++)
					{
						if (Creature* summonedDefender = me->SummonCreature(NPC_DEFENDER, PosDefSpawn[n], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000))
						{
							summonedDefender->SetWalk(false);
							summonedDefender->SetHomePosition(PosDefCombat[n]);
							summonedDefender->GetMotionMaster()->MoveTargetedHome();
							Defender[n] = summonedDefender->GetGUID();
						}
					}
					Phase = 4;
					break;
				case 4:
					for (uint8 n = 0; n < RAID_MODE(2, 4); n++)
						if (Creature* summonedEngineer = ObjectAccessor::GetCreature(*me, Engineer[n]))
							summonedEngineer->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_USE_STANDING);
					for (uint8 n = 0; n < 4; ++n)
						if (Creature* summonedDefender = ObjectAccessor::GetCreature(*me, Defender[n]))
							summonedDefender->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY2H);
					Talk(SAY_AGGRO_2);
					AttackStartTimer = 16000;
					Phase = 5;
					break;
				case 5:
					if (Creature* Razorscale = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_RAZORSCALE)))
					{
						Razorscale->AI()->DoAction(ACTION_EVENT_START);
						me->SetInCombatWith(Razorscale);
					}
					if (Creature* firstEngineer = ObjectAccessor::GetCreature(*me, Engineer[0]))
						firstEngineer->AI()->Talk(SAY_AGGRO_1);
					Phase = 6;
					break;
				}
			}
			else
				AttackStartTimer -= Diff;
		}
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		player->PlayerTalkClass->ClearMenus();
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF:
			player->CLOSE_GOSSIP_MENU();
			CAST_AI(npc_expedition_commanderAI, creature->AI())->Phase = 1;
			break;
		}
		return true;
	}

		bool OnGossipHello(Player* player, Creature* creature) override
	{
		InstanceScript* instance = creature->GetInstanceScript();
		if (instance && instance->GetBossState(BOSS_RAZORSCALE) == NOT_STARTED)
		{
			player->PrepareGossipMenu(creature);

			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			player->SEND_GOSSIP_MENU(13853, creature->GetGUID());
		}
		else
			player->SEND_GOSSIP_MENU(13910, creature->GetGUID());

		return true;
	}

		CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_expedition_commanderAI>(creature);
	}
};

class npc_mole_machine_trigger : public CreatureScript
{
public:
	npc_mole_machine_trigger() : CreatureScript("npc_mole_machine_trigger") { }

	struct npc_mole_machine_triggerAI : public ScriptedAI
	{
		npc_mole_machine_triggerAI(Creature* creature) : ScriptedAI(creature)
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
			SummonNpcTimer = 4000;
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
				switch (RAND(SPELL_SUMMON_IRON_DWARVES, SPELL_SUMMON_IRON_DWARVES_2))
				{
				case SPELL_SUMMON_IRON_DWARVES:
					for (uint8 n = 0; n < urand(1, 2); ++n)
						me->CastSpell(me, SPELL_SUMMON_IRON_DWARVE_GUARDIAN, false);

					me->CastSpell(me, SPELL_SUMMON_IRON_DWARVE_WATCHER, false);
					break;
				case SPELL_SUMMON_IRON_DWARVES_2:
					me->CastSpell(me, SPELL_SUMMON_IRON_VYRKUL_SENTINEL, false);
					break;
				default:
					break;
				}



				NpcSummoned = true;
			}
			else
				SummonNpcTimer -= Diff;

			if (DissapearTimer <= Diff)
			{
				if (GameObject* molemachine = me->FindNearestGameObject(GO_MOLE_MACHINE, 1))
					molemachine->Delete();

				me->DisappearAndDie();
			}
			else
				DissapearTimer -= Diff;
		}

			void JustSummoned(Creature* summoned) override
		{
			summoned->GetMotionMaster()->MoveIdle();
			if (Creature* target = me->FindNearestCreature(NPC_ENGINEER, 300.0f, true))
			{
				summoned->Attack(target, true);
				summoned->GetMotionMaster()->MoveChase(target);
			}

			summoned->AI()->DoZoneInCombat();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_mole_machine_triggerAI(creature);
	}
};

class npc_devouring_flame : public CreatureScript
{
public:
	npc_devouring_flame() : CreatureScript("npc_devouring_flame") { }

	struct npc_devouring_flameAI : public ScriptedAI
	{
		npc_devouring_flameAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED);
		}

		void Reset() override
		{
			DoCast(RAID_MODE(64709, 64734));
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_devouring_flameAI(creature);
	}
};

class npc_darkrune_watcher : public CreatureScript
{
public:
	npc_darkrune_watcher() : CreatureScript("npc_darkrune_watcher") { }

	struct npc_darkrune_watcherAI : public ScriptedAI
	{
		npc_darkrune_watcherAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 ChainTimer;
		uint32 LightTimer;

		void Reset() override
		{
			ChainTimer = urand(3000, 6000);
			LightTimer = urand(1000, 3000);
		}

			void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (ChainTimer <= Diff)
			{
				DoCastVictim(SPELL_CHAIN_LIGHTNING);
				ChainTimer = urand(3000, 7000);
			}
			else
				ChainTimer -= Diff;

			if (LightTimer <= Diff)
			{
				DoCastVictim(SPELL_LIGHTNING_BOLT);
				LightTimer = urand(2000, 4000);
			}
			else
				LightTimer -= Diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_darkrune_watcherAI(creature);
	}
};

class npc_darkrune_guardian : public CreatureScript
{
public:
	npc_darkrune_guardian() : CreatureScript("npc_darkrune_guardian") { }

	struct npc_darkrune_guardianAI : public ScriptedAI
	{
		npc_darkrune_guardianAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 StormTimer;

		void Reset() override
		{
			StormTimer = urand(1000, 3000);
			killedByBreath = false;
		}

			uint32 GetData(uint32 type) const override
		{
			return type == DATA_IRON_DWARF_MEDIUM_RARE ? killedByBreath : 0;
		}

			void SetData(uint32 type, uint32 value) override
		{
			if (type == DATA_IRON_DWARF_MEDIUM_RARE)
			killedByBreath = value;
		}


			void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (StormTimer <= Diff)
			{
				DoCastVictim(SPELL_STORMSTRIKE);
				StormTimer = urand(2000, 4000);
			}
			else
				StormTimer -= Diff;

			DoMeleeAttackIfReady();
		}

	private:
		bool killedByBreath;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_darkrune_guardianAI(creature);
	}
};

class npc_darkrune_sentinel : public CreatureScript
{
public:
	npc_darkrune_sentinel() : CreatureScript("npc_darkrune_sentinel") { }

	struct npc_darkrune_sentinelAI : public ScriptedAI
	{
		npc_darkrune_sentinelAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 HeroicTimer;
		uint32 WhirlTimer;
		uint32 ShoutTimer;

		void Reset() override
		{
			HeroicTimer = urand(4000, 8000);
			WhirlTimer = urand(5000, 7000);
			ShoutTimer = urand(15000, 30000);
		}

			void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (HeroicTimer <= Diff)
			{
				DoCastVictim(SPELL_HEROIC_STRIKE);
				HeroicTimer = urand(2000, 4000);
			}
			else
				HeroicTimer -= Diff;

			if (WhirlTimer <= Diff)
			{
				DoCastVictim(SPELL_WHIRLWIND);
				WhirlTimer = urand(10000, 12000);
			}
			else
				WhirlTimer -= Diff;

			if (ShoutTimer <= Diff)
			{
				DoCast(me, SPELL_BATTLE_SHOUT);
				ShoutTimer = urand(30000, 40000);
			}
			else
				ShoutTimer -= Diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_darkrune_sentinelAI(creature);
	}
};

class spell_razorscale_devouring_flame : public SpellScriptLoader
{
public:
	spell_razorscale_devouring_flame() : SpellScriptLoader("spell_razorscale_devouring_flame") { }

	class spell_razorscale_devouring_flame_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_razorscale_devouring_flame_SpellScript);

		void HandleSummon(SpellEffIndex effIndex)
		{
			PreventHitDefaultEffect(effIndex);
			Unit* caster = GetCaster();
			uint32 entry = uint32(GetSpellInfo()->Effects[effIndex].MiscValue);
			WorldLocation const* summonLocation = GetExplTargetDest();
			if (!caster || !summonLocation)
				return;

			caster->SummonCreature(entry, summonLocation->GetPositionX(), summonLocation->GetPositionY(), GROUND_Z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 20000);
		}

		void Register() override
		{
			OnEffectHit += SpellEffectFn(spell_razorscale_devouring_flame_SpellScript::HandleSummon, EFFECT_0, SPELL_EFFECT_SUMMON);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_razorscale_devouring_flame_SpellScript();
	}
};

class spell_razorscale_flame_breath : public SpellScriptLoader
{
public:
	spell_razorscale_flame_breath() : SpellScriptLoader("spell_razorscale_flame_breath") { }

	class spell_razorscale_flame_breath_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_razorscale_flame_breath_SpellScript);

		void CheckDamage()
		{
			Creature* target = GetHitCreature();
			if (!target || target->GetEntry() != NPC_DARK_RUNE_GUARDIAN)
				return;

			if (GetHitDamage() >= int32(target->GetHealth()))
				target->AI()->SetData(DATA_IRON_DWARF_MEDIUM_RARE, 1);
		}

		void Register() override
		{
			OnHit += SpellHitFn(spell_razorscale_flame_breath_SpellScript::CheckDamage);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_razorscale_flame_breath_SpellScript();
	}
};

class achievement_iron_dwarf_medium_rare : public AchievementCriteriaScript
{
public:
	achievement_iron_dwarf_medium_rare() : AchievementCriteriaScript("achievement_iron_dwarf_medium_rare")
	{
	}

	bool OnCheck(Player* /*player*/, Unit* target) override
	{
		return target && target->IsAIEnabled && target->GetAI()->GetData(DATA_IRON_DWARF_MEDIUM_RARE);
	}
};

class achievement_quick_shave : public AchievementCriteriaScript
{
public:
	achievement_quick_shave() : AchievementCriteriaScript("achievement_quick_shave") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (target)
		if (Creature* razorscale = target->ToCreature())
			if (razorscale->AI()->GetData(DATA_QUICK_SHAVE))
				return true;

		return false;
	}
};

// npc_mole_machine_controller

class npc_mole_machine_controller : public CreatureScript
{
public:
	npc_mole_machine_controller() : CreatureScript("npc_mole_machine_controller") { }

	struct npc_mole_machine_controllerAI : public ScriptedAI
	{
		npc_mole_machine_controllerAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 SummonTimer;
		uint32 CastTimer;

		void Reset() override
		{

			CastTimer = urand(1000, 5000);
			SummonTimer = CastTimer + 3000;
		}

			void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (CastTimer <= Diff)
			{
				DoCast(44210);
				CastTimer = 20000;
			}
			else
				CastTimer -= Diff;

			if (SummonTimer <= Diff)
			{
				if (me->SummonCreature(MOLE_MACHINE_TRIGGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 9000))
					SummonTimer = 20000;
			}
			else
				SummonTimer -= Diff;

		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_mole_machine_controllerAI(creature);
	}
};

// This system is a pure hack, however it does seem to work prety fine for now so, I will improve it in the future.

class npc_razorscale_reset_controller : public CreatureScript
{
public:
	npc_razorscale_reset_controller() : CreatureScript("npc_razorscale_reset_controller") { }

	struct npc_razorscale_reset_controllerAI : public PassiveAI
	{
		npc_razorscale_reset_controllerAI(Creature* creature) : PassiveAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			checking = false;
			instance = me->GetInstanceScript();
		}

		void Reset() override
		{
			checking = false;
		}

			void DoAction(int32 action) override
		{
			if (action == ACTION_DO_START_CHECKING)
			checking = true;
		}

			void DamageTaken(Unit* /*who*/, uint32& damage) override
		{
			if (damage >= me->GetHealth())
			damage = 0;
		}

			void UpdateAI(uint32 diff) override
		{
			if (instance->GetBossState(BOSS_RAZORSCALE) != IN_PROGRESS)
			return;

			if (checking)
			{
				if (Player* player = me->SelectNearestPlayer(100.0f))
				{
					if (player->IsAlive())
						return;
				}

				if (Creature* razorscale = instance->instance->GetCreature(instance->GetGuidData(BOSS_RAZORSCALE)))
				{
					razorscale->AttackStop();
					razorscale->CombatStop();
					razorscale->AI()->Reset();

					checking = false;
					Map* map = me->GetMap();
					if (map && map->IsDungeon())
					{
						std::list<Player*> playerList;
						Map::PlayerList const& players = map->GetPlayers();
						for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
						{
							if (itr->GetSource()->IsAlive() && itr->GetSource()->IsInCombat())
								itr->GetSource()->CombatStop();
						}
					}
				}

			}

		}
	private:
		InstanceScript* instance;
		bool checking;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_razorscale_reset_controllerAI(creature);
	}
};

void AddSC_boss_razorscale()
{
	new boss_razorscale_controller();
	new go_razorscale_harpoon();
	new boss_razorscale();
	new npc_expedition_commander();
	new npc_mole_machine_trigger();
	new npc_devouring_flame();
	new npc_darkrune_watcher();
	new npc_darkrune_guardian();
	new npc_darkrune_sentinel();

	new npc_razorscale_reset_controller();

	new npc_mole_machine_controller();

	new spell_razorscale_devouring_flame();
	new spell_razorscale_flame_breath();
	new achievement_iron_dwarf_medium_rare();
	new achievement_quick_shave();
}
