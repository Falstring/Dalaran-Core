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
#include "sethekk_halls.h"
#include "ScriptedCreature.h"
#include "Player.h"

DoorData const doorData[] =
{
    { GO_IKISS_DOOR, DATA_TALON_KING_IKISS, DOOR_TYPE_PASSAGE, BOUNDARY_NONE },
    { 0,             0,                     DOOR_TYPE_ROOM,    BOUNDARY_NONE } // END
};

ObjectData const gameObjectData[] =
{
    { GO_TALON_KING_COFFER, DATA_TALON_KING_COFFER },
    { 0,                    0                      } // END
};

Position const PosCenter = { -87.5742f, 287.856f, 26.4832f, 4.4f };

class instance_sethekk_halls : public InstanceMapScript
{
    public:
        instance_sethekk_halls() : InstanceMapScript(SHScriptName, 556) { }

        struct instance_sethekk_halls_InstanceMapScript : public InstanceScript
        {
            instance_sethekk_halls_InstanceMapScript(Map* map) : InstanceScript(map)
            {
                SetHeaders(DataHeader);
                SetBossNumber(EncounterCount);
                LoadDoorData(doorData);
                LoadObjectData(nullptr, gameObjectData);
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_ANZU:
                    {
                        if (GetBossState(DATA_ANZU) == DONE || GetBossState(DATA_ANZU) == IN_PROGRESS)
                            creature->DisappearAndDie();
                        else
                        {
                            SetBossState(DATA_ANZU, IN_PROGRESS);
                            Anzu = creature->GetGUID();
                        }
                        break;
                    }
                    case NPC_RAVEN_GOD_TARGET:
                    {
                        RavenGodTarget = creature->GetGUID();
                        break;
                    }
                    case NPC_RAVEN_GOD_PORTAL:
                    {
                        RavenGodPortal = creature->GetGUID();
                        break;
                    }
                    case NPC_RAVEN_GOD_CASTER:
                    {
                        RavenGodCaster.push_back(creature->GetGUID());
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
                    case GO_RAVENS_CLAW:
                        RavensClaw = go->GetGUID();
                        break;
                    case GO_MOONSTONE:
                        Moonstone = go->GetGUID();
                        break;
                    case GO_RIFT:
                        Rift = go->GetGUID();
                        break;
                    case GO_IKISS_DOOR:                  
                        IkisDoorGUID = go->GetGUID();
                    case GO_TALON_KING_COFFER:
                        IkissCoffer = go->GetGUID();
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
                    case DATA_TALON_KING_IKISS:
                        if (state == DONE)
                        {
                            /// @workaround: GO_FLAG_INTERACT_COND remains on the gob, but it is not handled correctly in this case
                            ///              gameobject should have GO_DYNFLAG_LO_ACTIVATE too, which makes gobs interactable with GO_FLAG_INTERACT_COND
                            ///              so just removed GO_FLAG_INTERACT_COND
                            DoUseDoorOrButton(IkisDoorGUID, DAY*IN_MILLISECONDS);
                            if (GameObject* coffer = instance->GetGameObject(IkissCoffer))
                                coffer->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND | GO_FLAG_NOT_SELECTABLE);
                        }
                        break;
                    default:
                        break;
                }
                return true;
            }

            void DespawnIntroObjects()
            {
                if (GameObject* go = instance->GetGameObject(Moonstone))
                {
                    go->SetRespawnTime(DAY);
                    go->SetLootState(GO_JUST_DEACTIVATED);
                }

                if (GameObject* go = instance->GetGameObject(RavensClaw))
                {
                    go->SetRespawnTime(DAY);
                    go->SetLootState(GO_JUST_DEACTIVATED);
                }

                if (GameObject* go = instance->GetGameObject(Rift))
                {
                    go->SetRespawnTime(DAY);
                    go->SetLootState(GO_JUST_DEACTIVATED);
                }

                if (Creature* c = instance->GetCreature(RavenGodTarget))
                    c->DespawnOrUnsummon();

                if (Creature* c = instance->GetCreature(RavenGodPortal))
                    c->DespawnOrUnsummon();

                for (std::vector<ObjectGuid>::const_iterator itr = RavenGodCaster.begin(); itr != RavenGodCaster.end(); ++itr)
                    if (Creature* c = instance->GetCreature((*itr)))
                        c->DespawnOrUnsummon();
            }

            void Update(uint32 diff) override
            {
                if (!Events.IsInPhase(PHASE_ANZU_INTRO))
                    return;

                Events.Update(diff);

                while (uint32 eventId = Events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_ANZU_INTRO_1:
                        {
                            
                            if (Creature* redBall = instance->GetCreature(RavenGodTarget))
                            {
                                // Summon Rift GO
                                redBall->SummonGameObject(GO_RIFT, PosCenter.GetPositionX(), PosCenter.GetPositionY(), PosCenter.GetPositionZ() + 4.5f, PosCenter.GetOrientation(),
                                    0.f, 0.f, 0.f, 0.f, 0);

                                // Summon Moonstone GO
                                // Place Moonstone in Claw
                                redBall->SummonGameObject(GO_MOONSTONE, -87.5740f, 287.986f, 30.4532f, 3.97019f,
                                    0.f, 0.f, 0.f, 0.f, 0);

                                // Purple Banish Trigger NPC
                                redBall->CastSpell(redBall, SPELL_PURPLE_BANISH, TRIGGERED_FULL_MASK);
                            }

                            // summonTarget is used as handler
                            if (Creature* c = instance->GetCreature(RavenGodPortal))
                                c->CastSpell(c, SPELL_PORTAL, TRIGGERED_FULL_MASK);

                            if (GameObject* go = instance->GetGameObject(RavensClaw))
                                go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);

                            Events.ScheduleEvent(EVENT_ANZU_INTRO_2, Seconds(2));
                            break;
                        }
                        case EVENT_ANZU_INTRO_2:
                        {
                            if (Creature* redBall = instance->GetCreature(RavenGodTarget))
                            {
                                // Cast SPELL_SUMMONING_BEAMS on NPC_RAVEN_GOD_TARGET (Purple Banish Trigger NPC)
                                for (std::vector<ObjectGuid>::const_iterator itr = RavenGodCaster.begin(); itr != RavenGodCaster.end(); ++itr)
                                    if (Creature* c = instance->GetCreature((*itr)))
                                        c->CastSpell(redBall, SPELL_SUMMONING_BEAMS, TRIGGERED_FULL_MASK);

                                // NPC_RAVEN_GOD_TARGET starting to move to center position
                                if (Creature* redBall = instance->GetCreature(RavenGodTarget))
                                    redBall->GetMotionMaster()->MovePoint(0, PosCenter.GetPositionX(), PosCenter.GetPositionY(), PosCenter.GetPositionZ() + 8.5f, false);
                            }

                            Events.ScheduleEvent(EVENT_ANZU_INTRO_3, Seconds(18));
                            break;
                        }

                        case EVENT_ANZU_INTRO_3:
                        {
                            // Cast SPELL_SHAKE_CAMERA on all players
                            Map::PlayerList const &players = instance->GetPlayers();
                            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                                if (Player* player = itr->GetSource()->ToPlayer())
                                    player->CastSpell(player, SPELL_SHAKE_CAMERA, TRIGGERED_FULL_MASK);

                            Events.ScheduleEvent(EVENT_ANZU_INTRO_4, Seconds(8));
                            break;
                        }
                        case EVENT_ANZU_INTRO_4:
                        {
                            // Cast SPELL_RED_LIGHTNING on NPC_RAVEN_GOD_TARGET
                            if (Creature* c = instance->GetCreature(RavenGodTarget))
                                c->CastSpell(c, SPELL_RED_LIGHTNING, TRIGGERED_FULL_MASK);

                            Events.ScheduleEvent(EVENT_ANZU_INTRO_5, Seconds(1));
                            break;
                        }
                        case EVENT_ANZU_INTRO_5:
                        {
                            // Summon NPC_ANZU and despawn intro objects
                            if (Creature* c = instance->GetCreature(RavenGodTarget))
                                c->SummonCreature(NPC_ANZU, PosCenter.GetPositionX(), PosCenter.GetPositionY(), PosCenter.GetPositionZ(), 3.15f, TEMPSUMMON_DEAD_DESPAWN);

                            DespawnIntroObjects();
                            Events.SetPhase(0);
                            break;
                        }
                        default:
                            break;
                    }
                }
            }

            void ProcessEvent(WorldObject* /*gameObject*/, uint32 eventId) override
            {
                if (eventId == PHASE_ANZU_INTRO)
                {
                    Events.SetPhase(PHASE_ANZU_INTRO);
                    Events.ScheduleEvent(EVENT_ANZU_INTRO_1, Seconds(1));
                }
            }

            private:
                EventMap Events;

                ObjectGuid Anzu;
                ObjectGuid RavenGodTarget;
                ObjectGuid RavenGodPortal;
                ObjectGuid IkisDoorGUID;
                ObjectGuid IkissCoffer;
                std::vector<ObjectGuid> RavenGodCaster;

                ObjectGuid RavensClaw;
                ObjectGuid Moonstone;
                ObjectGuid Rift;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_sethekk_halls_InstanceMapScript(map);
        }
};

class go_ravens_claw : public GameObjectScript
{
    public:
        go_ravens_claw() : GameObjectScript("go_ravens_claw") { }

        bool OnGossipHello(Player* /*player*/, GameObject* go) override
        {
            if (InstanceScript* instance = go->GetInstanceScript())
            {
                if (instance->GetData(DATA_ANZU) != DONE)
                    instance->ProcessEvent(nullptr, PHASE_ANZU_INTRO);
            }

            return false;
        }
};

void AddSC_instance_sethekk_halls()
{
    new instance_sethekk_halls();
    new go_ravens_claw();
}
