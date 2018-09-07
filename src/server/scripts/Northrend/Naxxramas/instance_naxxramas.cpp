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
#include "InstanceScript.h"
#include "naxxramas.h"

uint32 BossesList[] =
{
	DATA_PATCHWERK, 
	DATA_GROBBULUS
};

uint32 ThaddiusLammentList[] =
{
	18,
	19
};

DoorData const doorData[] =
{
    { GO_ROOM_ANUBREKHAN,       BOSS_ANUBREKHAN,    DOOR_TYPE_ROOM,         BOUNDARY_S      },
    { GO_PASSAGE_ANUBREKHAN,    BOSS_ANUBREKHAN,    DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_PASSAGE_FAERLINA,      BOSS_FAERLINA,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_MAEXXNA,          BOSS_FAERLINA,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_MAEXXNA,          BOSS_MAEXXNA,       DOOR_TYPE_ROOM,         BOUNDARY_SW     },
    { GO_ROOM_NOTH,             BOSS_NOTH,          DOOR_TYPE_ROOM,         BOUNDARY_N      },
    { GO_PASSAGE_NOTH,          BOSS_NOTH,          DOOR_TYPE_PASSAGE,      BOUNDARY_E      },
    { GO_ROOM_HEIGAN,           BOSS_NOTH,          DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_HEIGAN,           BOSS_HEIGAN,        DOOR_TYPE_ROOM,         BOUNDARY_N      },
    { GO_PASSAGE_HEIGAN,        BOSS_HEIGAN,        DOOR_TYPE_PASSAGE,      BOUNDARY_E      },
    { GO_ROOM_LOATHEB,          BOSS_HEIGAN,        DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_LOATHEB,          BOSS_LOATHEB,       DOOR_TYPE_ROOM,         BOUNDARY_W      },
    { GO_ROOM_GROBBULUS,        BOSS_PATCHWERK,     DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_GROBBULUS,        BOSS_GROBBULUS,     DOOR_TYPE_ROOM,         BOUNDARY_NONE   },
    { GO_PASSAGE_GLUTH,         BOSS_GLUTH,         DOOR_TYPE_PASSAGE,      BOUNDARY_NW     },
    { GO_ROOM_THADDIUS,         BOSS_GLUTH,         DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_THADDIUS,         BOSS_THADDIUS,      DOOR_TYPE_ROOM,         BOUNDARY_NONE   },
    { GO_ROOM_GOTHIK,           BOSS_RAZUVIOUS,     DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ROOM_GOTHIK,           BOSS_GOTHIK,        DOOR_TYPE_ROOM,         BOUNDARY_N      },
    { GO_PASSAGE_GOTHIK,        BOSS_GOTHIK,        DOOR_TYPE_PASSAGE,      BOUNDARY_S      },
    { GO_ROOM_HORSEMEN,         BOSS_GOTHIK,        DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_GOTHIK_GATE,           BOSS_GOTHIK,        DOOR_TYPE_ROOM,         BOUNDARY_NONE   },
    { GO_ROOM_HORSEMEN,         BOSS_HORSEMEN,      DOOR_TYPE_ROOM,         BOUNDARY_NE     },
    { GO_PASSAGE_SAPPHIRON,     BOSS_SAPPHIRON,     DOOR_TYPE_PASSAGE,      BOUNDARY_W      },
    { GO_ROOM_KELTHUZAD,        BOSS_KELTHUZAD,     DOOR_TYPE_ROOM,         BOUNDARY_S      },
    { GO_ARAC_EYE_RAMP,         BOSS_MAEXXNA,       DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_ARAC_EYE_RAMP_BOSS,    BOSS_MAEXXNA,       DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_PLAG_EYE_RAMP,         BOSS_LOATHEB,       DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_PLAG_EYE_RAMP_BOSS,    BOSS_LOATHEB,       DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_MILI_EYE_RAMP,         BOSS_HORSEMEN,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_MILI_EYE_RAMP_BOSS,    BOSS_HORSEMEN,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_CONS_EYE_RAMP,         BOSS_THADDIUS,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { GO_CONS_EYE_RAMP_BOSS,    BOSS_THADDIUS,      DOOR_TYPE_PASSAGE,      BOUNDARY_NONE   },
    { 0,                        0,                  DOOR_TYPE_ROOM,         BOUNDARY_NONE   }
};

MinionData const minionData[] =
{
    { NPC_FOLLOWER_WORSHIPPER,  BOSS_FAERLINA   },
    { NPC_DK_UNDERSTUDY,        BOSS_RAZUVIOUS  },
    { NPC_SIR,                  BOSS_HORSEMEN   },
    { NPC_THANE,                BOSS_HORSEMEN   },
    { NPC_LADY,                 BOSS_HORSEMEN   },
    { NPC_BARON,                BOSS_HORSEMEN   },
    { 0,                        0,              }
};

float const HeiganPos[2] = { 2796.0f, -3707.0f };
float const HeiganEruptionSlope[3] =
{
    (-3685.0f - HeiganPos[1]) / (2724.0f - HeiganPos[0]),
    (-3647.0f - HeiganPos[1]) / (2749.0f - HeiganPos[0]),
    (-3637.0f - HeiganPos[1]) / (2771.0f - HeiganPos[0])
};

// 0  H      x
//  1        ^
//   2       |
//    3  y<--o
inline uint32 GetEruptionSection(float x, float y)
{
    y -= HeiganPos[1];
    if (y < 1.0f)
        return 0;

    x -= HeiganPos[0];
    if (x > -1.0f)
        return 3;

    float slope = y/x;
    for (uint32 i = 0; i < 3; ++i)
        if (slope > HeiganEruptionSlope[i])
            return i;
    return 3;
}

class instance_naxxramas : public InstanceMapScript
{
    public:
        instance_naxxramas() : InstanceMapScript("instance_naxxramas", 533) { }

        struct instance_naxxramas_InstanceMapScript : public InstanceScript
        {
            instance_naxxramas_InstanceMapScript(Map* map) : InstanceScript(map)
            {
				SetHeaders(DataHeader);
                SetBossNumber(EncounterCount);
                LoadDoorData(doorData);
                LoadMinionData(minionData);
				hadSapphironBirth = false;

                playerDied              = 0;
				nextFroggerWave = 0;
				events.ScheduleEvent(EVENT_SUMMON_FROGGER_WAVE, Seconds(1));

				orbEnabled = false;
				/*HACER UN ACTIVATESAPPHIRON ORB EN PUNTOS CLAVE DE LA INSTANCIA (GAMEOBJECTCREATE, SETBOSSSTATE, CREACIÓN INSTANCIA..., PERO CAMBIAR TODO 
				Y HACER UN ISDEAD (O INCLUSO UN GETBOSSTATE(), ASI NO SE ESTABLECE ESTAS VARS A FALSE CADA VEZ QUE SE CARGA EL MAPA) DE CADA BOSS*/

				events.ScheduleEvent(EVENT_BOSS_CHECK, 15*IN_MILLISECONDS);
				events.ScheduleEvent(EVENT_THADDIUS_LAMENTS, 20*IN_MILLISECONDS);
                memset(PortalsGUID, 0, sizeof(PortalsGUID));
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_FAERLINA:
                        FaerlinaGUID = creature->GetGUID();
                        break;
					case NPC_MAEXXNA:
						MaexxnaGUID = creature->GetGUID();
						break;
                    case NPC_THANE:
                        ThaneGUID = creature->GetGUID();
                        break;
                    case NPC_LADY:
                        LadyGUID = creature->GetGUID();
                        break;
                    case NPC_BARON:
                        BaronGUID = creature->GetGUID();
                        break;
                    case NPC_SIR:
                        SirGUID = creature->GetGUID();
                        break;
                    case NPC_THADDIUS:
                        ThaddiusGUID = creature->GetGUID();
                        break;
                    case NPC_HEIGAN:
                        HeiganGUID = creature->GetGUID();
                        break;
					case NPC_LOATHEB:
						LoathebGUID = creature->GetGUID();
						break;
                    case NPC_FEUGEN:
                        FeugenGUID = creature->GetGUID();
                        break;
                    case NPC_STALAGG:
                        StalaggGUID = creature->GetGUID();
                        break;
                    case NPC_SAPPHIRON:
                        SapphironGUID = creature->GetGUID();
                        break;
                    case NPC_KEL_THUZAD:
                        KelthuzadGUID = creature->GetGUID();
                        break;
                    case NPC_PATCHWERK:
                        PatchwerkGUID = creature->GetGUID();
                        break;
                    case NPC_GROBBULUS:
                        GrobbulusGUID = creature->GetGUID();
                        break;
                    case NPC_GLUTH:
                        GluthGUID = creature->GetGUID();
                        break;
					case NPC_THADDIUS_LAMMENT_BUNNY01:
						ThaddiusLammentBunny01GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY02:
						ThaddiusLammentBunny02GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY03:
						ThaddiusLammentBunny03GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY04:
						ThaddiusLammentBunny04GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY05:
						ThaddiusLammentBunny05GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY06:
						ThaddiusLammentBunny06GUID = creature->GetGUID();
						break;
					case NPC_THADDIUS_LAMMENT_BUNNY07:
						ThaddiusLammentBunny07GUID = creature->GetGUID();
						break;
					case NPC_STALAGG_TESLA_COIL:
						StalaggTeslaCoilGUID = creature->GetGUID();
						break;
					case NPC_FEUGEN_TESLA_COIL:
						FeugenTeslaCoilGUID = creature->GetGUID();
						break;
					case NPC_PLAGUE_QUARTER_RAMP:
						PlagueQuarterRamp = creature->GetGUID();
						break;
					case NPC_ARACHNID_QUARTER_RAMP:
						ArachnidQuarterRamp = creature->GetGUID();
						break;
					case NPC_MILITARY_QUARTER_RAMP:
						MilitaryQuarterRamp = creature->GetGUID();
						break;
					case NPC_CONSTRUCT_QUARTER_RAMP:
						ConstructQuarterRamp = creature->GetGUID();
						break;
                    default:
                        break;
                }

                AddMinion(creature, true);
            }

            void OnCreatureRemove(Creature* creature) override
            {
                AddMinion(creature, false);
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                /*if (go->GetGOInfo()->displayId == 6785 || go->GetGOInfo()->displayId == 1287)
                {
                    uint32 section = GetEruptionSection(go->GetPositionX(), go->GetPositionY());
                    HeiganEruptionGUID[section].insert(go->GetGUID());
                    return;
                }*/

                switch (go->GetEntry())
                {
                    case GO_GOTHIK_GATE:
                        GothikGateGUID = go->GetGUID();
                        break;
                    case GO_HORSEMEN_CHEST:
                    case GO_HORSEMEN_CHEST_HERO:
                        HorsemenChestGUID = go->GetGUID();
                        break;
                    case GO_KELTHUZAD_PORTAL01:
                        PortalsGUID[0] = go->GetGUID();
                        break;
                    case GO_KELTHUZAD_PORTAL02:
                        PortalsGUID[1] = go->GetGUID();
                        break;
                    case GO_KELTHUZAD_PORTAL03:
                        PortalsGUID[2] = go->GetGUID();
                        break;
                    case GO_KELTHUZAD_PORTAL04:
                        PortalsGUID[3] = go->GetGUID();
                        break;
                    case GO_KELTHUZAD_TRIGGER:
                        KelthuzadTriggerGUID = go->GetGUID();
                        break;
					case GO_TELEPORT_ORB:
						TeleportOrbGUID = go->GetGUID();

						if (go)
							go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
						/*if(GameObject* teleportOrb = instance->GetGameObject(TeleportOrbGUID)){

								teleportOrb->SetPhaseMask(2, true);	
																							 
						}*/

						ActivateSapphironOrb(); /*Quizá si haces la comprobación del estado de los bosses aquí, después de un crash se cargaría bien el orbe o incluso isDead de cada boss si el estado no se guarda*/
						break;
					case GO_BIRTH:
						if (hadSapphironBirth || GetBossState(BOSS_SAPPHIRON) == DONE)
						{
							hadSapphironBirth = true;
							go->Delete();
						}
						break;
                    default:
                        break;
                }

                AddDoor(go, true);
            }

            void OnGameObjectRemove(GameObject* go) override
            {
                /*if (go->GetGOInfo()->displayId == 6785 || go->GetGOInfo()->displayId == 1287)
                {
                    uint32 section = GetEruptionSection(go->GetPositionX(), go->GetPositionY());

                    HeiganEruptionGUID[section].erase(go->GetGUID());
                    return;
                }*/

                switch (go->GetEntry())
                {
                    /*case GO_BIRTH:
						if (hadSapphironBirth || GetBossState(BOSS_SAPPHIRON) == DONE)
						{
							hadSapphironBirth = true;
							go->Delete();
						}
						*/
                        break;
                    default:
                        break;
                }

                AddDoor(go, false);
            }

            void OnUnitDeath(Unit* unit) override
            {
                if (unit->GetTypeId() == TYPEID_PLAYER && IsEncounterInProgress())
                {
                    playerDied = 1;
                    SaveToDB();
                }
            }

            void SetData(uint32 id, uint32 value) override
            {
                switch (id)
                {
                    /*case DATA_HEIGAN_ERUPT:
                        HeiganErupt(value);
                        break;*/
                    case DATA_GOTHIK_GATE:
                        if (GameObject* gate = instance->GetGameObject(GothikGateGUID))
                            gate->SetGoState(GOState(value));
                        break;
                    case DATA_HORSEMEN0:
                    case DATA_HORSEMEN1:
                    case DATA_HORSEMEN2:
                    case DATA_HORSEMEN3:
                        if (value == NOT_STARTED)
                        {
                            minHorsemenDiedTime = 0;
                            maxHorsemenDiedTime = 0;
                        }
                        else if (value == DONE)
                        {
                            time_t now = time(NULL);

                            if (minHorsemenDiedTime == 0)
                                minHorsemenDiedTime = now;

                            maxHorsemenDiedTime = now;
                        }
                        break;
                    case DATA_ABOMINATION_KILLED:
                        AbominationCount = value;
                        break;
					case DATA_TELEPORT_ORB:
						if(GameObject* teleportOrb = instance->GetGameObject(TeleportOrbGUID)){
							teleportOrb->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
							orbEnabled = true;
							//teleportOrb->SetPhaseMask(1, true);	/*Está en 2 y pasa a uno.*/											 
						}
						break;
					case DATA_HAD_SAPPHIRON_BIRTH:
						hadSapphironBirth = (value == 1u);
						break;
					default:
						break;
                }
            }

            uint32 GetData(uint32 id) const override
            {
                switch (id)
                {
                    case DATA_ABOMINATION_KILLED:
                        return AbominationCount;
					case DATA_TELEPORT_ORB:
						return TeleportOrbGUID;
					case DATA_HAD_SAPPHIRON_BIRTH:
						return hadSapphironBirth ? 1u : 0u;
                    default:
                        break;
                }

                return 0;
            }

			ObjectGuid GetGuidData(uint32 id) const override
            {
                switch (id)
                {
					case DATA_GROBBULUS:
						return GrobbulusGUID;
					case DATA_PATCHWERK:
						return PatchwerkGUID;
					case DATA_GLUTH:
						return GluthGUID;
                    case DATA_FAERLINA:
                        return FaerlinaGUID;
					case DATA_MAEXXNA:
						return MaexxnaGUID;
                    case DATA_THANE:
                        return ThaneGUID;
                    case DATA_LADY:
                        return LadyGUID;
                    case DATA_BARON:
                        return BaronGUID;
                    case DATA_SIR:
                        return SirGUID;
                    case DATA_THADDIUS:
                        return ThaddiusGUID;
                    case DATA_HEIGAN:
                        return HeiganGUID;
					case DATA_LOATHEB:
						return LoathebGUID;
                    case DATA_FEUGEN:
                        return FeugenGUID;
                    case DATA_STALAGG:
                        return StalaggGUID;
                    case DATA_KELTHUZAD:
                        return KelthuzadGUID;
                    case DATA_KELTHUZAD_PORTAL01:
                        return PortalsGUID[0];
                    case DATA_KELTHUZAD_PORTAL02:
                        return PortalsGUID[1];
                    case DATA_KELTHUZAD_PORTAL03:
                        return PortalsGUID[2];
                    case DATA_KELTHUZAD_PORTAL04:
                        return PortalsGUID[3];
                    case DATA_KELTHUZAD_TRIGGER:
                        return KelthuzadTriggerGUID;
					case DATA_THADDIUS_LAMMENT_BUNNY01:
						return ThaddiusLammentBunny01GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY02:
						return ThaddiusLammentBunny02GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY03:
						return ThaddiusLammentBunny03GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY04:
						return ThaddiusLammentBunny04GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY05:
						return ThaddiusLammentBunny05GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY06:
						return ThaddiusLammentBunny06GUID;
					case DATA_THADDIUS_LAMMENT_BUNNY07:
						return ThaddiusLammentBunny07GUID;
					case DATA_STALAGG_TESLA_COIL:
						return StalaggTeslaCoilGUID;
					case DATA_FEUGEN_TESLA_COIL:
						return FeugenTeslaCoilGUID;
					case DATA_SAPPHIRON:
						return SapphironGUID;
					case DATA_PLAGUE_QUARTER_RAMP:
						return PlagueQuarterRamp;
					case DATA_ARACHNID_QUARTER_RAMP:
						return ArachnidQuarterRamp;
					case DATA_MILITARY_QUARTER_RAMP:
						return MilitaryQuarterRamp;
					case DATA_CONSTRUCT_QUARTER_RAMP:						
						return ConstructQuarterRamp;
                }

				return ObjectGuid::Empty;
            }

            bool SetBossState(uint32 id, EncounterState state) override
            {
                if (!InstanceScript::SetBossState(id, state))
                    return false;

				if(state == DONE){
					switch(id)
					{
						case BOSS_HORSEMEN:
							if (GameObject* horsemenChest = instance->GetGameObject(HorsemenChestGUID))
							{
								horsemenChest->SetRespawnTime(horsemenChest->GetRespawnDelay());
								horsemenChest->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
							}
							break;
						default:
							break;
					}				
				}

				ActivateSapphironOrb();
                return true;
            }

            void Update(uint32 diff) override
            {
                if (events.Empty())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
				{
					switch(eventId)
					{			
						case EVENT_SUMMON_FROGGER_WAVE:
						{
							std::list<TempSummon*> spawns;
							instance->SummonCreatureGroup(nextFroggerWave, &spawns);
							if (!spawns.empty())
								(*spawns.begin())->GetMotionMaster()->MovePath(10 * NPC_FROGGER + nextFroggerWave, false);
							events.Repeat(Seconds(1) + Milliseconds(666));
							nextFroggerWave = (nextFroggerWave + 1) % 3;
							break;
						}
						case EVENT_BOSS_CHECK:
							ActivateSapphironOrb();
							break;
						case EVENT_THADDIUS_LAMENTS:

							if (Creature* thaddius = instance->GetCreature(GetGuidData(DATA_THADDIUS)))
							{								

								if(thaddius && thaddius->IsAlive() && !thaddius->IsInCombat())
								{
									thaddius->AI()->Talk(5);

									if(Creature* ThaddiusLammentbunny01 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY01)))
									{
										ThaddiusLammentbunny01->AI()->Talk(1); //381532
									}

									if(Creature* ThaddiusLammentbunny02 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY02)))
									{
										ThaddiusLammentbunny02->AI()->Talk(1); //381532
									}
									if(Creature* ThaddiusLammentbunny03 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY03)))
									{
										ThaddiusLammentbunny03->AI()->Talk(1); //381532
									}
									if(Creature* ThaddiusLammentbunny04 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY04)))
									{
										ThaddiusLammentbunny04->AI()->Talk(1); //381532
									}

									if(Creature* ThaddiusLammentbunny05 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY05)))
									{
										ThaddiusLammentbunny05->AI()->Talk(1); //381532
									}
									if(Creature* ThaddiusLammentbunny06 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY06)))
									{
										ThaddiusLammentbunny06->AI()->Talk(1); //381532
									}
									if(Creature* ThaddiusLammentbunny07 = instance->GetCreature(GetGuidData(DATA_THADDIUS_LAMMENT_BUNNY07)))
									{
										ThaddiusLammentbunny07->AI()->Talk(1); //381532
									}

									/*for(uint32 bunny=0; bunny < sizeof(ThaddiusLammentList); bunny++)
									{
										if(Creature* ThaddiusLammentBunny = instance->GetCreature(GetGuidData(ThaddiusLammentList[bunny])))
										{
											if(ThaddiusLammentBunny->IsAlive())
												ThaddiusLammentBunny->AI()->Talk(1);									
										}
									
									}*/		            
								}

							}

							//Lista de IDS y hacer blucle


							events.ScheduleEvent(EVENT_THADDIUS_LAMENTS, 120*IN_MILLISECONDS);
							break;
						default:
							break;
					}
				}
			}

            bool ActivateSapphironOrb()
            {

                uint32 numBossDead = 0;
                for (uint32 i = 0; i < EncounterCount; ++i)
                    if (GetBossState(i) == DONE)
                        numBossDead++;

                if (numBossDead >= 13 && !orbEnabled)
                    SetData(DATA_TELEPORT_ORB, 0);


                //events.CancelEvent(EVENT_BOSS_CHECK);
                //events.ScheduleEvent(EVENT_BOSS_CHECK, 15*IN_MILLISECONDS);
                return true;

            }
            // This Function is called in CheckAchievementCriteriaMeet and CheckAchievementCriteriaMeet is called before SetBossState(bossId, DONE),
            // so to check if all bosses are done the checker must exclude 1 boss, the last done, if there is at most 1 encouter in progress when is
            // called this function then all bosses are done. The one boss that check is the boss that calls this function, so it is dead.
            bool AreAllEncoutersDone()
            {
                uint32 numBossAlive = 0;
                for (uint32 i = 0; i < EncounterCount; ++i)
                    if (GetBossState(i) != DONE)
                        numBossAlive++;

                if (numBossAlive > 1)
                    return false;
                return true;
            }

            bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target = NULL*/, uint32 /*miscvalue1 = 0*/)
            {
                switch (criteria_id)
                {
                    case 7600:  // Criteria for achievement 2176: And They Would All Go Down Together 15sec of each other 10-man
                        if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && (maxHorsemenDiedTime - minHorsemenDiedTime) < 15)
                            return true;
                        return false;
                    case 7601:  // Criteria for achievement 2177: And They Would All Go Down Together 15sec of each other 25-man
                        if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && (maxHorsemenDiedTime - minHorsemenDiedTime) < 15)
                            return true;
                        return false;
                    // Difficulty checks are done on DB.
                    // Criteria for achievement 2186: The Immortal (25-man)
                    case 13233: // The Four Horsemen
                    case 13234: // Maexxna
                    case 13235: // Thaddius
                    case 13236: // Loatheb
                    case 7616:  // Kel'Thuzad
                    // Criteria for achievement 2187: The Undying (10-man)
                    case 13237: // The Four Horsemen
                    case 13238: // Maexxna
                    case 13239: // Loatheb
                    case 13240: // Thaddius
                    case 7617:  // Kel'Thuzad
                        if (AreAllEncoutersDone() && !playerDied)
                            return true;
                        return false;
                }

                return false;
            }

        protected:

			ObjectGuid PatchwerkGUID;
			ObjectGuid GrobbulusGUID;
			ObjectGuid GluthGUID;

            /* The Arachnid Quarter */
            // Grand Widow Faerlina
			ObjectGuid FaerlinaGUID;
			ObjectGuid MaexxnaGUID;
            /* The Plague Quarter */
            // Heigan the Unclean
            std::set<ObjectGuid> HeiganEruptionGUID[4];
			ObjectGuid HeiganGUID;
			ObjectGuid LoathebGUID;
            /* The Military Quarter */
            // Gothik the Harvester
			ObjectGuid GothikGateGUID;
            // The Four Horsemen
			ObjectGuid ThaneGUID;
			ObjectGuid LadyGUID;
			ObjectGuid BaronGUID;
			ObjectGuid SirGUID;
			ObjectGuid HorsemenChestGUID;
			ObjectGuid HorsemenTeleporterGUID;
            time_t minHorsemenDiedTime;
            time_t maxHorsemenDiedTime;

            /* The Construct Quarter */
            // Thaddius
			ObjectGuid ThaddiusGUID;
			ObjectGuid FeugenGUID;
			ObjectGuid StalaggGUID;

			ObjectGuid FeugenTeslaCoilGUID;
			ObjectGuid StalaggTeslaCoilGUID;

			/* Thaddius Lamment bunnies */

			ObjectGuid ThaddiusLammentBunny01GUID;
			ObjectGuid ThaddiusLammentBunny02GUID;
			ObjectGuid ThaddiusLammentBunny03GUID;
			ObjectGuid ThaddiusLammentBunny04GUID;
			ObjectGuid ThaddiusLammentBunny05GUID;
			ObjectGuid ThaddiusLammentBunny06GUID;
			ObjectGuid ThaddiusLammentBunny07GUID;

            /* Frostwyrm Lair */
            // Sapphiron
			ObjectGuid SapphironGUID;
            // Kel'Thuzad
			ObjectGuid KelthuzadGUID;
			ObjectGuid KelthuzadTriggerGUID;
			ObjectGuid PortalsGUID[4];
            uint8 AbominationCount;

			ObjectGuid PlagueQuarterRamp;
			ObjectGuid ArachnidQuarterRamp;
			ObjectGuid MilitaryQuarterRamp;
			ObjectGuid ConstructQuarterRamp;

            /* The Immortal / The Undying */
            uint32 playerDied;
			int8 nextFroggerWave;

			/**/
			ObjectGuid TeleportOrbGUID;
			bool orbEnabled;

			bool PatchwerkDone;
			bool GrobbulusDone;
			bool GluthDone;	

			EventMap events;

			bool hadSapphironBirth;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_naxxramas_InstanceMapScript(map);
        }
};

class npc_living_poison : public CreatureScript
{
    public:
        npc_living_poison() : CreatureScript("npc_living_poison") { }

        struct npc_living_poisonAI : public ScriptedAI
        {
            npc_living_poisonAI(Creature* creature) : ScriptedAI(creature),
                instance(creature->GetInstanceScript())
            {
				
            }

         void MoveInLineOfSight(Unit* who) override
		 {
			 if(who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 3.0f, true))
			 {
				 DoCast(who, SPELL_LIVING_POISON_EXPLOSION);
			 }
         }

		void UpdateAI(uint32 Diff) override
		{
			if(Player* player = me->SelectNearestPlayer(3.0f))
			{
				if(player->IsAlive())
					DoCast(player, SPELL_LIVING_POISON_EXPLOSION);
			}			
			
		}

        private:
            InstanceScript* const instance;
			Creature* myDespawnPoint;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_living_poisonAI>(creature);
        }
};

class npc_mr_bigglesworth : public CreatureScript
{
    public:
        npc_mr_bigglesworth() : CreatureScript("npc_mr_bigglesworth") { }

        struct npc_mr_bigglesworthAI : public ScriptedAI
        {
            npc_mr_bigglesworthAI(Creature* creature) : ScriptedAI(creature),
                instance(creature->GetInstanceScript())
            {
            }

		void JustDied(Unit* /*Killer*/) override
		{
			if(Creature* kelThuzadBunny = me->FindNearestCreature(381531, 100.0f, true))
			{
				kelThuzadBunny->AI()->Talk(0);
			}
		}

        private:
            InstanceScript* const instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_mr_bigglesworthAI>(creature);
        }
};

class npc_dialog_controller : public CreatureScript
{
    public:
        npc_dialog_controller() : CreatureScript("npc_dialog_controller") { }

        struct npc_dialog_controllerAI : public ScriptedAI
        {
            npc_dialog_controllerAI(Creature* creature) : ScriptedAI(creature),
                instance(creature->GetInstanceScript()), introDone(false), introInProcess(false), lichKing("The Lich King"), kelThuzad("Kel'Thuzad")
            {					
				
            }


		void UpdateAI(uint32 diff) override
		{
			if(introDone)
				return;
			
			if(!introInProcess)
			{				
				if (Creature* sapphiron = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_SAPPHIRON)))
				{
					if(!sapphiron->IsAlive())
					{
						if(Player* player = me->SelectNearestPlayer(125.0f))
						{					
							events.ScheduleEvent(EVENT_KT_LK_DIALOG1_KT, 6000);
							introInProcess=true;							
						}
					}				
				}				
			}

			events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
				{
					case EVENT_KT_LK_DIALOG1_KT:
							me->SetName(kelThuzad);
							me->AI()->Talk(0);
							events.ScheduleEvent(EVENT_KT_LK_DIALOG2_LICH, 9000);								
						break;
					case EVENT_KT_LK_DIALOG2_LICH:
							me->SetName(lichKing);
							me->AI()->Talk(1);
							events.ScheduleEvent(EVENT_KT_LK_DIALOG3_KT, 17000);						
						break;
					case EVENT_KT_LK_DIALOG3_KT:
							me->SetName(kelThuzad);
							me->AI()->Talk(2);
							events.ScheduleEvent(EVENT_KT_LK_DIALOG4_LICH, 10000);						
						break;
					case EVENT_KT_LK_DIALOG4_LICH:
							me->SetName(lichKing);
							me->AI()->Talk(3);
							events.ScheduleEvent(EVENT_KT_LK_DIALOG5_KT, 11000);						
						break;
					case EVENT_KT_LK_DIALOG5_KT:
						me->SetName(kelThuzad);
						me->AI()->Talk(4);					
						introInProcess = false;
						introDone = true;
						break;
					default:
						break;
				}			
			}

		}
        private:
            InstanceScript* const instance;
			EventMap events;
			bool introInProcess;
			bool introDone;
			const std::string lichKing;
			const std::string kelThuzad;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_dialog_controllerAI>(creature);
        }
};

class npc_naxxramas_teleport : public CreatureScript
{
public:
    npc_naxxramas_teleport() : CreatureScript("npc_naxxramas_teleport") { }

    struct npc_naxxramas_teleportAI : public ScriptedAI
    {
        npc_naxxramas_teleportAI(Creature* creature) : ScriptedAI(creature),
		instance(creature->GetInstanceScript())
        {
			me->SetVisible(false);
        }

        void Reset() override { }

        void EnterCombat(Unit* /*who*/) override { }

        void AttackStart(Unit* /*who*/) override { }

        void MoveInLineOfSight(Unit* who) override

        {
            if (!who)
                return;

            if (!me->IsWithinDist(who, 5.0f, false))
                return;

            Player* player = who->ToPlayer();

            if (!player)
                return;			
            switch (me->GetEntry())
            {
                case 381550: 
					if(instance->GetBossState(BOSS_LOATHEB)==DONE) //Creature* loatheb = Unit::GetCreature(*me, instance->GetGuidData(DATA_LOATHEB))
					{
						Creature* plagueRamp = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_PLAGUE_QUARTER_RAMP));

						if(plagueRamp) //!loatheb->IsAlive() &&
						{									
							player->TeleportTo(plagueRamp->GetMapId(), plagueRamp->GetPositionX(), plagueRamp->GetPositionY(), plagueRamp->GetPositionZ(), plagueRamp->GetOrientation());
						}
					}
                    break;
				case 381552:
					if(instance->GetBossState(BOSS_MAEXXNA)==DONE) //Creature* maexxna = Unit::GetCreature(*me, instance->GetGuidData(DATA_MAEXXNA))
					{
						
						Creature* arachnidRamp = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_ARACHNID_QUARTER_RAMP));

						if(arachnidRamp) //!maexxna->IsAlive() &&
						{									
							player->TeleportTo(arachnidRamp->GetMapId(), arachnidRamp->GetPositionX(), arachnidRamp->GetPositionY(), arachnidRamp->GetPositionZ(), arachnidRamp->GetOrientation());
						}
					}
					break;
				case 381554:
					if(instance->GetBossState(BOSS_HORSEMEN)==DONE) //Creature* fourHorsemen = Unit::GetCreature(*me, instance->GetGuidData(DATA_FOUR_HORSEMAN))
					{
						Creature* militaryRamp = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_MILITARY_QUARTER_RAMP));

						if(militaryRamp) //!maexxna->IsAlive() &&
						{									
							player->TeleportTo(militaryRamp->GetMapId(), militaryRamp->GetPositionX(), militaryRamp->GetPositionY(), militaryRamp->GetPositionZ(), militaryRamp->GetOrientation());
						}
					}
					break;
				case 381556:					
					if(instance->GetBossState(BOSS_THADDIUS)==DONE) //Creature* fourHorsemen = Unit::GetCreature(*me, instance->GetGuidData(DATA_FOUR_HORSEMAN))
					{						
						
						Creature* constructRamp = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_CONSTRUCT_QUARTER_RAMP));
						
						if(constructRamp) //!maexxna->IsAlive() &&
						{											
							player->TeleportTo(constructRamp->GetMapId(), constructRamp->GetPositionX(), constructRamp->GetPositionY(), constructRamp->GetPositionZ(), constructRamp->GetOrientation());
						}
					}
					break;
            }            
            return;
        }

        void UpdateAI(uint32 /*diff*/) override { }

		private:
			InstanceScript* const instance;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_naxxramas_teleportAI(creature);
    }
};

void AddSC_instance_naxxramas()
{
    new instance_naxxramas();
	new npc_living_poison();
	new npc_mr_bigglesworth();
	new npc_dialog_controller();
	new npc_naxxramas_teleport();
}
