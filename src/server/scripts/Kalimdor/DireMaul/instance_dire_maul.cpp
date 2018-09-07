/*
* Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
* Copyright (C) 2010-2014 Rising Gods <http://www.rising-gods.de/>
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

#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ObjectDefines.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "InstanceScript.h"
#include "ScriptedCreature.h"

uint32 const EncounterCount = 10;

enum GoDataTypes
{
	DATA_CRYSTAL_GENERATOR_1 = 0,
	DATA_CRYSTAL_GENERATOR_2 = 1,
	DATA_CRYSTAL_GENERATOR_3 = 2,
	DATA_CRYSTAL_GENERATOR_4 = 3,
	DATA_CRYSTAL_GENERATOR_5 = 4,
	DATA_FORCE_FIELD = 5,
	DATA_CRYSTAL_ACTIVATED = 6,
	DATA_TENDRIS_WARPWOOD = 7
};

enum Events
{
	EVENT_START_GO_SEARCH = 0,
	EVENT_GO_SEARCH = 1
};

enum DireMaulMiscs
{
	MAX_ENCOUNTER = 10,

	// East
	TYPE_ALZZIN = 0, // Do not change - Handled with Acid
	TYPE_ZEVRIM = 1,
	TYPE_IRONBARK = 2,

	// West
	TYPE_WARPWOOD = 3,
	TYPE_IMMOLTHAR = 4,
	TYPE_PRINCE = 5,

	// North
	TYPE_KING_GORDOK = 7,
	TYPE_MOLDAR = 8,
	TYPE_FENGUS = 9,
	TYPE_SLIPKIK = 10,
	TYPE_KROMCRUSH = 11,

	// East
	GO_CRUMBLE_WALL = 177220,
	GO_CORRUPT_VINE = 179502,
	GO_FELVINE_SHARD = 179559,
	GO_CONSERVATORY_DOOR = 176907, // Opened by Ironbark the redeemed
	NPC_ZEVRIM_THORNHOOF = 11490,
	NPC_OLD_IRONBARK = 11491,
	NPC_IRONBARK_REDEEMED = 14241,

	// West
	NPC_WARPWOOD_STOMPER = 11465,
	NPC_PETRIFIED_TREANT = 11458,
	NPC_PETRIFIED_GUARDIEN = 14303,
	NPC_WARPWOOD_TREANT = 11462,
	NPC_WARPWOOD_TANGLER = 11464,
	NPC_WARPWOOD_CRUSHER = 13021,
	NPC_WARPWOOD_GUARD = 11459,
	NPC_STONED_GUARD = 14303,
	NPC_TENDRIS_WARPWOOD = 11489,
	NPC_HORSE = 14566,
	NPC_PRINCE_TORTHELDRIN = 11486,
	NPC_IMMOLTHAR = 11496,
	NPC_ARCANE_ABERRATION = 11480,
	NPC_MANA_REMNANT = 11483,
	NPC_HIGHBORNE_SUMMONER = 11466,
	GO_PRINCES_CHEST = 179545,
	GO_PRINCES_CHEST_AURA = 179563,
	GO_CRYSTAL_GENERATOR_1 = 177259,
	GO_CRYSTAL_GENERATOR_2 = 177257,
	GO_CRYSTAL_GENERATOR_3 = 177258,
	GO_CRYSTAL_GENERATOR_4 = 179504,
	GO_CRYSTAL_GENERATOR_5 = 179505,
	GO_FORCEFIELD = 179503,
	GO_WARPWOOD_DOOR = 177221,
	GO_WEST_LIBRARY_DOOR = 179550,

	// North
	NPC_GUARD_MOLDAR = 14326,
	NPC_STOMPER_KREEG = 14322,
	NPC_GUARD_FENGUS = 14321,
	NPC_GUARD_SLIPKIK = 14323,
	NPC_CAPTAIN_KROMCRUSH = 14325,
	NPC_CHORUSH = 14324,
	NPC_KING_GORDOK = 11501,
	NPC_MIZZLE_THE_CRAFTY = 14353,
	GO_KNOTS_CACHE = 179501,
	GO_KNOTS_BALL_AND_CHAIN = 179511,
	GO_GORDOK_TRIBUTE = 179564,
	GO_NORTH_LIBRARY_DOOR = 179549,
	SAY_FREE_IMMOLTHAR = 0,
	SAY_KILL_IMMOLTHAR = 1,
	SAY_IRONBARK_REDEEM = 2,
	SPELL_KING_OF_GORDOK = 22799,
	NPC_GORDOK_MAULER = 11442,
	NPC_GORDOK_CAPTAIN = 11445,
	NPC_GORDOK_SPIRIT = 11446,
	NPC_GORDOK_WARLOCK = 11448,
	NPC_GORDOK_REAVER = 11450,
	NPC_GORDOK_KROMCRUSH = 14325,
	NPC_GORDOK_BUSHWACKER = 14351,
	NPC_GORDOK_BRUTE = 11441,
	NPC_GORDOK_MAGE = 11444,
	NPC_WARLOCK_GUARD = 14385
};

class instance_dire_maul : public InstanceMapScript
{
public:
	instance_dire_maul() : InstanceMapScript("instance_dire_maul", 429) { }

	struct instance_dire_maul_InstanceMapScript : public InstanceScript
	{
		instance_dire_maul_InstanceMapScript(Map* map) : InstanceScript(map)
		{
			/*go_forcefield = 0;
			go_warpwood_door = 0;*/
		}

		void Initialize()
		{
			ForcefieldCounter = 0;
			_events.ScheduleEvent(EVENT_GO_SEARCH, 2 * IN_MILLISECONDS);
		}

		void OnGameObjectCreate(GameObject* go) override
		{
			switch (go->GetEntry())
			{
			case GO_FORCEFIELD:
				go_forcefield = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_ACTIVATED) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_CRYSTAL_GENERATOR_1:
				go_generators[0] = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_GENERATOR_1) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_CRYSTAL_GENERATOR_2:
				go_generators[1] = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_GENERATOR_2) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_CRYSTAL_GENERATOR_3:
				go_generators[2] = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_GENERATOR_3) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_CRYSTAL_GENERATOR_4:
				go_generators[3] = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_GENERATOR_4) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_CRYSTAL_GENERATOR_5:
				go_generators[4] = go->GetGUID();
				if (GetBossState(DATA_CRYSTAL_GENERATOR_5) == DONE)
					go->UseDoorOrButton();
				break;
			case GO_WARPWOOD_DOOR:
				go_warpwood_door = go->GetGUID();
				if (GetBossState(DATA_TENDRIS_WARPWOOD) == DONE)
					go->UseDoorOrButton();
				break;
			default:
				break;
			}
		}

			bool SetBossState(uint32 type, EncounterState state) override
		{
			if (!InstanceScript::SetBossState(type, state))
			return false;

			switch (type)
			{
			case DATA_CRYSTAL_ACTIVATED:
			case DATA_TENDRIS_WARPWOOD:
				break;
			default:
				break;
			}
			return true;
		}

			ObjectGuid GetGuidData(uint32 type) const override
		{
			switch (type)
			{
			case GO_FORCEFIELD:
				return go_forcefield;
				break;
			case GO_CRYSTAL_GENERATOR_1:
				return go_generators[0];
				break;
			case GO_CRYSTAL_GENERATOR_2:
				return go_generators[1];
				break;
			case GO_CRYSTAL_GENERATOR_3:
				return go_generators[2];
				break;
			case GO_CRYSTAL_GENERATOR_4:
				return go_generators[3];
				break;
			case GO_CRYSTAL_GENERATOR_5:
				return go_generators[4];
				break;
			case GO_WARPWOOD_DOOR:
				return go_warpwood_door;
				break;
			}
			return ObjectGuid::Empty;
		}

			void Update(uint32 diff)
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_GO_SEARCH:
					Dragonspireroomcheck();
					_events.ScheduleEvent(EVENT_GO_SEARCH, 2 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}

		void OnPlayerRemove(Player* player)
		{
			player->RemoveAurasDueToSpell(SPELL_KING_OF_GORDOK);
		}

		void Dragonspireroomcheck()
		{
			GameObject* rune = NULL;

			for (uint8 i = 0; i < 5; ++i)
			{
				rune = instance->GetGameObject(go_generators[i]);
				if (!rune)
					continue;

				if (!rune->FindNearestCreature(NPC_ARCANE_ABERRATION, 80.0f) && rune->GetGoState() == GO_STATE_READY)
				{
					rune->UseDoorOrButton();

					switch (rune->GetEntry())
					{
					case GO_CRYSTAL_GENERATOR_1:
						SetBossState(DATA_CRYSTAL_GENERATOR_1, DONE);
						++ForcefieldCounter;
						break;
					case GO_CRYSTAL_GENERATOR_2:
						SetBossState(DATA_CRYSTAL_GENERATOR_2, DONE);
						++ForcefieldCounter;
						break;
					case GO_CRYSTAL_GENERATOR_3:
						SetBossState(DATA_CRYSTAL_GENERATOR_3, DONE);
						++ForcefieldCounter;
						break;
					case GO_CRYSTAL_GENERATOR_4:
						SetBossState(DATA_CRYSTAL_GENERATOR_4, DONE);
						++ForcefieldCounter;
						break;
					case GO_CRYSTAL_GENERATOR_5:
						SetBossState(DATA_CRYSTAL_GENERATOR_5, DONE);
						++ForcefieldCounter;
						break;
					default:
						break;
					}
				}
			}

			if (ForcefieldCounter == 5)
			{
				if (GameObject* forcefield = instance->GetGameObject(go_forcefield))
					forcefield->UseDoorOrButton();
				SetBossState(DATA_CRYSTAL_ACTIVATED, DONE);
			}
		}

	protected:
		EventMap _events;
		ObjectGuid go_forcefield;
		ObjectGuid go_warpwood_door;
		ObjectGuid go_generators[5];
		uint8 ForcefieldCounter;
	};

	InstanceScript* GetInstanceScript(InstanceMap* map) const override
	{
		return new instance_dire_maul_InstanceMapScript(map);
	}
};

void AddSC_instance_dire_maul()
{
	new instance_dire_maul();
}