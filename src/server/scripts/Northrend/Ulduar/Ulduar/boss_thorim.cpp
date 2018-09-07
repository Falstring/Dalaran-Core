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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "ulduar.h"
#include <limits>

// Thorim Spells
enum Spells
{
	SPELL_SHEAT_OF_LIGHTNING = 62276,
	SPELL_STORMHAMMER = 62042,
	SPELL_DEAFENING_THUNDER = 62470,
	SPELL_CHARGE_ORB = 62016,
	SPELL_SUMMON_LIGHTNING_ORB = 62391,
	SPELL_TOUCH_OF_DOMINION = 62565,
	SPELL_CHAIN_LIGHTNING = 62131,
	SPELL_LIGHTNING_CHARGE = 62279,
	SPELL_LIGHTNING_DESTRUCTION = 62393,
	SPELL_LIGHTNING_RELEASE = 62466,
	SPELL_LIGHTNING_PILLAR = 62976,
	SPELL_UNBALANCING_STRIKE = 62130,
	SPELL_BERSERK_PHASE_1 = 62560,
	SPELL_BERSERK_PHASE_2 = 26662
};

enum Events // Only start > 0 is relevant
{
	EVENT_SAY_AGGRO_2 = 1,
	EVENT_STORMHAMMER,
	EVENT_CHARGE_ORB,
	EVENT_SUMMON_WARBRINGER,
	EVENT_SUMMON_EVOKER,
	EVENT_SUMMON_COMMONER,
	EVENT_BERSERK_PHASE_1,
	EVENT_BERSERK_PHASE_2,
	EVENT_UNBALANCING_STRIKE,
	EVENT_CHAIN_LIGHTNING,
	EVENT_TRANSFER_ENERGY,
	EVENT_RELEASE_LIGHTNING_CHARGE,
	EVENT_STOP_LOOKING_AT,
	EVENT_SIF_INTRO,
	EVENT_SIF_SAY_HARDMODE,
};

enum Yells
{
	SAY_AGGRO_1 = 0,
	SAY_AGGRO_2 = 1,
	SAY_SPECIAL = 2,
	SAY_JUMPDOWN = 3,
	SAY_SLAY = 4,
	SAY_BERSERK = 5,
	SAY_WIPE = 6,
	SAY_DEATH = 7,
	SAY_END_NORMAL = 8,
	SAY_END_HARD = 9
};

enum Actions
{
	ACTION_PREPHASE_ADDS_DIED = 1,
	ACTION_DOSCHEDULE_RUNIC_SMASH,
	ACTION_BERSERK,
	ACTION_UPDATE_PHASE,
	ACTION_ACTIVATE_HARD_MODE,
	ACTION_DESPAWN_SIF,
	MAX_HARD_MODE_TIME = 3 * MINUTE*IN_MILLISECONDS,
};

// Achievements
#define ACHIEVEMENT_SIFFED                      RAID_MODE(2977, 2978)
#define ACHIEVEMENT_LOSE_ILLUSION               RAID_MODE(3176, 3183)

enum Creatures
{
	NPC_SIF = 33196,
	NPC_LIGHTNING_ORB = 33138,
	NPC_THUNDER_ORB = 33378,
	NPC_THORIM_COMBAT_TRIGGER = 34055,
	NPC_THORIM_GOLEM_RH_BUNNY = 33140,
	NPC_THORIM_GOLEM_LH_BUNNY = 33141
};

#define SPELL_AURA_OF_CELERITY                  62320
#define SPELL_CHARGE                            32323

enum GameObjects
{
	// GO_LEVER                = 179148,
	GO_DARK_IRON_PORTCULLIS = 194560
};

// Runic Colossus (Mini Boss) Spells
enum RunicSpells
{
	SPELL_SMASH = 62339,
	SPELL_RUNIC_BARRIER = 62338,
	SPELL_RUNIC_CHARGE = 62613,
	SPELL_RUNIC_SMASH = 62465,
	SPELL_RUNIC_SMASH_LEFT = 62057,
	SPELL_RUNIC_SMASH_RIGHT = 62058
};

// Ancient Rune Giant (Mini Boss) Spells
enum AncientSpells
{
	SPELL_RUNIC_FORTIFICATION = 62942,
	SPELL_RUNE_DETONATION = 62526,
	SPELL_STOMP = 62411
};

enum ThorimChests
{
	CACHE_OF_STORMS_10 = 194312,
	CACHE_OF_STORMS_HARDMODE_10 = 194313, // Revisar loot, Val'Anyr Fragments
	CACHE_OF_STORMS_25 = 194315,
	CACHE_OF_STORMS_HARDMODE_25 = 194314
};

const Position Pos[7] =
{
	{ 2095.53f, -279.48f, 419.84f, 0.504f },
	{ 2092.93f, -252.96f, 419.84f, 6.024f },
	{ 2097.86f, -240.97f, 419.84f, 5.643f },
	{ 2113.14f, -225.94f, 419.84f, 5.259f },
	{ 2156.87f, -226.12f, 419.84f, 4.202f },
	{ 2172.42f, -242.70f, 419.84f, 3.583f },
	{ 2171.92f, -284.59f, 419.84f, 2.691f }
};

const Position PosOrbs[7] =
{
	{ 2104.99f, -233.484f, 433.576f, 5.49779f },
	{ 2092.64f, -262.594f, 433.576f, 6.26573f },
	{ 2104.76f, -292.719f, 433.576f, 0.78539f },
	{ 2164.97f, -293.375f, 433.576f, 2.35619f },
	{ 2164.58f, -233.333f, 433.576f, 3.90954f },
	{ 2145.81f, -222.196f, 433.576f, 4.45059f },
	{ 2123.91f, -222.443f, 433.576f, 4.97419f }
};

const Position PosCharge[7] =
{
	{ 2108.95f, -289.241f, 420.149f, 4.122f },
	{ 2097.93f, -262.782f, 420.149f, 3.1738f },
	{ 2108.66f, -237.102f, 420.149f, 2.335f },
	{ 2160.56f, -289.292f, 420.149f, 5.56f },
	{ 2161.02f, -237.258f, 420.149f, 0.787f },
	{ 2143.87f, -227.415f, 420.149f, 1.278f },
	{ 2125.84f, -227.439f, 420.149f, 1.8135f }
};

#define POS_X_ARENA  2181.19f
#define POS_Y_ARENA  -299.12f

struct SummonLocation
{
	Position pos;
	uint32 entry;
};

// Forwarding definition, since required by add-location and predicates
enum ArenaAddEntries
{
	NPC_DARK_RUNE_CHAMPION = 32876,
	NPC_DARK_RUNE_COMMONER = 32904,
	NPC_DARK_RUNE_EVOKER = 32878,
	NPC_DARK_RUNE_WARBRINGER = 32877,
	NPC_IRON_RING_GUARD = 32874,
	NPC_IRON_HONOR_GUARD = 32875,
	NPC_DARK_RUNE_ACOLYTE_ARENA = 32886,
	NPC_DARK_RUNE_ACOLYTE_TUNNEL = 33110
};

SummonLocation preAddLocations[] =
{
	{ { 2149.68f, -263.477f, 419.679f, 3.120f }, NPC_JORMUNGAR_BEHEMOTH },
	{ { 2131.31f, -271.640f, 419.840f, 2.188f }, NPC_MERCENARY_CAPTAIN_A },
	{ { 2127.24f, -259.182f, 419.974f, 5.917f }, NPC_MERCENARY_CAPTAIN_A },
	{ { 2123.32f, -254.770f, 419.840f, 6.170f }, NPC_MERCENARY_CAPTAIN_A },
	{ { 2120.10f, -258.990f, 419.840f, 6.250f }, NPC_MERCENARY_CAPTAIN_A },
	{ { 2129.09f, -277.142f, 419.756f, 1.222f }, NPC_DARK_RUNE_ACOLYTE }
};


/************************************************************************/
/*                        Predicates                                    */
/************************************************************************/

class HealerCheck
{
public:
	HealerCheck(bool shouldBe) : __shouldBe(shouldBe) {}
	bool operator() (const Unit* unit)
	{
		return __shouldBe ? __IsHealer(unit) : !__IsHealer(unit);
	}
private:
	bool __shouldBe;
	bool __IsHealer(const Unit* who)
	{
		return (who->GetEntry() == NPC_DARK_RUNE_ACOLYTE || who->GetEntry() == NPC_DARK_RUNE_EVOKER || who->GetEntry() == NPC_DARK_RUNE_ACOLYTE_ARENA || who->GetEntry() == NPC_DARK_RUNE_ACOLYTE_TUNNEL);
	}
};

class ArenaAreaCheck
{
public:
	ArenaAreaCheck(bool shouldBeIn) : __shouldBeIn(shouldBeIn) {}
	bool operator() (const WorldObject* unit)
	{
		return __shouldBeIn ? __IsInArena(unit) : !__IsInArena(unit);
	}
private:
	bool __shouldBeIn;
	bool __IsInArena(const WorldObject* who)
	{
		return (who->GetPositionX() < POS_X_ARENA && who->GetPositionY() > POS_Y_ARENA);    /// @todo Check if this is ok, end positions ?
	}
};

struct BerserkSelector
{
	bool operator() (WorldObject* unit)
	{
		if (unit->GetTypeId() != TYPEID_PLAYER)
		{
			for (uint8 i = 0; i < 8; i++)
				if (unit->GetEntry() == (uint32)ArenaAddEntries(i))
					return false;

			if (unit->GetEntry() == NPC_THORIM || unit->GetEntry() == NPC_RUNIC_COLOSSUS || unit->GetEntry() == NPC_RUNE_GIANT)
				return false;
		}

		return true;
	}
};

/************************************************************************/
/*                         Thorim                                       */
/************************************************************************/

class npc_thorim_controller : public CreatureScript
{
private:
	enum MyEvents
	{
		EVENT_CHECK_PLAYER_IN_RANGE = 1,
		EVENT_CHECK_WIPE
	};

public:
	npc_thorim_controller() : CreatureScript("npc_thorim_controller") {}

	struct npc_thorim_controllerAI : public ScriptedAI
	{
		npc_thorim_controllerAI(Creature* creature) : ScriptedAI(creature), summons(me)
		{
			me->SetCanFly(true);
			me->SetVisible(false);
			instance = creature->GetInstanceScript();
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE);
			gotActivated = false;
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void Reset()
		{
			gotActivated = false;
			instance->HandleGameObject(instance->GetGuidData(GO_THORIM_LIGHTNING_FIELD), true); // Open the entrance door.
			events.ScheduleEvent(EVENT_CHECK_PLAYER_IN_RANGE, 10 * IN_MILLISECONDS);
		}

		void JustSummoned(Creature* summon)
		{
			summons.Summon(summon);
			summon->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM));
		}

		void SummonedCreatureDies(Creature* summon, Unit* killer)
		{
			summons.Despawn(summon);
			if (summons.empty())
			{
				ObjectGuid attackTarget;
				if (killer != 0)
					if (Player* player = killer->ToPlayer())
						attackTarget = player->GetGUID();

				if (attackTarget == 0)
					if (Player* target = me->SelectNearestPlayer(30.0f))
						attackTarget = target->GetGUID();

				if (Creature* thorim = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_THORIM)))
					thorim->AI()->SetGUID(attackTarget, ACTION_PREPHASE_ADDS_DIED);
				instance->HandleGameObject(instance->GetGuidData(GO_THORIM_LIGHTNING_FIELD), false); // Close the entrance door.

			}
		}

		void UpdateAI(uint32 diff)
		{
			if (instance && instance->GetBossState(BOSS_THORIM) == DONE)
				return;

			events.Update(diff);
			// MoveInLineOfSight does not seem to work here, so...
			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_PLAYER_IN_RANGE:
					if (!gotActivated)
					{
						Player* player = 0;
						Trinity::AnyPlayerInObjectRangeCheck u_check(me, 50.0f, true);
						Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, player, u_check);
						me->VisitNearbyObject(50.0f, searcher);
						if (player)
							if (!player->IsGameMaster())
							{
							for (uint8 i = 0; i < 6; i++)   // Spawn Pre-Phase Adds
								me->SummonCreature(preAddLocations[i].entry, preAddLocations[i].pos, TEMPSUMMON_CORPSE_DESPAWN);

							if (Creature* thorim = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_THORIM)))
								thorim->AI()->DoAction(ACTION_UPDATE_PHASE);

							gotActivated = true;
							events.ScheduleEvent(EVENT_CHECK_WIPE, 3 * IN_MILLISECONDS);
							}
						if (!gotActivated)
							events.ScheduleEvent(EVENT_CHECK_PLAYER_IN_RANGE, 1 * IN_MILLISECONDS);
					}
					break;
				case EVENT_CHECK_WIPE:
				{
					Player* player = NULL;
					Trinity::AnyPlayerInObjectRangeCheck u_check(me, 50.0f, true);
					Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, player, u_check);
					me->VisitNearbyObject(50.0f, searcher);
					if (player)
						events.ScheduleEvent(EVENT_CHECK_WIPE, 3 * IN_MILLISECONDS);
					// if we wiped
					else
					{
						if (Creature* thorim = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_THORIM)))
							thorim->AI()->DoAction(ACTION_BERSERK);

						//gotActivated = false;
						// despawn pre-arena adds
						summons.DespawnAll();
						std::list<Creature*> spawnList;
						for (uint8 i = 0; i < 6; i++)
							me->GetCreatureListWithEntryInGrid(spawnList, preAddLocations[i].entry, 100.0f);
						if (!spawnList.empty())
							for (std::list<Creature*>::iterator itr = spawnList.begin(); itr != spawnList.end(); itr++)
								(*itr)->DespawnOrUnsummon();

						std::list<Creature*> addList;
						me->GetCreatureListWithEntryInGrid(addList, NPC_IRON_RING_GUARD, 200.0f);
						me->GetCreatureListWithEntryInGrid(addList, NPC_DARK_RUNE_ACOLYTE_TUNNEL, 200.0f);
						me->GetCreatureListWithEntryInGrid(addList, NPC_IRON_HONOR_GUARD, 200.0f);

						if (!addList.empty())
							for (std::list<Creature*>::iterator itr = addList.begin(); itr != addList.end(); itr++)
								(*itr)->RemoveAurasDueToSpell(SPELL_BERSERK_PHASE_1);

						if (Creature* colossus = me->FindNearestCreature(NPC_RUNIC_COLOSSUS, 200.0f))
							colossus->AI()->Reset();

						if (Creature* giant = me->FindNearestCreature(NPC_RUNE_GIANT, 200.0f))
							giant->AI()->Reset();

						Reset();
					}
					break;
				}
				default:
					break;
				}
			}
		}

	private:
		bool gotActivated;
		EventMap events;
		InstanceScript* instance;
		SummonList summons;
	};

	CreatureAI* GetAI(Creature* c) const
	{
		return new npc_thorim_controllerAI(c);
	}
};

const uint32 ArenaAddEntries[] = { NPC_DARK_RUNE_CHAMPION, NPC_DARK_RUNE_COMMONER, NPC_DARK_RUNE_EVOKER, NPC_DARK_RUNE_WARBRINGER,
NPC_IRON_RING_GUARD, NPC_IRON_HONOR_GUARD, NPC_DARK_RUNE_ACOLYTE_ARENA, NPC_DARK_RUNE_ACOLYTE_TUNNEL };

class boss_thorim : public CreatureScript
{
private:
	enum Phases
	{
		PHASE_IDLE = 0,
		PHASE_PRE_ARENA_ADDS,
		PHASE_ARENA_ADDS,
		PHASE_ARENA
	};

public:
	boss_thorim() : CreatureScript("boss_thorim") {}

	struct boss_thorimAI : public BossAI
	{
		boss_thorimAI(Creature* creature) : BossAI(creature, BOSS_THORIM)
		{
			gotAddsWiped = false;
			gotEncounterFinished = false;
			homePosition = creature->GetHomePosition();
			//instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_Reset();
			gotEncounterFinished = gotEncounterFinished || (instance->GetBossState(BOSS_THORIM) == DONE);
			if (gotEncounterFinished) // May be called during fight if Thorim gets outfight... hm, should _not_ happen regularly
			{
				me->setFaction(FACTION_FRIENDLY);
				return;
			}

			if (gotAddsWiped)
				Talk(SAY_WIPE);

			me->SetReactState(REACT_PASSIVE);

			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE);


			phase = PHASE_IDLE;
			gotAddsWiped = false;
			HardMode = false;
			gotBerserkedAndOrbSummoned = false;
			summonChampion = false;
			checkTargetTimer = 7 * IN_MILLISECONDS;
			if (Creature* ctrl = ObjectAccessor::GetCreature(*me, instance->GetGuidData(NPC_THORIM_CTRL)))
				ctrl->AI()->Reset();

			// Respawn Mini Bosses
			for (uint8 i = DATA_RUNIC_COLOSSUS; i <= DATA_RUNE_GIANT; i++)  /// @todo Check if we can move this, it's a little bit crazy.
				if (Creature* MiniBoss = ObjectAccessor::GetCreature(*me, instance->GetGuidData(i)))
					MiniBoss->Respawn(true);

			if (GameObject* go = me->FindNearestGameObject(GO_LEVER, 500.0f))
				go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

			// Respawn Sif
			me->SummonCreature(NPC_SIF, 2147.31f, -296.96f, 438.24f, 3.2096f, TEMPSUMMON_CORPSE_DESPAWN);

			instance->HandleGameObject(instance->GetGuidData(GO_THORIM_LIGHTNING_FIELD), true); // Open the entrance door if the raid got past the first adds, since in this case, it will not be performed by the controller bunny.
		}

			void KilledUnit(Unit* /*victim*/) override
		{
			if (!urand(0, 5))
			Talk(SAY_SLAY);
		}

			void EncounterPostProgress()
		{
			if (gotEncounterFinished)  // lock, function should not be called twice
				return;

			gotEncounterFinished = true;
			Talk(SAY_DEATH);
			me->setFaction(FACTION_FRIENDLY);
			me->DespawnOrUnsummon(7 * IN_MILLISECONDS);
			me->RemoveAllAuras();
			me->RemoveAllAttackers();
			me->AttackStop();
			me->CombatStop(true);

			if (Creature* ctrl = ObjectAccessor::GetCreature(*me, instance->GetGuidData(NPC_THORIM_CTRL)))
				ctrl->DespawnOrUnsummon();

			// Kill credit
			DoCastAOE(64985);
			instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, 64985); //
			// Lose Your Illusion
			if (HardMode)
			{
				//instance->DoCompleteAchievement(ACHIEVEMENT_LOSE_ILLUSION);

				Map* map = me->GetMap();
				if (map && map->IsDungeon())
				{
					std::list<Player*> playerList;
					Map::PlayerList const& players = map->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						if (Player* player = itr->GetSource())
						{
							if (AchievementEntry const* siffed = sAchievementMgr->GetAchievement(ACHIEVEMENT_LOSE_ILLUSION))
								player->CompletedAchievement(siffed);
						}
					}
				}
				//instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_COMPLETE_ACHIEVEMENT, 3176);
				if (GameObject* hModeGo = me->SummonGameObject(RAID_MODE(CACHE_OF_STORMS_HARDMODE_10, CACHE_OF_STORMS_HARDMODE_25), 2134.58f, -286.908f, 419.495f, 1.55988f, 0.0f, 0.0f, 1.0f, 1.0f, WEEK)){
					hModeGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
				}
			}
			else
			{
				if (GameObject* go = me->SummonGameObject(RAID_MODE(CACHE_OF_STORMS_10, CACHE_OF_STORMS_25), 2134.58f, -286.908f, 419.495f, 1.55988f, 0, 0, 1, 1, WEEK))
					go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
			}

			_JustDied();
		}

		void EnterCombat(Unit* who) override
		{
			_EnterCombat();
			Talk(SAY_AGGRO_1);

			me->GetMotionMaster()->MovePoint(0, 2133.82f, -289.50f, 438.24f);

			// Spawn Thunder Orbs
			for (uint8 n = 0; n < 7; n++)
				if (Creature* thunderOrb = me->SummonCreature(NPC_THUNDER_ORB, PosOrbs[n], TEMPSUMMON_CORPSE_DESPAWN))
				{
				//thunderOrb->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				thunderOrb->SetDisplayId(thunderOrb->GetCreatureTemplate()->Modelid2);
				thunderOrb->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

				}

			EncounterTime = 0;
			phase = PHASE_ARENA_ADDS;
			events.SetPhase(phase);
			DoCast(me, SPELL_SHEAT_OF_LIGHTNING);
			events.ScheduleEvent(EVENT_STORMHAMMER, 32 * IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_CHARGE_ORB, 30 * IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_SUMMON_WARBRINGER, 25 * IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_SUMMON_EVOKER, 30 * IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_SUMMON_COMMONER, 35 * IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_BERSERK_PHASE_1, 5 * MINUTE*IN_MILLISECONDS, 0, phase);
			events.ScheduleEvent(EVENT_SAY_AGGRO_2, 10 * IN_MILLISECONDS, 0, phase);

			// me->GetCreature(*me, instance->GetGuidData(DATA_RUNIC_COLOSSUS
			/*if (Creature* runic = me->GetCreature(*me, instance->GetGuidData(DATA_RUNIC_COLOSSUS)))
			{
			runic->AI()->DoAction(ACTION_DOSCHEDULE_RUNIC_SMASH);  // Signals runic smash rotation
			}*/

			/*if(Creature* runicColossus = Unit::GetCreature(*me, instance->GetData(DATA_RUNIC_COLOSSUS))){
			runicColossus->AI()->DoAction(ACTION_DOSCHEDULE_RUNIC_SMASH);
			}*/

			if (GameObject* go = me->FindNearestGameObject(GO_LEVER, 500.0f))
				go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

			me->SetFacingToObject(who);


			/*DoCastAOE(64899);
			instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, 64899);*/
		}

			void EnterEvadeMode() override
		{
			if (!_EnterEvadeMode())
			return;

			me->SetHomePosition(homePosition);
			me->GetMotionMaster()->MoveTargetedHome();
			Reset();
		}

			void SpellHitTarget(Unit* target, SpellInfo const* spell) override
		{
			if (spell->Id != SPELL_STORMHAMMER)
			return;

			Map* map = me->GetMap();
			if (map && map->IsDungeon())
			{
				std::list<Player*> playerList;
				Map::PlayerList const& players = map->GetPlayers();
				for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
				{
					if (Player* player = itr->GetSource())
					{
						if (target->IsWithinDistInMap(player, 15.0f, true))
						{
							player->CastSpell(player, 62470, false);
						}
					}
				}
			}
		}



			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (phase == PHASE_ARENA_ADDS && me->GetVictim() && ArenaAreaCheck(false)(me->GetVictim()))
			{
				me->GetVictim()->getHostileRefManager().deleteReference(me);
				return;
			}

			if (checkTargetTimer < diff)
			{
				if (!SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
				{
					EnterEvadeMode();
					return;
				}
				checkTargetTimer = 7 * IN_MILLISECONDS;
			}
			else
				checkTargetTimer -= diff;

			// Thorim should be inside the arena during phase 3
			if (phase == PHASE_ARENA && ArenaAreaCheck(false)(me))
			{
				EnterEvadeMode();
				return;
			}

			EncounterTime += diff;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SAY_AGGRO_2:
					Talk(SAY_AGGRO_2);
					//Schedule Sif: Thorim, my Lord!
					events.ScheduleEvent(EVENT_SIF_INTRO, 9000);
					break;
				case EVENT_SIF_INTRO:
					if (Creature* sif = me->FindNearestCreature(NPC_SIF, 100.0f))
					{
						sif->AI()->Talk(0);
					}
					break;
				case EVENT_STORMHAMMER:
					if (Unit* stormHammerTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
						DoCast(stormHammerTarget, SPELL_STORMHAMMER, true);

					events.ScheduleEvent(EVENT_STORMHAMMER, urand(22 * IN_MILLISECONDS, 27 * IN_MILLISECONDS), 0, PHASE_ARENA_ADDS);
					break;
				case EVENT_CHARGE_ORB:
					if (Player* player = me->SelectNearestPlayer(69.0f))
					{
						DoCastAOE(SPELL_CHARGE_ORB);
						events.ScheduleEvent(EVENT_CHARGE_ORB, urand(15 * IN_MILLISECONDS, 20 * IN_MILLISECONDS), 0, PHASE_ARENA_ADDS);
					}
					else
					{
						DoAction(ACTION_BERSERK);
					}
					break;
				case EVENT_SUMMON_WARBRINGER:
					me->SummonCreature(ArenaAddEntries[3], Pos[rand() % 7], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);
					if (summonChampion)
					{
						me->SummonCreature(ArenaAddEntries[0], Pos[rand() % 7], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);
						summonChampion = false;
					}
					else
						summonChampion = true;
					events.ScheduleEvent(EVENT_SUMMON_WARBRINGER, 24 * IN_MILLISECONDS, 0, PHASE_ARENA_ADDS);
					break;
				case EVENT_SUMMON_EVOKER:
					me->SummonCreature(ArenaAddEntries[2], Pos[rand() % 7], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_SUMMON_EVOKER, urand(25 * IN_MILLISECONDS, 27 * IN_MILLISECONDS), 0, PHASE_ARENA_ADDS);
					break;
				case EVENT_SUMMON_COMMONER:
					for (uint8 n = 0; n < urand(5, 7); ++n)
						me->SummonCreature(ArenaAddEntries[1], Pos[rand() % 7], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_SUMMON_COMMONER, 35 * IN_MILLISECONDS, 0, PHASE_ARENA_ADDS);
					break;
				case EVENT_BERSERK_PHASE_1:
					//DoCast(me, SPELL_BERSERK_PHASE_1);
					me->SummonCreature(NPC_LIGHTNING_ORB, 2192.0f, -263.0f, 414.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 30 * IN_MILLISECONDS);
					//DoCast(me, SPELL_SUMMON_LIGHTNING_ORB, true);
					Talk(SAY_BERSERK);
					break;
					// Phase 3 stuff
				case EVENT_UNBALANCING_STRIKE:
					DoCastVictim(SPELL_UNBALANCING_STRIKE);
					events.ScheduleEvent(EVENT_UNBALANCING_STRIKE, 19 * IN_MILLISECONDS, 0, PHASE_ARENA);
					break;
				case EVENT_CHAIN_LIGHTNING:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
						DoCast(target, SPELL_CHAIN_LIGHTNING);
					events.ScheduleEvent(EVENT_CHAIN_LIGHTNING, urand(9 * IN_MILLISECONDS, 18 * IN_MILLISECONDS), 0, PHASE_ARENA);
					break;
				case EVENT_TRANSFER_ENERGY:
					if (Creature* currentSource = me->SummonCreature(NPC_THORIM_COMBAT_TRIGGER, PosCharge[urand(0, 6)], TEMPSUMMON_TIMED_DESPAWN, 9 * IN_MILLISECONDS))
					{
						currentSource->CastSpell(currentSource, SPELL_LIGHTNING_PILLAR, true);
						currentSourceGUID = currentSource->GetGUID();
					}
					events.ScheduleEvent(EVENT_RELEASE_LIGHTNING_CHARGE, 8 * IN_MILLISECONDS, 0, PHASE_ARENA);
					break;
				case EVENT_RELEASE_LIGHTNING_CHARGE:

					if (currentSourceGUID)
					{
						if (Creature* currentSource = ObjectAccessor::GetCreature(*me, currentSourceGUID))
						{
							me->AttackStop();
							me->StopMoving();
							me->SetReactState(REACT_PASSIVE);
							me->SetFacingTo(currentSource->GetOrientation());
							me->SetOrientation(currentSource->GetOrientation());
							DoCast(currentSource, SPELL_LIGHTNING_RELEASE);
						}
					}

					events.ScheduleEvent(EVENT_STOP_LOOKING_AT, 1500);
					events.ScheduleEvent(EVENT_TRANSFER_ENERGY, 8 * IN_MILLISECONDS, 0, PHASE_ARENA);
					break;
				case EVENT_STOP_LOOKING_AT:
					me->SetReactState(REACT_AGGRESSIVE);
					me->CastSpell(me, SPELL_LIGHTNING_CHARGE, true);
					break;
				case EVENT_BERSERK_PHASE_2:
					DoCast(me, SPELL_BERSERK_PHASE_2);
					Talk(SAY_BERSERK);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
			// EnterEvadeIfOutOfCombatArea(diff);
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_BERSERK:

				if (phase == PHASE_ARENA)
					return;

				//DoCast(me, SPELL_BERSERK_PHASE_1);
				me->SummonCreature(NPC_LIGHTNING_ORB, 2192.0f, -263.0f, 414.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 30 * IN_MILLISECONDS);
				Talk(SAY_BERSERK);
				gotBerserkedAndOrbSummoned = true;

				break;
			case ACTION_UPDATE_PHASE:
				phase = PHASE_PRE_ARENA_ADDS;
				break;
			default:
				break;
			}
		}

			void SetGUID(ObjectGuid guid, int32 data) override
		{
			switch (data)
			{
			case ACTION_PREPHASE_ADDS_DIED:
				if (!gotAddsWiped)
				{
					gotAddsWiped = true;
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					events.Reset();
					DoZoneInCombat();
				}
				break;
			default:
				break;
			}
		}

			void JustSummoned(Creature* summon) override
		{
			summons.Summon(summon);
			if (me->IsInCombat())
				DoZoneInCombat(summon);

			if (summon->GetEntry() == NPC_LIGHTNING_ORB)
				summon->CastSpell(summon, SPELL_LIGHTNING_DESTRUCTION, true);

		}

			void SummonedCreatureDies(Creature* summon, Unit* /*killer*/) override
		{
			summons.Despawn(summon);
			summon->RemoveCorpse(false);
		}

			void DamageTaken(Unit* attacker, uint32 &damage) override
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
                if (instance)
                    instance->SetBossState(BOSS_THORIM, DONE);
				EncounterPostProgress();
			}

			if (phase == PHASE_ARENA_ADDS)
			{
				/*Creature* colossus = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RUNIC_COLOSSUS));
				Creature* giant = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RUNE_GIANT));*/
				Creature* runicColossus = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RUNIC_COLOSSUS));
				Creature* runeGiant = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_RUNE_GIANT));

				//if (me->IsWithinCombatRange(attacker, 2.0f) && !attacker->IsPet())

				if (runicColossus && !runicColossus->IsAlive() && runeGiant && !runeGiant->IsAlive())
				{
					Talk(SAY_JUMPDOWN);
					phase = PHASE_ARENA;
					events.SetPhase(PHASE_ARENA);
					me->RemoveAurasDueToSpell(SPELL_SHEAT_OF_LIGHTNING);
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
					me->GetMotionMaster()->MoveJump(2134.79f, -263.03f, 419.84f, 10.0f, 20.0f);
					summons.DespawnEntry(NPC_THUNDER_ORB); // despawn charged orbs
					events.ScheduleEvent(EVENT_UNBALANCING_STRIKE, 15 * IN_MILLISECONDS, 0, PHASE_ARENA);
					events.ScheduleEvent(EVENT_CHAIN_LIGHTNING, 20 * IN_MILLISECONDS, 0, PHASE_ARENA);
					events.ScheduleEvent(EVENT_TRANSFER_ENERGY, 20 * IN_MILLISECONDS, 0, PHASE_ARENA);
					events.ScheduleEvent(EVENT_BERSERK_PHASE_2, 5 * MINUTE*IN_MILLISECONDS, 0, PHASE_ARENA);
					// Check for Hard Mode
					if (EncounterTime <= MAX_HARD_MODE_TIME)
					{

						HardMode = true;

						if (Creature* sif = me->FindNearestCreature(NPC_SIF, 100.0f))
						{
							sif->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							sif->AI()->DoAction(ACTION_ACTIVATE_HARD_MODE);
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
									if (AchievementEntry const* siffed = sAchievementMgr->GetAchievement(ACHIEVEMENT_SIFFED))
										player->CompletedAchievement(siffed);
								}
							}
						}

					}
					else
					{
						me->AddAura(SPELL_TOUCH_OF_DOMINION, me);
						if (Creature* sif = me->FindNearestCreature(NPC_SIF, 100.0f))
							sif->AI()->DoAction(ACTION_DESPAWN_SIF);
					}
				}
			}
		}

	private:
		Phases phase;
		uint8 PreAddsCount;
		uint32 EncounterTime;
		uint32 checkTargetTimer;
		bool gotAddsWiped;
		bool HardMode;
		bool gotBerserkedAndOrbSummoned;
		bool gotEncounterFinished;
		bool summonChampion;
		Position homePosition;
		ObjectGuid currentSourceGUID;

		//InstanceScript* instance;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_thorimAI>(creature);
	}
};

/************************************************************************/
/* Pre-Phase adds                                                       */
/* Note: The behavior script below will be registered for all pre-phase */
/* indices, so we need some helpers for managing their spells and       */
/* entries.                                                             */
/************************************************************************/
enum PreAddSpells
{
	SPELL_ACID_BREATH_10 = 62315,
	SPELL_ACID_BREATH_25 = 62415,
	SPELL_SWEEP_10 = 62316,
	SPELL_SWEEP_25 = 62417,

	SPELL_DEVASTATE = 62317,
	SPELL_HEROIC_SWIPE = 62444,

	SPELL_BARBED_SHOT = 62318,
	SPELL_SHOOT = 16496,

	SPELL_RENEW_10 = 62333,
	SPELL_RENEW_25 = 62441,
	SPELL_GREATER_HEAL_10 = 62334,
	SPELL_GREATER_HEAL_25 = 62442
};

#define SPELL_HOLY_SMITE    RAID_MODE(62335, 62443)

enum PrePhaseAddIndex
{
	INDEX_BEHEMOTH = 0,
	INDEX_MERCENARY_CAPTAIN_A,
	INDEX_MERCENARY_SOLDIER_A,
	INDEX_DARK_RUNE_ACOLYTE,
	INDEX_MERCENARY_CAPTAIN_H,
	INDEX_MERCENARY_SOLDIER_H,
	INDEX_PRE_ADD_NONE
};
const uint32 PrePhaseAddList[] = { NPC_JORMUNGAR_BEHEMOTH, NPC_MERCENARY_CAPTAIN_A, NPC_MERCENARY_SOLDIER_A, NPC_DARK_RUNE_ACOLYTE, NPC_MERCENARY_CAPTAIN_H, NPC_MERCENARY_SOLDIER_H };
const uint32 PrePhaseAddSpells_Primary[2][6] =
{
	{ SPELL_ACID_BREATH_10, SPELL_DEVASTATE, SPELL_BARBED_SHOT, SPELL_RENEW_10, SPELL_DEVASTATE, SPELL_BARBED_SHOT },
	{ SPELL_ACID_BREATH_25, SPELL_DEVASTATE, SPELL_BARBED_SHOT, SPELL_RENEW_25, SPELL_DEVASTATE, SPELL_BARBED_SHOT }
};
const uint32 PrePhaseAddSpells_Secondary[2][6] =
{
	{ SPELL_SWEEP_10, SPELL_HEROIC_SWIPE, SPELL_SHOOT, SPELL_GREATER_HEAL_10, SPELL_HEROIC_SWIPE, SPELL_SHOOT },
	{ SPELL_SWEEP_25, SPELL_HEROIC_SWIPE, SPELL_SHOOT, SPELL_GREATER_HEAL_25, SPELL_HEROIC_SWIPE, SPELL_SHOOT }
};

class PrePhaseAddHelper
{
private:
	enum ManCnt
	{
		In10Man = 0,
		In25Man
	};

public:
	enum Index
	{
		INDEX_PRIMARY,
		INDEX_SECONDARY
	};

	PrePhaseAddHelper(Difficulty raidDifficulty)
	{
		if (raidDifficulty == RAID_DIFFICULTY_25MAN_NORMAL || raidDifficulty == RAID_DIFFICULTY_25MAN_HEROIC) // should not be heroic, just for the case
			diffi = In10Man;
		else
			diffi = In25Man;
	}

	PrePhaseAddIndex operator[](uint32 creatureEntry)
	{
		for (uint8 i = 0; i < 6; i++)
			if (PrePhaseAddList[i] == creatureEntry)
				return PrePhaseAddIndex(i);
		return INDEX_PRE_ADD_NONE;
	}

	uint32 operator()(PrePhaseAddIndex myId, Index idx)
	{
		if (myId < INDEX_PRE_ADD_NONE)
		{
			if (idx == INDEX_PRIMARY)
				return PrePhaseAddSpells_Primary[diffi][myId];
			else
				return PrePhaseAddSpells_Secondary[diffi][myId];
		}
		return 0;
	}

private:
	ManCnt diffi;
};

class npc_thorim_pre_phase_add : public CreatureScript
{
private:
	enum
	{
		EVENT_PRIMARY_SKILL = 1,
		EVENT_SECONDARY_SKILL,
		EVENT_CHECK_PLAYER_IN_RANGE
	};

public:
	npc_thorim_pre_phase_add() : CreatureScript("npc_thorim_pre_phase_add") {}

	struct npc_thorim_pre_phaseAI : public ScriptedAI
	{
		npc_thorim_pre_phaseAI(Creature *pCreature) : ScriptedAI(pCreature), myHelper(GetDifficulty())
		{
			pInstance = pCreature->GetInstanceScript();
			me->SetReactState(REACT_AGGRESSIVE);
			myIndex = myHelper[me->GetEntry()];
			amIHealer = HealerCheck(true)(me);
		}

		void Reset()
		{
			events.Reset();
			events.ScheduleEvent(EVENT_CHECK_PLAYER_IN_RANGE, 1 * IN_MILLISECONDS);

			/*			if (Player* player = me->SelectNearestPlayer(25.f))
			{
			if (!player->IsAlive())
			{
			if (Creature* ctrl = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(NPC_THORIM_CTRL)))
			ctrl->AI()->Reset();

			me->DespawnOrUnsummon();
			}
			}
			else
			{
			if (Creature* ctrl = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(NPC_THORIM_CTRL)))
			ctrl->AI()->Reset();

			me->DespawnOrUnsummon();
			}*/
		}

		void IsSummonedBy(Unit* /*summoner*/)
		{
			Reset();
		}

		void EnterCombat(Unit* /*target*/)
		{
			events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(3 * IN_MILLISECONDS, 6 * IN_MILLISECONDS));
			events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(12 * IN_MILLISECONDS, 15 * IN_MILLISECONDS));
		}

		void JustDied(Unit* /*victim*/)
		{
			if (Creature* pThorim = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(BOSS_THORIM)))
				pThorim->AI()->DoAction(ACTION_PREPHASE_ADDS_DIED);
		}

		void AttackStart(Unit* target)
		{
			if (myIndex == INDEX_DARK_RUNE_ACOLYTE)
				AttackStartCaster(target, 30.0f);
			else
				ScriptedAI::AttackStart(target);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_PLAYER_IN_RANGE:
					if (!me->IsInCombat())
					{
						Player* player = 0;
						Trinity::AnyPlayerInObjectRangeCheck u_check(me, 70.0f, true);
						Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, player, u_check);
						me->VisitNearbyObject(30.0f, searcher);
						if (player)
						{
							if (!player->IsGameMaster())
								AttackStart(player);
						}
						else
						{
							Reset();
						}

						events.ScheduleEvent(EVENT_CHECK_PLAYER_IN_RANGE, 1 * IN_MILLISECONDS);
					}
					break;
				case EVENT_PRIMARY_SKILL:
					if (Unit* target = amIHealer ? (me->GetHealthPct() > 40 ? DoSelectLowestHpFriendly(40) : me) : me->GetVictim())
					{
						DoCast(target, myHelper(myIndex, PrePhaseAddHelper::INDEX_PRIMARY));
						events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(10 * IN_MILLISECONDS, 15 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(11 * IN_MILLISECONDS, 16 * IN_MILLISECONDS));
					break;
				case EVENT_SECONDARY_SKILL:
					if (amIHealer ? (me->GetHealthPct() > 40 ? DoSelectLowestHpFriendly(40) : me) : me->GetVictim())
					{
						DoCast(myHelper(myIndex, PrePhaseAddHelper::INDEX_SECONDARY));
						events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(5 * IN_MILLISECONDS, 9 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(9 * IN_MILLISECONDS, 14 * IN_MILLISECONDS));
					break;
				default:
					break;
				}
			}

			if (myIndex == INDEX_DARK_RUNE_ACOLYTE)
				DoSpellAttackIfReady(SPELL_HOLY_SMITE);
			else
				DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* pInstance;
		PrePhaseAddHelper myHelper;
		PrePhaseAddIndex myIndex;
		EventMap events;
		bool amIHealer;
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return GetUlduarAI<npc_thorim_pre_phaseAI>(pCreature);
	}
};

/************************************************************************/
/* Adds in arena-phase                                                  */
/* Note: The behavior script below will be registered for all           */
/* arena-phase indices, so we need some helpers for managing their      */
/* spells and entries.                                                  */
/************************************************************************/
enum ArenaAddsSpells
{
	// Primary spells
	SPELL_MORTAL_STRIKE = 35054,
	SPELL_LOW_BLOW = 62326,
	SPELL_RUNIC_LIGHTNING_10 = 62327,
	SPELL_RUNIC_LIGHTNING_25 = 62445,
	SPELL_RUNIC_STRIKE = 62322,
	SPELL_WHIRLING_TRIP = 64151,
	SPELL_CLEAVE = 42724,
	//SPELL_RENEW_10              = 62333,  // Used from previous definition
	//SPELL_RENEW_25              = 62441,
	// Secondary spells
	SPELL_WHIRLWIND = 33500,
	SPELL_PUMMEL = 38313,
	SPELL_RUNIC_SHIELD_10 = 62321,
	SPELL_RUNIC_SHIELD_25 = 62529,
	SPELL_IMPALE_10 = 62331, //
	SPELL_IMPALE_25 = 62418,
	SPELL_SHIELD_SMASH_10 = 62332,
	SPELL_SHIELD_SMASH_25 = 62420,
	//SPELL_GREATER_HEAL_10       = 62334,  // Used from previous definition
	//SPELL_GREATER_HEAL_25       = 62442,
	// Some tertiary skills
	SPELL_RUNIC_MENDING = 62328
};

enum ArenaAddIndex
{
	INDEX_DARK_RUNE_CHAMPION = 0,
	INDEX_DARK_RUNE_COMMONER,
	INDEX_DARK_RUNE_EVOKER,
	INDEX_DARK_RUNE_WARBRINGER,
	INDEX_IRON_RING_GUARD,
	INDEX_IRON_HONOR_GUARD,
	INDEX_ARENA_DARK_RUNE_ACOLYTE,
	INDEX_ARENA_ADD_NONE
};
const uint32 ArenaAddSpells_Primary[2][7] =
{
	{ SPELL_MORTAL_STRIKE, SPELL_LOW_BLOW, SPELL_RUNIC_LIGHTNING_10, SPELL_RUNIC_STRIKE, SPELL_WHIRLING_TRIP, SPELL_CLEAVE, SPELL_RENEW_10 },
	{ SPELL_MORTAL_STRIKE, SPELL_LOW_BLOW, SPELL_RUNIC_LIGHTNING_25, SPELL_RUNIC_STRIKE, SPELL_WHIRLING_TRIP, SPELL_CLEAVE, SPELL_RENEW_25 }
};
const uint32 ArenaAddSpells_Secondary[2][7] =
{
	{ SPELL_WHIRLWIND, SPELL_PUMMEL, SPELL_RUNIC_SHIELD_10, 0, SPELL_IMPALE_10, SPELL_SHIELD_SMASH_10, SPELL_GREATER_HEAL_10 },
	{ SPELL_WHIRLWIND, SPELL_PUMMEL, SPELL_RUNIC_SHIELD_25, 0, SPELL_IMPALE_25, SPELL_SHIELD_SMASH_25, SPELL_GREATER_HEAL_25 }
};

class ArenaPhaseAddHelper
{
private:
	enum ManCnt
	{
		In10Man = 0,
		In25Man
	};

public:
	enum Index
	{
		INDEX_PRIMARY,
		INDEX_SECONDARY
	};

	ArenaPhaseAddHelper(Difficulty raidDifficulty)
	{
		if (raidDifficulty == RAID_DIFFICULTY_25MAN_NORMAL || raidDifficulty == RAID_DIFFICULTY_25MAN_HEROIC) // should not be heroic, just for the case
			diffi = In10Man;
		else
			diffi = In25Man;
	}

	ArenaAddIndex operator[](uint32 creatureEntry)
	{
		for (uint8 i = 0; i < 8; i++)
			if (ArenaAddEntries[i] == creatureEntry)
				return ArenaAddIndex(i);
		return INDEX_ARENA_ADD_NONE;
	}

	uint32 operator()(ArenaAddIndex myId, Index idx)
	{
		if (myId < INDEX_ARENA_ADD_NONE)
		{
			if (idx == INDEX_PRIMARY)
				return ArenaAddSpells_Primary[diffi][myId];
			else
				return ArenaAddSpells_Secondary[diffi][myId];
		}
		return 0;
	}

private:
	ManCnt diffi;
};

class npc_thorim_arena_phase_add : public CreatureScript
{
private:
	enum
	{
		EVENT_PRIMARY_SKILL = 1,
		EVENT_SECONDARY_SKILL,
		EVENT_CHARGE
	};

public:
	npc_thorim_arena_phase_add() : CreatureScript("npc_thorim_arena_phase_add") {}

	struct npc_thorim_arena_phaseAI : public ScriptedAI
	{
		npc_thorim_arena_phaseAI(Creature* creature) : ScriptedAI(creature), myHelper(GetDifficulty())
		{
			_instance = creature->GetInstanceScript();
			myIndex = myHelper[me->GetEntry()];
			IsInArena = ArenaAreaCheck(false)(me);
			amIhealer = HealerCheck(true)(me);
		}

		bool isOnSameSide(const Unit* who)
		{
			return (IsInArena == ArenaAreaCheck(false)(who));
		}

		void DamageTaken(Unit* attacker, uint32 &damage)
		{
			if (!isOnSameSide(attacker))
				damage = 0;
		}

		void Reset()
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(2 * IN_MILLISECONDS, 7 * IN_MILLISECONDS));
			events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(10 * IN_MILLISECONDS, 17 * IN_MILLISECONDS));
			if (myIndex == INDEX_DARK_RUNE_CHAMPION)
				events.ScheduleEvent(EVENT_CHARGE, 8 * IN_MILLISECONDS);
		}

		void EnterCombat(Unit* /*who*/)
		{
			if (myIndex == INDEX_DARK_RUNE_WARBRINGER)
				DoCast(me, SPELL_AURA_OF_CELERITY);
		}

		// this should only happen if theres no alive player in the arena -> summon orb
		// might be called by mind control release or controllers death
		void EnterEvadeMode()
		{
			if (Creature* thorim = ObjectAccessor::GetCreature(*me, _instance ? _instance->GetGuidData(BOSS_THORIM) : ObjectGuid::Empty))
				thorim->AI()->DoAction(ACTION_BERSERK);
			_EnterEvadeMode();
			me->GetMotionMaster()->MoveTargetedHome();
			Reset();
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (me->GetVictim() && !isOnSameSide(me->GetVictim()))
			{
				me->GetVictim()->getHostileRefManager().deleteReference(me);
				return;
			}

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PRIMARY_SKILL:
					if (Unit* target = amIhealer ? (me->GetHealthPct() > 40 ? DoSelectLowestHpFriendly(40) : me) : me->GetVictim())
					{
						if (myIndex == INDEX_DARK_RUNE_EVOKER)  // Specialize
							DoCast(target, SPELL_RUNIC_MENDING);
						else
							DoCast(target, myHelper(myIndex, ArenaPhaseAddHelper::INDEX_PRIMARY));

						events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(4 * IN_MILLISECONDS, 9 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_PRIMARY_SKILL, urand(8 * IN_MILLISECONDS, 16 * IN_MILLISECONDS));
					break;
				case EVENT_SECONDARY_SKILL:
					if (Unit* target = amIhealer ? (me->GetHealthPct() > 40 ? DoSelectLowestHpFriendly(40) : me) : me->GetVictim())
					{
						if (uint32 spellID = myHelper(myIndex, ArenaPhaseAddHelper::INDEX_SECONDARY))
							DoCast(target, spellID);
						events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(12 * IN_MILLISECONDS, 16 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_SECONDARY_SKILL, urand(10 * IN_MILLISECONDS, 18 * IN_MILLISECONDS));
					break;
				case EVENT_CHARGE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
						DoCast(target, SPELL_CHARGE);
					events.ScheduleEvent(EVENT_CHARGE, 12 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}

			if (myIndex == INDEX_ARENA_DARK_RUNE_ACOLYTE)
				DoSpellAttackIfReady(SPELL_HOLY_SMITE);
			else
				DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* _instance;
		ArenaAddIndex myIndex;
		EventMap events;
		ArenaPhaseAddHelper myHelper;
		bool IsInArena;
		bool amIhealer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_thorim_arena_phaseAI>(creature);
	}
};

/************************************************************************/
/* Runic Colossus                                                       */
/************************************************************************/
SummonLocation colossusAddLocations[] =
{
	{ { 2218.38f, -297.50f, 412.18f, 1.030f }, 32874 },
	{ { 2235.07f, -297.98f, 412.18f, 1.613f }, 32874 },
	{ { 2235.26f, -338.34f, 412.18f, 1.589f }, 32874 },
	{ { 2217.69f, -337.39f, 412.18f, 1.241f }, 32874 },
	{ { 2227.58f, -308.30f, 412.18f, 1.591f }, 33110 },
	{ { 2227.47f, -345.37f, 412.18f, 1.566f }, 33110 }
};

class npc_runic_colossus : public CreatureScript
{
private:
	enum
	{
		EVENT_BARRIER = 1,
		EVENT_SMASH,
		EVENT_CHARGE,
		EVENT_RUNIC_SMASH,
		EVENT_SMASH_WAVE
	};

	enum Emote
	{
		EMOTE_BARRIER = 0
	};

	enum Phases
	{
		PHASE_IDLE = 1,
		PHASE_RUNIC_SMASH,
		PHASE_MELEE
	};

public:
	npc_runic_colossus() : CreatureScript("npc_runic_colossus") {}

	struct npc_runic_colossusAI : public ScriptedAI
	{
		npc_runic_colossusAI(Creature* creature) : ScriptedAI(creature), summons(me)
		{
			instance = creature->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);

		}

		void Reset()
		{
			me->setActive(false);
			me->GetMotionMaster()->MoveTargetedHome();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			me->RemoveAurasDueToSpell(SPELL_BERSERK_PHASE_1);
			phase = PHASE_IDLE;
			me->SetReactState(REACT_AGGRESSIVE);
			// Runed Door closed
			if (instance)
				instance->SetData(DATA_RUNIC_DOOR, GO_STATE_READY);

			// Spawn trashes
			summons.DespawnAll();
			for (uint8 i = 0; i < 6; i++)
				me->SummonCreature(colossusAddLocations[i].entry, colossusAddLocations[i].pos.GetPositionX(), colossusAddLocations[i].pos.GetPositionY(), colossusAddLocations[i].pos.GetPositionZ(),
				colossusAddLocations[i].pos.GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);

		}

		void JustSummoned(Creature* summon)
		{
			summons.Summon(summon);
			me->AI()->DoAction(ACTION_DOSCHEDULE_RUNIC_SMASH);
		}

		void JustDied(Unit* /*victim*/)
		{
			// Runed Door opened
			if (instance)
				instance->SetData(DATA_RUNIC_DOOR, GO_STATE_ACTIVE);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case ACTION_DOSCHEDULE_RUNIC_SMASH:
				phase = PHASE_RUNIC_SMASH;
				events.ScheduleEvent(EVENT_RUNIC_SMASH, 10 * IN_MILLISECONDS, 0, PHASE_RUNIC_SMASH);
				break;
			default:
				break;
			}
		}

		void DoRunicSmash(bool side)
		{

			for (uint8 i = 0; i < 9; i++)
				if (Creature* bunny = me->SummonCreature(NPC_THORIM_GOLEM_RH_BUNNY, side ? 2236.0f : 2219.0f, i * 10 - 380.0f, 412.2f, 0, TEMPSUMMON_TIMED_DESPAWN, 5 * IN_MILLISECONDS))
					bunny->AI()->SetData(1, (i + 1) * 200);

			for (uint8 i = 0; i < 9; i++)
				if (Creature* bunny = me->SummonCreature(NPC_THORIM_GOLEM_LH_BUNNY, side ? 2246.0f : 2209.0f, i * 10 - 380.0f, 412.2f, 0, TEMPSUMMON_TIMED_DESPAWN, 5 * IN_MILLISECONDS))
					bunny->AI()->SetData(1, (i + 1) * 200);
		}

		void EnterCombat(Unit* /*who*/)
		{
			events.Reset();
			phase = PHASE_MELEE;
			events.ScheduleEvent(EVENT_BARRIER, urand(3 * IN_MILLISECONDS, 7 * IN_MILLISECONDS), 0, phase);
			events.ScheduleEvent(EVENT_SMASH, urand(15 * IN_MILLISECONDS, 18 * IN_MILLISECONDS), 0, phase);
			events.ScheduleEvent(EVENT_CHARGE, urand(14 * IN_MILLISECONDS, 19 * IN_MILLISECONDS), 0, phase);

			me->InterruptNonMeleeSpells(true);
		}

		void UpdateAI(uint32 diff)
		{
			if (phase == PHASE_IDLE || (!UpdateVictim() && phase != PHASE_RUNIC_SMASH))
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_BARRIER:
					Talk(EMOTE_BARRIER);
					DoCast(me, SPELL_RUNIC_BARRIER);
					events.ScheduleEvent(EVENT_BARRIER, urand(26 * IN_MILLISECONDS, 39 * IN_MILLISECONDS), PHASE_MELEE);
					return;
				case EVENT_SMASH:
					DoCast(me, SPELL_SMASH);
					events.ScheduleEvent(EVENT_SMASH, urand(15 * IN_MILLISECONDS, 18 * IN_MILLISECONDS), PHASE_MELEE);
					return;
				case EVENT_CHARGE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, -8.0f, true))
					{
						DoCast(target, SPELL_RUNIC_CHARGE);
						events.ScheduleEvent(EVENT_CHARGE, 20 * IN_MILLISECONDS, 0, PHASE_MELEE);
					}
					else
						events.ScheduleEvent(EVENT_CHARGE, 2 * IN_MILLISECONDS, 0, PHASE_MELEE);
					return;
				case EVENT_RUNIC_SMASH:

					if (instance->GetBossState(BOSS_THORIM) == IN_PROGRESS)
					{
						events.Reset();
						side = urand(0, 1);

						if (side == 0){
							DoCast(me, SPELL_RUNIC_SMASH_RIGHT);
						}
						else{
							DoCast(me, SPELL_RUNIC_SMASH_LEFT);
						}

					}

					events.ScheduleEvent(EVENT_SMASH_WAVE, 5.5*IN_MILLISECONDS, 0, PHASE_RUNIC_SMASH);
					events.ScheduleEvent(EVENT_RUNIC_SMASH, 8 * IN_MILLISECONDS, 0, PHASE_RUNIC_SMASH);
					return;
				case EVENT_SMASH_WAVE:
					if (instance->GetBossState(BOSS_THORIM) == IN_PROGRESS)
					{
						DoRunicSmash(side);
					}
					//if (!UpdateVictim())
					return;
				default:
					return;
				}
			}
			DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* instance;
		SummonList summons;
		EventMap events;
		Phases phase;

		bool side;
		uint32 BarrierTimer;
		uint32 SmashTimer;
		uint32 ChargeTimer;
		uint32 RunicSmashTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_runic_colossusAI>(creature);
	}
};

class npc_runic_smash : public CreatureScript
{
public:
	npc_runic_smash() : CreatureScript("npc_runic_smash") {}

	struct npc_runic_smashAI : public ScriptedAI
	{
		npc_runic_smashAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
			SetCombatMovement(false);
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		void Reset()
		{
			ExplodeTimer = 10 * IN_MILLISECONDS;
		}

		void SetData(uint32 /*type*/, uint32 data)
		{
			ExplodeTimer = data;
		}

		void UpdateAI(uint32 diff)
		{
			if (ExplodeTimer <= diff)
			{
				DoCastAOE(SPELL_RUNIC_SMASH, true);
				ExplodeTimer = 10 * IN_MILLISECONDS;
			}
			else ExplodeTimer -= diff;
		}

	private:
		uint32 ExplodeTimer;
	};


	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_runic_smashAI>(creature);
	}
};

/************************************************************************/
/* Rune Giant                                                           */
/************************************************************************/
SummonLocation giantAddLocations[] =
{
	{ { 2198.05f, -428.77f, 419.95f, 6.056f }, 32875 },
	{ { 2220.31f, -436.22f, 412.26f, 1.064f }, 32875 },
	{ { 2158.88f, -441.73f, 438.25f, 0.127f }, 32875 },
	{ { 2198.29f, -436.92f, 419.95f, 0.261f }, 33110 },
	{ { 2230.93f, -434.27f, 412.26f, 1.931f }, 33110 }
};

#define EMOTE_MIGHT                             "Ancient Rune Giant fortifies nearby allies with runic might!"

class npc_ancient_rune_giant : public CreatureScript
{
private:
	enum
	{
		EVENT_STOMP = 1,
		EVENT_DETONATION
	};

public:
	npc_ancient_rune_giant() : CreatureScript("npc_ancient_rune_giant") {}

	struct npc_ancient_rune_giantAI : public ScriptedAI
	{
		npc_ancient_rune_giantAI(Creature* creature) : ScriptedAI(creature), summons(me)
		{
			instance = creature->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
		}

		void Reset()
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			events.ScheduleEvent(EVENT_STOMP, urand(4 * IN_MILLISECONDS, 10 * IN_MILLISECONDS));
			events.ScheduleEvent(EVENT_DETONATION, 17 * IN_MILLISECONDS);
			me->RemoveAurasDueToSpell(SPELL_BERSERK_PHASE_1);

			me->GetMotionMaster()->MoveTargetedHome();

			// Stone Door closed
			if (instance)
				instance->SetData(DATA_STONE_DOOR, GO_STATE_READY);

			// Spawn trashes
			summons.DespawnAll();
			for (uint8 i = 0; i < 5; i++)
				me->SummonCreature(giantAddLocations[i].entry, giantAddLocations[i].pos.GetPositionX(), giantAddLocations[i].pos.GetPositionY(), giantAddLocations[i].pos.GetPositionZ(),
				giantAddLocations[i].pos.GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3 * IN_MILLISECONDS);
		}

		void JustSummoned(Creature *summon)
		{
			summons.Summon(summon);
		}

		void EnterCombat(Unit* /*who*/)
		{
			me->TextEmote(EMOTE_MIGHT, 0, true);
			me->CastSpell(me, SPELL_RUNIC_FORTIFICATION);
		}

		void JustDied(Unit* /*victim*/)
		{
			// Stone Door opened
			if (instance)
				instance->SetData(DATA_STONE_DOOR, GO_STATE_ACTIVE);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_STOMP:
					DoCast(SPELL_STOMP);
					events.RescheduleEvent(EVENT_STOMP, urand(18 * IN_MILLISECONDS, 26 * IN_MILLISECONDS));
					return;
				case EVENT_DETONATION:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
					{
						me->CastCustomSpell(SPELL_RUNE_DETONATION, SPELLVALUE_MAX_TARGETS, 1, target, false);
					}
					events.RescheduleEvent(EVENT_DETONATION, urand(15 * IN_MILLISECONDS, 22 * IN_MILLISECONDS));
					return;
				default:
					return;
				}
			}
			DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* instance;
		SummonList summons;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_ancient_rune_giantAI>(creature);
	}
};

const Position BlizzardSummonPos[3] =
{
	{ 2135.17f, -231.73f, 419.331f, 6.18f },
	{ 2162.17f, -275.1195f, 419.35f, 6.18f },
	{ 2113.14f, -288.79f, 419.35f, 6.18f },
};

const Position BlizzardMovementPos[3] =
{
	{ 2169.339f, -264.80f, 419.59f },
	{ 2113.44f, -288.39f, 419.59f },
	{ 2114.70f, -241.28f, 419.59f },
};

class npc_sif : public CreatureScript
{
private:
	enum
	{
		EVENT_FROSTBOLT = 1,
		EVENT_FROSTBOLT_VOLLEY,
		EVENT_BLIZZARD,
		EVENT_FROSTNOVA,
		EVENT_JUMP_DOWN
	};


	enum SifSpells
	{
		SPELL_FROSTBOLT_VOLLEY = 62580,
		SPELL_FROSTNOVA = 62597,
		SPELL_BLIZZARD = 62576,
		SPELL_FROSTBOLT = 62583
	};

public:
	npc_sif() : CreatureScript("npc_sif") {}

	struct npc_sifAI : public ScriptedAI
	{
		npc_sifAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetReactState(REACT_PASSIVE);
			pInstance = creature->GetInstanceScript();
		}

		void Reset()
		{
			if (pInstance)
				if (Creature* pThorim = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(BOSS_THORIM)))
					DoCast(pThorim, 64324);
		}

		void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_ACTIVATE_HARD_MODE:
				me->CastStop();
				me->SetInCombatWithZone();
				me->SetReactState(REACT_AGGRESSIVE);
				events.ScheduleEvent(EVENT_SIF_SAY_HARDMODE, 8 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_JUMP_DOWN, 24 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_FROSTBOLT, 2 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, 15 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_BLIZZARD, 28 * IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_FROSTNOVA, urand(18 * IN_MILLISECONDS, 23 * IN_MILLISECONDS));
				break;
			case ACTION_DESPAWN_SIF:

				Talk(2); // These pathetic mortals are harmless, beneath my station. Dispose of them!
				me->DespawnOrUnsummon(7000);
				break;
			default:
				break;
			}
		}

			void EnterCombat(Unit* /*who*/)
		{

		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SIF_SAY_HARDMODE:
					Talk(1);
					break;
				case EVENT_JUMP_DOWN:
					me->CastStop();
					me->StopMoving();
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
					me->GetMotionMaster()->MoveJump(2134.79f, -263.03f, 419.84f, 10.0f, 20.0f);
					break;
				case EVENT_FROSTBOLT:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 60.0f, true))
						DoCast(target, RAID_MODE(62583, 62601));

					events.ScheduleEvent(EVENT_FROSTBOLT, 4 * IN_MILLISECONDS);
					return;
				case EVENT_FROSTBOLT_VOLLEY:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
					{
						DoResetThreat();
						me->AddThreat(target, std::numeric_limits<float>::max());
						DoCast(target, RAID_MODE(62580, 62604), true);
						events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(11 * IN_MILLISECONDS, 18 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(1.5*IN_MILLISECONDS, 2 * IN_MILLISECONDS));
					return;
				case EVENT_BLIZZARD:
				{
					uint8 pos = urand(0, 2);

					if (Creature* blizzard = me->SummonCreature(32892, BlizzardSummonPos[pos], TEMPSUMMON_TIMED_DESPAWN, 20 * IN_MILLISECONDS))
					{
						blizzard->SetWalk(true);
						//blizzard->SetSpeed(MOVE_WALK, 1.0f);
						blizzard->AI()->DoCast(blizzard, RAID_MODE(62577, 62603));
						blizzard->GetMotionMaster()->MovePoint(0, BlizzardMovementPos[pos]);
					}

					events.ScheduleEvent(EVENT_BLIZZARD, 40 * IN_MILLISECONDS);
					return;
				}
				case EVENT_FROSTNOVA:
					DoCastAOE(RAID_MODE(62597, 62605), true);
					events.ScheduleEvent(EVENT_FROSTNOVA, urand(18 * IN_MILLISECONDS, 23 * IN_MILLISECONDS));
					return;
				default:
					return;
				}
			}
		}

	private:
		EventMap events;
		InstanceScript* pInstance;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetUlduarAI<npc_sifAI>(creature);
	}
};

class npc_lightning_orb : public CreatureScript
{
public:
	npc_lightning_orb() : CreatureScript("npc_lightning_orb") { }

	struct npc_lightning_orbAI : public ScriptedAI
	{
		npc_lightning_orbAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			me->GetMotionMaster()->MovePath(NPC_LIGHTNING_ORB, false);
		}

		void UpdateAI(uint32 /*diff*/) {}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lightning_orbAI(creature);
	}
};

class spell_stormhammer_targeting : public SpellScriptLoader
{
public:
	spell_stormhammer_targeting() : SpellScriptLoader("spell_stormhammer_targeting") {}

	class spell_stormhammer_targeting_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_stormhammer_targeting_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			_target = NULL;
			targets.remove_if(ArenaAreaCheck(false));

			if (targets.empty())
				return;

			_target = Trinity::Containers::SelectRandomContainerElement(targets);
			SetTarget(targets);
		}

		void SetTarget(std::list<WorldObject*>& targets)
		{
			targets.clear();

			if (_target)
				targets.push_back(_target);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_stormhammer_targeting_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_stormhammer_targeting_SpellScript::SetTarget, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_stormhammer_targeting_SpellScript::SetTarget, EFFECT_2, TARGET_UNIT_SRC_AREA_ENEMY);
		}

	private:
		WorldObject* _target;
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_stormhammer_targeting_SpellScript();
	}
};

class spell_thorim_charge_orb_targeting : public SpellScriptLoader
{
public:
	spell_thorim_charge_orb_targeting() : SpellScriptLoader("spell_thorim_charge_orb_targeting") {}

	class spell_thorim_charge_orb_targeting_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_thorim_charge_orb_targeting_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			_target = NULL;

			if (targets.empty())
				return;

			// Charge Orb should be cast always only on 1 orb
			_target = Trinity::Containers::SelectRandomContainerElement(targets);
			SetTarget(targets);
		}

		void SetTarget(std::list<WorldObject*>& targets)
		{
			targets.clear();

			if (_target)
				targets.push_back(_target);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_charge_orb_targeting_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_charge_orb_targeting_SpellScript::SetTarget, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
		}

	private:
		WorldObject* _target;
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_thorim_charge_orb_targeting_SpellScript();
	}
};

class spell_thorim_berserk : public SpellScriptLoader
{
public:
	spell_thorim_berserk() : SpellScriptLoader("spell_thorim_berserk") {}

	class spell_thorim_berserk_SpellScript : public SpellScript
	{
		/* HACER UN VALID, COMO EN THADDIUS DE UNIT PLAYER*/

		PrepareSpellScript(spell_thorim_berserk_SpellScript);


		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(BerserkSelector());
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_berserk_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
		}

	private:
		WorldObject* _target;
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_thorim_berserk_SpellScript();
	}
};



class spell_thorim_lightning_destruction : public SpellScriptLoader
{
public:
	spell_thorim_lightning_destruction() : SpellScriptLoader("spell_thorim_lightning_destruction") {}

	class spell_thorim_lightning_destruction_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_thorim_lightning_destruction_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(ArenaAreaCheck(true));
			targets.remove_if(PlayerOrPetCheck());
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_lightning_destruction_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_thorim_lightning_destruction_SpellScript();
	}
};


//

class spell_thorim_runic_fortification : public SpellScriptLoader
{
public:
	spell_thorim_runic_fortification() : SpellScriptLoader("spell_thorim_runic_fortification") { }

	class spell_thorim_runic_fortification_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_thorim_runic_fortification_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(NoPlayerOrPetCheck());
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_runic_fortification_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_runic_fortification_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thorim_runic_fortification_SpellScript::FilterTargets, EFFECT_2, TARGET_UNIT_SRC_AREA_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_thorim_runic_fortification_SpellScript();
	}
};



class spell_thorim_impale : public SpellScriptLoader
{
public:
	spell_thorim_impale() : SpellScriptLoader("spell_thorim_impale") { }

	class spell_thorim_impale_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_thorim_impale_AuraScript);

		void OnPeriodic(AuraEffect const* aurEff)
		{
			if (GetTarget()->GetHealthPct() >= 90)
			{
				if (GetTarget()->GetMap()->Is25ManRaid())
					GetTarget()->RemoveAura(SPELL_IMPALE_25);
				else
					GetTarget()->RemoveAura(SPELL_IMPALE_10);
			}
		}
		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_thorim_impale_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_thorim_impale_AuraScript();
	}
};

class go_thorim_lever : public GameObjectScript
{
public:
	go_thorim_lever() : GameObjectScript("go_thorim_lever") {}

	bool OnGossipHello(Player* /*pPlayer*/, GameObject* pGo)
	{
		if (GameObject* door = pGo->FindNearestGameObject(GO_DARK_IRON_PORTCULLIS, 15.f))
		{
			door->UseDoorOrButton();
			pGo->UseDoorOrButton();
			return true;
		}
		return false;
	}
};

enum OrbEvents
{
	EVENT_CHECK_IF_CHARGED = 1
};

class npc_thunder_orb : public CreatureScript
{
public:
	npc_thunder_orb() : CreatureScript("npc_thunder_orb") { }

	struct npc_thunder_orbAI : public ScriptedAI
	{
		npc_thunder_orbAI(Creature* creature) : ScriptedAI(creature),
			_instance(creature->GetInstanceScript())
		{
			events.ScheduleEvent(EVENT_CHECK_IF_CHARGED, 1000);
		}


		void UpdateAI(uint32 diff) override
		{

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{

				case EVENT_CHECK_IF_CHARGED:

					if (Creature* orb = me->FindNearestCreature(33378, 10.0f, true))
					{
						if (orb->HasAura(62016))
						{
							DoCast(62017);
						}
					}
					events.RescheduleEvent(EVENT_CHECK_IF_CHARGED, 1000);
					break;
				default:
					break;
				}
			}

		}

	private:
		InstanceScript* const _instance;
		Map* map;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_thunder_orbAI>(creature);
	}
};


void AddSC_boss_thorim()
{
	new boss_thorim();
	new npc_thorim_controller();
	new npc_thorim_pre_phase_add();
	new npc_thorim_arena_phase_add();
	new npc_runic_colossus();
	new npc_runic_smash();
	new npc_ancient_rune_giant();
	new npc_sif();
	new npc_lightning_orb();
	new npc_thunder_orb();

	new spell_stormhammer_targeting();
	new spell_thorim_berserk();
	new spell_thorim_charge_orb_targeting();
	new spell_thorim_lightning_destruction();
	new spell_thorim_runic_fortification();

	new go_thorim_lever();

	new spell_thorim_impale();
}
