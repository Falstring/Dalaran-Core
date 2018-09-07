/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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
#include "ScriptedGossip.h"
#include "ulduar.h"
#include "InstanceScript.h"
#include <limits>

/************************************************************************/
/*                       Predicates                                     */
/************************************************************************/

struct RangeCheck : public std::unary_function<Unit*, bool>
{
    RangeCheck(Unit* base, float min, float max) : __base(base), __mindist(min), __maxdist(max) {}

    bool operator()(Unit* const other) const
    {
        float dist = __base->GetDistance(other->GetPositionX(), other->GetPositionY(), other->GetPositionZ());
        if ( dist >= __mindist && dist <= __maxdist)
            return true;
        return false;
    }

    private:
        Unit* __base;
        float __mindist;
        float __maxdist;
};

// Note: This predicate also works in SelectTarget(...), while Trinity::UnitAuraCheck does not (due to missing const-specifier)
template<bool IsApplied>
struct AuraAppliedCheck : public std::unary_function<Unit*, bool>    	
{
    AuraAppliedCheck(uint32 spellId) : __spellId(spellId) {}
    bool operator()(Unit* const target) const
    {
        return (target->HasAura(__spellId) == IsApplied);
    }
    private:
        uint32 __spellId;
};

/************************************************************************/
/*                       The Grand Approach                             */
/************************************************************************/

class npc_steelforged_defender : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_HAMSTRING         = 1,
            EVENT_LIGHTNING_BOLT,
            EVENT_SUNDER_ARMOR
        };

        enum Spells
        {
            SPELL_HAMSTRING         = 62845,
            SPELL_LIGHTNING_BOLT    = 57780,
            SPELL_SUNDER_ARMOR      = 50370
        };

    public:
        npc_steelforged_defender () : CreatureScript("npc_steelforged_defender") {}

        struct npc_steelforged_defenderAI: public ScriptedAI
        {
            npc_steelforged_defenderAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();

                events.ScheduleEvent(EVENT_HAMSTRING, 10*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_LIGHTNING_BOLT, urand(9*IN_MILLISECONDS, 12*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_SUNDER_ARMOR, 2*IN_MILLISECONDS);
            }

            void JustDied(Unit* /*killer*/)
            {
                if (InstanceScript* instance = me->GetInstanceScript())
                    if (instance->GetBossState(BOSS_LEVIATHAN) == DONE)
                        me->SetRespawnTime(604800); // Once the levi died, we will not spawn again
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_HAMSTRING:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f), SPELL_HAMSTRING);
                            events.ScheduleEvent(EVENT_HAMSTRING, 10*IN_MILLISECONDS);
                            break;
                        case EVENT_LIGHTNING_BOLT:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f), SPELL_LIGHTNING_BOLT);
                            events.ScheduleEvent(EVENT_LIGHTNING_BOLT, 9*IN_MILLISECONDS);
                            break;
                        case EVENT_SUNDER_ARMOR:
                            DoCastVictim( SPELL_SUNDER_ARMOR);
                            if (Unit* vic = me->GetVictim())
                                if (Aura* sunder = vic->GetAura(SPELL_SUNDER_ARMOR))
                                    if (sunder->GetStackAmount() == 5)  // If stacks are maximized, we will take a longer delay.
                                    {
                                        events.ScheduleEvent(EVENT_SUNDER_ARMOR, 15*IN_MILLISECONDS);
                                        break;
                                    }
                            events.ScheduleEvent(EVENT_SUNDER_ARMOR, 2*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_steelforged_defenderAI(creature);
        }
};

class npc_ironwork_cannon : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_FLAME_CANNON = 1
        };

        enum Spells
        {
            SPELL_FLAME_CANNON = 62395
        };

    public:
        npc_ironwork_cannon () : CreatureScript("npc_ironwork_cannon") {}

        struct npc_ironwork_cannonAI: public ScriptedAI
        {
            npc_ironwork_cannonAI(Creature* creature) : ScriptedAI(creature) 
            {
                me->SetFloatValue(UNIT_FIELD_COMBATREACH, 100.0f);
            }

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_FLAME_CANNON, 1.2*IN_MILLISECONDS);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_FLAME_CANNON:
                            if (Unit* dest = SelectTarget(SELECT_TARGET_RANDOM, 0, RangeCheck(me, 30.0f, 200.0f)))
                                DoCast(dest, SPELL_FLAME_CANNON);
                            events.ScheduleEvent(EVENT_FLAME_CANNON, 1.5*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ironwork_cannonAI(creature);
        }
};

class npc_molten_colossus : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_EARTHQUAKE = 1,
            EVENT_MAGMA_SPLASH,
            EVENT_PYROBLAST
        };

        enum Spells
        {
            SPELL_EARTHQUAKE    = 64697,
            SPELL_MAGMA_SPLASH  = 64699,
            SPELL_PYROBLAST     = 64698
        };

    public:
        npc_molten_colossus () : CreatureScript("npc_molten_colossus") {}

        struct npc_molten_colossusAI: public ScriptedAI
        {
            npc_molten_colossusAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_EARTHQUAKE, urand(4*IN_MILLISECONDS, 7*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_MAGMA_SPLASH, 3*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_PYROBLAST, urand(5*IN_MILLISECONDS, 6*IN_MILLISECONDS));
            }

			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(55.0f);
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_EARTHQUAKE:
                            DoCastAOE(SPELL_EARTHQUAKE);
                            events.ScheduleEvent(EVENT_EARTHQUAKE, urand(4*IN_MILLISECONDS, 8*IN_MILLISECONDS));
                            break;
                        case EVENT_MAGMA_SPLASH:
                            DoCastVictim(SPELL_MAGMA_SPLASH);
                            events.ScheduleEvent(EVENT_MAGMA_SPLASH, urand(3*IN_MILLISECONDS, 4*IN_MILLISECONDS));
                            break;
                        case EVENT_PYROBLAST:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f))
                                DoCast(target, SPELL_PYROBLAST);
                            events.ScheduleEvent(EVENT_PYROBLAST, urand(6*IN_MILLISECONDS, 9*IN_MILLISECONDS));
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_molten_colossusAI(creature);
        }
};

class npc_runeforged_sentry : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_FLAMING_RUNE         = 1,
            EVENT_LAVA_BURST,
            EVENT_RUNED_FLAME_JETS
        };

        enum Spells
        {
            SPELL_FLAMING_RUNE      = 64852,
            SPELL_LAVA_BURST        = 64870,
            SPELL_RUNED_FLAME_JETS  = 64847
        };

    public:
        npc_runeforged_sentry () : CreatureScript("npc_runeforged_sentry") {}

        struct npc_runeforged_sentryAI: public ScriptedAI
        {
            npc_runeforged_sentryAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();

                events.ScheduleEvent(EVENT_FLAMING_RUNE, 6*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_LAVA_BURST, urand(9*IN_MILLISECONDS, 12*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_RUNED_FLAME_JETS, urand(10*IN_MILLISECONDS, 16*IN_MILLISECONDS));
            }

            void JustDied(Unit* /*killer*/)
            {
                if (InstanceScript* instance = me->GetInstanceScript())
                    if (instance->GetBossState(BOSS_LEVIATHAN) == DONE)
                        me->SetRespawnTime(WEEK); // Once the levi died, we will not spawn again
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_FLAMING_RUNE:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 1), SPELL_FLAMING_RUNE);
                            events.ScheduleEvent(EVENT_FLAMING_RUNE, 7*IN_MILLISECONDS);
                            break;
                        case EVENT_LAVA_BURST:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0), SPELL_LAVA_BURST);
                            events.ScheduleEvent(EVENT_LAVA_BURST, urand(8*IN_MILLISECONDS, 13*IN_MILLISECONDS));
                            break;
                        case EVENT_RUNED_FLAME_JETS:
                            DoCastVictim(SPELL_RUNED_FLAME_JETS);
                            events.ScheduleEvent(EVENT_RUNED_FLAME_JETS, urand(12*IN_MILLISECONDS, 18*IN_MILLISECONDS));
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_runeforged_sentryAI(creature);
        }
};

/************************************************************************/
/*                          Inner Sanctuary                             */
/************************************************************************/

enum
{
    NPC_STORM_TEMPERED_KEEPER_1 = 33699,
    NPC_STORM_TEMPERED_KEEPER_2 = 33722
};

enum
{
	ACTION_SET_KEEPER_1_AS_SUMMONER,
	ACTION_SET_KEEPER_2_AS_SUMMONER,

	ACTION_SUPERCHARGE_SELF,
	ACTION_SCHEDULE_SPHERE,
};

class npc_storm_tempered_keeper : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_FORKED_LIGHTNING          = 1,
            EVENT_SUMMONS_CHARGED_SPHERE
        };

        enum Spells
        {
			SPELL_FORKED_LIGHTNING		= 63541,
            SPELL_SEPARATION_ANXIETY    = 63539, 
            SPELL_SUMMON_CHARGED_SPHERE = 63527,    // Summons 33715, script below
			SPELL_VENGEFUL_SURGE		= 63630,
			SPELL_SUPERCHARGED = 63528
        };


        enum Misc
        {
            ACTION_VENGEFUL_SURGE   = 1,							
        };

    public:
        npc_storm_tempered_keeper () : CreatureScript("npc_storm_tempered_keeper") {}

        struct npc_storm_tempered_keeperAI: public ScriptedAI
        {
            npc_storm_tempered_keeperAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
				events.Reset();
				uint32 brotherId = 0;

				switch (me->GetEntry())
				{
					case NPC_STORM_TEMPERED_KEEPER_1:
						brotherId = NPC_STORM_TEMPERED_KEEPER_2;
						events.ScheduleEvent(EVENT_SUMMONS_CHARGED_SPHERE, 10*IN_MILLISECONDS);
					break;
					case NPC_STORM_TEMPERED_KEEPER_2:
						brotherId = NPC_STORM_TEMPERED_KEEPER_1;
					break;
				}           
				
				if (brotherId)
				if (brother = me->FindNearestCreature(brotherId, 50.0f)){}
				else
				{
					if (brother = me->FindNearestCreature(brotherId, 50.0f, false))
						brother->Respawn();
				}			
					
                events.ScheduleEvent(EVENT_FORKED_LIGHTNING, 6*IN_MILLISECONDS);
                
            }

			void JustSummoned(Creature* summon) override
			{
				if (summon->GetEntry() == 33715) // Charged Sphere.
				{
					switch (me->GetEntry())
					{
						case NPC_STORM_TEMPERED_KEEPER_1:
							summon->AI()->DoAction(ACTION_SET_KEEPER_1_AS_SUMMONER);
							break;
						case NPC_STORM_TEMPERED_KEEPER_2:
							summon->AI()->DoAction(ACTION_SET_KEEPER_2_AS_SUMMONER);
							break;
						default:
							break;
					}
				}
			}

            void DoAction(int32 action)
            {
                switch (action)
                {
                    case ACTION_VENGEFUL_SURGE:
						me->CastStop();
						me->StopMoving();
                        DoCast(me, SPELL_VENGEFUL_SURGE);
                        break;
					case ACTION_SUPERCHARGE_SELF:
						events.DelayEvents(1500);
						me->CastStop();
						me->StopMoving();
						DoCast(me, SPELL_SUPERCHARGED);						
						break;
					case ACTION_SCHEDULE_SPHERE:						
						events.RescheduleEvent(EVENT_SUMMONS_CHARGED_SPHERE, 18 * IN_MILLISECONDS); // This will stabilize the sphere summoning and generate a ping-pong effect. Full retail like.
						break;
                    default:
                        break;
                }
            }

			void DamageTaken(Unit* who, uint32 &damage) override
			{
				if (damage >= me->GetHealth())
				if (brother)
					brother->AI()->DoAction(ACTION_VENGEFUL_SURGE);									
			}

			void EnterCombat(Unit* who) override
			{
				me->CallForHelp(30.0f);
				DoZoneInCombat();
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

				if (me->HasUnitState(UNIT_STATE_CASTING))
					return;

				if (!me->HasAura(SPELL_SEPARATION_ANXIETY))
				if (brother)
				if (!brother->HasAura(SPELL_SEPARATION_ANXIETY))
				if (me->GetDistance2d(brother) >= 50.0f)
				{
					brother->AI()->DoCast(brother, SPELL_SEPARATION_ANXIETY);
					DoCast(me, SPELL_SEPARATION_ANXIETY);
					DoAction(ACTION_SCHEDULE_SPHERE);
				}
				

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_FORKED_LIGHTNING:
                            DoCast(SPELL_FORKED_LIGHTNING);
                            events.ScheduleEvent(EVENT_FORKED_LIGHTNING, urand(6000, 8000));
                            break;
                        case EVENT_SUMMONS_CHARGED_SPHERE:
                            DoCast(SPELL_SUMMON_CHARGED_SPHERE); 
							/*if (brother)
								brother->AI()->DoAction(ACTION_SCHEDULE_SPHERE);*/
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
				Creature* brother;
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_storm_tempered_keeperAI(creature);
        }
};

class npc_charged_sphere : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_START_DEST_CHASE = 1,            
        };

        enum Spells
        {
            SPELL_SUPERCHARGED = 63528
        };

    public:
        npc_charged_sphere () : CreatureScript("npc_charged_sphere") {}

        struct npc_charged_sphereAI: public ScriptedAI
        {
            npc_charged_sphereAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
				me->AddAura(63537, me);
                events.Reset();
				me->SetReactState(REACT_PASSIVE);                
                events.ScheduleEvent(EVENT_START_DEST_CHASE, 100);
				reached = false;
            }

			void DoAction(int32 action) override
			{
				switch (action)
				{
					case ACTION_SET_KEEPER_1_AS_SUMMONER:
						if (destiny = me->FindNearestCreature(NPC_STORM_TEMPERED_KEEPER_2, 50.0f))
							destiny->AI()->DoAction(ACTION_SCHEDULE_SPHERE);
						
						break;
					case ACTION_SET_KEEPER_2_AS_SUMMONER:
						if (destiny = me->FindNearestCreature(NPC_STORM_TEMPERED_KEEPER_1, 50.0f))
							destiny->AI()->DoAction(ACTION_SCHEDULE_SPHERE);
						break;
				}
			}

			void JustDied(Unit* /*Killer*/) override
			{
				me->DespawnOrUnsummon();
			}

            void UpdateAI(uint32 diff)
            {

                events.Update(diff);

				if (destiny)
				if (!reached)
				if (me->GetDistance2d(destiny) < 4.0f)
				{
					destiny->AI()->DoAction(ACTION_SUPERCHARGE_SELF);
					me->DespawnOrUnsummon(1000);
					reached = true;
				}
					

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_START_DEST_CHASE:
							if (destiny)
								me->GetMotionMaster()->MovePoint(0, destiny->GetPositionX(), destiny->GetPositionY(), destiny->GetPositionZ());
							else
								me->DespawnOrUnsummon(1000);

                            events.ScheduleEvent(EVENT_START_DEST_CHASE, 3*IN_MILLISECONDS);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
				bool reached;
				Creature* destiny;
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_charged_sphereAI(creature);
        }
};

/************************************************************************/
/*                      Inner Sanctuary - Freya                         */
/************************************************************************/

class npc_corrupted_servitor : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_VIOLENT_EARTH     = 1,
            EVENT_PETRIFY_JOINTS
        };

        enum Spells
        {
            SPELL_VIOLENT_EARTH     = 63149,
            SPELL_PETRIFY_JOINTS_10 = 63169,
            SPELL_PETRIFY_JOINTS_25 = 63549
        };

    public:
        npc_corrupted_servitor () : CreatureScript("npc_corrupted_servitor") {}

        struct npc_corrupted_servitorAI: public ScriptedAI
        {
            npc_corrupted_servitorAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {				
                events.Reset();
                events.ScheduleEvent(EVENT_VIOLENT_EARTH, urand(6*IN_MILLISECONDS, 9*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_PETRIFY_JOINTS, 5*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_VIOLENT_EARTH:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM), SPELL_VIOLENT_EARTH);
                            events.ScheduleEvent(EVENT_VIOLENT_EARTH, urand(6*IN_MILLISECONDS, 9*IN_MILLISECONDS));
                            break;
                        case EVENT_PETRIFY_JOINTS:                            
                            DoCast( SelectTarget(SELECT_TARGET_RANDOM, 0, AuraAppliedCheck<false>(RAID_MODE(SPELL_PETRIFY_JOINTS_10, SPELL_PETRIFY_JOINTS_25))), RAID_MODE(SPELL_PETRIFY_JOINTS_10, SPELL_PETRIFY_JOINTS_25) );
                            events.ScheduleEvent(EVENT_PETRIFY_JOINTS, 5*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_corrupted_servitorAI(creature);
        }
};

class npc_misguided_nymph : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_BIND_LIFE         = 1,
            EVENT_FROST_SPEAR,
            EVENT_WINTERS_EMBRACE
        };

        enum Spells
        {
            SPELL_BIND_LIFE          = 63082,
            SPELL_FROST_SPEAR        = 63111,
            SPELL_WINTERS_EMBRACE_10 = 63136,
            SPELL_WINTERS_EMBRACE_25 = 63564
        };

    public:
        npc_misguided_nymph () : CreatureScript("npc_misguided_nymph") {}

        struct npc_misguided_nymphAI: public ScriptedAI
        {
            npc_misguided_nymphAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_BIND_LIFE, 6*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_FROST_SPEAR, 8*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_WINTERS_EMBRACE, 1*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_BIND_LIFE:
                            if (me->GetHealthPct() < 80.0f)
                                DoCast(me, SPELL_BIND_LIFE);
                            events.ScheduleEvent(EVENT_BIND_LIFE, 6*IN_MILLISECONDS);
                            break;
                        case EVENT_FROST_SPEAR:
                            DoCastVictim(SPELL_FROST_SPEAR, true);
                            events.ScheduleEvent(EVENT_FROST_SPEAR, 8*IN_MILLISECONDS);
                            break;
                        case EVENT_WINTERS_EMBRACE:
                            if (!me->HasAura(RAID_MODE(SPELL_WINTERS_EMBRACE_10, SPELL_WINTERS_EMBRACE_25)))
                                DoCast(me, RAID_MODE(SPELL_WINTERS_EMBRACE_10, SPELL_WINTERS_EMBRACE_25));
                            events.ScheduleEvent(EVENT_WINTERS_EMBRACE, 30*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_misguided_nymphAI(creature);
        }
};

class npc_guardian_lasher : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_GUARDIANS_LASH = 1
        };

        enum Spells
        {
            SPELL_GUARDIANS_LASH_10     = 63047,
            SPELL_GUARDIANS_LASH_25     = 63550,
            SPELL_GUARDIAN_PHEROMONES   = 63007 
        };

    public:
        npc_guardian_lasher () : CreatureScript("npc_guardian_lasher") {}

        struct npc_guardian_lasherAI: public ScriptedAI
        {
            npc_guardian_lasherAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            { 
                //DoCast(SPELL_GUARDIAN_PHEROMONES);
                events.Reset();
                events.ScheduleEvent(EVENT_GUARDIANS_LASH, 2*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                /*

				if (!me->HasAura(SPELL_GUARDIAN_PHEROMONES))
                    DoCast(SPELL_GUARDIAN_PHEROMONES);

				*/

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_GUARDIANS_LASH:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 5.0f), RAID_MODE(SPELL_GUARDIANS_LASH_10, SPELL_GUARDIANS_LASH_25));
                            events.ScheduleEvent(EVENT_GUARDIANS_LASH, 6*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_guardian_lasherAI(creature);
        }
};

class npc_forest_swarmer : public CreatureScript
{
    private:
        enum MyEvents
        {   
            EVENT_POLLINATE = 1
        };

        enum Spells
        {
            SPELL_POLLINATE = 63059 // TODO: Maybe this spell requires a script for target selection, the below is possibly not was is intended.
        };

    public:
        npc_forest_swarmer () : CreatureScript("npc_forest_swarmer") {}

        struct npc_forest_swarmerAI: public ScriptedAI
        {
            npc_forest_swarmerAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_POLLINATE, 5*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_POLLINATE:
                            DoCast(SPELL_POLLINATE);    // Targeting is done by spell-script
                            events.ScheduleEvent(EVENT_POLLINATE, 30*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_forest_swarmerAI(creature);
        }
};

class npc_mangrove_ent : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_HURRICANE = 1,
            EVENT_NOURISH,
            EVENT_TRANQUILITY
        };

        enum Spells
        {
            SPELL_HURRICANE      = 63272,
            SPELL_NOURISH        = 63242,
            SPELL_TRANQUILITY    = 63241,
        };

    public:
        npc_mangrove_ent () : CreatureScript("npc_mangrove_ent") {}

        struct npc_mangrove_entAI: public ScriptedAI
        {
            npc_mangrove_entAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_HURRICANE, 3*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_NOURISH, 1*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_TRANQUILITY, 5*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))   // Hurricane and Tranquility are channeled, so...
                    return;

                while (uint32 event = events.ExecuteEvent())
                {                    
                    switch (event)
                    {
                        case EVENT_HURRICANE:
                            DoCast( SelectTarget(SELECT_TARGET_RANDOM), SPELL_HURRICANE );
                            events.ScheduleEvent(EVENT_HURRICANE, 10*IN_MILLISECONDS);
                            break;
                        case EVENT_NOURISH:
                        {
                            std::list<Unit*> allies;
                            Trinity::AnyFriendlyUnitInObjectRangeCheck checker(me, me, 40.0f);
                            Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(me, allies, checker);
                            me->VisitNearbyObject(40.0f, searcher);
                            allies.push_back(me->ToUnit());                // Add me to list
                            allies.sort(Trinity::HealthPctOrderPred());     // Sort ascending to current hp-percentage - the target with the lowest hp should be healed
                            DoCast((*allies.begin()), SPELL_NOURISH);
                            events.ScheduleEvent(EVENT_NOURISH, 1500);      // Cast takes 1500ms
                        }
                        break;
                        case EVENT_TRANQUILITY:
                            events.DelayEvents(10*IN_MILLISECONDS);
                            DoCast(SPELL_TRANQUILITY);
                            events.ScheduleEvent(EVENT_TRANQUILITY, 30*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_mangrove_entAI(creature);
        }
};

class npc_ironroot_lasher : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_IRONROOT_THORNS = 1
        };

        enum Spells
        {
            SPELL_IRONROOT_THORNS   = 63240
        };

    public:
        npc_ironroot_lasher () : CreatureScript("npc_ironroot_lasher") {}

        struct npc_ironroot_lasherAI: public ScriptedAI
        {
            npc_ironroot_lasherAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_IRONROOT_THORNS, 2*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_IRONROOT_THORNS:
                        {
                            std::list<Unit*> allies;
                            Trinity::AnyFriendlyUnitInObjectRangeCheck checker(me, me, 40.0f);
                            Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(me, allies, checker);
                            me->VisitNearbyObject(40.0f, searcher);
                            allies.push_back(me->ToUnit());
                            DoCast(Trinity::Containers::SelectRandomContainerElement(allies), SPELL_IRONROOT_THORNS);
                            events.ScheduleEvent(EVENT_IRONROOT_THORNS, 2*IN_MILLISECONDS);
                            break;
                        }
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ironroot_lasherAI(creature);
        }
};

class npc_natures_blade : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_LIVING_TSUNAMI = 1
        };

        enum Spells
        {
            SPELL_LIVING_TSUNAMI_10 = 63247,
            SPELL_LIVING_TSUNAMI_25 = 63568
        };

    public:
        npc_natures_blade () : CreatureScript("npc_natures_blade") {}

        struct npc_natures_bladeAI: public ScriptedAI
        {
            npc_natures_bladeAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_LIVING_TSUNAMI, 3*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_LIVING_TSUNAMI:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, AuraAppliedCheck<false>(RAID_MODE(SPELL_LIVING_TSUNAMI_10, SPELL_LIVING_TSUNAMI_25))))
                            {
                                me->SetFacingToObject(target);  // Note: Spell is casted into current orientation
                                DoCast( RAID_MODE(SPELL_LIVING_TSUNAMI_10, SPELL_LIVING_TSUNAMI_25) );
                            }
                            events.ScheduleEvent(EVENT_LIVING_TSUNAMI, 3*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_natures_bladeAI(creature);
        }
};

class npc_guardian_of_life : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_POISON_BREATH = 1
        };

        enum Spells
        {
            SPELL_POISON_BREATH_10 = 63226,
            SPELL_POISON_BREATH_25 = 63551
        };

    public:
        npc_guardian_of_life () : CreatureScript("npc_guardian_of_life") {}

        struct npc_guardian_of_lifeAI: public ScriptedAI
        {
            npc_guardian_of_lifeAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_POISON_BREATH, 3*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_POISON_BREATH:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, AuraAppliedCheck<false>(RAID_MODE(SPELL_POISON_BREATH_10, SPELL_POISON_BREATH_25))))
                            {
                                me->SetFacingToObject(target);  // Note: Spell is casted into current orientation
                                DoCast( RAID_MODE(SPELL_POISON_BREATH_10, SPELL_POISON_BREATH_25) );
                            }
                            events.ScheduleEvent(EVENT_POISON_BREATH, 5*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_guardian_of_lifeAI(creature);
        }
};

/************************************************************************/
/*                      Inner Sanctuary - Vezax                         */
/************************************************************************/




class npc_void_beast : public CreatureScript
{
public:
	npc_void_beast() : CreatureScript("npc_void_beast") { }

	struct npc_void_beastAI : public ScriptedAI
	{
		npc_void_beastAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 NovaTimer;

		void Reset() override
		{
			NovaTimer = urand(1000, 3000);			
		}

		void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (NovaTimer <= Diff)
			{
				DoCastVictim(63723);
				NovaTimer = urand(6000, 8000);
			}
			else
				NovaTimer -= Diff;


			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_void_beastAI(creature);
	}
};

class npc_clockwork_sapper : public CreatureScript
{
public:
	npc_clockwork_sapper() : CreatureScript("npc_clockwork_sapper") { }

	struct npc_clockwork_sapperAI : public ScriptedAI
	{
		npc_clockwork_sapperAI(Creature* creature) : ScriptedAI(creature){ }

		uint32 EnergySap;

		void Reset() override
		{
			EnergySap = urand(1000, 3000);
		}

		void UpdateAI(uint32 Diff) override
		{
			if (!UpdateVictim())
			return;

			if (EnergySap <= Diff)
			{
				if (Unit* target =  SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f))
				{
					DoCast(target, 64740);
					EnergySap = urand(2000, 4000);
				}				
			}
			else
				EnergySap -= Diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_clockwork_sapperAI(creature);
	}
};

class npc_faceless_horror : public CreatureScript
{
    private:
        enum MyEvents
        {   
            EVENT_DEATH_GRIP = 1,
            EVENT_SHADOW_CRASH,
            EVENT_VOID_BARRIER_BEGIN,
            EVENT_VOID_BARRIER_END,
            EVENT_VOID_WAVE,
			EVENT_SUMMON_VOID
        };

        enum Spells
        {
            SPELL_DEATH_GRIP_FH = 64429,
            SPELL_SHADOW_CRASH  = 63722,
            SPELL_VOID_BARRIER  = 63710,
            SPELL_VOID_WAVE     = 63703
        };

    public:
        npc_faceless_horror () : CreatureScript("npc_faceless_horror") {}

        struct npc_faceless_horrorAI: public ScriptedAI
        {
            npc_faceless_horrorAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_DEATH_GRIP, urand(8*IN_MILLISECONDS, 10*IN_MILLISECONDS));
				events.ScheduleEvent(EVENT_SUMMON_VOID, 7000);
                events.ScheduleEvent(EVENT_SHADOW_CRASH, urand(6*IN_MILLISECONDS, 12*IN_MILLISECONDS));
            }

            void EnterCombat(Unit* /*who*/)
            {
                DoCast(me, SPELL_VOID_WAVE);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->GetHealthPct() < 30.0f && !events.GetNextEventTime(EVENT_VOID_BARRIER_BEGIN) && !events.GetNextEventTime(EVENT_VOID_BARRIER_END)) // If on low health and skills not yet scheduled...
                {
                    events.ScheduleEvent(EVENT_VOID_BARRIER_BEGIN, 0);
                }

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_DEATH_GRIP:
                            DoResetThreat();
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                            {
                                me->AddThreat(target, std::numeric_limits<float>::max());
                                DoCast(target, SPELL_DEATH_GRIP_FH, true);
                            }
                            events.ScheduleEvent(EVENT_DEATH_GRIP, urand(8*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                        case EVENT_SHADOW_CRASH:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, RangeCheck(me, 10.0f, 70.0f)))
                                DoCast(target, SPELL_SHADOW_CRASH);
                            events.ScheduleEvent(EVENT_SHADOW_CRASH, urand(6*IN_MILLISECONDS, 12*IN_MILLISECONDS));
                            break;
                        case EVENT_VOID_BARRIER_BEGIN:
                            DoCast(SPELL_VOID_BARRIER);							
                            events.ScheduleEvent(EVENT_VOID_BARRIER_END, 10*IN_MILLISECONDS);
                            break;
                        case EVENT_VOID_BARRIER_END:
                            me->RemoveAurasDueToSpell(SPELL_VOID_BARRIER);
                            events.ScheduleEvent(EVENT_VOID_BARRIER_BEGIN, 10*IN_MILLISECONDS);
                            break;
						case EVENT_SUMMON_VOID:
							DoCast(63708); // Summon Void Beast
							events.RescheduleEvent(EVENT_SUMMON_VOID, 50000);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_faceless_horrorAI(creature);
        }
};

class npc_twilight_adherent : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_ARCANE_BURST = 1,
            EVENT_BLINK,
            EVENT_GREATER_HEAL,
            EVENT_PSYCHIC_SCREAM,
            EVENT_RENEW
        };

        enum Spells
        {
            SPELL_ARCANE_BURST      = 64663,
            SPELL_BLINK             = 64662,
            SPELL_GREATER_HEAL      = 63760,
            SPELL_PSYCHIC_SCREAM    = 13704,
            SPELL_RENEW             = 37978
        };

    public:
        npc_twilight_adherent () : CreatureScript("npc_twilight_adherent") {}

        struct npc_twilight_adherentAI: public ScriptedAI
        {
            npc_twilight_adherentAI(Creature* creature) : ScriptedAI(creature) {}

            Unit* GetLowestHPAllyOrMe(float range)
            {
                std::list<Unit*> allies;
                Trinity::AnyFriendlyUnitInObjectRangeCheck checker(me, me, range);
                Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(me, allies, checker);
                me->VisitNearbyObject(range, searcher);
                allies.push_back(me->ToUnit());                // Add me to list
                allies.sort(Trinity::HealthPctOrderPred());    // Sort ascending to current hp-percentage - the target with the lowest hp should be healed
                return (*allies.begin());
            }

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_BLINK, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
				events.ScheduleEvent(EVENT_PSYCHIC_SCREAM, 9000);
                events.ScheduleEvent(EVENT_GREATER_HEAL, urand(5*IN_MILLISECONDS, 7*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_RENEW, urand(6*IN_MILLISECONDS, 12*IN_MILLISECONDS));
            }

			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(25.0f);
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;


                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_ARCANE_BURST:
                            DoCast(SPELL_ARCANE_BURST); // is paired with blink, so no need to reschedule this
                            break;
                        case EVENT_BLINK:
                            DoCast( SelectTarget(SELECT_TARGET_FARTHEST, 0, 150.0f), SPELL_BLINK );
                            events.ScheduleEvent(EVENT_BLINK, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                            events.ScheduleEvent(EVENT_ARCANE_BURST, 1*IN_MILLISECONDS);
                            break;
                        case EVENT_GREATER_HEAL:
                            if (Unit* ally = GetLowestHPAllyOrMe(40.0f))
                                DoCast(ally, SPELL_GREATER_HEAL);
                            events.ScheduleEvent(EVENT_GREATER_HEAL, urand(5*IN_MILLISECONDS, 7*IN_MILLISECONDS));
                            break;
                        case EVENT_PSYCHIC_SCREAM:
                            DoCast(SPELL_PSYCHIC_SCREAM);
							events.ScheduleEvent(EVENT_PSYCHIC_SCREAM, urand(13000, 17000));
                            break;
                        case EVENT_RENEW:
                            if (Unit* ally = GetLowestHPAllyOrMe(40.0f))
                                DoCast(ally, SPELL_RENEW);
                            events.ScheduleEvent(EVENT_RENEW, urand(6*IN_MILLISECONDS, 12*IN_MILLISECONDS));
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_adherentAI(creature);
        }
};

class npc_twilight_frost_mage : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_ARCANE_BURST = 1,
            EVENT_BLINK,
            EVENT_FROST_NOVA,
            EVENT_FROSTBOLT,
            EVENT_FROSTBOLT_VOLLEY
        };

        enum Spells
        {
            SPELL_ARCANE_BURST      = 64663,
            SPELL_BLINK             = 64662,
            SPELL_FROST_NOVA        = 63912,
            SPELL_FROSTBOLT         = 63913,
            SPELL_FROSTBOLT_VOLLEY  = 63758
        };

    public:
        npc_twilight_frost_mage () : CreatureScript("npc_twilight_frost_mage") {}

        struct npc_twilight_frost_mageAI: public ScriptedAI
        {
            npc_twilight_frost_mageAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_FROST_NOVA, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_FROSTBOLT, urand(3*IN_MILLISECONDS, 5*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
            }

			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(25.0f);
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        // Spell order: Frostnova -> Blink -> Arcane Burst
                        case EVENT_ARCANE_BURST:
                            DoCast(SPELL_ARCANE_BURST); // is paired with blink, so no need to reschedule this
                            break;
                        case EVENT_BLINK:							
                            DoCast( SelectTarget(SELECT_TARGET_FARTHEST, 0, 150.0f), SPELL_BLINK );
                            events.ScheduleEvent(EVENT_ARCANE_BURST, 1*IN_MILLISECONDS);
                            break;
                        case EVENT_FROST_NOVA:
							DoCast(SPELL_FROST_NOVA);
                            events.ScheduleEvent(EVENT_FROST_NOVA, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                            events.ScheduleEvent(EVENT_BLINK, 1*IN_MILLISECONDS);
                            break;
                        case EVENT_FROSTBOLT:
                            DoCast( SelectTarget(SELECT_TARGET_RANDOM), SPELL_FROSTBOLT );
                            events.ScheduleEvent(EVENT_FROSTBOLT, urand(3*IN_MILLISECONDS, 5*IN_MILLISECONDS));
                            break;
                        case EVENT_FROSTBOLT_VOLLEY:
                            DoCast(SPELL_FROSTBOLT_VOLLEY);
                            events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_frost_mageAI(creature);
        }
};

class npc_twilight_pyromancer : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_ARCANE_BURST = 1,
            EVENT_BLINK,
            EVENT_FIREBALL,
            EVENT_FLAME_STRIKE,
            EVENT_SUMMON_FIRE_ELE
        };

        enum Spells
        {
            SPELL_ARCANE_BURST      = 64663,
            SPELL_BLINK             = 64662,
            SPELL_FIREBALL          = 63789,
            SPELL_FLAME_STRIKE      = 63775,
            SPELL_SUMMON_FIRE_ELE   = 63774
        };

    public:
        npc_twilight_pyromancer () : CreatureScript("npc_twilight_pyromancer") {}

        struct npc_twilight_pyromancerAI: public ScriptedAI
        {
            npc_twilight_pyromancerAI(Creature* creature) : ScriptedAI(creature), summons(me) {}

            void Reset()
            {
                summons.DespawnAll();
                events.Reset();

                DoCast(SPELL_SUMMON_FIRE_ELE);

                events.ScheduleEvent(EVENT_BLINK, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_FIREBALL, urand(3*IN_MILLISECONDS, 5*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_FLAME_STRIKE, urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
            }

            void JustSummoned(Creature* summon)
            {
                summons.Summon(summon);
            }

            void SummonedCreatureDies(Creature* creature, Unit* /*killer*/)
            {
                summons.Despawn(creature);
                if (creature->GetEntry() == 33838) // Enslaved fire elemental
                    events.ScheduleEvent(EVENT_SUMMON_FIRE_ELE, 1*IN_MILLISECONDS);
            }

			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(25.0f);
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_ARCANE_BURST:
                            DoCast(SPELL_ARCANE_BURST); // is paired with blink, so no need to reschedule this
                            break;
                        case EVENT_BLINK:							
                            DoCast( SelectTarget(SELECT_TARGET_FARTHEST, 0, 150.0f), SPELL_BLINK );
                            events.ScheduleEvent(EVENT_BLINK, urand(8*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                            events.ScheduleEvent(EVENT_ARCANE_BURST, 1*IN_MILLISECONDS);
                            break;
                        case EVENT_SUMMON_FIRE_ELE:
                            DoCast(SPELL_SUMMON_FIRE_ELE);
                            break;
                        case EVENT_FIREBALL:
                            DoCast( SelectTarget(SELECT_TARGET_RANDOM), SPELL_FIREBALL );
                            events.ScheduleEvent(EVENT_FIREBALL, urand(3*IN_MILLISECONDS, 5*IN_MILLISECONDS));
                            break;
                        case EVENT_FLAME_STRIKE:
                            DoCast( SelectTarget(SELECT_TARGET_RANDOM, 0, 30.0f), SPELL_FLAME_STRIKE );
                            events.ScheduleEvent(EVENT_FLAME_STRIKE, urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap events;
                SummonList summons;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_pyromancerAI(creature);
        }
};

class npc_enslaved_fire_elemental : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_FIRE_SHIELD_CHECK = 1,
            EVENT_BLAST_WAVE
        };

        enum Spells
        {
            SPELL_FIRE_SHIELD   = 63778,
            SPELL_BLAST_WAVE    = 38064
        };

    public:
        npc_enslaved_fire_elemental () : CreatureScript("npc_enslaved_fire_elemental") {}

        struct npc_enslaved_fire_elementalAI: public ScriptedAI
        {
            npc_enslaved_fire_elementalAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                DoCast(me, SPELL_FIRE_SHIELD);
                events.Reset();
                events.ScheduleEvent(EVENT_FIRE_SHIELD_CHECK, 1*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_BLAST_WAVE, 6*IN_MILLISECONDS);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_FIRE_SHIELD_CHECK:
                            if (!me->HasAura(SPELL_FIRE_SHIELD))
                                DoCast(SPELL_FIRE_SHIELD);
                            events.ScheduleEvent(EVENT_FIRE_SHIELD_CHECK, 3*IN_MILLISECONDS);
                            break;
                        case EVENT_BLAST_WAVE:
                            DoCast(SPELL_BLAST_WAVE);
                            events.ScheduleEvent(EVENT_BLAST_WAVE, 6*IN_MILLISECONDS);
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_enslaved_fire_elementalAI(creature);
        }
};

class npc_twilight_guardian : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_CONCUSSION_BLOW = 1,
            EVENT_DEVASTATE,
            EVENT_SUNDER_ARMOR,
            EVENT_THUNDERCLAP
        };

        enum Spells
        {
            SPELL_CONCUSSION_BLOW   = 52719,
            SPELL_DEVASTATE         = 62317,
            SPELL_SUNDER_ARMOR      = 57807,
            SPELL_THUNDERCLAP       = 63757
        };

    public:
        npc_twilight_guardian () : CreatureScript("npc_twilight_guardian") {}

        struct npc_twilight_guardianAI: public ScriptedAI
        {
            npc_twilight_guardianAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_CONCUSSION_BLOW, urand(3*IN_MILLISECONDS, 6*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_DEVASTATE, urand(1.5*IN_MILLISECONDS, 2.5*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_THUNDERCLAP, urand (5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
            }

			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(25.0f);
			}

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_CONCUSSION_BLOW:							
                            DoCastVictim(SPELL_CONCUSSION_BLOW);
                            DoResetThreat();
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                            {
                                me->AddThreat(target, std::numeric_limits<float>::max());
                                AttackStart(target);
                            }
                            events.ScheduleEvent(EVENT_CONCUSSION_BLOW, urand(3*IN_MILLISECONDS, 6*IN_MILLISECONDS));
                            break;
                        case EVENT_DEVASTATE:
                            DoCastVictim(SPELL_DEVASTATE);
                            events.ScheduleEvent(EVENT_DEVASTATE, urand(1.5*IN_MILLISECONDS, 2.5*IN_MILLISECONDS));
                            break;
                        case EVENT_THUNDERCLAP:
                            DoCast(SPELL_THUNDERCLAP);
                            events.ScheduleEvent(EVENT_THUNDERCLAP, urand (5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_guardianAI(creature);
        }
};

// I hope that this one will really slay Twilight :)
class npc_twilight_slayer : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_BLADESTORM = 1,
            EVENT_MORTAL_STRIKE
        };

        enum Spells
        {
            SPELL_BLADESTORM = 63784,
            SPELL_MORTAL_STRIKE = 35054
        };

    public:
        npc_twilight_slayer () : CreatureScript("npc_twilight_slayer") {}

        struct npc_twilight_slayerAI: public ScriptedAI
        {
            npc_twilight_slayerAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {   
                events.Reset();
                events.ScheduleEvent(EVENT_BLADESTORM, urand(4*IN_MILLISECONDS, 8*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_MORTAL_STRIKE, urand(3*IN_MILLISECONDS, 6*IN_MILLISECONDS));
            }
			void EnterCombat(Unit* /*who*/)
			{
				me->CallForHelp(25.0f);
			}
            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))   // for bladestorm
                    return;

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_BLADESTORM:
                            DoCastVictim(SPELL_BLADESTORM, true);
                            events.DelayEvents(8*IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_BLADESTORM, urand(12*IN_MILLISECONDS, 16*IN_MILLISECONDS));
                            break;
                        case EVENT_MORTAL_STRIKE:							
                            DoCastVictim(SPELL_MORTAL_STRIKE);
                            events.ScheduleEvent(EVENT_MORTAL_STRIKE, urand(4*IN_MILLISECONDS, 6*IN_MILLISECONDS));
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_slayerAI(creature);
        }
};

class npc_twilight_shadowblade : public CreatureScript
{
    private:
        enum MyEvents
        {
            EVENT_SHADOWSTEP = 1,
            EVENT_BACKSTAB,
            EVENT_FAN_OF_KNIVES,
            EVENT_DEADLY_POSION
        };

        enum Spells
        {
            SPELL_STEALTH = 30831,
            SPELL_SHADOWSTEP = 36554,
            SPELL_BACKSTAB = 63754,
            SPELL_FAN_OF_KNIVES = 63753,
            SPELL_DEADLY_POSION = 63755
        };

    public:
        npc_twilight_shadowblade () : CreatureScript("npc_twilight_shadowblade") {}

        struct npc_twilight_shadowbladeAI: public ScriptedAI
        {
			npc_twilight_shadowbladeAI(Creature* creature) : ScriptedAI(creature) 
			{
				me->setPowerType(POWER_ENERGY);
			}

            void Reset()
			{
                events.Reset();
				me->SetReactState(REACT_AGGRESSIVE);
                events.ScheduleEvent(EVENT_DEADLY_POSION, urand(12*IN_MILLISECONDS, 15*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_FAN_OF_KNIVES, urand(6*IN_MILLISECONDS, 10*IN_MILLISECONDS));
				events.ScheduleEvent(EVENT_SHADOWSTEP, 5*IN_MILLISECONDS);
            }

            void MoveInLineOfSight(Unit* target)
            {
                /*if (Player* player = target->ToPlayer())
                    if (me->IsWithinDist(player, 25.0f))
                        */
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 event = events.ExecuteEvent())
                {
                    switch (event)
                    {
                        case EVENT_DEADLY_POSION:							
                            DoCastVictim(SPELL_DEADLY_POSION);
                            events.ScheduleEvent(EVENT_DEADLY_POSION, urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                        case EVENT_FAN_OF_KNIVES:
                            DoCastAOE(SPELL_FAN_OF_KNIVES);
                            events.ScheduleEvent(EVENT_FAN_OF_KNIVES, urand(6*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                        case EVENT_SHADOWSTEP:

							me->getThreatManager().resetAllAggro();
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM,0,25.0f,true))
                            {				
								me->getThreatManager().addThreat(target, 10000);
								DoCast(target,SPELL_SHADOWSTEP);
                                AttackStart(target);
                                events.ScheduleEvent(EVENT_BACKSTAB, 0.3*IN_MILLISECONDS);
                            }
                            events.ScheduleEvent(EVENT_SHADOWSTEP, urand(7*IN_MILLISECONDS, 12*IN_MILLISECONDS));
                            break;
                        case EVENT_BACKSTAB:
                            DoCastVictim(SPELL_BACKSTAB);							
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

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_twilight_shadowbladeAI(creature);
        }
};

class npc_boomer_xp : public CreatureScript
{
    enum MySpells
    {
        SPELL_BOOM_BOT               = 63767,
        SPELL_BOOM_BOT_PERIODIC      = 63801
    };

    public:
        npc_boomer_xp() : CreatureScript("npc_boomer_xp") {}

        struct npc_boomer_xpAI : public ScriptedAI
        {
            npc_boomer_xpAI(Creature* creature) : ScriptedAI(creature) {}

            void InitializeAI()
            {
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);   
                me->setActive(true);
                Reset();
            }

            Unit* SelectPlayerTargetInRange(float range)
            {
                Player* target = 0;
                Trinity::AnyPlayerInObjectRangeCheck u_check(me, range, true);
                Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, target, u_check);
                me->VisitNearbyObject(range, searcher);
                return target;
            }

            void Reset()
            {
                despawn = false;
				me->SetReactState(REACT_AGGRESSIVE);                
            }

            void EnterCombat(Unit* /*who*/)
            {
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();
                if (Unit* target = SelectPlayerTargetInRange(10.0f))
                {
                    me->AddThreat(target, std::numeric_limits<float>::max());
                    me->GetMotionMaster()->MoveFollow(target, 5.0f, 0.0f);					
                }
            }

            void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
            {
                if (spell->Id == SPELL_BOOM_BOT_PERIODIC)
                    me->DespawnOrUnsummon(1*IN_MILLISECONDS);
            }

            void JustDied(Unit* /*killer*/)
            {
                DoCast(me, SPELL_BOOM_BOT, true);
            }

            void UpdateAI(uint32 /*diff*/)
            {
                if (Player* player = me->SelectNearestPlayer(7.0f))
                    AttackStart(player);

                if (!UpdateVictim())
                    return;

                if (!despawn && me->IsWithinMeleeRange(me->GetVictim()))
                {
                    despawn = true;
                    me->CastSpell(me, SPELL_BOOM_BOT_PERIODIC, true);
                    me->StopMoving();
                }
                // suicide has procflag PROC_FLAG_DONE_MELEE_AUTO_ATTACK, they have to melee, even tho the spell is delayed if the npc misses
                DoMeleeAttackIfReady();
            }

            private:
                bool despawn;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_boomer_xpAI(creature);
        }
};

class npc_superheated_winds : public CreatureScript
{
    enum MySpells
    {//63811
        SPELL_SUPERHEATED_WINDS      = 64737
    };

	enum MyEvents
	{
		EVENT_WIN_SMASH		= 1,
		EVENT_CHANGE_TARGET = 2
	};

    public:
        npc_superheated_winds() : CreatureScript("npc_superheated_winds") {}
		/*
		
		-- INSERT INTO creature_template_addon(entry, auras) VALUES(34194, 64724);
		-- UPDATE `creature_template` SET `ScriptName`="npc_superheated_winds" WHERE `entry`=34194;
		*/
        struct npc_superheated_windsAI : public ScriptedAI
        {
            npc_superheated_windsAI(Creature* creature) : ScriptedAI(creature) {}

            void InitializeAI()
            { //Insert Immunity to interrupt
                /*me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                Reset();*/
				me->GetMotionMaster()->MoveRandom(30.0f);
            }

            void Reset()
            {

            }

            void EnterCombat(Unit* /*who*/)
            {

            }

            void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
            {
                
            }

            void JustDied(Unit* /*killer*/)
            {
            }

            void UpdateAI(uint32 /*diff*/)
            {
                if (!UpdateVictim())
                    return;

                DoMeleeAttackIfReady();
            }
			EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_superheated_windsAI(creature);
        }
};


/*class npc_mechagnome_battletank : public CreatureScript
{
	enum MySpells
	{//63811
		SPELL_JUMP_ATTACK = 64953,
		SPELL_FLAME_CANNON = , //Search different Spell.
	};

	enum MyEvents
	{
		EVENT_JUMP_ATTACK = 1,
		EVENT_FLAME_CANNON = 2,
	};

public:
	npc_mechagnome_battletank() : CreatureScript("npc_mechagnome_battletank") {}

	struct npc_mechagnome_battletankAI : public ScriptedAI
	{
		npc_mechagnome_battletankAI(Creature* creature) : ScriptedAI(creature) {}

		void EnterCombat(Unit* /*who*///)
/*
		{
             			
			events.ScheduleEvent(EVENT_JUMP_ATTACK, 1000);
			events.ScheduleEvent(EVENT_FLAME_CANNON, 3000);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;
			
			events.Update(diff);

			while(uint32 event = events.ExecuteEvent())
			{
				switch(event)
				{
					case EVENT_JUMP_ATTACK:
						me->CastStop();
						me->AttackStop();
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
							DoCast(target, SPELL_JUMP_ATTACK);

						events.ScheduleEvent(EVENT_JUMP_ATTACK, 10*IN_MILLISECONDS);
						break;
					case EVENT_FLAME_CANNON:			
						DoCast( SPELL_FLAME_CANNON);
						events.ScheduleEvent(EVENT_FLAME_CANNON, 4*IN_MILLISECONDS);
						break;
					default:
					break;
				}
			}
						

			//DoMeleeAttackIfReady();
		}
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mechagnome_battletankAI(creature);
	}
};*/


/************************************************************************/
/*                          Spells                                      */
/************************************************************************/

class spell_pollinate : public SpellScriptLoader
{
    public:
        spell_pollinate() : SpellScriptLoader("spell_pollinate") {}

        class spell_pollinate_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_pollinate_SpellScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(63059))
                    return false;
                return true;
            }

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                for (std::list<WorldObject*>::iterator it = targets.begin(); it != targets.end(); ++it)
                {
                    if (Creature* creature = (*it)->ToCreature())
                        if (creature->GetEntry() != NPC_GUARDIAN_LASHER)
                            it = targets.erase(it);
                    it = targets.erase(it);
                }
            }

            void Register()
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_pollinate_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_pollinate_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_NEARBY_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_pollinate_SpellScript::FilterTargets, EFFECT_2, TARGET_UNIT_NEARBY_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_pollinate_SpellScript();
        }
};

class npc_displacement_device : public CreatureScript
{

private:
	enum MyEvents
	{
		EVENT_START_CHASING = 1,
	};

#define MAX_Z 432.0f

public:
	npc_displacement_device() : CreatureScript("npc_displacement_device") {}

	struct npc_displacement_deviceAI : public ScriptedAI
	{
		npc_displacement_deviceAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{			
			me->SetReactState(REACT_PASSIVE);
			
			DoCast(me, RAID_MODE(64793, 64941));
			events.ScheduleEvent(EVENT_START_CHASING, 1*IN_MILLISECONDS);			
		}

		void UpdateAI(uint32 diff)
		{

			events.Update(diff);

			while (uint32 event = events.ExecuteEvent())
			{
				switch (event)
				{
				case EVENT_START_CHASING:								
					if (Creature* summoner = me->FindNearestCreature(34197, 30.0f))
					if (Unit* target = summoner->AI()->SelectTarget(SELECT_TARGET_RANDOM, 0, 60.0f, true))
						me->GetMotionMaster()->MovePoint(0, target->GetPositionX(), target->GetPositionY(), MAX_Z);

					events.ScheduleEvent(EVENT_START_CHASING, 5 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}


			//DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
		bool helpAsked;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_displacement_deviceAI(creature);
	}
};


void AddSC_ulduar_trash()
{
    // GA
    new npc_steelforged_defender();
    new npc_ironwork_cannon();
    new npc_molten_colossus();
    new npc_runeforged_sentry();

    // IS
    new npc_storm_tempered_keeper();
    new npc_charged_sphere();

	new npc_displacement_device();
    // IS - Vezax
    new npc_faceless_horror();
    new npc_twilight_adherent();
    new npc_twilight_frost_mage();
    new npc_twilight_pyromancer();
    new npc_enslaved_fire_elemental();
    new npc_twilight_guardian();
    new npc_twilight_slayer();
    new npc_twilight_shadowblade();

    // IS - Freya
    new npc_corrupted_servitor();
    new npc_misguided_nymph();
    new npc_guardian_lasher();
    new npc_forest_swarmer();
    new npc_mangrove_ent();
    new npc_ironroot_lasher();
    new npc_natures_blade();
    new npc_guardian_of_life();
	//new npc_mechagnome_battletank();
		
	new npc_clockwork_sapper();
	new npc_superheated_winds();
    // IS - Mimiron
    new npc_boomer_xp();
	new npc_void_beast();
    new spell_pollinate();
}
