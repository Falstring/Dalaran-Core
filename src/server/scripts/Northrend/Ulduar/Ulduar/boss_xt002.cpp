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
#include "Vehicle.h"
#include "Player.h"
#include "WorldPacket.h"
#include "Opcodes.h"

enum Spells
{
	SPELL_TYMPANIC_TANTRUM = 62776,
	SPELL_SEARING_LIGHT_10 = 63018,
	SPELL_SEARING_LIGHT_25 = 65121,

	SPELL_SUMMON_LIFE_SPARK = 64210,
	SPELL_SUMMON_VOID_ZONE = 64203,

	SPELL_GRAVITY_BOMB_10 = 63024,
	SPELL_GRAVITY_BOMB_25 = 64234,

	SPELL_HEARTBREAK_10 = 65737,
	SPELL_HEARTBREAK_25 = 64193,

	// Cast by 33337 at Heartbreak:
	SPELL_RECHARGE_PUMMELER = 62831,    // Summons 33344
	SPELL_RECHARGE_SCRAPBOT = 62828,    // Summons 33343
	SPELL_RECHARGE_BOOMBOT = 62835,    // Summons 33346

	// Cast by 33329 on 33337 (visual?)
	SPELL_ENERGY_ORB = 62790,    // Triggers 62826 - needs spellscript for periodic tick to cast one of the random spells above

	SPELL_HEART_HEAL_TO_FULL = 17683,
	SPELL_HEART_OVERLOAD = 62789,

	SPELL_HEART_LIGHTNING_TETHER = 64799,    // Cast on self?
	SPELL_HEART_RIDE_VEHICLE = 63852, //  63313
	SPELL_ENRAGE = 26662,
	SPELL_STAND = 37752,
	SPELL_SUBMERGE = 37751,

	//------------------VOID ZONE--------------------
	SPELL_VOID_ZONE_10 = 64203,
	SPELL_VOID_ZONE_25 = 64235,
	SPELL_CONSUMPTION_10 = 64208,
	SPELL_CONSUMPTION_25 = 64206,

	// Life Spark
	SPELL_STATIC_CHARGED_10 = 64227,
	SPELL_STATIC_CHARGED_25 = 64236,
	SPELL_SHOCK = 64230,

	//----------------XT-002 HEART-------------------
	SPELL_EXPOSED_HEART = 63849,
	// Channeled

	//---------------XM-024 PUMMELLER----------------
	SPELL_ARCING_SMASH = 8374,
	SPELL_TRAMPLE = 5568,
	SPELL_UPPERCUT = 10966,

	// Scrabot:
	SPELL_SCRAPBOT_RIDE_VEHICLE = 47020,
	SPELL_SUICIDE = 7,

	//------------------BOOMBOT-----------------------
	SPELL_AURA_BOOMBOT = 65032,
	SPELL_BOOM = 62834,

	SPELL_HEAL_XT002 = 62832,

	// Achievement-related spells
	SPELL_ACHIEVEMENT_CREDIT_NERF_SCRAPBOTS = 65037
};

enum Events
{
	EVENT_TYMPANIC_TANTRUM = 1,
	EVENT_SEARING_LIGHT,
	EVENT_GRAVITY_BOMB,
	EVENT_HEART_PHASE,
	EVENT_ENERGY_ORB,
	EVENT_DISPOSE_HEART,
	EVENT_ENRAGE,
	EVENT_ENTER_HARD_MODE,

	EVENT_CORRECT_REACT,
};

enum Timers
{
	TIMER_TYMPANIC_TANTRUM_MIN = 45000,
	TIMER_TYMPANIC_TANTRUM_MAX = 55000,
	TIMER_SEARING_LIGHT_10 = 16000,
	TIMER_GRAVITY_BOMB_10 = 14000,
	TIMER_SEARING_LIGHT_25 = 16000,
	TIMER_GRAVITY_BOMB_25 = 14000,
	TIMER_HEART_PHASE = 30000,
	TIMER_ENERGY_ORB_MIN = 9000,
	TIMER_ENERGY_ORB_MAX = 10000,
	TIMER_ENRAGE = 480000, // Actually, it was 6 min, but since the HP is quite high

	TIMER_VOID_ZONE = 3000,

	// Life Spark
	TIMER_SHOCK = 5000,

	// Pummeller
	// Timers may be off
	TIMER_ARCING_SMASH = 14000,
	TIMER_TRAMPLE = 16000,
	TIMER_UPPERCUT = 12000,

	TIMER_SPAWN_ADD = 12000,
};

enum Creatures
{
	NPC_VOID_ZONE = 34001,
	NPC_LIFE_SPARK = 34004,
	NPC_XT002_HEART = 33329,
	NPC_XS013_SCRAPBOT = 33343,
	NPC_XM024_PUMMELLER = 33344,
	NPC_XE321_BOOMBOT = 33346,
};

enum Actions
{
	ACTION_ENTER_HARD_MODE,
	ACTION_START_TRANSFERING,
};

enum XT002Data
{
	DATA_TRANSFERED_HEALTH,
	DATA_HARD_MODE,
	DATA_HEALTH_RECOVERED,
	DATA_GRAVITY_BOMB_CASUALTY,
};

enum Yells
{
	SAY_AGGRO = 0,
	SAY_HEART_OPENED = 1,
	SAY_HEART_CLOSED = 2,
	SAY_TYMPANIC_TANTRUM = 3,
	SAY_SLAY = 4,
	SAY_BERSERK = 5,
	SAY_DEATH = 6,
	SAY_SUMMON = 7,
	EMOTE_HEART_OPENED = 9,
	//EMOTE_HEART_CLOSED                          = 9,
	EMOTE_TYMPANIC_TANTRUM = 8,
	EMOTE_REPAIR = 0
};

enum AchievementCredits
{
	ACHIEV_MUST_DECONSTRUCT_FASTER = 21027,
};

enum VehicleSeats
{
	HEART_VEHICLE_SEAT_NORMAL = 0,
	HEART_VEHICLE_SEAT_EXPOSED = 1,
};
#define SPELL_CONSUMPTION RAID_MODE(SPELL_CONSUMPTION_10, SPELL_CONSUMPTION_25)
/*-------------------------------------------------------
*
*        XT-002 DECONSTRUCTOR
*
*///----------------------------------------------------
class boss_xt002 : public CreatureScript
{
public:
	boss_xt002() : CreatureScript("boss_xt002") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_xt002_AI>(creature);
	}

	struct boss_xt002_AI : public BossAI
	{
		boss_xt002_AI(Creature* creature) : BossAI(creature, BOSS_XT002)
		{
		}

		void Reset() override
		{
			_Reset();

			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_AGGRESSIVE);
			DoCast(me, SPELL_STAND);

			_healthRecovered = false;
			_gravityBombCasualty = false;
			_hardMode = false;

			_phase = 1;
			_heartExposed = 0;

			instance->DoStopTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_MUST_DECONSTRUCT_FASTER);
		}

			void EnterCombat(Unit* /*who*/) override
		{
			Talk(SAY_AGGRO);
			_EnterCombat();

			events.ScheduleEvent(EVENT_ENRAGE, TIMER_ENRAGE);
			events.ScheduleEvent(EVENT_GRAVITY_BOMB, RAID_MODE(TIMER_GRAVITY_BOMB_10, TIMER_GRAVITY_BOMB_25));
			events.ScheduleEvent(EVENT_SEARING_LIGHT, RAID_MODE(TIMER_SEARING_LIGHT_10, TIMER_SEARING_LIGHT_25));

			/* Check the first timer of Tympanic Tantrum, seems that it should be a bit slower than the regular one. */

			events.ScheduleEvent(EVENT_TYMPANIC_TANTRUM, 45000);

			instance->DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_MUST_DECONSTRUCT_FASTER);
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_ENTER_HARD_MODE:
				events.ScheduleEvent(EVENT_ENTER_HARD_MODE, 1);
				break;
			}
		}

			void KilledUnit(Unit* who) override
		{
			if (who->GetTypeId() == TYPEID_PLAYER)
			Talk(SAY_SLAY);
		}

			void JustDied(Unit* /*killer*/) override
		{
			_JustDied();
		}

			void DamageTaken(Unit* /*attacker*/, uint32 &damage) override
		{

			if (!_hardMode && _phase == 1 && !HealthAbovePct(100 - 25 * (_heartExposed + 1))) /* Control para el Tympanic Tantrum */
			{
				ExposeHeart();
			}

		}


			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || !CheckInRoom())
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;


			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SEARING_LIGHT:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
						DoCast(target, RAID_MODE(SPELL_SEARING_LIGHT_10, SPELL_SEARING_LIGHT_25));

					events.ScheduleEvent(EVENT_SEARING_LIGHT, RAID_MODE(TIMER_SEARING_LIGHT_10, TIMER_SEARING_LIGHT_25));
					break;
				case EVENT_GRAVITY_BOMB:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
						DoCast(target, RAID_MODE(SPELL_GRAVITY_BOMB_10, SPELL_GRAVITY_BOMB_25));

					events.ScheduleEvent(EVENT_GRAVITY_BOMB, RAID_MODE(TIMER_GRAVITY_BOMB_10, TIMER_GRAVITY_BOMB_25));
					break;
				case EVENT_TYMPANIC_TANTRUM:
					Talk(SAY_TYMPANIC_TANTRUM);
					Talk(EMOTE_TYMPANIC_TANTRUM);
					me->SetReactState(REACT_PASSIVE);
					DoCast(SPELL_TYMPANIC_TANTRUM);
					events.ScheduleEvent(EVENT_CORRECT_REACT, 11000);
					events.ScheduleEvent(EVENT_TYMPANIC_TANTRUM, urand(TIMER_TYMPANIC_TANTRUM_MIN, TIMER_TYMPANIC_TANTRUM_MAX));
					break;
				case EVENT_CORRECT_REACT:
					me->SetReactState(REACT_AGGRESSIVE);
					break;
				case EVENT_DISPOSE_HEART:
					SetPhaseOne();
					break;
				case EVENT_ENRAGE:
					Talk(SAY_BERSERK);
					DoCast(me, SPELL_ENRAGE);
					break;
				case EVENT_ENTER_HARD_MODE:
					me->SetFullHealth();
					DoCast(me, RAID_MODE(SPELL_HEARTBREAK_10, SPELL_HEARTBREAK_25), true);
					me->AddLootMode(LOOT_MODE_HARD_MODE_1);
					_hardMode = true;
					SetPhaseOne();
					break;
				}
			}

			if (_phase == 1)
				DoMeleeAttackIfReady();
		}

			void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply) override
		{
			if (apply && who->GetEntry() == NPC_XS013_SCRAPBOT)
			{
				// Need this so we can properly determine when to expose heart again in damagetaken hook
				if (me->GetHealthPct() > (25 * (4 - _heartExposed)))
					++_heartExposed;

				//Talk(EMOTE_SCRAPBOT);
				_healthRecovered = true;
			}
		}

			uint32 GetData(uint32 type) const override
		{
			switch (type)
			{
			case DATA_HARD_MODE:
				return _hardMode ? 1 : 0;
			case DATA_HEALTH_RECOVERED:
				return _healthRecovered ? 1 : 0;
			case DATA_GRAVITY_BOMB_CASUALTY:
				return _gravityBombCasualty ? 1 : 0;
			}

			return 0;
		}

			void SetData(uint32 type, uint32 data) override
		{
			switch (type)
			{
			case DATA_TRANSFERED_HEALTH:
				_transferHealth = data;
				break;
			case DATA_GRAVITY_BOMB_CASUALTY:
				_gravityBombCasualty = (data > 0) ? true : false;
				break;
			}
		}


			void ExposeHeart()
		{
			me->CastStop();
			me->AttackStop();
			Talk(SAY_HEART_OPENED);
			Talk(EMOTE_HEART_OPENED);

			DoCast(me, SPELL_SUBMERGE);  // WIll make creature untargetable
			me->SetReactState(REACT_PASSIVE);

			Unit* heart = me->GetVehicleKit() ? me->GetVehicleKit()->GetPassenger(HEART_VEHICLE_SEAT_NORMAL) : NULL;

			if (heart)
			{
				heart->CastSpell(heart, SPELL_HEART_OVERLOAD, false);
				heart->AddAura(SPELL_EXPOSED_HEART, heart);
				heart->CastSpell(me, SPELL_HEART_LIGHTNING_TETHER, false);
				heart->CastSpell(heart, SPELL_HEART_HEAL_TO_FULL, true);
				//                    heart->CastSpell(heart, SPELL_EXPOSED_HEART, true);    // Channeled
				heart->ChangeSeat(HEART_VEHICLE_SEAT_EXPOSED, true);
				heart->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				heart->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
			} /* Until here */

			events.CancelEvent(EVENT_SEARING_LIGHT);
			events.CancelEvent(EVENT_GRAVITY_BOMB);
			events.CancelEvent(EVENT_TYMPANIC_TANTRUM);

			// Start "end of phase 2 timer"
			events.ScheduleEvent(EVENT_DISPOSE_HEART, TIMER_HEART_PHASE);

			// Phase 2 has officially started
			_phase = 2;
			_heartExposed++;
		}

		void SetPhaseOne()
		{
			_transferHealth = 0;
			Talk(SAY_HEART_CLOSED);
			//Talk(EMOTE_HEART_CLOSED);

			DoCast(me, SPELL_STAND);
			me->SetReactState(REACT_AGGRESSIVE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			_phase = 1;

			events.RescheduleEvent(EVENT_SEARING_LIGHT, RAID_MODE(TIMER_SEARING_LIGHT_10, TIMER_SEARING_LIGHT_25) / 2);
			events.RescheduleEvent(EVENT_GRAVITY_BOMB, RAID_MODE(TIMER_GRAVITY_BOMB_10, TIMER_GRAVITY_BOMB_25));
			events.RescheduleEvent(EVENT_TYMPANIC_TANTRUM, urand(TIMER_TYMPANIC_TANTRUM_MIN, TIMER_TYMPANIC_TANTRUM_MAX));

			//Unit* heart = me->GetVehicleKit() ? me->GetVehicleKit()->GetPassenger(HEART_VEHICLE_SEAT_EXPOSED) : NULL;				
			Unit* heart = me->FindNearestCreature(NPC_XT002_HEART, 70.f, true);
			if (!heart)
				return;

			heart->ChangeSeat(HEART_VEHICLE_SEAT_NORMAL, false);
			heart->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			heart->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
			heart->RemoveAurasDueToSpell(SPELL_EXPOSED_HEART);

			if (!_hardMode)
			{
				_transferHealth = heart->GetMaxHealth() - heart->GetHealth();
				int newHealth = int(me->GetHealth()) - int(_transferHealth);

				if (newHealth > 0)
				{
					me->LowerPlayerDamageReq(_transferHealth);
					heart->DealDamage(me, _transferHealth, NULL, NODAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
				}
				else
				{
					uint32 damage = me->GetHealth() - RAID_MODE(50000, 300000);
					me->LowerPlayerDamageReq(damage);
					heart->DealDamage(me, damage, NULL, NODAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
				}
			}
		}

	private:
		// Achievement related
		bool _healthRecovered;       // Did a scrapbot recover XT-002's health during the encounter?
		bool _hardMode;              // Are we in hard mode? Or: was the heart killed during phase 2?
		bool _gravityBombCasualty;   // Did someone die because of Gravity Bomb damage?

		uint8 _phase;
		uint8 _heartExposed;
		int _transferHealth;
	};
};

/*-------------------------------------------------------
*
*        XT-002 HEART
*
*///----------------------------------------------------

class npc_xt002_heart : public CreatureScript
{
public:
	npc_xt002_heart() : CreatureScript("npc_xt002_heart") { }

	struct npc_xt002_heartAI : public ScriptedAI
	{
		npc_xt002_heartAI(Creature* creature) : ScriptedAI(creature),
			_instance(creature->GetInstanceScript())
		{
			SetCombatMovement(false);
			healthTransfered = 0;
		}

		void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_START_TRANSFERING:
				healthTransfered = 0;
				break;
			}
		}

			void DamageTaken(Unit* who, uint32 &damage) override
		{
			/*if (Creature* pXT002 = me->GetCreature(*me, _instance->GetGuidData(BOSS_XT002)))
			{
			/*float xtHealthPct = pXT002->GetHealthPct();
			std::cout << "XT-002 Health: " << int(xtHealthPct) << "\n";
			if ((xtHealthPct >=51 && xtHealthPct < 76) || (xtHealthPct >=25 && xtHealthPct < 51) || (xtHealthPct >=2 && xtHealthPct < 26))
			me->DealDamage(pXT002, damage, NULL, NODAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);*/
			//}				
		}

		void UpdateAI(uint32 /*diff*/) override{}

		void JustDied(Unit* /*killer*/) override
		{
			Creature* xt002 = _instance ? ObjectAccessor::GetCreature(*me, _instance->GetGuidData(BOSS_XT002)) : NULL;
			if (!xt002 || !xt002->AI())
				return;
			healthTransfered = 0;
			xt002->AI()->SetData(DATA_TRANSFERED_HEALTH, me->GetHealth());
			xt002->AI()->DoAction(ACTION_ENTER_HARD_MODE);
		}

	private:
		float healthTransfered;
		InstanceScript* _instance;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_xt002_heartAI>(creature);
	}
};

/*-------------------------------------------------------
*
*        XS-013 SCRAPBOT
*
*///----------------------------------------------------
class npc_scrapbot : public CreatureScript
{
public:
	npc_scrapbot() : CreatureScript("npc_scrapbot") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_scrapbotAI>(creature);
	}

	struct npc_scrapbotAI : public ScriptedAI
	{
		npc_scrapbotAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = me->GetInstanceScript();
		}

		void Reset() override
		{
			me->SetReactState(REACT_PASSIVE);

			_rangeCheckTimer = 500;

			if (Creature* pXT002 = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(BOSS_XT002)))
			{
				me->AI()->DoZoneInCombat(pXT002, 300.00f);
				me->GetMotionMaster()->MoveIdle();
				me->GetMotionMaster()->MoveChase(pXT002);
			}
		}

			void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (spell->Id != SPELL_BOOM)
			return;

			me->DealDamage(me, me->GetHealth(), NULL, NODAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
		}

			void UpdateAI(uint32 diff) override
		{
			if (_rangeCheckTimer <= diff)
			{
				if (Creature* xt002 = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(BOSS_XT002)))
				{
					if (me->IsWithinMeleeRange(xt002))
					{
						DoCast(xt002, SPELL_SCRAPBOT_RIDE_VEHICLE);
						//xt002->ModifyHealth(60000);
						Talk(EMOTE_REPAIR);
						xt002->CastSpell(xt002, SPELL_HEAL_XT002, true);
						// Unapply vehicle aura again
						xt002->RemoveAurasDueToSpell(SPELL_SCRAPBOT_RIDE_VEHICLE);
						me->DespawnOrUnsummon();
					}
				}
			}
			else
				_rangeCheckTimer -= diff;
		}

	private:
		InstanceScript* _instance;
		uint32 _rangeCheckTimer;
	};
};

/*-------------------------------------------------------
*
*        XM-024 PUMMELLER
*
*///----------------------------------------------------
class npc_pummeller : public CreatureScript
{
public:
	npc_pummeller() : CreatureScript("npc_pummeller") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_pummellerAI>(creature);
	}

	struct npc_pummellerAI : public ScriptedAI
	{
		npc_pummellerAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_arcingSmashTimer = TIMER_ARCING_SMASH;
			_trampleTimer = TIMER_TRAMPLE;
			_uppercutTimer = TIMER_UPPERCUT;

			if (Creature* xt002 = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(BOSS_XT002)))
			{
				Position pos;
				pos = xt002->GetPosition();
				me->GetMotionMaster()->MovePoint(0, pos);
			}
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (me->IsWithinMeleeRange(me->GetVictim()))
			{
				if (_arcingSmashTimer <= diff)
				{
					DoCastVictim(SPELL_ARCING_SMASH);
					_arcingSmashTimer = TIMER_ARCING_SMASH;
				}
				else
					_arcingSmashTimer -= diff;

				if (_trampleTimer <= diff)
				{
					DoCastVictim(SPELL_TRAMPLE);
					_trampleTimer = TIMER_TRAMPLE;
				}
				else
					_trampleTimer -= diff;

				if (_uppercutTimer <= diff)
				{
					DoCastVictim(SPELL_UPPERCUT);
					_uppercutTimer = TIMER_UPPERCUT;
				}
				else
					_uppercutTimer -= diff;
			}

			DoMeleeAttackIfReady();
		}

	private:
		InstanceScript* _instance;
		uint32 _arcingSmashTimer;
		uint32 _trampleTimer;
		uint32 _uppercutTimer;
	};
};

/*-------------------------------------------------------
*
*        XE-321 BOOMBOT
*
*///----------------------------------------------------
class BoomEvent : public BasicEvent
{
public:
	BoomEvent(Creature* me) : _me(me)
	{
	}

	bool Execute(uint64 /*time*/, uint32 /*diff*/)
	{
		// This hack is here because we suspect our implementation of spell effect execution on targets
		// is done in the wrong order. We suspect that EFFECT_0 needs to be applied on all targets,
		// then EFFECT_1, etc - instead of applying each effect on target1, then target2, etc.
		// The above situation causes the visual for this spell to be bugged, so we remove the instakill
		// effect and implement a script hack for that.

		_me->CastSpell(_me, SPELL_BOOM, false);
		return true;
	}

private:
	Creature* _me;
};

class npc_boombot : public CreatureScript
{
public:
	npc_boombot() : CreatureScript("npc_boombot") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetInstanceAI<npc_boombotAI>(creature);
	}

	struct npc_boombotAI : public ScriptedAI
	{
		npc_boombotAI(Creature* creature) : ScriptedAI(creature)
		{
			_instance = creature->GetInstanceScript();
		}

		void Reset() override
		{
			_boomed = false;
			me->SetReactState(REACT_PASSIVE);
			DoCast(SPELL_AURA_BOOMBOT); // For achievement

			// HACK
			me->SetFloatValue(UNIT_FIELD_MINDAMAGE, 15000.0f);
			me->SetFloatValue(UNIT_FIELD_MAXDAMAGE, 18000.0f);
			me->SetDisplayId(19139);
			me->SetSpeed(MOVE_RUN, 0.5f, true);


			if (pXT002 = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(BOSS_XT002)))
			{
				me->AI()->DoZoneInCombat(pXT002, 300.00f);
				me->GetMotionMaster()->MoveIdle();
				me->GetMotionMaster()->MoveChase(pXT002);
			}
		}

			void boomProcedure()
		{
			_boomed = true; // Prevent recursive calls

			WorldPacket data(SMSG_SPELLINSTAKILLLOG, 8 + 8 + 4);
			data << uint64(me->GetGUID());
			data << uint64(me->GetGUID());
			data << uint32(SPELL_BOOM);
			me->SendMessageToSet(&data, false);

			me->DealDamage(me, me->GetHealth(), NULL, NODAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);


			// Visual only seems to work if the instant kill event is delayed or the spell itself is delayed
			// Casting done from player and caster source has the same targetinfo flags,
			// so that can't be the issue
			// See BoomEvent class
			// Schedule 1s delayed
			me->m_Events.AddEvent(new BoomEvent(me), me->m_Events.CalculateTime(1 * IN_MILLISECONDS));
		}

		void DamageTaken(Unit* /*who*/, uint32& damage) override
		{
			if (damage >= (me->GetHealth() - me->GetMaxHealth() * 0.5f) && !_boomed)
			{
				damage = 0;
				boomProcedure();
			}
		}

			void UpdateAI(uint32 /*diff*/) override
		{

			if (pXT002)
			if (me->GetDistance2d(pXT002) < 8.0f)
				boomProcedure();
			else
				return;
			// No melee attack
		}

	private:
		InstanceScript* _instance;
		Creature* pXT002;
		bool _boomed;
	};
};


/*-------------------------------------------------------
*
*        LIFE SPARK
*
*///----------------------------------------------------
class npc_life_spark : public CreatureScript
{
public:
	npc_life_spark() : CreatureScript("npc_life_spark") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_life_sparkAI(creature);
	}
		/*






		MODELO DE LAS SPARKAS, REVISAR EN VIDEOS Y PONER UNO.


		UNA DE LAS VECES, TE HA APARECIDO INVISIBLE.




		*/
	struct npc_life_sparkAI : public ScriptedAI
	{
		npc_life_sparkAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset() override
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid1);
			DoCast(me, RAID_MODE(SPELL_STATIC_CHARGED_10, SPELL_STATIC_CHARGED_25));
			_shockTimer = 0; // first one is immediate.
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (_shockTimer <= diff)
			{
				if (me->IsWithinMeleeRange(me->GetVictim()))
				{
					DoCastVictim(SPELL_SHOCK);
					_shockTimer = TIMER_SHOCK;
				}
			}
			else _shockTimer -= diff;
		}

	private:
		uint32 _shockTimer;
	};
};

class npc_void_zone : public CreatureScript
{
public:
	npc_void_zone() : CreatureScript("npc_void_zone") {}

	struct npc_void_zoneAI : public ScriptedAI
	{
		npc_void_zoneAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset()
		{
			consumptionTimer = 3 * IN_MILLISECONDS;
		}

		void UpdateAI(uint32 diff)
		{
			if (consumptionTimer <= diff)
			{
				int32 dmg = RAID_MODE<uint32>(5000, 7500);
				me->CastCustomSpell(me, SPELL_CONSUMPTION, &dmg, 0, 0, false);
				consumptionTimer = 3 * IN_MILLISECONDS;
			}
			else
				consumptionTimer -= diff;
		}

	private:
		uint32 consumptionTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_void_zoneAI(creature);
	}
};

class spell_xt002_searing_light_spawn_life_spark : public SpellScriptLoader
{
public:
	spell_xt002_searing_light_spawn_life_spark() : SpellScriptLoader("spell_xt002_searing_light_spawn_life_spark") { }

	class spell_xt002_searing_light_spawn_life_spark_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_xt002_searing_light_spawn_life_spark_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_LIFE_SPARK))
			return false;
			return true;
		}

			void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Player* player = GetOwner()->ToPlayer())
				if (Unit* xt002 = GetCaster())
					if (Creature* xt002c = xt002->ToCreature())   // Heartbreak aura indicating hard mode
						if (xt002c->IsAIEnabled)
							if (xt002c->AI()->GetData(DATA_HARD_MODE))   // Heartbreak aura indicating hard mode					
								xt002c->CastSpell(player, SPELL_SUMMON_LIFE_SPARK, true);
		}

		void Register() override
		{
			AfterEffectRemove += AuraEffectRemoveFn(spell_xt002_searing_light_spawn_life_spark_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_xt002_searing_light_spawn_life_spark_AuraScript();
	}
};

class spell_xt002_gravity_bomb_aura : public SpellScriptLoader
{
public:
	spell_xt002_gravity_bomb_aura() : SpellScriptLoader("spell_xt002_gravity_bomb_aura") { }

	class spell_xt002_gravity_bomb_aura_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_xt002_gravity_bomb_aura_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_SUMMON_VOID_ZONE))
			return false;
			return true;
		}

			void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
		{
			if (Player* player = GetOwner()->ToPlayer())
				if (Unit* xt002 = GetCaster())
					if (Creature* xt002c = xt002->ToCreature())   // Heartbreak aura indicating hard mode
						if (xt002c->IsAIEnabled)
							if (xt002c->AI()->GetData(DATA_HARD_MODE))
								xt002c->CastSpell(player, SPELL_SUMMON_VOID_ZONE, true);
		}

		void OnPeriodic(AuraEffect const* aurEff)
		{
			Unit* xt002 = GetCaster();
			if (!xt002)
				return;

			Unit* owner = GetOwner()->ToUnit();
			if (!owner)
				return;

			if (aurEff->GetAmount() >= int32(owner->GetHealth()))
				if (xt002->GetAI())
					xt002->GetAI()->SetData(DATA_GRAVITY_BOMB_CASUALTY, 1);
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_xt002_gravity_bomb_aura_AuraScript::OnPeriodic, EFFECT_2, SPELL_AURA_PERIODIC_DAMAGE);
			AfterEffectRemove += AuraEffectRemoveFn(spell_xt002_gravity_bomb_aura_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_xt002_gravity_bomb_aura_AuraScript();
	}
};

class spell_xt002_gravity_bomb_damage : public SpellScriptLoader
{
public:
	spell_xt002_gravity_bomb_damage() : SpellScriptLoader("spell_xt002_gravity_bomb_damage") { }

	class spell_xt002_gravity_bomb_damage_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_xt002_gravity_bomb_damage_SpellScript);

		void HandleScript(SpellEffIndex /*eff*/)
		{
			Unit* caster = GetCaster();
			if (!caster)
				return;

			if (GetHitDamage() >= int32(GetHitUnit()->GetHealth()))
				if (caster->GetAI())
					caster->GetAI()->SetData(DATA_GRAVITY_BOMB_CASUALTY, 1);
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_xt002_gravity_bomb_damage_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_xt002_gravity_bomb_damage_SpellScript();
	}
};

class spell_xt002_heart_overload_periodic : public SpellScriptLoader
{
public:
	spell_xt002_heart_overload_periodic() : SpellScriptLoader("spell_xt002_heart_overload_periodic") { }

	class spell_xt002_heart_overload_periodic_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_xt002_heart_overload_periodic_SpellScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_ENERGY_ORB))
			return false;

			if (!sSpellMgr->GetSpellInfo(SPELL_RECHARGE_BOOMBOT))
				return false;

			if (!sSpellMgr->GetSpellInfo(SPELL_RECHARGE_PUMMELER))
				return false;

			if (!sSpellMgr->GetSpellInfo(SPELL_RECHARGE_SCRAPBOT))
				return false;

			return true;
		}

			void HandleScript(SpellEffIndex effIndex)
		{
			if (Unit* caster = GetCaster())
			{
				if (InstanceScript* instance = caster->GetInstanceScript())
				{
					if (Unit* toyPile = ObjectAccessor::GetUnit(*caster, instance->GetGuidData(DATA_TOY_PILE_0 + urand(0, 3))))
					{
						caster->CastSpell(toyPile, SPELL_ENERGY_ORB, true);

						// This should probably be incorporated in a dummy effect handler, but I've had trouble getting the correct target
						// Weighed randomization (approximation)
						/*uint32 const spells[] = { SPELL_RECHARGE_SCRAPBOT, SPELL_RECHARGE_SCRAPBOT, SPELL_RECHARGE_SCRAPBOT,
						SPELL_RECHARGE_PUMMELER, SPELL_RECHARGE_BOOMBOT };*/


						if (InstanceScript* instance = GetCaster()->GetInstanceScript())
						{

							toyPile->CastSpell(toyPile, SPELL_RECHARGE_BOOMBOT, true, NULL, NULL, instance->GetGuidData(BOSS_XT002));

							for (uint8 i = 0; i <= 3; i++)
								toyPile->CastSpell(toyPile, SPELL_RECHARGE_SCRAPBOT, true, NULL, NULL, instance->GetGuidData(BOSS_XT002));

							if (Aura* aura = GetCaster()->GetAura(SPELL_HEART_OVERLOAD))
								if (AuraEffect * aurEff = aura->GetEffect(effIndex)) // EFFECT_0
								{
								if (aurEff->GetTickNumber() == 2)
									toyPile->CastSpell(toyPile, SPELL_RECHARGE_PUMMELER, true, NULL, NULL, instance->GetGuidData(BOSS_XT002));
								else
								{
									if (aurEff->GetTickNumber() == 4)
									{
										bool summonPummeler = urand(false, true);
										if (summonPummeler)
											toyPile->CastSpell(toyPile, SPELL_RECHARGE_PUMMELER, true, NULL, NULL, instance->GetGuidData(BOSS_XT002));
									}
								}
								}
						}
					}
				}

				if (Creature* base = caster->GetVehicleCreatureBase())
					base->AI()->Talk(SAY_SUMMON);
			}
		}

		void Register() override
		{
			OnEffectHit += SpellEffectFn(spell_xt002_heart_overload_periodic_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_xt002_heart_overload_periodic_SpellScript();
	}
};

class spell_xt002_tympanic_tantrum : public SpellScriptLoader
{
public:
	spell_xt002_tympanic_tantrum() : SpellScriptLoader("spell_xt002_tympanic_tantrum") { }

	class spell_xt002_tympanic_tantrum_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_xt002_tympanic_tantrum_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(PlayerOrPetCheck());
		}

		void RecalculateDamage()
		{
			// if is pet, less.

			SetHitDamage(GetHitUnit()->CountPctFromMaxHealth(10));
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_xt002_tympanic_tantrum_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_xt002_tympanic_tantrum_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
			OnHit += SpellHitFn(spell_xt002_tympanic_tantrum_SpellScript::RecalculateDamage);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_xt002_tympanic_tantrum_SpellScript();
	}
};

class spell_xt002_submerged : public SpellScriptLoader
{
public:
	spell_xt002_submerged() : SpellScriptLoader("spell_xt002_submerged") { }

	class spell_xt002_submerged_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_xt002_submerged_SpellScript);

		void HandleScript(SpellEffIndex /*eff*/)
		{
			Creature* target = GetHitCreature(); /* Y ESTO, REVISAR, LO MISMO EN EL STAND*/
			if (!target)
				return;

			target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			target->SetByteValue(UNIT_FIELD_BYTES_1, 0, UNIT_STAND_STATE_SUBMERGED); /* MIRAR POR AQUÍ EL PROBLEMA EN*/
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_xt002_submerged_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_xt002_submerged_SpellScript();
	}
};

class spell_xt002_stand : public SpellScriptLoader
{
public:
	spell_xt002_stand() : SpellScriptLoader("spell_xt002_stand") { }

	class spell_xt002_stand_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_xt002_stand_SpellScript);

		void HandleScript(SpellEffIndex /*eff*/)
		{
			Creature* target = GetHitCreature(); /* AQUI */
			if (!target)
				return;

			target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			target->SetByteValue(UNIT_FIELD_BYTES_1, 0, UNIT_STAND_STATE_STAND); /* REVISAR FLAGS IGUAL ES TEMA DE QUITAR CORRECTAMENTE */
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_xt002_stand_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_xt002_stand_SpellScript();
	}
};

class achievement_nerf_engineering : public AchievementCriteriaScript
{
public:
	achievement_nerf_engineering() : AchievementCriteriaScript("achievement_nerf_engineering") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target || !target->GetAI())
		return false;

		return !(target->GetAI()->GetData(DATA_HEALTH_RECOVERED));
	}
};

class achievement_heartbreaker : public AchievementCriteriaScript
{
public:
	achievement_heartbreaker() : AchievementCriteriaScript("achievement_heartbreaker") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target || !target->GetAI())
		return false;

		return target->GetAI()->GetData(DATA_HARD_MODE);
	}
};

class achievement_nerf_gravity_bombs : public AchievementCriteriaScript
{
public:
	achievement_nerf_gravity_bombs() : AchievementCriteriaScript("achievement_nerf_gravity_bombs") { }

	bool OnCheck(Player* /*source*/, Unit* target) override
	{
		if (!target || !target->GetAI())
		return false;

		return !(target->GetAI()->GetData(DATA_GRAVITY_BOMB_CASUALTY));
	}
};

void AddSC_boss_xt002()
{
	new npc_xt002_heart();
	new npc_scrapbot();
	new npc_pummeller();
	new npc_boombot();

	new npc_life_spark();
	new boss_xt002();

	new npc_void_zone();

	new spell_xt002_searing_light_spawn_life_spark();
	new spell_xt002_gravity_bomb_aura();
	new spell_xt002_gravity_bomb_damage();
	new spell_xt002_heart_overload_periodic();
	new spell_xt002_tympanic_tantrum();
	new spell_xt002_submerged();
	new spell_xt002_stand();

	//new achievement_nerf_engineering();
	new achievement_heartbreaker();
	new achievement_nerf_gravity_bombs();
}
