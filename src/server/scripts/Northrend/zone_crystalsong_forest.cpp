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

/* Script Data Start
SDName: CrystalSongForest
SDAuthor: Malcrom
SD%Complete: 99%
SDComment:
SDCategory: CrystalsongForest
Script Data End */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"
#include "SmartScriptMgr.h"
#include "Transport.h"
#include "Vehicle.h"

/*******************************************************
 * npc_warmage_violetstand
 *******************************************************/

enum Spells
{
    SPELL_TRANSITUS_SHIELD_BEAM = 48310
};

enum NPCs
{
    NPC_TRANSITUS_SHIELD_DUMMY   = 27306,
    NPC_WARMAGE_SARINA           = 32369,
    NPC_WARMAGE_HALISTER         = 32371,
    NPC_WARMAGE_ILSUDRIA         = 32372
};

class npc_warmage_violetstand : public CreatureScript
{
public:
    npc_warmage_violetstand() : CreatureScript("npc_warmage_violetstand") { }

    struct npc_warmage_violetstandAI : public ScriptedAI
    {
        npc_warmage_violetstandAI(Creature* creature) : ScriptedAI(creature)
        {
            SetCombatMovement(false);
        }

        ObjectGuid targetGUID;

        void Reset() override
        {
            targetGUID.Clear();
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (me->IsNonMeleeSpellCast(false))
                return;

            if (me->GetEntry() == NPC_WARMAGE_SARINA)
            {
                if (!targetGUID)
                {
                    std::list<Creature*> orbList;
                    GetCreatureListWithEntryInGrid(orbList, me, NPC_TRANSITUS_SHIELD_DUMMY, 32.0f);
                    if (!orbList.empty())
                    {
                        for (Creature* orb : orbList)
                        {
                            if (orb->GetPositionY() < 1000)
                            {
                                targetGUID = orb->GetGUID();
                                break;
                            }
                        }
                    }
                }
            }
            else
            {
                if (!targetGUID)
                    if (Creature* pOrb = GetClosestCreatureWithEntry(me, NPC_TRANSITUS_SHIELD_DUMMY, 32.0f))
                        targetGUID = pOrb->GetGUID();

            }

            if (Creature* pOrb = ObjectAccessor::GetCreature(*me, targetGUID))
                DoCast(pOrb, SPELL_TRANSITUS_SHIELD_BEAM);

        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_warmage_violetstandAI(creature);
    }
};

enum ePreparationsForWar
{
    NPC_HAMMERHEAD                  = 30585,
    NPC_CLOUDBUSTER                 = 30470,
    SPELL_PARACHUTE                 = 44795,
    TRANSPORT_ORGRIMS_HAMMER        = 192241,
    TRANSPORT_THE_SKYBREAKER        = 192242
};

class npc_preparations_for_war_vehicle : public CreatureScript
{
    public:
        npc_preparations_for_war_vehicle() : CreatureScript("npc_preparations_for_war_vehicle") { }

        struct npc_preparations_for_war_vehicleAI : public NullCreatureAI
        {
            npc_preparations_for_war_vehicleAI(Creature* creature) : NullCreatureAI(creature)
            {
            }

            uint8 pointId;
            uint32 searchForShipTimer;
            uint32 checkPositionTimer;
            uint32 transportEntry;
            float oldX;
            float oldY;
            float advancedDistance;

            void InitializeAI() override
            {
                WPPath* path = sSmartWaypointMgr->GetPath(me->GetEntry());
                if (!path || path->empty())
                {
                    me->DespawnOrUnsummon(1);
                    return;
                }

                Movement::PointsArray pathPoints;
                pathPoints.push_back(G3D::Vector3(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()));

                uint32 wpCounter = 1;
                WPPath::const_iterator itr;
                while ((itr = path->find(wpCounter++)) != path->end())
                {
                    WayPoint* wp = itr->second;
                    pathPoints.push_back(G3D::Vector3(wp->x, wp->y, wp->z));
                }

                me->GetMotionMaster()->MoveSplinePath(&pathPoints);
                
                NullCreatureAI::InitializeAI();
                pointId = 0;
                searchForShipTimer = 0;
                checkPositionTimer = 2000;
                oldX = 0;
                oldY = 0;
                advancedDistance = 100.0f;
                transportEntry = (me->GetEntry() == NPC_HAMMERHEAD ? TRANSPORT_ORGRIMS_HAMMER : TRANSPORT_THE_SKYBREAKER);
            }

            void UpdateAI(uint32 diff) override
            {

                if (checkPositionTimer <= diff)
                {                            
                    if (me->IsWithinDist3d(6733.844f, 1153.338f, 658.0303f, 2.0f))
                        searchForShipTimer = 1500;
                        
                    checkPositionTimer = 2000;
                } else checkPositionTimer -= diff;                

                if (searchForShipTimer)
                {                    
                    searchForShipTimer += diff;
                    if (searchForShipTimer >= 1000)
                    {
                        searchForShipTimer = 1;

                        TransportsContainer const& transports = me->GetMap()->GetAllTransports();

                        for (TransportsContainer::const_iterator itr = transports.begin(); itr != transports.end(); ++itr)
                        {
                            if ((*itr)->GetEntry() == transportEntry)
                            {
                                if (transportEntry == TRANSPORT_THE_SKYBREAKER)
                                    advancedDistance = -50.0f;
                                else
                                    advancedDistance = 100.0f;

                                float x, y, z;
                                float actualX, actualY;

                                actualX = (*itr)->GetPositionX();
                                if (oldX != 0) {
                                    if (actualX <= oldX) {
                                        x = actualX - advancedDistance;  
                                    } else {
                                        x = actualX + advancedDistance;
                                    }                                    
                                } else {
                                    x = actualX;
                                }                                
                                oldX = actualX;                                

                                actualY = (*itr)->GetPositionY();
                                if (oldY != 0) {
                                    if (actualY <= oldY) {
                                        y = actualY - advancedDistance;
                                    } else {
                                        y = actualY + advancedDistance;
                                    }
                                } else {
                                    y = actualY;
                                }                                
                                oldY = actualY;                                

                                z = (*itr)->GetPositionZ() + 150.0f;    

                                if (me->IsWithinDist3d(x, y, z, 50.0f))
                                {            
                                    me->DespawnOrUnsummon(200);
                                    if (Vehicle* vehicle = me->GetVehicleKit())
                                        if (Unit* passenger = vehicle->GetPassenger(0))
                                        {                                                                                                                                
                                            passenger->CastSpell(passenger, SPELL_PARACHUTE, true);                                                
                                        }
                                }
                                else
                                {                                    
                                    me->GetMotionMaster()->MovePoint(0, x, y, z, false);
                                }
                                break;
                            }
                        }
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_preparations_for_war_vehicleAI(creature);
        }
};

void AddSC_crystalsong_forest()
{
    new npc_warmage_violetstand;
    new npc_preparations_for_war_vehicle();
}
