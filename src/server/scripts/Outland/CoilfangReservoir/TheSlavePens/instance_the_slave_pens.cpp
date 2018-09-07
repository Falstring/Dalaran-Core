/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
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

/*
This placeholder for the instance is needed for dungeon finding to be able
to give credit after the boss defined in lastEncounterDungeon is killed.
Without it, the party doing random dungeon won't get satchel of spoils and
gets instead the deserter debuff.
*/

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "the_slave_pens.h"
#include "ScriptedGossip.h"
#include "ScriptedCreature.h"
#include "CreatureAI.h"
#include "GameObject.h"
#include "LFGMgr.h"
#include "Player.h"
#include "Group.h"
#include "CreatureTextMgr.h"

class instance_the_slave_pens : public InstanceMapScript
{
public:
    instance_the_slave_pens() : InstanceMapScript(SPScriptName, 547) { }

	struct instance_the_slave_pens_InstanceMapScript : public InstanceScript
	{
		instance_the_slave_pens_InstanceMapScript(Map* map) : InstanceScript(map) { }

		void OnCreatureCreate(Creature* creature) override
		{
			switch (creature->GetEntry())
			{
			case NPC_AHUNE:
				AhuneGUID = creature->GetGUID();
				break;
			case NPC_FROZEN_CORE:
				FrozenCoreGUID = creature->GetGUID();
				break;
			case NPC_AHUNE_LOC_BUNNY:
				AhuneBunnyGUID = creature->GetGUID();
				break;
			case NPC_EARTHEN_RING_TOTEM:
				creature->SetObjectScale(2.0f);
				if (totemCount == 0)
					TotemAGUID = creature->GetGUID();
				else if (totemCount == 1)
					TotemBGUID = creature->GetGUID();
				else if (totemCount == 2)
					TotemCGUID = creature->GetGUID();
				totemCount++;
				break;
			case NPC_EARTHEN_RING_FLAMECALLER:
				if (flameCount == 0)
					FlameCallerAGUID = creature->GetGUID();
				else if (flameCount == 1)
					FlameCallerBGUID = creature->GetGUID();
				else if (flameCount == 2)
					FlameCallerCGUID = creature->GetGUID();
				flameCount++;
				break;
			default:
				break;
			}
		}

		ObjectGuid GetGuidData(uint32 type) const override
		{
			switch (type)
			{
			case DATA_AHUNE:
				return AhuneGUID;
			case DATA_AHUNE_BUNNY:
				return AhuneBunnyGUID;
			case DATA_FROZEN_CORE:
				return FrozenCoreGUID;
			case DATA_ICE_SPEAR:
				return IceSpearGUID;
			case DATA_TOTEM_A:
				return TotemAGUID;
			case DATA_TOTEM_B:
				return TotemBGUID;
			case DATA_TOTEM_C:
				return TotemCGUID;
			case DATA_FLAMECALLER_A:
				return FlameCallerAGUID;
			case DATA_FLAMECALLER_B:
				return FlameCallerBGUID;
			case DATA_FLAMECALLER_C:
				return FlameCallerCGUID;
			default:
				break;
			}
			return ObjectGuid::Empty;
		}

	protected:
		ObjectGuid IceSpearGUID;
		ObjectGuid AhuneGUID;
		ObjectGuid AhuneBunnyGUID;
		ObjectGuid FrozenCoreGUID;
		GuidSet TotemGUIDS;
		GuidSet FlameCallerGUIDS;
		ObjectGuid TotemAGUID;
		ObjectGuid TotemBGUID;
		ObjectGuid TotemCGUID;
		ObjectGuid FlameCallerAGUID;
		ObjectGuid FlameCallerBGUID;
		ObjectGuid FlameCallerCGUID;
		uint16 totemCount = 0;
		uint16 flameCount = 0;
	};

	InstanceScript* GetInstanceScript(InstanceMap* map) const override
	{
		return new instance_the_slave_pens_InstanceMapScript(map);
	}

};


enum Spells
{
	// Ahune
	SPELL_AHUNES_SHIELD = 45954,
	SPELL_COLD_SLAP = 46145,
	SPELL_MAKE_BONFIRE = 45930,
	SPELL_SUMMONING_VISUAL1 = 45937,
	//SPELL_SUMMONING_VISUAL2    = 45938,
	//SPELL_SUMMON_MINION_VISUAL = 46103,
	SPELL_RESURFACE = 46402,
	SPELL_SUMMON_LOOT = 46891,
	SPELL_AHUNE_ACHIEVEMENT = 62043,
	SPELL_SELF_STUN = 46416,
	SPELL_BEAM_ATTACK = 46336,
	SPELL_BEAM_ATTACK_BEAM = 46363,
	SPELL_BEAM = 45576, //Wrong Spell?
	SPELL_SUBMERGE = 37550,
	SPELL_EMERGE = 50142,
	SPELL_SNOWY = 46423,
	SPELL_KNOCK_TO = 46734,
	SPELL_SUMMON_COLDWEAVE = 46143,
	SPELL_SUMMON_FROSTWIND = 46382,
	SPELL_SUMMON_HAILSTONE = 46176,

	// Ice Spear
	SPELL_SUMMON_ICE_SPEAR_BUNNY = 46359,
	SPELL_SUMMON_ICE_SPEAR_GO = 46369,
	SPELL_ICE_SPEAR_KNOCKBACK = 46360,
	SPELL_ICE_SPEAR_VISUAL = 75498,
	//SPELL_ICE_SPEAR_AURA       = 46371,
	//SPELL_ICE_SPEAR_DELAY      = 46878,

	// Slippery Floor
	SPELL_SLIPPERY_FLOOR_AMBIENT = 46314,
	//SPELL_SLIP                 = 45947,
	//SPELL_YOU_SLIPPED          = 45946,
	//SPELL_SLIPPERY_FLOOR       = 45945,

	// Frozen Core
	SPELL_SYNCH_HEALTH = 46430,
	SPELL_SUICIDE = 45254,
	//SPELL_ICE_BOMBARDMENT      = 46396,
	//SPELL_FROZEN_CORE_HIT      = 46810,
	SPELL_GHOST_DISGUISE = 46786
};

enum Emotes
{
	EMOTE_EARTHEN_ASSAULT = 0,
	EMOTE_SUBMERGED = 1,
	EMOTE_EMERGE_SOON = 2,
};

enum Says
{
	SAY_PLAYER_TEXT_1 = 0,
	SAY_PLAYER_TEXT_2 = 1,
	SAY_PLAYER_TEXT_3 = 2
};

enum Events
{
	EVENT_EMERGE = 1,
	EVENT_SUBMERGE = 2,
	EVENT_ICE_SPEAR = 3,
	EVENT_COLD_SLAP = 4,
	EVENT_FLAMECALLER_BEAM = 5,
	EVENT_SUMMON_HAILSTONE = 6,
	EVENT_SUMMON_COLDWEAVE = 7,
	EVENT_SUMMON_FROSTWIND = 8,
	EVENT_SUMMON_SPEAR_BUNNY = 9,
	EVENT_EMOTE_EMERGE = 10,
	EVENT_EMOTE_SUBMERGE = 11,
	EVENT_EMOTE_EARTHEN_ATTACK = 12,
	EVENT_GHOST_VISUAL = 13,
	EVENT_REMOVE_GHOST_VISUAL = 14,
	EVENT_RESURFACE_SOON = 15,
	EVENT_EARTHEN_RING_ATTACK = 16,
	EVENT_ER_ATTACK_A = 17,
	EVENT_ER_ATTACK_B = 18,
	EVENT_ER_ATTACK_C = 19
};

enum Actions
{
	ACTION_START_EVENT = -2574500,
	ACTION_AHUNE_RETREAT = -2586500
};

enum Phases
{
	PHASE_ONE = 0,
	PHASE_TWO = 1
};

Position const SummonPositions[] =
{
	{ -95.523705f, -230.299057f, -1.256438f, 1.637029f },  // Ahune / Frozen-Core
	{ -135.871445f, -145.185211f, -1.851782f, 5.427049f }, // Totem A
	{ -129.179459f, -141.099503f, -1.992221f, 5.160010f }, // Totem B
	{ -122.147339f, -136.741470f, -2.285978f, 5.132535f }, // Totem C	
	{ -140.734543f, -139.580399f, -1.591881f, 5.427049f }, // Flamecaller A
	{ -134.587418f, -134.331085f, -1.855661f, 5.336747f }, // Flamecaller B
	{ -128.186356f, -130.267303f, -2.016853f, 5.460842f }, // Flamecaller C
	{ -73.4977f, -155.976f, -1.8987f, 3.23816f }           // Slippery Floor

};

class boss_ahune : public CreatureScript
{
public:
	boss_ahune() : CreatureScript("boss_ahune") { }

	struct boss_ahuneAI : public BossAI
	{
		boss_ahuneAI(Creature* creature) : BossAI(creature, DATA_AHUNE)
		{
			Initialize();
		}

		uint64 _attacks;
		bool _submerged;

		void Initialize()
		{
			_attacks = 0;
			_submerged = false;
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), SPELL_SUMMONING_VISUAL1, true);
			me->AddAura(SPELL_AHUNES_SHIELD, me);
			
		}

		void Reset() override
		{
			_Reset();
			Initialize();
			me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
			me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
		}

		void EnterCombat(Unit* who) override
		{
			DoZoneInCombat();
			events.SetPhase(PHASE_ONE);
			events.ScheduleEvent(EVENT_COLD_SLAP, 500, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 1000, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 8000, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_ICE_SPEAR, 9500, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_EMOTE_EARTHEN_ATTACK, 12000, 0, PHASE_ONE);
			me->SummonCreature(NPC_FROZEN_CORE, SummonPositions[0], TEMPSUMMON_CORPSE_DESPAWN);
		}

		void JustDied(Unit* /*killer*/) override
		{
			instance->DoCastSpellOnPlayers(SPELL_AHUNE_ACHIEVEMENT);
			DoCast(me, SPELL_SUMMON_LOOT);
			if (Creature* ahuneBunny = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AHUNE_BUNNY)))
				if (ahuneBunny)
					me->Kill(ahuneBunny);
			summons.DespawnAll();

			Map::PlayerList const& players = me->GetMap()->GetPlayers();
			if (!players.isEmpty())
			{
				if (Group* group = players.begin()->GetSource()->GetGroup())
					if (group->isLFGGroup())
						sLFGMgr->FinishDungeon(group->GetGUID(), 286);
			}
		}

		/*void DamageTaken(Unit* /*who, uint32& damage) override
		{
			if (Creature* core = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FROZEN_CORE)))
			{
				me->CastSpell(core, SPELL_SYNCH_HEALTH);
				if (core->GetHealth() > damage)
					core->SetHealth(core->GetHealth() - damage);
				else
					core->CastSpell(core, SPELL_SUICIDE);
			}
		}*/
		void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)	
		{
			if (summon->GetEntry() == NPC_FROZEN_CORE)
				me->DealDamage(me, me->GetHealth());
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_FROZEN_CORE:
				summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
				summon->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
				summon->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
				summon->SetReactState(REACT_PASSIVE);
				break;
			case NPC_SLIPPERY_FLOOR:
				summon->SetReactState(REACT_PASSIVE);
				summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
				me->AddAura(SPELL_SLIPPERY_FLOOR_AMBIENT, summon);
				break;
			}
			summon->SetInCombatWithZone();
			summons.Summon(summon);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_EMERGE:
					Emerge();
					break;
				case EVENT_EMOTE_EMERGE:
					Talk(EMOTE_EMERGE_SOON);
					break;
				case EVENT_SUBMERGE:
					Submerge();
					break;
				case EVENT_EMOTE_EARTHEN_ATTACK:
					Talk(EMOTE_EARTHEN_ASSAULT);
					events.ScheduleEvent(EVENT_ER_ATTACK_A, 1000, 0, PHASE_ONE);
					break;
				case EVENT_ER_ATTACK_A:
					EarthenAttack(DATA_TOTEM_A, DATA_FLAMECALLER_A);
					break;
				case EVENT_ER_ATTACK_B:
					EarthenAttack(DATA_TOTEM_B, DATA_FLAMECALLER_B);
					break;
				case EVENT_ER_ATTACK_C:
					EarthenAttack(DATA_TOTEM_C, DATA_FLAMECALLER_C);
					break;
				case EVENT_EARTHEN_RING_ATTACK:
					me->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);
					DoCast(SPELL_MAKE_BONFIRE);
					DoCast(SPELL_SUBMERGE);
					events.Reset();
					events.ScheduleEvent(EVENT_SUBMERGE, 3000);
					Talk(EMOTE_SUBMERGED);
					break;
				case EVENT_SUMMON_HAILSTONE:
					DoCast(SPELL_SUMMON_HAILSTONE);
					break;
				case EVENT_SUMMON_COLDWEAVE:
					me->CastSpell(me, SPELL_SUMMON_COLDWEAVE);
					me->CastSpell(me, SPELL_SUMMON_COLDWEAVE);
					events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 5000, 0, PHASE_ONE);
					if (_submerged)
						me->CastSpell(me, SPELL_SUMMON_FROSTWIND);
					events.ScheduleEvent(EVENT_SUMMON_FROSTWIND, 7000, 0, PHASE_TWO);
					break;
				case EVENT_ICE_SPEAR:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
						DoCast(target, SPELL_SUMMON_ICE_SPEAR_BUNNY);
					events.ScheduleEvent(EVENT_ICE_SPEAR, 7000);
					break;
				case EVENT_COLD_SLAP:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 8.0f, true))
						DoCast(target, SPELL_COLD_SLAP);
					events.ScheduleEvent(EVENT_COLD_SLAP, 500, 0, PHASE_ONE);
					break;
				default:
					break;
				}
			}
		}

		void EarthenAttack(uint32 totemX, uint32 flamecallerX)
		{
			_attacks++;
			if (Creature* totem = ObjectAccessor::GetCreature(*me, instance->GetGuidData(totemX)))
			{
				if (Creature* earthenFlame = ObjectAccessor::GetCreature(*me, instance->GetGuidData(flamecallerX)))
				{
					earthenFlame->CastSpell(totem, SPELL_BEAM, false);
					totem->CastSpell(me, SPELL_BEAM_ATTACK_BEAM, false);
					events.ScheduleEvent(EVENT_ER_ATTACK_A, 10000, 0, PHASE_ONE);
					if (_attacks > 0)
						events.ScheduleEvent(EVENT_ER_ATTACK_B, 10000, 0, PHASE_ONE);
					if (_attacks > 2)
						events.ScheduleEvent(EVENT_ER_ATTACK_C, 10000, 0, PHASE_ONE);
					if (_attacks > 5)
						events.ScheduleEvent(EVENT_EARTHEN_RING_ATTACK, 20000, 0, PHASE_ONE);
				}
			}
		}

		void Emerge()
		{
			if (Creature* frozenCore = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FROZEN_CORE)))
				frozenCore->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
			me->SummonCreature(NPC_SLIPPERY_FLOOR, me->GetPosition(), TEMPSUMMON_TIMED_DESPAWN, 90000);
			me->RemoveAurasDueToSpell(SPELL_SELF_STUN);
			me->RemoveAurasDueToSpell(SPELL_SUBMERGE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			DoCast(me, SPELL_RESURFACE, true);
			DoCast(SPELL_EMERGE);
			_attacks = 0;
			events.SetPhase(PHASE_ONE);
			events.ScheduleEvent(EVENT_COLD_SLAP, 500, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 2000, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 5000, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_ICE_SPEAR, 7000, 0, PHASE_ONE);
			events.ScheduleEvent(EVENT_EMOTE_EARTHEN_ATTACK, 10000, 0, PHASE_ONE);
		}

		void Submerge()
		{
			if (Creature* totemA = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_TOTEM_A)))
				totemA->RemoveAura(SPELL_BEAM);
			if (Creature* totemB = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_TOTEM_B)))
				totemB->RemoveAura(SPELL_BEAM);
			if (Creature* totemC = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_TOTEM_C)))
				totemC->RemoveAura(SPELL_BEAM);
			if (Creature* frozenCore = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FROZEN_CORE)))
				frozenCore->AI()->DoAction(ACTION_AHUNE_RETREAT);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			DoCast(me, SPELL_SELF_STUN, true);
			DoCast(me, SPELL_SUBMERGE, true);
			_submerged = true;
			events.SetPhase(PHASE_TWO);
			events.ScheduleEvent(EVENT_EMOTE_EMERGE, 25000, 0, PHASE_TWO);
			events.ScheduleEvent(EVENT_EMERGE, 30000, 0, PHASE_TWO);
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new boss_ahuneAI(creature);
	}
};

class npc_frozen_core : public CreatureScript
{
public:
	npc_frozen_core() : CreatureScript("npc_frozen_core") { }

	struct npc_frozen_coreAI : public ScriptedAI
	{
		npc_frozen_coreAI(Creature* creature) : ScriptedAI(creature)
		{
			me->GetInstanceScript();
		}

		InstanceScript* instance;
		EventMap _events;

		void Reset() override
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
		}

		/*void DamageTaken(Unit* , uint32& damage) override
		{
			if (Creature* Ahune = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_AHUNE)))
			{
				me->CastSpell(Ahune, SPELL_SYNCH_HEALTH);
				if (Ahune->GetHealth() > damage)
					Ahune->SetHealth(Ahune->GetHealth() - damage);
				else
					Ahune->CastSpell(Ahune, SPELL_SUICIDE);
			}
		}*/

		void DoAction(int32 action) override
		{
			if (action = ACTION_AHUNE_RETREAT)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
				_events.ScheduleEvent(EVENT_GHOST_VISUAL, 6000);
				_events.ScheduleEvent(EVENT_REMOVE_GHOST_VISUAL, 9000);
				_events.ScheduleEvent(EVENT_RESURFACE_SOON, 15000);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_GHOST_VISUAL:
					//DoCast(me, SPELL_GHOST_DISGUISE);
					_events.ScheduleEvent(EVENT_REMOVE_GHOST_VISUAL, 6000, 0, PHASE_TWO);
					break;
				case EVENT_REMOVE_GHOST_VISUAL:
					//me->RemoveAura(SPELL_GHOST_DISGUISE);
					_events.ScheduleEvent(EVENT_GHOST_VISUAL, 9000, 0, PHASE_TWO);
					break;
				case EVENT_RESURFACE_SOON:
					Talk(EMOTE_EMERGE_SOON);
					_events.CancelEvent(EVENT_GHOST_VISUAL);
					_events.CancelEvent(EVENT_REMOVE_GHOST_VISUAL);
					break;
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_frozen_coreAI(creature);
	}
};

class npc_ahune_bunny : public CreatureScript
{
public:
	npc_ahune_bunny() : CreatureScript("npc_ahune_bunny") { }

	struct npc_ahune_bunnyAI : public ScriptedAI
	{
		npc_ahune_bunnyAI(Creature* creature) : ScriptedAI(creature), _summons(me)
		{
			instance = me->GetInstanceScript();
			count = 0;
			say_timer = 3000;
		}

		InstanceScript* instance;
		uint32 count;
		uint64 say_timer;
		SummonList _summons;

		void JustSummoned(Creature* summon) override
		{
			_summons.Summon(summon);
		}

		void JustDied(Unit* /*killer*/) override
		{
			_summons.DespawnAll();
		}

		void DoAction(int32 action)
		{
			if (action = ACTION_START_EVENT)
			{
				TempSummon* sliperryFloor = me->SummonCreature(NPC_SLIPPERY_FLOOR, SummonPositions[7], TEMPSUMMON_MANUAL_DESPAWN);
				sliperryFloor->SetReactState(REACT_PASSIVE);
				sliperryFloor->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
				sliperryFloor->AddAura(SPELL_SLIPPERY_FLOOR_AMBIENT, sliperryFloor);
				for (int counter = 1; counter < 7; counter++)
				{
					if (counter < 4)
						me->SummonCreature(NPC_EARTHEN_RING_TOTEM, SummonPositions[counter], TEMPSUMMON_MANUAL_DESPAWN);
					else
						me->SummonCreature(NPC_EARTHEN_RING_FLAMECALLER, SummonPositions[counter], TEMPSUMMON_MANUAL_DESPAWN);
				}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (say_timer <= diff)
			{
				if (Player* player = SelectRandomPlayer(100.0f, false))
				{
					/*if (count == 0)
						sCreatureTextMgr->SendChat(me, SAY_PLAYER_TEXT_1, NULL, CHAT_MSG_SAY, LANG_UNIVERSAL, TEXT_RANGE_NORMAL, 0, TEAM_OTHER, false, player);
					if (count == 1)
						sCreatureTextMgr->SendChat(me, SAY_PLAYER_TEXT_2, NULL, CHAT_MSG_SAY, LANG_UNIVERSAL, TEXT_RANGE_NORMAL, 0, TEAM_OTHER, false, player);
					if (count == 2)
						sCreatureTextMgr->SendChat(me, SAY_PLAYER_TEXT_3, NULL, CHAT_MSG_SAY, LANG_UNIVERSAL, TEXT_RANGE_NORMAL, 0, TEAM_OTHER, false, player);*/
					if (count == 3)
						TempSummon* ahune = me->SummonCreature(NPC_AHUNE, SummonPositions[0], TEMPSUMMON_DEAD_DESPAWN);
					++count;
					say_timer = 3000;
				}
			}
			else
				say_timer -= diff;
		}

		Player* SelectRandomPlayer(float range = 0.0f, bool checkLoS = true)
		{
			Map* map = me->GetMap();
			if (!map->IsDungeon())
				return NULL;

			Map::PlayerList const &PlayerList = map->GetPlayers();
			if (PlayerList.isEmpty())
				return NULL;

			std::list<Player*> temp;
			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				if ((me->IsWithinLOSInMap(i->GetSource()) || !checkLoS) && me->GetVictim() != i->GetSource() &&
					me->IsWithinDistInMap(i->GetSource(), range) && i->GetSource()->IsAlive())
					temp.push_back(i->GetSource());

			if (!temp.empty())
				Trinity::Containers::SelectRandomContainerElement(temp);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ahune_bunnyAI(creature);
	}
};

class npc_ahune_ice_spear : public CreatureScript
{
public:
	npc_ahune_ice_spear() : CreatureScript("npc_ice_spear_bunny") { }

	struct npc_ahune_ice_spearAI : public ScriptedAI
	{
		npc_ahune_ice_spearAI(Creature* creature) : ScriptedAI(creature)
		{
			_spikeTimer = 2500;
			_spiked = false;
			DoCast(me, SPELL_ICE_SPEAR_VISUAL);
			DoCast(me, SPELL_SUMMON_ICE_SPEAR_GO, true);
		}

		uint32 _spikeTimer;
		bool _spiked;

		void UpdateAI(uint32 diff) override
		{
			if (_spikeTimer <= diff)
			{
				GameObject* spike = me->FindNearestGameObject(GO_ICE_SPEAR, 10.0f);
				if (spike && !_spiked)
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0, 3.0f, true))
						target->CastSpell(target, SPELL_ICE_SPEAR_KNOCKBACK, true);
					spike->UseDoorOrButton();
					_spiked = true;
					_spikeTimer = 3500;
				}
				else if (spike)
				{
					spike->Delete();
					me->DespawnOrUnsummon();
				}
			}
			else
				_spikeTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ahune_ice_spearAI(creature);
	}
};

class go_ahune_ice_stone : public GameObjectScript
{
public:
	go_ahune_ice_stone() : GameObjectScript("go_ahune_ice_stone") { }

	bool OnGossipSelect(Player* player, GameObject* go, uint32 /*sender*/, uint32 /*action*/)
	{
		player->PlayerTalkClass->ClearMenus();

		if (Creature* ahuneBunny = go->SummonCreature(NPC_AHUNE_LOC_BUNNY, SummonPositions[0], TEMPSUMMON_CORPSE_DESPAWN))
		{
			player->CLOSE_GOSSIP_MENU();
			ahuneBunny->AI()->DoAction(ACTION_START_EVENT);
			go->Delete();
		}
		return true;
	}
};

void AddSC_instance_the_slave_pens()
{
    new instance_the_slave_pens();
	new boss_ahune();
	new npc_frozen_core();
	new npc_ahune_ice_spear();
	new go_ahune_ice_stone();
	new npc_ahune_bunny();
}
