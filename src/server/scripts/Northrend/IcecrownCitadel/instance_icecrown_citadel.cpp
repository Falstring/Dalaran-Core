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

#include "AccountMgr.h"
#include "InstanceScript.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Transport.h"
#include "TransportMgr.h"
#include "WorldSession.h"
#include "WorldPacket.h"
#include "icecrown_citadel.h"
#include "CreatureTextMgr.h"
#include "Chat.h"

enum EventIds
{
    EVENT_PLAYERS_GUNSHIP_SPAWN     = 22663,
    EVENT_PLAYERS_GUNSHIP_COMBAT    = 22664,
    EVENT_PLAYERS_GUNSHIP_SAURFANG  = 22665,
    EVENT_ENEMY_GUNSHIP_COMBAT      = 22860,
    EVENT_ENEMY_GUNSHIP_DESPAWN     = 22861,
    EVENT_QUAKE                     = 23437,
    EVENT_SECOND_REMORSELESS_WINTER = 23507,
    EVENT_TELEPORT_TO_FROSTMOURNE   = 23617,
	EVENT_FESTERGUT_VALVE_USED      = 23438,
	EVENT_ROTFACE_VALVE_USED        = 23426,
};

enum TimedEvents
{
    EVENT_UPDATE_EXECUTION_TIME = 1,
    EVENT_QUAKE_SHATTER         = 2,
    EVENT_REBUILD_PLATFORM      = 3,
    EVENT_RESPAWN_GUNSHIP       = 4,
	EVENT_CHECK_BOSS_VISIBILITY = 5,
};

DoorData const doorData[] =
{
    {GO_LORD_MARROWGAR_S_ENTRANCE,           DATA_LORD_MARROWGAR,        DOOR_TYPE_ROOM,       BOUNDARY_N   },
    {GO_ICEWALL,                             DATA_LORD_MARROWGAR,        DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_DOODAD_ICECROWN_ICEWALL02,           DATA_LORD_MARROWGAR,        DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_ORATORY_OF_THE_DAMNED_ENTRANCE,      DATA_LADY_DEATHWHISPER,     DOOR_TYPE_ROOM,       BOUNDARY_N   },
    {GO_SAURFANG_S_DOOR,                     DATA_DEATHBRINGER_SAURFANG, DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_ORANGE_PLAGUE_MONSTER_ENTRANCE,      DATA_FESTERGUT,             DOOR_TYPE_ROOM,       BOUNDARY_E   },
    {GO_GREEN_PLAGUE_MONSTER_ENTRANCE,       DATA_ROTFACE,               DOOR_TYPE_ROOM,       BOUNDARY_E   },
    //{GO_SCIENTIST_ENTRANCE,                  DATA_PROFESSOR_PUTRICIDE,   DOOR_TYPE_ROOM,       BOUNDARY_E   },
    {GO_CRIMSON_HALL_DOOR,                   DATA_BLOOD_PRINCE_COUNCIL,  DOOR_TYPE_ROOM,       BOUNDARY_S   },
	{GO_CRIMSON_HALL_DOOR,				     DATA_BLOOD_PRINCE_TRASH,	 DOOR_TYPE_PASSAGE,	   BOUNDARY_NONE},
    {GO_BLOOD_ELF_COUNCIL_DOOR,              DATA_BLOOD_PRINCE_COUNCIL,  DOOR_TYPE_PASSAGE,    BOUNDARY_W   },
    {GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT,        DATA_BLOOD_PRINCE_COUNCIL,  DOOR_TYPE_PASSAGE,    BOUNDARY_E   },
    {GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01, DATA_BLOOD_QUEEN_LANA_THEL, DOOR_TYPE_ROOM,       BOUNDARY_S   },
    {GO_DOODAD_ICECROWN_GRATE_01,            DATA_BLOOD_QUEEN_LANA_THEL, DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_GREEN_DRAGON_BOSS_ENTRANCE,          DATA_SISTER_SVALNA,         DOOR_TYPE_PASSAGE,    BOUNDARY_S   },
    {GO_GREEN_DRAGON_BOSS_ENTRANCE,          DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_ROOM,       BOUNDARY_N   },
    {GO_GREEN_DRAGON_BOSS_EXIT,              DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_PASSAGE,    BOUNDARY_S   },
    {GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_01,  DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_N   },
    {GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_02,  DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_S   },
    {GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_03,  DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_N   },
    {GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_04,  DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_SPAWN_HOLE, BOUNDARY_S   },
    {GO_SINDRAGOSA_ENTRANCE_DOOR,            DATA_SINDRAGOSA,            DOOR_TYPE_ROOM,       BOUNDARY_S   },
	{GO_SINDRAGOSA_ENTRANCE_DOOR,            DATA_SINDRAGOSA_GAUNTLET,   DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR,   DATA_SINDRAGOSA,            DOOR_TYPE_PASSAGE,    BOUNDARY_E   },
    {GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR,       DATA_SINDRAGOSA,            DOOR_TYPE_PASSAGE,    BOUNDARY_NONE},
    {GO_ICE_WALL,                            DATA_SINDRAGOSA,            DOOR_TYPE_ROOM,       BOUNDARY_SE  },
    {GO_ICE_WALL,                            DATA_SINDRAGOSA,            DOOR_TYPE_ROOM,       BOUNDARY_SW  },
    {0,                                      0,                          DOOR_TYPE_ROOM,       BOUNDARY_NONE}  // END
};

// this doesnt have to only store questgivers, also can be used for related quest spawns
struct WeeklyQuest
{
    uint32 creatureEntry;
    uint32 questId[2];  // 10 and 25 man versions
};

// when changing the content, remember to update SetData, DATA_BLOOD_QUICKENING_STATE case for NPC_ALRIN_THE_AGILE index
WeeklyQuest const WeeklyQuestData[WeeklyNPCs] =
{
    {NPC_INFILTRATOR_MINCHAR,         {QUEST_DEPROGRAMMING_10,                 QUEST_DEPROGRAMMING_25                }}, // Deprogramming
    {NPC_KOR_KRON_LIEUTENANT,         {QUEST_SECURING_THE_RAMPARTS_10,         QUEST_SECURING_THE_RAMPARTS_25        }}, // Securing the Ramparts
    {NPC_ROTTING_FROST_GIANT_10,      {QUEST_SECURING_THE_RAMPARTS_10,         QUEST_SECURING_THE_RAMPARTS_25        }}, // Securing the Ramparts
    {NPC_ROTTING_FROST_GIANT_25,      {QUEST_SECURING_THE_RAMPARTS_10,         QUEST_SECURING_THE_RAMPARTS_25        }}, // Securing the Ramparts
    {NPC_ALCHEMIST_ADRIANNA,          {QUEST_RESIDUE_RENDEZVOUS_10,            QUEST_RESIDUE_RENDEZVOUS_25           }}, // Residue Rendezvous
    {NPC_ALRIN_THE_AGILE,             {QUEST_BLOOD_QUICKENING_10,              QUEST_BLOOD_QUICKENING_25             }}, // Blood Quickening
    {NPC_INFILTRATOR_MINCHAR_BQ,      {QUEST_BLOOD_QUICKENING_10,              QUEST_BLOOD_QUICKENING_25             }}, // Blood Quickening
    {NPC_MINCHAR_BEAM_STALKER,        {QUEST_BLOOD_QUICKENING_10,              QUEST_BLOOD_QUICKENING_25             }}, // Blood Quickening
    {NPC_VALITHRIA_DREAMWALKER_QUEST, {QUEST_RESPITE_FOR_A_TORNMENTED_SOUL_10, QUEST_RESPITE_FOR_A_TORNMENTED_SOUL_25}}  // Respite for a Tormented Soul
};

// NPCs spawned at Light's Hammer on Lich King dead
Position const JainaSpawnPos    = { -48.65278f, 2211.026f, 27.98586f, 3.124139f };
Position const MuradinSpawnPos  = { -47.34549f, 2208.087f, 27.98586f, 3.106686f };
Position const UtherSpawnPos    = { -26.58507f, 2211.524f, 30.19898f, 3.124139f };
Position const SylvanasSpawnPos = { -41.45833f, 2222.891f, 27.98586f, 3.647738f };

class instance_icecrown_citadel : public InstanceMapScript
{
    public:
        instance_icecrown_citadel() : InstanceMapScript(ICCScriptName, 631) { }

        struct instance_icecrown_citadel_InstanceMapScript : public InstanceScript
        {
            instance_icecrown_citadel_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetHeaders(DataHeader);
                SetBossNumber(EncounterCount);
                LoadDoorData(doorData);
                TeamInInstance = 0;
                HeroicAttempts = MaxHeroicAttempts;
                IsBonedEligible = true;
                IsOozeDanceEligible = true;
                IsNauseaEligible = true;
                IsOrbWhispererEligible = true;
                ColdflameJetsState = NOT_STARTED;
                UpperSpireTeleporterActiveState = NOT_STARTED;
                BloodQuickeningState = NOT_STARTED;
				PutricideEventProgress = 0;
                BloodQuickeningMinutes = 0;
				BloodPrinceTrashCount = 0;

				IsPutricideHeroicKilled = 0;
				IsBloodQueenHeroicKilled = 0;
				IsSindragosaHeroicKilled = 0;

				disableTirionGossipHeroic = false;
				needToCheckVisibility = false;

				WeeklyQuestId10 = 0;
				IsBuffAvailable = true;
				memset(&WeeklyQuestNpcGUID, 0, sizeof(WeeklyQuestNpcGUID));

				LichKingRandomWhisperTimer = 120 * IN_MILLISECONDS;

            }

            // A function to help reduce the number of lines for teleporter management.
            void SetTeleporterState(GameObject* go, bool usable)
            {
                if (usable)
                {
                    go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    go->SetGoState(GO_STATE_ACTIVE);
                }
                else
                {
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                    go->SetGoState(GO_STATE_READY);
                }
            }

            void FillInitialWorldStates(WorldPacket& data) override
            {
                data << uint32(WORLDSTATE_SHOW_TIMER)         << uint32(BloodQuickeningState == IN_PROGRESS);
                data << uint32(WORLDSTATE_EXECUTION_TIME)     << uint32(BloodQuickeningMinutes);
                data << uint32(WORLDSTATE_SHOW_ATTEMPTS)      << uint32(instance->IsHeroic());
                data << uint32(WORLDSTATE_ATTEMPTS_REMAINING) << uint32(HeroicAttempts);
                data << uint32(WORLDSTATE_ATTEMPTS_MAX)       << uint32(MaxHeroicAttempts);
            }

            void OnPlayerEnter(Player* player) override
            {

                if (!TeamInInstance)
                    TeamInInstance = player->GetTeam();

                if (GetBossState(DATA_LADY_DEATHWHISPER) == DONE && GetBossState(DATA_ICECROWN_GUNSHIP_BATTLE) != DONE)
                    SpawnGunship();
            }

			void HideBoss(ObjectGuid bossGUID)
			{
				if (Creature* boss = instance->GetCreature(bossGUID))
				{
					if (boss->IsVisible() && boss->IsAlive())
					{
						boss->SetVisible(false);
						boss->setFaction(2007);
						boss->SetReactState(REACT_PASSIVE);

						//Special for Arthas so the gossip can not be activated on Heroic mode upon reaching 0 attempts, a part of Arthas being disabled.
						if (boss->GetEntry() == NPC_THE_LICH_KING)
							disableTirionGossipHeroic = true;
					}
				}
			}

			void HideAllBosses() // MEJOR HACER UN HIDE BOSSES GENERAL, QUE HAGA A TODOS.
			{
				HideBoss(ProfessorPutricideGUID);
				HideBoss(BloodQueenLanaThelGUID);
				HideBoss(SindragosaGUID);
				HideBoss(TheLichKingGUID);
			}

			void UnhideBoss(ObjectGuid bossGUID)
			{
				if (Creature* boss = instance->GetCreature(bossGUID))
				{
					if (!boss->IsVisible() && boss->IsAlive())
					{
						boss->SetVisible(true);

						switch (boss->GetEntry())
						{
						case NPC_PROFESSOR_PUTRICIDE:
							boss->setFaction(14);
							break;
						case NPC_BLOOD_QUEEN_LANA_THEL:
							boss->setFaction(16);
							break;
						case NPC_SINDRAGOSA:
							boss->setFaction(2068);
							break;
						case NPC_THE_LICH_KING:
							boss->setFaction(974);
							break;
						default:
							break;
						}

						boss->SetReactState(REACT_AGGRESSIVE);
						//boss->AI()->Reset();
					}
				}
			}

			void UnhideAllBosses() // MEJOR HACER UN HIDE BOSSES GENERAL, QUE HAGA A TODOS. SI EL BOSS NO ESTA DONE Y TAL
			{
				UnhideBoss(ProfessorPutricideGUID);
				UnhideBoss(BloodQueenLanaThelGUID);
				UnhideBoss(SindragosaGUID);
				UnhideBoss(TheLichKingGUID);
			}

			void ManageBossesVisibility()
			{
				if (instance->IsHeroic())
				{
					if (!HeroicAttempts) // When switching from Normal to Heroic and the boss is available, we must disable him for Heroic.
						HideAllBosses();
					else
						UnhideAllBosses(); // Not really needed, just in case.
				}
				else
				{
					if (!HeroicAttempts) // Make the boss available for normal even if he was disabled for heroic mode.
						UnhideAllBosses();
				}
			}

            void OnCreatureCreate(Creature* creature) override
            {
                if (!TeamInInstance)
                {
                    Map::PlayerList const &players = instance->GetPlayers();
                    if (!players.isEmpty())
                        if (Player* player = players.begin()->GetSource())
                            TeamInInstance = player->GetTeam();
                }


				// apply ICC buff to pets/summons
				if (GetData(DATA_BUFF_AVAILABLE) && ObjectAccessor::FindPlayer(creature->GetOwnerGUID()) && creature->HasUnitTypeMask(UNIT_MASK_MINION | UNIT_MASK_GUARDIAN | UNIT_MASK_CONTROLABLE_GUARDIAN) && creature->CanHaveThreatList())
					if (Unit* owner = creature->GetOwner())
						if (Player* plr = owner->ToPlayer())
						{
							SpellAreaForAreaMapBounds saBounds = sSpellMgr->GetSpellAreaForAreaMapBounds(4812);
							for (SpellAreaForAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
								if ((itr->second->raceMask & plr->getRaceMask()) && !creature->HasAura(itr->second->spellId))
									if (const SpellInfo* si = sSpellMgr->GetSpellInfo(itr->second->spellId))
										if (si->HasAura(SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT))
											creature->AddAura(itr->second->spellId, creature);
						}

				// allow creating all of them, because after killing Marrowgar some have to appear, so just hide them
				switch (creature->GetEntry())
				{
				case NPC_INFILTRATOR_MINCHAR:
				case NPC_KOR_KRON_LIEUTENANT:
				case NPC_ALCHEMIST_ADRIANNA:
				case NPC_ALRIN_THE_AGILE:
				case NPC_INFILTRATOR_MINCHAR_BQ:
				case NPC_MINCHAR_BEAM_STALKER:
				case NPC_VALITHRIA_DREAMWALKER_QUEST:
					for (uint8 i = 0; i < WeeklyNPCs; ++i)
						if (WeeklyQuestData[i].creatureEntry == creature->GetEntry())
						{
							WeeklyQuestNpcGUID[i] = creature->GetGUID();
							if (WeeklyQuestId10 != WeeklyQuestData[i].questId[0])
								creature->SetVisible(false);
							else if (WeeklyQuestData[i].creatureEntry == NPC_VALITHRIA_DREAMWALKER_QUEST && GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
								creature->SetVisible(false);
						}
					break;
				}

                switch (creature->GetEntry())
                {
                    case NPC_LORD_MARROWGAR:
                        LordMarrowgarGUID = creature->GetGUID();
                        break;
                    case NPC_LADY_DEATHWHISPER:
                        LadyDeahtwhisperGUID = creature->GetGUID();
                        break;
                    case NPC_KOR_KRON_GENERAL:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_ALLIANCE_COMMANDER);
                        break;
                    case NPC_KOR_KRON_LIEUTENANT:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SKYBREAKER_LIEUTENANT);
                        break;
                    case NPC_TORTUNOK:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_ALANA_MOONSTRIKE);
                        break;
                    case NPC_GERARDO_THE_SUAVE:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_TALAN_MOONSTRIKE);
                        break;
                    case NPC_UVLUS_BANEFIRE:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_MALFUS_GRIMFROST);
                        break;
                    case NPC_IKFIRUS_THE_VILE:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_YILI);
                        break;
                    case NPC_VOL_GUK:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_JEDEBIA);
                        break;
                    case NPC_HARAGG_THE_UNSEEN:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_NIBY_THE_ALMIGHTY);
                        break;
                    case NPC_GARROSH_HELLSCREAM:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_KING_VARIAN_WRYNN);
                        break;
                    case NPC_DEATHBRINGER_SAURFANG:
                        DeathbringerSaurfangGUID = creature->GetGUID();
                        break;
                    case NPC_ALLIANCE_GUNSHIP_CANNON:
                    case NPC_HORDE_GUNSHIP_CANNON:
                        creature->SetControlled(true, UNIT_STATE_ROOT);
                        break;
                    case NPC_SE_HIGH_OVERLORD_SAURFANG:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SE_MURADIN_BRONZEBEARD, creature->GetCreatureData());
                        // no break;
                    case NPC_SE_MURADIN_BRONZEBEARD:
                        DeathbringerSaurfangEventGUID = creature->GetGUID();
                        creature->LastUsedScriptID = creature->GetScriptId();
                        break;
                    case NPC_SE_KOR_KRON_REAVER:
                        if (TeamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SE_SKYBREAKER_MARINE);
                        break;
					case NPC_MARTYR_STALKER_IGB_SAURFANG:
						DeathbringerEndEventTriggerGUID = creature->GetGUID();
						break;
                    case NPC_FESTERGUT:
                        FestergutGUID = creature->GetGUID();
                        break;
                    case NPC_ROTFACE:
                        RotfaceGUID = creature->GetGUID();
                        break;
                    case NPC_PROFESSOR_PUTRICIDE:
                        ProfessorPutricideGUID = creature->GetGUID();
						needToCheckVisibility = true;
						Events.RescheduleEvent(EVENT_CHECK_BOSS_VISIBILITY, 10000);
                        break;
                    case NPC_PRINCE_KELESETH:
                        BloodCouncilGUIDs[0] = creature->GetGUID();
                        break;
                    case NPC_PRINCE_TALDARAM:
                        BloodCouncilGUIDs[1] = creature->GetGUID();
                        break;
                    case NPC_PRINCE_VALANAR:
                        BloodCouncilGUIDs[2] = creature->GetGUID();
                        break;
                    case NPC_BLOOD_ORB_CONTROLLER:
                        BloodCouncilControllerGUID = creature->GetGUID();
                        break;
                    case NPC_BLOOD_QUEEN_LANA_THEL_COUNCIL:
                        BloodQueenLanaThelCouncilGUID = creature->GetGUID();
                        break;
                    case NPC_BLOOD_QUEEN_LANA_THEL:
                        BloodQueenLanaThelGUID = creature->GetGUID();
						needToCheckVisibility = true;
						Events.RescheduleEvent(EVENT_CHECK_BOSS_VISIBILITY, 10000);
                        break;
                    case NPC_CROK_SCOURGEBANE:
                        CrokScourgebaneGUID = creature->GetGUID();
                        break;
                    // we can only do this because there are no gaps in their entries
                    case NPC_CAPTAIN_ARNATH:
                    case NPC_CAPTAIN_BRANDON:
                    case NPC_CAPTAIN_GRONDEL:
                    case NPC_CAPTAIN_RUPERT:
                        CrokCaptainGUIDs[creature->GetEntry()-NPC_CAPTAIN_ARNATH] = creature->GetGUID();
                        break;
                    case NPC_SISTER_SVALNA:
                        SisterSvalnaGUID = creature->GetGUID();
                        break;
                    case NPC_VALITHRIA_DREAMWALKER:
                        ValithriaDreamwalkerGUID = creature->GetGUID();
                        break;
                    case NPC_THE_LICH_KING_VALITHRIA:
                        ValithriaLichKingGUID = creature->GetGUID();
                        break;
                    case NPC_GREEN_DRAGON_COMBAT_TRIGGER:
                        ValithriaTriggerGUID = creature->GetGUID();
                        break;
					case NPC_SINDRAGOSA_GAUNTLET:
						SindragosaGauntletGUID = creature->GetGUID();
						break;
                    case NPC_SINDRAGOSA:
                        SindragosaGUID = creature->GetGUID();
						needToCheckVisibility = true;
						Events.RescheduleEvent(EVENT_CHECK_BOSS_VISIBILITY, 10000);
                        break;
                    case NPC_SPINESTALKER:
                        SpinestalkerGUID = creature->GetGUID();
                        break;
                    case NPC_RIMEFANG:
                        RimefangGUID = creature->GetGUID();
                        break;
                    case NPC_INVISIBLE_STALKER:
                        // Teleporter visual at center
                        if (creature->GetExactDist2d(4357.052f, 2769.421f) < 10.0f)
                            creature->CastSpell(creature, SPELL_ARTHAS_TELEPORTER_CEREMONY, false);
                        break;
                    case NPC_THE_LICH_KING:
                        TheLichKingGUID = creature->GetGUID();
						needToCheckVisibility = true;
						Events.RescheduleEvent(EVENT_CHECK_BOSS_VISIBILITY, 10000);
                        break;
                    case NPC_HIGHLORD_TIRION_FORDRING_LK:
                        HighlordTirionFordringGUID = creature->GetGUID();
                        break;
                    case NPC_TERENAS_MENETHIL_FROSTMOURNE:
                    case NPC_TERENAS_MENETHIL_FROSTMOURNE_H:
                        TerenasMenethilGUID = creature->GetGUID();
                        break;
                    case NPC_WICKED_SPIRIT:
                        // Remove corpse as soon as it dies (and respawn 10 seconds later)
                        creature->SetCorpseDelay(0);
                        creature->SetReactState(REACT_PASSIVE);
                        break;
					case NPC_PUTRICADES_TRAP:
						PutricadeTrapGUID = creature->GetGUID();
						break;
					case NPC_DEATHBOUND_WARD:
						creature->AddAura(SPELL_STONEFORM, creature);
						break;
                    default:
                        break;
                }
            }

            void OnCreatureRemove(Creature* creature) override
            {
                if (creature->GetEntry() == NPC_SINDRAGOSA)
                    SindragosaGUID.Clear();
            }

            // Weekly quest spawn prevention
            uint32 GetCreatureEntry(ObjectGuid::LowType /*guidLow*/, CreatureData const* data) override
            {
                uint32 entry = data->id;
                switch (entry)
                {
                    /*case NPC_INFILTRATOR_MINCHAR:
                    case NPC_KOR_KRON_LIEUTENANT:
                    case NPC_ALCHEMIST_ADRIANNA:
                    case NPC_ALRIN_THE_AGILE:
                    case NPC_INFILTRATOR_MINCHAR_BQ:
                    case NPC_MINCHAR_BEAM_STALKER:
                    case NPC_VALITHRIA_DREAMWALKER_QUEST:
                    {
                        for (uint8 questIndex = 0; questIndex < WeeklyNPCs; ++questIndex)
                        {
                            if (WeeklyQuestData[questIndex].creatureEntry == entry)
                            {
                                uint8 diffIndex = uint8(instance->GetSpawnMode() & 1);
                                if (!sPoolMgr->IsSpawnedObject<Quest>(WeeklyQuestData[questIndex].questId[diffIndex]))
                                    return 0;
                                break;
                            }
                        }
                        break;
                    }*/
                    case NPC_HORDE_GUNSHIP_CANNON:
                    case NPC_ORGRIMS_HAMMER_CREW:
                    case NPC_SKY_REAVER_KORM_BLACKSCAR:
                        if (TeamInInstance == ALLIANCE)
                            return 0;
                        break;
                    case NPC_ALLIANCE_GUNSHIP_CANNON:
                    case NPC_SKYBREAKER_DECKHAND:
                    case NPC_HIGH_CAPTAIN_JUSTIN_BARTLETT:
                        if (TeamInInstance == HORDE)
                            return 0;
                        break;
                    case NPC_ZAFOD_BOOMBOX:
                        if (GameObjectTemplate const* go = sObjectMgr->GetGameObjectTemplate(GO_THE_SKYBREAKER_A))
                            if ((TeamInInstance == ALLIANCE && data->mapid == go->moTransport.mapID) ||
                                (TeamInInstance == HORDE && data->mapid != go->moTransport.mapID))
                                return entry;
                        return 0;
                    case NPC_IGB_MURADIN_BRONZEBEARD:
                        if ((TeamInInstance == ALLIANCE && data->posX > 10.0f) ||
                            (TeamInInstance == HORDE && data->posX < 10.0f))
                            return entry;
                        return 0;
                    default:
                        break;
                }

                return entry;
            }

            uint32 GetGameObjectEntry(ObjectGuid::LowType /*guidLow*/, uint32 entry) override
            {
                switch (entry)
                {
                    case GO_GUNSHIP_ARMORY_H_10N:
                    case GO_GUNSHIP_ARMORY_H_25N:
                    case GO_GUNSHIP_ARMORY_H_10H:
                    case GO_GUNSHIP_ARMORY_H_25H:
                        if (TeamInInstance == ALLIANCE)
                            return 0;
                        break;
                    case GO_GUNSHIP_ARMORY_A_10N:
                    case GO_GUNSHIP_ARMORY_A_25N:
                    case GO_GUNSHIP_ARMORY_A_10H:
                    case GO_GUNSHIP_ARMORY_A_25H:
                        if (TeamInInstance == HORDE)
                            return 0;
                        break;
                    default:
                        break;
                }

                return entry;
            }

            void OnUnitDeath(Unit* unit) override
            {
                Creature* creature = unit->ToCreature();
                if (!creature)
                    return;

                switch (creature->GetEntry())
                {
                    case NPC_YMIRJAR_BATTLE_MAIDEN:
                    case NPC_YMIRJAR_DEATHBRINGER:
                    case NPC_YMIRJAR_FROSTBINDER:
                    case NPC_YMIRJAR_HUNTRESS:
                    case NPC_YMIRJAR_WARLORD:
                        if (Creature* crok = instance->GetCreature(CrokScourgebaneGUID))
                            crok->AI()->SetGUID(creature->GetGUID(), ACTION_VRYKUL_DEATH);
                        break;
                    case NPC_FROSTWING_WHELP:
                        if (FrostwyrmGUIDs.empty())
                            return;

                        if (creature->AI()->GetData(1/*DATA_FROSTWYRM_OWNER*/) == DATA_SPINESTALKER)
                        {
                            SpinestalkerTrash.erase(creature->GetSpawnId());
                            if (SpinestalkerTrash.empty())
                                if (Creature* spinestalk = instance->GetCreature(SpinestalkerGUID))
                                    spinestalk->AI()->DoAction(ACTION_START_FROSTWYRM);
                        }
                        else
                        {
                            RimefangTrash.erase(creature->GetSpawnId());
                            if (RimefangTrash.empty())
                                if (Creature* spinestalk = instance->GetCreature(RimefangGUID))
                                    spinestalk->AI()->DoAction(ACTION_START_FROSTWYRM);
                        }
                        break;
                    case NPC_RIMEFANG:
                    case NPC_SPINESTALKER:
                    {
                        if (instance->IsHeroic() && !HeroicAttempts)
                            return;

                        if (GetBossState(DATA_SINDRAGOSA) == DONE)
                            return;

                        FrostwyrmGUIDs.erase(creature->GetSpawnId());
                        if (FrostwyrmGUIDs.empty())
                        {
                            instance->LoadGrid(SindragosaSpawnPos.GetPositionX(), SindragosaSpawnPos.GetPositionY());
                            if (Creature* boss = instance->SummonCreature(NPC_SINDRAGOSA, SindragosaSpawnPos))
                                boss->AI()->DoAction(ACTION_START_FROSTWYRM);
                        }
                        break;
                    }
                    default:
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
				case GO_SPIRIT_ALARM_1:
				case GO_SPIRIT_ALARM_2:
				case GO_SPIRIT_ALARM_3:
				case GO_SPIRIT_ALARM_4:
				{
					Position pos[4 * 3] = { { -160.96f, 2210.46f, 35.24f, 0.0f }, { -176.27f, 2201.93f, 35.24f, 0.0f }, { -207.83f, 2207.38f, 35.24f, 0.0f },
					{ -178.41f, 2225.11f, 35.24f, 0.0f }, { -195.23f, 2221.55f, 35.24f, 0.0f }, { -209.94f, 2250.34f, 37.99f, 0.0f },
					{ -289.80f, 2216.60f, 42.39f, 0.0f }, { -317.76f, 2216.11f, 42.57f, 0.0f }, { -301.07f, 2216.62f, 42.0f, 0.0f },
					{ -276.07f, 2206.76f, 42.57f, 0.0f }, { -304.44f, 2199.11f, 41.99f, 0.0f }, { -292.82f, 2204.61f, 42.02f, 0.0f } };
					go->SetPosition(pos[3 * (go->GetEntry() - GO_SPIRIT_ALARM_1) + urand(0, 2)]);
				}
				break;
				case GO_GEIST_ALARM_1:
				case GO_GEIST_ALARM_2:
					go->SetPosition(go->GetPositionX() + urand(0, 2)*20.0f*(go->GetEntry() == GO_GEIST_ALARM_1 ? -1.0f : 1.0f), go->GetPositionY(), go->GetPositionZ(), go->GetOrientation());
					break;
				case GO_SINDRAGOSA_ENTRANCE_DOOR:
					AddDoor(go, true);
					SindragosaDoorGUID = go->GetGUID();
					break;
                    case GO_DOODAD_ICECROWN_ICEWALL02:
                    case GO_ICEWALL:
                    case GO_LORD_MARROWGAR_S_ENTRANCE:
                    case GO_ORATORY_OF_THE_DAMNED_ENTRANCE:
                    case GO_ORANGE_PLAGUE_MONSTER_ENTRANCE:
                    case GO_GREEN_PLAGUE_MONSTER_ENTRANCE:
                    case GO_CRIMSON_HALL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT:
                    case GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01:
                    case GO_DOODAD_ICECROWN_GRATE_01:
                    case GO_GREEN_DRAGON_BOSS_ENTRANCE:
                    case GO_GREEN_DRAGON_BOSS_EXIT:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_02:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_03:
                    case GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR:
                    case GO_ICE_WALL:
                        AddDoor(go, true);
                        break;
                    // these 2 gates are functional only on 25man modes
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_01:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_04:
                        if (instance->Is25ManRaid())
                            AddDoor(go, true);
                        break;
                    case GO_LADY_DEATHWHISPER_ELEVATOR:
                        LadyDeathwisperElevatorGUID = go->GetGUID();
                        if (GetBossState(DATA_LADY_DEATHWHISPER) == DONE)
                        {
                            go->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                            go->SetGoState(GO_STATE_READY);
                        }
                        break;
                    case GO_THE_SKYBREAKER_H:
                    case GO_ORGRIMS_HAMMER_A:
                        EnemyGunshipGUID = go->GetGUID();
                        break;
                    case GO_GUNSHIP_ARMORY_H_10N:
                    case GO_GUNSHIP_ARMORY_H_25N:
                    case GO_GUNSHIP_ARMORY_H_10H:
                    case GO_GUNSHIP_ARMORY_H_25H:
                    case GO_GUNSHIP_ARMORY_A_10N:
                    case GO_GUNSHIP_ARMORY_A_25N:
                    case GO_GUNSHIP_ARMORY_A_10H:
                    case GO_GUNSHIP_ARMORY_A_25H:
                        GunshipArmoryGUID = go->GetGUID();
                        break;
                    case GO_SAURFANG_S_DOOR:
                        DeathbringerSaurfangDoorGUID = go->GetGUID();
                        AddDoor(go, true);
                        break;
                    case GO_DEATHBRINGER_S_CACHE_10N:
                    case GO_DEATHBRINGER_S_CACHE_25N:
                    case GO_DEATHBRINGER_S_CACHE_10H:
                    case GO_DEATHBRINGER_S_CACHE_25H:
                        DeathbringersCacheGUID = go->GetGUID();
                        break;
                    case GO_SCOURGE_TRANSPORTER_LICHKING:
                        TeleporterLichKingGUID = go->GetGUID();
                        if (GetBossState(DATA_PROFESSOR_PUTRICIDE) == DONE && GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) == DONE && GetBossState(DATA_SINDRAGOSA) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        break;
                    case GO_SCOURGE_TRANSPORTER_UPPERSPIRE:
                        TeleporterUpperSpireGUID = go->GetGUID();
                        if (GetBossState(DATA_DEATHBRINGER_SAURFANG) != DONE || GetData(DATA_UPPERSPIRE_TELE_ACT) != DONE)
                            SetTeleporterState(go, false);
                        else
                            SetTeleporterState(go, true);
                        break;
                    case GO_SCOURGE_TRANSPORTER_LIGHTSHAMMER:
                        TeleporterLightsHammerGUID = go->GetGUID();
                        SetTeleporterState(go, GetBossState(DATA_LORD_MARROWGAR) == DONE);
                        break;
                    case GO_SCOURGE_TRANSPORTER_RAMPART:
                        TeleporterRampartsGUID = go->GetGUID();
                        SetTeleporterState(go, GetBossState(DATA_LADY_DEATHWHISPER) == DONE);
                        break;
                    case GO_SCOURGE_TRANSPORTER_DEATHBRINGER:
                        TeleporterDeathBringerGUID = go->GetGUID();
                        SetTeleporterState(go, GetBossState(DATA_ICECROWN_GUNSHIP_BATTLE) == DONE);
                        break;
                    case GO_SCOURGE_TRANSPORTER_ORATORY:
                        TeleporterOratoryGUID = go->GetGUID();
                        SetTeleporterState(go, GetBossState(DATA_LORD_MARROWGAR) == DONE);
                        break;
                    case GO_SCOURGE_TRANSPORTER_SINDRAGOSA:
                        TeleporterSindragosaGUID = go->GetGUID();
                        SetTeleporterState(go, GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE);
                        break;
                    case GO_PLAGUE_SIGIL:
                        PlagueSigilGUID = go->GetGUID();
                        if (GetBossState(DATA_PROFESSOR_PUTRICIDE) == DONE)
                            HandleGameObject(PlagueSigilGUID, false, go);
                        break;
                    case GO_BLOODWING_SIGIL:
                        BloodwingSigilGUID = go->GetGUID();
                        if (GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) == DONE)
                            HandleGameObject(BloodwingSigilGUID, false, go);
                        break;
                    case GO_SIGIL_OF_THE_FROSTWING:
                        FrostwingSigilGUID = go->GetGUID();
                        if (GetBossState(DATA_SINDRAGOSA) == DONE)
                            HandleGameObject(FrostwingSigilGUID, false, go);
                        break;
                    case GO_SCIENTIST_AIRLOCK_DOOR_COLLISION:
						PutricideCollisionGUID = go->GetGUID();
						HandleGameObject(PutricideCollisionGUID, ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE)), go);
						break;
                    case GO_SCIENTIST_AIRLOCK_DOOR_ORANGE:
						PutricideGateGUIDs[0] = go->GetGUID();
						if ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE))
							go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
						else
							HandleGameObject(PutricideGateGUIDs[0], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE), go);
						break;
					case GO_SCIENTIST_AIRLOCK_DOOR_GREEN:
						PutricideGateGUIDs[1] = go->GetGUID();
						if ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE))
							go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
						else
							HandleGameObject(PutricideGateGUIDs[1], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE), go);
						break;
                    case GO_DOODAD_ICECROWN_ORANGETUBES02:
                        PutricidePipeGUIDs[0] = go->GetGUID();
                        if (GetBossState(DATA_FESTERGUT) == DONE)
                            HandleGameObject(PutricidePipeGUIDs[0], true, go);
                        break;
                    case GO_DOODAD_ICECROWN_GREENTUBES02:
                        PutricidePipeGUIDs[1] = go->GetGUID();
                        if (GetBossState(DATA_ROTFACE) == DONE)
                            HandleGameObject(PutricidePipeGUIDs[1], true, go);
                        break;
                    case GO_DRINK_ME:
                        PutricideTableGUID = go->GetGUID();
                        break;
                    case GO_CACHE_OF_THE_DREAMWALKER_10N:
                    case GO_CACHE_OF_THE_DREAMWALKER_25N:
                    case GO_CACHE_OF_THE_DREAMWALKER_10H:
                    case GO_CACHE_OF_THE_DREAMWALKER_25H:
                        if (Creature* valithria = instance->GetCreature(ValithriaDreamwalkerGUID))
                            go->SetLootRecipient(valithria->GetLootRecipient());
                        go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED | GO_FLAG_NOT_SELECTABLE | GO_FLAG_NODESPAWN);
                        break;
                    case GO_ARTHAS_PLATFORM:
                        // this enables movement at The Frozen Throne, when printed this value is 0.000000f
                        // however, when represented as integer client will accept only this value
                        go->SetUInt32Value(GAMEOBJECT_PARENTROTATION, 5535469);
                        ArthasPlatformGUID = go->GetGUID();
                        break;
                    case GO_ARTHAS_PRECIPICE:
                        go->SetUInt32Value(GAMEOBJECT_PARENTROTATION, 4178312);
                        ArthasPrecipiceGUID = go->GetGUID();
                        break;
                    case GO_DOODAD_ICECROWN_THRONEFROSTYEDGE01:
                        FrozenThroneEdgeGUID = go->GetGUID();
                        break;
                    case GO_DOODAD_ICECROWN_THRONEFROSTYWIND01:
                        FrozenThroneWindGUID = go->GetGUID();
                        break;
                    case GO_DOODAD_ICECROWN_SNOWEDGEWARNING01:
                        FrozenThroneWarningGUID = go->GetGUID();
                        break;
                    case GO_FROZEN_LAVAMAN:
                        FrozenBolvarGUID = go->GetGUID();
                        if (GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetRespawnTime(7 * DAY);
                        break;
                    case GO_LAVAMAN_PILLARS_CHAINED:
                        PillarsChainedGUID = go->GetGUID();
                        if (GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetRespawnTime(7 * DAY);
                        break;
                    case GO_LAVAMAN_PILLARS_UNCHAINED:
                        PillarsUnchainedGUID = go->GetGUID();
                        if (GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetRespawnTime(7 * DAY);
                        break;
					case GO_SCIENTIST_ENTRANCE:
						PutricideEnteranceDoorGUID = go->GetGUID();
						HandleGameObject(PutricideEnteranceDoorGUID, PutricideEventProgress & PUTRICIDE_EVENT_FLAG_TRAP_FINISHED, go);
						break;
					case GO_GAS_RELEASE_VALVE:
						GasReleaseValveGUID = go->GetGUID();
						if (GetBossState(DATA_FESTERGUT) != DONE)
							go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND | GO_FLAG_NOT_SELECTABLE);
						break;
					case GO_OOZE_RELEASE_VALVE:
						OozeReleaseValveGUID = go->GetGUID();
						if (GetBossState(DATA_ROTFACE) != DONE)
							go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND | GO_FLAG_NOT_SELECTABLE);
						break;
                    default:
                        break;
                }
            }

            void OnGameObjectRemove(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                    case GO_DOODAD_ICECROWN_ICEWALL02:
                    case GO_ICEWALL:
                    case GO_LORD_MARROWGAR_S_ENTRANCE:
                    case GO_ORATORY_OF_THE_DAMNED_ENTRANCE:
                    case GO_SAURFANG_S_DOOR:
                    case GO_ORANGE_PLAGUE_MONSTER_ENTRANCE:
                    case GO_GREEN_PLAGUE_MONSTER_ENTRANCE:
                    case GO_SCIENTIST_ENTRANCE:
                    case GO_CRIMSON_HALL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT:
                    case GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01:
                    case GO_DOODAD_ICECROWN_GRATE_01:
                    case GO_GREEN_DRAGON_BOSS_ENTRANCE:
                    case GO_GREEN_DRAGON_BOSS_EXIT:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_01:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_02:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_03:
                    case GO_DOODAD_ICECROWN_ROOSTPORTCULLIS_04:
                    case GO_SINDRAGOSA_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR:
                    case GO_ICE_WALL:
                        AddDoor(go, false);
                        break;
                    case GO_THE_SKYBREAKER_A:
                    case GO_ORGRIMS_HAMMER_H:
                        GunshipGUID.Clear();
                        break;
                    default:
                        break;
                }
            }

            uint32 GetData(uint32 type) const override
            {
                switch (type)
                {
				    case DATA_BUFF_AVAILABLE:
					    return (IsBuffAvailable ? 1 : 0);
					case DATA_WEEKLY_QUEST_ID:
						return WeeklyQuestId10;
                    case DATA_SINDRAGOSA_FROSTWYRMS:
                        return FrostwyrmGUIDs.size();
                    case DATA_SPINESTALKER:
                        return SpinestalkerTrash.size();
                    case DATA_RIMEFANG:
                        return RimefangTrash.size();
                    case DATA_COLDFLAME_JETS:
                        return ColdflameJetsState;
                    case DATA_UPPERSPIRE_TELE_ACT:
                        return UpperSpireTeleporterActiveState;
                    case DATA_TEAM_IN_INSTANCE:
                        return TeamInInstance;
                    case DATA_BLOOD_QUICKENING_STATE:
                        return BloodQuickeningState;
                    case DATA_HEROIC_ATTEMPTS:
                        return HeroicAttempts;
					case DATA_PUTRICIDE_TRAP_STATE:
						if (!(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) || !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE))
							return TO_BE_DECIDED;
						if (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_TRAP_INPROGRESS)
							return IN_PROGRESS;
						if (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_TRAP_FINISHED)
							return DONE;
						return NOT_STARTED;
					case DATA_SINDRAGOSA_GAUNTLET:
						return SindragosaGauntletEventProgress;
					case 78:
						return TeamInInstance;
					case DATA_IS_LK_HEROIC_ENGAGEABLE:
						if (IsPutricideHeroicKilled && IsBloodQueenHeroicKilled && IsSindragosaHeroicKilled && !disableTirionGossipHeroic)
							return 3;
						else
							return 0;
						break;
                    default:
                        break;
                }

                return 0;
            }

            ObjectGuid GetGuidData(uint32 type) const override
            {
                switch (type)
                {
                    case DATA_LORD_MARROWGAR:
                        return LordMarrowgarGUID;
                    case DATA_LADY_DEATHWHISPER:
                        return LadyDeahtwhisperGUID;
                    case DATA_ICECROWN_GUNSHIP_BATTLE:
                        return GunshipGUID;
                    case DATA_ENEMY_GUNSHIP:
                        return EnemyGunshipGUID;
                    case DATA_DEATHBRINGER_SAURFANG:
                        return DeathbringerSaurfangGUID;
                    case DATA_SAURFANG_EVENT_NPC:
                        return DeathbringerSaurfangEventGUID;
					case NPC_MARTYR_STALKER_IGB_SAURFANG:
						return DeathbringerEndEventTriggerGUID;
                    case GO_SAURFANG_S_DOOR:
                        return DeathbringerSaurfangDoorGUID;
                    case DATA_FESTERGUT:
                        return FestergutGUID;
                    case DATA_ROTFACE:
                        return RotfaceGUID;
                    case DATA_PROFESSOR_PUTRICIDE:
                        return ProfessorPutricideGUID;
                    case DATA_PUTRICIDE_TABLE:
                        return PutricideTableGUID;
                    case DATA_PRINCE_KELESETH_GUID:
                        return BloodCouncilGUIDs[0];
                    case DATA_PRINCE_TALDARAM_GUID:
                        return BloodCouncilGUIDs[1];
                    case DATA_PRINCE_VALANAR_GUID:
                        return BloodCouncilGUIDs[2];
                    case DATA_BLOOD_PRINCES_CONTROL:
                        return BloodCouncilControllerGUID;
                    case DATA_BLOOD_QUEEN_LANA_THEL_COUNCIL:
                        return BloodQueenLanaThelCouncilGUID;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        return BloodQueenLanaThelGUID;
                    case DATA_CROK_SCOURGEBANE:
                        return CrokScourgebaneGUID;
                    case DATA_CAPTAIN_ARNATH:
                    case DATA_CAPTAIN_BRANDON:
                    case DATA_CAPTAIN_GRONDEL:
                    case DATA_CAPTAIN_RUPERT:
                        return CrokCaptainGUIDs[type - DATA_CAPTAIN_ARNATH];
                    case DATA_SISTER_SVALNA:
                        return SisterSvalnaGUID;
                    case DATA_VALITHRIA_DREAMWALKER:
                        return ValithriaDreamwalkerGUID;
                    case DATA_VALITHRIA_LICH_KING:
                        return ValithriaLichKingGUID;
                    case DATA_VALITHRIA_TRIGGER:
                        return ValithriaTriggerGUID;
                    case DATA_SINDRAGOSA:
                        return SindragosaGUID;
                    case DATA_SPINESTALKER:
                        return SpinestalkerGUID;
                    case DATA_RIMEFANG:
                        return RimefangGUID;
                    case DATA_THE_LICH_KING:
                        return TheLichKingGUID;
                    case DATA_HIGHLORD_TIRION_FORDRING:
                        return HighlordTirionFordringGUID;
                    case DATA_ARTHAS_PLATFORM:
                        return ArthasPlatformGUID;
                    case DATA_TERENAS_MENETHIL:
                        return TerenasMenethilGUID;
					case NPC_PUTRICADES_TRAP:
						return PutricadeTrapGUID;
					case NPC_SINDRAGOSA_GAUNTLET:
						return SindragosaGauntletGUID;
                    default:
                        break;
                }

                return ObjectGuid::Empty;
            }

            bool SetBossState(uint32 type, EncounterState state) override
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                switch (type)
                {
                    case DATA_LORD_MARROWGAR:
                    {
                        if (state == DONE)
                        {
							WeeklyQuestId10 = RAND(QUEST_BLOOD_QUICKENING_10, QUEST_RESIDUE_RENDEZVOUS_10, QUEST_RESPITE_FOR_A_TORNMENTED_SOUL_10, QUEST_DEPROGRAMMING_10, QUEST_SECURING_THE_RAMPARTS_10);
							SetData(DATA_WEEKLY_QUEST_ID, 0); // show required hidden npcs
                            if (GameObject* teleporter = instance->GetGameObject(TeleporterLightsHammerGUID))
                                SetTeleporterState(teleporter, true);
                            if (GameObject* teleporter = instance->GetGameObject(TeleporterOratoryGUID))
                                SetTeleporterState(teleporter, true);
							SaveToDB();
                        }
                        break;
                    }
                    case DATA_LADY_DEATHWHISPER:
                    {
                        if (state == DONE)
                        {
                            if (GameObject* teleporter = instance->GetGameObject(TeleporterRampartsGUID))
                                SetTeleporterState(teleporter, true);

                            if (GameObject* elevator = instance->GetGameObject(LadyDeathwisperElevatorGUID))
                            {
                                elevator->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                elevator->SetGoState(GO_STATE_READY);
                            }
                            SaveToDB();
                            SpawnGunship();
                        }
                        break;
                    }
                    case DATA_ICECROWN_GUNSHIP_BATTLE:
                        if (state == DONE)
                        {
                            if (GameObject* teleporter = instance->GetGameObject(TeleporterDeathBringerGUID))
                                SetTeleporterState(teleporter, true);

							if (GameObject* loot = instance->GetGameObject(GunshipArmoryGUID))
							{
								loot->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED | GO_FLAG_NOT_SELECTABLE | GO_FLAG_NODESPAWN);
								loot->SetPhaseMask(1, true);
							}
                        }
                        else if (state == FAIL)
                            Events.ScheduleEvent(EVENT_RESPAWN_GUNSHIP, 30000);
                        break;
                    case DATA_DEATHBRINGER_SAURFANG:
                        switch (state)
                        {
                            case DONE:
                            {
                                if (GameObject* loot = instance->GetGameObject(DeathbringersCacheGUID))
                                {
                                    if (Creature* deathbringer = instance->GetCreature(DeathbringerSaurfangGUID))
                                        loot->SetLootRecipient(deathbringer->GetLootRecipient());
                                    loot->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED | GO_FLAG_NOT_SELECTABLE | GO_FLAG_NODESPAWN);
                                    loot->SetPhaseMask(1, true);
                                }

                                if (GameObject* teleporter = instance->GetGameObject(TeleporterUpperSpireGUID))
                                    SetTeleporterState(teleporter, true);

                                if (GameObject* teleporter = instance->GetGameObject(TeleporterDeathBringerGUID))
                                    SetTeleporterState(teleporter, true);
                                break;
                            }
                            case NOT_STARTED:
                            {
                                if (GameObject* teleporter = instance->GetGameObject(TeleporterDeathBringerGUID))
                                    SetTeleporterState(teleporter, true);
                                break;
                            }
                            case IN_PROGRESS:
                            {
                                if (GameObject* teleporter = instance->GetGameObject(TeleporterDeathBringerGUID))
                                    SetTeleporterState(teleporter, false);
                                break;
                            }
                            default:
                                break;
                        }
                        break;
                    case DATA_FESTERGUT:
						if (state == DONE)
						{
							if (GameObject* go = instance->GetGameObject(GasReleaseValveGUID))
								go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND | GO_FLAG_NOT_SELECTABLE);
							//if (GetBossState(DATA_ROTFACE) == DONE)
								//HandleDropAttempt(false);
						}
                        break;
                    case DATA_ROTFACE:
						if (state == DONE)
						{
							if (GameObject* go = instance->GetGameObject(OozeReleaseValveGUID))
								go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND | GO_FLAG_NOT_SELECTABLE);
							//if (GetBossState(DATA_FESTERGUT) == DONE)
								//HandleDropAttempt(false);
						}
                        break;
					case DATA_PROFESSOR_PUTRICIDE:
						HandleGameObject(PutricideEnteranceDoorGUID, (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_TRAP_FINISHED) && state != IN_PROGRESS);
						HandleGameObject(PlagueSigilGUID, state != DONE);
						if (state == DONE)
						{
							CheckLichKingAvailability();
							if (instance->IsHeroic())
							{
								IsPutricideHeroicKilled = 1;
								SaveToDB();
							}
						}
						else if (instance->IsHeroic())
						{
							if (state == FAIL && HeroicAttempts)
							{
								--HeroicAttempts;
								DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, HeroicAttempts);
								if (!HeroicAttempts)
									HideAllBosses();
									/*if (Creature* putricide = instance->GetCreature(ProfessorPutricideGUID))
										putricide->DespawnOrUnsummon();*/

								SaveToDB();
							}
						}
                        break;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        HandleGameObject(BloodwingSigilGUID, state != DONE);
						if (state == DONE)
						{
							CheckLichKingAvailability();

							if (instance->IsHeroic())
							{
								IsBloodQueenHeroicKilled = 1;
								SaveToDB();
							}
						}
                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && HeroicAttempts)
                            {
                                --HeroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, HeroicAttempts);
                                if (!HeroicAttempts)
									HideAllBosses();
                                    /*if (Creature* bq = instance->GetCreature(BloodQueenLanaThelGUID))
                                        bq->DespawnOrUnsummon();*/

								SaveToDB();
                            }
                        }
                        break;
                    case DATA_VALITHRIA_DREAMWALKER:
                        if (state == DONE)
                        {
							SetData(DATA_WEEKLY_QUEST_ID, GetData(DATA_WEEKLY_QUEST_ID)); // will show weekly quest npc if necessary
                            /*if (sPoolMgr->IsSpawnedObject<Quest>(WeeklyQuestData[8].questId[instance->GetSpawnMode() & 1]))
                                instance->SummonCreature(NPC_VALITHRIA_DREAMWALKER_QUEST, ValithriaSpawnPos);*/
                            if (GameObject* teleporter = instance->GetGameObject(TeleporterSindragosaGUID))
                                SetTeleporterState(teleporter, true);
                        }
                        break;
                    case DATA_SINDRAGOSA:
                        HandleGameObject(FrostwingSigilGUID, state != DONE);
						if (state == DONE)
						{
							CheckLichKingAvailability();

							if (instance->IsHeroic())
							{
								IsSindragosaHeroicKilled = 1;
								SaveToDB();
							}
						}

                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && HeroicAttempts)
                            {
                                --HeroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, HeroicAttempts);
                                if (!HeroicAttempts)
									HideAllBosses();
                                    /*if (Creature* sindra = instance->GetCreature(SindragosaGUID))
                                        sindra->DespawnOrUnsummon();*/

								SaveToDB();
                            }
                        }
                        break;
                    case DATA_THE_LICH_KING:
                    {
                        // set the platform as active object to dramatically increase visibility range
                        // note: "active" gameobjects do not block grid unloading
                        if (GameObject* precipice = instance->GetGameObject(ArthasPrecipiceGUID))
                            precipice->setActive(state == IN_PROGRESS);
                        if (GameObject* platform = instance->GetGameObject(ArthasPlatformGUID))
                            platform->setActive(state == IN_PROGRESS);

                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && HeroicAttempts)
                            {
                                --HeroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, HeroicAttempts);
								if (!HeroicAttempts)
									HideAllBosses();
                                    /*if (Creature* theLichKing = instance->GetCreature(TheLichKingGUID))
                                        theLichKing->DespawnOrUnsummon();*/

								SaveToDB();
                            }
                        }

                        if (state == DONE)
                        {
                            if (GameObject* bolvar = instance->GetGameObject(FrozenBolvarGUID))
                                bolvar->SetRespawnTime(7 * DAY);
                            if (GameObject* pillars = instance->GetGameObject(PillarsChainedGUID))
                                pillars->SetRespawnTime(7 * DAY);
                            if (GameObject* pillars = instance->GetGameObject(PillarsUnchainedGUID))
                                pillars->SetRespawnTime(7 * DAY);

                            instance->SummonCreature(NPC_LADY_JAINA_PROUDMOORE_QUEST, JainaSpawnPos);
                            instance->SummonCreature(NPC_MURADIN_BRONZEBEARD_QUEST, MuradinSpawnPos);
                            instance->SummonCreature(NPC_UTHER_THE_LIGHTBRINGER_QUEST, UtherSpawnPos);
                            instance->SummonCreature(NPC_LADY_SYLVANAS_WINDRUNNER_QUEST, SylvanasSpawnPos);
                        }
                        break;
                    }
                    default:
                        break;
                 }

                 return true;
            }

            void SpawnGunship()
            {
                if (!GunshipGUID)
                {
                    SetBossState(DATA_ICECROWN_GUNSHIP_BATTLE, NOT_STARTED);
                    uint32 gunshipEntry = TeamInInstance == HORDE ? GO_ORGRIMS_HAMMER_H : GO_THE_SKYBREAKER_A;
                    if (Transport* gunship = sTransportMgr->CreateTransport(gunshipEntry, 0, instance))
                        GunshipGUID = gunship->GetGUID();
                }
            }

            void SetData(uint32 type, uint32 data) override
            {
                switch (type)
                {
				case DATA_BUFF_AVAILABLE:
					IsBuffAvailable = (data ? true : false);
					if (!IsBuffAvailable)
					{
						Map::PlayerList const& plrList = instance->GetPlayers();
						for (Map::PlayerList::const_iterator itr = plrList.begin(); itr != plrList.end(); ++itr)
							if (Player* plr = itr->GetSource())
							{
								plr->UpdateAreaDependentAuras(plr->GetAreaId());
								for (Unit::ControlList::const_iterator itr = plr->m_Controlled.begin(); itr != plr->m_Controlled.end(); ++itr)
								{
									Unit::AuraMap& am = (*itr)->GetOwnedAuras();
									for (Unit::AuraMap::iterator itra = am.begin(); itra != am.end();)
										switch (itra->second->GetId())
									{
										// Hellscream's Warsong
										case 73816: case 73818: case 73819: case 73820: case 73821: case 73822:
											// Strength of Wrynn
										case 73762: case 73824: case 73825: case 73826: case 73827: case 73828:
											(*itr)->RemoveOwnedAura(itra);
											break;
										default:
											++itra;
											break;
									}
								}
							}
					}
					break;
                    case DATA_BONED_ACHIEVEMENT:
                        IsBonedEligible = data ? true : false;
                        break;
                    case DATA_OOZE_DANCE_ACHIEVEMENT:
                        IsOozeDanceEligible = data ? true : false;
                        break;
                    case DATA_NAUSEA_ACHIEVEMENT:
                        IsNauseaEligible = data ? true : false;
                        break;
                    case DATA_ORB_WHISPERER_ACHIEVEMENT:
                        IsOrbWhispererEligible = data ? true : false;
                        break;
                    case DATA_SINDRAGOSA_FROSTWYRMS:
                        FrostwyrmGUIDs.insert(data);
                        break;
                    case DATA_SPINESTALKER:
                        SpinestalkerTrash.insert(data);
                        break;
                    case DATA_RIMEFANG:
                        RimefangTrash.insert(data);
                        break;
                    case DATA_COLDFLAME_JETS:
                        ColdflameJetsState = data;
                        if (ColdflameJetsState == DONE)
                            SaveToDB();
                        break;
                    case DATA_BLOOD_QUICKENING_STATE:
                    {
                        // skip if nothing changes
                        if (BloodQuickeningState == data)
                            break;

						if (WeeklyQuestId10 != QUEST_BLOOD_QUICKENING_10)
							break;

                        switch (data)
                        {
                            case IN_PROGRESS:
                                Events.ScheduleEvent(EVENT_UPDATE_EXECUTION_TIME, 60000);
                                BloodQuickeningMinutes = 30;
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 1);
                                DoUpdateWorldState(WORLDSTATE_EXECUTION_TIME, BloodQuickeningMinutes);
                                break;
                            case DONE:
                                Events.CancelEvent(EVENT_UPDATE_EXECUTION_TIME);
                                BloodQuickeningMinutes = 0;
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 0);
                                break;
                            default:
                                break;
                        }

                        BloodQuickeningState = data;
                        SaveToDB();
                        break;
                    }
					case DATA_WEEKLY_QUEST_ID:
						for (uint8 i = 0; i<WeeklyNPCs; ++i)
							if (WeeklyQuestData[i].questId[0] == WeeklyQuestId10 && (WeeklyQuestData[i].creatureEntry != NPC_VALITHRIA_DREAMWALKER_QUEST || GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE) /*appears after killing valithria*/)
								if (WeeklyQuestNpcGUID[i])
									if (Creature* c = instance->GetCreature(WeeklyQuestNpcGUID[i]))
										c->SetVisible(true);
						break;
					case DATA_SINDRAGOSA_GAUNTLET:
						switch (data)
						{
						case NOT_STARTED:
						case DONE:
							HandleGameObject(SindragosaDoorGUID, true);
							break;
						case IN_PROGRESS:
							HandleGameObject(SindragosaDoorGUID, false);
							break;
						default:
							break;
						}
						SindragosaGauntletEventProgress = data;
						break;
					case DATA_PUTRICIDE_TRAP_STATE:
						if (data == NOT_STARTED)
						{
							PutricideEventProgress &= ~PUTRICIDE_EVENT_FLAG_TRAP_INPROGRESS;
							HandleGameObject(PutricideCollisionGUID, ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE)));
							if ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE))
							{
								for (uint8 i = 0; i<2; ++i)
									if (GameObject* go = instance->GetGameObject(PutricideGateGUIDs[i]))
										go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
							}
							else
							{
								HandleGameObject(PutricideGateGUIDs[0], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE));
								HandleGameObject(PutricideGateGUIDs[1], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE));
							}
							SaveToDB();
						}
						else if (data == IN_PROGRESS)
						{
							PutricideEventProgress |= PUTRICIDE_EVENT_FLAG_TRAP_INPROGRESS;
							HandleGameObject(PutricideCollisionGUID, false);
							HandleGameObject(PutricideGateGUIDs[0], false);
							HandleGameObject(PutricideGateGUIDs[1], false);
							SaveToDB();
						}
						else if (data == DONE)
						{
							PutricideEventProgress &= ~PUTRICIDE_EVENT_FLAG_TRAP_INPROGRESS;
							PutricideEventProgress |= PUTRICIDE_EVENT_FLAG_TRAP_FINISHED;
							HandleGameObject(PutricideEnteranceDoorGUID, true);
							HandleGameObject(PutricideCollisionGUID, ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE)));
							if ((PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE) && (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE))
							{
								for (uint8 i = 0; i<2; ++i)
									if (GameObject* go = instance->GetGameObject(PutricideGateGUIDs[i]))
										go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
							}
							else
							{
								HandleGameObject(PutricideGateGUIDs[0], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE));
								HandleGameObject(PutricideGateGUIDs[1], !(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE));
							}
							SaveToDB();
						}
						return;
                    case DATA_UPPERSPIRE_TELE_ACT:
                        UpperSpireTeleporterActiveState = data;
                        if (UpperSpireTeleporterActiveState == DONE)
                        {
                            if (GameObject* go = instance->GetGameObject(TeleporterUpperSpireGUID))
                                SetTeleporterState(go, true);
                            SaveToDB();
                        }
                        break;
					case DATA_BPC_TRASH_DIED:
					{
						if (++BloodPrinceTrashCount >= 4)
						{
							SetBossState(DATA_BLOOD_PRINCE_TRASH, NOT_STARTED);
							SetBossState(DATA_BLOOD_PRINCE_TRASH, DONE);
						}
						SaveToDB();
						break;
					}
                    default:
                        break;
                }
            }

            bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target*/, uint32 /*miscvalue1*/) override
            {
                switch (criteria_id)
                {
                    case CRITERIA_BONED_10N:
                    case CRITERIA_BONED_25N:
                    case CRITERIA_BONED_10H:
                    case CRITERIA_BONED_25H:
                        return IsBonedEligible;
                    case CRITERIA_DANCES_WITH_OOZES_10N:
                    case CRITERIA_DANCES_WITH_OOZES_25N:
                    case CRITERIA_DANCES_WITH_OOZES_10H:
                    case CRITERIA_DANCES_WITH_OOZES_25H:
                        return IsOozeDanceEligible;
                    case CRITERIA_NAUSEA_10N:
                    case CRITERIA_NAUSEA_25N:
                    case CRITERIA_NAUSEA_10H:
                    case CRITERIA_NAUSEA_25H:
                        return IsNauseaEligible;
                    case CRITERIA_ORB_WHISPERER_10N:
                    case CRITERIA_ORB_WHISPERER_25N:
                    case CRITERIA_ORB_WHISPERER_10H:
                    case CRITERIA_ORB_WHISPERER_25H:
                        return IsOrbWhispererEligible;
                    // Only one criteria for both modes, need to do it like this
                    case CRITERIA_KILL_LANA_THEL_10M:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_10N:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_10V:
                        return instance->ToInstanceMap()->GetMaxPlayers() == 10;
                    case CRITERIA_KILL_LANA_THEL_25M:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_25N:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_25V:
                        return instance->ToInstanceMap()->GetMaxPlayers() == 25;
                    default:
                        break;
                }

                return false;
            }

            bool CheckRequiredBosses(uint32 bossId, Player const* player = nullptr) const override
            {
                if (_SkipCheckRequiredBosses(player))
                    return true;

                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (!CheckPlagueworks(bossId))
                            return false;
                        if (!CheckCrimsonHalls(bossId))
                            return false;
                        if (!CheckFrostwingHalls(bossId))
                            return false;
                        break;
                    case DATA_SINDRAGOSA:
                    case DATA_VALITHRIA_DREAMWALKER:
                        if (!CheckFrostwingHalls(bossId))
                            return false;
                        break;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                    case DATA_BLOOD_PRINCE_COUNCIL:
                        if (!CheckCrimsonHalls(bossId))
                            return false;
                        break;
                    case DATA_FESTERGUT:
                    case DATA_ROTFACE:
                    case DATA_PROFESSOR_PUTRICIDE:
                        if (!CheckPlagueworks(bossId))
                            return false;
                        break;
                    default:
                        break;
                }

                if (!CheckLowerSpire(bossId))
                    return false;

                return true;
            }

            bool CheckPlagueworks(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_PROFESSOR_PUTRICIDE) != DONE)
                            return false;
                        // no break
                    case DATA_PROFESSOR_PUTRICIDE:
                        if (GetBossState(DATA_FESTERGUT) != DONE || GetBossState(DATA_ROTFACE) != DONE)
                            return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckCrimsonHalls(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) != DONE)
                            return false;
                        // no break
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        if (GetBossState(DATA_BLOOD_PRINCE_COUNCIL) != DONE)
                            return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckFrostwingHalls(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_SINDRAGOSA) != DONE)
                            return false;
                        // no break
                    case DATA_SINDRAGOSA:
                        if (GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                            return false;
						if (GetBossState(DATA_SINDRAGOSA_GAUNTLET) != DONE)
							return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckLowerSpire(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                    case DATA_SINDRAGOSA:
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                    case DATA_PROFESSOR_PUTRICIDE:
                    case DATA_VALITHRIA_DREAMWALKER:
                    case DATA_BLOOD_PRINCE_COUNCIL:
                    case DATA_ROTFACE:
                    case DATA_FESTERGUT:
                        if (GetBossState(DATA_DEATHBRINGER_SAURFANG) != DONE)
                            return false;
                        // no break
                    case DATA_DEATHBRINGER_SAURFANG:
                        if (GetBossState(DATA_ICECROWN_GUNSHIP_BATTLE) != DONE)
                            return false;
                        // no break
                    case DATA_ICECROWN_GUNSHIP_BATTLE:
                        if (GetBossState(DATA_LADY_DEATHWHISPER) != DONE)
                            return false;
                        // no break
                    case DATA_LADY_DEATHWHISPER:
                        if (GetBossState(DATA_LORD_MARROWGAR) != DONE)
                            return false;
                        // no break
                    case DATA_LORD_MARROWGAR:
                    default:
                        break;
                }

                return true;
            }

            void CheckLichKingAvailability()
            {
                if (GetBossState(DATA_PROFESSOR_PUTRICIDE) == DONE && GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) == DONE && GetBossState(DATA_SINDRAGOSA) == DONE)
                {
                    if (GameObject* teleporter = instance->GetGameObject(TheLichKingTeleportGUID))
                    {
                        teleporter->SetGoState(GO_STATE_ACTIVE);

                        std::list<Creature*> stalkers;
                        GetCreatureListWithEntryInGrid(stalkers, teleporter, NPC_INVISIBLE_STALKER, 100.0f);
                        if (stalkers.empty())
                            return;

                        stalkers.sort(Trinity::ObjectDistanceOrderPred(teleporter));
                        stalkers.front()->CastSpell((Unit*)NULL, SPELL_ARTHAS_TELEPORTER_CEREMONY, false);
                        stalkers.pop_front();
                        for (std::list<Creature*>::iterator itr = stalkers.begin(); itr != stalkers.end(); ++itr)
                            (*itr)->AI()->Reset();
                    }
                }
            }

            void WriteSaveDataMore(std::ostringstream& data) override
            {
                data << HeroicAttempts << ' '
                    << ColdflameJetsState << ' '
                    << BloodQuickeningState << ' '
                    << BloodQuickeningMinutes << ' '
                    << UpperSpireTeleporterActiveState << ' '
					<< PutricideEventProgress << ' '
					<< WeeklyQuestId10 << ' '
					<< BloodPrinceTrashCount << ' '
					<< IsPutricideHeroicKilled << ' '
					<< IsBloodQueenHeroicKilled << ' '
					<< IsSindragosaHeroicKilled;
            }

            void ReadSaveDataMore(std::istringstream& data) override
            {
                data >> HeroicAttempts;

                uint32 temp = 0;
                data >> temp;
                if (temp == IN_PROGRESS)
                    ColdflameJetsState = NOT_STARTED;
                else
                    ColdflameJetsState = temp ? DONE : NOT_STARTED;

                data >> temp;
                BloodQuickeningState = temp ? DONE : NOT_STARTED;   // DONE means finished (not success/fail)
                data >> BloodQuickeningMinutes;

                data >> temp;
                UpperSpireTeleporterActiveState = temp ? DONE : NOT_STARTED;
				data >> PutricideEventProgress; PutricideEventProgress &= ~PUTRICIDE_EVENT_FLAG_TRAP_INPROGRESS;
				data >> WeeklyQuestId10;
				data >> BloodPrinceTrashCount;
				data >> IsPutricideHeroicKilled;
				data >> IsBloodQueenHeroicKilled;
				data >> IsSindragosaHeroicKilled;
            }

            void Update(uint32 diff) override
            {

				if (LichKingRandomWhisperTimer <= diff)
				{
					LichKingRandomWhisperTimer = urand(100, 300)*IN_MILLISECONDS;
					Map::PlayerList const &players = instance->GetPlayers();
					if (!players.isEmpty())
						if (Player* player = players.begin()->GetSource())
							if (player->GetQuestStatus(QUEST_A_FEAST_OF_SOULS) == QUEST_STATUS_INCOMPLETE)
							{
								uint8 id = urand(0, 15);
								std::string const& text = sCreatureTextMgr->GetLocalizedChatString(NPC_THE_LICH_KING_LH, 0, 20 + id, 0, LOCALE_enUS);
								WorldPacket data;

								ChatHandler::BuildChatPacket(data, CHAT_MSG_MONSTER_WHISPER, LANG_UNIVERSAL, ObjectGuid::Empty, player->GetGUID(), text, CHAT_TAG_NONE, "The Lich King");
								player->PlayDirectSound(17235 + id, player);
								player->SendDirectMessage(&data);
							}
				}
				else
					LichKingRandomWhisperTimer -= diff;
				/*
				if (DarkwhisperElevatorTimer <= diff)
				{
					DarkwhisperElevatorTimer = 3000;
					if (GetBossState(DATA_LADY_DEATHWHISPER) == DONE)
						if (GameObject* elevator = instance->GetGameObject(LadyDeathwisperElevatorGUID))
							if (Transport* trans = elevator->ToTransport())
							{
								if (trans->GetGoState() == GO_STATE_READY && trans->path == 0)
									trans->SetGoState(GO_STATE_ACTIVE);
								else if (trans->GetGoState() == GO_STATE_ACTIVE && trans->GetPathProgress() == trans->GetPauseTime())
									trans->SetGoState(GO_STATE_READY);
							}
				}
				else
					DarkwhisperElevatorTimer -= diff;*/

                if (BloodQuickeningState != IN_PROGRESS && GetBossState(DATA_THE_LICH_KING) != IN_PROGRESS && GetBossState(DATA_ICECROWN_GUNSHIP_BATTLE) != FAIL && !needToCheckVisibility)
                    return;

                Events.Update(diff);

                while (uint32 eventId = Events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_UPDATE_EXECUTION_TIME:
                        {
                            --BloodQuickeningMinutes;
                            if (BloodQuickeningMinutes)
                            {
                                Events.ScheduleEvent(EVENT_UPDATE_EXECUTION_TIME, 60000);
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 1);
                                DoUpdateWorldState(WORLDSTATE_EXECUTION_TIME, BloodQuickeningMinutes);
                            }
                            else
                            {
                                BloodQuickeningState = DONE;
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 0);
                                if (Creature* bq = instance->GetCreature(BloodQueenLanaThelGUID))
                                    bq->AI()->DoAction(ACTION_KILL_MINCHAR);
                            }
                            SaveToDB();
                            break;
                        }
                        case EVENT_QUAKE_SHATTER:
                        {
                            if (GameObject* platform = instance->GetGameObject(ArthasPlatformGUID))
                                platform->SetDestructibleState(GO_DESTRUCTIBLE_DAMAGED);
                            if (GameObject* edge = instance->GetGameObject(FrozenThroneEdgeGUID))
                                edge->SetGoState(GO_STATE_ACTIVE);
                            if (GameObject* wind = instance->GetGameObject(FrozenThroneWindGUID))
                                wind->SetGoState(GO_STATE_READY);
                            if (GameObject* warning = instance->GetGameObject(FrozenThroneWarningGUID))
                                warning->SetGoState(GO_STATE_READY);
                            if (Creature* theLichKing = instance->GetCreature(TheLichKingGUID))
                                theLichKing->AI()->DoAction(ACTION_RESTORE_LIGHT);
                            break;
                        }
                        case EVENT_REBUILD_PLATFORM:
                            if (GameObject* platform = instance->GetGameObject(ArthasPlatformGUID))
                                platform->SetDestructibleState(GO_DESTRUCTIBLE_REBUILDING);
                            if (GameObject* edge = instance->GetGameObject(FrozenThroneEdgeGUID))
                                edge->SetGoState(GO_STATE_READY);
                            if (GameObject* wind = instance->GetGameObject(FrozenThroneWindGUID))
                                wind->SetGoState(GO_STATE_ACTIVE);
                            break;
                        case EVENT_RESPAWN_GUNSHIP:
                            SpawnGunship();
                            break;
						case EVENT_CHECK_BOSS_VISIBILITY:
							ManageBossesVisibility();
							Events.ScheduleEvent(EVENT_CHECK_BOSS_VISIBILITY, 60000);
							break;
                        default:
                            break;
                    }
                }
            }

            void ProcessEvent(WorldObject* source, uint32 eventId) override
            {
                switch (eventId)
                {
                    case EVENT_ENEMY_GUNSHIP_DESPAWN:
                        if (GetBossState(DATA_ICECROWN_GUNSHIP_BATTLE) == DONE)
                            source->AddObjectToRemoveList();
                        break;
                    case EVENT_ENEMY_GUNSHIP_COMBAT:
                        if (Creature* captain = source->FindNearestCreature(TeamInInstance == HORDE ? NPC_IGB_HIGH_OVERLORD_SAURFANG : NPC_IGB_MURADIN_BRONZEBEARD, 100.0f))
                            captain->AI()->DoAction(ACTION_ENEMY_GUNSHIP_TALK);
                        // no break;
                    case EVENT_PLAYERS_GUNSHIP_SPAWN:
                    case EVENT_PLAYERS_GUNSHIP_COMBAT:
                        if (GameObject* go = source->ToGameObject())
                            if (Transport* transport = go->ToTransport())
                                transport->EnableMovement(false);
                        break;
                    case EVENT_PLAYERS_GUNSHIP_SAURFANG:
                    {
                        if (Creature* captain = source->FindNearestCreature(TeamInInstance == HORDE ? NPC_IGB_HIGH_OVERLORD_SAURFANG : NPC_IGB_MURADIN_BRONZEBEARD, 100.0f))
                            captain->AI()->DoAction(ACTION_EXIT_SHIP);
                        if (GameObject* go = source->ToGameObject())
                            if (Transport* transport = go->ToTransport())
                                transport->EnableMovement(false);
                        break;
                    }
                    case EVENT_QUAKE:
                        if (GameObject* warning = instance->GetGameObject(FrozenThroneWarningGUID))
                            warning->SetGoState(GO_STATE_ACTIVE);
                        Events.ScheduleEvent(EVENT_QUAKE_SHATTER, 5000);
                        break;
                    case EVENT_SECOND_REMORSELESS_WINTER:
                        if (GameObject* platform = instance->GetGameObject(ArthasPlatformGUID))
                        {
                            platform->SetDestructibleState(GO_DESTRUCTIBLE_DESTROYED);
                            Events.ScheduleEvent(EVENT_REBUILD_PLATFORM, 1500);
                        }
                        break;
                    case EVENT_TELEPORT_TO_FROSTMOURNE: // Harvest Soul (normal mode)
                        if (Creature* terenas = instance->SummonCreature(NPC_TERENAS_MENETHIL_FROSTMOURNE, TerenasSpawn, NULL, 63000))
                        {
                            terenas->AI()->DoAction(ACTION_FROSTMOURNE_INTRO);
                            std::list<Creature*> triggers;
                            GetCreatureListWithEntryInGrid(triggers, terenas, NPC_WORLD_TRIGGER_INFINITE_AOI, 100.0f);
                            if (!triggers.empty())
                            {
                                triggers.sort(Trinity::ObjectDistanceOrderPred(terenas, false));
                                Unit* visual = triggers.front();
                                visual->CastSpell(visual, SPELL_FROSTMOURNE_TELEPORT_VISUAL, true);
                            }

                            if (Creature* warden = instance->SummonCreature(NPC_SPIRIT_WARDEN, SpiritWardenSpawn, NULL, 63000))
                            {
                                terenas->AI()->AttackStart(warden);
                                warden->AddThreat(terenas, 300000.0f);
                            }
                        }
                        break;
					case EVENT_FESTERGUT_VALVE_USED:
						if (!(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE))
						{
							PutricideEventProgress |= PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE;
							if (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE)
							{
								HandleGameObject(PutricideCollisionGUID, true);
								for (uint8 i = 0; i<2; ++i)
									if (GameObject* go = instance->GetGameObject(PutricideGateGUIDs[i]))
										go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
							}
							else
								HandleGameObject(PutricideGateGUIDs[0], false);
							HandleGameObject(PutricidePipeGUIDs[0], true);
							SaveToDB();
						}
						break;
					case EVENT_ROTFACE_VALVE_USED:
						if (!(PutricideEventProgress & PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE))
						{
							PutricideEventProgress |= PUTRICIDE_EVENT_FLAG_ROTFACE_VALVE;
							if (PutricideEventProgress & PUTRICIDE_EVENT_FLAG_FESTERGUT_VALVE)
							{
								HandleGameObject(PutricideCollisionGUID, true);
								for (uint8 i = 0; i<2; ++i)
									if (GameObject* go = instance->GetGameObject(PutricideGateGUIDs[i]))
										go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
							}
							else
								HandleGameObject(PutricideGateGUIDs[1], false);
							HandleGameObject(PutricidePipeGUIDs[1], true);
							SaveToDB();
						}
						break;
                }
            }

        protected:
			bool IsBuffAvailable;
			uint32 WeeklyQuestId10; // contains id from 10man for any difficulty (for simplicity)
			ObjectGuid WeeklyQuestNpcGUID[WeeklyNPCs];
            EventMap Events;
            ObjectGuid LordMarrowgarGUID;
            ObjectGuid LadyDeahtwhisperGUID;
            ObjectGuid LadyDeathwisperElevatorGUID;
            ObjectGuid GunshipGUID;
            ObjectGuid EnemyGunshipGUID;
            ObjectGuid GunshipArmoryGUID;
            ObjectGuid DeathbringerSaurfangGUID;
            ObjectGuid DeathbringerSaurfangDoorGUID;
            ObjectGuid DeathbringerSaurfangEventGUID;   // Muradin Bronzebeard or High Overlord Saurfang
            ObjectGuid DeathbringersCacheGUID;
			ObjectGuid DeathbringerEndEventTriggerGUID;
            ObjectGuid TeleporterLichKingGUID;
            ObjectGuid TeleporterUpperSpireGUID;
            ObjectGuid TeleporterLightsHammerGUID;
            ObjectGuid TeleporterRampartsGUID;
            ObjectGuid TeleporterDeathBringerGUID;
            ObjectGuid TeleporterOratoryGUID;
            ObjectGuid TeleporterSindragosaGUID;
            ObjectGuid PlagueSigilGUID;
            ObjectGuid BloodwingSigilGUID;
            ObjectGuid FrostwingSigilGUID;
            ObjectGuid PutricidePipeGUIDs[2];
            ObjectGuid PutricideGateGUIDs[2];
            ObjectGuid PutricideCollisionGUID;
            ObjectGuid FestergutGUID;
            ObjectGuid RotfaceGUID;
            ObjectGuid ProfessorPutricideGUID;
            ObjectGuid PutricideTableGUID;
            ObjectGuid BloodCouncilGUIDs[3];
            ObjectGuid BloodCouncilControllerGUID;
            ObjectGuid BloodQueenLanaThelCouncilGUID;
            ObjectGuid BloodQueenLanaThelGUID;
            ObjectGuid CrokScourgebaneGUID;
            ObjectGuid CrokCaptainGUIDs[4];
            ObjectGuid SisterSvalnaGUID;
            ObjectGuid ValithriaDreamwalkerGUID;
            ObjectGuid ValithriaLichKingGUID;
            ObjectGuid ValithriaTriggerGUID;
            ObjectGuid SindragosaGUID;
            ObjectGuid SpinestalkerGUID;
            ObjectGuid RimefangGUID;
            ObjectGuid TheLichKingTeleportGUID;
            ObjectGuid TheLichKingGUID;
            ObjectGuid HighlordTirionFordringGUID;
            ObjectGuid TerenasMenethilGUID;
            ObjectGuid ArthasPlatformGUID;
            ObjectGuid ArthasPrecipiceGUID;
            ObjectGuid FrozenThroneEdgeGUID;
            ObjectGuid FrozenThroneWindGUID;
            ObjectGuid FrozenThroneWarningGUID;
            ObjectGuid FrozenBolvarGUID;
            ObjectGuid PillarsChainedGUID;
            ObjectGuid PillarsUnchainedGUID;
			ObjectGuid PutricadeTrapGUID;
			ObjectGuid SindragosaGauntletGUID;
			ObjectGuid GasReleaseValveGUID;
			ObjectGuid OozeReleaseValveGUID;
			ObjectGuid PutricideEnteranceDoorGUID;
			ObjectGuid SindragosaDoorGUID;
            uint32 TeamInInstance;
            uint32 ColdflameJetsState;
            uint32 UpperSpireTeleporterActiveState;
			uint32 PutricideEventProgress;
			uint32 SindragosaGauntletEventProgress;
            std::set<uint32> FrostwyrmGUIDs;
            std::set<uint32> SpinestalkerTrash;
            std::set<uint32> RimefangTrash;
            uint32 BloodQuickeningState;
            uint32 HeroicAttempts;
            uint16 BloodQuickeningMinutes;
			uint32 BloodPrinceTrashCount;
            bool IsBonedEligible;
            bool IsOozeDanceEligible;
            bool IsNauseaEligible;
            bool IsOrbWhispererEligible;
			uint32 LichKingRandomWhisperTimer;

			bool IsPutricideHeroicKilled;
			bool IsBloodQueenHeroicKilled;
			bool IsSindragosaHeroicKilled;

			bool disableTirionGossipHeroic; // Only for heroic, when reaching 0 attempts.

			bool needToCheckVisibility;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_icecrown_citadel_InstanceMapScript(map);
        }
};

void AddSC_instance_icecrown_citadel()
{
    new instance_icecrown_citadel();
}
