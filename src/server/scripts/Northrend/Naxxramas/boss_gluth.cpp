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
#include "naxxramas.h"

enum Spells
{
    SPELL_MORTAL_WOUND      = 25646,
    SPELL_ENRAGE            = 28371,
    SPELL_DECIMATE_10       = 28374,
    SPELL_DECIMATE_25       = 54426,
    SPELL_BERSERK           = 26662,
	SPELL_INFECTED_WOUND    = 29306,
    SPELL_AURA_INFECTED_WOUND    = 29307
};

enum Creatures
{
    NPC_ZOMBIE              = 16360,    
};

Position const PosSummon[3] =
{
    {3267.9f, -3172.1f, 297.42f, 0.94f},
    {3253.2f, -3132.3f, 297.42f, 0},
    {3308.3f, -3185.8f, 297.42f, 1.58f},
};

enum Events
{
    EVENT_WOUND     = 1,
    EVENT_ENRAGE,
    EVENT_DECIMATE,
    EVENT_BERSERK,
    EVENT_SUMMON,
    EVENT_DEVOUR,
    EVENT_DEVOUR2,

	EVENT_CHECK_TARGET
};

enum Emotes
{
    EMOTE_NEARBY,
    EMOTE_ENRAGE,
    EMOTE_DECIMATE
};

class boss_gluth : public CreatureScript
{
public:
    boss_gluth() : CreatureScript("boss_gluth") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_gluthAI(creature);
    }

    struct boss_gluthAI : public BossAI
    {
        boss_gluthAI(Creature* creature) : BossAI(creature, BOSS_GLUTH)
        {
            // Do not let Gluth be affected by zombies' debuff
            me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_INFECTED_WOUND, true);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();
            events.ScheduleEvent(EVENT_WOUND, 10000);
            events.ScheduleEvent(EVENT_ENRAGE, 15000);
			events.ScheduleEvent(EVENT_DECIMATE, 105000); //105000
            events.ScheduleEvent(EVENT_BERSERK, 8*60000);
            events.ScheduleEvent(EVENT_SUMMON, 15000);
            events.ScheduleEvent(EVENT_DEVOUR, 15000);
        }

		void JustSummoned(Creature* summon) override
		{
				summon->AI()->DoZoneInCombat(me, 150.00f);				
				summon->GetMotionMaster()->MoveIdle();
				summon->GetMotionMaster()->MoveChase(me);								
				summon->AddAura(SPELL_AURA_INFECTED_WOUND, summon);

				summons.Summon(summon);
		}

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictimWithGaze() || !CheckInRoom())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_WOUND:
                        DoCastVictim(SPELL_MORTAL_WOUND);
                        events.ScheduleEvent(EVENT_WOUND, 10000);
                        break;
                    case EVENT_ENRAGE:
                        Talk(EMOTE_ENRAGE);
                        DoCast(me, SPELL_ENRAGE);
                        events.ScheduleEvent(EVENT_ENRAGE, 15000);
                        break;
                    case EVENT_DECIMATE:
                        Talk(EMOTE_DECIMATE);
                        me->CastSpell(me, RAID_MODE(SPELL_DECIMATE_10, SPELL_DECIMATE_25), false);
						events.ScheduleEvent(EVENT_DECIMATE, 105000);                        
                        break;
                    case EVENT_BERSERK:
                        DoCast(me, SPELL_BERSERK);
                        events.ScheduleEvent(EVENT_BERSERK, 5*60000);
                        break;
                    case EVENT_SUMMON:
                        /*for (int32 i = 0; i < RAID_MODE(1, 2); ++i)
                            DoSummon(NPC_ZOMBIE, PosSummon[urand(0,2)]);*/

						
						if (!Is25ManRaid())
							DoSummon(NPC_ZOMBIE, PosSummon[0]);
						else{
							DoSummon(NPC_ZOMBIE, PosSummon[rand32() % 3]);
							DoSummon(NPC_ZOMBIE, PosSummon[rand32() % 3]);
						}
						
                        events.ScheduleEvent(EVENT_SUMMON, 10000);
                        break;
                    case EVENT_DEVOUR:
                        {
                            Creature* zombie = me->FindNearestCreature(NPC_ZOMBIE, 8);
                            if(zombie)
                            {
                                Talk(EMOTE_NEARBY);
                                /*me->AddUnitState(UNIT_STATE_NOT_MOVE);
                                me->SetTarget(zombie->GetGUID());
								me->Kill(zombie);*/
								
								zombie->Kill(zombie);
								me->ModifyHealth(me->CountPctFromMaxHealth(5));
                                //events.ScheduleEvent(EVENT_DEVOUR2, 500);
                            }
                            events.ScheduleEvent(EVENT_DEVOUR, 3000);
                        }
                        break;
                    /*case EVENT_DEVOUR2:
                        {
                            /*Creature* zombie = sObjectAccessor->GetCreature(*me, me->GetTarget());
                            
                            //Unit* unit = SelectTarget(SELECT_TARGET_TOPAGGRO);
                           // me->SetTarget(unit->GetGUID());
                            me->ClearUnitState(UNIT_STATE_NOT_MOVE);
                            
                        }*/
                }
            }
            
            DoMeleeAttackIfReady();
        }
    };

};



class spell_gluth_decimate : public SpellScriptLoader
{
public:
	spell_gluth_decimate() : SpellScriptLoader("spell_gluth_decimate") { };

	class spell_gluth_decimate_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_gluth_decimate_SpellScript);

		void HandleScriptEffect(SpellEffIndex /*effIndex*/)
		{
			if (Unit* unitTarget = GetHitUnit())
			{
				int32 damage = int32(unitTarget->GetHealth()) - int32(unitTarget->CountPctFromMaxHealth(5));
				if (damage <= 0)
					return;

				if (Creature* cTarget = unitTarget->ToCreature())
				{
					if (cTarget->GetEntry() == NPC_ZOMBIE)
					{
						cTarget->SetWalk(true);						
						cTarget->SetSpeed(MOVE_RUN, 0.5f);
						cTarget->GetMotionMaster()->MoveFollow(GetCaster(), 0.0f, 0.0f, MOTION_SLOT_CONTROLLED);
						cTarget->SetReactState(REACT_PASSIVE);
						GetCaster()->DealDamage(cTarget, damage);						
						return;
					}
				}

				GetCaster()->CastCustomSpell(28375, SPELLVALUE_BASE_POINT0, damage, unitTarget);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_gluth_decimate_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_gluth_decimate_SpellScript();
	}
};
void AddSC_boss_gluth()
{
    new boss_gluth(); 	
	new spell_gluth_decimate();
}