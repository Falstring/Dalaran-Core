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

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "Player.h"
#include "nexus.h"
#include "ScriptedCreature.h"

enum Factions
{
    FACTION_HOSTILE_FOR_ALL                       = 16
};

class instance_nexus : public InstanceMapScript
{
    public:
        instance_nexus() : InstanceMapScript(NexusScriptName, 576) { }

        struct instance_nexus_InstanceMapScript : public InstanceScript
        {
            instance_nexus_InstanceMapScript(Map* map) : InstanceScript(map)
            {
                SetHeaders(DataHeader);
                SetBossNumber(EncounterCount);
                _teamInInstance = 0;
            }

            void OnPlayerEnter(Player* player) override
            {
                if (!_teamInInstance)
                    _teamInInstance = player->GetTeam();
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_ANOMALUS:
                        AnomalusGUID = creature->GetGUID();
                        break;
                    case NPC_KERISTRASZA:
                        KeristraszaGUID = creature->GetGUID();
                        break;
                    // Alliance npcs are spawned by default, if you are alliance, you will fight against horde npcs.
                    case NPC_ALLIANCE_BERSERKER:
                        if (ServerAllowsTwoSideGroups())
                            creature->setFaction(FACTION_HOSTILE_FOR_ALL);
                        if (_teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_HORDE_BERSERKER);
                        break;
                    case NPC_ALLIANCE_RANGER:
                        if (ServerAllowsTwoSideGroups())
                            creature->setFaction(FACTION_HOSTILE_FOR_ALL);
                        if (_teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_HORDE_RANGER);
                        break;
                    case NPC_ALLIANCE_CLERIC:
                        if (ServerAllowsTwoSideGroups())
                            creature->setFaction(FACTION_HOSTILE_FOR_ALL);
                        if (_teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_HORDE_CLERIC);
                        break;
                    case NPC_ALLIANCE_COMMANDER:
                        if (ServerAllowsTwoSideGroups())
                            creature->setFaction(FACTION_HOSTILE_FOR_ALL);
                        if (_teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_HORDE_COMMANDER);
                        break;
                    case NPC_COMMANDER_STOUTBEARD:
                        if (ServerAllowsTwoSideGroups())
                            creature->setFaction(FACTION_HOSTILE_FOR_ALL);
                        if (_teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_COMMANDER_KOLURG);
                        break;
                    default:
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                    case GO_ANOMALUS_CONTAINMET_SPHERE:
                        AnomalusContainmentSphere = go->GetGUID();
                        if (GetBossState(DATA_ANOMALUS) == DONE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        break;
                    case GO_ORMOROKS_CONTAINMET_SPHERE:
                        OrmoroksContainmentSphere = go->GetGUID();
                        if (GetBossState(DATA_ORMOROK) == DONE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        break;
                    case GO_TELESTRAS_CONTAINMET_SPHERE:
                        TelestrasContainmentSphere = go->GetGUID();
                        if (GetBossState(DATA_MAGUS_TELESTRA) == DONE)
                            go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
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
                    case DATA_MAGUS_TELESTRA:
                        if (state == DONE)
                        {
                            if (GameObject* sphere = instance->GetGameObject(TelestrasContainmentSphere))
                                sphere->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        }
                        break;
                    case DATA_ANOMALUS:
                        if (state == DONE)
                        {
                            if (GameObject* sphere = instance->GetGameObject(AnomalusContainmentSphere))
                                sphere->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        }
                        break;
                    case DATA_ORMOROK:
                        if (state == DONE)
                        {
                            if (GameObject* sphere = instance->GetGameObject(OrmoroksContainmentSphere))
                                sphere->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                        }
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
                    case DATA_ANOMALUS:
                        return AnomalusGUID;
                    case DATA_KERISTRASZA:
                        return KeristraszaGUID;
                    case ANOMALUS_CONTAINMET_SPHERE:
                        return AnomalusContainmentSphere;
                    case ORMOROKS_CONTAINMET_SPHERE:
                        return OrmoroksContainmentSphere;
                    case TELESTRAS_CONTAINMET_SPHERE:
                        return TelestrasContainmentSphere;
                    default:
                        break;
                }

                return ObjectGuid::Empty;
            }

        private:
            ObjectGuid AnomalusGUID;
            ObjectGuid KeristraszaGUID;
            ObjectGuid AnomalusContainmentSphere;
            ObjectGuid OrmoroksContainmentSphere;
            ObjectGuid TelestrasContainmentSphere;
            uint32 _teamInInstance;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_nexus_InstanceMapScript(map);
        }
};

enum eFrayer
{
	SPELL_SUMMON_SEED_POD = 52796,
	SPELL_SEED_POD = 48082,
	SPELL_AURA_OF_REGENERATION = 52067,
	SPELL_CRYSTAL_BLOOM = 48058,
	SPELL_ENSNARE = 48053
};

class npc_crystalline_frayer : public CreatureScript
{
public:
	npc_crystalline_frayer() : CreatureScript("npc_crystalline_frayer") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return GetInstanceAI<npc_crystalline_frayerAI>(creature);
	}

	struct npc_crystalline_frayerAI : public ScriptedAI
	{
		npc_crystalline_frayerAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		bool _allowDeath;
		uint32 restoreTimer;
		uint32 abilityTimer1;
		uint32 abilityTimer2;

		void Reset()
		{
			restoreTimer = 0;
			abilityTimer1 = 0;
			abilityTimer2 = 30000;
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		void EnterCombat(Unit*)
		{
			_allowDeath = me->GetInstanceScript()->GetBossState(DATA_ORMOROK) == DONE;
		}

		void EnterEvadeMode()
		{
			if (me->isRegeneratingHealth())
				ScriptedAI::EnterEvadeMode();
		}

		void DamageTaken(Unit*, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				if (!_allowDeath)
				{
					me->RemoveAllAuras();
					me->DeleteThreatList();
					me->CombatStop(true);
					damage = 0;

					me->SetReactState(REACT_PASSIVE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setRegeneratingHealth(false);
					me->CastSpell(me, SPELL_SUMMON_SEED_POD, true);
					me->CastSpell(me, SPELL_SEED_POD, true);
					me->CastSpell(me, SPELL_AURA_OF_REGENERATION, false);
					restoreTimer = 1;
				}
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (restoreTimer)
			{
				restoreTimer += diff;
				if (restoreTimer >= 90 * IN_MILLISECONDS)
				{
					Talk(0);
					me->setRegeneratingHealth(true);
					restoreTimer = 0;
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				}
				return;
			}

			if (!UpdateVictim())
				return;

			abilityTimer1 += diff;
			abilityTimer2 += diff;

			if (abilityTimer1 >= 5000)
			{
				me->CastSpell(me->GetVictim(), SPELL_ENSNARE, false);
				abilityTimer1 = 0;
			}

			if (abilityTimer2 >= 30000)
			{
				me->CastSpell(me->GetVictim(), SPELL_CRYSTAL_BLOOM, false);
				abilityTimer2 = 0;
			}
		}
	};
};

void AddSC_instance_nexus()
{
    new instance_nexus();
	new npc_crystalline_frayer();
}
