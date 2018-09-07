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

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "gnomeregan.h"
#include "Player.h"

#define    MAX_ENCOUNTER  1

class instance_gnomeregan : public InstanceMapScript
{
public:
    instance_gnomeregan() : InstanceMapScript("instance_gnomeregan", 90) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_gnomeregan_InstanceMapScript(map);
    }

    struct instance_gnomeregan_InstanceMapScript : public InstanceScript
    {
        instance_gnomeregan_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            SetHeaders(DataHeader);
            memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        }

        uint32 m_auiEncounter[MAX_ENCOUNTER];

        ObjectGuid uiCaveInLeftGUID;
        ObjectGuid uiCaveInRightGUID;

        ObjectGuid uiBastmasterEmiShortfuseGUID;

        ObjectGuid uiMekgineerThermapluggGUID;

        void Load(const char* in) override
        {
            if (!in)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(in);

            std::istringstream loadStream(in);
            loadStream >> m_auiEncounter[0];

            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            {
                if (m_auiEncounter[i] == IN_PROGRESS)
                    m_auiEncounter[i] = NOT_STARTED;
            }

            OUT_LOAD_INST_DATA_COMPLETE;
        }

        void OnCreatureCreate(Creature* creature) override
        {
            switch (creature->GetEntry())
            {
                case NPC_BLASTMASTER_EMI_SHORTFUSE: 
                    uiBastmasterEmiShortfuseGUID = creature->GetGUID(); 
                    break;
                case NPC_MEKGINEER_THERMAPLUG:
                    uiMekgineerThermapluggGUID = creature->GetGUID();
                    break;
            }
        }

        void OnGameObjectCreate(GameObject* go) override
        {
            switch (go->GetEntry())
            {
                case GO_CAVE_IN_LEFT:
                    uiCaveInLeftGUID = go->GetGUID();
                    if (m_auiEncounter[0] == DONE || m_auiEncounter[0] == NOT_STARTED)
                        HandleGameObject(ObjectGuid::Empty, false, go);
                    break;
                case GO_CAVE_IN_RIGHT:
                    uiCaveInRightGUID = go->GetGUID();
                    if (m_auiEncounter[0] == DONE || m_auiEncounter[0] == NOT_STARTED)
                        HandleGameObject(ObjectGuid::Empty, false, go);
                    break;
            }
        }

        void SetData(uint32 uiType, uint32 uiData) override
        {
            switch (uiType)
            {
                case TYPE_EVENT:
                    m_auiEncounter[0] = uiData;
                    if (uiData == DONE)
                        SaveToDB();
                    break;
            }
        }

        uint32 GetData(uint32 uiType) const override
        {
            switch (uiType)
            {
            case GO_BUTTON_01:
                return GO_GNOME_FACE_01;
            case GO_BUTTON_02:
                return GO_GNOME_FACE_02;
            case GO_BUTTON_03:
                return GO_GNOME_FACE_03;
            case GO_BUTTON_04:
                return GO_GNOME_FACE_04;
            case GO_BUTTON_05:
                return GO_GNOME_FACE_05;
            case GO_BUTTON_06:
                return GO_GNOME_FACE_06;
            case TYPE_EVENT:    
                return m_auiEncounter[0];
                default:
                    break;
            }
            return 0;
        }

        ObjectGuid GetGuidData(uint32 uiType) const override
        {
            switch (uiType)
            {
                case DATA_GO_CAVE_IN_LEFT:              
                    return uiCaveInLeftGUID;
                case DATA_GO_CAVE_IN_RIGHT:             
                    return uiCaveInRightGUID;
                case DATA_NPC_BASTMASTER_EMI_SHORTFUSE: 
                    return uiBastmasterEmiShortfuseGUID;
                case DATA_MEKGINEER_THERMAPLUGG:
                    return uiMekgineerThermapluggGUID;
            }

            return ObjectGuid::Empty;
        }
    };

};

enum eKernobee
{
    QUEST_A_FINE_MESS = 2904,
};

class npc_kernobee : public CreatureScript
{
    public:
        npc_kernobee() : CreatureScript("npc_kernobee") { }
                
        bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest)
        {
            if (quest->GetQuestId() == QUEST_A_FINE_MESS)
            {
                creature->SetStandState(UNIT_STAND_STATE_STAND);
                creature->AI()->SetGUID(player->GetGUID(), 0);
                creature->GetMotionMaster()->MoveFollow(player, PET_FOLLOW_DIST, 3.14f, MOTION_SLOT_CONTROLLED);
            }
            return true;
        }
    
        struct npc_kernobeeAI : public PassiveAI
        {
            npc_kernobeeAI(Creature* creature) : PassiveAI(creature)
            {
                playerGUID = ObjectGuid::Empty;
                checkTimer = 0;
            }
    
            uint32 checkTimer;
            ObjectGuid playerGUID;
    
            void SetGUID(ObjectGuid guid, int32 /*type*/) override
            {
                playerGUID = guid;
            }
    
            void UpdateAI(uint32 diff) override
            {
                checkTimer += diff;
                if (checkTimer >= 2000)
                {
                    checkTimer = 0;
                    if (me->GetDistance(-332.2f, -2.8f, -152.8f) < 5.0f)
                    {
                        if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                            player->GroupEventHappens(QUEST_A_FINE_MESS, me);
                        me->DespawnOrUnsummon(1000);
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_kernobeeAI(creature);
        }
};

void AddSC_instance_gnomeregan()
{
    new instance_gnomeregan();
    new npc_kernobee();
}
