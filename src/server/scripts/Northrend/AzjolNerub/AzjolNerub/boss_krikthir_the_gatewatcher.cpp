

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "azjol_nerub.h"

enum Spells
{
	SPELL_SUBBOSS_AGGRO_TRIGGER = 52343,
	SPELL_SWARM = 52440,
	SPELL_MIND_FLAY = 52586,
	SPELL_CURSE_OF_FATIGUE = 52592,
	SPELL_FRENZY = 28747
};

enum Events
{
	EVENT_KRIK_START_WAVE = 1,
	EVENT_KRIK_SUMMON = 2,
	EVENT_KRIK_MIND_FLAY = 3,
	EVENT_KRIK_CURSE = 4,
	EVENT_KRIK_HEALTH_CHECK = 5,
	EVENT_KRIK_ENTER_COMBAT = 6,
	EVENT_KILL_TALK = 7,
	EVENT_CALL_ADDS = 8,
	EVENT_KRIK_CHECK_EVADE = 9
};

enum Npcs
{
	NPC_WATCHER_NARJIL = 28729,
	NPC_WATCHER_GASHRA = 28730,
	NPC_WATCHER_SILTHIK = 28731,
	NPC_WARRIOR = 28732,
	NPC_SKIRMISHER = 28734,
	NPC_SHADOWCASTER = 28733
};

enum Yells
{
	SAY_AGGRO = 0,
	SAY_SLAY = 1,
	SAY_DEATH = 2,
	SAY_SWARM = 3,
	SAY_PREFIGHT = 4,
	SAY_SEND_GROUP = 5
};

class boss_krik_thir : public CreatureScript
{
public:
	boss_krik_thir() : CreatureScript("boss_krik_thir") { }

	struct boss_krik_thirAI : public BossAI
	{
		boss_krik_thirAI(Creature* creature) : BossAI(creature, DATA_KRIKTHIR_THE_GATEWATCHER_EVENT)
		{
			_initTalk = false;
			_started = false;
		}

		EventMap events2;
		bool _started;
		bool _initTalk;

		void Reset()
		{
			BossAI::Reset();
			events2.Reset();
			_started = false;
			me->SummonCreature(NPC_WATCHER_NARJIL, 511.8f, 666.493f, 776.278f, 0.977f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_SHADOWCASTER, 518.13f, 667.0f, 775.74f, 1.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_WARRIOR, 506.75f, 670.7f, 776.24f, 0.92f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_WATCHER_GASHRA, 526.66f, 663.605f, 775.805f, 1.23f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_SKIRMISHER, 522.23f, 668.97f, 775.66f, 1.18f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_WARRIOR, 532.4f, 666.47f, 775.67f, 1.45f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_WATCHER_SILTHIK, 543.826f, 665.123f, 776.245f, 1.55f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_SKIRMISHER, 547.5f, 669.96f, 776.1f, 2.3f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
			me->SummonCreature(NPC_SHADOWCASTER, 536.96f, 667.28f, 775.6f, 1.72f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
		}

		void SetData(uint32 type, uint32 data) override
		{
			if (type == 0 && data == 0)
			{
				if (!_initTalk)
				{
					_initTalk = true;
					Talk(SAY_PREFIGHT);
				}

				if (!_started)
				{
					_started = true;					
					// The first wave will be pulled, not called by the boss himself.
					//events2.ScheduleEvent(EVENT_KRIK_START_WAVE, 10000);
					events2.ScheduleEvent(EVENT_KRIK_START_WAVE, 30000);
					events2.ScheduleEvent(EVENT_KRIK_START_WAVE, 60000);
					events2.ScheduleEvent(EVENT_KRIK_ENTER_COMBAT, 90000);
					events2.ScheduleEvent(EVENT_KRIK_CHECK_EVADE, 5000);

					events.ScheduleEvent(EVENT_KRIK_HEALTH_CHECK, 1000);
					events.ScheduleEvent(EVENT_KRIK_MIND_FLAY, 13000);
					events.ScheduleEvent(EVENT_KRIK_SUMMON, 17000);
					events.ScheduleEvent(EVENT_KRIK_CURSE, 8000);
					events.ScheduleEvent(EVENT_CALL_ADDS, 1000);
					me->setActive(true);
				}
			}
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (who->GetTypeId() != TYPEID_PLAYER)
				return;


			
		}

		uint32 GetData(uint32 data) const
		{
			if (data == me->GetEntry())
				return summons.HasEntry(NPC_WATCHER_NARJIL) && summons.HasEntry(NPC_WATCHER_GASHRA) && summons.HasEntry(NPC_WATCHER_SILTHIK);
			return 0;
		}

		void EnterCombat(Unit* who)
		{
			BossAI::EnterCombat(who);
			Talk(SAY_AGGRO);
			events2.Reset();
		}

		void JustDied(Unit* killer)
		{
			BossAI::JustDied(killer);
			Talk(SAY_DEATH);
		}

		void KilledUnit(Unit*)
		{
			if (events.GetNextEventTime(EVENT_KILL_TALK) == 0)
			{
				Talk(SAY_SLAY);
				events.ScheduleEvent(EVENT_KILL_TALK, 6000);
			}
		}

		void JustSummoned(Creature* summon)
		{
			summon->SetNoCallAssistance(true);
			summons.Summon(summon);
		}

		void SummonedCreatureDies(Creature* summon, Unit*)
		{
			summons.Despawn(summon);
		}

		void UpdateAI(uint32 diff)
		{
			events2.Update(diff);
			switch (events2.ExecuteEvent())
			{
			case EVENT_KRIK_START_WAVE:				
				me->CastCustomSpell(SPELL_SUBBOSS_AGGRO_TRIGGER, SPELLVALUE_MAX_TARGETS, 1, me, true);
				Talk(SAY_SEND_GROUP);
				break;
			case EVENT_KRIK_ENTER_COMBAT:
				me->SetInCombatWithZone();
				break;
			case EVENT_KRIK_CHECK_EVADE:
				/* Hacer aqui un find nearest player de 100 */
				if(!me->SelectNearestPlayer(100.0f))
				{					
					EnterEvadeMode();
					Reset();
					return;
				}

				events2.ScheduleEvent(EVENT_KRIK_CHECK_EVADE, 5000);
				break;
			}

			if (!UpdateVictim())
				return;

			events.Update(diff);
			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			switch (events.ExecuteEvent())
			{
			case EVENT_KRIK_HEALTH_CHECK:
				if (HealthBelowPct(10))
				{
					//events.PopEvent();
					me->CastSpell(me, SPELL_FRENZY, true);
					break;
				}
				events.ScheduleEvent(EVENT_KRIK_HEALTH_CHECK, 1000);
				break;
			case EVENT_KRIK_SUMMON:
				Talk(SAY_SWARM);
				me->CastSpell(me, SPELL_SWARM, false);
				events.ScheduleEvent(EVENT_KRIK_SUMMON, 20000);
				break;
			case EVENT_KRIK_MIND_FLAY:
				me->CastSpell(me->GetVictim(), SPELL_MIND_FLAY, false);
				events.ScheduleEvent(EVENT_KRIK_MIND_FLAY, 15000);
				break;
			case EVENT_KRIK_CURSE:
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					me->CastSpell(target, SPELL_CURSE_OF_FATIGUE, true);
				events.ScheduleEvent(EVENT_KRIK_CURSE, 10000);
				break;
			case EVENT_CALL_ADDS:
				summons.DoZoneInCombat();
				break;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new boss_krik_thirAI(creature);
	}
};

class achievement_watch_him_die : public AchievementCriteriaScript
{
public:
	achievement_watch_him_die() : AchievementCriteriaScript("achievement_watch_him_die")
	{
	}

	bool OnCheck(Player* /*player*/, Unit* target)
	{
		if (!target)
			return false;

		return target->GetAI()->GetData(target->GetEntry());
	}
};

enum TrashEvents
{
	// Anubar Skrimisher
	EVENT_ANUBAR_CHARGE = 1,
	EVENT_BACKSTAB,

	// Anubar Shadowcaster
	EVENT_SHADOW_BOLT,
	EVENT_SHADOW_NOVA,

	// Anubar Warrior
	EVENT_STRIKE,
	EVENT_CLEAVE,

	// Watcher Gashra
	EVENT_WEB_WRAP_GASHRA,
	EVENT_INFECTED_BITE_GASHRA,

	// Watcher Narjil
	EVENT_WEB_WRAP_NARJIL,
	EVENT_INFECTED_BITE_NARJIL,
	EVENT_BINDING_WEBS,

	// Watcher Silthik
	EVENT_WEB_WRAP_SILTHIK,
	EVENT_INFECTED_BITE_SILTHIK,
	EVENT_POISON_SPRAY
};

enum TrashSpells
{

	SPELL_BACKSTAB = 52540,
	SPELL_SHADOW_BOLT = 52534,
	SPELL_SHADOW_NOVA = 52535,	
	
	SPELL_CHARGE = 16979, //maybe is another spell

	SPELL_STRIKE = 52532,
	SPELL_CLEAVE = 49806,
	SPELL_ENRAGE = 52470,
	SPELL_INFECTED_BITE = 52469,
	SPELL_WEB_WRAP = 52086, //the spell is not working properly
	SPELL_BLINDING_WEBS = 52524,
	SPELL_POSION_SPRAY = 52493,
	SPELL_AURA_WRAP   = 52087
};



/* WATCHERS */

class npc_watcher_gashra : public CreatureScript
{
public:
	npc_watcher_gashra() : CreatureScript("npc_watcher_gashra") { }

	struct npc_watcher_gashraAI : public ScriptedAI
	{
		npc_watcher_gashraAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			// Start event if not started.
			if (me->ToTempSummon())
				if (Unit* boss = me->ToTempSummon()->GetSummoner())				
					boss->GetAI()->SetData(0, 0);
				
			/* Search both guards and call them */

			if (Creature* guard1 = me->FindNearestCreature(NPC_SKIRMISHER, 15.0f, true))
				guard1->SetInCombatWithZone();

			if (Creature* guard2 = me->FindNearestCreature(NPC_WARRIOR, 15.0f, true))
				guard2->SetInCombatWithZone();

			DoCast(me, SPELL_ENRAGE, true);
			_events.ScheduleEvent(EVENT_WEB_WRAP_GASHRA, 11000);
			_events.ScheduleEvent(EVENT_INFECTED_BITE_GASHRA, 4000);
		}

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id != 52343)
				return;

			me->SetInCombatWithZone();
		}

		void JustDied(Unit* /*killer*/) override
		{

		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WEB_WRAP_GASHRA:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
						DoCast(target, SPELL_WEB_WRAP, true);
					_events.ScheduleEvent(EVENT_WEB_WRAP_GASHRA, 17000);
					break;
				case EVENT_INFECTED_BITE_GASHRA:
					DoCastVictim(SPELL_INFECTED_BITE, true);
					_events.ScheduleEvent(EVENT_INFECTED_BITE_GASHRA, 15000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		InstanceScript* _instance;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_watcher_gashraAI(creature);
	}
};

class npc_watcher_narjil : public CreatureScript
{
public:
	npc_watcher_narjil() : CreatureScript("npc_watcher_narjil") { }

	struct npc_watcher_narjilAI : public ScriptedAI
	{
		npc_watcher_narjilAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			// Start event if not started.
			if (me->ToTempSummon())
				if (Unit* boss = me->ToTempSummon()->GetSummoner())
					boss->GetAI()->SetData(0, 0);

			/* Search both guards and call them */

			if (Creature* guard1 = me->FindNearestCreature(NPC_WARRIOR, 15.0f, true))
				guard1->SetInCombatWithZone();

			if (Creature* guard2 = me->FindNearestCreature(NPC_SHADOWCASTER, 15.0f, true))
				guard2->SetInCombatWithZone();

			_events.ScheduleEvent(EVENT_WEB_WRAP_NARJIL, 11000);
			_events.ScheduleEvent(EVENT_INFECTED_BITE_NARJIL, 4000);
			_events.ScheduleEvent(EVENT_BINDING_WEBS, 17000);
		}

		void JustDied(Unit* /*killer*/) override
		{

		}

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id != 52343)
				return;

			me->SetInCombatWithZone();
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WEB_WRAP_NARJIL:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
						DoCast(target, SPELL_WEB_WRAP, true);
					_events.ScheduleEvent(EVENT_WEB_WRAP_NARJIL, 15000);
					break;
				case EVENT_INFECTED_BITE_NARJIL:
					DoCastVictim(SPELL_INFECTED_BITE, true);
					_events.ScheduleEvent(EVENT_INFECTED_BITE_NARJIL, 11000);
					break;
				case EVENT_BINDING_WEBS:
					DoCastVictim(SPELL_BLINDING_WEBS, true);
					_events.ScheduleEvent(EVENT_BINDING_WEBS, 17000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		InstanceScript* _instance;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_watcher_narjilAI(creature);
	}
};

class npc_watcher_silthik : public CreatureScript
{
public:
	npc_watcher_silthik() : CreatureScript("npc_watcher_silthik") { }

	struct npc_watcher_silthikAI : public ScriptedAI
	{
		npc_watcher_silthikAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_events.Reset();
		}

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id != 52343)
				return;

			me->SetInCombatWithZone();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			// Start event if not started.
			if (me->ToTempSummon())
				if (Unit* boss = me->ToTempSummon()->GetSummoner())
					boss->GetAI()->SetData(0, 0);

			/* Search both guards and call them */

			if (Creature* guard1 = me->FindNearestCreature(NPC_SKIRMISHER, 15.0f, true))
				guard1->SetInCombatWithZone();

			if (Creature* guard2 = me->FindNearestCreature(NPC_SHADOWCASTER, 15.0f, true))
				guard2->SetInCombatWithZone();

			_events.ScheduleEvent(EVENT_WEB_WRAP_SILTHIK, 11000);
			_events.ScheduleEvent(EVENT_INFECTED_BITE_SILTHIK, 4000);
			_events.ScheduleEvent(EVENT_POISON_SPRAY, 15000);
		}

		void JustDied(Unit* /*killer*/) override
		{

		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WEB_WRAP_SILTHIK:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
						DoCast(target, SPELL_WEB_WRAP, true);
					_events.ScheduleEvent(EVENT_WEB_WRAP_SILTHIK, 15000);
					break;
				case EVENT_INFECTED_BITE_SILTHIK:
					DoCastVictim(SPELL_INFECTED_BITE, true);
					_events.ScheduleEvent(EVENT_INFECTED_BITE_SILTHIK, 11000);
					break;
				case EVENT_POISON_SPRAY:
					DoCastVictim(SPELL_POSION_SPRAY, true);
					_events.ScheduleEvent(EVENT_POISON_SPRAY, 17000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		InstanceScript* _instance;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_watcher_silthikAI(creature);
	}
};


/* ADDS */

class npc_anub_ar_skirmisher : public CreatureScript
{
public:
	npc_anub_ar_skirmisher() : CreatureScript("npc_anub_ar_skirmisher") { }

	struct npc_anub_ar_skirmisherAI : public ScriptedAI
	{
		npc_anub_ar_skirmisherAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			/* Call Watchers */

			if (Creature* watcher1 = me->FindNearestCreature(NPC_WATCHER_SILTHIK, 15.0f, true))
				watcher1->SetInCombatWithZone();

			if (Creature* watcher2 = me->FindNearestCreature(NPC_WATCHER_GASHRA, 15.0f, true))
				watcher2->SetInCombatWithZone();

			events.ScheduleEvent(EVENT_ANUBAR_CHARGE, 11000);
			events.ScheduleEvent(EVENT_BACKSTAB, 7000);
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
				case EVENT_ANUBAR_CHARGE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					{
						DoResetThreat();
						me->AddThreat(target, 1.0f);
						DoCast(target, SPELL_CHARGE, true);
					}
					events.ScheduleEvent(EVENT_ANUBAR_CHARGE, 15000);
					break;
				case EVENT_BACKSTAB:
					DoCastVictim(SPELL_BACKSTAB);
					events.ScheduleEvent(EVENT_BACKSTAB, 12000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_anub_ar_skirmisherAI(creature);
	}
};


class npc_anub_ar_shadowcaster : public CreatureScript
{
public:
	npc_anub_ar_shadowcaster() : CreatureScript("npc_anub_ar_shadowcaster") { }

	struct npc_anub_ar_shadowcasterAI : public ScriptedAI
	{
		npc_anub_ar_shadowcasterAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{

			/* Call Watchers */

			if (Creature* watcher1 = me->FindNearestCreature(NPC_WATCHER_SILTHIK, 15.0f, true))
				watcher1->SetInCombatWithZone();

			if (Creature* watcher2 = me->FindNearestCreature(NPC_WATCHER_NARJIL, 15.0f, true))
				watcher2->SetInCombatWithZone();

			events.ScheduleEvent(EVENT_SHADOW_BOLT, 6000);
			events.ScheduleEvent(EVENT_SHADOW_NOVA, 15000);
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
				case EVENT_SHADOW_BOLT:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
						DoCast(target, SPELL_SHADOW_BOLT, true);
					events.ScheduleEvent(EVENT_SHADOW_BOLT, 15000);
					break;
				case EVENT_SHADOW_NOVA:
					DoCastVictim(SPELL_SHADOW_NOVA, true);
					events.ScheduleEvent(EVENT_SHADOW_NOVA, 17000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_anub_ar_shadowcasterAI(creature);
	}
};


class npc_anub_ar_warrior : public CreatureScript
{
public:
	npc_anub_ar_warrior() : CreatureScript("npc_anub_ar_warrior") { }

	struct npc_anub_ar_warriorAI : public ScriptedAI
	{
		npc_anub_ar_warriorAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			/* Call Watchers */

			if (Creature* watcher1 = me->FindNearestCreature(NPC_WATCHER_NARJIL, 15.0f, true))
				watcher1->SetInCombatWithZone();

			if (Creature* watcher2 = me->FindNearestCreature(NPC_WATCHER_GASHRA, 15.0f, true))
				watcher2->SetInCombatWithZone();

			events.ScheduleEvent(EVENT_CLEAVE, 11000);
			events.ScheduleEvent(EVENT_STRIKE, 6000);
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
				case EVENT_CLEAVE:
					DoCastVictim(SPELL_STRIKE, true);
					events.ScheduleEvent(EVENT_CLEAVE, 15000);
					break;
				case EVENT_STRIKE:
					DoCastVictim(SPELL_CLEAVE, true);
					events.ScheduleEvent(EVENT_STRIKE, 17000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_anub_ar_warriorAI(creature);
	}
};

class npc_azjol_web_wrap : public CreatureScript
{
public:
	npc_azjol_web_wrap() : CreatureScript("npc_azjol_web_wrap") { }

	struct npc_azjol_web_wrapAI : public ScriptedAI
	{
		npc_azjol_web_wrapAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{			
		}

		void DamageTaken(Unit* /*attacker*/, uint32& damage) override
		{
			if (damage >= me->GetHealth())
			{
				if (me->ToTempSummon())
					if (Unit* summoner = me->ToTempSummon()->GetSummoner())
						if (summoner->HasAura(SPELL_AURA_WRAP))
							summoner->RemoveAura(SPELL_AURA_WRAP);
			}
		}


	private:
		EventMap events;
	};

	CreatureAI *GetAI(Creature *creature) const
	{
		return new npc_azjol_web_wrapAI(creature);
	}
};

void AddSC_boss_krik_thir()
{
	new boss_krik_thir();
	new achievement_watch_him_die();

	new npc_watcher_gashra();	
	new npc_watcher_silthik();
	new npc_watcher_narjil();

	new npc_anub_ar_skirmisher();
	new npc_anub_ar_shadowcaster();
	new npc_anub_ar_warrior();

	new npc_azjol_web_wrap();
}
