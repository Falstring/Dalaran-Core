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
#include "InstanceScript.h"
#include "ulduar.h"
#include "Player.h"
#include "WorldPacket.h"


static DoorData const doorData[] =
{
	{ GO_LEVIATHAN_DOOR, BOSS_LEVIATHAN, DOOR_TYPE_ROOM, BOUNDARY_S },
	{ GO_XT_002_DOOR, BOSS_XT002, DOOR_TYPE_ROOM, BOUNDARY_S },
	{ GO_YOGG_SARON_DOOR, BOSS_YOGG_SARON, DOOR_TYPE_ROOM, BOUNDARY_S },
	{ GO_DOODAD_UL_UNIVERSEFLOOR_01, BOSS_ALGALON, DOOR_TYPE_ROOM, BOUNDARY_NONE },
	{ GO_DOODAD_UL_UNIVERSEFLOOR_02, BOSS_ALGALON, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_NONE },
	{ GO_DOODAD_UL_UNIVERSEGLOBE01, BOSS_ALGALON, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_NONE },
	{ GO_DOODAD_UL_ULDUAR_TRAPDOOR_03, BOSS_ALGALON, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_NONE },
	{ GO_ASSEMBLY_DOOR, BOSS_ASSEMBLY_OF_IRON, DOOR_TYPE_ROOM, BOUNDARY_S },
	{ GO_HODIR_ENTRANCE_DOOR, BOSS_HODIR, DOOR_TYPE_ROOM, BOUNDARY_S },
	{ 0, 0, DOOR_TYPE_ROOM, BOUNDARY_NONE },
	{ GO_MIMIRON_DOOR_1, BOSS_MIMIRON, DOOR_TYPE_ROOM, BOUNDARY_W },
	{ GO_MIMIRON_DOOR_2, BOSS_MIMIRON, DOOR_TYPE_ROOM, BOUNDARY_E },
	{ GO_MIMIRON_DOOR_3, BOSS_MIMIRON, DOOR_TYPE_ROOM, BOUNDARY_S },
};

MinionData const minionData[] =
{
	{ NPC_STEELBREAKER, BOSS_ASSEMBLY_OF_IRON },
	{ NPC_MOLGEIM, BOSS_ASSEMBLY_OF_IRON },
	{ NPC_BRUNDIR, BOSS_ASSEMBLY_OF_IRON },
	{ 0, 0, }
};

Position const BrannBronzebeardAssemblyPos = { 1554.951f, 142.5096f, 427.2744f, 3.6136f };
Position const ProspectorAssemblyPos = { 1556.939f, 144.098f, 427.3084f, 4.043797f };

class instance_ulduar : public InstanceMapScript
{
public:
	instance_ulduar() : InstanceMapScript("instance_ulduar", 603) { }

	struct instance_ulduar_InstanceMapScript : public InstanceScript
	{
		instance_ulduar_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
		{
			_events.ScheduleEvent(EVENT_CHECK_KOLOGARN_DOOR, 60000);
			_events.ScheduleEvent(EVENT_KEEPER_IMAGES_CORRECTOR, 300 * IN_MILLISECONDS); // 300*IN_MILLISECONDS
		}
		// Creatures
		ObjectGuid LeviathanGUID;
		ObjectGuid IgnisGUID;
		ObjectGuid RazorscaleGUID;
		ObjectGuid RazorscaleController;
		ObjectGuid ExpeditionCommanderGUID;
		ObjectGuid XT002GUID;
		ObjectGuid XTToyPileGUIDs[4];
		ObjectGuid AssemblyGUIDs[3];

		ObjectGuid BrannBronzebeardAssemblyGUID;
		ObjectGuid ProspectorAssemblyGUID;

		ObjectGuid KologarnGUID;
		ObjectGuid AuriayaGUID;
		ObjectGuid MimironGUID;

		// Mimiron
		ObjectGuid uiMimironDoodadTurnAround01GUID;
		ObjectGuid uiMimironDoodadTurnAround02GUID;
		ObjectGuid uiMimironTrainGUID;
		ObjectGuid uiLeviathanMKIIGUID;
		ObjectGuid uiVX001GUID;
		ObjectGuid uiAerialUnitGUID;
		ObjectGuid uiMagneticCoreGUID;
		ObjectGuid uiMimironElevatorGUID;
		std::list<ObjectGuid> uiMimironDoorGUIDList;

		ObjectGuid HodirGUID;

		// Thorim
		ObjectGuid ThorimLeverGUID;
		ObjectGuid ThorimCtrlGUID;
		ObjectGuid ThorimGUID;
		ObjectGuid ThorimImageGUID;
		ObjectGuid ThorimLightningFieldGUID;
		ObjectGuid RunicColossusGUID;
		ObjectGuid RuneGiantGUID;
		ObjectGuid RunicDoorGUID;
		ObjectGuid StoneDoorGUID;
		ObjectGuid ThorimChestGUID;
		ObjectGuid ThorimDarkIronPortCullisGUID;

		ObjectGuid FreyaGUID;
		ObjectGuid ElderGUIDs[3];
		ObjectGuid VezaxGUID;
		ObjectGuid YoggSaronGUID;
		ObjectGuid VoiceOfYoggSaronGUID;
		ObjectGuid SaraGUID;
		ObjectGuid BrainOfYoggSaronGUID;
		ObjectGuid AlgalonGUID;
		ObjectGuid BrannBronzebeardAlgGUID;

		// Observation Ring Keepers.
		ObjectGuid mimironRingGUID;
		ObjectGuid hodirRingGUID;
		ObjectGuid thorimRingGUID;
		ObjectGuid freyaRingGUID;

		// GameObjects
		ObjectGuid LeviathanGateGUID;
		ObjectGuid RazorHarpoonGUIDs[4];
		ObjectGuid KologarnChestGUID;
		ObjectGuid KologarnBridgeGUID;
		ObjectGuid KologarnDoorGUID;
		ObjectGuid HodirRareCacheGUID;
		ObjectGuid HodirChestGUID;
		ObjectGuid HodirDoorGUID;
		ObjectGuid HodirIceDoorGUID;
		ObjectGuid ArchivumDoorGUID;
		ObjectGuid VezaxDoorGUID;
		ObjectGuid BrainRoomDoorGUIDs[3];
		ObjectGuid KeeperGUIDs[4];
		ObjectGuid AlgalonSigilDoorGUID[3];
		ObjectGuid AlgalonFloorGUID[2];
		ObjectGuid AlgalonUniverseGUID;
		ObjectGuid AlgalonTrapdoorGUID;
		ObjectGuid GiftOfTheObserverGUID;

		ObjectGuid AncientGateOfKeepersGUID;

		// Miscellaneous
		uint32 TeamInInstance;
		uint32 HodirRareCacheData;
		uint32 ColossusData = 0;
		uint8 elderCount;
		uint8 illusion;
		uint8 keepersCount;
		bool conSpeedAtory;
		bool Unbroken;
		bool IsDriveMeCrazyEligible;

		std::set<ObjectGuid> mRubbleSpawns;

		void Initialize() override
		{
			SetHeaders(DataHeader);
			SetBossNumber(MAX_ENCOUNTER);
			LoadDoorData(doorData);
			LoadMinionData(minionData);

			_algalonTimer = 61;
			_maxArmorItemLevel = 0;
			_maxWeaponItemLevel = 0;
			TeamInInstance = 0;
			HodirRareCacheData = 0;
			ColossusData = 0;
			elderCount = 0;
			illusion = 0;
			keepersCount = 0;
			conSpeedAtory = false;
			Unbroken = true;
			_algalonSummoned = false;
			_summonAlgalon = false;			
            _mimironEngaged = false;

			memset(_summonObservationRingKeeper, false, sizeof(_summonObservationRingKeeper));
			memset(_summonYSKeeper, false, sizeof(_summonYSKeeper));
		}

			void FillInitialWorldStates(WorldPacket& packet) override
		{
			packet << uint32(WORLD_STATE_ALGALON_TIMER_ENABLED) << uint32(_algalonTimer && _algalonTimer <= 60);
			packet << uint32(WORLD_STATE_ALGALON_DESPAWN_TIMER) << uint32(std::min<uint32>(_algalonTimer, 60));
		}

			void OnPlayerEnter(Player* player) override
		{
			if (!TeamInInstance)
			TeamInInstance = player->GetTeam();

			if (_summonAlgalon)
			{
				_summonAlgalon = false;
				TempSummon* algalon = instance->SummonCreature(NPC_ALGALON, AlgalonLandPos);
				if (_algalonTimer && _algalonTimer <= 60)
					algalon->AI()->DoAction(ACTION_INIT_ALGALON);
				else
					algalon->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			}

			/* CHECK FREYA con ALVIE */


			// Keepers at Observation Ring
			if (GetBossState(BOSS_FREYA) == DONE && _summonObservationRingKeeper[0] && !KeeperGUIDs[0])
			{
				_summonObservationRingKeeper[0] = false;
				instance->SummonCreature(NPC_FREYA_OBSERVATION_RING, ObservationRingKeepersPos[0]);
			}
			if (GetBossState(BOSS_HODIR) == DONE && _summonObservationRingKeeper[1] && !KeeperGUIDs[1])
			{
				_summonObservationRingKeeper[1] = false;
				instance->SummonCreature(NPC_HODIR_OBSERVATION_RING, ObservationRingKeepersPos[1]);
			}
			if (GetBossState(BOSS_THORIM) == DONE && _summonObservationRingKeeper[2] && !KeeperGUIDs[2])
			{
				_summonObservationRingKeeper[2] = false;
				instance->SummonCreature(NPC_THORIM_OBSERVATION_RING, ObservationRingKeepersPos[2]);
			}
			if (GetBossState(BOSS_MIMIRON) == DONE && _summonObservationRingKeeper[3] && !KeeperGUIDs[3])
			{
				_summonObservationRingKeeper[3] = false;
				instance->SummonCreature(NPC_MIMIRON_OBSERVATION_RING, ObservationRingKeepersPos[3]);
			}

			// Keepers in Yogg-Saron's room
			if (_summonYSKeeper[0])
				instance->SummonCreature(NPC_FREYA_YS, YSKeepersPos[0]);
			if (_summonYSKeeper[1])
				instance->SummonCreature(NPC_HODIR_YS, YSKeepersPos[1]);
			if (_summonYSKeeper[2])
				instance->SummonCreature(NPC_THORIM_YS, YSKeepersPos[2]);
			if (_summonYSKeeper[3])
				instance->SummonCreature(NPC_MIMIRON_YS, YSKeepersPos[3]);
		}

			void OnCreatureCreate(Creature* creature) override
		{
			if (!TeamInInstance)
			{
				Map::PlayerList const& Players = instance->GetPlayers();
				if (!Players.isEmpty())
					if (Player* player = Players.begin()->GetSource())
						TeamInInstance = player->GetTeam();
			}

			switch (creature->GetEntry())
			{
			case NPC_LEVIATHAN:
				LeviathanGUID = creature->GetGUID();
				break;
			case NPC_IGNIS:
				IgnisGUID = creature->GetGUID();
				break;

				// Razorscale
			case NPC_RAZORSCALE:
				RazorscaleGUID = creature->GetGUID();
				break;
			case NPC_RAZORSCALE_CONTROLLER:
				RazorscaleController = creature->GetGUID();
				break;
			case NPC_EXPEDITION_COMMANDER:
				ExpeditionCommanderGUID = creature->GetGUID();
				break;

				// XT-002 Deconstructor
			case NPC_XT002:
				XT002GUID = creature->GetGUID();
				break;
			case NPC_XT_TOY_PILE:
				for (uint8 i = 0; i < 4; ++i)
					if (!XTToyPileGUIDs[i])
					{
					XTToyPileGUIDs[i] = creature->GetGUID();
					break;
					}
				break;

				// Assembly of Iron
			case NPC_STEELBREAKER:
				AssemblyGUIDs[0] = creature->GetGUID();
				AddMinion(creature, true);
				break;
			case NPC_MOLGEIM:
				AssemblyGUIDs[1] = creature->GetGUID();
				AddMinion(creature, true);
				break;
			case NPC_BRUNDIR:
				AssemblyGUIDs[2] = creature->GetGUID();
				AddMinion(creature, true);
				break;
			case NPC_BRANN_BRONZBEARD_ASSEMBLY:
				BrannBronzebeardAssemblyGUID = creature->GetGUID();
				if (GetBossState(BOSS_ASSEMBLY_OF_IRON) != DONE)
				{
					creature->Relocate(BrannBronzebeardAssemblyPos);
					creature->SetVisible(false);
				}
				break;
			case NPC_PROSPECTOR_DOREN_ASSEMBLY:
			case NPC_PROSPECTOR_LOREN_ASSEMBLY:
				ProspectorAssemblyGUID = creature->GetGUID();
				if (GetBossState(BOSS_ASSEMBLY_OF_IRON) != DONE)
				{
					creature->Relocate(ProspectorAssemblyPos);
					creature->SetVisible(false);
				}
				break;
			case NPC_KOLOGARN:
				KologarnGUID = creature->GetGUID();
				break;
			case NPC_KOLOGARN_BRIDGE:

				if (GetBossState(BOSS_KOLOGARN) == DONE)
				{
					creature->setDeathState(CORPSE);
					creature->DestroyForNearbyPlayers();
					creature->UpdateObjectVisibility(true);
				}
				else
				{
					creature->setDeathState(CORPSE);
					creature->RemoveCorpse(true);
				}
				break;
			case NPC_AURIAYA:
				AuriayaGUID = creature->GetGUID();
				break;

				//Mimiron										
			case NPC_MIMIRON:
				MimironGUID = creature->GetGUID();
				break;
			case NPC_LEVIATHAN_MKII:
				uiLeviathanMKIIGUID = creature->GetGUID();
				break;
			case NPC_VX_001:
				uiVX001GUID = creature->GetGUID();
				break;
			case NPC_AERIAL_COMMAND_UNIT:
				uiAerialUnitGUID = creature->GetGUID();
				break;

				// Hodir
			case NPC_HODIR:
				HodirGUID = creature->GetGUID();
				break;
			case NPC_EIVI_NIGHTFEATHER:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_TOR_GREYCLOUD);
				break;
			case NPC_ELLIE_NIGHTFEATHER:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_KAR_GREYCLOUD);
				break;
			case NPC_ELEMENTALIST_MAHFUUN:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_SPIRITWALKER_TARA);
				break;
			case NPC_ELEMENTALIST_AVUUN:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_SPIRITWALKER_YONA);
				break;
			case NPC_MISSY_FLAMECUFFS:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_AMIRA_BLAZEWEAVER);
				break;
			case NPC_SISSY_FLAMECUFFS:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_VEESHA_BLAZEWEAVER);
				break;
			case NPC_FIELD_MEDIC_PENNY:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_BATTLE_PRIEST_ELIZA);
				break;
			case NPC_FIELD_MEDIC_JESSI:
				if (TeamInInstance == HORDE)
					creature->UpdateEntry(NPC_BATTLE_PRIEST_GINA);
				break;


				// Thorim                    
			case NPC_THORIM:
				ThorimGUID = creature->GetGUID();
				break;
			case NPC_RUNIC_COLOSSUS:
				RunicColossusGUID = creature->GetGUID();
				break;
			case NPC_RUNE_GIANT:
				RuneGiantGUID = creature->GetGUID();
				break;
			case NPC_THORIM_CTRL:
				ThorimCtrlGUID = creature->GetGUID();
				break;
			case NPC_MERCENARY_CAPTAIN_A:
				if (TeamInInstance == ALLIANCE)
					creature->UpdateEntry(NPC_MERCENARY_CAPTAIN_H);
				break;
			case NPC_MERCENARY_SOLDIER_A:
				if (TeamInInstance == ALLIANCE)
					creature->UpdateEntry(NPC_MERCENARY_SOLDIER_H);
				break;


				// Freya
			case NPC_FREYA:
				FreyaGUID = creature->GetGUID();
				break;
			case NPC_IRONBRANCH:
				ElderGUIDs[0] = creature->GetGUID();
				if (GetBossState(BOSS_FREYA) == DONE)
					creature->DespawnOrUnsummon();
				break;
			case NPC_BRIGHTLEAF:
				ElderGUIDs[1] = creature->GetGUID();
				if (GetBossState(BOSS_FREYA) == DONE)
					creature->DespawnOrUnsummon();
				break;
			case NPC_STONEBARK:
				ElderGUIDs[2] = creature->GetGUID();
				if (GetBossState(BOSS_FREYA) == DONE)
					creature->DespawnOrUnsummon();
				break;

			case NPC_VEZAX:
				VezaxGUID = creature->GetGUID();
				break;

				// Observation Ring Keepers.
			case NPC_MIMIRON_OBSERVATION_RING:
				mimironRingGUID = creature->GetGUID();
				break;
			case NPC_HODIR_OBSERVATION_RING:
				hodirRingGUID = creature->GetGUID();
				break;
			case NPC_THORIM_OBSERVATION_RING:
				thorimRingGUID = creature->GetGUID();
				break;
			case NPC_FREYA_OBSERVATION_RING:
				freyaRingGUID = creature->GetGUID();
				break;
				// Yogg-Saron
			case NPC_YOGG_SARON:
				YoggSaronGUID = creature->GetGUID();
				break;
			case NPC_VOICE_OF_YOGG_SARON:
				VoiceOfYoggSaronGUID = creature->GetGUID();
				break;
			case NPC_BRAIN_OF_YOGG_SARON:
				BrainOfYoggSaronGUID = creature->GetGUID();
				break;
			case NPC_SARA:
				SaraGUID = creature->GetGUID();
				break;
			case NPC_FREYA_YS:
				KeeperGUIDs[0] = creature->GetGUID();
				_summonYSKeeper[0] = false;
				SaveToDB();
				++keepersCount;
				break;
			case NPC_HODIR_YS:
				KeeperGUIDs[1] = creature->GetGUID();
				_summonYSKeeper[1] = false;
				SaveToDB();
				++keepersCount;
				break;
			case NPC_THORIM_YS:
				KeeperGUIDs[2] = creature->GetGUID();
				_summonYSKeeper[2] = false;
				SaveToDB();
				++keepersCount;
				break;
			case NPC_MIMIRON_YS:
				KeeperGUIDs[3] = creature->GetGUID();
				_summonYSKeeper[3] = false;
				SaveToDB();
				++keepersCount;
				break;
			case NPC_SANITY_WELL:
				creature->SetReactState(REACT_PASSIVE);
				break;

				// Algalon
			case NPC_ALGALON:
				AlgalonGUID = creature->GetGUID();
				break;
			case NPC_BRANN_BRONZBEARD_ALG:
				BrannBronzebeardAlgGUID = creature->GetGUID();
				break;
				//! These creatures are summoned by something else than Algalon
				//! but need to be controlled/despawned by him - so they need to be
				//! registered in his summon list
			case NPC_ALGALON_VOID_ZONE_VISUAL_STALKER:
			case NPC_ALGALON_STALKER_ASTEROID_TARGET_01:
			case NPC_ALGALON_STALKER_ASTEROID_TARGET_02:
			case NPC_UNLEASHED_DARK_MATTER:
				if (Creature* algalon = instance->GetCreature(AlgalonGUID))
					algalon->AI()->JustSummoned(creature);
				break;
			}
		}

			void OnCreatureRemove(Creature* creature) override
		{
			switch (creature->GetEntry())
			{
			case NPC_XT_TOY_PILE:
				for (uint8 i = 0; i < 4; ++i)
					if (XTToyPileGUIDs[i] == creature->GetGUID())
					{
					//XTToyPileGUIDs[i] = 0;
					break;
					}
				break;
			case NPC_STEELBREAKER:
			case NPC_MOLGEIM:
			case NPC_BRUNDIR:
				AddMinion(creature, false);
				break;
			case NPC_BRANN_BRONZBEARD_ALG:
				if (BrannBronzebeardAlgGUID == creature->GetGUID())
					//BrannBronzebeardAlgGUID = 0;
				break;
			default:
				break;
			}
		}

			void OnGameObjectCreate(GameObject* gameObject)
		{
			switch (gameObject->GetEntry())
			{
			case GO_KOLOGARN_CHEST_HERO:
			case GO_KOLOGARN_CHEST:
				KologarnChestGUID = gameObject->GetGUID();
				break;
			case GO_KOLOGARN_BRIDGE:
				KologarnBridgeGUID = gameObject->GetGUID();
				if (GetBossState(BOSS_KOLOGARN) == DONE)
					HandleGameObject(KologarnBridgeGUID, false, gameObject);
				break;
			case GO_KOLOGARN_DOOR:
				KologarnDoorGUID = gameObject->GetGUID();
				break;
				// Thorim related
			case GO_LEVER:
				ThorimLeverGUID = gameObject->GetGUID();
			case GO_THORIM_DARK_IRON_PROTCULLIS:
				ThorimDarkIronPortCullisGUID = gameObject->GetGUID();
				break;
			case GO_THORIM_CHEST_HERO:
			case GO_THORIM_CHEST:
				ThorimChestGUID = gameObject->GetGUID();
				break;
			case GO_THORIM_LIGHTNING_FIELD:
				ThorimLightningFieldGUID = gameObject->GetGUID();
				break;
			case GO_THORIM_STONE_DOOR:
				StoneDoorGUID = gameObject->GetGUID();
				break;
			case GO_THORIM_RUNIC_DOOR:
				RunicDoorGUID = gameObject->GetGUID();
				break;

			case GO_HODIR_RARE_CACHE_OF_WINTER_HERO:
			case GO_HODIR_RARE_CACHE_OF_WINTER:
				HodirRareCacheGUID = gameObject->GetGUID();
				break;
			case GO_HODIR_CHEST_HERO:
			case GO_HODIR_CHEST:
				HodirChestGUID = gameObject->GetGUID();
				break;
			case GO_LEVIATHAN_DOOR:
				AddDoor(gameObject, true);
				break;
			case GO_LEVIATHAN_GATE:
				LeviathanGateGUID = gameObject->GetGUID();
				if (GetBossState(BOSS_LEVIATHAN) == DONE)
					gameObject->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
				break;
			case GO_XT_002_DOOR:
				AddDoor(gameObject, true);
				break;
			case GO_MIMIRON_TRAIN_DOODAD_TURNAROUND01:
				uiMimironDoodadTurnAround01GUID = gameObject->GetGUID();
				break;
			case GO_MIMIRON_TRAIN_DOODAD_TURNAROUND02:
				uiMimironDoodadTurnAround02GUID = gameObject->GetGUID();
				break;
			case GO_MIMIRON_TRAIN:
				uiMimironTrainGUID = gameObject->GetGUID();
				gameObject->SetGoState(GO_STATE_ACTIVE); //Probar con gameObject->setGoState(GO_STATE_ACTIVE);				
				break;
			case GO_MIMIRON_ELEVATOR:
				gameObject->setActive(true);
				uiMimironElevatorGUID = gameObject->GetGUID();
				break;
			case GO_MIMIRON_DOOR_1:
			case GO_MIMIRON_DOOR_2:
			case GO_MIMIRON_DOOR_3:
				gameObject->setActive(true);
				uiMimironDoorGUIDList.push_back(gameObject->GetGUID());
				break;
			case GO_VEZAX_DOOR:
				VezaxDoorGUID = gameObject->GetGUID();
				HandleGameObject(VezaxDoorGUID, false, gameObject);
				break;
			case GO_RAZOR_HARPOON_1:
				RazorHarpoonGUIDs[0] = gameObject->GetGUID();
				break;
			case GO_RAZOR_HARPOON_2:
				RazorHarpoonGUIDs[1] = gameObject->GetGUID();
				break;
			case GO_RAZOR_HARPOON_3:
				RazorHarpoonGUIDs[2] = gameObject->GetGUID();
				break;
			case GO_RAZOR_HARPOON_4:
				RazorHarpoonGUIDs[3] = gameObject->GetGUID();
				break;
			case GO_MOLE_MACHINE:
				if (GetBossState(BOSS_RAZORSCALE) == IN_PROGRESS)
					gameObject->SetGoState(GO_STATE_ACTIVE);
				break;
			case GO_HODIR_DOOR:
				HodirDoorGUID = gameObject->GetGUID();
				break;
			case GO_HODIR_ICE_DOOR:
				HodirIceDoorGUID = gameObject->GetGUID();
				break;
			case GO_ARCHIVUM_DOOR:
				ArchivumDoorGUID = gameObject->GetGUID();
				if (GetBossState(BOSS_ASSEMBLY_OF_IRON) != DONE)
					HandleGameObject(ArchivumDoorGUID, false);
				break;
			case GO_YOGG_SARON_DOOR:
				AddDoor(gameObject, true);
				break;
			case GO_ASSEMBLY_DOOR:
				AddDoor(gameObject, true);
				break;
			case GO_HODIR_ENTRANCE_DOOR:
				AddDoor(gameObject, true);
				break;
			case GO_BRAIN_ROOM_DOOR_1:
				BrainRoomDoorGUIDs[0] = gameObject->GetGUID();
				break;
			case GO_BRAIN_ROOM_DOOR_2:
				BrainRoomDoorGUIDs[1] = gameObject->GetGUID();
				break;
			case GO_BRAIN_ROOM_DOOR_3:
				BrainRoomDoorGUIDs[2] = gameObject->GetGUID();
				break;
			case GO_CELESTIAL_PLANETARIUM_ACCESS_10:
			case GO_CELESTIAL_PLANETARIUM_ACCESS_25:

				if (instance->Is25ManRaid())
				{
					if (gameObject->GetEntry() == GO_CELESTIAL_PLANETARIUM_ACCESS_10)
					{
						gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
						gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

						gameObject->RemoveFromWorld();
					}
				}
				else
				{
					if (gameObject->GetEntry() == GO_CELESTIAL_PLANETARIUM_ACCESS_25)
					{
						gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
						gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

						gameObject->RemoveFromWorld();
					}
				}

				if (_algalonSummoned)
				{
					gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
					gameObject->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

					gameObject->RemoveFromWorld();
				}
				break;
			case GO_DOODAD_UL_SIGILDOOR_01:
				AlgalonSigilDoorGUID[0] = gameObject->GetGUID();
				if (_algalonSummoned)
					gameObject->SetGoState(GO_STATE_ACTIVE);
				break;
			case GO_DOODAD_UL_SIGILDOOR_02:
				AlgalonSigilDoorGUID[1] = gameObject->GetGUID();
				if (_algalonSummoned)
					gameObject->SetGoState(GO_STATE_ACTIVE);
				break;
			case GO_DOODAD_UL_SIGILDOOR_03:
				AlgalonSigilDoorGUID[2] = gameObject->GetGUID();
				AddDoor(gameObject, true);
				break;
			case GO_DOODAD_UL_UNIVERSEFLOOR_01:
				AlgalonFloorGUID[0] = gameObject->GetGUID();
				AddDoor(gameObject, true);
				break;
			case GO_DOODAD_UL_UNIVERSEFLOOR_02:
				AlgalonFloorGUID[1] = gameObject->GetGUID();
				AddDoor(gameObject, true);
				break;
			case GO_DOODAD_UL_UNIVERSEGLOBE01:
				AlgalonUniverseGUID = gameObject->GetGUID();
				AddDoor(gameObject, true);
				break;
			case GO_DOODAD_UL_ULDUAR_TRAPDOOR_03:
				AlgalonTrapdoorGUID = gameObject->GetGUID();
				AddDoor(gameObject, true);
				break;
			case GO_GIFT_OF_THE_OBSERVER_10:
			case GO_GIFT_OF_THE_OBSERVER_25:
				GiftOfTheObserverGUID = gameObject->GetGUID();
				break;
			case GO_ANCIENT_GATEOFTHE_KEEPERS:
                if (GetBossState(BOSS_MIMIRON) == DONE && GetBossState(BOSS_FREYA) == DONE && GetBossState(BOSS_HODIR) == DONE && GetBossState(BOSS_THORIM) == DONE)
                {
                    instance->LoadGrid(1903.0f, 248.0f);
                    gameObject->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
                }                
				AncientGateOfKeepersGUID = gameObject->GetGUID();
			default:
				break;
			}
		}

		void OnGameObjectRemove(GameObject* gameObject) override
		{
			switch (gameObject->GetEntry())
			{
			case GO_LEVIATHAN_DOOR:
			case GO_XT_002_DOOR:
			case GO_DOODAD_UL_SIGILDOOR_03:
			case GO_DOODAD_UL_UNIVERSEFLOOR_01:
			case GO_DOODAD_UL_UNIVERSEFLOOR_02:
			case GO_DOODAD_UL_UNIVERSEGLOBE01:
			case GO_DOODAD_UL_ULDUAR_TRAPDOOR_03:
				AddDoor(gameObject, false);
				break;
			default:
				break;
			}
		}

			void OnUnitDeath(Unit* unit) override
		{
			Creature* creature = unit->ToCreature();
			if (!creature)
				return;

			switch (creature->GetEntry())
			{
			case NPC_CORRUPTED_SERVITOR:
			case NPC_MISGUIDED_NYMPH:
			case NPC_GUARDIAN_LASHER:
			case NPC_FOREST_SWARMER:
			case NPC_MANGROVE_ENT:
			case NPC_IRONROOT_LASHER:
			case NPC_NATURES_BLADE:
			case NPC_GUARDIAN_OF_LIFE:
				if (!conSpeedAtory)
				{
					DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, CRITERIA_CON_SPEED_ATORY);
					conSpeedAtory = true;
				}
				break;
			default:
				break;
			}
		}

			void ProcessEvent(WorldObject* /*gameObject*/, uint32 eventId) override
		{
			// Flame Leviathan's Tower Event triggers
			Creature* FlameLeviathan = instance->GetCreature(LeviathanGUID);

			switch (eventId)
			{
			case EVENT_TOWER_OF_STORM_DESTROYED:
				if (FlameLeviathan && FlameLeviathan->IsAlive())
					FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_STORM_DESTROYED);
				break;
			case EVENT_TOWER_OF_FROST_DESTROYED:
				if (FlameLeviathan && FlameLeviathan->IsAlive())
					FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_FROST_DESTROYED);
				break;
			case EVENT_TOWER_OF_FLAMES_DESTROYED:
				if (FlameLeviathan && FlameLeviathan->IsAlive())
					FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_FLAMES_DESTROYED);
				break;
			case EVENT_TOWER_OF_LIFE_DESTROYED:
				if (FlameLeviathan && FlameLeviathan->IsAlive())
					FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_LIFE_DESTROYED);
				break;
			case EVENT_ACTIVATE_SANITY_WELL:
				if (Creature* freya = instance->GetCreature(KeeperGUIDs[0]))
					freya->AI()->DoAction(4/*ACTION_SANITY_WELLS*/);
				break;
			case EVENT_HODIRS_PROTECTIVE_GAZE_PROC:
				if (Creature* hodir = instance->GetCreature(KeeperGUIDs[1]))
					hodir->AI()->DoAction(5/*ACTION_FLASH_FREEZE*/);
				break;
			}
		}

            void CheckAncientGateRequirements()
            {
                if (GetBossState(BOSS_MIMIRON) == DONE && GetBossState(BOSS_FREYA) == DONE && GetBossState(BOSS_HODIR) == DONE && GetBossState(BOSS_THORIM) == DONE)
                {
                    instance->LoadGrid(1903.0f, 248.0f);
                    if (GameObject* go = instance->GetGameObject(AncientGateOfKeepersGUID))
                    {
                        go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
                        if (Creature* gateVoice = instance->SummonCreature(NPC_ANCIENT_GATE_KEEPERS_VOICE, go->GetPosition()))
                        {
                            gateVoice->AI()->Talk(ANCIENT_GATE_UNLOCKS);
                            gateVoice->DespawnOrUnsummon(5 * IN_MILLISECONDS);
                        }
                    }                                           
                }
            }

			bool SetBossState(uint32 type, EncounterState state) override
		{
			if (!InstanceScript::SetBossState(type, state))
			return false;

			switch (type)
			{
			case BOSS_LEVIATHAN:
			case BOSS_IGNIS:
			case BOSS_RAZORSCALE:
			case BOSS_XT002:
			case BOSS_AURIAYA:
				if (state == DONE)
					break;
			case BOSS_MIMIRON:
				if (state == DONE)
				{
					instance->SummonCreature(NPC_MIMIRON_OBSERVATION_RING, ObservationRingKeepersPos[3]);
                    CheckAncientGateRequirements();
				}

				/*for (std::list<uint64>::iterator i = uiMimironDoorGUIDList.begin(); i != uiMimironDoorGUIDList.end(); i++)
				{
					if (GameObject* obj = instance->GetGameObject(*i))
						obj->SetGoState(state == IN_PROGRESS ? GO_STATE_READY : GO_STATE_ACTIVE);
				}*/
				break;
			case BOSS_FREYA:
				if (state == DONE)
				{
					instance->SummonCreature(NPC_FREYA_OBSERVATION_RING, ObservationRingKeepersPos[0]);
                    CheckAncientGateRequirements();
				}
				break;
				/*case BOSS_ASSEMBLY_OF_IRON:
				if (state == DONE)
				HandleGameObject(ArchivumDoorGUID, true);
				break;*/
			case BOSS_VEZAX:
				if (state == DONE)
					HandleGameObject(VezaxDoorGUID, true);
				break;
			case BOSS_YOGG_SARON:
				break;
			case BOSS_ASSEMBLY_OF_IRON:
				if (state == DONE)
				{
					HandleGameObject(ArchivumDoorGUID, true);
					//HandleGameObject(KologarnDoorGUID, true);
					if (GameObject* kologarnDoor = instance->GetGameObject(KologarnDoorGUID))
					{
						kologarnDoor->SetGoState(GO_STATE_ACTIVE);

					}
					if (Creature* brann = instance->GetCreature(BrannBronzebeardAssemblyGUID))
						brann->AI()->SetData(1, 1);
				}
				break;
			case BOSS_KOLOGARN:
				if (state == DONE)
				{
					if (GameObject* gameObject = instance->GetGameObject(KologarnChestGUID))
					{
						gameObject->SetRespawnTime(gameObject->GetRespawnDelay());
						gameObject->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
					}
					HandleGameObject(KologarnBridgeGUID, false);
				}
				break;
			case BOSS_HODIR:
				if (state == DONE)
				{
					if (GameObject* HodirRareCache = instance->GetGameObject(HodirRareCacheGUID))
						if (GetData(DATA_HODIR_RARE_CACHE))
							HodirRareCache->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
					if (GameObject* HodirChest = instance->GetGameObject(HodirChestGUID))
						HodirChest->SetRespawnTime(HodirChest->GetRespawnDelay());
					HandleGameObject(HodirDoorGUID, true);
					HandleGameObject(HodirIceDoorGUID, true);

					instance->SummonCreature(NPC_HODIR_OBSERVATION_RING, ObservationRingKeepersPos[1]);
                    CheckAncientGateRequirements();
				}
				break;
			case BOSS_THORIM:
				if (state == DONE)
				{
					if (GameObject* gameObject = instance->GetGameObject(ThorimChestGUID))
						gameObject->SetRespawnTime(gameObject->GetRespawnDelay());
					if (GameObject* gameObject = instance->GetGameObject(ThorimLightningFieldGUID))
						gameObject->SetGoState(state == IN_PROGRESS ? GO_STATE_READY : GO_STATE_ACTIVE);

					instance->SummonCreature(NPC_THORIM_OBSERVATION_RING, ObservationRingKeepersPos[2]);
                    CheckAncientGateRequirements();
				}
				break;
			case BOSS_ALGALON:
				if (state == DONE)
				{
					_events.CancelEvent(EVENT_UPDATE_ALGALON_TIMER);
					_events.CancelEvent(EVENT_DESPAWN_ALGALON);
					DoUpdateWorldState(WORLD_STATE_ALGALON_TIMER_ENABLED, 0);
					_algalonTimer = 61;
					if (GameObject* gameObject = instance->GetGameObject(GiftOfTheObserverGUID))
						gameObject->SetRespawnTime(gameObject->GetRespawnDelay());
					// get item level (recheck weapons)
					Map::PlayerList const& players = instance->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
						if (Player* player = itr->GetSource())
							for (uint8 slot = EQUIPMENT_SLOT_MAINHAND; slot <= EQUIPMENT_SLOT_RANGED; ++slot)
								if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
									if (item->GetTemplate()->ItemLevel > _maxWeaponItemLevel)
										_maxWeaponItemLevel = item->GetTemplate()->ItemLevel;
				}
				else if (state == IN_PROGRESS)
				{
					// get item level (armor cannot be swapped in combat)
					Map::PlayerList const& players = instance->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						if (Player* player = itr->GetSource())
						{
							for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
							{
								if (slot == EQUIPMENT_SLOT_TABARD || slot == EQUIPMENT_SLOT_BODY)
									continue;

								if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
								{
									if (slot >= EQUIPMENT_SLOT_MAINHAND && slot <= EQUIPMENT_SLOT_RANGED)
									{
										if (item->GetTemplate()->ItemLevel > _maxWeaponItemLevel)
											_maxWeaponItemLevel = item->GetTemplate()->ItemLevel;
									}
									else if (item->GetTemplate()->ItemLevel > _maxArmorItemLevel)
										_maxArmorItemLevel = item->GetTemplate()->ItemLevel;
								}
							}
						}
					}
				}
				break;
			}

			return true;
		}

			void SetData(uint32 type, uint32 data) override
		{
			switch (type)
			{
			case DATA_COLOSSUS:
				ColossusData = data;
				if (data == 2)
				{					
					instance->LoadGrid(364, -16);
					_events.ScheduleEvent(EVENT_FLAME_LEVIATHAN_INTRO, 1 * IN_MILLISECONDS);

					SaveToDB();
				}
				break;
			case DATA_HODIR_RARE_CACHE:
				HodirRareCacheData = data;
				if (!HodirRareCacheData)
				{
					if (Creature* Hodir = instance->GetCreature(HodirGUID))
						if (GameObject* gameObject = instance->GetGameObject(HodirRareCacheGUID))
							Hodir->RemoveGameObject(gameObject, false);
				}
				break;
			case DATA_UNBROKEN:
				Unbroken = bool(data);
				break;
			case DATA_MIMIRON_ELEVATOR:
				if (GameObject* go = instance->GetGameObject(uiMimironElevatorGUID))
					go->SetGoState(GOState(data));
				break;
			case DATA_MIMIRON_ACTIVATE_DOODAD_TURNAROUND:
				switch (data)
				{
				case 0:
					_events.ScheduleEvent(EVENT_ACTIVATE_TRAIN_DOODAD_01, 30.50 * IN_MILLISECONDS);
					break;
				case 1:
					_events.ScheduleEvent(EVENT_ACTIVATE_TRAIN_DOODAD_02, 34 * IN_MILLISECONDS);

					break;
				}
				break;
			case DATA_MIMIRON_ENGAGED:
				if (data == 1)
					_mimironEngaged = true;
				break;
			case DATA_CALL_TRAM:
				if (uiMimironTrainGUID && instance)
				{

					instance->LoadGrid(2307, 284.632f);
					GameObject* go = instance->GetGameObject(uiMimironTrainGUID);
					if (data == 0)
						go->SetGoState(GO_STATE_READY);
					if (data == 1)
						go->SetGoState(GO_STATE_ACTIVE);

					// Send movement update to players
					if (Map* pMap = go->GetMap())
						if (pMap->IsDungeon())
						{
						Map::PlayerList const &PlayerList = pMap->GetPlayers();

						if (!PlayerList.isEmpty())
							for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
								if (i->GetSource())
								{
							UpdateData data;
							WorldPacket pkt;
							go->BuildValuesUpdateBlockForPlayer(&data, i->GetSource());
							data.BuildPacket(&pkt);
							i->GetSource()->GetSession()->SendPacket(&pkt);
								}
						}
				}
				break;
			case DATA_ILLUSION:
				illusion = data;
				break;
			case DATA_RUNIC_DOOR:
				if (GameObject* go = instance->GetGameObject(RunicDoorGUID))
					go->SetGoState(GOState(data));
				break;
			case DATA_STONE_DOOR:
				if (GameObject* go = instance->GetGameObject(StoneDoorGUID))
					go->SetGoState(GOState(data));
				break;
			case DATA_DRIVE_ME_CRAZY:
				IsDriveMeCrazyEligible = data ? true : false;
				break;
			case EVENT_DESPAWN_ALGALON:
				DoUpdateWorldState(WORLD_STATE_ALGALON_TIMER_ENABLED, 1);
				DoUpdateWorldState(WORLD_STATE_ALGALON_DESPAWN_TIMER, 60);
				_algalonTimer = 60;
				_events.ScheduleEvent(EVENT_DESPAWN_ALGALON, 3600000);
				_events.ScheduleEvent(EVENT_UPDATE_ALGALON_TIMER, 60000);
				break;
			case DATA_ALGALON_SUMMON_STATE:
				_algalonSummoned = true;
				break;
			default:
				break;
			}
		}

			void SetData64(uint32 /*type*/, uint64 /*data*/) override
		{
		}

		ObjectGuid GetGuidData(uint32 data) const override
		{
			switch (data)
			{
			case BOSS_LEVIATHAN:
				return LeviathanGUID;
			case BOSS_IGNIS:
				return IgnisGUID;

				// Razorscale
			case BOSS_RAZORSCALE:
				return RazorscaleGUID;
			case DATA_RAZORSCALE_CONTROL:
				return RazorscaleController;
			case DATA_EXPEDITION_COMMANDER:
				return ExpeditionCommanderGUID;
			case GO_RAZOR_HARPOON_1:
				return RazorHarpoonGUIDs[0];
			case GO_RAZOR_HARPOON_2:
				return RazorHarpoonGUIDs[1];
			case GO_RAZOR_HARPOON_3:
				return RazorHarpoonGUIDs[2];
			case GO_RAZOR_HARPOON_4:
				return RazorHarpoonGUIDs[3];

			case DATA_ANCIENT_GATEOFTHE_KEEPERS:
				return AncientGateOfKeepersGUID;

				// Mimiron
			case BOSS_MIMIRON:              return MimironGUID;
			case DATA_LEVIATHAN_MK_II:      return uiLeviathanMKIIGUID;
			case DATA_VX_001:               return uiVX001GUID;
			case DATA_AERIAL_UNIT:          return uiAerialUnitGUID;
			case DATA_MAGNETIC_CORE:        return uiMagneticCoreGUID;


				// Thorim
			case BOSS_THORIM:					 return ThorimGUID;
			case GO_LEVER:						 return ThorimLeverGUID;
			case GO_THORIM_DARK_IRON_PROTCULLIS: return ThorimDarkIronPortCullisGUID;
			case GO_THORIM_LIGHTNING_FIELD:      return ThorimLightningFieldGUID;
			case DATA_RUNIC_COLOSSUS:			 return RunicColossusGUID;
			case DATA_RUNE_GIANT:				 return RuneGiantGUID;
			case NPC_THORIM_CTRL:                return ThorimCtrlGUID;
				//case NPC_THORIM_IMAGE:               return ThorimImageGUID;
				// XT-002 Deconstructor
			case BOSS_XT002:
				return XT002GUID;
			case DATA_TOY_PILE_0:
			case DATA_TOY_PILE_1:
			case DATA_TOY_PILE_2:
			case DATA_TOY_PILE_3:
				return XTToyPileGUIDs[data - DATA_TOY_PILE_0];

				// Assembly of Iron
			case DATA_STEELBREAKER:
				return AssemblyGUIDs[0];
			case DATA_MOLGEIM:
				return AssemblyGUIDs[1];
			case DATA_BRUNDIR:
				return AssemblyGUIDs[2];
			case BOSS_KOLOGARN:
				return KologarnGUID;
			case BOSS_AURIAYA:
				return AuriayaGUID;
			case BOSS_HODIR:
				return HodirGUID;


				// Freya
			case BOSS_FREYA:
				return FreyaGUID;
			case BOSS_BRIGHTLEAF:
				return ElderGUIDs[0];
			case BOSS_IRONBRANCH:
				return ElderGUIDs[1];
			case BOSS_STONEBARK:
				return ElderGUIDs[2];

			case BOSS_VEZAX:
				return VezaxGUID;
				// Observation Ring Keepers
			case DATA_MIMIRON_OBSERVATION_RING:
				return mimironRingGUID;
			case DATA_HODIR_OBSERVATION_RING:
				return hodirRingGUID;
			case DATA_THORIM_OBSERVATION_RING:
				return thorimRingGUID;
			case DATA_FREYA_OBSERVATION_RING:
				return freyaRingGUID;
				// Yogg-Saron
			case BOSS_YOGG_SARON:
				return YoggSaronGUID;
			case DATA_VOICE_OF_YOGG_SARON:
				return VoiceOfYoggSaronGUID;
			case DATA_BRAIN_OF_YOGG_SARON:
				return BrainOfYoggSaronGUID;
			case DATA_SARA:
				return SaraGUID;
			case GO_BRAIN_ROOM_DOOR_1:
				return BrainRoomDoorGUIDs[0];
			case GO_BRAIN_ROOM_DOOR_2:
				return BrainRoomDoorGUIDs[1];
			case GO_BRAIN_ROOM_DOOR_3:
				return BrainRoomDoorGUIDs[2];
			case DATA_FREYA_YS:
				return KeeperGUIDs[0];
			case DATA_HODIR_YS:
				return KeeperGUIDs[1];
			case DATA_THORIM_YS:
				return KeeperGUIDs[2];
			case DATA_MIMIRON_YS:
				return KeeperGUIDs[3];

				// Algalon
			case BOSS_ALGALON:
				return AlgalonGUID;
			case DATA_SIGILDOOR_01:
				return AlgalonSigilDoorGUID[0];
			case DATA_SIGILDOOR_02:
				return AlgalonSigilDoorGUID[1];
			case DATA_SIGILDOOR_03:
				return AlgalonSigilDoorGUID[2];
			case DATA_UNIVERSE_FLOOR_01:
				return AlgalonFloorGUID[0];
			case DATA_UNIVERSE_FLOOR_02:
				return AlgalonFloorGUID[1];
			case DATA_UNIVERSE_GLOBE:
				return AlgalonUniverseGUID;
			case DATA_ALGALON_TRAPDOOR:
				return AlgalonTrapdoorGUID;
			case DATA_BRANN_BRONZEBEARD_ALG:
				return BrannBronzebeardAlgGUID;
			default:
				break;
			}

			return ObjectGuid::Empty;
		}

			uint32 GetData(uint32 type) const override
		{
			switch (type)
			{
			case DATA_COLOSSUS:
				return ColossusData;
			case DATA_HODIR_RARE_CACHE:
				return HodirRareCacheData;
			case DATA_UNBROKEN:
				return uint32(Unbroken);
			case DATA_ILLUSION:
				return illusion;
			case DATA_KEEPERS_COUNT:
				return keepersCount;
			case DATA_MIMIRON_ENGAGED:
                return _mimironEngaged;
			default:
				break;
			}

			return 0;
		}

			bool CheckAchievementCriteriaMeet(uint32 criteriaId, Player const*, Unit const* /* = NULL */, uint32 /* = 0 */) override
		{
			switch (criteriaId)
			{
			case CRITERIA_HERALD_OF_TITANS:
				return _maxArmorItemLevel <= MAX_HERALD_ARMOR_ITEMLEVEL && _maxWeaponItemLevel <= MAX_HERALD_WEAPON_ITEMLEVEL;
			case CRITERIA_WAITS_DREAMING_STORMWIND_25:
			case CRITERIA_WAITS_DREAMING_STORMWIND_10:
				return illusion == STORMWIND_ILLUSION;
			case CRITERIA_WAITS_DREAMING_CHAMBER_25:
			case CRITERIA_WAITS_DREAMING_CHAMBER_10:
				return illusion == CHAMBER_ILLUSION;
			case CRITERIA_WAITS_DREAMING_ICECROWN_25:
			case CRITERIA_WAITS_DREAMING_ICECROWN_10:
				return illusion == ICECROWN_ILLUSION;
			case CRITERIA_DRIVE_ME_CRAZY_10:
			case CRITERIA_DRIVE_ME_CRAZY_25:
				return IsDriveMeCrazyEligible;
			case CRITERIA_THREE_LIGHTS_IN_THE_DARKNESS_10:
			case CRITERIA_THREE_LIGHTS_IN_THE_DARKNESS_25:
				return keepersCount <= 3;
			case CRITERIA_TWO_LIGHTS_IN_THE_DARKNESS_10:
			case CRITERIA_TWO_LIGHTS_IN_THE_DARKNESS_25:
				return keepersCount <= 2;
			case CRITERIA_ONE_LIGHT_IN_THE_DARKNESS_10:
			case CRITERIA_ONE_LIGHT_IN_THE_DARKNESS_25:
				return keepersCount <= 1;
			case CRITERIA_ALONE_IN_THE_DARKNESS_10:
			case CRITERIA_ALONE_IN_THE_DARKNESS_25:
				return keepersCount == 0;
			}

			return false;
		}

			/*void WriteSaveDataMore(std::ostringstream& data) override
			{
				data << GetData(DATA_COLOSSUS) << ' ' << _algalonTimer << ' ' << uint32(_algalonSummoned ? 1 : 0);

				for (uint8 i = 0; i < 4; ++i)
					data << ' ' << uint32(!KeeperGUIDs[i].IsEmpty() ? 1 : 0);

				//data << ' ' << _CoUAchivePlayerDeathMask;
			}

			void ReadSaveDataMore(std::istringstream& data) override
			{
				uint32 tempState;
				data >> tempState;
				if (tempState == IN_PROGRESS || tempState > SPECIAL)
					tempState = NOT_STARTED;
				SetData(DATA_COLOSSUS, tempState);

				data >> _algalonTimer;
				data >> tempState;
				_algalonSummoned = tempState != 0;
				if (_algalonSummoned && GetBossState(BOSS_ALGALON) != DONE)
				{
					_summonAlgalon = true;
					if (_algalonTimer && _algalonTimer <= 60)
					{
						_events.ScheduleEvent(EVENT_UPDATE_ALGALON_TIMER, 60000);
						DoUpdateWorldState(WORLD_STATE_ALGALON_TIMER_ENABLED, 1);
						DoUpdateWorldState(WORLD_STATE_ALGALON_DESPAWN_TIMER, _algalonTimer);
					}
				}

				for (uint8 i = 0; i < 4; ++i)
				{
					data >> tempState;
					_summonYSKeeper[i] = tempState != 0;
				}

				if (GetBossState(BOSS_FREYA) == DONE && !_summonYSKeeper[0])
					_summonObservationRingKeeper[0] = true;
				if (GetBossState(BOSS_HODIR) == DONE && !_summonYSKeeper[1])
					_summonObservationRingKeeper[1] = true;
				if (GetBossState(BOSS_THORIM) == DONE && !_summonYSKeeper[2])
					_summonObservationRingKeeper[2] = true;
				if (GetBossState(BOSS_MIMIRON) == DONE && !_summonYSKeeper[3])
					_summonObservationRingKeeper[3] = true;

				//data >> _CoUAchivePlayerDeathMask;
			}*/


			void WriteSaveDataMore(std::ostringstream& data) override
			{
				data << GetData(DATA_COLOSSUS) << ' ' << _algalonTimer << ' ' << uint32(_algalonSummoned ? 1 : 0);

				for (uint8 i = 0; i < 4; ++i)
					data << ' ' << uint32(!KeeperGUIDs[i].IsEmpty() ? 1 : 0);

				//data << ' ' << _CoUAchivePlayerDeathMask;
			}

			void Load(char const* strIn) override
			{
				if (!strIn)
				{
					OUT_LOAD_INST_DATA_FAIL;
					return;
				}

				OUT_LOAD_INST_DATA(strIn);

				char dataHead1, dataHead2;

				std::istringstream loadStream(strIn);
				loadStream >> dataHead1 >> dataHead2;

				if (dataHead1 == 'U' && dataHead2 == 'U')
				{
					for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
					{
					uint32 tmpState;
					loadStream >> tmpState;
					if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
					tmpState = NOT_STARTED;

					SetBossState(i, EncounterState(tmpState));
					}

					uint32 tempState;
					loadStream >> tempState;
					if (tempState == IN_PROGRESS || tempState > SPECIAL)
						tempState = NOT_STARTED;
					SetData(DATA_COLOSSUS, tempState);

					loadStream >> _algalonTimer;
					loadStream >> tempState;
					_algalonSummoned = tempState != 0;
					if (_algalonSummoned && _algalonTimer == 0)
					{

					}
					else
					{
						if (_algalonSummoned && GetBossState(BOSS_ALGALON) != DONE)
						{
							_summonAlgalon = true;
							if (_algalonTimer && _algalonTimer <= 60)
							{
								_events.ScheduleEvent(EVENT_UPDATE_ALGALON_TIMER, 60000);
								DoUpdateWorldState(WORLD_STATE_ALGALON_TIMER_ENABLED, 1);
								DoUpdateWorldState(WORLD_STATE_ALGALON_DESPAWN_TIMER, _algalonTimer);
							}
						}
					}


					for (uint8 i = 0; i < 4; ++i)
					{
						loadStream >> tempState;
						_summonYSKeeper[i] = tempState != 0;
					}

					if (GetBossState(BOSS_FREYA) == DONE && !_summonYSKeeper[0])
						_summonObservationRingKeeper[0] = true;
					if (GetBossState(BOSS_HODIR) == DONE && !_summonYSKeeper[1])
						_summonObservationRingKeeper[1] = true;
					if (GetBossState(BOSS_THORIM) == DONE && !_summonYSKeeper[2])
						_summonObservationRingKeeper[2] = true;
					if (GetBossState(BOSS_MIMIRON) == DONE && !_summonYSKeeper[3])
						_summonObservationRingKeeper[3] = true;

				}

				OUT_LOAD_INST_DATA_COMPLETE;
			}

			// This will be called ONLY if the boss does exist and is death.
			void manageKeeperImages(uint32 ringData, ObjectGuid ysGUID)
		{

			if (Creature* keeperRing = instance->GetCreature(GetGuidData(ringData)))
			{
				if (keeperRing->IsAlive())
					return;
			}
			else // If the Observation ring's image does not exist, check if it is down, at Yogg-Saron's prison.
			{
				if (Creature* keeperYS = instance->GetCreature(ysGUID))
				{
					if (keeperYS->IsAlive())
						return;
				}
			}

			switch (ringData)
			{
			case DATA_MIMIRON_OBSERVATION_RING:
				instance->SummonCreature(NPC_MIMIRON_OBSERVATION_RING, ObservationRingKeepersPos[3]);
				break;
			case DATA_HODIR_OBSERVATION_RING:
				instance->SummonCreature(NPC_HODIR_OBSERVATION_RING, ObservationRingKeepersPos[1]);
				break;
			case DATA_THORIM_OBSERVATION_RING:
				instance->SummonCreature(NPC_THORIM_OBSERVATION_RING, ObservationRingKeepersPos[2]);
				break;
			case DATA_FREYA_OBSERVATION_RING:
				instance->SummonCreature(NPC_FREYA_OBSERVATION_RING, ObservationRingKeepersPos[0]);
				break;
			}

			SaveToDB();
			return;
		}

		/*
		After a kill, each boss will be death (only visible to GM) until the next ID weekly reset.
		Hence, some bosses and their grids will be loaded dynamically, we can not rely just on if it does exist or not. We need to check if is death.
		*/
		void keeperImageControl(uint32 bossId, uint32 ringData, ObjectGuid ysGUID)
		{
			if (Creature* boss = instance->GetCreature(GetGuidData(bossId)))
			{
				/*std::string status = boss->IsAlive() ? "y esa vivo." : "y esta muerto";
				std::cout << boss->GetName() << " BOSS Existe " << status << "\n" ;*/
				if (!boss->IsAlive())
					manageKeeperImages(ringData, ysGUID);
			}
		}

		void Update(uint32 diff) override
		{
			if (_events.Empty())
			return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_UPDATE_ALGALON_TIMER:
					SaveToDB();
					DoUpdateWorldState(WORLD_STATE_ALGALON_DESPAWN_TIMER, --_algalonTimer);
					if (_algalonTimer)
						_events.ScheduleEvent(EVENT_UPDATE_ALGALON_TIMER, 60000);
					else
					{
						DoUpdateWorldState(WORLD_STATE_ALGALON_TIMER_ENABLED, 0);
						_events.CancelEvent(EVENT_UPDATE_ALGALON_TIMER);
						if (Creature* algalon = instance->GetCreature(AlgalonGUID))
						{ // poner aquí un _algalonsummoned  a false?

							/* ESTO NECESITA REVISIÓN */
							_algalonSummoned = true;
							_algalonTimer = 0;
							SaveToDB();
							algalon->AI()->DoAction(EVENT_DESPAWN_ALGALON);
						}

					}
					break;
				case EVENT_ACTIVATE_TRAIN_DOODAD_01:
					if (GameObject* doodad01 = instance->GetGameObject(uiMimironDoodadTurnAround01GUID))
					{
						doodad01->SetGoState(GO_STATE_ACTIVE);
						_events.ScheduleEvent(EVENT_ACTIVATE_TRAIN_DOODAD_01_READY, 28000);
					}
					break;
				case EVENT_ACTIVATE_TRAIN_DOODAD_02:
					if (GameObject* doodad02 = instance->GetGameObject(uiMimironDoodadTurnAround02GUID))
					{
						doodad02->SetGoState(GO_STATE_ACTIVE);
						_events.ScheduleEvent(EVENT_ACTIVATE_TRAIN_DOODAD_02_READY, 28000);
					}
					break;
				case EVENT_ACTIVATE_TRAIN_DOODAD_01_READY:
					if (GameObject* doodad01 = instance->GetGameObject(uiMimironDoodadTurnAround01GUID))
					{
						doodad01->SetGoState(GO_STATE_READY);
					}
					break;
				case EVENT_ACTIVATE_TRAIN_DOODAD_02_READY:
					if (GameObject* doodad02 = instance->GetGameObject(uiMimironDoodadTurnAround02GUID))
					{
						doodad02->SetGoState(GO_STATE_READY);
					}
					break;
				case EVENT_CHECK_KOLOGARN_DOOR:
					if (GameObject* kologarnDoor = instance->GetGameObject(KologarnDoorGUID))
					{
						if (kologarnDoor->GetGoState() != GO_STATE_ACTIVE)
						{
							if (GetBossState(BOSS_ASSEMBLY_OF_IRON) == DONE)
							{
								kologarnDoor->SetGoState(GO_STATE_ACTIVE);

								if (GameObject* archivumDoor = instance->GetGameObject(ArchivumDoorGUID))
								{
									if (archivumDoor->GetGoState() != GO_STATE_ACTIVE)
									{
										archivumDoor->SetGoState(GO_STATE_ACTIVE);
									}
								}
                                _events.CancelEvent(EVENT_CHECK_KOLOGARN_DOOR);
								break;
							}
						}
					}
					_events.ScheduleEvent(EVENT_CHECK_KOLOGARN_DOOR, 60000);
					break;
				case EVENT_KEEPER_IMAGES_CORRECTOR:

					/*

					Thanks to this method, we can transparently check the boss state through the instance, despite his real Boss State set.
					We will only check if it is alive or not, if it is not, then a procedure will start checking if their Keeper Images and Yogg-Saron's Keeper images
					are active/spawned.

					This way we will avoid the glitch upon server crashes, loading wrong (or not properly saved) data from DB regarding the specific instance's ID.

					*/



					// Timers need to be changed, this is only for testing purposes.

					//Load into memory Mimiron's grid, since it is not loaded - the instance will not be able to access to his pointer unless a player visit this area.d
					//instance->Instanceable->LoadGrid(37, 36); // It does not work correctly, need further tests.

					keeperImageControl(BOSS_MIMIRON, DATA_MIMIRON_OBSERVATION_RING, KeeperGUIDs[3]);
					keeperImageControl(BOSS_HODIR, DATA_HODIR_OBSERVATION_RING, KeeperGUIDs[1]);
					keeperImageControl(BOSS_THORIM, DATA_THORIM_OBSERVATION_RING, KeeperGUIDs[2]);
					keeperImageControl(BOSS_FREYA, DATA_FREYA_OBSERVATION_RING, KeeperGUIDs[0]);

					_events.ScheduleEvent(EVENT_KEEPER_IMAGES_CORRECTOR, 600 * IN_MILLISECONDS);
					break;
				case EVENT_FLAME_LEVIATHAN_INTRO:

					if (Creature* Leviathan = instance->GetCreature(LeviathanGUID))
						if (Creature* brannRadio = Leviathan->FindNearestCreature(34054, 300.0f))
							brannRadio->AI()->DoAction(ACTION_SAY_ULDUAR_DEFENSES); // SAY_RADIO_ULDUAR_DEFENSES, Second Colossus has been just killed.					

					_events.ScheduleEvent(EVENT_FLAME_LEVIATHAN_INTRO_2, 7 * IN_MILLISECONDS);
					break;
				case EVENT_FLAME_LEVIATHAN_INTRO_2:
					if (Creature* Leviathan = instance->GetCreature(LeviathanGUID))
						if (Creature* brannRadio = Leviathan->FindNearestCreature(34054, 300.0f))
							brannRadio->AI()->DoAction(ACTION_SAY_PRE_LEVIATHAN); // SAY_RADIO_FLAME_LEVIATHAN_1, Leviathan is going to enter right now.	

					_events.ScheduleEvent(EVENT_FLAME_LEVIATHAN_INTRO_3, 4 * IN_MILLISECONDS);
					break;
				case EVENT_FLAME_LEVIATHAN_INTRO_3:

					if (Creature* Leviathan = instance->GetCreature(LeviathanGUID))
					{
						Leviathan->AI()->DoAction(ACTION_MOVE_TO_CENTER_POSITION);
						if (Creature* brannRadio = Leviathan->FindNearestCreature(34054, 300.0f))
							brannRadio->AI()->DoAction(ACTION_SAY_EVASIVE_ACTION); // SAY_RADIO_FLAME_LEVIATHAN_2, Quicly! Evasive action! Evasive act--
					}

					if (GameObject* gameObject = instance->GetGameObject(LeviathanGateGUID))
						gameObject->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
					SaveToDB();
					break;
				default:
					break;
				}
			}
		}

	private:
		EventMap _events;
		uint32 _algalonTimer = 0;
		bool _summonAlgalon;
		bool _algalonSummoned;
		bool _summonObservationRingKeeper[4];
		bool _summonYSKeeper[4];
		uint32 _maxArmorItemLevel;
		uint32 _maxWeaponItemLevel;
		bool _mimironEngaged;

	};

	InstanceScript* GetInstanceScript(InstanceMap* map) const override
	{
		return new instance_ulduar_InstanceMapScript(map);
	}
};



class go_call_tram : public GameObjectScript
{
public:
	go_call_tram() : GameObjectScript("go_call_tram") { }

	bool OnGossipHello(Player* /*pPlayer*/, GameObject* pGo)
	{
		InstanceScript* pInstance = pGo->GetInstanceScript();

		if (!pInstance)
			return false;

		/*if (pInstance->GetBossState(BOSS_AURIAYA) != DONE)
		return false;*/

		switch (pGo->GetEntry())
		{

		case 194437: // Primero, activar hacia Spark of Imagination.   
			pInstance->SetData(DATA_CALL_TRAM, 1);
			pInstance->SetData(DATA_MIMIRON_ACTIVATE_DOODAD_TURNAROUND, 1);
			break;
		case 194912: // Spark of imagination, llamar.
			pInstance->SetData(DATA_CALL_TRAM, 1);
			pInstance->SetData(DATA_MIMIRON_ACTIVATE_DOODAD_TURNAROUND, 1);
			break;
		case 194438: // Spark of Imagination, activar hacia el principio.
			pInstance->SetData(DATA_CALL_TRAM, 0);
			pInstance->SetData(DATA_MIMIRON_ACTIVATE_DOODAD_TURNAROUND, 0);
			break;
		case 194914:  // Primero de todos, llamar.  
			pInstance->SetData(DATA_CALL_TRAM, 0);
			pInstance->SetData(DATA_MIMIRON_ACTIVATE_DOODAD_TURNAROUND, 0);
			break;
		default:
			break;
		}
		return true;
	}
};

void AddSC_instance_ulduar()
{
	new instance_ulduar();
	new go_call_tram();	
}