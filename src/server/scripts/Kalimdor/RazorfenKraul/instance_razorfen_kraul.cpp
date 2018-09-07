/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Instance_Razorfen_Kraul
SD%Complete:
SDComment:
SDCategory: Razorfen Kraul
EndScriptData */

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "razorfen_kraul.h"
#include "Player.h"
#include "PetAI.h"

#define WARD_KEEPERS_NR 2

class instance_razorfen_kraul : public InstanceMapScript
{
public:
    instance_razorfen_kraul() : InstanceMapScript("instance_razorfen_kraul", 47) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_razorfen_kraul_InstanceMapScript(map);
    }

    struct instance_razorfen_kraul_InstanceMapScript : public InstanceScript
    {
        instance_razorfen_kraul_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            SetHeaders(DataHeader);
            WardKeeperDeath = 0;
        }

        ObjectGuid DoorWardGUID;
        int WardKeeperDeath;

        Player* GetPlayerInMap()
        {
            Map::PlayerList const& players = instance->GetPlayers();
            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            {
                if (Player* player = itr->GetSource())
                    return player;
            }
            TC_LOG_DEBUG("scripts", "Instance Razorfen Kraul: GetPlayerInMap, but PlayerList is empty!");
            return NULL;
        }

        void OnGameObjectCreate(GameObject* go) override
        {
            switch (go->GetEntry())
            {
                case 21099: DoorWardGUID = go->GetGUID(); break;
                case 20920: go->SetUInt32Value(GAMEOBJECT_FACTION, 0); break; // big fat fugly hack
            }
        }

        void Update(uint32 /*diff*/) override
        {
            if (WardKeeperDeath == WARD_KEEPERS_NR)
                if (GameObject* go = instance->GetGameObject(DoorWardGUID))
                {
                    go->SetUInt32Value(GAMEOBJECT_FLAGS, 33);
                    go->SetGoState(GO_STATE_ACTIVE);
                }
        }

        void SetData(uint32 type, uint32 /*data*/) override
        {
            switch (type)
            {
                case EVENT_WARD_KEEPER: WardKeeperDeath++; break;
            }
        }

    };

};

enum SnufflenoseGopher
{
    NPC_SNUFFLENOSE_GOPHER = 4781,
    GO_BLUELEAF_TUBBER = 20920,
    ACTION_FIND_NEW_TUBBER = 0,
    POINT_TUBBER = 1,
};

struct DistanceOrder : public std::binary_function<GameObject, GameObject, bool>
{
    DistanceOrder(Creature* me) : me(me) {}

    bool operator() (GameObject* first, GameObject* second)
    {
        return me->GetDistanceOrder(first, second);
    }

    Creature* me;
};

struct npc_snufflenose_gopher : public CreatureScript
{
public:
    npc_snufflenose_gopher() : CreatureScript("npc_snufflenose_gopher") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_snufflenose_gopherAI(creature);
    }

    struct npc_snufflenose_gopherAI : public PetAI
    {
        npc_snufflenose_gopherAI(Creature* creature) : PetAI(creature) 
        { 
            me->SetReactState(REACT_PASSIVE);
        }

        void Reset()
        {
            IsMovementActive = false;
            if (me->ToTempSummon())
                if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                    me->GetMotionMaster()->MoveFollow(summoner, PET_FOLLOW_DIST, me->GetFollowAngle());
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE && id == POINT_TUBBER)
            {
                if (GameObject* go = me->GetMap()->GetGameObject(TargetTubberGUID))
                {
                    go->SetRespawnTime(5 * MINUTE);
                    go->Refresh();
                    go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                    Reset();
                }

                IsMovementActive = false;
            }
            else
                PetAI::MovementInform(type, id);
        }

        void DoFindNewTubber()
        {
            std::list<GameObject*> tubbersInRange;
            GetGameObjectListWithEntryInGrid(tubbersInRange, me, GO_BLUELEAF_TUBBER, 40.0f);

            if (tubbersInRange.empty())
            {
                Reset();
                return;
            }                

            tubbersInRange.sort(DistanceOrder(me));
            GameObject* nearestTubber = NULL;

            for (std::list<GameObject*>::const_iterator itr = tubbersInRange.begin(); itr != tubbersInRange.end(); ++itr)
            {
                if (!(*itr)->isSpawned() && (*itr)->HasFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND))
                {
                    nearestTubber = *itr;
                    break;
                }
            }

            if (!nearestTubber)
            {
                Reset();
                return;
            }

            TargetTubberGUID = nearestTubber->GetGUID();

            // XFurry was wrong...
            me->GetMotionMaster()->MovePoint(POINT_TUBBER, nearestTubber->GetPositionX(),
                nearestTubber->GetPositionY(),
                nearestTubber->GetPositionZ());
            IsMovementActive = true;
        }

        void UpdateAI(uint32 diff)
        {
            if (!IsMovementActive)
                PetAI::UpdateAI(diff);
        }

        void DoAction(int32 action)
        {
            if (action == ACTION_FIND_NEW_TUBBER)
                DoFindNewTubber();
        }

        bool IsMovementActive;
        ObjectGuid TargetTubberGUID;
    };
};

class spell_snufflenose_command : public SpellScriptLoader
{
public:
    spell_snufflenose_command() : SpellScriptLoader("spell_snufflenose_command") { }

    class spell_snufflenose_commandSpellScript : public SpellScript
    {
        PrepareSpellScript(spell_snufflenose_commandSpellScript);

        void HandleAfterCast()
        {
            if (Unit* target = ((Player*)GetCaster())->GetSelectedUnit())
                if (target->GetEntry() == NPC_SNUFFLENOSE_GOPHER)
                    if (Creature* ctarget = dynamic_cast<Creature*>(target))
                        ctarget->AI()->DoAction(ACTION_FIND_NEW_TUBBER);
        }

        void Register()
        {
            AfterCast += SpellCastFn(spell_snufflenose_commandSpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_snufflenose_commandSpellScript();
    }
};

void AddSC_instance_razorfen_kraul()
{
    new instance_razorfen_kraul();
    new npc_snufflenose_gopher();
    new spell_snufflenose_command();
}
