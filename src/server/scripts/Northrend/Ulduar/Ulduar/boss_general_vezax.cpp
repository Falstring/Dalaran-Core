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
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "ulduar.h"
#include "Player.h"

enum VezaxYells
{
	SAY_AGGRO = 0,
	SAY_SLAY = 1,
	SAY_SURGE_OF_DARKNESS = 2,
	SAY_DEATH = 3,
	SAY_BERSERK = 4,
	SAY_HARDMODE = 5,
};

enum VezaxEmotes
{
	EMOTE_ANIMUS = 6,
	EMOTE_BARRIER = 7,
	EMOTE_SURGE_OF_DARKNESS = 8,

	// Saronite Vapor
	EMOTE_VAPORS = 10
};

enum VezaxSpells
{
	SPELL_AURA_OF_DESPAIR = 62692,
	SPELL_AURA_OF_DESPAIR_TRIGGERED = 64848,
	SPELL_MARK_OF_THE_FACELESS = 63276,
	SPELL_MARK_OF_THE_FACELESS_DAMAGE = 63278,
	SPELL_SARONITE_BARRIER = 63364,
	SPELL_SEARING_FLAMES = 62661,
	SPELL_SHADOW_CRASH = 62660,
	SPELL_SHADOW_CRASH_HIT = 62659,
	SPELL_SURGE_OF_DARKNESS = 62662,
	SPELL_SARONITE_VAPORS = 63323,
	SPELL_SARONITE_VAPORS_ENERGIZE = 63337,
	SPELL_SARONITE_VAPORS_DAMAGE = 63338,
	SPELL_SUMMON_SARONITE_VAPORS = 63081,
	SPELL_BERSERK = 26662,

	SPELL_SUMMON_SARONITE_ANIMUS = 63145,
	SPELL_VISUAL_SARONITE_ANIMUS = 63319,
	SPELL_PROFOUND_OF_DARKNESS = 63420,

	SPELL_CORRUPTED_RAGE = 68415,
	SPELL_CORRUPTED_WISDOM = 64646,
	SPELL_SHAMANISTIC_RAGE = 30823,

	SPELL_JUDGEMENTS_OFTHE_WISE_1 = 31876, // 1 talent points.
	SPELL_JUDGEMENTS_OFTHE_WISE_2 = 31877, // 2 talent points.
	SPELL_JUDGEMENTS_OFTHE_WISE = 31878, // 3 talent points.

	SPELL_JUDGEMENT_OF_LIGHT = 20271,
	SPELL_JUDGEMENT_OF_WISDOM = 53408,
};

enum VezaxActions
{
	ACTION_VAPORS_SPAWN,
	ACTION_VAPORS_DIE,
	ACTION_ANIMUS_DIE,
};

enum VezaxEvents
{
	// Vezax
	EVENT_SHADOW_CRASH = 1,
	EVENT_SEARING_FLAMES = 2,
	EVENT_SURGE_OF_DARKNESS = 3,
	EVENT_MARK_OF_THE_FACELESS = 4,
	EVENT_SARONITE_VAPORS = 5,
	EVENT_BERSERK = 6,

	// Saronite Animus
	EVENT_PROFOUND_OF_DARKNESS = 7,

	// Saronite Vapor
	EVENT_RANDOM_MOVE = 8,
	EVENT_CHECK_AURAS = 9,

	EVENT_CORRECT_VICTIM = 10,
};

enum Misc
{
	DATA_SMELL_SARONITE = 31813188,
	DATA_SHADOWDODGER = 29962997
};

/*uint32 forbiddenAuraList[2] =
{
29166, // Replenishment
57669 // Innervate
};

#define AURAS_NUM 2*/

#define ACHIEVEMENT_I_LOVE_SARONITE                   RAID_MODE(3181, 3188)
#define ACHIEVEMENT_SHADOW_DODGER                     RAID_MODE(2996, 2997)

class boss_general_vezax : public CreatureScript
{
public:
	boss_general_vezax() : CreatureScript("boss_general_vezax") { }

	struct boss_general_vezaxAI : public BossAI
	{
		boss_general_vezaxAI(Creature* creature) : BossAI(creature, BOSS_VEZAX)
		{
		}

		bool animusDied;
		bool shadowDodger;
		bool smellSaronite; // HardMode            
		uint8 vaporCount;
		uint8 shamanCount;
		ObjectGuid shamanList[25]; // Maximun number of players.
		ObjectGuid victimGUID;
		bool shamanisticRageActive;


		void Reset() override
		{
			_Reset();

			me->ResetLootMode();

			shadowDodger = true;
			smellSaronite = true;
			animusDied = false;
			vaporCount = 0;			
		}

			void CheckPlayerTallentsToCorrupt()
		{
			Map* map = me->GetMap();
			if (map && map->IsDungeon())
			{
				Map::PlayerList const& Players = map->GetPlayers();
				for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
					if (Player* player = itr->GetSource())
						if (player->HasSpell(SPELL_SHAMANISTIC_RAGE))
							me->CastSpell(player, SPELL_CORRUPTED_RAGE, false);
						else
						{
							if (player->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE) || player->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_1) || player->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_2))
								me->CastSpell(player, SPELL_CORRUPTED_WISDOM, false); // Corrupted Wisdom
						}
			}
		}

		void EnterCombat(Unit* /*who*/) override
		{
			_EnterCombat();

			Talk(SAY_AGGRO);
			DoCast(me, SPELL_AURA_OF_DESPAIR);

			getEnhancementShammans();
			CheckPlayerTallentsToCorrupt();
			vaporCount = 0;
			shadowDodger = true;
			smellSaronite = true;
			animusDied = false;

			me->CallForHelp(75.0f);

			events.ScheduleEvent(EVENT_SHADOW_CRASH, urand(8000, 10000));
			events.ScheduleEvent(EVENT_CHECK_AURAS, 3 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_SEARING_FLAMES, 12000);
			events.ScheduleEvent(EVENT_MARK_OF_THE_FACELESS, urand(35000, 40000));
			events.ScheduleEvent(EVENT_SARONITE_VAPORS, 30000);
			events.ScheduleEvent(EVENT_SURGE_OF_DARKNESS, 60000);
			events.ScheduleEvent(EVENT_BERSERK, 600000);
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_AURAS:
					if (shamanCount)
					{
						for (uint8 i = 0; i < shamanCount; i++)
						{
							if (Player* shaman = ObjectAccessor::GetPlayer(*me, shamanList[i]))
							{
								if (shaman->IsAlive() && shaman->HasAura(SPELL_SHAMANISTIC_RAGE))
								{
									if (shaman->getPowerType() == POWER_MANA)
										shaman->ModifyPowerPct(POWER_MANA, 15);
								}
							}
						}
						events.RescheduleEvent(EVENT_CHECK_AURAS, urand(2000, 6000));
					}
					else
						events.CancelEvent(EVENT_CHECK_AURAS);
					break;
				case EVENT_SHADOW_CRASH:
				{
					Unit* target = CheckPlayersInRange(1, 15.0f, 150.0f);
					if (target)
					{
						if (me->GetVictim())
							if (victimGUID = me->GetVictim()->GetGUID()) /* Quite a hack, but is needed since DBM addon is selecting the tank as Shadow Crash target. */
							{
							me->SetTarget(target->GetGUID());
							DoCast(target, SPELL_SHADOW_CRASH);
							Talk(11, target);
							events.ScheduleEvent(EVENT_CORRECT_VICTIM, 1500);
							}
					}

					events.ScheduleEvent(EVENT_SHADOW_CRASH, urand(12000, 13000));
					break;
				}
				case EVENT_CORRECT_VICTIM:
					if (victimGUID)
						me->SetTarget(victimGUID);
					break;
				case EVENT_SEARING_FLAMES:
					me->StopMoving();
					DoCastAOE(SPELL_SEARING_FLAMES);
					events.ScheduleEvent(EVENT_SEARING_FLAMES, 10 * IN_MILLISECONDS); // IMPORTANTE: Mirar que se vea afectado por el CD de escuela de spell.
					break;
				case EVENT_MARK_OF_THE_FACELESS:
				{
					Unit* target = CheckPlayersInRange(RAID_MODE<uint8>(4, 9), 15.0f, 50.0f);

					if (!target)
						target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true);
					if (target)
						DoCast(target, SPELL_MARK_OF_THE_FACELESS);

					events.ScheduleEvent(EVENT_MARK_OF_THE_FACELESS, urand(30000, 40000));
					break;
				}
				case EVENT_SURGE_OF_DARKNESS:
					me->StopMoving();
					Talk(EMOTE_SURGE_OF_DARKNESS);
					Talk(SAY_SURGE_OF_DARKNESS);
					DoCast(me, SPELL_SURGE_OF_DARKNESS);
					events.ScheduleEvent(EVENT_SURGE_OF_DARKNESS, 45000);
					break;
				case EVENT_SARONITE_VAPORS:
					vaporCount++;
					Talk(EMOTE_VAPORS);
					DoCast(SPELL_SUMMON_SARONITE_VAPORS);
					events.ScheduleEvent(EVENT_SARONITE_VAPORS, urand(30000, 36000));
					if (vaporCount == 6 && smellSaronite) // Pre-nerf, 8 Saronite animus. Currently on 6, to make it easier like on retail.
					{
						Talk(SAY_HARDMODE);
						Talk(EMOTE_BARRIER);
						summons.DespawnAll();
						DoCast(me, SPELL_SARONITE_BARRIER);
						DoCast(SPELL_SUMMON_SARONITE_ANIMUS);						
						me->AddLootMode(LOOT_MODE_HARD_MODE_1);
						events.CancelEvent(EVENT_SARONITE_VAPORS);
						events.CancelEvent(EVENT_SEARING_FLAMES);
					}
					break;
				case EVENT_BERSERK:
					Talk(SAY_BERSERK);
					DoCast(me, SPELL_BERSERK);
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

			void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (spell->Id != SPELL_JUDGEMENT_OF_LIGHT && spell->Id != SPELL_JUDGEMENT_OF_WISDOM)
			return;

			if (caster->ToPlayer())
				if (caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_1) || caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_2) || caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE))
				{
				if (caster->getPowerType() == POWER_MANA)
				{
					caster->ModifyPowerPct(POWER_MANA, 19); // Since it is base, a bit less than it should.
				}
				}
		}

			void SpellHitTarget(Unit* who, SpellInfo const* spell) override
		{
			if (who && who->GetTypeId() == TYPEID_PLAYER && spell->Id == SPELL_SHADOW_CRASH_HIT)
			shadowDodger = false;
		}

			void KilledUnit(Unit* who) override
		{
			if (who->GetTypeId() == TYPEID_PLAYER)
			Talk(SAY_SLAY);
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (smellSaronite && animusDied)
			{
				Map* map = me->GetMap();
				if (map && map->IsDungeon())
				{
					std::list<Player*> playerList;
					Map::PlayerList const& players = map->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						if (Player* player = itr->GetSource())
						{
							if (AchievementEntry const* iLoveSaronite = sAchievementMgr->GetAchievement(ACHIEVEMENT_I_LOVE_SARONITE))
								player->CompletedAchievement(iLoveSaronite);
						}
					}
				}
			}

			if (shadowDodger)
			{
				Map* map = me->GetMap();
				if (map && map->IsDungeon())
				{
					std::list<Player*> playerList;
					Map::PlayerList const& players = map->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						if (Player* player = itr->GetSource())
						{
							if (AchievementEntry const* shadowDodger = sAchievementMgr->GetAchievement(ACHIEVEMENT_SHADOW_DODGER))
								player->CompletedAchievement(shadowDodger);
						}
					}
				}
			}

			_JustDied();
			Talk(SAY_DEATH);
			instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_AURA_OF_DESPAIR);
			/*instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SHAMANISTIC_RAGE);
			instance->DoRemoveAurasDueToSpellOnPlayers(64646); // Correct this things when the cleanup.*/
		}

			void getEnhancementShammans()
		{
			Map* map = me->GetMap();

			if (map && map->IsDungeon())
			{
				Map::PlayerList const& Players = map->GetPlayers();
				for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
					if (Player* player = itr->GetSource())
						if (player->getClass() == CLASS_SHAMAN && player->HasSpell(SPELL_SHAMANISTIC_RAGE))
						{
					shamanList[shamanCount] = player->GetGUID();
					shamanCount++;
						}
			}
		}

		uint32 GetData(uint32 type) const override
		{
			switch (type)
			{
			case DATA_SHADOWDODGER:
				return shadowDodger ? 1 : 0;
			case DATA_SMELL_SARONITE:
				return smellSaronite ? 1 : 0;
			}

			return 0;
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_VAPORS_DIE:
				smellSaronite = false;
				break;
			case ACTION_ANIMUS_DIE:
				animusDied = true;
				me->RemoveAurasDueToSpell(SPELL_SARONITE_BARRIER);
				events.ScheduleEvent(EVENT_SEARING_FLAMES, urand(7000, 12000));
				break;
			}
		}

			/*  Player Range Check
			Purpose: If there are playersMin people within rangeMin, rangeMax: return a random players in that range.
			If not, return NULL and allow other target selection
			*/
			Unit* CheckPlayersInRange(uint8 playersMin, float rangeMin, float rangeMax)
		{
			Map* map = me->GetMap();
			if (map && map->IsDungeon())
			{
				std::list<Player*> PlayerList;
				Map::PlayerList const& Players = map->GetPlayers();
				for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
				{
					if (Player* player = itr->GetSource())
					{
						float distance = player->GetDistance(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
						if (rangeMin > distance || distance > rangeMax)
							continue;

						PlayerList.push_back(player);
					}
				}

				if (PlayerList.empty())
					return NULL;

				size_t size = PlayerList.size();
				if (size < playersMin)
					return NULL;

				return Trinity::Containers::SelectRandomContainerElement(PlayerList);
			}

			return NULL;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_general_vezaxAI>(creature);
	}
};

class boss_saronite_animus : public CreatureScript
{
public:
	boss_saronite_animus() : CreatureScript("npc_saronite_animus") { }

	struct boss_saronite_animusAI : public ScriptedAI
	{
		boss_saronite_animusAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
		}

		void Reset() override
		{
			DoCast(me, SPELL_VISUAL_SARONITE_ANIMUS);
			events.Reset();
			events.ScheduleEvent(EVENT_PROFOUND_OF_DARKNESS, 3000);
		}


			void SpellHit(Unit* caster, SpellInfo const* spell) override // Need testing.
		{
			if (spell->Id != SPELL_JUDGEMENT_OF_LIGHT && spell->Id != SPELL_JUDGEMENT_OF_WISDOM)
			return;

			if (caster->ToPlayer())
				if (caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_1) || caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_2) || caster->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE))
				{
				if (caster->getPowerType() == POWER_MANA)
				{
					caster->ModifyPowerPct(POWER_MANA, 19); // Since it is base, a bit less than it should.
				}
				}
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (Creature* Vezax = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_VEZAX)))
			Vezax->AI()->DoAction(ACTION_ANIMUS_DIE);
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PROFOUND_OF_DARKNESS:
					DoCastAOE(SPELL_PROFOUND_OF_DARKNESS, true);
					events.ScheduleEvent(EVENT_PROFOUND_OF_DARKNESS, 2200);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<boss_saronite_animusAI>(creature);
	}
};

class npc_saronite_vapors : public CreatureScript
{
public:
	npc_saronite_vapors() : CreatureScript("npc_saronite_vapors") { }

	struct npc_saronite_vaporsAI : public ScriptedAI
	{
		npc_saronite_vaporsAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_ID, 49560, true); // Death Grip jump effect
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset() override
		{
			events.Reset();
			events.ScheduleEvent(EVENT_RANDOM_MOVE, urand(5000, 7500));
		}

			void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_RANDOM_MOVE:
					me->GetMotionMaster()->MoveRandom(30.0f);
					events.ScheduleEvent(EVENT_RANDOM_MOVE, urand(5000, 7500));
					break;
				default:
					break;
				}
			}
		}

			void DamageTaken(Unit* /*who*/, uint32& damage) override
		{
			// This can't be on JustDied. In 63322 dummy handler caster needs to be this NPC
			// if caster == target then damage mods will increase the damage taken
			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->RemoveAllAuras();
				events.CancelEvent(EVENT_RANDOM_MOVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
				//Hacer algún root o algo.
				me->AddAura(42716, me);
				me->GetMotionMaster()->Clear();
				me->StopMoving();
				me->SetStandState(UNIT_STAND_STATE_DEAD);
				me->SetHealth(me->GetMaxHealth());

				DoCast(me, SPELL_SARONITE_VAPORS);
				me->DespawnOrUnsummon(30000);

				if (Creature* Vezax = ObjectAccessor::GetCreature(*me, instance->GetGuidData(BOSS_VEZAX)))
					Vezax->AI()->DoAction(ACTION_VAPORS_DIE);
			}
		}

	private:
		InstanceScript* instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_saronite_vaporsAI>(creature);
	}
};

class spell_general_vezax_mark_of_the_faceless : public SpellScriptLoader
{
public:
	spell_general_vezax_mark_of_the_faceless() : SpellScriptLoader("spell_general_vezax_mark_of_the_faceless") { }

	class spell_general_vezax_mark_of_the_faceless_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_general_vezax_mark_of_the_faceless_AuraScript);

		bool Validate(SpellInfo const* /*spellInfo*/)
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_MARK_OF_THE_FACELESS_DAMAGE))
				return false;
			return true;
		}

		void HandleEffectPeriodic(AuraEffect const* aurEff)
		{
			if (Unit* caster = GetCaster())
				caster->CastCustomSpell(SPELL_MARK_OF_THE_FACELESS_DAMAGE, SPELLVALUE_BASE_POINT1, aurEff->GetAmount(), GetTarget(), true);
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_general_vezax_mark_of_the_faceless_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_general_vezax_mark_of_the_faceless_AuraScript();
	}
};

class spell_general_vezax_mark_of_the_faceless_leech : public SpellScriptLoader
{
public:
	spell_general_vezax_mark_of_the_faceless_leech() : SpellScriptLoader("spell_general_vezax_mark_of_the_faceless_leech") { }

	class spell_general_vezax_mark_of_the_faceless_leech_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_general_vezax_mark_of_the_faceless_leech_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove(GetExplTargetWorldObject());

			if (targets.empty())
				FinishCast(SPELL_FAILED_NO_VALID_TARGETS);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_general_vezax_mark_of_the_faceless_leech_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_general_vezax_mark_of_the_faceless_leech_SpellScript();
	}
};

class spell_general_vezax_saronite_vapors : public SpellScriptLoader
{
public:
	spell_general_vezax_saronite_vapors() : SpellScriptLoader("spell_general_vezax_saronite_vapors") { }

	class spell_general_vezax_saronite_vapors_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_general_vezax_saronite_vapors_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SARONITE_VAPORS_ENERGIZE) || !sSpellMgr->GetSpellInfo(SPELL_SARONITE_VAPORS_DAMAGE))
			return false;
			return true;
		}

			void HandleEffectApply(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* caster = GetCaster())
			{
				int32 mana;	// = int32(aurEff->GetAmount() * pow(2.0f, GetStackAmount())); // mana restore - bp * 2^stackamount
				int32 damage;	// = mana * 2;
				switch (GetStackAmount())
				{
				case 1:
					mana = 100;
					break;
				case 2:
					mana = 200;
					break;
				case 3:
					mana = 400;
					break;
				case 4:
					mana = 800;
					break;
				case 5:
					mana = 1600;
					break;
				case 6:
					mana = 3200;
					break;
				case 7:
					mana = 6400;
					break;
				case 8:
					mana = 12800;
					break;
				case 9:
					mana = 25600;
					break;
				case 10:
					mana = 51200;
					break;
				default:
					mana = 100000;
					break;
				}

				damage = mana * 2;

				if (GetTarget()->getPowerType() == POWER_MANA)
					GetTarget()->ModifyPower(POWER_MANA, mana);

				//GetTarget()->CastCustomSpell(GetTarget(), SPELL_SARONITE_VAPORS_ENERGIZE, &mana, NULL, NULL, true);
				caster->CastCustomSpell(GetTarget(), SPELL_SARONITE_VAPORS_DAMAGE, &damage, NULL, NULL, true);

			}
		}

		void Register() override
		{
			AfterEffectApply += AuraEffectApplyFn(spell_general_vezax_saronite_vapors_AuraScript::HandleEffectApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_general_vezax_saronite_vapors_AuraScript();
	}
};


class spell_aura_of_despair_aura : public SpellScriptLoader
{
public:
	spell_aura_of_despair_aura() : SpellScriptLoader("spell_aura_of_despair_aura") { }

	class spell_aura_of_despair_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_aura_of_despair_AuraScript);


		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
				return;

			Player* target = GetTarget()->ToPlayer();
			/*target->CastSpell(target, SPELL_CORRUPTED_RAGE, true);
			if (target->getClass() == CLASS_SHAMAN && target->HasSpell(SPELL_SHAMANISTIC_RAGE))
			target->CastSpell(target, SPELL_CORRUPTED_RAGE, true);
			else if (target->getClass() == CLASS_PALADIN) // comprobar si 1, dos o tres puntos.
			{
			if (target->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE) || target->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_1) || target->HasAura(SPELL_JUDGEMENTS_OFTHE_WISE_2))
			target->CastSpell(target, SPELL_CORRUPTED_WISDOM, true);
			}
			*/

			target->CastSpell(target, SPELL_AURA_OF_DESPAIR_TRIGGERED, true);
		}

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
				return;

			Player* target = GetTarget()->ToPlayer();

			target->RemoveAurasDueToSpell(SPELL_CORRUPTED_RAGE);
			target->RemoveAurasDueToSpell(SPELL_CORRUPTED_WISDOM);
			target->RemoveAurasDueToSpell(SPELL_AURA_OF_DESPAIR_TRIGGERED);
		}

		void Register()
		{
			OnEffectApply += AuraEffectApplyFn(spell_aura_of_despair_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PREVENT_REGENERATE_POWER, AURA_EFFECT_HANDLE_REAL);
			OnEffectRemove += AuraEffectRemoveFn(spell_aura_of_despair_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PREVENT_REGENERATE_POWER, AURA_EFFECT_HANDLE_REAL);
		}

	};

	AuraScript* GetAuraScript() const
	{
		return new spell_aura_of_despair_AuraScript();
	}
};
void AddSC_boss_general_vezax()
{
	new boss_general_vezax();
	new boss_saronite_animus();
	new npc_saronite_vapors();
	new spell_general_vezax_mark_of_the_faceless();
	new spell_general_vezax_mark_of_the_faceless_leech();
	new spell_general_vezax_saronite_vapors();
	new spell_aura_of_despair_aura();
	//new achievement_shadowdodger();
	//new achievement_smell_saronite();
}
