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

/* ScriptData
SDName: Instance Trial of the Champion
SDComment:
SDCategory: Trial Of the Champion
EndScriptData */


#include "trial_of_the_champion.h"
#include "Player.h"

#define MAX_ENCOUNTER  4

class instance_trial_of_the_champion : public InstanceMapScript
{
public:
	instance_trial_of_the_champion() : InstanceMapScript("instance_trial_of_the_champion", 650) { }

	InstanceScript* GetInstanceScript(InstanceMap* pMap) const
	{
		return new instance_trial_of_the_champion_InstanceMapScript(pMap);
	}

	struct instance_trial_of_the_champion_InstanceMapScript : public InstanceScript
	{
		instance_trial_of_the_champion_InstanceMapScript(Map* pMap) : InstanceScript(pMap) {}

		uint32 m_auiEncounter[MAX_ENCOUNTER];
		uint32 TeamInInstance;

		uint16 uiMovementDone;
		uint16 uiGrandChampionsDeaths;
		uint8 uiArgentSoldierDeaths;
		uint8 uiAgroDone;
		uint8 uiAggroDone;

		ObjectGuid uiAnnouncerGUID;
		ObjectGuid uiHighlordGUID;
		ObjectGuid uiMainGateGUID;
		ObjectGuid uiMainGate1GUID;
		ObjectGuid uiGrandChampionVehicle1GUID;
		ObjectGuid uiGrandChampionVehicle2GUID;
		ObjectGuid uiGrandChampionVehicle3GUID;
		ObjectGuid uiGrandChampion1GUID;
		ObjectGuid uiGrandChampion2GUID;
		ObjectGuid uiGrandChampion3GUID;
		ObjectGuid uiChampionLootGUID;
		ObjectGuid uiArgentChampionGUID;

		//Bosses:

		// Horde
		ObjectGuid zultoreGUID;
		ObjectGuid mokraGUID;
		ObjectGuid runokGUID;
		ObjectGuid eresseaGUID;
		ObjectGuid deathstalkerGUID;

		//Alliance

		ObjectGuid marshalJacobGUID;
		ObjectGuid ambroseGUID;
		ObjectGuid colososGUID;
		ObjectGuid evensongGUID;
		ObjectGuid lanaGUID;

		std::list<ObjectGuid> VehicleList;

		std::string str_data;

		bool bDone;
		bool grandChampionsStarted;

		//
		void Initialize()
		{
			uiMovementDone = 0;
			uiGrandChampionsDeaths = 0;
			uiArgentSoldierDeaths = 0;
			TeamInInstance = 0;

			/*uiAnnouncerGUID = 0;
			uiHighlordGUID = 0;
			uiMainGateGUID = 0;
			uiMainGate1GUID = 0;
			uiGrandChampionVehicle1GUID = 0;
			uiGrandChampionVehicle2GUID = 0;
			uiGrandChampionVehicle3GUID = 0;
			uiGrandChampion1GUID = 0;
			uiGrandChampion2GUID = 0;
			uiGrandChampion3GUID = 0;
			uiChampionLootGUID = 0;
			uiArgentChampionGUID = 0;*/

			bDone = false;
			grandChampionsStarted = false;
			VehicleList.clear();

			memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
		}

		bool IsEncounterInProgress() const
		{
			for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
			{
				if (m_auiEncounter[i] == IN_PROGRESS)
					return true;
			}

			return false;
		}

		void OnCreatureCreate(Creature* creature)
		{
			Map::PlayerList const &players = instance->GetPlayers();

			if (!players.isEmpty())
			{
				if (Player* player = players.begin()->GetSource())
					TeamInInstance = player->GetTeam();
			}

			switch (creature->GetEntry())
			{
				// Gran Champions
			case NPC_JACOB:
				marshalJacobGUID = creature->GetGUID();
				break;
			case NPC_AMBROSE:
				ambroseGUID = creature->GetGUID();
				break;
			case NPC_COLOSOS:
				colososGUID = creature->GetGUID();
				break;
			case NPC_JAELYNE:
				evensongGUID = creature->GetGUID();
				break;
			case NPC_LANA:
				lanaGUID = creature->GetGUID();
				break;
			case VEHICLE_MOKRA_SKILLCRUSHER_MOUNT:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_MARSHAL_JACOB_ALERIUS_MOUNT);
				break;
			case NPC_MOKRA:
				if (TeamInInstance == HORDE)
				{
					creature->UpdateEntry(NPC_JACOB); // GUID JACOB
					marshalJacobGUID = creature->GetGUID();
				}					
				else
					mokraGUID = creature->GetGUID();
				break;
			case VEHICLE_ERESSEA_DAWNSINGER_MOUNT:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_AMBROSE_BOLTSPARK_MOUNT);
				break;
			case NPC_ERESSEA:
				if (TeamInInstance == HORDE)
				{
					creature->UpdateEntry(NPC_AMBROSE); // GUID AMBROSE
					ambroseGUID = creature->GetGUID();
				}					
				else
					eresseaGUID = creature->GetGUID();
				break;
			case VEHICLE_RUNOK_WILDMANE_MOUNT:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_COLOSOS_MOUNT);
				break;
			case NPC_RUNOK:
				if (TeamInInstance == HORDE)
				{
					creature->UpdateEntry(NPC_COLOSOS); // guid colosos
					colososGUID = creature->GetGUID();
				}					
				else
					runokGUID = creature->GetGUID();
				break;
			case VEHICLE_ZUL_TORE_MOUNT:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_EVENSONG_MOUNT);
				break;
			case NPC_ZULTORE:
				if (TeamInInstance == HORDE)
				{
					creature->UpdateEntry(NPC_JAELYNE); // GUID DE jaelyne
					evensongGUID = creature->GetGUID();
				}					
				else
					zultoreGUID = creature->GetGUID();
				break;
			case VEHICLE_DEATHSTALKER_VESCERI_MOUNT:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_LANA_STOUTHAMMER_MOUNT);
				break;
			case NPC_VISCERI:
				if (TeamInInstance == HORDE)
				{
					creature->UpdateEntry(NPC_LANA); // GUID LANA STOUTHAMMER.				
					lanaGUID = creature->GetGUID();
				}					
				else
					deathstalkerGUID = creature->GetGUID();
				break;
				// Faction champions vehicles
			case VEHICLE_FORSAKE_WARHORSE:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_IRONFORGE_RAM);
				break;
			case VEHICLE_THUNDER_BLUFF_KODO:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_EXODAR_ELEKK);
				break;
			case VEHICLE_ORGRIMMAR_WOLF:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_STORMWIND_STEED);
				break;
			case VEHICLE_SILVERMOON_HAWKSTRIDER:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_GNOMEREGAN_MECHANOSTRIDER);
				break;
			case VEHICLE_DARKSPEAR_RAPTOR:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(VEHICLE_DARNASSIA_NIGHTSABER);
				break;
				// Faction champios
			case NPC_ORGRIMAR_CHAMPION:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_STORMWIND_CHAMPION);
				break;
			case NPC_SILVERMOON_CHAMPION:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_GNOMERAGN_CHAMPION);
				break;
			case NPC_THUNDER_CHAMPION:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_EXODAR_CHAMPION);
				break;
			case NPC_TROLL_CHAMPION:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_DRNASSUS_CHAMPION);
				break;
			case NPC_UNDERCITY_CHAMPION:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_IRONFORGE_CHAMPION);
				break;

				// Coliseum Announcer || Just NPC_JAEREN must be spawned.
			case NPC_HIGHLORD:
				uiHighlordGUID = creature->GetGUID();
				break;
			case NPC_JAEREN:
				if (TeamInInstance == ALLIANCE)
					creature->UpdateEntry(NPC_ARELAS);
				uiAnnouncerGUID = creature->GetGUID();
				break;
			case NPC_JAEREN_AN:
				if (TeamInInstance == ALLIANCE)
					creature->UpdateEntry(NPC_ARELAS_AN);
				break;
			case VEHICLE_ARGENT_WARHORSE:
			case VEHICLE_ARGENT_BATTLEWORG:
				VehicleList.push_back(creature->GetGUID());
				break;
			case NPC_EADRIC:
			case NPC_PALETRESS:
				uiArgentChampionGUID = creature->GetGUID();
				break;
			case 34970:
			case 34868: 
			case 34974: 
			case 34975: 
			case 34966:
			case 34977:
			case 34871:
			case 34856:
			case 34870:
			case 34869:
			case 34979:
			case 34859:
			case 34861:
			case 34860:
			case 34857:
			case 34858:
				creature->SetObjectScale(2.0f);
				break;
			}
		}

		void OnGameObjectCreate(GameObject* go)
		{
			switch (go->GetEntry())
			{
			case GO_MAIN_GATE:
				uiMainGateGUID = go->GetGUID();
				break;
			case GO_MAIN_GATE1:
				uiMainGate1GUID = go->GetGUID();
				break;
			case GO_CHAMPIONS_LOOT:
			case GO_CHAMPIONS_LOOT_H:
				uiChampionLootGUID = go->GetGUID();
				break;
			}
		}

		void SetData(uint32 uiType, uint32 uiData)
		{
			switch (uiType)
			{
			case DATA_GRAND_CHAMPIONS_STARTED:
				grandChampionsStarted = true;
				break;
			case DATA_RESET_GRANDCHAMPIONS_DEATHS:
				uiGrandChampionsDeaths = 0;
				break;
			case DATA_PHASE1_GRANDCHAMPIONS_DONE:
				//Getcreature announcer and setdata DATA_PHASE1_GRANDCHAMPIONS_DONE
				if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
					pAnnouncer->AI()->SetData(DATA_PHASE1_GRANDCHAMPIONS_DONE, 0);
				break;
			case DATA_RESET_INTRO_EVENT:
				uiMovementDone = 0;
				uiGrandChampionsDeaths = 0;
				bDone = false;

				VehicleList.clear();
				break;
			case DATA_MOVEMENT_DONE:
				uiMovementDone = uiData;
				if (uiMovementDone == 3)
				{
					if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
						pAnnouncer->AI()->SetData(DATA_IN_POSITION, 0);
				}
				break;
			case BOSS_GRAND_CHAMPIONS:
				m_auiEncounter[0] = uiData;
				if (uiData == IN_PROGRESS)
				{
					for (std::list<ObjectGuid>::const_iterator itr = VehicleList.begin(); itr != VehicleList.end(); ++itr)
						if (Creature* summon = instance->GetCreature(*itr))
							summon->RemoveFromWorld();
				}
				else if (uiData == DONE)
				{
					++uiGrandChampionsDeaths;
					// phase true
					if (uiGrandChampionsDeaths == 1)
						if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
						{
							pAnnouncer->AI()->SetData(DATA_WIPE_CONTROL_CHAMPIONS_LAST_PHASE, 0);
						}
					if (uiGrandChampionsDeaths == 3)
					{

						// GRITO DE ESPECTADORES y cohetes.

						// TYRION, PRESENTACION DEL SIGUIENTE COMBATE
						//HACER UN DATA SPEAKER

						if (Creature* ch1 = instance->GetCreature(GetGuidData(DATA_GRAND_CHAMPION_1)))
						{
							ch1->RemoveStandFlags(UNIT_STAND_STATE_KNEEL);
							ch1->SetWalk(true);
							ch1->GetMotionMaster()->MovePoint(1, 746.843f, 695.68f, 412.339f);
							ch1->DespawnOrUnsummon(15000);
						}

						if (Creature* ch2 = instance->GetCreature(GetGuidData(DATA_GRAND_CHAMPION_2)))
						{
							ch2->RemoveStandFlags(UNIT_STAND_STATE_KNEEL);
							ch2->SetWalk(true);
							ch2->GetMotionMaster()->MovePoint(1, 746.843f, 695.68f, 412.339f);
							ch2->DespawnOrUnsummon(15000);
						}


						if (Creature* ch3 = instance->GetCreature(GetGuidData(DATA_GRAND_CHAMPION_3)))
						{
							ch3->RemoveStandFlags(UNIT_STAND_STATE_KNEEL);
							ch3->SetWalk(true);
							ch3->GetMotionMaster()->MovePoint(1, 746.843f, 695.68f, 412.339f);
							ch3->DespawnOrUnsummon(15000);
						}

						// phase false
						if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
						{

							if (Creature* speaker = pAnnouncer->FindNearestCreature(381535, 100.0f))
							{								
								speaker->AI()->DoCast(66400);
								speaker->AI()->DoCast(66402);
							}
							if (Creature* highlord = pAnnouncer->FindNearestCreature(NPC_HIGHLORD, 200.0f))
							{								
								highlord->AI()->Talk(19);
							}
							pAnnouncer->SetVisible(true);
							pAnnouncer->AI()->SetData(DATA_RESET, 0);
							m_auiEncounter[0] = uiData;
							pAnnouncer->GetMotionMaster()->MovePoint(0, 748.309f, 619.487f, 411.171f);
							pAnnouncer->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
							pAnnouncer->SummonGameObject(instance->IsHeroic() ? GO_CHAMPIONS_LOOT_H : GO_CHAMPIONS_LOOT, 746.59f, 618.49f, 411.09f, 1.42f, 0, 0, 0, 0, 90000000);

							if (GameObject* pGO = instance->GetGameObject(GetGuidData(DATA_MAIN_GATE1)))
								HandleGameObject(pGO->GetGUID(), true);
						}

						// Remove Combat?
						SetBossState(BOSS_GRAND_CHAMPIONS, DONE); // HACERLES UN DESPAWN.
					}
				}
				break;
			case DATA_ARGENT_SOLDIER_DEFEATED:
				uiArgentSoldierDeaths = uiData;
				if (uiArgentSoldierDeaths == 9)
				{
					if (Creature* pBoss = instance->GetCreature(uiArgentChampionGUID))
					{
						pBoss->GetMotionMaster()->MovePoint(0, 746.88f, 618.74f, 411.06f);
						pBoss->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						pBoss->SetReactState(REACT_AGGRESSIVE);
						pBoss->setFaction(16);
					}
				}
				break;
			case BOSS_ARGENT_CHALLENGE_E:
				m_auiEncounter[1] = uiData;
				if (uiData == IN_PROGRESS)
				{
					for (std::list<ObjectGuid>::const_iterator itr = VehicleList.begin(); itr != VehicleList.end(); ++itr)
						if (Creature* pSummon = instance->GetCreature(*itr))
							pSummon->RemoveFromWorld();
				}
				else if (uiData == DONE)
				{
					if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
					{
						pAnnouncer->SetVisible(true);
						pAnnouncer->GetMotionMaster()->MovePoint(0, 748.309f, 619.487f, 411.171f);
						pAnnouncer->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						pAnnouncer->SummonGameObject(instance->IsHeroic() ? GO_EADRIC_LOOT_H : GO_EADRIC_LOOT, 746.59f, 618.49f, 411.09f, 1.42f, 0, 0, 0, 0, 90000000);
					}
				}
				break;
			case DATA_AGGRO_DONE:
				uiAgroDone = uiData;
				if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
				{
					pAnnouncer->SetVisible(false);
				}
				break;
			case DATA_AGRO_DONE:
				uiAggroDone = uiData;
				if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
				{
					pAnnouncer->SetVisible(false);
				}
				break;
			case BOSS_ARGENT_CHALLENGE_P:
				m_auiEncounter[2] = uiData;
				if (uiData == IN_PROGRESS)
				{
					for (std::list<ObjectGuid>::const_iterator itr = VehicleList.begin(); itr != VehicleList.end(); ++itr)
						if (Creature* pSummon = instance->GetCreature(*itr))
							pSummon->RemoveFromWorld();
				}
				else if (uiData == DONE)
				{
					if (Creature* pAnnouncer = instance->GetCreature(uiAnnouncerGUID))
					{
						pAnnouncer->SetVisible(true);
						pAnnouncer->GetMotionMaster()->MovePoint(0, 748.309f, 619.487f, 411.171f);
						pAnnouncer->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						pAnnouncer->SummonGameObject(instance->IsHeroic() ? GO_PALETRESS_LOOT_H : GO_PALETRESS_LOOT, 746.59f, 618.49f, 411.09f, 1.42f, 0, 0, 0, 0, 90000000);
					}
				}
				break;
			}

			if (uiData == DONE)
				SaveToDB();
		}

		uint32 GetData(uint32 uiData) const
		{
			switch (uiData)
			{
			case DATA_GRAND_CHAMPIONS_STARTED:

				break;
			case DATA_CHAMPIONS_DEATHS:
				return uiGrandChampionsDeaths;
			case BOSS_GRAND_CHAMPIONS:  return m_auiEncounter[0];
			case BOSS_ARGENT_CHALLENGE_E: return m_auiEncounter[1];
			case BOSS_ARGENT_CHALLENGE_P: return m_auiEncounter[2];
			case BOSS_BLACK_KNIGHT: return m_auiEncounter[3];

			case DATA_MOVEMENT_DONE: return uiMovementDone;
			case DATA_ARGENT_SOLDIER_DEFEATED: return uiArgentSoldierDeaths;
			case DATA_TEAM_IN_INSTANCE: return TeamInInstance;
			}

			return 0;
		}

		ObjectGuid GetGuidData(uint32 uiData) const override
		{
			switch (uiData)
			{
			case DATA_ARGENT_CHAMPION:
				return uiArgentChampionGUID;
			case DATA_ANNOUNCER: return uiAnnouncerGUID;
			case DATA_HIGHLORD:  return uiHighlordGUID;
			case DATA_MAIN_GATE: return uiMainGateGUID;
			case DATA_MAIN_GATE1: return uiMainGate1GUID;
			case DATA_GRAND_CHAMPION_VEHICLE_1:
			case DATA_GRAND_CHAMPION_VEHICLE_2:
			case DATA_GRAND_CHAMPION_VEHICLE_3:
				break;
			case DATA_GRAND_CHAMPION_1: return uiGrandChampion1GUID;
			case DATA_GRAND_CHAMPION_2: return uiGrandChampion2GUID;
			case DATA_GRAND_CHAMPION_3: return uiGrandChampion3GUID;
				//
			case DATA_ZUL_TORE:
				return zultoreGUID;
			case DATA_RUNOK:
				return runokGUID;
			case DATA_MOKRA:
				return mokraGUID;
			case DATA_ERESSEA:
				return eresseaGUID;
			case DATA_DEATHSTALKER_VISCERI:
				return deathstalkerGUID;
			case DATA_MARSHAL_JACOB:
				return marshalJacobGUID;
			case DATA_AMBROSE:
				return ambroseGUID;
			case DATA_COLOSOS:
				return colososGUID;
			case DATA_EVENSONG:
				return evensongGUID;
			case DATA_LANA:
				return lanaGUID;
			}

			return ObjectGuid::Empty;
		}

		void SetGuidData(uint32 uiType, ObjectGuid uiData) override
		{
			switch (uiType)
			{
			case DATA_GRAND_CHAMPION_1:
				uiGrandChampion1GUID = uiData;
				break;
			case DATA_GRAND_CHAMPION_2:
				uiGrandChampion2GUID = uiData;
				break;
			case DATA_GRAND_CHAMPION_3:
				uiGrandChampion3GUID = uiData;
				break;
			}
		}

		std::string GetSaveData()
		{
			OUT_SAVE_INST_DATA;

			std::ostringstream saveStream;

			saveStream << "T C " << m_auiEncounter[0]
				<< " " << m_auiEncounter[1]
				<< " " << m_auiEncounter[2]
				<< " " << m_auiEncounter[3];

			str_data = saveStream.str();

			OUT_SAVE_INST_DATA_COMPLETE;
			return str_data;
		}

		void Load(const char* in)
		{
			if (!in)
			{
				OUT_LOAD_INST_DATA_FAIL;
				return;
			}

			OUT_LOAD_INST_DATA(in);

			char dataHead1, dataHead2;
			uint16 data0, data1, data2, data3;

			std::istringstream loadStream(in);
			loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3;

			if (dataHead1 == 'T' && dataHead2 == 'C')
			{
				m_auiEncounter[0] = data0;
				m_auiEncounter[1] = data1;
				m_auiEncounter[2] = data2;
				m_auiEncounter[3] = data3;

				for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
					if (m_auiEncounter[i] == IN_PROGRESS)
						m_auiEncounter[i] = NOT_STARTED;

			}
			else
				OUT_LOAD_INST_DATA_FAIL;

			OUT_LOAD_INST_DATA_COMPLETE;
		}
	};

};

void HandleSpellOnPlayersInInstanceToC5(Unit* caller, uint32 spellId)
{
	if (spellId <= 0 || !caller)
		return;

	Map* map = caller->GetMap();
	if (map && map->IsDungeon())
	{
		Map::PlayerList const &PlayerList = map->GetPlayers();

		if (PlayerList.isEmpty())
			return;

		for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
			if (i->GetSource() && i->GetSource()->IsAlive() && !i->GetSource()->IsGameMaster())
				caller->CastSpell(i->GetSource(), spellId);
	}
}

class npc_toc5_mount : public CreatureScript
{
public:
	npc_toc5_mount() : CreatureScript("npc_toc5_mount") { }

	struct npc_toc5_mountAI : public PassiveAI
	{
		npc_toc5_mountAI(Creature* creature) : PassiveAI(creature)
		{
		}

		void OnCharmed(bool apply) override
		{
			if (!apply)
			{
				me->DespawnOrUnsummon(500);
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_toc5_mountAI(creature);
	}
};


void AddSC_instance_trial_of_the_champion()
{
	new npc_toc5_mount();
	new instance_trial_of_the_champion();
}