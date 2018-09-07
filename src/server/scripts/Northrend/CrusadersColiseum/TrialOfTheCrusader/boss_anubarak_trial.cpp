/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

// Known bugs:
// Anubarak - underground phase partially not worked
//          - tele after impale hit a permafrost doesn't work (the entire tele spell should be better)
// Scarab   - Kill credit isn't crediting?

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "trial_of_the_crusader.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include <limits>

enum Yells
{
    SAY_INTRO               = 0,
    SAY_AGGRO               = 1,
    EMOTE_SUBMERGE          = 2,
    EMOTE_BURROWER          = 3,
    SAY_EMERGE              = 4,
    SAY_LEECHING_SWARM      = 5,
    EMOTE_LEECHING_SWARM    = 6,
    SAY_KILL_PLAYER         = 7,
    SAY_DEATH               = 8,

    EMOTE_SPIKE             = 0
};

enum Summons
{
    NPC_FROST_SPHERE     = 34606,
    NPC_BURROW           = 34862,
    NPC_BURROWER         = 34607,
    NPC_SCARAB           = 34605,
    NPC_SPIKE            = 34660
};

enum BossSpells
{
    SPELL_FREEZE_SLASH          = 66012,
    SPELL_PENETRATING_COLD      = 66013,
    SPELL_LEECHING_SWARM        = 66118,
    SPELL_LEECHING_SWARM_HEAL   = 66125,
    SPELL_LEECHING_SWARM_DMG    = 66240,
    SPELL_MARK                  = 67574,
    SPELL_SPIKE_CALL            = 66169,
    SPELL_SUBMERGE_ANUBARAK     = 65981,
    SPELL_CLEAR_ALL_DEBUFFS     = 34098,
    SPELL_EMERGE_ANUBARAK       = 65982,
    SPELL_SUMMON_BEATLES        = 66339,
    SPELL_SUMMON_BURROWER       = 66332,

    // Burrow
    SPELL_CHURNING_GROUND       = 66969,

    // Scarab
    SPELL_DETERMINATION         = 66092,
    SPELL_ACID_MANDIBLE         = 65774, //Passive - Triggered

    // Burrower
    SPELL_SPIDER_FRENZY         = 66128,
    SPELL_EXPOSE_WEAKNESS       = 67720, //Passive - Triggered
    SPELL_SHADOW_STRIKE         = 66134,
    SPELL_SUBMERGE_EFFECT       = 68394,
    SPELL_AWAKENED              = 66311,
    SPELL_EMERGE_EFFECT         = 65982,
	SPELL_SUBMERGE				= 67322,

    SPELL_PERSISTENT_DIRT       = 68048,

    SUMMON_SCARAB               = NPC_SCARAB,
    SUMMON_FROSTSPHERE          = NPC_FROST_SPHERE,
    SPELL_BERSERK               = 26662,

    //Frost Sphere
    SPELL_FROST_SPHERE          = 67539,
    SPELL_PERMAFROST            = 66193,
    SPELL_PERMAFROST_VISUAL     = 65882,
    SPELL_PERMAFROST_MODEL      = 66185,

    //Spike
    SPELL_SUMMON_SPIKE          = 66169,
    SPELL_SPIKE_SPEED1          = 65920,
    SPELL_SPIKE_TRAIL           = 65921,
    SPELL_SPIKE_SPEED2          = 65922,
    SPELL_SPIKE_SPEED3          = 65923,
    SPELL_SPIKE_FAIL            = 66181,
    SPELL_SPIKE_TELE            = 66170
};

#define SPELL_PERMAFROST_HELPER RAID_MODE<uint32>(66193, 67855, 67856, 67857)

enum SummonActions
{
    ACTION_SHADOW_STRIKE    = 0,
    ACTION_SCARAB_SUBMERGE  = 1
};

const Position SphereSpawn[6] =
{
    {779.8038f, 150.6580f, 158.1426f, 0},
    {736.0243f, 113.4201f, 158.0226f, 0},
    {712.5712f, 160.9948f, 158.4368f, 0},
    {701.4271f, 126.4740f, 158.0205f, 0},
    {747.9202f, 155.0920f, 158.0613f, 0},
    {769.6285f, 121.1024f, 158.0504f, 0},
};

enum MovementPoints
{
    POINT_FALL_GROUND           = 1
};

enum PursuingSpikesPhases
{
    PHASE_NO_MOVEMENT       = 0,
    PHASE_IMPALE_NORMAL     = 1,
    PHASE_IMPALE_MIDDLE     = 2,
    PHASE_IMPALE_FAST       = 3
};

enum Events
{
    // Anub'arak
    EVENT_FREEZE_SLASH              = 1,
    EVENT_PENETRATING_COLD          = 2,
    EVENT_SUMMON_NERUBIAN           = 3,
    EVENT_NERUBIAN_SHADOW_STRIKE    = 4,
    EVENT_SUBMERGE                  = 5,
    EVENT_EMERGE                    = 6,
    EVENT_PURSUING_SPIKE            = 7,
    EVENT_SUMMON_SCARAB             = 8,
    EVENT_SUMMON_FROST_SPHERE       = 9,
    EVENT_BERSERK                   = 10,

	EVENT_MOVE						= 11,
	EVENT_SPHERE_EXPLODE			= 12
};

enum Phases
{
    // Anub'arak
    PHASE_MELEE                 = 1,
    PHASE_SUBMERGED             = 2
};

class boss_anubarak_trial : public CreatureScript
{
    public:
        boss_anubarak_trial() : CreatureScript("boss_anubarak_trial") { }

        struct boss_anubarak_trialAI : public BossAI
        {
            boss_anubarak_trialAI(Creature* creature) : BossAI(creature, BOSS_ANUBARAK)
            {
                Initialize();
            }

            void Initialize()
            {
                _intro = true;
                _reachedPhase3 = false;
            }

            void Reset() override
            {
                _Reset();
                events.SetPhase(PHASE_MELEE);
                events.ScheduleEvent(EVENT_FREEZE_SLASH, 15*IN_MILLISECONDS, 0, PHASE_MELEE);
                events.ScheduleEvent(EVENT_PENETRATING_COLD, 20*IN_MILLISECONDS, PHASE_MELEE);
                events.ScheduleEvent(EVENT_SUMMON_NERUBIAN, 10*IN_MILLISECONDS, 0, PHASE_MELEE);
                events.ScheduleEvent(EVENT_SUBMERGE, 80*IN_MILLISECONDS, 0, PHASE_MELEE);
                events.ScheduleEvent(EVENT_BERSERK, 10*MINUTE*IN_MILLISECONDS);
                if (IsHeroic())
                    events.ScheduleEvent(EVENT_NERUBIAN_SHADOW_STRIKE, 25*IN_MILLISECONDS, 0, PHASE_MELEE);

                if (!IsHeroic())
                    events.ScheduleEvent(EVENT_SUMMON_FROST_SPHERE, 20*IN_MILLISECONDS);

                Initialize();
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                // clean up spawned Frost Spheres
                std::list<Creature*> FrostSphereList;
                me->GetCreatureListWithEntryInGrid(FrostSphereList, NPC_FROST_SPHERE, 150.0f);
                if (!FrostSphereList.empty())
                    for (std::list<Creature*>::iterator itr = FrostSphereList.begin(); itr != FrostSphereList.end(); ++itr)
                        (*itr)->DespawnOrUnsummon();


				//Summon Scarab Swarms neutral at random places
				for (int i = 0; i < 10; i++)
					if (Creature* temp = me->SummonCreature(NPC_SCARAB, AnubarakLoc[1].GetPositionX() + urand(0, 50) - 25, AnubarakLoc[1].GetPositionY() + urand(0, 50) - 25, AnubarakLoc[1].GetPositionZ()))
					{
						temp->setFaction(31);
						temp->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
						temp->GetMotionMaster()->MoveRandom(10);
					}

                _burrowGUID.clear();
            }

            void KilledUnit(Unit* who) override
            {
                if (who->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILL_PLAYER);
            }

            void MoveInLineOfSight(Unit* /*who*/) override
            {
                if (!_intro)
                {
                    Talk(SAY_INTRO);
                    _intro = false;
                }
            }

            void JustReachedHome() override
            {
                instance->SetBossState(BOSS_ANUBARAK, FAIL);

            }

            void JustDied(Unit* /*killer*/) override
            {
                _JustDied();
                Talk(SAY_DEATH);

                // despawn frostspheres and Burrowers on death
                std::list<Creature*> AddList;
                me->GetCreatureListWithEntryInGrid(AddList, NPC_FROST_SPHERE, 150.0f);
                me->GetCreatureListWithEntryInGrid(AddList, NPC_BURROWER, 150.0f);
                if (!AddList.empty())
                    for (std::list<Creature*>::iterator itr = AddList.begin(); itr != AddList.end(); ++itr)
                        (*itr)->DespawnOrUnsummon();
            }

            void JustSummoned(Creature* summoned) override
            {
                switch (summoned->GetEntry())
                {
                    case NPC_BURROW:
                        _burrowGUID.push_back(summoned->GetGUID());
                        summoned->SetReactState(REACT_PASSIVE);
                        summoned->CastSpell(summoned, SPELL_CHURNING_GROUND, false);
                        summoned->SetDisplayId(summoned->GetCreatureTemplate()->Modelid2);
                        break;
                    case NPC_SPIKE:
                        summoned->SetDisplayId(summoned->GetCreatureTemplate()->Modelid1);
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
                        {
                            summoned->CombatStart(target);
                            Talk(EMOTE_SPIKE, target);
                        }
                        break;
                    default:
                        break;
                }
                summons.Summon(summoned);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                _EnterCombat();
                Talk(SAY_AGGRO);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);

                // Despawn Scarab Swarms neutral
                EntryCheckPredicate pred(NPC_SCARAB);
                summons.DoAction(ACTION_SCARAB_SUBMERGE, pred);

                // Spawn Burrow
                for (int i = 0; i < 4; i++)
                    me->SummonCreature(NPC_BURROW, AnubarakLoc[i + 2]);

                // Spawn 6 Frost Spheres at start
                for (int i = 0; i < 6; i++)
                    if (Unit* summoned = me->SummonCreature(NPC_FROST_SPHERE, SphereSpawn[i]))
                        _sphereGUID[i] = summoned->GetGUID();
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FREEZE_SLASH:
                            DoCastVictim(SPELL_FREEZE_SLASH);
                            events.ScheduleEvent(EVENT_FREEZE_SLASH, 15*IN_MILLISECONDS, 0, PHASE_MELEE);
                            return;
                        case EVENT_PENETRATING_COLD:
                            me->CastCustomSpell(SPELL_PENETRATING_COLD, SPELLVALUE_MAX_TARGETS, RAID_MODE(2, 5, 2, 5));
                            events.ScheduleEvent(EVENT_PENETRATING_COLD, 20*IN_MILLISECONDS, 0, PHASE_MELEE);
                            return;
                        case EVENT_SUMMON_NERUBIAN:
                            if (IsHeroic() || !_reachedPhase3)
                                me->CastCustomSpell(SPELL_SUMMON_BURROWER, SPELLVALUE_MAX_TARGETS, RAID_MODE(1, 2, 2, 4));
                            events.ScheduleEvent(EVENT_SUMMON_NERUBIAN, 45*IN_MILLISECONDS, 0, PHASE_MELEE);
                            return;
                        case EVENT_NERUBIAN_SHADOW_STRIKE:
                        {
                            /*EntryCheckPredicate pred(NPC_BURROWER);
                            summons.DoAction(ACTION_SHADOW_STRIKE, pred);*/
							std::list<Creature*> pCreatureList;

							Trinity::AllCreaturesOfEntryInRange checker(me, NPC_BURROWER, 100.0f);
							Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

							me->VisitNearbyObject(100.0f, searcher);

							if (pCreatureList.empty())
								return;

							if (!pCreatureList.empty())
							{
								for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
									(*i)->AI()->DoAction(ACTION_SHADOW_STRIKE);
							}
                            events.ScheduleEvent(EVENT_NERUBIAN_SHADOW_STRIKE, 25*IN_MILLISECONDS, 0, PHASE_MELEE);
                            break;
                        }
                        case EVENT_SUBMERGE:
                            if (!_reachedPhase3 && !me->HasAura(SPELL_BERSERK))
                            {
								me->RemoveAllAuras();
                                DoCast(me, SPELL_SUBMERGE_ANUBARAK);
                                DoCast(me, SPELL_CLEAR_ALL_DEBUFFS);
                                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                                Talk(EMOTE_BURROWER);
                                events.SetPhase(PHASE_SUBMERGED);
                                events.ScheduleEvent(EVENT_PURSUING_SPIKE, 2*IN_MILLISECONDS, 0, PHASE_SUBMERGED);
                                events.ScheduleEvent(EVENT_SUMMON_SCARAB, 4*IN_MILLISECONDS, 0, PHASE_SUBMERGED);
                                events.ScheduleEvent(EVENT_EMERGE, 1*MINUTE*IN_MILLISECONDS, 0, PHASE_SUBMERGED);
                            }
                            break;
                        case EVENT_PURSUING_SPIKE:
                            DoCast(SPELL_SPIKE_CALL);
                            break;
                        case EVENT_SUMMON_SCARAB:
                        {
                            /* WORKAROUND
                            * - The correct implementation is more likely the comment below but it needs spell knowledge
                            */
                            GuidList::iterator i = _burrowGUID.begin();
                            uint32 at = urand(0, _burrowGUID.size()-1);
                            for (uint32 k = 0; k < at; k++)
                                ++i;
                            if (Creature* pBurrow = ObjectAccessor::GetCreature(*me, *i))
                                pBurrow->CastSpell(pBurrow, 66340, false);

                            events.ScheduleEvent(EVENT_SUMMON_SCARAB, 4*IN_MILLISECONDS, 0, PHASE_SUBMERGED);

                            /*It seems that this spell have something more that needs to be taken into account
                            //Need more sniff info
                            DoCast(SPELL_SUMMON_BEATLES);
                            // Just to make sure it won't happen again in this phase
                            m_uiSummonScarabTimer = 90*IN_MILLISECONDS;*/
                            break;
                        }
                        case EVENT_EMERGE:
                            events.ScheduleEvent(EVENT_SUBMERGE, 80*IN_MILLISECONDS, 0, PHASE_MELEE);
                            DoCast(SPELL_SPIKE_TELE);
                            summons.DespawnEntry(NPC_SPIKE);
                            me->RemoveAurasDueToSpell(SPELL_SUBMERGE_ANUBARAK);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            DoCast(me, SPELL_EMERGE_ANUBARAK);
                            events.SetPhase(PHASE_MELEE);
                            events.ScheduleEvent(EVENT_FREEZE_SLASH, 15*IN_MILLISECONDS, 0, PHASE_MELEE);
                            events.ScheduleEvent(EVENT_PENETRATING_COLD, 20*IN_MILLISECONDS, PHASE_MELEE);
                            events.ScheduleEvent(EVENT_SUMMON_NERUBIAN, 10*IN_MILLISECONDS, 0, PHASE_MELEE);
                            events.ScheduleEvent(EVENT_SUBMERGE, 80*IN_MILLISECONDS, 0, PHASE_MELEE);
                            if (IsHeroic())
                                events.RescheduleEvent(EVENT_NERUBIAN_SHADOW_STRIKE, 20*IN_MILLISECONDS, 0, PHASE_MELEE);
                            return;
                        case EVENT_SUMMON_FROST_SPHERE:
                        {
                            uint8 startAt = urand(0, 5);
                            uint8 i = startAt;
                            do
                            {
                                if (Unit* pSphere = ObjectAccessor::GetCreature(*me, _sphereGUID[i]))
                                {
                                    if (!pSphere->HasAura(SPELL_FROST_SPHERE))
                                    {
										if (Creature* summon = me->SummonCreature(NPC_FROST_SPHERE, SphereSpawn[i]))
										{
											_sphereGUID[i] = summon->GetGUID();
											summon->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
										}                                            
                                        break;
                                    }
                                }
                                i = (i + 1) % 6;
                            }
                            while
                                (i != startAt);
                            events.ScheduleEvent(EVENT_SUMMON_FROST_SPHERE, urand(20*IN_MILLISECONDS, 30*IN_MILLISECONDS));
                            break;
                        }
                        case EVENT_BERSERK:
                            DoCast(me, SPELL_BERSERK);
                            break;
                        default:
                            break;
                    }

                }

                if (HealthBelowPct(30) && events.IsInPhase(PHASE_MELEE) && !_reachedPhase3)
                {
                    _reachedPhase3 = true;
                    DoCastAOE(SPELL_LEECHING_SWARM);
                    Talk(EMOTE_LEECHING_SWARM);
                    Talk(SAY_LEECHING_SWARM);
                }

                if (events.IsInPhase(PHASE_MELEE))
                    DoMeleeAttackIfReady();
            }

            private:
                GuidList _burrowGUID;
                ObjectGuid _sphereGUID[6];
                bool _intro;
                bool _reachedPhase3;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<boss_anubarak_trialAI>(creature);
        };
};

class npc_swarm_scarab : public CreatureScript
{
    public:
        npc_swarm_scarab() : CreatureScript("npc_swarm_scarab") { }

        struct npc_swarm_scarabAI : public ScriptedAI
        {
            npc_swarm_scarabAI(Creature* creature) : ScriptedAI(creature)
            {
                Initialize();
                _instance = creature->GetInstanceScript();
            }

            void Initialize()
            {
                _determinationTimer = urand(5 * IN_MILLISECONDS, 60 * IN_MILLISECONDS);
				_death = false;
            }

            void Reset() override
            {
                me->SetCorpseDelay(0);
                Initialize();
				_despawnTimer = 0;                
                me->SetInCombatWithZone();
                if (me->IsInCombat())
                    if (Creature* Anubarak = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(NPC_ANUBARAK)))
                        Anubarak->AI()->JustSummoned(me);
            }

			void EnterCombat(Unit* who) override
			{
				DoCast(me, SPELL_ACID_MANDIBLE);

				if (who)				
					me->getThreatManager().addThreat(who, 20000);									
			}

            void DoAction(int32 actionId) override
            {
                switch (actionId)
                {
                    case ACTION_SCARAB_SUBMERGE:
                        DoCast(SPELL_SUBMERGE_EFFECT);
                        _despawnTimer = 2*IN_MILLISECONDS; // bandera, mirar a ver.
                        break;
                    default:
                        break;
                }
            }

            void JustDied(Unit* killer) override
            {
                DoCast(killer, SPELL_TRAITOR_KING);
            }

			void DamageTaken(Unit* /*attacker*/, uint32& damage) override
			{

				if (damage >= me->GetHealth())
				{
					damage = 0;
					me->AttackStop(); // change to friendly?
					me->StopMoving();
					me->RemoveAllAuras();
					me->CombatStop();										
					me->SetReactState(REACT_PASSIVE);
					me->getThreatManager().clearReferences();
					// stun itself?					
					me->SetVisible(false);					
					me->setFaction(31); // Friendly
					me->SetFullHealth();
					//_despawnTimer = 60 * IN_MILLISECONDS; // bandera, quiza quitar esto? 
					_death = true;
				}
			}

            void UpdateAI(uint32 diff) override
            {
                /*if (_instance->GetBossState(BOSS_ANUBARAK) != IN_PROGRESS)
                    me->DisappearAndDie();*/

				if (_despawnTimer)
				{
					if (_despawnTimer <= (int32)diff)
					{
						_despawnTimer = 0;
						me->DisappearAndDie();
					}
					else
						_despawnTimer -= diff;

					return;
				}

                if (!UpdateVictim())
                    return;

				if (_death)
					return;
								
                /* Bosskillers don't recognize */
                if (_determinationTimer <= diff)
                {
					if (_instance->GetBossState(BOSS_ANUBARAK) == IN_PROGRESS)										
						DoCast(me, SPELL_DETERMINATION);

                    _determinationTimer = urand(10*IN_MILLISECONDS, 60*IN_MILLISECONDS);
                }
                else
                    _determinationTimer -= diff;

                DoMeleeAttackIfReady();
            }

            private:
                InstanceScript* _instance;
                uint32 _determinationTimer;
				int32 _despawnTimer;
				bool _death;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_swarm_scarabAI>(creature);
        };
};

class npc_nerubian_burrower : public CreatureScript
{
    public:
        npc_nerubian_burrower() : CreatureScript("npc_nerubian_burrower") { }

        struct npc_nerubian_burrowerAI : public ScriptedAI
        {
            npc_nerubian_burrowerAI(Creature* creature) : ScriptedAI(creature)
            {
                Initialize();
                _instance = creature->GetInstanceScript();
            }

            void Initialize()
            {
                _submergeTimer = 10 * IN_MILLISECONDS;				
            }

            void Reset() override
            {
                me->SetCorpseDelay(10);
                Initialize();
                DoCast(me, SPELL_EXPOSE_WEAKNESS);
                DoCast(me, SPELL_SPIDER_FRENZY);
                DoCast(me, SPELL_AWAKENED);
                me->SetInCombatWithZone();
                if (me->IsInCombat())
                    if (Creature* Anubarak = ObjectAccessor::GetCreature(*me, _instance->GetGuidData(NPC_ANUBARAK)))
                        Anubarak->AI()->JustSummoned(me);
            }

            void DoAction(int32 actionId) override
            {
                switch (actionId)
                {
                    case ACTION_SHADOW_STRIKE:
                        if (!me->HasAura(SPELL_AWAKENED))
							if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
							{
								me->StopMoving();
								me->CastStop();
								DoCast(target, SPELL_SHADOW_STRIKE);	
							}
                                
                        break;
                    default:
                        break;
                }
            }

			/*void DamageTaken(Unit* /*who*//*, uint32& damage) override
			{
				
				if (me->GetHealthPct() >= 78 && me->GetHealthPct() <= 80)
					_submergeTimer = 500;
				
			}*/

            void UpdateAI(uint32 diff) override
            {
                if (_instance->GetBossState(BOSS_ANUBARAK) != IN_PROGRESS)
                    me->DisappearAndDie();

                if (!UpdateVictim() && !me->HasAura(SPELL_SUBMERGE_EFFECT))
                    return;

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if ((_submergeTimer <= diff))
                {
                    if (me->HasAura(SPELL_SUBMERGE_EFFECT))
                    {
                        me->RemoveAurasDueToSpell(SPELL_SUBMERGE_EFFECT);
                        DoCast(me, SPELL_EMERGE_EFFECT);
                        DoCast(me, SPELL_AWAKENED);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    }
                    else
                    {

						if (HealthBelowPct(80) && !me->HasAura(SPELL_PERMAFROST_HELPER))
                        {							
                            DoCast(me, SPELL_SUBMERGE_EFFECT);
                            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            DoCast(me, SPELL_PERSISTENT_DIRT, true);
							me->SetFullHealth();
                        }
                    }
                    _submergeTimer = 10*IN_MILLISECONDS;
                }
                else
                    _submergeTimer -= diff;

                DoMeleeAttackIfReady();
            }

            private:
                uint32 _submergeTimer;				
                EventMap _events;
                InstanceScript* _instance;				
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_nerubian_burrowerAI>(creature);
        };
};

class npc_frost_sphere : public CreatureScript
{
    public:
        npc_frost_sphere() : CreatureScript("npc_frost_sphere") { }

        struct npc_frost_sphereAI : public ScriptedAI
        {
            npc_frost_sphereAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset() override
            {
                me->SetReactState(REACT_PASSIVE);
                DoCast(SPELL_FROST_SPHERE);
                me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
                me->GetMotionMaster()->MoveRandom(20.0f);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				me->SetInCombatWithZone();				
            }

            void DamageTaken(Unit* /*who*/, uint32& damage) override
            {

                if (me->GetHealth() <= damage)
                {
					
                    damage = 0;
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->SetFullHealth();
                    float floorZ = me->GetMap()->GetHeight(me->GetPhaseMask(), me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
                    if (fabs(me->GetPositionZ() - floorZ) < 0.1f)
                    {
                        // we are close to the ground
                        me->GetMotionMaster()->MoveIdle();
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        me->RemoveAurasDueToSpell(SPELL_FROST_SPHERE);
                        DoCast(SPELL_PERMAFROST_MODEL);
                        DoCast(SPELL_PERMAFROST);
                        //me->SetObjectScale(2.0f);
                    }
                    else
                    {
                        // we are in air
                        me->GetMotionMaster()->MoveIdle();                        
                        //At hit the ground
                        me->HandleEmoteCommand(EMOTE_ONESHOT_FLYDEATH);
                        me->GetMotionMaster()->MoveFall(POINT_FALL_GROUND);
						events.ScheduleEvent(EVENT_SPHERE_EXPLODE, 2000);
                    }					
                }
            }

            void MovementInform(uint32 type, uint32 pointId) override
            {
                if (type != EFFECT_MOTION_TYPE)
                    return;

                switch (pointId)
                {
                    case POINT_FALL_GROUND: // if !death gripped schedule check or something like that
						
						/*me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        me->RemoveAurasDueToSpell(SPELL_FROST_SPHERE);
                        DoCast(SPELL_PERMAFROST_MODEL);
                        DoCast(SPELL_PERMAFROST_VISUAL);
                        DoCast(SPELL_PERMAFROST);
                        me->SetObjectScale(2.0f);*/
                        break;
                    default:
                        break;
                }
            }

			void UpdateAI(uint32 diff) override
			{
				events.Update(diff);

				while (uint32 eventId = events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_SPHERE_EXPLODE:						
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
						me->RemoveAurasDueToSpell(SPELL_FROST_SPHERE);
						DoCast(SPELL_PERMAFROST_MODEL);
						DoCast(SPELL_PERMAFROST_VISUAL);
						DoCast(SPELL_PERMAFROST);
						//me->SetObjectScale(2.0f);
						break;
					default:
						break;
					}
				}
			}

		private:
			EventMap events;			
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_frost_sphereAI(creature);
        };
};

/*










PROBAR PARA MAÑANA

A PONER EN REACT DEFENSIVE LAS SPIKES, AL MENOS PARA QUE NO ENTREN EN COMBATE Y QUE ANUB SEA EL QUE ELIJA LOS TARGET

AL MENOS EN CONTINUE CHASING, REACT DEFENSIVE Y QUE LE SIGA, SI HACE FALTA QUE SE EJECUTE UN SEGUIR CADA 300ms o una comprobación o algo y en el reselect, de nuevo agresivo si es que no decidesponer todo a defensivo.




case EVENT_CHASE_RIGHT:
if (Creature* otherBeam = me->FindNearestCreature(NPC_FOCUSED_EYEBEAM, 10.0f))
me->GetMotionMaster()->MovePoint(0, otherBeam->GetPositionX(), otherBeam->GetPositionY(), otherBeam->GetPositionZ());

events.RescheduleEvent(EVENT_CHASE_RIGHT, 1000);
break;
case EVENT_UPDATE_TARGET:
if (targetPlayer)
me->GetMotionMaster()->MovePoint(0, targetPlayer->GetPositionX(), targetPlayer->GetPositionY(), targetPlayer->GetPositionZ());



y controlar el target todo el rato mediante stores en variables, no hacer un getvictim ni nada. así puedes hacer si target tiene cubito entonces haz esto.

En teoría, de ésta manera si el target tiene HOP, da igual, porque vas a hacer un motionmaster move point (who->getx(), que se llame cada 500ms o algo así, a no ser que forzosamente (congelado o feign death, muerto, cubito...) necesitemos elegir otro target.

EVENTO QUE SE LLAME MOVE.

*/










class npc_anubarak_spike : public CreatureScript
{
public:
	npc_anubarak_spike() : CreatureScript("npc_anubarak_spike") { }

	struct npc_anubarak_spikeAI : public ScriptedAI
	{
		npc_anubarak_spikeAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
		}

		void Initialize()
		{
			_phase = PHASE_NO_MOVEMENT;
			_phaseSwitchTimer = 1;
		}

		void Reset() override
		{
			Initialize();
			_canCheckSphere = true;
			// make sure the spike has everyone on threat list
			me->SetInCombatWithZone();
			me->SetReactState(REACT_PASSIVE);
			PursueNewTarget();
		}

		bool CanAIAttack(Unit const* victim) const override
		{
			return victim->GetTypeId() == TYPEID_PLAYER;
		}

		void EnterCombat(Unit* who) override
		{			
			
		}

		void DamageTaken(Unit* /*who*/, uint32& uiDamage) override
		{
			uiDamage = 0;
		}

		void RemoveSpeedAuras()
		{
			if (me->HasAura(SPELL_SPIKE_SPEED1))
				me->RemoveAurasDueToSpell(SPELL_SPIKE_SPEED1);

			if (me->HasAura(SPELL_SPIKE_SPEED2))
				me->RemoveAurasDueToSpell(SPELL_SPIKE_SPEED2);

			if (me->HasAura(SPELL_SPIKE_SPEED3))
				me->RemoveAurasDueToSpell(SPELL_SPIKE_SPEED3);
		}

		void UpdateAI(uint32 diff) override
		{
			/*if (!UpdateVictim())
			{
				me->DisappearAndDie();
				return;
			}*/

			if (_currentTargetGUID)
			{
				if (Player* target = ObjectAccessor::GetPlayer(*me, _currentTargetGUID))
				{
					if (!target->IsAlive() || target->HasAura(5384) || target->HasAura(45438) || target->HasAura(11327) || target->HasAura(19753)) // 19753 Divine Intervention Feign death, Ice Cube, Vanish
					{
						PursueNewTarget();
					}
				}
			}

			if (_phaseSwitchTimer)
			{
				if (_phaseSwitchTimer <= diff)
				{
					switch (_phase)
					{
					case PHASE_NO_MOVEMENT:

						RemoveSpeedAuras();
						DoCast(me, SPELL_SPIKE_SPEED1);
						DoCast(me, SPELL_SPIKE_TRAIL);						
						_phase = PHASE_IMPALE_NORMAL;					
													
						_phaseSwitchTimer = 7 * IN_MILLISECONDS;
						return;
					case PHASE_IMPALE_NORMAL:
						RemoveSpeedAuras();
						DoCast(me, SPELL_SPIKE_SPEED2);
						_phase = PHASE_IMPALE_MIDDLE;
						_phaseSwitchTimer = 7 * IN_MILLISECONDS;
						return;
					case PHASE_IMPALE_MIDDLE:
						RemoveSpeedAuras();
						DoCast(me, SPELL_SPIKE_SPEED3);
						_phase = PHASE_IMPALE_FAST;
						_phaseSwitchTimer = 0;
						return;
					default:
						return;
					}
				}
				else
					_phaseSwitchTimer -= diff;
			}

			if (_canCheckSphere)
			{
				if (Creature* sphere = me->FindNearestCreature(NPC_FROST_SPHERE, 4.0f, true))
				{
					_phase = PHASE_NO_MOVEMENT;
					_phaseSwitchTimer = 15 * IN_MILLISECONDS; // Just to delay
					_events.CancelEvent(EVENT_MOVE);
					me->CastSpell(me, SPELL_SPIKE_FAIL, true);
					RemoveSpeedAuras();
					sphere->DespawnOrUnsummon(3 * IN_MILLISECONDS);

					_canCheckSphere = false;
					_enableSpikeTimer = 5 * IN_MILLISECONDS;
					_currentTargetGUID = ObjectGuid::Empty;
					
					// After the spikes hit the icy surface they can't move for about ~5 seconds
					//_phase = PHASE_NO_MOVEMENT;
					//_phaseSwitchTimer = 5 * IN_MILLISECONDS;
					//SetCombatMovement(false);
					me->GetMotionMaster()->MoveIdle();
					me->GetMotionMaster()->Clear();
				}
			}
			else
			{
				if (_enableSpikeTimer <= diff)
				{					
					PursueNewTarget();
					_canCheckSphere = true;
					_enableSpikeTimer = 120 * IN_MILLISECONDS;
				}
				else
					_enableSpikeTimer -= diff;
			}

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MOVE:
					if (_currentTargetGUID)
					if (Player* target = ObjectAccessor::GetPlayer(*me, _currentTargetGUID))
					{
						me->GetMotionMaster()->MovePoint(0, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ());
					}
					_events.ScheduleEvent(EVENT_MOVE, 1 * IN_MILLISECONDS);
					break;
				default:
					break;
				}
			}
		}

		void PursueNewTarget()
		{
			// RESETEAR ?? 

			if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true)) // quiza anub?
			{
				if (!_currentTargetGUID.Empty && (_currentTargetGUID == target->GetGUID()))
				{					
					return;
				}					

				_phase = PHASE_NO_MOVEMENT;
				_phaseSwitchTimer = 1;
				_currentTargetGUID = target->GetGUID();
				DoCast(target, SPELL_MARK);
				Talk(EMOTE_SPIKE, target);
				me->SetSpeed(MOVE_RUN, 0.5f);
				_events.RescheduleEvent(EVENT_MOVE, 500);
				// make sure the Spine will really follow the one he should
				/*me->getThreatManager().clearReferences();
				me->SetInCombatWithZone();
				me->getThreatManager().addThreat(who, std::numeric_limits<float>::max());*/

//				me->GetMotionMaster()->Clear(true);
				//me->GetMotionMaster()->MoveChase(who);
				//me->TauntApply(who);
			}

		}

	private:
		uint32 _phaseSwitchTimer;
		PursuingSpikesPhases _phase;
		EventMap _events;

		ObjectGuid _currentTargetGUID;

		bool _canCheckSphere;
		uint32 _enableSpikeTimer;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_anubarak_spikeAI(creature);
	};
};

class spell_impale : public SpellScriptLoader
{
    public:
        spell_impale() : SpellScriptLoader("spell_impale") { }

        class spell_impale_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_impale_SpellScript);

            void HandleDamageCalc(SpellEffIndex /*effIndex*/)
            {
                Unit* target = GetHitUnit();
                uint32 permafrost = sSpellMgr->GetSpellIdForDifficulty(SPELL_PERMAFROST, target);

                // make sure Impale doesnt do damage if we are standing on permafrost
                if (target && target->HasAura(permafrost))
                    SetHitDamage(0);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_impale_SpellScript::HandleDamageCalc, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_impale_SpellScript();
        }
};

class spell_anubarak_leeching_swarm : public SpellScriptLoader
{
public:
	spell_anubarak_leeching_swarm() : SpellScriptLoader("spell_anubarak_leeching_swarm") { }

	class spell_anubarak_leeching_swarm_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_anubarak_leeching_swarm_AuraScript);

		bool Validate(SpellInfo const* /*spell*/) override
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_LEECHING_SWARM_DMG) || !sSpellMgr->GetSpellInfo(SPELL_LEECHING_SWARM_HEAL))
				return false;
			return true;
		}

		void HandleEffectPeriodic(AuraEffect const* aurEff)
		{
			Unit* caster = GetCaster();
			if (Unit* target = GetTarget())
			{
				int32 lifeLeeched = target->CountPctFromCurHealth(aurEff->GetAmount());
				if (lifeLeeched < 250)
					lifeLeeched = 250;
				// Damage
				caster->CastCustomSpell(target, SPELL_LEECHING_SWARM_DMG, &lifeLeeched, 0, 0, false);
				// Heal
				caster->CastCustomSpell(caster, SPELL_LEECHING_SWARM_HEAL, &lifeLeeched, 0, 0, false);
			}
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_anubarak_leeching_swarm_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_anubarak_leeching_swarm_AuraScript();
	}
};

void AddSC_boss_anubarak_trial()
{
    new boss_anubarak_trial();
    new npc_swarm_scarab();
    new npc_nerubian_burrower();
    new npc_anubarak_spike();
    new npc_frost_sphere();

    new spell_impale();
    new spell_anubarak_leeching_swarm();
}
