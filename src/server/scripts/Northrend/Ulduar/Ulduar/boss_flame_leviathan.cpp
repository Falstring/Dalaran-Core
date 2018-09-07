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
#include "ScriptedEscortAI.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CombatAI.h"
#include "PassiveAI.h"
#include "ObjectMgr.h"
#include "SpellInfo.h"
#include "SpellScript.h"
#include "Vehicle.h"
#include "VehicleDefines.h"
#include "ulduar.h"
#include "Spell.h"

enum Spells
{
	SPELL_PURSUED = 62374,
	SPELL_GATHERING_SPEED = 62375,
	SPELL_BATTERING_RAM = 62376,
	SPELL_FLAME_VENTS = 62396,
	SPELL_MISSILE_BARRAGE = 62400,
	SPELL_SYSTEMS_SHUTDOWN = 62475,
	SPELL_OVERLOAD_CIRCUIT = 62399,
	SPELL_START_THE_ENGINE = 62472,
	SPELL_SEARING_FLAME = 62402,
	SPELL_BLAZE = 62292,
	SPELL_TAR_PASSIVE = 62288,
	SPELL_SMOKE_TRAIL = 63575,
	SPELL_ELECTROSHOCK = 62522,
	SPELL_NAPALM = 63666,
	SPELL_INVIS_AND_STEALTH_DETECT = 18950, // Passive
	//TOWER Additional SPELLS
	SPELL_THORIM_S_HAMMER = 62911, // Tower of Storms
	SPELL_MIMIRONS_INFERNO = 62909, // Tower of Flames
	SPELL_HODIR_S_FURY = 62533, // Tower of Frost
	SPELL_FREYAS_WARD = 62906, // Tower of Nature
	SPELL_FREYA_SUMMONS = 62947, // Tower of Nature
	//TOWER ap & health spells
	SPELL_BUFF_TOWER_OF_STORMS = 65076,
	SPELL_BUFF_TOWER_OF_FLAMES = 65075,
	SPELL_BUFF_TOWER_OF_FR0ST = 65077,
	SPELL_BUFF_TOWER_OF_LIFE = 64482,
	//Additional Spells
	SPELL_LASH = 65062,
	SPELL_FREYA_S_WARD_EFFECT_1 = 62947,
	SPELL_FREYA_S_WARD_EFFECT_2 = 62907,
	SPELL_AUTO_REPAIR = 62705,

	SPELL_BLUE_SKYBEAM = 63769,
	SPELL_GREEN_SKYBEAM = 63771,
	SPELL_RED_SKYBEAM = 63772,
	SPELL_LIGHTNING_SKYBEAM = 63773,

	AURA_DUMMY_BLUE = 63294,
	AURA_DUMMY_GREEN = 63295,
	AURA_DUMMY_YELLOW = 63292,

	SPELL_LIQUID_PYRITE = 62494,
	SPELL_DUSTY_EXPLOSION = 63360,
	SPELL_DUST_CLOUD_IMPACT = 54740,
	AURA_STEALTH_DETECTION = 18950,
	SPELL_RIDE_VEHICLE = 46598,
	SPELL_GROUND_SLAM = 62625,

	SPELL_SELF_STUN = 14821
};

enum Creatures
{
	NPC_SEAT = 33114,
	NPC_MECHANOLIFT = 33214,
	NPC_LIQUID = 33189,
	NPC_CONTAINER = 33218,
	NPC_THORIM_BEACON = 33365,
	NPC_MIMIRON_BEACON = 33370,
	NPC_HODIR_BEACON = 33212,
	NPC_FREYA_BEACON = 33367,
	NPC_THORIM_TARGET_BEACON = 33364,
	NPC_MIMIRON_TARGET_BEACON = 33369,
	NPC_HODIR_TARGET_BEACON = 33108,
	NPC_FREYA_TARGET_BEACON = 33366,
	NPC_LOREKEEPER = 33686, // Hard mode starter
	NPC_BRANZ_BRONZBEARD = 33579,
	NPC_DELORAH = 33701,
	NPC_ULDUAR_GAUNTLET_GENERATOR = 33571, // Trigger tied to towers

	NPC_DEFENSE_TURRET = 33142, // bunny
	NPC_OVERLOAD_DEVICE = 33143, // bunny
	NPC_DEFENSE_CANNON = 33139, // bunny
};

enum Towers
{
	GO_TOWER_OF_STORMS = 194377,
	GO_TOWER_OF_FLAMES = 194371,
	GO_TOWER_OF_FROST = 194370,
	GO_TOWER_OF_LIFE = 194375,
};

enum Events
{
	EVENT_PURSUE = 1,
	EVENT_MISSILE = 2,
	EVENT_VENT = 3,
	EVENT_SPEED = 4,
	EVENT_SUMMON = 5,
	EVENT_SHUTDOWN = 6,
	EVENT_REPAIR = 7,
	EVENT_THORIM_S_HAMMER = 8,    // Tower of Storms
	EVENT_MIMIRON_S_INFERNO = 9,    // Tower of Flames
	EVENT_HODIR_S_FURY = 10,   // Tower of Frost
	EVENT_FREYA_S_WARD = 11,   // Tower of Nature
	EVENT_FORCE_NAPALM = 12,
	EVENT_CLEAN_ACCESORIES = 13,

	/* Lorekeeper intro */

	EVENT_START_INTRO_1 = 14,
	EVENT_START_INTRO_2 = 15,
	EVENT_START_INTRO_3 = 16,
	EVENT_START_INTRO_4 = 17,
	EVENT_START_INTRO_5 = 18,
	EVENT_START_INTRO_6 = 19,
	EVENT_START_INTRO_7 = 20,
	EVENT_START_INTRO_8 = 21,
	EVENT_START_INTRO_9 = 22,
	EVENT_START_INTRO_10 = 23,
	EVENT_START_INTRO_11 = 24,
	EVENT_START_INTRO_12 = 25,
	EVENT_START_INTRO_13 = 26,
	EVENT_START_INTRO_14 = 27,

	EVENT_DELLORAH_BRANN_01 = 28,
	EVENT_DELLORAH_BRANN_02 = 29,

	EVENT_BRANN_START_1 = 30,
	EVENT_BRANN_START_2 = 31,
	EVENT_BRANN_START_3 = 32,
	EVENT_BRANN_START_4 = 33,
	EVENT_BRANN_START_5 = 34,
	EVENT_BRANN_START_6 = 35,

	EVENT_REMOVE_SHIELD = 36,

	EVENT_CHECK_IF_VALID_TARGET_ISNEAR = 37,
	EVENT_SUMMON_STEELFORGED_DEFENDERS = 38,

	EVENT_RADIO_PULL_KILL_SAY_LINK = 39,

	EVENT_START_LEVIATHAN_OUTRO = 40,
	EVENT_OUTRO_STEP_1 = 41,
	EVENT_OUTRO_STEP_2 = 42,
	EVENT_OUTRO_STEP_3 = 43,
	EVENT_OUTRO_STEP_4 = 44,
	EVENT_OUTRO_STEP_5 = 45,
	EVENT_OUTRO_STEP_6 = 46,
	EVENT_OUTRO_STEP_7 = 47,
	EVENT_OUTRO_STEP_8 = 48,
	EVENT_OUTRO_STEP_9 = 49,
	EVENT_OUTRO_STEP_10 = 50,
	EVENT_OUTRO_STEP_11 = 51,
};


enum Seats
{
	SEAT_PLAYER = 0,
	SEAT_TURRET = 1,
	SEAT_DEVICE = 2,
	SEAT_CANNON = 7,
};

enum Vehicles
{
	VEHICLE_SIEGE = 33060,
	VEHICLE_CHOPPER = 33062,
	VEHICLE_DEMOLISHER = 33109,
};

enum Misc
{
	DATA_SHUTOUT = 29112912, // 2911, 2912 are achievement IDs
	DATA_ORBIT_ACHIEVEMENTS = 1,
	VEHICLE_SPAWNS = 5,
	FREYA_SPAWNS = 4

};

enum Yells
{
	SAY_AGGRO = 0,
	SAY_SLAY = 1,
	SAY_DEATH = 2,
	SAY_TARGET = 3,
	SAY_HARDMODE = 4,
	SAY_TOWER_NONE = 5,
	SAY_TOWER_FROST = 6,
	SAY_TOWER_FLAME = 7,
	SAY_TOWER_NATURE = 8,
	SAY_TOWER_STORM = 9,
	SAY_PLAYER_RIDING = 10,
	SAY_OVERLOAD = 11,
	EMOTE_PURSUE = 12,
	EMOTE_OVERLOAD = 13,
	EMOTE_REPAIR = 14
};

enum MiscellanousData
{
	// Other Actions are in Ulduar.h
	ACTION_START_HARD_MODE = 5,
	ACTION_SPAWN_VEHICLES = 6,
	ACTION_DELLORAH_HARD_MODE = 7,
	ACTION_BRANN_START = 8,
	ACTION_STOP_EVENTS = 9,
	ACTION_ACTIVATE_RADIO = 10,
	ACTION_ACTIVATE_GAUNTLET = 11,
	ACTION_DO_START_OUTRO = 12,
	// Amount of seats depending on Raid mode
	TWO_SEATS = 2,
	FOUR_SEATS = 4,
};

Position const Center = { 354.8771f, -12.90240f, 409.803650f, 0.0f };


Position const PosSiege[VEHICLE_SPAWNS] =
{
	{ -814.59f, -64.54f, 429.92f, 5.969f },
	{ -784.37f, -33.31f, 429.92f, 5.096f },
	{ -808.99f, -52.10f, 429.92f, 5.668f },
	{ -798.59f, -44.00f, 429.92f, 5.663f },
	{ -812.83f, -77.71f, 429.92f, 0.046f },
};

Position const PosChopper[VEHICLE_SPAWNS] =
{
	{ -717.83f, -106.56f, 430.02f, 0.122f },
	{ -717.83f, -114.23f, 430.44f, 0.122f },
	{ -717.83f, -109.70f, 430.22f, 0.122f },
	{ -718.45f, -118.24f, 430.26f, 0.052f },
	{ -718.45f, -123.58f, 430.41f, 0.085f },
};

Position const PosDemolisher[VEHICLE_SPAWNS] =
{
	{ -724.12f, -176.64f, 430.03f, 2.543f },
	{ -766.70f, -225.03f, 430.50f, 1.710f },
	{ -729.54f, -186.26f, 430.12f, 1.902f },
	{ -756.01f, -219.23f, 430.50f, 2.369f },
	{ -798.01f, -227.24f, 429.84f, 1.446f },
};

// After wipe 
Position const PosSiegeWipe[5] =
{
	{ 164.917f, 47.1702f, 409.80f, 6.28f },
	{ 164.917f, 35.66f, 409.80f, 6.28f },
	{ 164.917f, 23.66f, 409.80f, 6.28f },
	{ 164.917f, 11.66f, 409.80f, 6.28f },
	{ 164.917f, -1.66f, 409.80f, 6.28f },
};

Position const PosChopperWipe[5] =
{
	{ 164.917f, -58.48f, 409.80f, 6.28f },
	{ 164.917f, -62.48f, 409.80f, 6.28f },
	{ 164.917f, -66.48f, 409.80f, 6.28f },
	{ 164.917f, -70.48f, 409.80f, 6.28f },
	{ 164.917f, -74.48f, 409.80f, 6.28f },

};

Position const PosDemolisherWipe[5] =
{
	{ 164.917f, -12.48f, 409.80f, 6.28f },
	{ 164.917f, -22.48f, 409.80f, 6.28f },
	{ 164.917f, -32.48f, 409.80f, 6.28f },
	{ 164.917f, -42.48f, 409.80f, 6.28f },
	{ 164.917f, -52.48f, 409.80f, 6.28f },

};

Position const FreyaBeacons[FREYA_SPAWNS] =
{
	{ 377.02f, -119.10f, 409.81f, 0.0f },
	{ 185.62f, -119.10f, 409.81f, 0.0f },
	{ 377.02f, 54.78f, 409.81f, 0.0f },
	{ 185.62f, 54.78f, 409.81f, 0.0f },
};


Position const Misc[] =
{
	{ 266.689f, -33.391f, 409.99f, 0.0f },    // Thorim Beacon bunnys
	{ 379.158f, -33.318f, 409.81f, 0.0f },
	{ 266.611f, -133.387f, 409.81f, 0.0f },
	{ 158.411f, -33.311f, 409.81f, 0.0f },
	{ 266.699f, 66.632f, 409.81f, 0.0f }
};

Position const InfernoStart =
{
	390.93f, -13.91f, 409.81f, 0.0f
};

Position const brannFlyingMachinelandPos =
{
	279.37f, -81.15f, 409.803f
};

Position const rhydianOutroPos =
{
	280.05f, -121.56f, 409.803f, 1.56f
};

Position const outroBattleMagesPos[2] =
{
	{ 274.84f, -139.80f, 409.803f, 0.07f },
	{ 285.84f, -139.80f, 409.803f, 3.164f }
};



#define KIRIN_TOR_MAGES_OUTRO 20

Position const magePos[KIRIN_TOR_MAGES_OUTRO] =
{
	{ 296.079f, -125.024f, 409.80f, 1.58f },
	{ 300.079f, -125.024f, 409.80f, 1.58f },
	{ 304.079f, -125.024f, 409.80f, 1.58f },
	{ 308.079f, -125.024f, 409.80f, 1.58f },
	{ 312.079f, -125.024f, 409.80f, 1.58f },

	{ 296.079f, -120.024f, 409.80f, 1.58f },
	{ 300.079f, -120.024f, 409.80f, 1.58f },
	{ 304.079f, -120.024f, 409.80f, 1.58f },
	{ 308.079f, -120.024f, 409.80f, 1.58f },
	{ 312.079f, -120.024f, 409.80f, 1.58f },

	{ 266.079f, -125.024f, 409.80f, 1.58f },
	{ 262.079f, -125.024f, 409.80f, 1.58f },
	{ 258.079f, -125.024f, 409.80f, 1.58f },
	{ 254.079f, -125.024f, 409.80f, 1.58f },
	{ 250.079f, -125.024f, 409.80f, 1.58f },

	{ 266.079f, -120.024f, 409.80f, 1.58f },
	{ 262.079f, -120.024f, 409.80f, 1.58f },
	{ 258.079f, -120.024f, 409.80f, 1.58f },
	{ 254.079f, -120.024f, 409.80f, 1.58f },
	{ 250.079f, -120.024f, 409.80f, 1.58f },

};

#define EXPEDITIONERS_OUTRO 10

Position const expeditionersPos[KIRIN_TOR_MAGES_OUTRO] =
{
	{ 246.079f, -99.024f, 409.80f, 4.72f },
	{ 242.079f, -99.024f, 409.80f, 4.72f },
	{ 238.079f, -99.024f, 409.80f, 4.72f },
	{ 234.079f, -99.024f, 409.80f, 4.72f },
	{ 230.079f, -99.024f, 409.80f, 4.72f },

	{ 246.079f, -104.024f, 409.80f, 4.72f },
	{ 242.079f, -104.024f, 409.80f, 4.72f },
	{ 238.079f, -104.024f, 409.80f, 4.72f },
	{ 234.079f, -104.024f, 409.80f, 4.72f },
	{ 230.079f, -104.024f, 409.80f, 4.72f },

};

class boss_flame_leviathan : public CreatureScript
{
public:
	boss_flame_leviathan() : CreatureScript("boss_flame_leviathan") { }

	struct boss_flame_leviathanAI : public BossAI
	{
		boss_flame_leviathanAI(Creature* creature) : BossAI(creature, BOSS_LEVIATHAN), vehicle(creature->GetVehicleKit())
		{
		}

		void InitializeAI() override
		{
			ASSERT(vehicle);
			if (!me->isDead())
				Reset();

			Shutdown = 0;
			ActiveTowers = false;
			towerOfStorms = false;
			towerOfLife = false;
			towerOfFlames = false;
			towerOfFrost = false;
			Shutout = true;
			Unbroken = true;
			hasWiped = false;

			DoCast(SPELL_INVIS_AND_STEALTH_DETECT);

			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
			me->SetReactState(REACT_PASSIVE);
		}

		Vehicle* vehicle;
		uint8 ActiveTowersCount;
		uint8 Shutdown;
		bool ActiveTowers;
		bool towerOfStorms;
		bool towerOfLife;
		bool towerOfFlames;
		bool towerOfFrost;
		bool Shutout;
		bool Unbroken;

		bool hasWiped;

		void DespawnVehicles(uint32 vehicleID)
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, vehicleID, 800.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(800.0f, searcher);

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
			_Reset();
			//resets shutdown counter to 0.  2 or 4 depending on raid mode
			Shutdown = 0;
			//_pursueTarget = 0;

			me->SetReactState(REACT_DEFENSIVE);
			//DoCast(SPELL_SYSTEMS_SHUTDOWN);

			// Vehicle Reset procedure.

			HandleAccessorys(true);

			ActiveTowersCount = 0;

			if (hasWiped)
			{
				DespawnVehicles(VEHICLE_DEMOLISHER);
				DespawnVehicles(VEHICLE_SIEGE);
				DespawnVehicles(VEHICLE_CHOPPER);

				/* Spawn the Vehicles in the new zone, near Flame Leviathan.  */

				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_SIEGE, PosSiegeWipe[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);

				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_CHOPPER, PosChopperWipe[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);

				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_DEMOLISHER, PosDemolisherWipe[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);

			}
		}

			void HandleAccessorys(bool doInstall)
		{
			if (doInstall)
			{
				// Seats
				for (uint8 i = RAID_MODE(2, 0); i < 4; ++i)
				{
					if (Creature* seat = me->SummonCreature(NPC_SEAT, *me))
					{
						if (Creature* turret = me->SummonCreature(NPC_DEFENSE_TURRET, *me))
							turret->EnterVehicle(seat, SEAT_TURRET);

						/*if (Creature* device = me->SummonCreature(NPC_OVERLOAD_DEVICE, *me))
						device->EnterVehicle(seat, SEAT_DEVICE);*/

						seat->EnterVehicle(me, i);
					}

					// Cannon
					/*if (Creature* cannon = me->SummonCreature(NPC_DEFENSE_CANNON, *me))
					cannon->EnterVehicle(me, SEAT_CANNON);*/
				}
			}
			else
			{
				for (uint8 i = 0; i < 4; ++i)
				{
					if (Unit* seat = vehicle->GetPassenger(i))
					{
						if (seat->ToCreature() && seat->GetVehicleKit())
						{
							if (Unit* turret = seat->GetVehicleKit()->GetPassenger(SEAT_TURRET))
								if (Creature* c = turret->ToCreature())
									c->DespawnOrUnsummon(1 * IN_MILLISECONDS);

							if (Unit* device = seat->GetVehicleKit()->GetPassenger(SEAT_DEVICE))
								if (Creature* c = device->ToCreature())
									c->DespawnOrUnsummon(1 * IN_MILLISECONDS);

							seat->ToCreature()->DespawnOrUnsummon(0.5*IN_MILLISECONDS);
						}

						// Cannon
						if (Unit* cannon = vehicle->GetPassenger(SEAT_CANNON))
							if (Creature* c = cannon->ToCreature())
								c->DespawnOrUnsummon(0.5*IN_MILLISECONDS);
					}
				}
			}
		}


		void EnterCombat(Unit* who) override
		{
			me->SetReactState(REACT_AGGRESSIVE);
			hasWiped = true;
			Talk(SAY_AGGRO);
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, 33139, 200.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(400.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
				{
					(*i)->DespawnOrUnsummon();
				}

			}

			if (Creature* cannon = me->SummonCreature(NPC_DEFENSE_CANNON, *me))
				cannon->EnterVehicle(me, SEAT_CANNON);

			me->SetLootMode(LOOT_MODE_DEFAULT);

			//me->Attack(who, false);

			_EnterCombat();
			events.ScheduleEvent(EVENT_PURSUE, 800);
			events.ScheduleEvent(EVENT_MISSILE, urand(1500, 4 * IN_MILLISECONDS));
			events.ScheduleEvent(EVENT_VENT, 20 * IN_MILLISECONDS);

			if (ActiveTowers)
				events.ScheduleEvent(EVENT_SHUTDOWN, 65 * IN_MILLISECONDS);

			events.ScheduleEvent(EVENT_SPEED, 2 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_SUMMON, 1 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_FORCE_NAPALM, 10 * IN_MILLISECONDS);
			ActiveTower();

			//std::cout << "Active Towers count" << int(ActiveTowersCount) << " \n";
			switch (ActiveTowersCount)
			{
			case 4:
				me->AddLootMode(LOOT_MODE_HARD_MODE_4);
				break;
			case 3:
				me->AddLootMode(LOOT_MODE_HARD_MODE_3);
				break;
			case 2:
				break;
			case 1:
				break;
			default:
				break;

			}
		}

			void ActiveTower()
		{
			if (ActiveTowers)
			{
				if (towerOfStorms)
				{
					ActiveTowersCount++;
					me->AddAura(SPELL_BUFF_TOWER_OF_STORMS, me);
					events.ScheduleEvent(EVENT_THORIM_S_HAMMER, 30 * IN_MILLISECONDS);
				}

				if (towerOfFlames)
				{
					ActiveTowersCount++;
					me->AddAura(SPELL_BUFF_TOWER_OF_FLAMES, me);
					events.ScheduleEvent(EVENT_MIMIRON_S_INFERNO, 59 * IN_MILLISECONDS);
				}

				if (towerOfFrost)
				{
					ActiveTowersCount++;
					me->AddAura(SPELL_BUFF_TOWER_OF_FR0ST, me);
					me->AddAura(65079, me);
					events.ScheduleEvent(EVENT_HODIR_S_FURY, 75 * IN_MILLISECONDS);
				}

				if (towerOfLife)
				{
					ActiveTowersCount++;
					me->AddAura(SPELL_BUFF_TOWER_OF_LIFE, me);
					events.ScheduleEvent(EVENT_FREYA_S_WARD, 100 * IN_MILLISECONDS);
				}

				if (!towerOfLife && !towerOfFrost && !towerOfFlames && !towerOfStorms)
					Talk(SAY_TOWER_NONE);
				else
					Talk(SAY_HARDMODE);
			}
			else
				Talk(SAY_AGGRO);
		}

		/*void DamageTaken(Unit* attacker, uint32 &damage) override
		{
		if (damage >= me->GetHealth())
		{
		Talk(SAY_DEATH);
		if (Creature* outroController = me->FindNearestCreature(225158, 250.0f))
		outroController->AI()->DoAction(ACTION_DO_START_OUTRO);

		me->RemoveAllAuras();
		instance->SetBossState(BOSS_LEVIATHAN, DONE);
		}
		}*/

		void JustDied(Unit* /*killer*/) override
		{
			Talk(SAY_DEATH);
			me->RemoveAllAuras();

			if (Player* player = me->SelectNearestPlayer(100.0f))
				me->GetMap()->ToInstanceMap()->PermBindAllPlayers(player);

			if (Creature* outroController = me->FindNearestCreature(225158, 250.0f))
				outroController->AI()->DoAction(ACTION_DO_START_OUTRO);

			instance->SetBossState(BOSS_LEVIATHAN, DONE);


			_JustDied();
			// Set Field Flags 67108928 = 64 | 67108864 = UNIT_FLAG_UNK_6 | UNIT_FLAG_SKINNABLE
			// Set DynFlags 12
			// Set NPCFlags 0

		}

			void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_START_THE_ENGINE)
			vehicle->InstallAllAccessories(false);

			if (spell->Id == SPELL_ELECTROSHOCK)
				me->InterruptSpell(CURRENT_CHANNELED_SPELL);

			if (spell->Id == SPELL_OVERLOAD_CIRCUIT)
				++Shutdown;
		}

			uint32 GetData(uint32 type) const override
		{
			switch (type)
			{
			case DATA_SHUTOUT:
				return Shutout ? 1 : 0;
			case DATA_UNBROKEN:
				return Unbroken ? 1 : 0;
			case DATA_ORBIT_ACHIEVEMENTS:
				if (ActiveTowers) // Only on HardMode
					return ActiveTowersCount;
			default:
				break;
			}

			return 0;
		}

			void SetData(uint32 id, uint32 data) override
		{
			if (id == DATA_UNBROKEN)
			Unbroken = data ? true : false;
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || !CheckInRoom())
			return;

			events.Update(diff);

			/*if (Shutdown == RAID_MODE(TWO_SEATS, FOUR_SEATS))
			{
			Shutdown = 0;
			events.ScheduleEvent(EVENT_SHUTDOWN, 4000);
			me->RemoveAurasDueToSpell(SPELL_OVERLOAD_CIRCUIT);
			me->InterruptNonMeleeSpells(true);
			return;
			}*/

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PURSUE:
					Talk(SAY_TARGET);
					DoCast(SPELL_PURSUED);  // Will select target in spellscript
					events.ScheduleEvent(EVENT_PURSUE, 35 * IN_MILLISECONDS);
					break;
				case EVENT_MISSILE:
					DoCast(me, SPELL_MISSILE_BARRAGE, true);
					events.ScheduleEvent(EVENT_MISSILE, 2 * IN_MILLISECONDS);
					break;
				case EVENT_FORCE_NAPALM:
					if (Creature* cannon = me->FindNearestCreature(NPC_DEFENSE_CANNON, 10.0f, true))
					{
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
							cannon->AI()->DoCast(target, SPELL_NAPALM);
					}
					else
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f))
						{
						DoCast(target, SPELL_NAPALM);
						HandleAccessorys(true);
						}


					events.ScheduleEvent(EVENT_FORCE_NAPALM, 10 * IN_MILLISECONDS);
					break;
				case EVENT_VENT:
					DoCastAOE(SPELL_FLAME_VENTS);
					events.ScheduleEvent(EVENT_VENT, 35 * IN_MILLISECONDS);
					break;
				case EVENT_SPEED:
					DoCastAOE(SPELL_GATHERING_SPEED);
					events.ScheduleEvent(EVENT_SPEED, 9 * IN_MILLISECONDS);
					break;
				case EVENT_SUMMON:
					//if (summons.size() < 15) /* Revisar ésto para que spawnee más. */
					if (Creature* lift = DoSummonFlyer(NPC_MECHANOLIFT, me, 30.0f, 50.0f, 0))
						lift->GetMotionMaster()->MoveRandom(100);
					events.ScheduleEvent(EVENT_SUMMON, 12 * IN_MILLISECONDS);
					break;
				case EVENT_SHUTDOWN:
					Talk(SAY_OVERLOAD);
					Talk(EMOTE_OVERLOAD);
					me->StopMoving();

					me->InterruptNonMeleeSpells(true);
					me->CastSpell(me, SPELL_SYSTEMS_SHUTDOWN, true);
					if (Shutout)
						Shutout = false;

					events.DelayEvents(21000 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_REPAIR, 20000);
					break;
				case EVENT_REPAIR:
					Talk(EMOTE_REPAIR);

					me->RemoveAura(42716);
					me->ClearUnitState(UNIT_STATE_STUNNED | UNIT_STATE_ROOT);
					//events.RescheduleEvent(EVENT_PURSUE, 1000);

					events.RescheduleEvent(EVENT_PURSUE, 500);
					events.RescheduleEvent(EVENT_MISSILE, urand(1000, 3 * IN_MILLISECONDS));
					events.RescheduleEvent(EVENT_VENT, 20 * IN_MILLISECONDS);

					if (ActiveTowers)
						events.RescheduleEvent(EVENT_SHUTDOWN, 90 * IN_MILLISECONDS);

					events.RescheduleEvent(EVENT_SPEED, 12 * IN_MILLISECONDS);
					events.RescheduleEvent(EVENT_SUMMON, 3 * IN_MILLISECONDS);
					events.RescheduleEvent(EVENT_FORCE_NAPALM, 10 * IN_MILLISECONDS);
					events.RescheduleEvent(EVENT_CLEAN_ACCESORIES, 2000);

					break;
				case EVENT_CLEAN_ACCESORIES:
				{
					std::list<Creature*> pCreatureList;

					Trinity::AllCreaturesOfEntryInRange checker(me, NPC_DEFENSE_TURRET, 200.0f);
					Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

					me->VisitNearbyObject(400.0f, searcher);

					if (pCreatureList.empty())
						return;

					if (!pCreatureList.empty())
					{
						for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
						{
							(*i)->DespawnOrUnsummon();
						}

					}

					std::list<Creature*> pCreatureList2;

					Trinity::AllCreaturesOfEntryInRange checker2(me, 33139, 200.0f);
					Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher2(me, pCreatureList2, checker2);

					me->VisitNearbyObject(400.0f, searcher2);

					if (pCreatureList2.empty())
						return;

					if (!pCreatureList2.empty())
					{
						for (std::list<Creature*>::iterator i = pCreatureList2.begin(); i != pCreatureList2.end(); ++i)
						{
							(*i)->DespawnOrUnsummon();
						}

					}
					if (Creature* cannon = me->SummonCreature(NPC_DEFENSE_CANNON, *me))
						cannon->EnterVehicle(me, SEAT_CANNON);
				}
					break;
				case EVENT_THORIM_S_HAMMER: // Tower of Storms
					for (uint8 i = 0; i < RAID_MODE(9, 16); ++i)
					{
						Position pos = Misc[0];
						pos.m_positionX += frand(-100, 105);
						pos.m_positionY += frand(-95, 95);
						if (Creature* thorim = DoSummon(NPC_THORIM_BEACON, pos))
						{
							thorim->AI()->DoCast(SPELL_LIGHTNING_SKYBEAM);
						}

					}
					Talk(SAY_TOWER_STORM);
					events.RescheduleEvent(EVENT_THORIM_S_HAMMER, 45000);
					break;
				case EVENT_MIMIRON_S_INFERNO: // Tower of Flames
					me->SummonCreature(NPC_MIMIRON_BEACON, InfernoStart);
					Talk(SAY_TOWER_FLAME);
					events.CancelEvent(EVENT_MIMIRON_S_INFERNO);
					break;
				case EVENT_HODIR_S_FURY:      // Tower of Frost
					for (uint8 i = 0; i < RAID_MODE(2, 8); ++i)
					{
						if (Creature* hodir = DoSummon(NPC_HODIR_BEACON, me, 90, 0))
						{
							hodir->AI()->DoCast(SPELL_BLUE_SKYBEAM);
							//hodir->GetMotionMaster()->MoveRandom(100);
						}

					}
					Talk(SAY_TOWER_FROST);
					events.CancelEvent(EVENT_HODIR_S_FURY);
					break;
				case EVENT_FREYA_S_WARD:    // Tower of Nature
					Talk(SAY_TOWER_NATURE);
					for (int32 i = 0; i < 4; ++i)
						me->SummonCreature(NPC_FREYA_BEACON, FreyaBeacons[i]);

					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
						DoCast(target, SPELL_FREYAS_WARD);
					events.CancelEvent(EVENT_FREYA_S_WARD);
					break;
				case EVENT_START_LEVIATHAN_OUTRO:
					// get the controller and do action start outro.
					break;
				}
			}

			DoBatteringRamIfReady();
		}

			void SpellHitTarget(Unit* target, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_PURSUED)
			{
				_pursueTarget = target->GetGUID();
				// Force threat handling

				/*DoResetThreat();
				me->getThreatManager().doAddThreat(target, std::numeric_limits<float>::max());
				me->GetMotionMaster()->MoveChase(target);*/

				/*if (Player* player = target->GetCharmerOrOwnerPlayerOrPlayerItself())
				Talk(EMOTE_PURSUE, player);*/
			}
		}

			void DoAction(int32 action) override
		{
			if (action && action <= 4) // Tower destruction, debuff leviathan loot and reduce active tower count
			{
				//--ActiveTowersCount;
				/*if (ActiveTowersCount == 4)
				{
				me->AddLootMode(16);
				--ActiveTowersCount;
				}
				if (ActiveTowersCount == 3)
				{

				--ActiveTowersCount;
				}
				if (ActiveTowersCount == 2)
				{

				--ActiveTowersCount;
				}
				if (ActiveTowersCount == 1)
				{
				--ActiveTowersCount;
				}*/
			}

			switch (action)
			{
			case ACTION_TOWER_OF_STORM_DESTROYED:
				towerOfStorms = false;
				break;
			case ACTION_TOWER_OF_FROST_DESTROYED:
				towerOfFrost = false;
				break;
			case ACTION_TOWER_OF_FLAMES_DESTROYED:
				towerOfFlames = false;
				break;
			case ACTION_TOWER_OF_LIFE_DESTROYED:
				towerOfLife = false;
				break;
			case ACTION_START_HARD_MODE:  // Activate hard-mode enable all towers, apply buffs on leviathan
				ActiveTowers = true;
				towerOfStorms = true;
				towerOfLife = true;
				towerOfFlames = true;
				towerOfFrost = true;
				//me->SetLootMode(LOOT_MODE_DEFAULT | LOOT_MODE_HARD_MODE_1 | LOOT_MODE_HARD_MODE_2 | LOOT_MODE_HARD_MODE_3 | LOOT_MODE_HARD_MODE_4);
				break;
			case ACTION_MOVE_TO_CENTER_POSITION: // Triggered by 2 Collossus near door
				if (!me->isDead())
				{
					me->AI()->DoCast(SPELL_SYSTEMS_SHUTDOWN);
					me->SetReactState(REACT_AGGRESSIVE);
					me->SetHomePosition(Center);
					me->GetMotionMaster()->MoveCharge(242.37f, -10.10f, Center.GetPositionZ()); // position center					
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);

					return;
				}
				break;
			default:
				break;
			}
		}

	private:
		//! Copypasta from DoSpellAttackIfReady, only difference is the target - it cannot be selected trough getVictim this way -
		//! I also removed the spellInfo check
		void DoBatteringRamIfReady()
		{
			if (me->isAttackReady())
			{
				Unit* target = ObjectAccessor::GetUnit(*me, _pursueTarget);
				if (me->IsWithinCombatRange(target, 30.0f))
				{
					DoCast(target, SPELL_BATTERING_RAM);
					me->resetAttackTimer();
				}
			}
		}

		ObjectGuid _pursueTarget;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_flame_leviathanAI>(creature);
	}
};

class boss_flame_leviathan_seat : public CreatureScript
{
public:
	boss_flame_leviathan_seat() : CreatureScript("boss_flame_leviathan_seat") { }

	struct boss_flame_leviathan_seatAI : public ScriptedAI
	{
		boss_flame_leviathan_seatAI(Creature* creature) : ScriptedAI(creature), vehicle(creature->GetVehicleKit())
		{
			ASSERT(vehicle);
			me->SetReactState(REACT_PASSIVE);
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			instance = creature->GetInstanceScript();
		}

		InstanceScript* instance;
		Vehicle* vehicle;

		void PassengerBoarded(Unit* who, int8 seatId, bool apply) override
		{
			if (!me->GetVehicle())
			return;

			if (seatId == SEAT_PLAYER)
			{
				if (!apply)
					return;
				else if (Creature* leviathan = me->GetVehicleCreatureBase())
					leviathan->AI()->Talk(SAY_PLAYER_RIDING);

				if (Creature* turret = me->GetVehicleKit()->GetPassenger(SEAT_TURRET)->ToCreature())
				{
					turret->setFaction(me->GetVehicleBase()->getFaction());
					turret->SetUInt32Value(UNIT_FIELD_FLAGS, 0); // unselectable
					turret->AI()->AttackStart(who);
				}
				if (Creature* device = me->GetVehicleKit()->GetPassenger(SEAT_DEVICE)->ToCreature())
				{
					device->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					device->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}

				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			}
			else if (seatId == SEAT_TURRET)
			{
				if (apply)
					return;

				if (Unit* device = vehicle->GetPassenger(SEAT_DEVICE))
				{
					device->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					device->SetUInt32Value(UNIT_FIELD_FLAGS, 0); // unselectable
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<boss_flame_leviathan_seatAI>(creature);
	}
};

class boss_flame_leviathan_defense_cannon : public CreatureScript
{
public:
	boss_flame_leviathan_defense_cannon() : CreatureScript("boss_flame_leviathan_defense_cannon") { }

	struct boss_flame_leviathan_defense_cannonAI : public ScriptedAI
	{
		boss_flame_leviathan_defense_cannonAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		uint32 NapalmTimer;

		void Reset() override
		{
			NapalmTimer = 5 * IN_MILLISECONDS;
			DoCast(me, AURA_STEALTH_DETECTION);
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (NapalmTimer <= diff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
					if (CanAIAttack(target))
						DoCast(target, SPELL_NAPALM, true);

				NapalmTimer = 5000;
			}
			else
				NapalmTimer -= diff;
		}

			bool CanAIAttack(Unit const* who) const override
		{
			if (who->GetTypeId() != TYPEID_PLAYER || !who->GetVehicle() || who->GetVehicleBase()->GetEntry() == NPC_SEAT)
			return false;
			return true;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new boss_flame_leviathan_defense_cannonAI(creature);
	}
};

class boss_flame_leviathan_defense_turret : public CreatureScript
{
public:
	boss_flame_leviathan_defense_turret() : CreatureScript("boss_flame_leviathan_defense_turret") { }

	struct boss_flame_leviathan_defense_turretAI : public TurretAI
	{
		boss_flame_leviathan_defense_turretAI(Creature* creature) : TurretAI(creature) { }

		void DamageTaken(Unit* who, uint32 &damage) override
		{
			if (!CanAIAttack(who))
			damage = 0;
		}

			bool CanAIAttack(Unit const* who) const override
		{
			if (who->GetTypeId() != TYPEID_PLAYER || !who->GetVehicle() || who->GetVehicleBase()->GetEntry() != NPC_SEAT)
			return false;
			return true;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new boss_flame_leviathan_defense_turretAI(creature);
	}
};

class boss_flame_leviathan_overload_device : public CreatureScript
{
public:
	boss_flame_leviathan_overload_device() : CreatureScript("boss_flame_leviathan_overload_device") { }

	struct boss_flame_leviathan_overload_deviceAI : public PassiveAI
	{
		boss_flame_leviathan_overload_deviceAI(Creature* creature) : PassiveAI(creature)
		{
		}

		void OnSpellClick(Unit* /*clicker*/, bool& result) override
		{
			if (!result)
			return;

			if (me->GetVehicle())
			{
				me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

				if (Unit* player = me->GetVehicle()->GetPassenger(SEAT_PLAYER))
				{
					me->GetVehicleBase()->CastSpell(player, SPELL_SMOKE_TRAIL, true);
					player->GetMotionMaster()->MoveKnockbackFrom(me->GetVehicleBase()->GetPositionX(), me->GetVehicleBase()->GetPositionY(), 30, 30);
					player->ExitVehicle();
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new boss_flame_leviathan_overload_deviceAI(creature);
	}
};

class boss_flame_leviathan_safety_container : public CreatureScript
{
public:
	boss_flame_leviathan_safety_container() : CreatureScript("boss_flame_leviathan_safety_container") { }

	struct boss_flame_leviathan_safety_containerAI : public PassiveAI
	{
		boss_flame_leviathan_safety_containerAI(Creature* creature) : PassiveAI(creature)
		{
		}

		void JustDied(Unit* /*killer*/) override
		{
			float x, y, z;
			me->GetPosition(x, y, z);
			z = me->GetMap()->GetHeight(me->GetPhaseMask(), x, y, z);
			me->GetMotionMaster()->MovePoint(0, x, y, z);
			me->SetPosition(x, y, z, 0);
		}

			void UpdateAI(uint32 /*diff*/) override
		{
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new boss_flame_leviathan_safety_containerAI(creature);
	}
};

class npc_mechanolift : public CreatureScript
{
public:
	npc_mechanolift() : CreatureScript("npc_mechanolift") { }

	struct npc_mechanoliftAI : public PassiveAI
	{
		npc_mechanoliftAI(Creature* creature) : PassiveAI(creature)
		{
			ASSERT(me->GetVehicleKit());
		}

		uint32 MoveTimer;

		void Reset() override
		{
			MoveTimer = 0;
			me->GetMotionMaster()->MoveRandom(50);
		}

			void JustDied(Unit* /*killer*/) override
		{
			me->GetMotionMaster()->MoveTargetedHome();
			DoCast(SPELL_DUSTY_EXPLOSION);
			Creature* liquid = DoSummon(NPC_LIQUID, me, 0);
			if (liquid)
			{
				liquid->CastSpell(liquid, SPELL_LIQUID_PYRITE, true);
				liquid->CastSpell(liquid, SPELL_DUST_CLOUD_IMPACT, true);
			}
		}

			void MovementInform(uint32 type, uint32 id) override
		{
			if (type == POINT_MOTION_TYPE && id == 1)
			if (Creature* container = me->FindNearestCreature(NPC_CONTAINER, 5, true))
				container->EnterVehicle(me);
		}

			void UpdateAI(uint32 diff) override
		{
			if (MoveTimer <= diff)
			{
				if (me->GetVehicleKit()->HasEmptySeat(-1))
				{
					Creature* container = me->FindNearestCreature(NPC_CONTAINER, 50, true);
					if (container && !container->GetVehicle())
						me->GetMotionMaster()->MovePoint(1, container->GetPositionX(), container->GetPositionY(), container->GetPositionZ());
				}

				MoveTimer = 30000; //check next 30 seconds
			}
			else
				MoveTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_mechanoliftAI(creature);
	}
};

class npc_pool_of_tar : public CreatureScript
{
public:
	npc_pool_of_tar() : CreatureScript("npc_pool_of_tar") { }

	struct npc_pool_of_tarAI : public ScriptedAI
	{
		npc_pool_of_tarAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_PASSIVE);
			me->CastSpell(me, SPELL_TAR_PASSIVE, true);
		}

		void DamageTaken(Unit* /*who*/, uint32& damage) override
		{
			damage = 0;
		}

			void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
		{
			if (spell->SchoolMask & SPELL_SCHOOL_MASK_FIRE && !me->HasAura(SPELL_BLAZE))
			me->CastSpell(me, SPELL_BLAZE, true);
		}

			void UpdateAI(uint32 /*diff*/) override{}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_pool_of_tarAI(creature);
	}
};



class npc_colossus : public CreatureScript
{
public:
	npc_colossus() : CreatureScript("npc_colossus") {}

	struct npc_colossusAI : public ScriptedAI
	{
		npc_colossusAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = creature->GetInstanceScript();
		}

		void Reset()
		{
			groundSlamTimer = urand(8 * IN_MILLISECONDS, 10 * IN_MILLISECONDS);
		}

		void JustDied(Unit* /*killer*/) override
		{
			if (me->GetHomePosition().IsInDist(&Center, 50.f))
			instance->SetData(DATA_COLOSSUS, instance->GetData(DATA_COLOSSUS) + 1);
		}

			void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (groundSlamTimer <= diff)
			{
				DoCastVictim(SPELL_GROUND_SLAM);
				groundSlamTimer = urand(20 * IN_MILLISECONDS, 25 * IN_MILLISECONDS);
			}
			else
				groundSlamTimer -= diff;

			DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* instance;
		uint32 groundSlamTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_colossusAI>(creature);
	}
};


class npc_thorims_hammer : public CreatureScript
{
public:
	npc_thorims_hammer() : CreatureScript("npc_thorims_hammer") { }

	struct npc_thorims_hammerAI : public ScriptedAI
	{
		npc_thorims_hammerAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetReactState(REACT_DEFENSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			summonOrb = urand(2000, 18000);
			castSpell = 20000;
		}

		void UpdateAI(uint32 diff) override
		{
			if (!me->HasAura(AURA_DUMMY_BLUE))
			me->CastSpell(me, AURA_DUMMY_BLUE, true);

			if (summonOrb <= diff)
			{
				if (trigger = DoSummonFlyer(NPC_THORIM_TARGET_BEACON, me, 25.0f, 0, 2000, TEMPSUMMON_TIMED_DESPAWN))
				{
					trigger->AI()->DoCast(me, 62911);

					trigger->SetDisplayId(trigger->GetCreatureTemplate()->Modelid2);
					castSpell = 1300;
					//trigger->SetObjectScale(1);

				}
				//DoCastAOE(62912);
				/*if (canHit && who->IsVehicle() && me->IsInRange(who, 0.0f, 6.0f, true))
				{
				//if (Creature* trigger = DoSummonFlyer(NPC_THORIM_TARGET_BEACON, me, 0, 0, 1000, TEMPSUMMON_TIMED_DESPAWN))
				//me->DealDamage(who, 150000, (const CleanDamage*)0, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NATURE);
				//trigger->CastSpell(who, SPELL_THORIM_S_HAMMER, true);
				}*/

				summonOrb = 30000;
			}
			else
				summonOrb -= diff;

			if (castSpell <= diff)
			{

				me->DespawnOrUnsummon(1000);
				castSpell = 30000;
			}
			else
				castSpell -= diff;


			UpdateVictim(); //62912

		}
	private:
		Creature* trigger;
		uint32 reduceScale;
		uint32 castSpell;
		uint32 summonOrb;
		bool canHit;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_thorims_hammerAI(creature);
	}
};


class npc_mimirons_inferno : public CreatureScript
{
public:
	npc_mimirons_inferno() : CreatureScript("npc_mimirons_inferno") {}

	struct npc_mimirons_infernoAI : public npc_escortAI
	{
		npc_mimirons_infernoAI(Creature* creature) : npc_escortAI(creature) {}

		void Reset()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			//me->CastSpell(me, AURA_DUMMY_YELLOW, true);
			me->SetReactState(REACT_PASSIVE);
			infernoTimer = 2 * IN_MILLISECONDS;
			me->CastSpell(me, SPELL_RED_SKYBEAM, true);
			me->SetSpeed(MOVE_RUN, 0.8f);
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void WaypointReached(uint32 /*pointId*/) {}

		void DamageTaken(Unit* /*attacker*/, uint32& damage) override
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->SetFullHealth();
			}
		}

			void UpdateAI(uint32 diff)
		{
			npc_escortAI::UpdateAI(diff);

			if (!HasEscortState(STATE_ESCORT_ESCORTING))
				Start(false, true, ObjectGuid::Empty, NULL, false, true);
			else
			{
				if (infernoTimer <= diff)
				{
					if (Creature* trigger = DoSummonFlyer(NPC_MIMIRON_TARGET_BEACON, me, 0.0f, 0, 35 * IN_MILLISECONDS, TEMPSUMMON_TIMED_DESPAWN))
					{


						/*if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f))
						{*/
						trigger->CastSpell(me, SPELL_MIMIRONS_INFERNO, true); // It must explode 1 second later
						trigger->SetDisplayId(trigger->GetCreatureTemplate()->Modelid2);
						//trigger->SetDisableGravity(true);

						//}

						infernoTimer = 2 * IN_MILLISECONDS;

					}
				}
				else
					infernoTimer -= diff;

				if (!me->HasAura(AURA_DUMMY_YELLOW))
					me->CastSpell(me, AURA_DUMMY_YELLOW, true);
			}
		}

	private:
		uint32 infernoTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mimirons_infernoAI(creature);
	}
};

class npc_hodirs_fury : public CreatureScript
{
	enum HodirsFuryEvents
	{
		EVENT_SELECT_TARGET_AND_FOLLOW = 1,
		EVENT_CHECK_NEAR,
		EVENT_SUMMON_HODIRS_BEACON,
		EVENT_CAST_SPELL,
		EVENT_UPDATE_TARGET_POSITION,
	};

public:
	npc_hodirs_fury() : CreatureScript("npc_hodirs_fury") {}

	struct npc_hodirs_furyAI : public ScriptedAI
	{
		npc_hodirs_furyAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{

			me->SetReactState(REACT_PASSIVE);
			//me->AddAura(SPELL_BLUE_SKYBEAM, me);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

			events.ScheduleEvent(EVENT_SELECT_TARGET_AND_FOLLOW, 1 * IN_MILLISECONDS);

			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void UpdateAI(uint32 diff)
		{
			if (!me->HasAura(AURA_DUMMY_BLUE))
				me->CastSpell(me, AURA_DUMMY_BLUE, true);

			events.Update(diff);

			while (uint32 event = events.ExecuteEvent())
			{
				switch (event)
				{
				case EVENT_SELECT_TARGET_AND_FOLLOW:
					DoZoneInCombat(me, 200.0f);
					if (target = SelectTarget(SELECT_TARGET_RANDOM, 0, 250.0f, true))
					{
						me->GetMotionMaster()->MoveChase(target);
						events.RescheduleEvent(EVENT_CHECK_NEAR, 2 * IN_MILLISECONDS);
						events.RescheduleEvent(EVENT_UPDATE_TARGET_POSITION, 3 * IN_MILLISECONDS);
					}
					else
					{
						events.RescheduleEvent(EVENT_SELECT_TARGET_AND_FOLLOW, 2 * IN_MILLISECONDS);
						break;
					}

					events.RescheduleEvent(EVENT_SELECT_TARGET_AND_FOLLOW, 20 * IN_MILLISECONDS);
					break;
				case EVENT_CHECK_NEAR:

					if (Player* player = me->SelectNearestPlayer(1.0f))
					{
						if (me->IsWithinDistInMap(player, 1.0f, true))
						{
							me->StopMoving();
							me->GetMotionMaster()->Clear();
							me->GetMotionMaster()->MoveIdle();
							events.ScheduleEvent(EVENT_SUMMON_HODIRS_BEACON, 500);
						}
					}


					events.ScheduleEvent(EVENT_CHECK_NEAR, 1 * IN_MILLISECONDS);
					break;
				case EVENT_UPDATE_TARGET_POSITION:
					if (target)
					{
						me->GetMotionMaster()->MoveChase(target);
					}
					break;
				case EVENT_SUMMON_HODIRS_BEACON:

					if (Creature* trigger = DoSummonFlyer(NPC_HODIR_TARGET_BEACON, me, 17.0f, 0, 4 * IN_MILLISECONDS, TEMPSUMMON_TIMED_DESPAWN))
					{
						//trigger->AI()->DoCast(SPELL_HODIR_S_FURY);

						//trigger->AI()->DoCast(me, SPELL_HODIR_S_FURY); // 
						trigger->SetDisplayId(25347);	// 25347					
						trigger->SetObjectScale(1);
					}

					events.ScheduleEvent(EVENT_CAST_SPELL, 1800);
					events.RescheduleEvent(EVENT_SELECT_TARGET_AND_FOLLOW, 5 * IN_MILLISECONDS);

					break;
				case EVENT_CAST_SPELL:
					me->AI()->DoCast(SPELL_HODIR_S_FURY);
					break;
				default:
					break;
				}
			}
			UpdateVictim();
		}

	private:
		Unit* target;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hodirs_furyAI(creature);
	}
};

class npc_freyas_ward : public CreatureScript
{
public:
	npc_freyas_ward() : CreatureScript("npc_freyas_ward") {}

	struct npc_freyas_wardAI : public ScriptedAI
	{
		npc_freyas_wardAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
		}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			Reset();
		}

		void Reset()
		{
			me->AddAura(SPELL_GREEN_SKYBEAM, me);
			me->setActive(true);
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			summonTimer = 2 * IN_MILLISECONDS;
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void UpdateAI(uint32 diff)
		{
			if (summonTimer <= diff)
			{
				/*if (Creature* trigger = DoSummonFlyer(NPC_FREYA_BEACON, me, 0.0f, 0, 10 * IN_MILLISECONDS, TEMPSUMMON_TIMED_DESPAWN))
				{*/
				/// @todo Check if this is the correct spell, only the triggered one does something 
				//if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f))

				uint8 option = urand(0, 2);

				switch (option)
				{
				case 0:
				{
					if (Creature* ward = me->SummonCreature(34275, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ())) //33387
					{
						/* if(Creature* leviathan = instance->instance->GetCreature(instance->GetData64(BOSS_LEVIATHAN)))
						{
						ward->GetMotionMaster()->MoveIdle();
						ward->GetMotionMaster()->MoveChase(leviathan, 500.0f);
						//ward->Attack(target, true);
						}*/
					}

					for (uint8 i = 0; i < RAID_MODE(3, 5); i++)
					{
						if (Creature* lasher = me->SummonCreature(33387, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ())) // Lashers
						{
							/*if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 300.0f))
							{
							lasher->GetMotionMaster()->MoveIdle();
							lasher->GetMotionMaster()->MoveChase(target);
							//lasher->Attack(target, true);
							}*/
						}
					}
				}
					break;
				case 1:
				{
					for (uint8 i = 0; i < RAID_MODE(3, 6); i++)
					{
						if (Creature* lasher = me->SummonCreature(33387, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ())) // Lashers
						{
							/*if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 300.0f))
							{
							lasher->GetMotionMaster()->MoveIdle();
							lasher->GetMotionMaster()->MoveChase(target);
							//lasher->Attack(target, true);
							}*/
						}
					}
				}
					break;
				case 2:
					//DoCast(62907);
					break;
				default:
					break;
				}

				summonTimer = 28 * IN_MILLISECONDS;

			}
			else
				summonTimer -= diff;

			if (!me->HasAura(AURA_DUMMY_GREEN))
				me->CastSpell(me, AURA_DUMMY_GREEN, true);


			//UpdateVictim();
		}

	private:
		uint32 summonTimer;
		InstanceScript* instance;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_freyas_wardAI(creature);
	}
};

class npc_freya_ward_summon : public CreatureScript
{
public:
	npc_freya_ward_summon() : CreatureScript("npc_freya_ward_summon") {}

	struct npc_freya_ward_summonAI : public ScriptedAI
	{
		npc_freya_ward_summonAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetInCombatWithZone();
			instance = me->GetInstanceScript();
			startChasing = 3000;
		}

		void Reset()
		{
			me->SetReactState(REACT_AGGRESSIVE);
			//me->setActive(true);
			lashTimer = urand(2 * IN_MILLISECONDS, 8 * IN_MILLISECONDS);
			DoZoneInCombat(me, 200.0f);
		}

		void UpdateAI(uint32 diff)
		{
			/*if (!UpdateVictim())
			return;*/

			if (lashTimer <= diff)
			{
				DoCast(SPELL_LASH);
				lashTimer = urand(8 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
			}
			else
				lashTimer -= diff;

			if (startChasing <= diff)
			{
				me->GetMotionMaster()->MoveRandom(150.0f);
				/*if (Unit* target = SelectTarget(SELECT_TARGET_VE, 0, 250.0f))
				{
				me->GetMotionMaster()->MovePoint(0, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ());
				//me->GetMotionMaster()->MoveChase(target);

				//me->Attack(target->GetVehicle(), true);

				}*/
				//lashTimer = urand(8 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
				startChasing = 20000; //Poner a bool o algo.
			}
			else
				startChasing -= diff;

			DoMeleeAttackIfReady();


			if (instance->GetBossState(BOSS_LEVIATHAN) != IN_PROGRESS)
				me->DespawnOrUnsummon();
		}

	private:
		InstanceScript* instance;
		uint32 startChasing;
		uint32 lashTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_freya_ward_summonAI(creature);
	}
};


// Helper for: Bronzebeard Radio and Ulduar Gauntlet generator.

bool IsUlduarVehicle(Unit* who)
{
	if (who->GetTypeId() == TYPEID_PLAYER)
		return true;
	else if (who->GetEntry())
	{
		switch (who->GetEntry())
		{
		case VEHICLE_CHOPPER:
		case VEHICLE_DEMOLISHER:
		case VEHICLE_SIEGE:
			return true;
		default:
			return false;
		}
	}

	return false;
}

enum RadioNPCS
{
	NPC_MECHANOSTRIKER_54A = 34161,
	NPC_MECHAGNOME_PILOT = 33216,
};

#define MECHANOSTRIKER_Z 418.04f

enum MechanoSpells
{
	SPELL_MECHANO_LASER_BARRAGE = 64766,
};

class npc_ulduar_mechanostriker : public CreatureScript
{
public:
	npc_ulduar_mechanostriker() : CreatureScript("npc_ulduar_mechanostriker") { }

	struct npc_ulduar_mechanostrikerAI : public ScriptedAI
	{
		npc_ulduar_mechanostrikerAI(Creature* creature) : ScriptedAI(creature),
			_instance(creature->GetInstanceScript())
		{
			SetCombatMovement(false);
			me->SetDisableGravity(false);
			me->SetCanFly(true);
		}

		void Reset() override
		{
			events.ScheduleEvent(EVENT_CHECK_IF_VALID_TARGET_ISNEAR, 6 * IN_MILLISECONDS);
			me->GetMotionMaster()->MovePoint(0, me->GetPositionX(), me->GetPositionY(), MECHANOSTRIKER_Z);
		}

			Unit* GetValidTargetNear(float dist)
		{
			if (Creature* siege = me->FindNearestCreature(VEHICLE_SIEGE, dist, true))
				return siege;
			if (Creature* chopper = me->FindNearestCreature(VEHICLE_CHOPPER, dist, true))
				return chopper;
			if (Creature* demolisher = me->FindNearestCreature(VEHICLE_DEMOLISHER, dist, true))
				return demolisher;

			return false;
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_IF_VALID_TARGET_ISNEAR:

					if (Unit* target = GetValidTargetNear(175.0f))
					{
						float x = target->GetPositionX();
						float y = target->GetPositionY();
						float z = target->GetPositionZ();

						if (me->IsWithinDist3d(x, y, z, 50.0f))
						{
							me->GetMotionMaster()->Initialize();
							me->SetTarget(target->GetGUID());
							DoCast(target, SPELL_MECHANO_LASER_BARRAGE);
						}
						else
							me->GetMotionMaster()->MovePoint(0, x, y, MECHANOSTRIKER_Z);
					}
					events.RescheduleEvent(EVENT_CHECK_IF_VALID_TARGET_ISNEAR, 5 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}

			DoSpellAttackIfReady(SPELL_MECHANO_LASER_BARRAGE);
		}

	private:
		InstanceScript* const _instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_ulduar_mechanostrikerAI>(creature);
	}
};


/* Ulduar Gauntlet Generator */

class npc_ulduar_gauntlet_generator : public CreatureScript
{
public:;
	   npc_ulduar_gauntlet_generator() : CreatureScript("npc_ulduar_gauntlet_generator") { }

	   struct npc_ulduar_gauntlet_generatorAI : public ScriptedAI
	   {
		   npc_ulduar_gauntlet_generatorAI(Creature* creature) : ScriptedAI(creature),
			   _instance(creature->GetInstanceScript()) {}

		   void Reset() override
		   {
			   activated = false;
			   events.ScheduleEvent(EVENT_CHECK_IF_VALID_TARGET_ISNEAR, 10 * IN_MILLISECONDS);
			   numSummons = 0;
		   }

			   void DoAction(int32 action) override
		   {
			   if (!activated)
			   if (action == ACTION_ACTIVATE_GAUNTLET)
			   {
				   events.ScheduleEvent(EVENT_SUMMON_STEELFORGED_DEFENDERS, 3 * IN_MILLISECONDS);
				   activated = true;
			   }
		   }

			   Unit* GetValidTargetNear(float dist)
		   {
			   if (Creature* chopper = me->FindNearestCreature(VEHICLE_CHOPPER, dist, true))
				   return chopper;
			   if (Creature* demolisher = me->FindNearestCreature(VEHICLE_DEMOLISHER, dist, true))
				   return demolisher;
			   if (Creature* siege = me->FindNearestCreature(VEHICLE_SIEGE, dist, true))
				   return siege;

			   return false;
		   }

		   void UpdateAI(uint32 diff) override
		   {
			   events.Update(diff);

			   while (uint32 eventId = events.ExecuteEvent())
			   {
				   switch (eventId)
				   {
				   case EVENT_CHECK_IF_VALID_TARGET_ISNEAR:
					   if (GetValidTargetNear(75.0f))
					   {
						   DoAction(ACTION_ACTIVATE_GAUNTLET);
						   events.CancelEvent(EVENT_CHECK_IF_VALID_TARGET_ISNEAR);
					   }
					   else
					   {
						   if (!GetValidTargetNear(150.0f))
							   if (numSummons>0)
								   for (uint32 i = 0; i < numSummons; i++)
									   if (Creature* summon = ObjectAccessor::GetCreature(*me, summons[i]))
										   summon->DespawnOrUnsummon();

						   activated = false;
						   events.CancelEvent(EVENT_SUMMON_STEELFORGED_DEFENDERS);
					   }
					   events.RescheduleEvent(EVENT_CHECK_IF_VALID_TARGET_ISNEAR, 3 * IN_MILLISECONDS);
					   break;
				   case EVENT_SUMMON_STEELFORGED_DEFENDERS:
					   if (numSummons < 30)
						   if (Creature* steelforged = me->SummonCreature(33236, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation()))
						   {
						   steelforged->SetReactState(REACT_AGGRESSIVE);

						   if (Unit* target = GetValidTargetNear(75.0f))
						   {
							   steelforged->GetMotionMaster()->MoveIdle();
							   steelforged->GetMotionMaster()->MoveChase(target);
							   steelforged->Attack(target, true);
						   }
						   summons[numSummons] = steelforged->GetGUID();
						   numSummons++;
						   }

					   events.RescheduleEvent(EVENT_SUMMON_STEELFORGED_DEFENDERS, 3 * IN_MILLISECONDS);
					   break;
				   default:
					   break;
				   }
			   }
		   }

	   private:
		   InstanceScript* const _instance;
		   EventMap events;
		   ObjectGuid summons[30];
		   uint32 numSummons;
		   bool activated;
	   };

	   CreatureAI* GetAI(Creature* creature) const override
	   {
		   return GetInstanceAI<npc_ulduar_gauntlet_generatorAI>(creature);
	   }
};

/*
Bronzebeard Radio event system.
This system, will react as if it would be a real radio with speakers, activating through nodes.
*/

#define NUM_POSITIONS 10

Position const RadioLocations[NUM_POSITIONS] =
{
	{ -716.35f, -54.90f, 429.84f },  // START_POS
	{ -509.67f, -29.05f, 409.80f },  // FIRST_PULL
	{ -348.07f, -189.91f, 369.43f },  // TOWER_OF_LIFE
	{ -262.86f, -37.87f, 409.80f },  // AIR SCOUTS
	{ 15.82f, -31.38f, 409.80f },  // AIR SCOUTS 2
	{ -184.52f, 119.86f, 432.78f },   // TOWER_OF_FLAMES
	{ 66.24f, -129.47f, 409.80f },   // TOWER_OF_FROST
	{ 118.28f, 87.51f, 409.80f },   // TOWER_OF_STORMS
	{ 113.446f, -41.56f, 409.80f },   // REPAIR STATION
};

enum RadioPositions
{
	START_POS = 0,
	FIRST_PULL,
	TOWER_OF_LIFE,
	AIR_SCOUTS,
	AIR_SCOUTS_2,
	TOWER_OF_FLAMES,
	TOWER_OF_FROST,
	TOWER_OF_STORMS,
	REPAIR_STATION
};

enum RadioSays
{
	SAY_RADIO_START = 0,
	SAY_RADIO_FIRST_PULL,
	SAY_RADIO_FIRST_KILL,

	SAY_RADIO_TOWER_OF_LIFE,
	SAY_RADIO_AIR_SCOUTS,

	SAY_RADIO_TOWER_OF_FLAMES,
	SAY_RADIO_TOWER_OF_FROST,
	SAY_RADIO_TOWER_OF_STORMS,

	SAY_RADIO_REPAIR_STATION,

	SAY_RADIO_ULDUAR_DEFENSES,

	SAY_RADIO_FLAME_LEVIATHAN_1,
	SAY_RADIO_FLAME_LEVIATHAN_2
};

class npc_bronzebeard_radio : public CreatureScript
{
public:
	npc_bronzebeard_radio() : CreatureScript("npc_bronzebeard_radio") { }

	struct npc_bronzebeard_radioAI : public ScriptedAI
	{
		npc_bronzebeard_radioAI(Creature* creature) : ScriptedAI(creature),
			_instance(creature->GetInstanceScript()) {}

		void Reset() override
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			activated = false;
		}

			void ReproduceThroughSpeakers(uint8 say) // Nearest NPC (200 yards) should also reproduce what the node commands.
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, me->GetEntry(), 200.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

			me->VisitNearbyObject(200.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
					(*i)->AI()->Talk(say);
			}
		}

		uint8 GetMyPosition()
		{
			for (uint8 i = 0; i < NUM_POSITIONS; i++)
			{
				if (RadioLocations[i].GetPositionX() != me->GetPositionX())
					continue;
				if (RadioLocations[i].GetPositionY() != me->GetPositionY())
					continue;
				if (RadioLocations[i].GetPositionZ() != me->GetPositionZ())
					continue;
				else
					return i;
			}
			return NUM_POSITIONS;
		}

		void SummonAirScouts(uint8 point)
		{
			float x = point == 1 ? -370 : 76;
			float y = point == 1 ? -109 : -137;

			for (uint32 i = 0; i < 4; i++)
			{
				// In order to generate a military-line formation.
				x = x - (3 * i);
				y = y - (3 * i);

				if (Creature* plane = me->SummonCreature(NPC_MECHANOSTRIKER_54A, x, y, MECHANOSTRIKER_Z))
					if (Creature* pilot = me->SummonCreature(NPC_MECHAGNOME_PILOT, plane->GetPositionX(), plane->GetPositionY(), plane->GetPositionZ()))
					{
					pilot->EnterVehicle(plane, 0);
                    pilot->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
					plane->GetMotionMaster()->MovePoint(0, me->GetPositionX(), plane->GetPositionY(), MECHANOSTRIKER_Z);
					}
			}
		}


		void DoAction(int32 action) override
		{
			switch (action)
			{
			case  ACTION_ACTIVATE_RADIO:
				switch (GetMyPosition())
				{
				case START_POS:
					ReproduceThroughSpeakers(SAY_RADIO_START);
					activated = true;
					break;
				case FIRST_PULL:
					ReproduceThroughSpeakers(SAY_RADIO_FIRST_PULL);
					events.ScheduleEvent(EVENT_RADIO_PULL_KILL_SAY_LINK, 15 * IN_MILLISECONDS);
					activated = true;
					break;
				case TOWER_OF_LIFE:
					ReproduceThroughSpeakers(SAY_RADIO_TOWER_OF_LIFE);
					activated = true;
					break;
				case AIR_SCOUTS:
					SummonAirScouts(1);
					ReproduceThroughSpeakers(SAY_RADIO_AIR_SCOUTS);
					activated = true;
					break;
				case AIR_SCOUTS_2:
					SummonAirScouts(2);
					ReproduceThroughSpeakers(SAY_RADIO_AIR_SCOUTS);
					activated = true;
					break;
				case TOWER_OF_FLAMES:
					ReproduceThroughSpeakers(SAY_RADIO_TOWER_OF_FLAMES);
					activated = true;
					break;
				case TOWER_OF_FROST:
					ReproduceThroughSpeakers(SAY_RADIO_TOWER_OF_FROST);
					activated = true;
					break;
				case TOWER_OF_STORMS:
					ReproduceThroughSpeakers(SAY_RADIO_TOWER_OF_STORMS);
					activated = true;
					break;
				case REPAIR_STATION:
					ReproduceThroughSpeakers(SAY_RADIO_REPAIR_STATION);
					activated = true;
					break;
				default:
					break;
				}
				break;
			case ACTION_SAY_ULDUAR_DEFENSES:
				ReproduceThroughSpeakers(SAY_RADIO_ULDUAR_DEFENSES);
				break;
			case ACTION_SAY_PRE_LEVIATHAN:
				ReproduceThroughSpeakers(SAY_RADIO_FLAME_LEVIATHAN_1);
				break;
			case ACTION_SAY_EVASIVE_ACTION:
				ReproduceThroughSpeakers(SAY_RADIO_FLAME_LEVIATHAN_2);
				break;
			}

		}

			void MoveInLineOfSight(Unit* who) override
		{
			if (!activated)
			if (IsUlduarVehicle(who))
				if (me->GetDistance2d(who) < 45.0f)
					DoAction(ACTION_ACTIVATE_RADIO);
		}

			void UpdateAI(uint32 diff) override
		{

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_RADIO_PULL_KILL_SAY_LINK:
					ReproduceThroughSpeakers(SAY_RADIO_FIRST_KILL);
					break;
				default:
					break;
				}
			}
		}

	private:
		InstanceScript* const _instance;
		EventMap events;
		bool activated;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_bronzebeard_radioAI>(creature);
	}
};


enum IntroDellorahSays
{
	INTRO_DELLORAH_SAY_0 = 0,
	INTRO_DELLORAH_SAY_1 = 1,
	INTRO_DELLORAH_SAY_2 = 2,
	INTRO_DELLORAH_SAY_3 = 3,
	INTRO_DELLORAH_SAY_4 = 4,
	INTRO_DELLORAH_SAY_5 = 5,
	INTRO_DELLORAH_SAY_6 = 6,
	INTRO_DELLORAH_SAY_7 = 7,
	INTRO_DELLORAH_SAY_BRANN_1 = 8,
	INTRO_DELLORAH_SAY_BRANN_2 = 9,
};

enum IntroNorgannonSays
{
	INTRO_NORGANNON_SAY_0 = 0,
	INTRO_NORGANNON_SAY_1 = 1,
	INTRO_NORGANNON_SAY_2 = 2,
	INTRO_NORGANNON_SAY_3 = 3,
	INTRO_NORGANNON_SAY_4 = 4,
	INTRO_NORGANNON_SAY_5 = 5,
	INTRO_NORGANNON_SAY_6 = 6,
	INTRO_NORGANNON_SAY_7 = 7,
	INTRO_NORGANNON_SAY_8 = 8,
	INTRO_NORGANNON_SAY_9 = 9,
};

#define GOSSIP_ITEM_3  "We're ready. Begin the assault!"

class npc_brann_bronzebeard : public CreatureScript
{
public:
	npc_brann_bronzebeard() : CreatureScript("npc_brann_bronzebeard") { }

	struct npc_brann_bronzebeardAI : public ScriptedAI
	{
		npc_brann_bronzebeardAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset() override
		{
			// Make this more fancy, awfull right now. It works though.

			if (Creature* battleMage = me->SummonCreature(33662, -673.09f, -77.57f, 426.36f, 5.84f))
			{
				myMages[0] = battleMage->GetGUID();

				if (Creature* bunny = me->SummonCreature(33779, -640.85f, -101.92f, 521.69f, 5.68f))
				{
					bunny->SetDisplayId(bunny->GetCreatureTemplate()->Modelid2);
					battleMage->AI()->DoCast(bunny, 48310, false);
				}
			}

			if (Creature* battleMageLeft = me->SummonCreature(33662, -675.22f, -18.33f, 426.38f, 0.94f))
			{
				myMages[1] = battleMageLeft->GetGUID();

				if (Creature* bunnyLeft = me->SummonCreature(33779, -663.888f, -2.03f, 522.45f, 5.68f))
				{
					bunnyLeft->SetDisplayId(bunnyLeft->GetCreatureTemplate()->Modelid2);
					battleMageLeft->AI()->DoCast(bunnyLeft, 48310, false);
				}
			}

		}

			void DoAction(int32 action) override
		{
			if (action == ACTION_BRANN_START)
			{
				events.ScheduleEvent(EVENT_BRANN_START_1, 2000);
			}
		}

			void setPlayerName(Player* player)
		{
			if (player)
				playerGossip = player;

			events.ScheduleEvent(EVENT_DELLORAH_BRANN_02, 9 * IN_MILLISECONDS);
		}

		void UpdateAI(uint32 diff)
		{

			events.Update(diff);

			while (uint32 event = events.ExecuteEvent())
			{
				switch (event)
				{
				case EVENT_DELLORAH_BRANN_02:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_BRANN_2, playerGossip);
					}
					events.ScheduleEvent(EVENT_BRANN_START_1, 10 * IN_MILLISECONDS);
					break;
				case EVENT_BRANN_START_1:
					Talk(0);
					events.ScheduleEvent(EVENT_BRANN_START_2, 10 * IN_MILLISECONDS);
					break;
				case EVENT_BRANN_START_2:
					if (Creature* Pentarus = me->FindNearestCreature(33624, 75.0f, true))
					{
						Pentarus->AI()->Talk(0);
						Pentarus->SetWalk(true);
						if (Creature* bmage = me->FindNearestCreature(33662, 15.0f))
						{
							bmage->SetWalk(true);
							bmage->GetMotionMaster()->MoveFollow(Pentarus, 2.0f, 1.0f);
						}
						if (Creature* ktmage = me->FindNearestCreature(33672, 15.0f))
						{
							ktmage->SetWalk(true);
							ktmage->GetMotionMaster()->MoveFollow(Pentarus, 5.0f, 5.0f);
						}
						if (Creature* gnome = me->FindNearestCreature(33626, 15.0f))
						{
							gnome->GetMotionMaster()->MovePoint(0, -822.26f, -50.08f, 429.87f);
						}

						Pentarus->GetMotionMaster()->MovePoint(0, -689.26f, -88.33f, 428.41f);

					}
					events.ScheduleEvent(EVENT_BRANN_START_4, 17 * IN_MILLISECONDS);
					break;
				case EVENT_BRANN_START_3:
					for (uint8 i = 0; i < NUM_POSITIONS; i++)
						me->SummonCreature(34054, RadioLocations[i]);

					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(0, -669.17f, -50.86f, 425.07f);
					break;
				case EVENT_BRANN_START_4:
					if (Creature* Pentarus = me->FindNearestCreature(33624, 75.0f, true))
					{
						Pentarus->SetOrientation(0.09f);
						Pentarus->SetFacingTo(0.09f);
						Pentarus->AI()->Talk(1);
						Pentarus->AI()->DoCast(51110);
						if (Creature* mage1 = ObjectAccessor::GetCreature(*me, myMages[0]))
						{
							mage1->CastStop();
							mage1->AI()->DoCast(51110);
						}

						if (Creature* mage2 = ObjectAccessor::GetCreature(*me, myMages[1]))
						{
							mage2->CastStop();
							mage2->AI()->DoCast(51110);
						}
					}
					events.ScheduleEvent(EVENT_REMOVE_SHIELD, 8 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_BRANN_START_5, 13 * IN_MILLISECONDS);
					break;
				case EVENT_REMOVE_SHIELD:
					if (GameObject* ulduarShield = me->FindNearestGameObject(194484, 200.0f))
					{
						/*if (Creature* mage1 = ObjectAccessor::GetCreature(*me, myMages[0]))
						{
						mage1->CastStop();
						mage1->AI()->DoCast(51110);
						}

						if (Creature* mage2 = ObjectAccessor::GetCreature(*me, myMages[1]))
						{
						mage2->CastStop();
						mage2->AI()->DoCast(51110);
						}*/


						ulduarShield->RemoveFromWorld();
					}
					break;
				case EVENT_BRANN_START_5:
					Talk(2);
					events.ScheduleEvent(EVENT_BRANN_START_3, 10 * IN_MILLISECONDS);
					//events.ScheduleEvent(EVENT_BRANN_START_5, 9 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap events;
		Player* playerGossip;
		ObjectGuid myMages[2];
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		player->PlayerTalkClass->ClearMenus();
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF + 2:
			if (player)
				player->CLOSE_GOSSIP_MENU();
			if (Creature* Lorekeeper = creature->FindNearestCreature(NPC_LOREKEEPER, 1000, true))
			{
				Lorekeeper->AI()->DoAction(ACTION_SPAWN_VEHICLES);
				Lorekeeper->AI()->DoAction(ACTION_STOP_EVENTS);
				Lorekeeper->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP); // Brann
			}

			creature->AI()->DoAction(ACTION_BRANN_START);

			break;
		}
		return true;
	}
		bool OnGossipHello(Player* player, Creature* creature) override
	{
		InstanceScript* instance = creature->GetInstanceScript();
		if (instance && instance->GetData(BOSS_LEVIATHAN) != DONE && player)
		{
			player->PrepareGossipMenu(creature);

			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		}
		return true;
	}

		CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_brann_bronzebeardAI(creature);
	}
};

//npc lore keeper
#define GOSSIP_ITEM_1  "Activate secondary defensive systems"
#define GOSSIP_ITEM_2  "Confirmed"


class npc_lorekeeper : public CreatureScript
{
public:
	npc_lorekeeper() : CreatureScript("npc_lorekeeper") { }

	struct npc_lorekeeperAI : public ScriptedAI
	{
		npc_lorekeeperAI(Creature* creature) : ScriptedAI(creature)
		{
			InstanceScript* instance = creature->GetInstanceScript();

			if (instance)
				instance->instance->LoadGrid(364, -16);

			introDone = false;

		}
		void MoveInLineOfSight(Unit* who) override
		{
			if (who->GetTypeId() == TYPEID_PLAYER && me->GetDistance2d(who) < 15.0f)
			{

				if (!introDone)
				{
					events.ScheduleEvent(EVENT_START_INTRO_1, 5000);
					introDone = true;
				}
			}
		}

			void DoAction(int32 action) override
		{

			switch (action)
			{
			case ACTION_SPAWN_VEHICLES:
				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_SIEGE, PosSiege[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_CHOPPER, PosChopper[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
				for (int32 i = 0; i < RAID_MODE(2, 5); ++i)
					DoSummon(VEHICLE_DEMOLISHER, PosDemolisher[i], 3000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
				return;
			case ACTION_DELLORAH_HARD_MODE:
				events.ScheduleEvent(EVENT_DELLORAH_BRANN_01, 1000);
				break;
			case ACTION_STOP_EVENTS:
				events.Reset();
				introDone = true;
			default:
				break;
			}


		}

			void UpdateAI(uint32 diff)
		{

			events.Update(diff);

			while (uint32 event = events.ExecuteEvent())
			{
				switch (event)
				{
				case EVENT_START_INTRO_1:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_0);
					}
					events.ScheduleEvent(EVENT_START_INTRO_2, 10 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_2:
					Talk(INTRO_NORGANNON_SAY_0);
					events.ScheduleEvent(EVENT_START_INTRO_3, 15 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_3:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_1);
					}
					events.ScheduleEvent(EVENT_START_INTRO_4, 12 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_4:
					Talk(INTRO_NORGANNON_SAY_1);
					events.ScheduleEvent(EVENT_START_INTRO_5, 15 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_5:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_2);
					}
					events.ScheduleEvent(EVENT_START_INTRO_6, 11 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_6:
					Talk(INTRO_NORGANNON_SAY_2);
					events.ScheduleEvent(EVENT_START_INTRO_7, 14 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_7:
					Talk(INTRO_NORGANNON_SAY_3);
					events.ScheduleEvent(EVENT_START_INTRO_8, 15 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_8:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_3);
					}
					events.ScheduleEvent(EVENT_START_INTRO_9, 7 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_9:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_4);
					}
					events.ScheduleEvent(EVENT_START_INTRO_10, 7 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_10:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_5);
						if (Creature* archmage = me->FindNearestCreature(33696, 75.0f))
							if (Creature* Brann = me->FindNearestCreature(NPC_BRANZ_BRONZBEARD, 150.0f, true))
							{
							archmage->AI()->Talk(0);
							archmage->GetMotionMaster()->MovePoint(0, Brann->GetPositionX() - 3, Brann->GetPositionY(), Brann->GetPositionZ());
							}
					}
					events.ScheduleEvent(EVENT_START_INTRO_14, 13 * IN_MILLISECONDS); // Archamge, whisper Brann.
					events.ScheduleEvent(EVENT_START_INTRO_11, 7 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_11:
					Talk(INTRO_NORGANNON_SAY_4);
					events.ScheduleEvent(EVENT_START_INTRO_12, 10 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_12:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_6);
					}
					//events.ScheduleEvent(EVENT_START_INTRO_13, 12 * IN_MILLISECONDS);
					break;
				case EVENT_START_INTRO_13:
					/*if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 75.0f, true))
					Delorah->AI()->Talk(4);*/

					break;
				case EVENT_START_INTRO_14:
					if (Creature* archmage = me->FindNearestCreature(33696, 100.0f))
						archmage->AI()->Talk(1);
					break;
				case EVENT_DELLORAH_BRANN_01:
					if (Creature* Delorah = me->FindNearestCreature(NPC_DELORAH, 150.0f, true))
					{
						Delorah->AI()->Talk(INTRO_DELLORAH_SAY_BRANN_2, playerGossip);
					}
					break;
				default:
					break;
				}
			}
		}

	private:
		bool introDone;
		EventMap events;
		Player* playerGossip;
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		player->CLOSE_GOSSIP_MENU();
		InstanceScript* instance = creature->GetInstanceScript();
		if (!instance)
			return true;

		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF + 1:
			player->PrepareGossipMenu(creature);
			instance->instance->LoadGrid(364, -16); //make sure leviathan is loaded

			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
			break;
		case GOSSIP_ACTION_INFO_DEF + 2:
			if (Creature* leviathan = instance->instance->GetCreature(instance->GetGuidData(BOSS_LEVIATHAN)))
			{
				leviathan->AI()->DoAction(ACTION_START_HARD_MODE);
				creature->SetVisible(false);
				creature->AI()->DoAction(ACTION_SPAWN_VEHICLES);

				if (Creature* Delorah = creature->FindNearestCreature(NPC_DELORAH, 1000, true))
				{
					Delorah->AI()->Talk(INTRO_DELLORAH_SAY_BRANN_1, player);
					creature->AI()->DoAction(ACTION_STOP_EVENTS);

					if (Creature* Branz = creature->FindNearestCreature(NPC_BRANZ_BRONZBEARD, 150.0f, true))
					{

						Delorah->GetMotionMaster()->MovePoint(0, Branz->GetPositionX() - 5, Branz->GetPositionY() - 6, Branz->GetPositionZ());
						CAST_AI(npc_brann_bronzebeard::npc_brann_bronzebeardAI, Branz->AI())->setPlayerName(player);

					}
				}

				if (Creature* brann = creature->FindNearestCreature(NPC_BRANZ_BRONZBEARD, 1000, true))
				{
					brann->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				}
			}
			break;
		}

		return true;
	}

		bool OnGossipHello(Player* player, Creature* creature) override
	{
		InstanceScript* instance = creature->GetInstanceScript();
		if (instance && instance->GetData(BOSS_LEVIATHAN) != DONE && player)
		{
			player->PrepareGossipMenu(creature);

			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		}
		return true;
	}

		CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lorekeeperAI(creature);
	}
};


class go_ulduar_tower : public GameObjectScript
{
public:
	go_ulduar_tower() : GameObjectScript("go_ulduar_tower") { }

	void OnDestroyed(GameObject* go, Player* /*player*/) override
	{
		InstanceScript* instance = go->GetInstanceScript();
		if (!instance)
			return;

		switch (go->GetEntry())
		{
		case GO_TOWER_OF_STORMS:
			instance->ProcessEvent(go, EVENT_TOWER_OF_STORM_DESTROYED);
			break;
		case GO_TOWER_OF_FLAMES:
			instance->ProcessEvent(go, EVENT_TOWER_OF_FLAMES_DESTROYED);
			break;
		case GO_TOWER_OF_FROST:
			instance->ProcessEvent(go, EVENT_TOWER_OF_FROST_DESTROYED);
			break;
		case GO_TOWER_OF_LIFE:
			instance->ProcessEvent(go, EVENT_TOWER_OF_LIFE_DESTROYED);
			break;
		}

		if (Creature* trigger = go->FindNearestCreature(NPC_ULDUAR_GAUNTLET_GENERATOR, 15.0f, true))
			trigger->DisappearAndDie();
	}
};

class achievement_three_car_garage_demolisher : public AchievementCriteriaScript
{
public:
	achievement_three_car_garage_demolisher() : AchievementCriteriaScript("achievement_three_car_garage_demolisher") { }

	bool OnCheck(Player* source, Unit* /*target*/) override
	{
		if (Creature* vehicle = source->GetVehicleCreatureBase())
		{
			if (vehicle->GetEntry() == VEHICLE_DEMOLISHER)
				return true;
		}

		return false;
	}
};

class achievement_three_car_garage_chopper : public AchievementCriteriaScript
{
public:
	achievement_three_car_garage_chopper() : AchievementCriteriaScript("achievement_three_car_garage_chopper") { }

	bool OnCheck(Player* source, Unit* /*target*/) override
	{
		if (Creature* vehicle = source->GetVehicleCreatureBase())
		{
			if (vehicle->GetEntry() == VEHICLE_CHOPPER)
				return true;
		}

		return false;
	}
};

class achievement_three_car_garage_siege : public AchievementCriteriaScript
{
public:
	achievement_three_car_garage_siege() : AchievementCriteriaScript("achievement_three_car_garage_siege") { }

	bool OnCheck(Player* source, Unit* /*target*/) override
	{
		if (Creature* vehicle = source->GetVehicleCreatureBase())
		{
			if (vehicle->GetEntry() == VEHICLE_SIEGE)
				return true;
		}

		return false;
	}
};

class achievement_shutout : public AchievementCriteriaScript
{
public:
	achievement_shutout() : AchievementCriteriaScript("achievement_shutout") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (target)
		if (Creature* leviathan = target->ToCreature())
			if (leviathan->AI()->GetData(DATA_SHUTOUT))
				return true;

		return false;
	}
};

class achievement_unbroken : public AchievementCriteriaScript
{
public:
	achievement_unbroken() : AchievementCriteriaScript("achievement_unbroken") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (target)
		if (InstanceScript* instance = target->GetInstanceScript())
			return instance->GetData(DATA_UNBROKEN);

		return false;
	}
};

class achievement_orbital_bombardment : public AchievementCriteriaScript
{
public:
	achievement_orbital_bombardment() : AchievementCriteriaScript("achievement_orbital_bombardment") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target)
		return false;

		if (Creature* Leviathan = target->ToCreature())
			if (Leviathan->AI()->GetData(DATA_ORBIT_ACHIEVEMENTS) >= 1)
				return true;

		return false;
	}
};

class achievement_orbital_devastation : public AchievementCriteriaScript
{
public:
	achievement_orbital_devastation() : AchievementCriteriaScript("achievement_orbital_devastation") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target)
		return false;

		if (Creature* Leviathan = target->ToCreature())
			if (Leviathan->AI()->GetData(DATA_ORBIT_ACHIEVEMENTS) >= 2)
				return true;

		return false;
	}
};

class achievement_nuked_from_orbit : public AchievementCriteriaScript
{
public:
	achievement_nuked_from_orbit() : AchievementCriteriaScript("achievement_nuked_from_orbit") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target)
		return false;

		if (Creature* Leviathan = target->ToCreature())
			if (Leviathan->AI()->GetData(DATA_ORBIT_ACHIEVEMENTS) >= 3)
				return true;

		return false;
	}
};

class achievement_orbit_uary : public AchievementCriteriaScript
{
public:
	achievement_orbit_uary() : AchievementCriteriaScript("achievement_orbit_uary") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target)
		return false;

		if (Creature* Leviathan = target->ToCreature())
			if (Leviathan->AI()->GetData(DATA_ORBIT_ACHIEVEMENTS) == 4)
				return true;

		return false;
	}
};

class spell_load_into_catapult : public SpellScriptLoader
{
	enum Spells
	{
		SPELL_PASSENGER_LOADED = 62340,
	};

public:
	spell_load_into_catapult() : SpellScriptLoader("spell_load_into_catapult") { }

	class spell_load_into_catapult_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_load_into_catapult_AuraScript);

		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			Unit* owner = GetOwner()->ToUnit();
			if (!owner)
				return;

			owner->CastSpell(owner, SPELL_PASSENGER_LOADED, true);
		}

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			Unit* owner = GetOwner()->ToUnit();
			if (!owner)
				return;

			owner->RemoveAurasDueToSpell(SPELL_PASSENGER_LOADED);
		}

		void Register() override
		{
			OnEffectApply += AuraEffectApplyFn(spell_load_into_catapult_AuraScript::OnApply, EFFECT_0, SPELL_AURA_CONTROL_VEHICLE, AURA_EFFECT_HANDLE_REAL);
			OnEffectRemove += AuraEffectRemoveFn(spell_load_into_catapult_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_CONTROL_VEHICLE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_load_into_catapult_AuraScript();
	}
};

class spell_auto_repair : public SpellScriptLoader
{
	enum Spells
	{
		SPELL_AUTO_REPAIR = 62705,
	};

public:
	spell_auto_repair() : SpellScriptLoader("spell_auto_repair") { }

	class spell_auto_repair_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_auto_repair_SpellScript);

		void CheckCooldownForTarget()
		{
			if (GetHitUnit()->HasAuraEffect(SPELL_AUTO_REPAIR, EFFECT_2))   // Check presence of dummy aura indicating cooldown
			{
				PreventHitEffect(EFFECT_0);
				PreventHitDefaultEffect(EFFECT_1);
				PreventHitDefaultEffect(EFFECT_2);
				//! Currently this doesn't work: if we call PreventHitAura(), the existing aura will be removed
				//! because of recent aura refreshing changes. Since removing the existing aura negates the idea
				//! of a cooldown marker, we just let the dummy aura refresh itself without executing the other spelleffects.
				//! The spelleffects can be executed by letting the dummy aura expire naturally.
				//! This is a temporary solution only.
				//PreventHitAura();
			}
		}

		void HandleScript(SpellEffIndex /*eff*/)
		{
			Vehicle* vehicle = GetHitUnit()->GetVehicleKit();
			if (!vehicle)
				return;

			Player* driver = vehicle->GetPassenger(0) ? vehicle->GetPassenger(0)->ToPlayer() : NULL;
			if (!driver)
				return;

			//driver->TextEmote(EMOTE_REPAIR, driver, true);

			InstanceScript* instance = driver->GetInstanceScript();
			if (!instance)
				return;

			// Actually should/could use basepoints (100) for this spell effect as percentage of health, but oh well.
			vehicle->GetBase()->SetFullHealth();

			// For achievement
			instance->SetData(DATA_UNBROKEN, 0);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_auto_repair_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
			BeforeHit += SpellHitFn(spell_auto_repair_SpellScript::CheckCooldownForTarget);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_auto_repair_SpellScript();
	}
};

class spell_systems_shutdown : public SpellScriptLoader
{
public:
	spell_systems_shutdown() : SpellScriptLoader("spell_systems_shutdown") { }

	class spell_systems_shutdown_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_systems_shutdown_AuraScript);

		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			Creature* owner = GetOwner()->ToCreature();
			if (!owner)
				return;

			//! This could probably in the SPELL_EFFECT_SEND_EVENT handler too:
			owner->AddUnitState(UNIT_STATE_STUNNED | UNIT_STATE_ROOT);
			owner->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
			owner->RemoveAurasDueToSpell(SPELL_GATHERING_SPEED);
		}

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			Creature* owner = GetOwner()->ToCreature();
			if (!owner)
				return;

			owner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		}

		void Register() override
		{
			OnEffectApply += AuraEffectApplyFn(spell_systems_shutdown_AuraScript::OnApply, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_REAL);
			OnEffectRemove += AuraEffectRemoveFn(spell_systems_shutdown_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_systems_shutdown_AuraScript();
	}
};

class FlameLeviathanPursuedTargetSelector
{
	enum Area
	{
		AREA_FORMATION_GROUNDS = 4652,
	};

public:
	explicit FlameLeviathanPursuedTargetSelector(Unit* unit) : _me(unit) { };

	bool operator()(WorldObject* target) const
	{
		//! No players, only vehicles (@todo check if blizzlike)
		Creature* creatureTarget = target->ToCreature();
		if (!creatureTarget)
			return true;

		//! NPC entries must match
		if (creatureTarget->GetEntry() != NPC_SALVAGED_DEMOLISHER && creatureTarget->GetEntry() != NPC_SALVAGED_SIEGE_ENGINE)
			return true;

		//! NPC must be a valid vehicle installation
		Vehicle* vehicle = creatureTarget->GetVehicleKit();
		if (!vehicle)
			return true;

		//! Entity needs to be in appropriate area
		if (target->GetAreaId() != AREA_FORMATION_GROUNDS)
			return true;

		//! Vehicle must be in use by player
		bool playerFound = false;
		for (SeatMap::const_iterator itr = vehicle->Seats.begin(); itr != vehicle->Seats.end() && !playerFound; ++itr)
			// if (IS_PLAYER_GUID(itr->second.Passenger.Guid)) ARREGLAR ESTO, OBTENER UNIDAD CON ESA GUID Y VER SI ES PLAYER REALMENTE
				playerFound = true;

		return !playerFound;
	}

private:
	Unit const* _me;
};

class spell_pursue : public SpellScriptLoader
{
public:
	spell_pursue() : SpellScriptLoader("spell_pursue") { }

	class spell_pursue_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_pursue_SpellScript);

		bool Load() override
		{
			_target = NULL;
			return true;
		}

			void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(FlameLeviathanPursuedTargetSelector(GetCaster()));
			if (targets.empty())
			{
				if (Creature* caster = GetCaster()->ToCreature())
					caster->AI()->EnterEvadeMode();
			}
			else
			{
				//! In the end, only one target should be selected
				_target = Trinity::Containers::SelectRandomContainerElement(targets);
				FilterTargetsSubsequently(targets);
			}
		}

		void FilterTargetsSubsequently(std::list<WorldObject*>& targets)
		{
			targets.clear();
			if (_target)
				targets.push_back(_target);
		}

		void HandleScript(SpellEffIndex /*eff*/)
		{
			Creature* caster = GetCaster()->ToCreature();
			if (!caster)
				return;

			caster->AI()->AttackStart(GetHitUnit());    // Chase target

			caster->getThreatManager().resetAllAggro();
			caster->getThreatManager().doAddThreat(GetHitUnit(), std::numeric_limits<float>::max());
			caster->GetMotionMaster()->MoveChase(GetHitUnit());

			for (SeatMap::const_iterator itr = caster->GetVehicleKit()->Seats.begin(); itr != caster->GetVehicleKit()->Seats.end(); ++itr)
			{
				if (Player* passenger = ObjectAccessor::GetPlayer(*caster, itr->second.Passenger.Guid))
				{
					caster->AI()->Talk(EMOTE_PURSUE, passenger);
					return;
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_pursue_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_pursue_SpellScript::FilterTargetsSubsequently, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
			OnEffectHitTarget += SpellEffectFn(spell_pursue_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
		}

		WorldObject* _target;
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_pursue_SpellScript();
	}
};

class spell_vehicle_throw_passenger : public SpellScriptLoader
{
public:
	spell_vehicle_throw_passenger() : SpellScriptLoader("spell_vehicle_throw_passenger") { }

	class spell_vehicle_throw_passenger_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_vehicle_throw_passenger_SpellScript);
		void HandleScript(SpellEffIndex effIndex)
		{
			Spell* baseSpell = GetSpell();
			SpellCastTargets targets = baseSpell->m_targets;
			int32 damage = GetEffectValue();
			if (targets.HasTraj())
				if (Vehicle* vehicle = GetCaster()->GetVehicleKit())
					if (Unit* passenger = vehicle->GetPassenger(damage - 1))
					{
				// use 99 because it is 3d search
				std::list<WorldObject*> targetList;
				Trinity::WorldObjectSpellAreaTargetCheck check(99, GetExplTargetDest(), GetCaster(), GetCaster(), GetSpellInfo(), TARGET_CHECK_DEFAULT, NULL);
				Trinity::WorldObjectListSearcher<Trinity::WorldObjectSpellAreaTargetCheck> searcher(GetCaster(), targetList, check);
				GetCaster()->GetMap()->VisitAll(GetCaster()->m_positionX, GetCaster()->m_positionY, 99, searcher);
				float minDist = 99 * 99;
				Unit* target = NULL;
				for (std::list<WorldObject*>::iterator itr = targetList.begin(); itr != targetList.end(); ++itr)
				{
					if (Unit* unit = (*itr)->ToUnit())
						if (unit->GetEntry() == NPC_SEAT)
							if (Vehicle* seat = unit->GetVehicleKit())
								if (!seat->GetPassenger(0))
									if (Unit* device = seat->GetPassenger(2))
										if (!device->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
										{
						float dist = unit->GetExactDistSq(targets.GetDstPos());
						if (dist < minDist)
						{
							minDist = dist;
							target = unit;
						}
										}
				}
				if (target && target->IsWithinDist2d(targets.GetDstPos(), GetSpellInfo()->Effects[effIndex].CalcRadius() * 2)) // now we use *2 because the location of the seat is not correct
					passenger->EnterVehicle(target, 0);
				else
				{
					passenger->ExitVehicle();
					float x, y, z;
					targets.GetDstPos()->GetPosition(x, y, z);
					passenger->GetMotionMaster()->MoveJump(x, y, z, targets.GetSpeedXY(), targets.GetSpeedZ());
				}
					}
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_vehicle_throw_passenger_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_vehicle_throw_passenger_SpellScript();
	}
};

enum LiquidPyriteEvents
{
	EVENT_CHECK_DEMOLISHER = 1

};

class npc_liquid_pyrite : public CreatureScript
{
public:
	npc_liquid_pyrite() : CreatureScript("npc_liquid_pyrite") { }

	struct npc_liquid_pyriteAI : public ScriptedAI
	{
		npc_liquid_pyriteAI(Creature* creature) : ScriptedAI(creature),
			_instance(creature->GetInstanceScript())
		{
			events.ScheduleEvent(EVENT_CHECK_DEMOLISHER, 1000);
			me->DespawnOrUnsummon(180000); // 60000
			//modelid set.
		}


		void UpdateAI(uint32 diff) override
		{

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_DEMOLISHER:
					if (Unit* demolisher = me->FindNearestCreature(33109, 7.0f, true))
					{
						if (demolisher->GetPower(POWER_ENERGY) < 50)
						{
							demolisher->ModifyPower(POWER_ENERGY, 25);
							me->DespawnOrUnsummon();
							break;
						}
					}
					events.ScheduleEvent(EVENT_CHECK_DEMOLISHER, 1500);
					break;
				default:
					break;
				}
			}

		}

	private:
		InstanceScript* const _instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_liquid_pyriteAI>(creature);
	}
};

class npc_fl_outro_controller : public CreatureScript
{
public:
	npc_fl_outro_controller() : CreatureScript("npc_fl_outro_controller") { }

	struct npc_fl_outro_controllerAI : public PassiveAI
	{
		npc_fl_outro_controllerAI(Creature* creature) : PassiveAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			_outroStarted = false;
		}

		void Reset() override
		{
			_outroStarted = false;
		}

			void DoAction(int32 action) override
		{
			if (!_outroStarted)
			if (action == ACTION_DO_START_OUTRO)
			{
				events.ScheduleEvent(EVENT_OUTRO_STEP_1, 5 * IN_MILLISECONDS);
				_outroStarted = true;
			}

		}

			void DamageTaken(Unit* /*who*/, uint32& damage) override
		{
			if (damage >= me->GetHealth())
			damage = 0;
		}

			void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			/*if(!_outroStarted) // Testing purposes.
			if (Player* p = me->SelectNearestPlayer(50.0f))
			{
			_outroStarted = true;
			events.ScheduleEvent(EVENT_OUTRO_STEP_1, 1000);
			}	*/

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_OUTRO_STEP_1:
					//Summon expeditioners, mages with teleport spell...etc

					if (brannFlyingMachine = me->SummonCreature(30134, 370.014f, 76.73f, 455.20f, 0, TEMPSUMMON_TIMED_DESPAWN, 300000))
						if (brann = me->SummonCreature(NPC_BRANZ_BRONZBEARD, brannFlyingMachine->GetPositionX(), brannFlyingMachine->GetPositionY(), brannFlyingMachine->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 300000))
						{
						brann->EnterVehicle(brannFlyingMachine, 0);
						brannFlyingMachine->GetMotionMaster()->MoveLand(0, brannFlyingMachinelandPos);
						}

					for (uint8 i = 0; i < KIRIN_TOR_MAGES_OUTRO; i++)
						if (Creature* ktmage = me->SummonCreature(33672, magePos[i], TEMPSUMMON_TIMED_DESPAWN, 300000))
							ktmage->AI()->DoCast(51347);

					if (archmage = me->SummonCreature(33696, rhydianOutroPos, TEMPSUMMON_TIMED_DESPAWN, 300000)){}

					for (uint8 i = 0; i < 2; i++)
						if (Creature* ktbtmage = me->SummonCreature(33662, outroBattleMagesPos[i], TEMPSUMMON_TIMED_DESPAWN, 300000))
							ktbtmage->AI()->DoCast(70634); // Channeling visual.

					if (me->SummonGameObject(191164, 280.250f, -139.76f, 409.80f, 1.553f, 0, 0, 0, 0, 0))

						// Summon in random positions the expeditioners (Engineers and defenders) and move them
						for (uint8 i = 0; i < EXPEDITIONERS_OUTRO; i++)
						{
						float x = urand(167, 231);
						float y = urand(41, 65);
						bool rand = urand(0, 1);
						uint32 npcId;

						switch (rand)
						{
						case 0:
							npcId = 33287;
							break;
						case 1:
							npcId = 33816;
							break;
						}

						if (Creature* expeditioner = me->SummonCreature(npcId, x, y, 409.80f, 0, TEMPSUMMON_TIMED_DESPAWN, 300000))
						{
							expeditioner->SetWalk(false);
							expeditioner->GetMotionMaster()->MovePoint(0, expeditionersPos[i]);
						}
						}

					events.ScheduleEvent(EVENT_OUTRO_STEP_2, 24000);
					break;
				case EVENT_OUTRO_STEP_2:
					if (brann)
					{
						brann->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						brannFlyingMachine->SetOrientation(4.74f);
						brannFlyingMachine->SetFacingTo(4.74f);
						brann->ExitVehicle();
						brann->SetWalk(true);
						brann->GetMotionMaster()->MovePoint(0, 280.37f, -104.15f, 409.803f);
					}
					events.ScheduleEvent(EVENT_OUTRO_STEP_3, 14000);
					break;
				case EVENT_OUTRO_STEP_3:
					if (archmage)
						archmage->AI()->Talk(2);
					events.ScheduleEvent(EVENT_OUTRO_STEP_4, 6000);
					break;
				case EVENT_OUTRO_STEP_4:
					if (brann)
						brann->AI()->Talk(3); // Perhaps...
					events.ScheduleEvent(EVENT_OUTRO_STEP_5, 10000);
					break;
				case EVENT_OUTRO_STEP_5:
					if (archmage)
						archmage->AI()->Talk(3); // None at all.
					events.ScheduleEvent(EVENT_OUTRO_STEP_6, 10000);
					break;
				case EVENT_OUTRO_STEP_6:
					if (brann)
						brann->AI()->Talk(4); // What about the plate...
					events.ScheduleEvent(EVENT_OUTRO_STEP_7, 10000);
					break;
				case EVENT_OUTRO_STEP_7:
					if (archmage)
						archmage->AI()->Talk(4); // The Kirin Tor...
					events.ScheduleEvent(EVENT_OUTRO_STEP_8, 10000);
					break;
				case EVENT_OUTRO_STEP_8:
					if (archmage)
						archmage->AI()->Talk(5); // We can sneak.
					events.ScheduleEvent(EVENT_OUTRO_STEP_9, 10000);
					break;
				case EVENT_OUTRO_STEP_9:
					if (brann)
						brann->AI()->Talk(5); // Sneak?
					events.ScheduleEvent(EVENT_OUTRO_STEP_10, 6000);
					break;
				case EVENT_OUTRO_STEP_10:
					if (archmage)
						archmage->AI()->Talk(6); // We can sneak.
					events.ScheduleEvent(EVENT_OUTRO_STEP_11, 10000);
					break;
				case EVENT_OUTRO_STEP_11:
					if (brann)
						brann->AI()->Talk(6); // Fine.
					//events.ScheduleEvent(EVENT_OUTRO_STEP_10, 6000);
					break;
				default:
					break;
				}
			}
		}
	private:
		Creature* archmage;
		Creature* brannFlyingMachine;
		Creature* brann;
		bool _outroStarted;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_fl_outro_controllerAI(creature);
	}
};

// This spell break the ice tomb of SPELL_HODIRS_FURY
class spell_leviathan_blaze_flames_effect : public SpellScriptLoader
{
	enum
	{
		SPELL_HODIRS_FURY_TRIGGERED = 62297
	};

public:
	spell_leviathan_blaze_flames_effect() : SpellScriptLoader("spell_leviathan_blaze_flames_effect") {}

	class spell_leviathan_blaze_flames_effect_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_leviathan_blaze_flames_effect_SpellScript);

		bool Validate(SpellInfo const* /*spell*/)
		{
			if (!sSpellMgr->GetSpellInfo(65044))
				return false;
			return true;
		}

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (GetHitUnit()->HasAura(SPELL_HODIRS_FURY_TRIGGERED))
				GetHitUnit()->RemoveAura(SPELL_HODIRS_FURY_TRIGGERED);
		}

		void SetDamage()
		{
			PreventHitDamage();
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_leviathan_blaze_flames_effect_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
			OnHit += SpellHitFn(spell_leviathan_blaze_flames_effect_SpellScript::SetDamage);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_leviathan_blaze_flames_effect_SpellScript();
	}
};

void AddSC_boss_flame_leviathan()
{
	new boss_flame_leviathan();
	new boss_flame_leviathan_seat();
	new boss_flame_leviathan_defense_turret();
	new boss_flame_leviathan_defense_cannon();
	new boss_flame_leviathan_overload_device();
	new boss_flame_leviathan_safety_container();
	new npc_mechanolift();
	new npc_pool_of_tar();
	new npc_colossus();
	new npc_thorims_hammer();
	new npc_mimirons_inferno();
	new npc_hodirs_fury();
	new npc_freyas_ward();
	new npc_freya_ward_summon();
	new npc_lorekeeper();
	new npc_brann_bronzebeard();
	new npc_bronzebeard_radio();
	new npc_ulduar_gauntlet_generator();
	new npc_ulduar_mechanostriker();
	new npc_liquid_pyrite();
	new npc_fl_outro_controller();

	new go_ulduar_tower();

	new achievement_three_car_garage_demolisher();
	new achievement_three_car_garage_chopper();
	new achievement_three_car_garage_siege();
	new achievement_shutout();
	new achievement_unbroken();
	new achievement_orbital_bombardment();
	new achievement_orbital_devastation();
	new achievement_nuked_from_orbit();
	new achievement_orbit_uary();

	new spell_load_into_catapult();
	new spell_auto_repair();
	new spell_systems_shutdown();
	new spell_pursue();
	new spell_vehicle_throw_passenger();



	new spell_leviathan_blaze_flames_effect();
}