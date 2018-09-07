/*
* Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
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

#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "ulduar.h"
#include "Vehicle.h"
#define CAST_CRE(a)     (dynamic_cast<Creature*>(a))

enum Yells
{
	SAY_AGGRO = 0,
	SAY_HARDMODE_ON = 1,
	SAY_MKII_ACTIVATE = 2,
	SAY_MKII_SLAY = 3,
	SAY_MKII_DEATH = 4,
	SAY_VX001_ACTIVATE = 5,
	SAY_VX001_SLAY = 6,
	SAY_VX001_DEATH = 7,
	SAY_AERIAL_ACTIVATE = 8,
	SAY_AERIAL_SLAY = 9,
	SAY_AERIAL_DEATH = 10,
	SAY_V07TRON_ACTIVATE = 11,
	SAY_V07TRON_SLAY = 12,
	SAY_V07TRON_DEATH = 13,
	SAY_BERSERK = 14
};

enum Spells
{
	SPELL_JETPACK = 63341, // Unused
	SPELL_EMERGENCY_MODE = 64582,
	SPELL_SELF_REPAIR = 64383,

	// Leviathan MK II
	SPELL_MINES_SPAWN = 65347,
	SPELL_FLAME_SUPPRESSANT_MK = 64570,
	SPELL_NAPALM_SHELL = 63666,
	SPELL_PLASMA_BLAST = 62997,
	SPELL_PROXIMITY_MINES = 63027,
	SPELL_SHOCK_BLAST = 63631,
	SPELL_EXPLOSION = 66351,

	// VX 001
	SPELL_FROSTBOMB = 64623, // 64627 ?
	SPELL_FROST_BOMB_VISUAL = 64624,
	SPELL_FROST_BOMB_EXPLOSION_10 = 64626,
	SPELL_FROST_BOMB_EXPLOSION_25 = 65333,

	SPELL_P3WX2_LASER_BARRAGE = 63293, // Casted through SPELL_SPINNING_UP
	// Rapid Burst
	/*SPELL_RAPID_BURST_LEFT = 63387,
	SPELL_RAPID_BURST_RIGHT = 64019,
	SPELL_RAPID_BURST = 63382, // Cast by VX-001
	SPELL_RAPID_BURST_TARGET_ME = 64841, // Cast by Burst Target
	SPELL_SUMMON_BURST_TARGET = 64840, // Cast by VX-001*/
	SPELL_RAPID_BURST = 63382,
	SPELL_RAPID_BURST_LEFT_10 = 63387,
	SPELL_RAPID_BURST_RIGHT_10 = 64019,
	SPELL_RAPID_BURST_LEFT_25 = 64531,
	SPELL_RAPID_BURST_RIGHT_25 = 64532,

	/*SPELL_ROCKET_STRIKE = 63036,*/
	SPELL_ROCKET_STRIKE_AURA = 64064,
	SPELL_ROCKET_STRIKE_DMG = 63041,
	// Rocket Strike
	SPELL_SUMMON_ROCKET_STRIKE = 63036,
	SPELL_SCRIPT_EFFECT_ROCKET_STRIKE = 63681, // Cast by Rocket (Mimiron Visual)
	SPELL_ROCKET_STRIKE = 64064, // Added in creature_template_addon
	SPELL_ROCKET_STRIKE_LEFT = 64402, // Cast by VX-001
	SPELL_ROCKET_STRIKE_BOTH = 65034, // Cast by VX-001
	SPELL_SPINNING_UP = 63414,
	SPELL_HEAT_WAVE = 63677,
	SPELL_HAND_PULSE_LEFT_10 = 64348,
	SPELL_HAND_PULSE_RIGHT_10 = 64352,
	SPELL_HAND_PULSE_LEFT_25 = 64537,
	SPELL_HAND_PULSE_RIGHT_25 = 64536,

	// Aerial Command Unit
	SPELL_PLASMA_BALL = 63689,
	SPELL_MAGNETIC_CORE = 64436,
	SPELL_MAGNETIC_CORE_VISUAL = 64438,
	SPELL_BOOM_BOT = 63767,
	SPELL_BOOM_BOT_PERIODIC = 63801,
	SPELL_MAGNETIC_FIELD = 64668,
	SPELL_HOVER = 57764, // Set Hover position
	SPELL_BERSERK = 47008,

	// Additonal spells
	SPELL_DEAFENING_SIREN = 64616,

	SPELL_SELF_DESTRUCTION = 64610,
	SPELL_SELF_DESTRUCTION_VISUAL = 64613,
	SPELL_FLAME_SUPPRESSANT_VX001 = 65192,
	SPELL_SUMMON_FLAMES_INITIAL = 64563,
	SPELL_FLAME = 64561,
	SPELL_NOT_SO_FRIENDLY_FIRE = 65040,

	SPELL_WATER_SPRAY = 64619,
	SPELL_RIDE_VEHICLE = 46598,
	SPELL_FREEZE_ANIM_STUN = 63354, // used to prevent mkii from doing stuff?..
	SPELL_FREEZE_ANIM = 16245,  // Idle aura. Freezes animation.
	SPELL_HEAT_WAVE_AURA = 63679,

	SPELL_SUMMON_ASSAULT_BOT_TRIGGER = 64425,
	SPELL_SUMMON_ASSAULT_BOT_DUMMY = 64426,
	SPELL_SUMMON_ASSAULT_BOT = 64427,

	SPELL_SUMMON_JUNK_BOT = 63819,
	SPELL_SUMMON_JUNK_BOT_TRIGGER = 63820,
	SPELL_SUMMON_JUNK_BOT_DUMMY = 64398,

	SPELL_SUMMON_FIRE_BOT = 64622,
	SPELL_SUMMON_FIRE_BOT_DUMMY = 64621,
	SPELL_SUMMON_FIRE_BOT_TRIGGER = 64620,

	SPELL_TELEPORT_VISUAL = 41232,
	SPELL_SLEEP_VISUAL_1 = 64393,
	SPELL_SLEEP_VISUAL_2 = 64394,

	SPELL_WELD = 63339,
	SPELL_SEAT_1 = 52391,
	SPELL_SEAT_2 = 63313,
	SPELL_SEAT_3 = 63314,
	SPELL_SEAT_5 = 63316,
	SPELL_SEAT_6 = 63344,
	SPELL_SEAT_7 = 63345,

	SPELL_MOUNT_MKII = 64387,

	SPELL_MOUNT_VX_001 = 64388,

	SPELL_VEHICLE_DAMAGED = 63415,
};

//Spells
#define SPELL_HAND_PULSE_LEFT          RAID_MODE(SPELL_HAND_PULSE_LEFT_10, SPELL_HAND_PULSE_LEFT_25)
#define SPELL_HAND_PULSE_RIGHT          RAID_MODE(SPELL_HAND_PULSE_RIGHT_10, SPELL_HAND_PULSE_RIGHT_25)

uint32 const RepairSpells[4] =
{
	SPELL_SEAT_1,
	SPELL_SEAT_2,
	SPELL_SEAT_3,
	SPELL_SEAT_5
};


enum Actions
{
	DO_START_ENCOUNTER = 1,
	DO_ACTIVATE_VX001,
	DO_START_VX001,
	DO_ACTIVATE_AERIAL,
	DO_START_AERIAL,
	DO_DISABLE_AERIAL,
	DO_ACTIVATE_V0L7R0N,
	DO_LEVIATHAN_ASSEMBLED,
	DO_LEVIATHAN_SELF_REPAIR_START,
	DO_LEVIATHAN_SELF_REPAIR_END,
	DO_VX001_ASSEMBLED,
	DO_VX001_SELF_REPAIR_START,
	DO_VX001_SELF_REPAIR_END,
	DO_AERIAL_ASSEMBLED,
	DO_AERIAL_SELF_REPAIR_START,
	DO_AERIAL_SELF_REPAIR_END,
	DO_ENTER_ENRAGE,
	DO_ACTIVATE_HARD_MODE,
	DO_INCREASE_FLAME_COUNT,
	DO_DECREASE_FLAME_COUNT,
	DATA_GET_HARD_MODE,
	DATA_FLAME_COUNT
};

enum Npcs
{
	NPC_ROCKET = 34050,
	NPC_BURST_TARGET = 34211,
	NPC_JUNK_BOT = 33855,
	NPC_ASSAULT_BOT = 34057,
	NPC_BOOM_BOT = 33836,
	NPC_EMERGENCY_BOT = 34147,
	NPC_FLAMES_INITIAL = 34363,
	NPC_FLAME_SPREAD = 34121,
	NPC_FROST_BOMB = 34149,
	NPC_MKII_TURRET = 34071,
	NPC_PROXIMITY_MINE = 34362,
	NPC_MIMIRON_FOCUS = 33835
};

// Achievements
#define ACHIEVEMENT_SET_UP_US_THE_BOMB          RAID_MODE(2989, 3237)
// TODO: 
// Achiev 2989: Criterias 10543, 10544, 10545
// Achiev 3237: Criterias 10546, 10547, 10548
// Which criteria is reponsible for which step ?
// 26491 - 38080 - 45033 <- what do these numbers mean ?

enum BombIndices // Scripts are present, but criteria-id <-> script is missing
{
	DATA_AVOIDED_PROXIMITY_MINES = 30,
	DATA_AVOIDED_ROCKET_STRIKES,
	DATA_AVOIDED_BOOM_BOT_EXPLOSION
};

enum MimironChests
{
	CACHE_OF_INNOVATION_10 = 194789,
	CACHE_OF_INNOVATION_HARDMODE_10 = 194957,
	CACHE_OF_INNOVATION_25 = 194956,
	CACHE_OF_INNOVATION_HARDMODE_25 = 194958
};

Position const SummonPos[9] =
{
	{ 2703.93f, 2569.32f, 364.397f, 0 },
	{ 2715.33f, 2569.23f, 364.397f, 0 },
	{ 2726.85f, 2569.28f, 364.397f, 0 },
	{ 2765.24f, 2534.38f, 364.397f, 0 },
	{ 2759.54f, 2544.30f, 364.397f, 0 },
	{ 2753.82f, 2554.22f, 364.397f, 0 },
	{ 2764.95f, 2604.11f, 364.397f, 0 },
	{ 2759.19f, 2594.26f, 364.397f, 0 },
	{ 2753.56f, 2584.30f, 364.397f, 0 }
};

#define FLAME_CAP RAID_MODE( uint32(140), uint32(115))

struct EqualHelper // Helper for Mimirons map that stores the members repair states
{
	EqualHelper(bool& base) : __base(base) {}
	void operator()(std::pair<uint32, bool> value)
	{
		__base = __base && value.second;
	}

private:
	bool& __base;
};

/************************************************************************/
/*                              Mimiron                                 */
/************************************************************************/

class boss_mimiron : public CreatureScript
{
private:
	enum MyEvents
	{
		// General events
		EVENT_CHECK_TARGET = 1,
		EVENT_ENRAGE,
		EVENT_FLAME,

		// Event - stepping for phases
		EVENT_STEP_1,
		EVENT_STEP_2,
		EVENT_STEP_3,
		EVENT_STEP_4,
		EVENT_STEP_5,
		EVENT_STEP_6,
		EVENT_STEP_7,
		EVENT_STEP_8,
		EVENT_STEP_9,
		EVENT_COMPUTER_10_MINUTES,
		EVENT_COMPUTER_9_MINUTES,
		EVENT_COMPUTER_8_MINUTES,
		EVENT_COMPUTER_7_MINUTES,
		EVENT_COMPUTER_6_MINUTES,
		EVENT_COMPUTER_5_MINUTES,
		EVENT_COMPUTER_4_MINUTES,
		EVENT_COMPUTER_3_MINUTES,
		EVENT_COMPUTER_2_MINUTES,
		EVENT_COMPUTER_1_MINUTE,
		EVENT_COMPUTER_SECUENCE_FINALIZED,


		// Events for bot-alive-checks
		EVENT_CHECK_BOTALIVE,
		EVENT_REPAIR_CHECKER,

		EVENT_OUTTRO_1,
		EVENT_OUTTRO_2,
		EVENT_OUTTRO_3,
	};

	enum
	{
		TIMER_BOT_ALIVE_CHECK = 250
	};

	enum MyPhase
	{
		PHASE_IDLE = 0,
		PHASE_INTRO,
		PHASE_COMBAT,
		PHASE_VX001_ACTIVATION,
		PHASE_AERIAL_ACTIVATION,
		PHASE_V0L7R0N_ACTIVATION
	};

public:
	boss_mimiron() : CreatureScript("boss_mimiron") {}

	struct boss_mimironAI : public BossAI
	{
		boss_mimironAI(Creature* creature) : BossAI(creature, BOSS_MIMIRON)
		{
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_ROCKET_STRIKE_DMG, true);
			me->SetReactState(REACT_PASSIVE);
			gotEncounterFinished = false;
		}

		void DespawnCreatures(uint32 entry, float distance)
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, me, entry, distance);

			if (creatures.empty())
				return;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
				(*iter)->DespawnOrUnsummon();
		}

		void Reset()
		{
			gotEncounterFinished = gotEncounterFinished || (instance->GetBossState(BOSS_MIMIRON) == DONE);
			if (gotEncounterFinished)
				return;

			_Reset();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
			me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_USE_STANDING);
			me->SetVisible(true);
			me->ExitVehicle();
			me->GetMotionMaster()->MoveTargetedHome();

			instance->SetData(DATA_MIMIRON_ELEVATOR, GO_STATE_ACTIVE);

			phase = PHASE_IDLE;
			events.SetPhase(phase);
			flameCount = 0;
			gotHardMode = false;
			enraged = false;

			events.ScheduleEvent(EVENT_CHECK_TARGET, 7 * IN_MILLISECONDS);

			DespawnCreatures(NPC_FLAMES_INITIAL, 100.0f);
			DespawnCreatures(NPC_PROXIMITY_MINE, 100.0f);
			DespawnCreatures(NPC_ROCKET, 100.0f);
			DespawnCreatures(NPC_JUNK_BOT, 100.0f);
			DespawnCreatures(NPC_ASSAULT_BOT, 100.0f);
			DespawnCreatures(NPC_BOOM_BOT, 100.0f);
			DespawnCreatures(NPC_EMERGENCY_BOT, 100.0f);

			for (uint8 data = DATA_LEVIATHAN_MK_II; data <= DATA_AERIAL_UNIT; ++data)
				if (Creature* creature = ObjectAccessor::GetCreature(*me, instance->GetGuidData(data)))
					if (creature->IsAlive())
					{
				creature->ExitVehicle();
				creature->AI()->EnterEvadeMode();
					}


			if (GameObject* door1 = me->FindNearestGameObject(GO_MIMIRON_DOOR_1, 200.0f))
				instance->HandleGameObject(door1->GetGUID(), true);

			if (GameObject* door2 = me->FindNearestGameObject(GO_MIMIRON_DOOR_2, 200.0f))
				instance->HandleGameObject(door2->GetGUID(), true);

			if (GameObject* door3 = me->FindNearestGameObject(GO_MIMIRON_DOOR_3, 200.0f))
				instance->HandleGameObject(door3->GetGUID(), true);

			if (GameObject* go = me->FindNearestGameObject(GO_BIG_RED_BUTTON, 200))
			{
				go->SetGoState(GO_STATE_READY);
				go->SetLootState(GO_JUST_DEACTIVATED);
				go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
			}

			isSelfRepairing[DATA_LEVIATHAN_MK_II] = false;
			isSelfRepairing[DATA_VX_001] = false;
			isSelfRepairing[DATA_AERIAL_UNIT] = false;

			setUpUsTheBomb[DATA_AVOIDED_PROXIMITY_MINES] = true;
			setUpUsTheBomb[DATA_AVOIDED_ROCKET_STRIKES] = true;
			setUpUsTheBomb[DATA_AVOIDED_BOOM_BOT_EXPLOSION] = true;

			DoCast(me, SPELL_WELD);

			if (Unit* mkii = ObjectAccessor::GetUnit(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
				DoCast(mkii, 63314);
		}

		void BotAliveCheck()
		{
			if (phase != PHASE_COMBAT)
				return;

			//mapMutex.acquire();
			bool res = true;
			// Check if there is still a false value.
			std::for_each(isSelfRepairing.begin(), isSelfRepairing.end(), EqualHelper(res));
			//mapMutex.release();
			if (res)
			{

				Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II));
				Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001));
				Creature* AerialUnit = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT));
				if (Leviathan && VX_001 && AerialUnit)
				{
					Leviathan->DisappearAndDie();
					VX_001->DisappearAndDie();
					AerialUnit->DisappearAndDie();
					DespawnCreatures(NPC_FLAMES_INITIAL, 100.0f);
					DespawnCreatures(NPC_PROXIMITY_MINE, 100.0f);
					DespawnCreatures(NPC_ROCKET, 100);
					me->ExitVehicle();
                    if (instance)
                        instance->SetBossState(BOSS_MIMIRON, DONE);
					EncounterPostProgress();
				}
			}
		}

		void EncounterPostProgress()
		{
			if (gotEncounterFinished)
				return;

			Talk(SAY_V07TRON_DEATH);

			me->SetReactState(REACT_PASSIVE);
			me->RemoveAllAuras();
			me->AttackStop();
			//me->setFaction(FACTION_FRIENDLY);
			me->DeleteThreatList();
			me->CombatStop(true);
			if (instance)
			{
				if (GameObject* door1 = me->FindNearestGameObject(GO_MIMIRON_DOOR_1, 200.0f))
					instance->HandleGameObject(door1->GetGUID(), true);

				if (GameObject* door2 = me->FindNearestGameObject(GO_MIMIRON_DOOR_2, 200.0f))
					instance->HandleGameObject(door2->GetGUID(), true);

				if (GameObject* door3 = me->FindNearestGameObject(GO_MIMIRON_DOOR_3, 200.0f))
					instance->HandleGameObject(door3->GetGUID(), true);

				if (gotHardMode)
				{
					me->SummonGameObject(RAID_MODE(CACHE_OF_INNOVATION_HARDMODE_10, CACHE_OF_INNOVATION_HARDMODE_25), 2744.65f, 2569.46f, 364.314f, 3.14159f, 0, 0, 0.7f, 0.7f, WEEK);
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(1); //Self-destruct sequence terminated. override code A905..

					}

					Map* map = me->GetMap();
					if (map && map->IsDungeon())
					{
						std::list<Player*> playerList;
						Map::PlayerList const& players = map->GetPlayers();
						for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
						{
							if (Player* player = itr->GetSource())
							{
								if (AchievementEntry const* firefighter = sAchievementMgr->GetAchievement(RAID_MODE(3180, 3189)))
									player->CompletedAchievement(firefighter);
							}
						}
					}
				}
				else
					me->SummonGameObject(RAID_MODE(CACHE_OF_INNOVATION_10, CACHE_OF_INNOVATION_25), 2744.65f, 2569.46f, 364.314f, 3.14159f, 0, 0, 0.7f, 0.7f, WEEK);

				instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_KILL_CREATURE, NPC_LEVIATHAN_MKII, 1);
			}
			_JustDied();
			// TODO: OUTRO.
			me->DespawnOrUnsummon(5 * IN_MILLISECONDS);
		}

		void EnterCombat(Unit* /*who*/)
		{
			_EnterCombat();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
			me->RemoveAurasDueToSpell(SPELL_WELD);
			phase = PHASE_INTRO;
			events.SetPhase(phase);
			if (gotHardMode)
			{
				events.ScheduleEvent(EVENT_FLAME, 8 * IN_MILLISECONDS);

				if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
				{
					computer->AI()->Talk(0);
					events.ScheduleEvent(EVENT_COMPUTER_10_MINUTES, 3 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_STEP_1, 7 * IN_MILLISECONDS, 0, phase);
				}
			}
			else
			{
				events.ScheduleEvent(EVENT_STEP_1, 1 * IN_MILLISECONDS, 0, phase);
			}
			events.ScheduleEvent(EVENT_ENRAGE, gotHardMode ? 10 * MINUTE*IN_MILLISECONDS : 15 * MINUTE*IN_MILLISECONDS); // Enrage in 10 (hard mode) or 15 min

			if (GameObject* door1 = me->FindNearestGameObject(GO_MIMIRON_DOOR_1, 200.0f))
				instance->HandleGameObject(door1->GetGUID(), false);

			if (GameObject* door2 = me->FindNearestGameObject(GO_MIMIRON_DOOR_2, 200.0f))
				instance->HandleGameObject(door2->GetGUID(), false);

			if (GameObject* door3 = me->FindNearestGameObject(GO_MIMIRON_DOOR_3, 200.0f))
				instance->HandleGameObject(door3->GetGUID(), false);

			if (GameObject* go = me->FindNearestGameObject(GO_BIG_RED_BUTTON, 200.0f))
				go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
		}

		void JustDied(Unit* /*victim*/)
		{

            if (instance)
                instance->SetBossState(BOSS_MIMIRON, DONE);
			EncounterPostProgress();
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			while (uint32 event = events.ExecuteEvent())
			{
				switch (event)
				{
				case EVENT_COMPUTER_10_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(2);
						events.ScheduleEvent(EVENT_COMPUTER_9_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_9_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(3);
						events.ScheduleEvent(EVENT_COMPUTER_8_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_8_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(4);
						events.ScheduleEvent(EVENT_COMPUTER_7_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_7_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(5);
						events.ScheduleEvent(EVENT_COMPUTER_6_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_6_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(6);
						events.ScheduleEvent(EVENT_COMPUTER_5_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_5_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(7);
						events.ScheduleEvent(EVENT_COMPUTER_4_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_4_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(8);
						events.ScheduleEvent(EVENT_COMPUTER_3_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_3_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(9);
						events.ScheduleEvent(EVENT_COMPUTER_2_MINUTES, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_2_MINUTES:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(10);
						events.ScheduleEvent(EVENT_COMPUTER_1_MINUTE, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_COMPUTER_1_MINUTE:
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					{
						computer->AI()->Talk(11);
						//events.ScheduleEvent(EVENT_COMPUTER_1_MINUTE, 60 * IN_MILLISECONDS);
					}
					break;
				case EVENT_CHECK_TARGET:
					// prevent mimiron staying infight with leviathan introduced in rev #b40bf69
					// TODO: find out why this happens
					if (!SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
					{
						EnterEvadeMode();
						return;
					}
					events.ScheduleEvent(EVENT_CHECK_TARGET, 7 * IN_MILLISECONDS);
					return;
				case EVENT_ENRAGE:
					Talk(SAY_BERSERK);
					for (uint8 data = DATA_LEVIATHAN_MK_II; data <= DATA_AERIAL_UNIT; ++data)
						if (Creature* creature = ObjectAccessor::GetCreature(*me, instance->GetGuidData(data)))
							creature->AI()->DoAction(DO_ENTER_ENRAGE);
					enraged = true;

					if (gotHardMode)
					{
						if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
						{
							computer->AI()->Talk(12);
						}

						DoCast(me, SPELL_SELF_DESTRUCTION, true);
						DoCast(me, SPELL_SELF_DESTRUCTION_VISUAL, true);
					}
					return;
				case EVENT_FLAME:
					for (uint8 i = 0; i < 3; ++i)
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
							DoCast(target, SPELL_SUMMON_FLAMES_INITIAL, true);
					events.ScheduleEvent(EVENT_FLAME, 26 * IN_MILLISECONDS);
					return;
				case EVENT_STEP_1:
					switch (phase)
					{
					case PHASE_INTRO:
						Talk(gotHardMode ? SAY_HARDMODE_ON : SAY_AGGRO);
						events.ScheduleEvent(EVENT_STEP_2, 10 * IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						Talk(SAY_MKII_DEATH);
						events.ScheduleEvent(EVENT_STEP_2, 10 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						//me->ChangeSeat(0);
						if (Unit* mkii = me->GetVehicleBase())
							DoCast(mkii, SPELL_SEAT_5);
						//me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
						events.ScheduleEvent(EVENT_STEP_2, 2.5*IN_MILLISECONDS, 0, PHASE_AERIAL_ACTIVATION);
						break;
					case PHASE_V0L7R0N_ACTIVATION:
						if (instance)
						{
							//me->SetVisible(false);
							if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
								Leviathan->GetMotionMaster()->MovePoint(0, 2744.65f, 2569.46f, 364.397f);
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
							{
								//me->EnterVehicle(VX_001, 0);
								me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
								Talk(SAY_AERIAL_DEATH);
							}
						}
						events.ScheduleEvent(EVENT_STEP_2, 5 * IN_MILLISECONDS, 0, PHASE_V0L7R0N_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_2:
					switch (phase)
					{
					case PHASE_INTRO:
						if (instance)
						{
							if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
								me->EnterVehicle(Leviathan, 4);
						}
						events.ScheduleEvent(EVENT_STEP_3, 2 * IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						me->ChangeSeat(1);
						events.ScheduleEvent(EVENT_STEP_3, 2 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						Talk(SAY_VX001_DEATH);
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
						events.ScheduleEvent(EVENT_STEP_3, 5 * IN_MILLISECONDS, 0, PHASE_AERIAL_ACTIVATION);
						break;
					case PHASE_V0L7R0N_ACTIVATION:
						if (instance)
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
								{
							VX_001->SetStandState(UNIT_STAND_STATE_STAND);
							//VX_001->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_CUSTOM_SPELL_01);
							//me->ChangeSeat(1);
							VX_001->EnterVehicle(Leviathan, 7);
								}
						events.ScheduleEvent(EVENT_STEP_3, 6 * IN_MILLISECONDS, 0, PHASE_V0L7R0N_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_3:
					switch (phase)
					{
					case PHASE_INTRO:
						me->ChangeSeat(2);
						events.ScheduleEvent(EVENT_STEP_4, 2 * IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						if (instance)
							instance->SetData(DATA_MIMIRON_ELEVATOR, GO_STATE_READY);
						events.ScheduleEvent(EVENT_STEP_4, 15 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
						if (instance)
						{
							if (Creature* AerialUnit = me->SummonCreature(NPC_AERIAL_COMMAND_UNIT, 2744.65f, 2569.46f, 380.0f, 3.14159f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
							{
								AerialUnit->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
								AerialUnit->SetVisible(true);
							}
						}
						events.ScheduleEvent(EVENT_STEP_4, 5 * IN_MILLISECONDS, 0, PHASE_AERIAL_ACTIVATION);
						break;
					case PHASE_V0L7R0N_ACTIVATION:
						if (instance)
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								if (Creature* AerialUnit = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
								{
							AerialUnit->SetCanFly(false);
							AerialUnit->EnterVehicle(VX_001, 3);
							Talk(SAY_V07TRON_ACTIVATE);
								}
						events.ScheduleEvent(EVENT_STEP_4, 10 * IN_MILLISECONDS, 0, PHASE_V0L7R0N_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_4:
					switch (phase)
					{
					case PHASE_INTRO:
						me->ChangeSeat(5);
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
						events.ScheduleEvent(EVENT_STEP_5, 2.5*IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						if (instance)
						{
							if (Creature* VX_001 = me->SummonCreature(NPC_VX_001, 2744.65f, 2569.46f, 364.397f, 3.14159f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
							{
								instance->SetData(DATA_MIMIRON_ELEVATOR, GO_STATE_ACTIVE_ALTERNATIVE);
								VX_001->SetVisible(true);
								VX_001->setFaction(FACTION_FRIENDLY);
								VX_001->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
								for (uint8 n = 5; n < 7; ++n)
								{
									if (Creature* Rocket = VX_001->SummonCreature(NPC_ROCKET, VX_001->GetPositionX(), VX_001->GetPositionY(), VX_001->GetPositionZ(), 0, TEMPSUMMON_MANUAL_DESPAWN))
									{
										Rocket->setFaction(FACTION_HOSTILE);
										Rocket->SetReactState(REACT_PASSIVE);
										Rocket->EnterVehicle(VX_001, n);
									}
								}
							}
						}
						events.ScheduleEvent(EVENT_STEP_5, 8 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						me->ExitVehicle();
						me->GetMotionMaster()->MoveJump(2790.11f, 2595.83f, 364.32f, 10, 15);

						// entering the vehicle makes Mimiron leave combat and restart the encounter
						if (Creature* AerialUnit = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
						{
							//me->CastSpell(AerialUnit, SPELL_SEAT_1);
							//me->CastSpell(AerialUnit, 52391);
							//me->EnterVehicle(AerialUnit, 0);
							//me->SetVisible(false);
							//							me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SIT);
						}

						events.ScheduleEvent(EVENT_STEP_5, 2 * IN_MILLISECONDS, 0, PHASE_AERIAL_ACTIVATION);
						break;
					case PHASE_V0L7R0N_ACTIVATION:
						if (instance)
						{
							if (Creature* vx001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								DoCast(vx001, SPELL_SEAT_2);
							if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
								Leviathan->AI()->DoAction(DO_LEVIATHAN_ASSEMBLED);
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								VX_001->AI()->DoAction(DO_VX001_ASSEMBLED);
							if (Creature* AerialUnit = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
								AerialUnit->AI()->DoAction(DO_AERIAL_ASSEMBLED);
							phase = PHASE_COMBAT;
							events.SetPhase(phase);
						}
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_5:
					switch (phase)
					{
					case PHASE_INTRO:
						Talk(SAY_MKII_ACTIVATE);
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
						events.ScheduleEvent(EVENT_STEP_6, 6 * IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						if (instance)
						{
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								me->EnterVehicle(VX_001, 0);
						}
						events.ScheduleEvent(EVENT_STEP_6, 3.5*IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						//me->ChangeSeat(2);
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
						Talk(SAY_AERIAL_ACTIVATE);
						events.ScheduleEvent(EVENT_STEP_6, 8 * IN_MILLISECONDS, 0, PHASE_AERIAL_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_6:
					switch (phase)
					{
					case PHASE_INTRO:
						me->ChangeSeat(6);
						events.ScheduleEvent(EVENT_STEP_7, 2 * IN_MILLISECONDS, 0, PHASE_INTRO);
						break;
					case PHASE_VX001_ACTIVATION:
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
						Talk(SAY_VX001_ACTIVATE);
						events.ScheduleEvent(EVENT_STEP_7, 10 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					case PHASE_AERIAL_ACTIVATION:
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
						//me->SetVisible(false);
						if (instance)
						{
							if (Creature* AerialUnit = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
							{
								AerialUnit->AI()->DoAction(DO_START_AERIAL);
								AerialUnit->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
								phase = PHASE_COMBAT;
								events.SetPhase(phase);
							}
						}
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_7:
					switch (phase)
					{
					case PHASE_INTRO:
						if (instance)
						{
							if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
							{
								me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
								Leviathan->AI()->DoAction(DO_START_ENCOUNTER);
								phase = PHASE_COMBAT;
								events.SetPhase(phase);
							}
						}
						break;
					case PHASE_VX001_ACTIVATION:
						me->ChangeSeat(1);
						me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SIT);
						events.ScheduleEvent(EVENT_STEP_8, 2 * IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_8:
					switch (phase)
					{
					case PHASE_VX001_ACTIVATION:
						if (instance)
						{
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
								VX_001->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
						}
						events.ScheduleEvent(EVENT_STEP_9, 3.5*IN_MILLISECONDS, 0, PHASE_VX001_ACTIVATION);
						break;
					default:
						break;
					}
					return;
				case EVENT_STEP_9:
					switch (phase)
					{
					case PHASE_VX001_ACTIVATION:
						if (instance)
							if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
							{
							//VX_001->AddAura(SPELL_HOVER, VX_001); // Hover
							VX_001->AI()->DoAction(DO_START_VX001);
							phase = PHASE_COMBAT;
							events.SetPhase(phase);
							}
						break;
					default:
						break;
					}
					return;
					/*case EVENT_OUTTRO_1:
					me->RemoveAurasDueToSpell(SPELL_SLEEP_VISUAL_1);
					DoCast(me, SPELL_SLEEP_VISUAL_2);
					me->setFaction(35);
					events.ScheduleEvent(EVENT_OUTTRO_2, 3000);
					break;
					case EVENT_OUTTRO_2:

					Talk(SAY_V07TRON_DEATH);
					if (gotHardMode)
					{
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					computer->AI()->Talk(1);
					me->SummonGameObject(RAID_MODE(CACHE_OF_INNOVATION_HARDMODE_10, CACHE_OF_INNOVATION_HARDMODE_25), 2744.040f, 2569.352f, 364.3135f, 3.124123f, 0.f, 0.f, 0.9999619f, 0.008734641f, 604800);
					}
					else
					me->SummonGameObject(RAID_MODE(CACHE_OF_INNOVATION_10, CACHE_OF_INNOVATION_25), 2744.040f, 2569.352f, 364.3135f, 3.124123f, 0.f, 0.f, 0.9999619f, 0.008734641f, 604800);

					/*					Talk(SAY_V07TRON_DEATH);
					if (gotHardMode)
					if (Creature* computer = me->FindNearestCreature(34143, 200.0f, true))
					computer->AI()->Talk(1);
					*/
					/*events.ScheduleEvent(EVENT_OUTTRO_3, 11000);
					break;
					case EVENT_OUTTRO_3:
					DoCast(me, SPELL_TELEPORT_VISUAL);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->DespawnOrUnsummon(3000);
					instance->SetBossState(BOSS_MIMIRON, DONE);
					_JustDied();
					break;*/
				default:
					return;
				}
			}
		}

		uint32 GetData(uint32 type) const
		{
			switch (type)
			{
			case DATA_GET_HARD_MODE:
				return gotHardMode ? 1 : 0;
			case DATA_FLAME_COUNT:
				return flameCount;
			case DATA_AVOIDED_ROCKET_STRIKES:
				return setUpUsTheBomb.count(DATA_AVOIDED_ROCKET_STRIKES) ? 1 : 0;
			case DATA_AVOIDED_PROXIMITY_MINES:
				return setUpUsTheBomb.count(DATA_AVOIDED_PROXIMITY_MINES) ? 1 : 0;
			case DATA_AVOIDED_BOOM_BOT_EXPLOSION:
				return setUpUsTheBomb.count(DATA_AVOIDED_BOOM_BOT_EXPLOSION) ? 1 : 0;
			default:
				break;
			}
			return 0;
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case DO_ACTIVATE_VX001:
				phase = PHASE_VX001_ACTIVATION;
				events.SetPhase(phase);
				events.ScheduleEvent(EVENT_STEP_1, 0.1*IN_MILLISECONDS, 0, phase);
				break;
			case DO_ACTIVATE_AERIAL:
				phase = PHASE_AERIAL_ACTIVATION;
				events.SetPhase(phase);
				events.ScheduleEvent(EVENT_STEP_1, 5 * IN_MILLISECONDS, 0, phase);
				break;
			case DO_ACTIVATE_V0L7R0N:
				me->SetVisible(true);
				phase = PHASE_V0L7R0N_ACTIVATION;
				events.SetPhase(phase);
				events.ScheduleEvent(EVENT_STEP_1, 1 * IN_MILLISECONDS, 0, phase);
				events.RescheduleEvent(EVENT_REPAIR_CHECKER, 3000);
				break;
			case DO_ACTIVATE_HARD_MODE:     // Cannot be done infight, since the button gets locked on EnterCombat() with Mimiron.
				gotHardMode = true;
				DoZoneInCombat();
				break;
			case DO_INCREASE_FLAME_COUNT:
				++flameCount;
				break;
			case DO_DECREASE_FLAME_COUNT:
				if (flameCount)
					--flameCount;
				break;
				// Repair stuff
			case DO_LEVIATHAN_SELF_REPAIR_START:
				//mapMutex.acquire();
				isSelfRepairing[DATA_LEVIATHAN_MK_II] = true;
				//mapMutex.release();
				BotAliveCheck();
				events.ScheduleEvent(EVENT_REPAIR_CHECKER, 3000);
				break;
			case DO_LEVIATHAN_SELF_REPAIR_END:
				//mapMutex.acquire();
				isSelfRepairing[DATA_LEVIATHAN_MK_II] = false;
				//mapMutex.release();
				events.RescheduleEvent(EVENT_REPAIR_CHECKER, 3000);
				break;
			case DO_VX001_SELF_REPAIR_START:
				//mapMutex.acquire();
				isSelfRepairing[DATA_VX_001] = true;
				//mapMutex.release();
				BotAliveCheck();
				break;
			case DO_VX001_SELF_REPAIR_END:
				//mapMutex.acquire();
				isSelfRepairing[DATA_VX_001] = false;
				//mapMutex.release();
				break;
			case DO_AERIAL_SELF_REPAIR_START:
				//mapMutex.acquire();
				isSelfRepairing[DATA_AERIAL_UNIT] = true;
				//mapMutex.release();
				BotAliveCheck();
				break;
			case DO_AERIAL_SELF_REPAIR_END:
				//mapMutex.acquire();
				isSelfRepairing[DATA_AERIAL_UNIT] = false;
				//mapMutex.release();
				break;
				// Achiev
			case DATA_AVOIDED_ROCKET_STRIKES:
				setUpUsTheBomb[DATA_AVOIDED_ROCKET_STRIKES] = false;
				break;
			case DATA_AVOIDED_PROXIMITY_MINES:
				setUpUsTheBomb[DATA_AVOIDED_PROXIMITY_MINES] = false;
				break;
			case DATA_AVOIDED_BOOM_BOT_EXPLOSION:
				setUpUsTheBomb[DATA_AVOIDED_BOOM_BOT_EXPLOSION] = false;
				break;
			default:
				break;
			}
		}

	private:
		//ACE_Mutex mapMutex;
		std::map< uint32, bool > isSelfRepairing;
		std::map< BombIndices, bool > setUpUsTheBomb;
		MyPhase phase;
		uint32 flameCount;
		bool gotHardMode;
		bool enraged;
		bool gotEncounterFinished;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<boss_mimironAI>(creature);
	}
};

/************************************************************************/
/*                          Leviathan MK II                             */
/************************************************************************/

#define EMOTE_LEVIATHAN                         "Leviathan MK II begins to cast Plasma Blast!"

class boss_leviathan_mk : public CreatureScript
{
private:
	enum MyPhase
	{
		PHASE_IDLE = 0,
		PHASE_LEVIATHAN_SOLO__GLOBAL_1,
		PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4
	};

	enum Events
	{
		EVENT_PROXIMITY_MINE = 1,
		EVENT_NAPALM_SHELL,
		EVENT_PLASMA_BLAST,
		EVENT_SHOCK_BLAST,
		EVENT_FLAME_SUPPRESSANT,
		EVENT_SELF_REPAIR_CHECKER,
		EVENT_LEVIATHAN_CHECK_OTHERUNITS_STATUS
	};

public:
	boss_leviathan_mk() : CreatureScript("boss_leviathan_mk") {}

	struct boss_leviathan_mkAI : public ScriptedAI
	{
		boss_leviathan_mkAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_ROCKET_STRIKE_DMG, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			Reset();
		}

		void Reset()
		{
			events.Reset();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
			me->SetStandState(UNIT_STAND_STATE_STAND);
			me->SetReactState(REACT_PASSIVE);
			me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
			phase = PHASE_IDLE;
			events.SetPhase(phase);
			gotMimironHardMode = false;

			if (Creature* turret = CAST_CRE(me->GetVehicleKit()->GetPassenger(3)))
			{
				turret->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				turret->SetReactState(REACT_PASSIVE);
			}
		}

		void KilledUnit(Unit* /*who*/)
		{
			if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
			{
				if (phase == PHASE_LEVIATHAN_SOLO__GLOBAL_1)
				{
					if (!urand(0, 5))
						Talk(SAY_MKII_SLAY, Mimiron);
				}
				else
					if (!urand(0, 5))
						Talk(SAY_V07TRON_SLAY, Mimiron);
			}
		}

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (!caster || !spell)
				return;

			if (spell->Id == SPELL_SELF_REPAIR)
			{
				DoAction(DO_LEVIATHAN_SELF_REPAIR_END);
				if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
					Mimiron->AI()->DoAction(DO_LEVIATHAN_SELF_REPAIR_END);
			}
		}

		void DamageTaken(Unit* /*who*/, uint32 &damage)
		{
			if (damage >= me->GetHealth())
			{
				// Common stuff
				damage = 0;
				me->InterruptNonMeleeSpells(true);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				me->AttackStop();
				me->SetReactState(REACT_PASSIVE);
				me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
				switch (phase)
				{
				case PHASE_LEVIATHAN_SOLO__GLOBAL_1:
					me->SetHealth(me->GetMaxHealth());
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_ACTIVATE_VX001);
					if (Creature* turret = CAST_CRE(me->GetVehicleKit()->GetPassenger(3)))
						turret->Kill(turret, false);
					me->SetSpeed(MOVE_RUN, 1.5f, true);
					me->GetMotionMaster()->MovePoint(0, 2790.11f, 2595.83f, 364.32f);
					break;
				case PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4:
					me->SetStandState(UNIT_STAND_STATE_DEAD); /*



															  IDEA: Buscar desde el update AI DE LA TERCERA fase en leviathan, obtener el GetStandState y analizar
															  también agregar si no está casteando e incluso cálculo de vida. Si no es así, hacer un Mimiron->AI()->DoAction(DO_XX_SELF_REPAIR_START).

															  LO EJECUTA MIMIRON, PERO LO PUEDES CONTROLAR desde cada vehículo de manera independiente.


															  IMPORTANTE.



															  */
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_LEVIATHAN_SELF_REPAIR_START);
					DoCast(me, SPELL_SELF_REPAIR);
					break;
				default:
					break;
				}
				events.Reset(); // Wipe events, just for the case
				phase = PHASE_IDLE;
				events.SetPhase(phase);
			}
		}

		void EnterCombat(Unit* /*who*/)
		{
			if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
				gotMimironHardMode = Mimiron->AI()->GetData(DATA_GET_HARD_MODE);

			if (Creature* turret = CAST_CRE(me->GetVehicleKit()->GetPassenger(3)))
			{
				turret->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				turret->SetReactState(REACT_AGGRESSIVE);
				turret->AI()->DoZoneInCombat();
			}

			//events.ScheduleEvent(EVENT_SHOCK_BLAST, 30 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_SOLO__GLOBAL_1);
			events.ScheduleEvent(EVENT_PROXIMITY_MINE, 6 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_SOLO__GLOBAL_1);
			events.ScheduleEvent(EVENT_PLASMA_BLAST, 12 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_SOLO__GLOBAL_1);
			if (gotMimironHardMode)
			{				
				DoCast(me, SPELL_EMERGENCY_MODE, true);
				events.ScheduleEvent(EVENT_FLAME_SUPPRESSANT, 62 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_SOLO__GLOBAL_1);				
			}

			instance->SetData(DATA_MIMIRON_ENGAGED, 1);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case DO_START_ENCOUNTER:
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_AGGRESSIVE);
				phase = PHASE_LEVIATHAN_SOLO__GLOBAL_1;
				events.SetPhase(phase);
				DoZoneInCombat();
				break;
			case DO_LEVIATHAN_ASSEMBLED:
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetHealth((me->GetMaxHealth() >> 1));
				// no break here
			case DO_LEVIATHAN_SELF_REPAIR_END:
				if (gotMimironHardMode)
					if (!me->HasAura(SPELL_EMERGENCY_MODE))
						DoCast(me, SPELL_EMERGENCY_MODE, true);
				phase = PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4;
				events.SetPhase(phase);
				me->InterruptNonMeleeSpells(false);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				me->SetReactState(REACT_AGGRESSIVE);
				me->SetSpeed(MOVE_RUN, 1.0f, true);
				me->SetStandState(UNIT_STAND_STATE_STAND);
				events.RescheduleEvent(EVENT_PROXIMITY_MINE, 1 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4);
				events.RescheduleEvent(EVENT_SHOCK_BLAST, 45 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4);
				events.ScheduleEvent(EVENT_LEVIATHAN_CHECK_OTHERUNITS_STATUS, 6000, PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4);
				break;
			case DO_ENTER_ENRAGE:
				DoCast(me, SPELL_BERSERK, true);
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim() || phase == PHASE_IDLE)
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING) || me->HasUnitState(UNIT_STATE_STUNNED))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PROXIMITY_MINE:
				{
					for (int i = 0; i < 10; i++)
						DoCast(SPELL_MINES_SPAWN);
					DoCast(SPELL_PROXIMITY_MINES);
					events.RescheduleEvent(EVENT_PROXIMITY_MINE, 35 * IN_MILLISECONDS, phase);
				}
					return;
				case EVENT_PLASMA_BLAST:					
					me->TextEmote(EMOTE_LEVIATHAN, 0, true); // CUIDADO
					DoCast(SPELL_PLASMA_BLAST);
					events.RescheduleEvent(EVENT_PLASMA_BLAST, 38000, 0, phase);
					events.RescheduleEvent(EVENT_SHOCK_BLAST, 17 * IN_MILLISECONDS, 0, phase);
					return;
				case EVENT_SHOCK_BLAST:
					DoCastAOE(SPELL_SHOCK_BLAST);
					events.RescheduleEvent(EVENT_SHOCK_BLAST, 49 * IN_MILLISECONDS, 0, PHASE_LEVIATHAN_ASSEMBLED__GLOBAL_4);
					return;
				case EVENT_FLAME_SUPPRESSANT:							
					me->CastStop();					
					DoCastAOE(SPELL_FLAME_SUPPRESSANT_MK);
					events.RescheduleEvent(EVENT_FLAME_SUPPRESSANT, 63*IN_MILLISECONDS, 0, PHASE_LEVIATHAN_SOLO__GLOBAL_1);
					return;
				case EVENT_LEVIATHAN_CHECK_OTHERUNITS_STATUS:

					if (Creature* Aerial = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
					{
						if ((Aerial->getStandState() == UNIT_STAND_STATE_DEAD) && !Aerial->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_AERIAL_SELF_REPAIR_START);
								Aerial->AI()->DoCast(Aerial, SPELL_SELF_REPAIR);
							}
						}

					}


					if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
					{
						if ((VX_001->getStandState() == UNIT_STAND_STATE_DEAD) && !VX_001->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_VX001_SELF_REPAIR_START);
								VX_001->AI()->DoCast(VX_001, SPELL_SELF_REPAIR);
							}
						}

					}
					events.ScheduleEvent(EVENT_LEVIATHAN_CHECK_OTHERUNITS_STATUS, 5000);
					break;
				default:
					return;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		MyPhase phase;
		EventMap events;
		bool gotMimironHardMode;
		InstanceScript* instance;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<boss_leviathan_mkAI>(creature);
	}
};

// Levi's turret
class boss_leviathan_mk_turret : public CreatureScript
{
private:
	enum
	{
		SPELL_DEATH_GRIP = 49560
	};

public:
	boss_leviathan_mk_turret() : CreatureScript("boss_leviathan_mk_turret") {}

	struct boss_leviathan_mk_turretAI : public ScriptedAI
	{
		boss_leviathan_mk_turretAI(Creature* c) : ScriptedAI(c) {}

		void InitializeAI()
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DEATH_GRIP, true);
			Reset();
		}

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);
			napalmShellTimer = urand(8 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
		}

		// prefer ranged targets
		Unit* GetNapalmShellTarget()
		{			
			if (Map* map = me->GetMap())
			{
				std::list<Player*> playerList;
				Map::PlayerList const& Players = map->GetPlayers();
				for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
				{
					if (Player* player = itr->GetSource())
					{
						if (player->isDead() || player->IsGameMaster())
							continue;

						float Distance = player->GetDistance(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
						if (Distance < 15.0f || Distance > 100.0f)
							continue;

						playerList.push_back(player);
					}
				}
				if (playerList.empty())
					return SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true);
				else
					return Trinity::Containers::SelectRandomContainerElement(playerList);
			}
			else
				return 0;
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (napalmShellTimer <= diff)
			{
				if (Unit* shellTarget = GetNapalmShellTarget())				
					DoCast(shellTarget, SPELL_NAPALM_SHELL);									
					
				napalmShellTimer = urand(8 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
			}
			else
				napalmShellTimer -= diff;
		}

	private:
		uint32 napalmShellTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<boss_leviathan_mk_turretAI>(creature);
	}
};

// Npc that triggers the mine explosion
// Bomb will explode after 35 seconds or if a potential target is within half a meter
class npc_proximity_mine : public CreatureScript
{
public:
	npc_proximity_mine() : CreatureScript("npc_proximity_mine") {}

	struct npc_proximity_mineAI : public ScriptedAI
	{
		npc_proximity_mineAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			SetCombatMovement(false);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			uiBoomTimer = 35 * IN_MILLISECONDS;
			boomLocked = false;
		}

		void SpellHitTarget(Unit* target, SpellInfo const* spell)
		{
			if (!target || !spell)
				return;

			if (target->ToPlayer())
				if (spell->Id == RAID_MODE(66351, 63009)) // CORREGIR, AHORA HAY 2.
					if (InstanceScript* instance = me->GetInstanceScript())
						if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							mimiron->AI()->DoAction(DATA_AVOIDED_PROXIMITY_MINES);
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who)
				return;

			if (Player* player = who->ToPlayer())
				if (!player->IsGameMaster())
					if (!boomLocked && me->GetDistance2d(player) < 0.8f)
					{
				DoCastAOE(RAID_MODE(66351, 63009));
				boomLocked = true;
				me->DespawnOrUnsummon(1 * IN_MILLISECONDS);
					}
		}

		void UpdateAI(uint32 diff)
		{
			if (uiBoomTimer <= diff)
			{
				if (!boomLocked)
				{
					DoCastAOE(RAID_MODE(66351, 63009));
					me->DespawnOrUnsummon(0.2*IN_MILLISECONDS);
					boomLocked = true;
				}
			}
			else
				uiBoomTimer -= diff;
		}

	private:
		uint32 uiBoomTimer;
		bool boomLocked;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_proximity_mineAI(creature);
	}
};

class spell_proximity_mines : public SpellScriptLoader // Spell 63027
{
public:
	spell_proximity_mines() : SpellScriptLoader("spell_proximity_mines") {}

	class spell_proximity_mines_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_proximity_mines_SpellScript);

		void HandleDummyTick(SpellEffIndex /*effIndex*/)
		{
			if (Unit* caster = GetCaster())
			{
				for (uint8 i = 0; i < 10; i++)
					caster->CastSpell(caster, SPELL_MINES_SPAWN, true);
			}
		}

		void Register()
		{
			OnEffectHit += SpellEffectFn(spell_proximity_mines_SpellScript::HandleDummyTick, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_proximity_mines_SpellScript();
	}
};

/************************************************************************/
/*                               VX-001                                 */
/************************************************************************/

class boss_vx_001 : public CreatureScript
{
private:
	enum
	{
		SPELL_SELF_STUN = 14821
	};

	enum MyPhase
	{
		PHASE_IDLE = 0,
		PHASE_VX001_SOLO__GLOBAL_2,
		PHASE_VX001_ASSEMBLED__GLOBAL_4
	};

	enum Events
	{
		EVENT_RAPID_BURST = 1,
		EVENT_LASER_BARRAGE,
		EVENT_LASER_BARRAGE_END,
		EVENT_ROCKET_STRIKE,
		EVENT_HEAT_WAVE,
		EVENT_HAND_PULSE,
		EVENT_FROST_BOMB,
		EVENT_FLAME_SUPPRESSANT_VX001,
		EVENT_REMOVE_HOVER,
		EVENT_RAPID_BURST_ROTATE,
		EVENT_START_SPINNING,
		EVENT_VX001_CHECK_OTHERUNITS_STATUS,

		EVENT_RAPID_BURST_LEFT,
		EVENT_RAPID_BURST_RIGHT
	};

public:
	boss_vx_001() : CreatureScript("boss_vx_001") {}

	struct boss_vx_001AI : public ScriptedAI
	{
		boss_vx_001AI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetDisableGravity(true); // This is the unfold visual state of VX-001, it has to be set on create as it requires an objectupdate if set later.
			me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SPECIAL_UNARMED); // This is a hack to force the yet to be unfolded visual state.
			//me->SetReactState(REACT_PASSIVE);
		}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_ROCKET_STRIKE_DMG, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}

		void Reset()
		{
			spinning = false;
			direction = false;
			spinTimer = 0.25*IN_MILLISECONDS;

			events.Reset();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_DISABLE_MOVE);
			me->SetStandState(UNIT_STAND_STATE_STAND);
			me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
			phase = PHASE_IDLE;
			events.SetPhase(phase);
			MimironHardMode = false;
		}

		void KilledUnit(Unit* /*who*/)
		{
			if (instance)
				if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
				{
				if (phase == PHASE_VX001_SOLO__GLOBAL_2)
				{
					if (!urand(0, 5))
						Talk(SAY_VX001_SLAY, Mimiron);
				}
				else
					if (!urand(0, 5))
						Talk(SAY_V07TRON_SLAY, Mimiron);
				}
		}

		void EnterCombat(Unit* /*who*/)
		{
			if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
				MimironHardMode = Mimiron->AI()->GetData(DATA_GET_HARD_MODE);

			if (MimironHardMode)
			{
				DoCast(me, SPELL_EMERGENCY_MODE, true);
				events.ScheduleEvent(EVENT_FROST_BOMB, 6 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
				events.ScheduleEvent(EVENT_FLAME_SUPPRESSANT_VX001, 1 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
			}			
			DoCast(me, RAID_MODE(63679, 64534)); // 63679 64534 
			events.ScheduleEvent(EVENT_RAPID_BURST_ROTATE, 100, 0, PHASE_VX001_SOLO__GLOBAL_2);
			//events.RescheduleEvent(EVENT_RAPID_BURST, 600, 0, PHASE_VX001_SOLO__GLOBAL_2);
			events.RescheduleEvent(EVENT_RAPID_BURST_LEFT, 600, 0, PHASE_VX001_SOLO__GLOBAL_2);
			events.RescheduleEvent(EVENT_RAPID_BURST_RIGHT, 1100, 0, PHASE_VX001_SOLO__GLOBAL_2);
			// events.ScheduleEvent(EVENT_RAPID_BURST, 3*IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);				
			events.ScheduleEvent(EVENT_LASER_BARRAGE, 40000, 0, PHASE_VX001_SOLO__GLOBAL_2);
			events.ScheduleEvent(EVENT_ROCKET_STRIKE, 18 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
			//events.ScheduleEvent(EVENT_HEAT_WAVE, 7 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case DO_START_VX001:
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE);
				//me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
				me->RemoveAurasDueToSpell(SPELL_FREEZE_ANIM);
				me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_NONE); // Remove emotestate.
				me->SetUInt32Value(UNIT_FIELD_BYTES_1, 33554432); //Blizzard handles hover animation like this it seems.

				phase = PHASE_VX001_SOLO__GLOBAL_2;
				events.SetPhase(phase);
				me->setFaction(FACTION_HOSTILE);
				me->SetInCombatWithZone();
				break;
			case DO_VX001_ASSEMBLED:
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetHealth((me->GetMaxHealth() >> 1));
				me->SetStandState(UNIT_STAND_STATE_STAND);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			case DO_VX001_SELF_REPAIR_END:
				if (MimironHardMode)
					if (!me->HasAura(SPELL_EMERGENCY_MODE))
						DoCast(me, SPELL_EMERGENCY_MODE, true);
				phase = PHASE_VX001_ASSEMBLED__GLOBAL_4;
				events.SetPhase(phase);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				me->SetStandState(UNIT_STAND_STATE_STAND);
				events.RescheduleEvent(EVENT_LASER_BARRAGE, 65000, 0, PHASE_VX001_ASSEMBLED__GLOBAL_4);
				events.RescheduleEvent(EVENT_ROCKET_STRIKE, 20 * IN_MILLISECONDS, 0, PHASE_VX001_ASSEMBLED__GLOBAL_4);
				events.RescheduleEvent(EVENT_HAND_PULSE, 5 * IN_MILLISECONDS, 0, PHASE_VX001_ASSEMBLED__GLOBAL_4);
				events.ScheduleEvent(EVENT_VX001_CHECK_OTHERUNITS_STATUS, 5 * IN_MILLISECONDS, PHASE_VX001_ASSEMBLED__GLOBAL_4);
				if (MimironHardMode)
					events.RescheduleEvent(EVENT_FROST_BOMB, 15 * IN_MILLISECONDS, 0, PHASE_VX001_ASSEMBLED__GLOBAL_4);
				break;
			case DO_ENTER_ENRAGE:
				DoCast(me, SPELL_BERSERK, true);
				break;
			default:
				break;
			}
		}

		void DamageTaken(Unit* /*who*/, uint32 &damage)
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				spinning = false;
				me->InterruptNonMeleeSpells(true);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);

				me->AttackStop();
				me->SetReactState(REACT_PASSIVE);
				me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
				me->SetStandState(UNIT_STAND_STATE_DEAD);
				switch (phase)
				{
				case PHASE_VX001_SOLO__GLOBAL_2:
					me->SetHealth(me->GetMaxHealth());
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_ACTIVATE_AERIAL);
					break;
				case PHASE_VX001_ASSEMBLED__GLOBAL_4:
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_VX001_SELF_REPAIR_START);
					DoCast(me, SPELL_SELF_REPAIR);
					break;
				default:
					break;
				}
				events.Reset();
				phase = PHASE_IDLE;
				events.SetPhase(phase);
			}
		}

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (!caster || !spell)
				return;

			if (spell->Id == SPELL_SELF_REPAIR)
			{
				DoAction(DO_VX001_SELF_REPAIR_END);
				if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
					Mimiron->AI()->DoAction(DO_VX001_SELF_REPAIR_END);
			}

			/*if (caster->GetEntry() == NPC_BURST_TARGET && !me->HasUnitState(UNIT_STATE_CASTING))
			DoCast(caster, SPELL_RAPID_BURST);*/
		}

		void SpellHitTarget(Unit* target, SpellInfo const* spell)
		{
			switch (spell->Id)
			{
			case SPELL_FROSTBOMB:
				me->SummonCreature(NPC_FROST_BOMB, *target, TEMPSUMMON_TIMED_DESPAWN, 11 * IN_MILLISECONDS);
				break;
			case SPELL_ROCKET_STRIKE:
				if (!target || !spell)
					return;

				if (target->ToPlayer())
					if (spell->Id == SPELL_ROCKET_STRIKE)
						if (InstanceScript* instance = me->GetInstanceScript())
							if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
								mimiron->AI()->DoAction(DATA_AVOIDED_ROCKET_STRIKES);
				break;
			default:
				break;
			}
		}


		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim() || phase == PHASE_IDLE)
				return;

			events.Update(diff);

			/*if (me->HasUnitState(UNIT_STATE_CASTING))
			return;*/


			if (spinning)
			{
				if (spinTimer <= diff)
				{
					float orient = me->GetOrientation() + (direction ? M_PI / 60.0f : -M_PI / 60.0f);
					if (Creature* leviathan = me->GetVehicleCreatureBase())
					{
						leviathan->SetFacingTo(orient);
						me->SetOrientation(orient);
					}
					else
					{
						me->SetFacingTo(orient);
						me->SetOrientation(orient);
					}

					float x, y;

					me->GetNearPoint2D(x, y, 10.0f, orient);
					if (Creature* temp = me->SummonCreature(NPC_BURST_TARGET, x, y, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 0.5*IN_MILLISECONDS))
					{
						me->SetTarget(temp->GetGUID());
						if (me->IsVehicle())
						{
							// mimiron himself casts the spell, so lets turn him
							if (Unit* mimiron = me->GetVehicleKit()->GetPassenger(1))
							{
								mimiron->SetFacingTo(orient);
								mimiron->SetOrientation(orient);
								mimiron->SetTarget(temp->GetGUID());
							}
						}
					}
					spinTimer = 0.15*IN_MILLISECONDS;
				}
				else
					spinTimer -= diff;
			}

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{

				case EVENT_RAPID_BURST_ROTATE:
				{
					//me->AddAura(SPELL_HOVER, me);												 
					
					/*me->SendClearThreatListOpcode();
					me->SendClearTarget();*/
					
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
					{
						me->getThreatManager().resetAllAggro();
						me->getThreatManager().doAddThreat(target, 80000.0f);
						me->SetOrientation(target->GetOrientation());
						AttackStart(target);
					}
						

					//me->AddAura(SPELL_HOVER, me);
					//me->GetMotionMaster()->MoveRotate(urand(1000, 3000), rand() % 2 ? ROTATE_DIRECTION_LEFT : ROTATE_DIRECTION_RIGHT);
					events.ScheduleEvent(EVENT_RAPID_BURST_ROTATE, 4000, 0, PHASE_VX001_SOLO__GLOBAL_2);
					events.DelayEvents(2500);
					//me->RemoveAura(SPELL_HOVER);
				}
					break;
				case EVENT_RAPID_BURST_LEFT:
					DoCast(me->GetVictim(), RAID_MODE(SPELL_RAPID_BURST_LEFT_10, SPELL_RAPID_BURST_LEFT_25));
					events.RescheduleEvent(EVENT_RAPID_BURST_RIGHT, 0.5 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2); // Right -> schedule Left.
					break;
				case EVENT_RAPID_BURST_RIGHT:
					DoCast(me->GetVictim(), RAID_MODE(SPELL_RAPID_BURST_RIGHT_10, SPELL_RAPID_BURST_RIGHT_25));
					events.RescheduleEvent(EVENT_RAPID_BURST_LEFT, 0.5 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2); // Left-> schedule Right.
					break;
					/*case EVENT_RAPID_BURST:
					//me->GetMotionMaster()->Initialize();

					switch (RapidBurst)
					{
					case 0:
					{
					DoCast(me->GetVictim(), RAID_MODE(SPELL_RAPID_BURST_LEFT_10, SPELL_RAPID_BURST_LEFT_25));
					break;
					}
					case 1:
					{
					DoCast(me->GetVictim(), RAID_MODE(SPELL_RAPID_BURST_RIGHT_10, SPELL_RAPID_BURST_RIGHT_25));
					break;
					}
					}
					RapidBurst++;
					if (RapidBurst > 1)
					RapidBurst = 0;

					events.RescheduleEvent(EVENT_RAPID_BURST, 1*IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
					break;*/
				case EVENT_LASER_BARRAGE:
					me->CastStop();
					me->AttackStop();
					me->getThreatManager().resetAllAggro();
					me->SetReactState(REACT_PASSIVE);

					if (phase == PHASE_VX001_ASSEMBLED__GLOBAL_4)
					{
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

						if (Creature* leviathan = me->GetVehicleCreatureBase())
						{
							float orient = float(2 * M_PI * rand_norm());
							leviathan->CastSpell(leviathan, SPELL_SELF_STUN, true);
							leviathan->SetFacingTo(orient);
							leviathan->SetOrientation(orient);
							me->SetOrientation(orient);

						}
					}
					else if (phase == PHASE_VX001_SOLO__GLOBAL_2)
					{
						float orient = float(2 * M_PI * rand_norm());
						me->SetOrientation(orient);
						me->SetFacingTo(orient);
					}

					DoCast(SPELL_SPINNING_UP);
					events.DelayEvents(14500);
					events.RescheduleEvent(EVENT_LASER_BARRAGE, 65000);
					events.RescheduleEvent(EVENT_START_SPINNING, 5000);
					events.RescheduleEvent(EVENT_LASER_BARRAGE_END, 14000);
					break;
				case EVENT_LASER_BARRAGE_END:
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->SetReactState(REACT_AGGRESSIVE);
					if (me->GetVictim())
						AttackStart(me->GetVictim());
					spinning = false;
					direction = false;
					break;
				case EVENT_START_SPINNING:
					direction = urand(0, 1);
					spinning = true;
					break;
				case EVENT_ROCKET_STRIKE:										
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
					{
						if (Creature* pTemp = me->SummonCreature(NPC_MIMIRON_FOCUS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
						{
							pTemp->SetDisplayId(11686);
							pTemp->GetMotionMaster()->MoveIdle();
							pTemp->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
							pTemp->CombatStop();
							pTemp->CastSpell(pTemp, SPELL_ROCKET_STRIKE_AURA, true);
						}
						//if (Unit* missile = me->GetVehicleKit()->GetPassenger(6))
						me->CastSpell(target, SPELL_SUMMON_ROCKET_STRIKE, true);
					}
					if (phase == PHASE_VX001_ASSEMBLED__GLOBAL_4)
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
						{
						if (Creature* pTemp = me->SummonCreature(NPC_MIMIRON_FOCUS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
						{
							pTemp->SetDisplayId(11686);
							pTemp->GetMotionMaster()->MoveIdle();
							pTemp->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
							pTemp->CombatStop();
							pTemp->CastSpell(pTemp, SPELL_ROCKET_STRIKE_AURA, true);
						}
						//if (Unit* missile = me->GetVehicleKit()->GetPassenger(6))
						me->CastSpell(target, SPELL_SUMMON_ROCKET_STRIKE, true);
						}					
					events.RescheduleEvent(EVENT_ROCKET_STRIKE, urand(20000, 22000));
					break;
				case EVENT_HEAT_WAVE:
					DoCastAOE(SPELL_HEAT_WAVE);
					events.RescheduleEvent(EVENT_HEAT_WAVE, 7 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
					//return;
					break;
				case EVENT_HAND_PULSE:
				{
					//me->RemoveAura(SPELL_HOVER);
					bool hand = urand(0, 1);
					switch (hand)
					{
					case 0://											 
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
							DoCast(target, SPELL_HAND_PULSE_LEFT);
						break;
					case 1:
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
							DoCast(target, SPELL_HAND_PULSE_RIGHT);
						break;
					}

					events.ScheduleEvent(EVENT_HAND_PULSE, 3 * IN_MILLISECONDS, 0, PHASE_VX001_ASSEMBLED__GLOBAL_4);
					//me->AddAura(SPELL_HOVER, me);
					break;
				}
				case EVENT_FROST_BOMB:
					/* QUIZÁ CORTAR CASTEO, ATTACKSTOP O ALGO, PARA QUE NO LO CORTE


					MALA SINCRONIZACIÓN, CAMBIAR EL TIMMING A LA BOMBA


					quizá algo así como: if unitstate = casting, if me->HasUnitState(UNIT_STATE_CASTING), Reschedule(EVENT, 1000)

					Para aplazar el casteo de la frost bomb e incluso modificar el ángulo del spell en sí, la parábola del misil	spell 64623,  Missile motion: Parabola (Very VERY High)


					Hacer un hover mientras lo castea ( 2 segundos o así)

					Hacer que Mimiron salte al "garage" de Leviathan.

					Meter al computer flags de que no se agree.

					*/

					me->CastStop();
					me->AttackStop();

					events.DelayEvents(1500);
					if (Creature* flame = me->FindNearestCreature(NPC_FLAME_SPREAD, 100.0f))
					{
						//me->AddAura(SPELL_HOVER, me);

						me->AttackStop();
						DoCast(flame, SPELL_FROSTBOMB);
						events.ScheduleEvent(EVENT_FROST_BOMB, urand(40 * IN_MILLISECONDS, 45 * IN_MILLISECONDS), 0, phase);
						//me->RemoveAura(SPELL_HOVER);
					}
					else
						events.RescheduleEvent(EVENT_FROST_BOMB, 3 * IN_MILLISECONDS, 0, phase);


					//return;
					break;
				case EVENT_FLAME_SUPPRESSANT_VX001:

					DoCast(SPELL_FLAME_SUPPRESSANT_VX001);
					events.ScheduleEvent(EVENT_FLAME_SUPPRESSANT_VX001, 10 * IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);

					//return;
					break;
				case EVENT_VX001_CHECK_OTHERUNITS_STATUS:

					if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
					{
						if ((Leviathan->getStandState() == UNIT_STAND_STATE_DEAD) && !Leviathan->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_LEVIATHAN_SELF_REPAIR_START);
								Leviathan->AI()->DoCast(Leviathan, SPELL_SELF_REPAIR);
							}
						}

					}


					if (Creature* Aerial = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AERIAL_UNIT)))
					{
						if ((Aerial->getStandState() == UNIT_STAND_STATE_DEAD) && !Aerial->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_AERIAL_SELF_REPAIR_START);
								Aerial->AI()->DoCast(Aerial, SPELL_SELF_REPAIR);
							}
						}

					}
					events.ScheduleEvent(EVENT_VX001_CHECK_OTHERUNITS_STATUS, 5000);
					break;
				case EVENT_REMOVE_HOVER:
					me->AddAura(SPELL_HOVER, me);
					me->SetReactState(REACT_AGGRESSIVE);
					//events.RescheduleEvent(EVENT_REMOVE_HOVER, 2.4*IN_MILLISECONDS, 0, PHASE_VX001_SOLO__GLOBAL_2);
					//events.RescheduleEvent(EVENT_REMOVE_HOVER, 2.5*IN_MILLISECONDS, 0,PHASE_VX001_SOLO__GLOBAL_2);
					break;
				default:
					//return;
					break;
				}
			}
		}

	private:
		MyPhase phase;
		EventMap events;
		InstanceScript* instance;
		bool MimironHardMode;
		bool spinning;
		bool direction;
		uint32 spinTimer;
		uint8 RapidBurst;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<boss_vx_001AI>(creature);
	}
};

class npc_rocket_strike : public CreatureScript
{
public:
	npc_rocket_strike() : CreatureScript("npc_rocket_strike") {}

	struct npc_rocket_strikeAI : public ScriptedAI
	{
		npc_rocket_strikeAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
		}

		void InitializeAI()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			Reset();
		}

		void Reset()
		{
			casted = false;
		}

		void UpdateAI(uint32 /*diff*/)
		{
			if (!casted)
			{
				DoCast(me, SPELL_ROCKET_STRIKE_AURA);
				me->DespawnOrUnsummon(10 * IN_MILLISECONDS);
			}
		}

	private:
		bool casted;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_rocket_strikeAI(creature);
	}
};

class spell_rapid_burst : public SpellScriptLoader
{
public:
	spell_rapid_burst() : SpellScriptLoader("spell_rapid_burst") { }

	class spell_rapid_burst_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_rapid_burst_AuraScript);

		void HandleDummyTick(AuraEffect const* aurEff)
		{
			Unit* caster = GetCaster();
			Unit* target = GetTarget();

			switch (caster->GetMap()->GetDifficulty())
			{

			case RAID_DIFFICULTY_10MAN_NORMAL:
				caster->CastSpell(GetTarget(), RAND(SPELL_RAPID_BURST_LEFT_10, SPELL_RAPID_BURST_RIGHT_10), true, NULL, aurEff);
				break;
			case RAID_DIFFICULTY_25MAN_NORMAL:
				caster->CastSpell(GetTarget(), RAND(SPELL_RAPID_BURST_LEFT_25, SPELL_RAPID_BURST_RIGHT_25), true, NULL, aurEff);
				break;
			default:
				break;
			}
		}


		void Register()
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_rapid_burst_AuraScript::HandleDummyTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_rapid_burst_AuraScript();
	}
};


/************************************************************************/
/*                      Aerial Command Unit                             */
/************************************************************************/
class boss_aerial_unit : public CreatureScript
{
private:
	enum MyPhase
	{
		PHASE_IDLE = 0,
		PHASE_AERIAL_SOLO__GLOBAL_3,
		PHASE_AERIAL_ASSEMBLED__GLOBAL_4
	};

	enum Events
	{
		EVENT_PLASMA_BALL = 1,
		EVENT_REACTIVATE_AERIAL,
		EVENT_SUMMON_JUNK_BOT,
		EVENT_SUMMON_ASSAULT_BOT,
		EVENT_SUMMON_BOOM_BOT,
		EVENT_AERIAL_CHECK_OTHERUNITS_STATUS,
		EVENT_AERIAL_CHECK_POSITION
	};

public:
	boss_aerial_unit() : CreatureScript("boss_aerial_unit") {}

	struct boss_aerial_unitAI : public ScriptedAI
	{
		boss_aerial_unitAI(Creature* creature) : ScriptedAI(creature), summons(me), phase(PHASE_IDLE) {}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_ROCKET_STRIKE_DMG, true);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetUnitMovementFlags(MOVEMENTFLAG_FLYING);
		}

		void Reset()
		{
			events.Reset();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_DISABLE_MOVE);
			me->SetReactState(REACT_PASSIVE);
			me->SetStandState(UNIT_STAND_STATE_STAND);
			me->SetVisible(false);
			me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
			me->SetCanFly(true);
			phase = PHASE_IDLE;
			events.SetPhase(PHASE_IDLE);
			summons.DespawnAll();
			gotMimironHardMode = false;
		}

		void KilledUnit(Unit* /*who*/)
		{
			if (instance)
				if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
				{
				if (phase == PHASE_AERIAL_SOLO__GLOBAL_3)
				{
					if (!urand(0, 5))
						Talk(SAY_AERIAL_SLAY, Mimiron);
				}
				else
					if (!urand(0, 5))
						Talk(SAY_V07TRON_SLAY, Mimiron);
				}
		}

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (!caster || !spell)
				return;

			if (spell->Id == SPELL_SELF_REPAIR)
			{
				DoAction(DO_AERIAL_SELF_REPAIR_END);
				if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
					Mimiron->AI()->DoAction(DO_AERIAL_SELF_REPAIR_END);
			}
		}

		void EnterCombat(Unit* /*who*/)
		{
			if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
				gotMimironHardMode = Mimiron->AI()->GetData(DATA_GET_HARD_MODE);

			if (gotMimironHardMode)
				DoCast(me, SPELL_EMERGENCY_MODE, true);

			me->SetCanFly(true);
			me->SetDisableGravity(true);

			events.ScheduleEvent(EVENT_PLASMA_BALL, 1 * IN_MILLISECONDS);

			events.ScheduleEvent(EVENT_SUMMON_JUNK_BOT, 10 * IN_MILLISECONDS, 0, PHASE_AERIAL_SOLO__GLOBAL_3);
			events.ScheduleEvent(EVENT_SUMMON_ASSAULT_BOT, 15 * IN_MILLISECONDS, 0, PHASE_AERIAL_SOLO__GLOBAL_3);
			events.ScheduleEvent(EVENT_SUMMON_BOOM_BOT, 16 * IN_MILLISECONDS, 0, PHASE_AERIAL_SOLO__GLOBAL_3);

			events.ScheduleEvent(EVENT_AERIAL_CHECK_POSITION, 3 * IN_MILLISECONDS, 0, PHASE_AERIAL_SOLO__GLOBAL_3);
		}

		void AttackStart(Unit* target)
		{
			AttackStartCaster(target, 100.0f);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case DO_START_AERIAL:
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_AGGRESSIVE);
				phase = PHASE_AERIAL_SOLO__GLOBAL_3;
				events.SetPhase(PHASE_AERIAL_SOLO__GLOBAL_3);
				DoZoneInCombat();
				break;
			case DO_DISABLE_AERIAL:
				if (phase == PHASE_AERIAL_SOLO__GLOBAL_3)
				{
					me->CastStop();
					me->SetReactState(REACT_PASSIVE);
					me->GetMotionMaster()->Clear();
					// check if the aura works correctly (+50% damage from all sources)
					DoCast(me, SPELL_MAGNETIC_CORE);
					DoCast(me, SPELL_MAGNETIC_CORE_VISUAL);
					// Move to floor.
					Position destination;
					destination = me->GetPosition();
					destination.m_positionZ = 368.965f;
					me->GetMotionMaster()->MoveLand(1, destination);  // Check if MoveLand is ok here, a flying unit should have a landing animation, but... just 4 the case
					me->AttackStop();
					events.DelayEvents(20 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_REACTIVATE_AERIAL, 20 * IN_MILLISECONDS, 0, PHASE_AERIAL_SOLO__GLOBAL_3);
				}
				break;
			case DO_AERIAL_ASSEMBLED:
				//Summons				
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetHealth((me->GetMaxHealth() >> 1));               // Once again, re-assemble and repairing share some stuff, so the fallthrough is intended!                        
			case DO_AERIAL_SELF_REPAIR_END:
				if (gotMimironHardMode)
					if (!me->HasAura(SPELL_EMERGENCY_MODE))
						DoCast(me, SPELL_EMERGENCY_MODE, true);
				phase = PHASE_AERIAL_ASSEMBLED__GLOBAL_4;
				events.SetPhase(phase);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				me->SetReactState(REACT_AGGRESSIVE);
				me->SetStandState(UNIT_STAND_STATE_STAND);
				events.RescheduleEvent(EVENT_PLASMA_BALL, 2 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_AERIAL_CHECK_OTHERUNITS_STATUS, 4500, PHASE_AERIAL_ASSEMBLED__GLOBAL_4);
				break;
			case DO_ENTER_ENRAGE:
				DoCast(me, SPELL_BERSERK, true);
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim() || phase == PHASE_IDLE)
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PLASMA_BALL:
					if (phase == PHASE_AERIAL_SOLO__GLOBAL_3 && me->GetVictim())
					{
						float x = me->GetVictim()->GetPositionX();
						float y = me->GetVictim()->GetPositionY();
						float z = me->GetVictim()->GetPositionZ();
						if (me->IsWithinDist3d(x, y, z, 30.0f))
						{
							me->GetMotionMaster()->Initialize();
							DoCastVictim(SPELL_PLASMA_BALL);
						}
						else
							me->GetMotionMaster()->MovePoint(0, x, y, 380.04f);
					}
					else if (phase == PHASE_AERIAL_ASSEMBLED__GLOBAL_4 && me->GetVictim())
					{
						if (me->GetVictim()->IsWithinDist3d(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 30.0f))
							DoCastVictim(SPELL_PLASMA_BALL);
						else if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0, 0.0f, true))
							DoCast(target, SPELL_PLASMA_BALL);
					}
					events.RescheduleEvent(EVENT_PLASMA_BALL, 2 * IN_MILLISECONDS);
					return;
				case EVENT_REACTIVATE_AERIAL: /* Aqui */
					me->RemoveAurasDueToSpell(SPELL_MAGNETIC_CORE_VISUAL);
					events.DelayEvents(2 * IN_MILLISECONDS);
					me->GetMotionMaster()->MovePoint(0, me->GetPositionX(), me->GetPositionY(), 379.0f);
					me->SetReactState(REACT_AGGRESSIVE);
					return;
				case EVENT_SUMMON_JUNK_BOT:
					me->CastCustomSpell(SPELL_SUMMON_JUNK_BOT_TRIGGER, SPELLVALUE_MAX_TARGETS, 1, NULL, true);
					events.RescheduleEvent(EVENT_SUMMON_JUNK_BOT, RAID_MODE(12 * IN_MILLISECONDS, 10 * IN_MILLISECONDS), 0, PHASE_AERIAL_SOLO__GLOBAL_3);
					return;
				case EVENT_SUMMON_ASSAULT_BOT:
					me->CastCustomSpell(SPELL_SUMMON_ASSAULT_BOT_TRIGGER, SPELLVALUE_MAX_TARGETS, 1, NULL, true);
					if (gotMimironHardMode)
						me->CastCustomSpell(SPELL_SUMMON_FIRE_BOT_TRIGGER, SPELLVALUE_MAX_TARGETS, 3, NULL, true);

					events.RescheduleEvent(EVENT_SUMMON_ASSAULT_BOT, RAID_MODE(24 * IN_MILLISECONDS, 20 * IN_MILLISECONDS), 0, PHASE_AERIAL_SOLO__GLOBAL_3);
					return;
				case EVENT_SUMMON_BOOM_BOT:
					DoCast(63811);
					events.RescheduleEvent(EVENT_SUMMON_BOOM_BOT, RAID_MODE(18 * IN_MILLISECONDS, 16 * IN_MILLISECONDS), 0, PHASE_AERIAL_SOLO__GLOBAL_3);
					return;
				case EVENT_AERIAL_CHECK_OTHERUNITS_STATUS:

					if (Creature* Leviathan = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_LEVIATHAN_MK_II)))
					{
						if ((Leviathan->getStandState() == UNIT_STAND_STATE_DEAD) && !Leviathan->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_LEVIATHAN_SELF_REPAIR_START);
								Leviathan->AI()->DoCast(Leviathan, SPELL_SELF_REPAIR);
							}
						}

					}


					if (Creature* VX_001 = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_VX_001)))
					{
						if ((VX_001->getStandState() == UNIT_STAND_STATE_DEAD) && !VX_001->HasUnitState(UNIT_STATE_CASTING)) /* To prevent Self Repair interruption */
						{
							if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							{
								Mimiron->AI()->DoAction(DO_VX001_SELF_REPAIR_START);
								VX_001->AI()->DoCast(VX_001, SPELL_SELF_REPAIR);
							}
						}

					}
					events.ScheduleEvent(EVENT_AERIAL_CHECK_OTHERUNITS_STATUS, 7000);
					break;
				default:
					return;
				}
			}
		}

		void JustSummoned(Creature* summon)
		{
			summons.Summon(summon);

			if (summon->GetEntry() == NPC_EMERGENCY_BOT)
				return;

			summon->AI()->DoZoneInCombat();
			if (gotMimironHardMode)
				summon->CastSpell(summon, SPELL_EMERGENCY_MODE, true);
		}

		void DamageTaken(Unit* /*who*/, uint32 &damage)
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->InterruptNonMeleeSpells(true);
				me->GetMotionMaster()->Clear(true);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
				me->SetReactState(REACT_PASSIVE);
				me->AttackStop();
				me->RemoveAllAurasExceptType(SPELL_AURA_CONTROL_VEHICLE);
				DoCast(me, SPELL_VEHICLE_DAMAGED, true);
				me->SetCanFly(false);
				me->SetDisableGravity(true);
				me->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);

				if (phase == PHASE_AERIAL_ASSEMBLED__GLOBAL_4)
					me->SetStandState(UNIT_STAND_STATE_DEAD);

				switch (phase)
				{
				case PHASE_AERIAL_SOLO__GLOBAL_3:
					me->SetHealth(me->GetMaxHealth());
					events.CancelEvent(EVENT_SUMMON_JUNK_BOT);
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_ACTIVATE_V0L7R0N);
					break;
				case PHASE_AERIAL_ASSEMBLED__GLOBAL_4:
					if (Creature* Mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
						Mimiron->AI()->DoAction(DO_AERIAL_SELF_REPAIR_START);
					DoCast(me, SPELL_SELF_REPAIR);
					break;
				default:
					break;
				}
				events.Reset();
				phase = PHASE_IDLE;
				events.SetPhase(phase);
			}
		}

	private:
		MyPhase phase;
		EventMap events;
		SummonList summons;
		InstanceScript* instance;
		bool gotMimironHardMode;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<boss_aerial_unitAI>(creature);
	}
};

class npc_magnetic_core : public CreatureScript
{
public:
	npc_magnetic_core() : CreatureScript("npc_magnetic_core") {}

	struct npc_magnetic_coreAI : public ScriptedAI
	{
		npc_magnetic_coreAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			me->DespawnOrUnsummon(21 * IN_MILLISECONDS);
			if (Creature* AerialUnit = me->FindNearestCreature(NPC_AERIAL_COMMAND_UNIT, 100.0f, true))
			{
				AerialUnit->AI()->DoAction(DO_DISABLE_AERIAL); // Causes the NPC to land
				AerialUnit->GetMotionMaster()->MoveFall();

			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_magnetic_coreAI(creature);
	}
};

class npc_assault_bot : public CreatureScript
{
public:
	npc_assault_bot() : CreatureScript("npc_assault_bot") {}

	struct npc_assault_botAI : public ScriptedAI
	{
		npc_assault_botAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			_fieldTimer = urand(4 * IN_MILLISECONDS, 6 * IN_MILLISECONDS);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (_fieldTimer <= diff)
			{
				DoCastVictim(SPELL_MAGNETIC_FIELD);
				_fieldTimer = urand(15 * IN_MILLISECONDS, 20 * IN_MILLISECONDS);
			}
			else
				_fieldTimer -= diff;

			DoMeleeAttackIfReady();
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			// Achievement Not-So-Friendly Fire
			if (spell->Id == SPELL_ROCKET_STRIKE_DMG)
				if (Player* player = me->SelectNearestPlayer(100.0f))
					player->CastSpell(player, SPELL_NOT_SO_FRIENDLY_FIRE, true);
		}

	private:
		uint32 _fieldTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_assault_botAI(creature);
	}
};

class npc_emergency_bot : public CreatureScript
{
private:
	enum
	{
		SPELL_DEATH_GRIP = 49560
	};

public:
	npc_emergency_bot() : CreatureScript("npc_emergency_bot") {}

	struct npc_emergency_botAI : public ScriptedAI
	{
		npc_emergency_botAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			// me->setFaction(FACTION_HOSTILE);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DEATH_GRIP, true);
			me->SetReactState(REACT_PASSIVE);
			Reset();
		}

		void Reset()
		{
			me->GetMotionMaster()->MoveRandom(15);
			_sprayTimer = 5 * IN_MILLISECONDS;

			DoCast(me, SPELL_DEAFENING_SIREN, true); // Pre-nerf, both modes emergency bots must cast it.
		}

		void UpdateAI(uint32 diff)
		{
			if (_sprayTimer <= diff)
			{
				DoCast(SPELL_WATER_SPRAY);
				_sprayTimer = 10 * IN_MILLISECONDS;
			}
			else
				_sprayTimer -= diff;
		}

	private:
		uint32 _sprayTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_emergency_botAI(creature);
	}
};

class npc_mimiron_bomb_bot : public CreatureScript
{
public:
	npc_mimiron_bomb_bot() : CreatureScript("npc_mimiron_bomb_bot") {}

	struct npc_mimiron_bomb_botAI : public ScriptedAI
	{
		npc_mimiron_bomb_botAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
			Reset();
		}

		Unit* SelectPlayerTargetInRange(float range)
		{
			Player* target = 0;
			Trinity::AnyPlayerInObjectRangeCheck u_check(me, range, true);
			Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, target, u_check);
			me->VisitNearbyObject(range, searcher);
			return target;
		}

		void Reset()
		{
			explosion = false;

			if (Unit* target = SelectPlayerTargetInRange(100.0f))
			{
				me->AddThreat(target, std::numeric_limits<float>::max());
				me->GetMotionMaster()->MoveFollow(target, 100.0f, 0.0f);
			}
		}

		void SpellHitTarget(Unit* target, SpellInfo const* spell)
		{
			if (!target || !spell)
				return;

			if (target->ToPlayer())
				if (spell->Id == SPELL_BOOM_BOT || spell->Id == SPELL_BOOM_BOT_PERIODIC)
					if (InstanceScript* instance = me->GetInstanceScript())
						if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_MIMIRON)))
							mimiron->AI()->DoAction(DATA_AVOIDED_BOOM_BOT_EXPLOSION);
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			if (spell->Id == SPELL_BOOM_BOT_PERIODIC)
				me->DespawnOrUnsummon(1 * IN_MILLISECONDS);
		}

		void JustDied(Unit* /*killer*/)
		{
			DoCast(me, SPELL_BOOM_BOT, true);
		}

		void UpdateAI(uint32 /*diff*/)
		{
			if (!UpdateVictim())
				return;

			if (!explosion)
			{
				if (Player* player = me->SelectNearestPlayer(100.0f))
				{
					if (me->IsWithinDist(player, 2.0f))
					{
						me->CastSpell(me, 63801, true);
						explosion = true;
					}
				}
			}


			if (explosion)
				me->DespawnOrUnsummon(1500);
			// suicide has procflag PROC_FLAG_DONE_MELEE_AUTO_ATTACK, they have to melee, even tho the spell is delayed if the npc misses
			DoMeleeAttackIfReady();
		}

	private:
		bool explosion;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mimiron_bomb_botAI(creature);
	}
};

/************************************************************************/
/*                    Evil button (HM activator)                        */
/************************************************************************/

class go_not_push_button : public GameObjectScript
{
public:
	go_not_push_button() : GameObjectScript("go_mimiron_hard_mode_activator") {}

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (InstanceScript* instance = go->GetInstanceScript())
		{
			if ((instance->GetBossState(BOSS_MIMIRON) != IN_PROGRESS || instance->GetBossState(BOSS_MIMIRON) != DONE) && player)
				if (Creature* mimiron = ObjectAccessor::GetCreature((*player), instance->GetGuidData(BOSS_MIMIRON)))
				{
				mimiron->AI()->DoAction(DO_ACTIVATE_HARD_MODE);
				go->UseDoorOrButton();
				return true;
				}
		}
		return false;
	}
};

/************************************************************************/
/*                            Helper NPCs                               */
/************************************************************************/

class npc_mimiron_flame_trigger : public CreatureScript
{
public:
	npc_mimiron_flame_trigger() : CreatureScript("npc_mimiron_flame_trigger") {}

	struct npc_mimiron_flame_triggerAI : public ScriptedAI
	{
		npc_mimiron_flame_triggerAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
			Reset();
		}

		void Reset()
		{
			flameTimer = 2 * IN_MILLISECONDS;
			me->SetInCombatWithZone();
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			switch (spell->Id)
			{
			case SPELL_FLAME_SUPPRESSANT_MK:
			case SPELL_FLAME_SUPPRESSANT_VX001:
			case SPELL_FROST_BOMB_EXPLOSION_10:
			case SPELL_FROST_BOMB_EXPLOSION_25:
			case SPELL_WATER_SPRAY:
				flameTimer = 2 * IN_MILLISECONDS;
				me->DespawnOrUnsummon(1 * IN_MILLISECONDS);
				break;
			default:
				break;
			}
		}

		void JustSummoned(Creature* /*summon*/)
		{
			if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
				mimiron->AI()->DoAction(DO_INCREASE_FLAME_COUNT);
		}

		void UpdateAI(uint32 diff)
		{
			if (flameTimer <= diff)
			{
				// Either the flameCount gets glitched somehow or Mimiron is not accessable at some point (third phase?)
				if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
					if (mimiron->AI()->GetData(DATA_FLAME_COUNT) >= FLAME_CAP)
					{
					me->DespawnOrUnsummon();
					return;
					}

				DoZoneInCombat(me, 100.0f);


				if (Player* nearest = me->SelectNearestPlayer(150.0f))
				{
					me->GetMotionMaster()->Clear();
					me->GetMotionMaster()->MoveFollow(nearest, 0.0f, 0.0f);
				}

				me->SummonCreature(NPC_FLAME_SPREAD, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
				flameTimer = 8 * IN_MILLISECONDS;
			}
			else
				flameTimer -= diff;
		}

	private:
		InstanceScript* instance;
		uint32 flameTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mimiron_flame_triggerAI(creature);
	}
};

class npc_mimiron_flame_spread : public CreatureScript
{
public:
	npc_mimiron_flame_spread() : CreatureScript("npc_mimiron_flame_spread") {}

	struct npc_mimiron_flame_spreadAI : public ScriptedAI
	{
		npc_mimiron_flame_spreadAI(Creature* creature) : ScriptedAI(creature) {}

		void InitializeAI()
		{
			instance = me->GetInstanceScript();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_DISABLE_MOVE);
			me->SetReactState(REACT_PASSIVE);
			Reset();
		}

		void Reset()
		{
			DoCast(me, SPELL_FLAME, true);
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			switch (spell->Id)
			{
			case SPELL_FLAME_SUPPRESSANT_MK:
			case SPELL_FLAME_SUPPRESSANT_VX001:
			case SPELL_FROST_BOMB_EXPLOSION_10:
			case SPELL_FROST_BOMB_EXPLOSION_25:
			case SPELL_WATER_SPRAY:
				if (Creature* mimiron = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_MIMIRON) : ObjectGuid::Empty))
					mimiron->AI()->DoAction(DO_DECREASE_FLAME_COUNT);
				me->DespawnOrUnsummon(1 * IN_MILLISECONDS);
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 /*diff*/)
		{
			if (instance && instance->GetBossState(BOSS_MIMIRON) != IN_PROGRESS)
				me->DespawnOrUnsummon();
		}

	private:
		InstanceScript* instance;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mimiron_flame_spreadAI(creature);
	}
};

class npc_frost_bomb : public CreatureScript
{
public:
	npc_frost_bomb() : CreatureScript("npc_frost_bomb") {}

	struct npc_frost_bombAI : public ScriptedAI
	{
		npc_frost_bombAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
		}

		void InitializeAI()
			/*


			HACER UN EVENTO CON ESTO, DESDE QUE SE SPAWNEE HASTA -1 SE DESPAWNEE, UNOS 8-9 SECS




			MIRAR TAMBIÉN EL SUMMON DE LAS FROST BOMB, ALGUNAS LAS MANDA LEJOS



			PARECE QUE CAST VISUAL SPELL LO HACE MÁS DE LO QUE DEBE, ECHAR UN OJO.


			hay una criatura que tiene vacia la tabla de aggro y hace una llamada a dozoneincombat (mirar el world server en hard mode)




			REVISAR SI LOS EMERGENCY BOT TIENEN QUE SER DESPAWNEADS EN LA ULTIMA FASE.

			*/
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			Reset();
		}

		void Reset()
		{
			DoCast(me, SPELL_FROST_BOMB_VISUAL, true);
			frostTimer = 10 * IN_MILLISECONDS;
		}

		void UpdateAI(uint32 diff)
		{
			if (frostTimer <= diff)
			{
				DoCastAOE(RAID_MODE(SPELL_FROST_BOMB_EXPLOSION_10, SPELL_FROST_BOMB_EXPLOSION_25), true);
				frostTimer = 10 * IN_MILLISECONDS;
			}
			else
				frostTimer -= diff;
		}

	private:
		uint32 frostTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_frost_bombAI(creature);
	}
};

// 64402 - Rocket Strike, 65034 - Rocket Strike
class spell_mimiron_rocket_strike : public SpellScriptLoader
{
public:
	spell_mimiron_rocket_strike() : SpellScriptLoader("spell_mimiron_rocket_strike") { }

	class spell_mimiron_rocket_strike_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_rocket_strike_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SCRIPT_EFFECT_ROCKET_STRIKE))
				return false;
			return true;
		}

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (targets.empty())
				return;

			if (m_scriptSpellId == SPELL_ROCKET_STRIKE_LEFT && GetCaster()->IsVehicle())
				std::cout << "\n \n DENTRO DEL SPELL, EL CASTER ES VEHÍCULO \n \n";
				if (WorldObject* target = GetCaster()->GetVehicleKit()->GetPassenger(6))
				{
					std::cout << "\n \n GET PASSENGER 6 CORRECTO. \n \n";
				targets.clear();
				targets.push_back(target);
				}
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			GetHitUnit()->CastSpell((Unit*)NULL, SPELL_SCRIPT_EFFECT_ROCKET_STRIKE, true, NULL, NULL, GetCaster()->GetGUID());
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_mimiron_rocket_strike_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_rocket_strike_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_rocket_strike_SpellScript();
	}
};

// 63041 - Rocket Strike
class spell_mimiron_rocket_strike_damage : public SpellScriptLoader
{
public:
	spell_mimiron_rocket_strike_damage() : SpellScriptLoader("spell_mimiron_rocket_strike_damage") { }

	class spell_mimiron_rocket_strike_damage_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_rocket_strike_damage_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_NOT_SO_FRIENDLY_FIRE))
				return false;
			return true;
		}

		void HandleAfterCast()
		{
			if (TempSummon* summ = GetCaster()->ToTempSummon())
				summ->DespawnOrUnsummon();
		}

		void HandleFriendlyFire(SpellEffIndex /*effIndex*/)
		{
			GetHitUnit()->CastSpell((Unit*)NULL, SPELL_NOT_SO_FRIENDLY_FIRE, true);
		}

		void Register() override
		{
			AfterCast += SpellCastFn(spell_mimiron_rocket_strike_damage_SpellScript::HandleAfterCast);
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_rocket_strike_damage_SpellScript::HandleFriendlyFire, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_rocket_strike_damage_SpellScript();
	}
};

// 63681 - Rocket Strike
class spell_mimiron_rocket_strike_target_select : public SpellScriptLoader
{
public:
	spell_mimiron_rocket_strike_target_select() : SpellScriptLoader("spell_mimiron_rocket_strike_target_select") { }

	class spell_mimiron_rocket_strike_target_select_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_rocket_strike_target_select_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_ROCKET_STRIKE))
				return false;
			return true;
		}

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (targets.empty())
				return;

			WorldObject* target = Trinity::Containers::SelectRandomContainerElement(targets);

			targets.remove_if(Trinity::AllWorldObjectsInRange(GetCaster(), 15.0f));

			if (!targets.empty())
				target = Trinity::Containers::SelectRandomContainerElement(targets);

			targets.clear();
			targets.push_back(target);
		}

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (InstanceScript* instance = GetCaster()->GetInstanceScript())
				GetCaster()->CastSpell(GetHitUnit(), SPELL_SUMMON_ROCKET_STRIKE, true, NULL, NULL, instance->GetGuidData(DATA_VX_001));
			GetCaster()->SetDisplayId(11686);
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_mimiron_rocket_strike_target_select_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_rocket_strike_target_select_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_rocket_strike_target_select_SpellScript();
	}
};

class spell_frost_bomb : public SpellScriptLoader
{
public:
	spell_frost_bomb() : SpellScriptLoader("spell_frost_bomb") {}

	class spell_frost_bomb_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_frost_bomb_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (WorldObject* _target = Trinity::Containers::SelectRandomContainerElement(targets))
			{
				targets.clear();
				targets.push_back(_target);
			}
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_frost_bomb_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_frost_bomb_SpellScript();
	}
};

/************************************************************************/
/*                          Achievements                                */
/************************************************************************/

class achievement_firefighter : public AchievementCriteriaScript
{
public:
	achievement_firefighter(const char* name) : AchievementCriteriaScript(name) {}

	bool OnCheck(Player* player, Unit* /*target*/)
	{
		if (player)
			if (InstanceScript* instance = player->GetInstanceScript())
				if (Creature* mimiron = ObjectAccessor::GetCreature(*player, instance->GetGuidData(BOSS_MIMIRON)))
					return (mimiron->AI()->GetData(DATA_GET_HARD_MODE));
		return false;
	}
};

class achievement_set_up_us_the_bomb__proximity_mines : public AchievementCriteriaScript
{
public:
	achievement_set_up_us_the_bomb__proximity_mines(const char* name) : AchievementCriteriaScript(name) {}

	bool OnCheck(Player* player, Unit* /*target*/)
	{
		if (player)
			if (InstanceScript* instance = player->GetInstanceScript())
				if (Creature* mimiron = ObjectAccessor::GetCreature(*player, instance->GetGuidData(BOSS_MIMIRON)))
					return (mimiron->AI()->GetData(DATA_AVOIDED_PROXIMITY_MINES));
		return false;
	}
};

class achievement_set_up_us_the_bomb__rocket_strikes : public AchievementCriteriaScript
{
public:
	achievement_set_up_us_the_bomb__rocket_strikes(const char* name) : AchievementCriteriaScript(name) {}

	bool OnCheck(Player* player, Unit* /*target*/)
	{
		if (player)
			if (InstanceScript* instance = player->GetInstanceScript())
				if (Creature* mimiron = ObjectAccessor::GetCreature(*player, instance->GetGuidData(BOSS_MIMIRON)))
					return (mimiron->AI()->GetData(DATA_AVOIDED_ROCKET_STRIKES));
		return false;
	}
};

class achievement_set_up_us_the_bomb__boombot_explosion : public AchievementCriteriaScript
{
public:
	achievement_set_up_us_the_bomb__boombot_explosion(const char* name) : AchievementCriteriaScript(name) {}

	bool OnCheck(Player* player, Unit* /*target*/)
	{
		if (player)
			if (InstanceScript* instance = player->GetInstanceScript())
				if (Creature* mimiron = ObjectAccessor::GetCreature(*player, instance->GetGuidData(BOSS_MIMIRON)))
					return (mimiron->AI()->GetData(DATA_AVOIDED_BOOM_BOT_EXPLOSION));
		return false;
	}
};

class spell_mimiron_summon_assault_bot : public SpellScriptLoader
{
public:
	spell_mimiron_summon_assault_bot() : SpellScriptLoader("spell_mimiron_summon_assault_bot") { }

	class spell_mimiron_summon_assault_bot_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_mimiron_summon_assault_bot_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_ASSAULT_BOT))
				return false;
			return true;
		}

		void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* caster = GetCaster())
				if (InstanceScript* instance = caster->GetInstanceScript())
					if (instance->GetBossState(BOSS_MIMIRON) == IN_PROGRESS)
						caster->CastSpell(caster, SPELL_SUMMON_ASSAULT_BOT, false, NULL, aurEff, instance->GetGuidData(DATA_AERIAL_UNIT));
		}

		void Register() override
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_mimiron_summon_assault_bot_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_mimiron_summon_assault_bot_AuraScript();
	}
};


class spell_mimiron_summon_assault_bot_target : public SpellScriptLoader
{
public:
	spell_mimiron_summon_assault_bot_target() : SpellScriptLoader("spell_mimiron_summon_assault_bot_target") { }

	class spell_mimiron_summon_assault_bot_target_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_summon_assault_bot_target_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_ASSAULT_BOT_DUMMY))
				return false;
			return true;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			GetHitUnit()->CastSpell(GetHitUnit(), SPELL_SUMMON_ASSAULT_BOT_DUMMY, true);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_summon_assault_bot_target_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_summon_assault_bot_target_SpellScript();
	}
};

class spell_mimiron_summon_junk_bot : public SpellScriptLoader
{
public:
	spell_mimiron_summon_junk_bot() : SpellScriptLoader("spell_mimiron_summon_junk_bot") { }

	class spell_mimiron_summon_junk_bot_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_mimiron_summon_junk_bot_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_JUNK_BOT))
				return false;
			return true;
		}

		void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* caster = GetCaster())
				if (InstanceScript* instance = caster->GetInstanceScript())
					if (instance->GetBossState(BOSS_MIMIRON) == IN_PROGRESS)
						caster->CastSpell(caster, SPELL_SUMMON_JUNK_BOT, false, NULL, aurEff, instance->GetGuidData(DATA_AERIAL_UNIT));
		}

		void Register() override
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_mimiron_summon_junk_bot_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_mimiron_summon_junk_bot_AuraScript();
	}
};


class spell_mimiron_summon_junk_bot_target : public SpellScriptLoader
{
public:
	spell_mimiron_summon_junk_bot_target() : SpellScriptLoader("spell_mimiron_summon_junk_bot_target") { }

	class spell_mimiron_summon_junk_bot_target_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_summon_junk_bot_target_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_JUNK_BOT_DUMMY))
				return false;
			return true;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			GetHitUnit()->CastSpell(GetHitUnit(), SPELL_SUMMON_JUNK_BOT_DUMMY, true);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_summon_junk_bot_target_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_summon_junk_bot_target_SpellScript();
	}
};

class spell_mimiron_summon_fire_bot : public SpellScriptLoader
{
public:
	spell_mimiron_summon_fire_bot() : SpellScriptLoader("spell_mimiron_summon_fire_bot") { }

	class spell_mimiron_summon_fire_bot_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_mimiron_summon_fire_bot_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_FIRE_BOT))
				return false;

			return true;
		}

		void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* caster = GetCaster())
				if (InstanceScript* instance = caster->GetInstanceScript())
					if (instance->GetBossState(BOSS_MIMIRON) == IN_PROGRESS)
						caster->CastSpell(caster, SPELL_SUMMON_FIRE_BOT, false, NULL, aurEff, instance->GetGuidData(DATA_AERIAL_UNIT));
		}

		void Register() override
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_mimiron_summon_fire_bot_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_mimiron_summon_fire_bot_AuraScript();
	}
};


class spell_mimiron_summon_fire_bot_target : public SpellScriptLoader
{
public:
	spell_mimiron_summon_fire_bot_target() : SpellScriptLoader("spell_mimiron_summon_fire_bot_target") { }

	class spell_mimiron_summon_fire_bot_target_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mimiron_summon_fire_bot_target_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_FIRE_BOT_DUMMY))
				return false;
			return true;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			GetHitUnit()->CastSpell(GetHitUnit(), SPELL_SUMMON_FIRE_BOT_DUMMY, true);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_mimiron_summon_fire_bot_target_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_mimiron_summon_fire_bot_target_SpellScript();
	}
};

class spell_mimiron_weld : public SpellScriptLoader
{
public:
	spell_mimiron_weld() : SpellScriptLoader("spell_mimiron_weld") { }

	class spell_mimiron_weld_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_mimiron_weld_AuraScript);

		void HandleTick(AuraEffect const* aurEff)
		{
			Unit* caster = GetTarget();
			if (Unit* vehicle = caster->GetVehicleBase())
			{
				if (aurEff->GetTickNumber() % 5 == 0)
					caster->CastSpell(vehicle, RepairSpells[urand(0, 3)]);
				caster->SetFacingToObject(vehicle);
			}
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_mimiron_weld_AuraScript::HandleTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_mimiron_weld_AuraScript();
	}
};

void AddSC_boss_mimiron()
{
	new boss_mimiron();
	new boss_leviathan_mk();
	new boss_leviathan_mk_turret();
	new boss_vx_001();
	new boss_aerial_unit();

	new npc_proximity_mine();
	new npc_rocket_strike();
	new npc_magnetic_core();
	new npc_assault_bot();
	new npc_emergency_bot();
	new npc_mimiron_bomb_bot();
	new npc_mimiron_flame_trigger();
	new npc_mimiron_flame_spread();
	new npc_frost_bomb();

	new spell_mimiron_rocket_strike();
	//new spell_mimiron_rocket_strike_damage();
	//new spell_mimiron_rocket_strike_target_select();
	new spell_rapid_burst();
	new spell_proximity_mines();
	new spell_frost_bomb();
	new spell_mimiron_summon_assault_bot_target();
	new spell_mimiron_summon_assault_bot();
	new spell_mimiron_summon_junk_bot();
	new spell_mimiron_summon_junk_bot_target();
	new spell_mimiron_summon_fire_bot();
	new spell_mimiron_summon_fire_bot_target();
	new spell_mimiron_weld();

	new go_not_push_button();

	new achievement_firefighter("achievement_firefighter");     // Achiev 3180 / Criteria 10450
	new achievement_firefighter("achievement_firefighter_25");  // Achiev 3189 / Criteria 10463

	// TODO: Find correct criterias for the following achievements:
	new achievement_set_up_us_the_bomb__boombot_explosion("achievement_set_up_us_the_bomb__boombot");
	new achievement_set_up_us_the_bomb__boombot_explosion("achievement_set_up_us_the_bomb__boombot_25");
	new achievement_set_up_us_the_bomb__proximity_mines("achievement_set_up_us_the_bomb__proximity");
	new achievement_set_up_us_the_bomb__proximity_mines("achievement_set_up_us_the_bomb__proximity_25");
	new achievement_set_up_us_the_bomb__rocket_strikes("achievement_set_up_us_the_bomb__rockets");
	new achievement_set_up_us_the_bomb__rocket_strikes("achievement_set_up_us_the_bomb__rockets_25");
}