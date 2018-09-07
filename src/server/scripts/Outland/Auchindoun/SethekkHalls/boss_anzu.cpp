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

/*
Name: Boss_Anzu
%Complete: 80%
Comment:
Category: Auchindoun, Sethekk Halls
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "sethekk_halls.h"
#include "SpellInfo.h"

enum Says
{
    SAY_SUMMON_BROOD            = 0,
    SAY_SPELL_BOMB              = 1,
    SAY_INTRO_1                 = 2,
    SAY_INTRO_2                 = 3
};

enum Spells
{
    SPELL_SHADOWFORM             = 40973,
    SPELL_PARALYZING_SCREECH     = 40184,
    SPELL_SPELL_BOMB             = 40303,
    SPELL_CYCLONE_OF_FEATHERS    = 40321,
    SPELL_BANISH_SELF            = 42354,
    SPELL_FLESH_RIP              = 40199,

    SPELL_PROTECTION_OF_THE_HAWK = 40237,
    SPELL_SPITE_OF_THE_EAGLE     = 40240,
    SPELL_SPEED_OF_THE_FALCON    = 40241,
    SPELL_FREEZE                 = 36575,
    SPELL_SHADOWFORM_2           = 39946
};

enum Events
{
    EVENT_PARALYZING_SCREECH    = 1,
    EVENT_SPELL_BOMB            = 2,
    EVENT_CYCLONE_OF_FEATHERS   = 3,
    EVENT_SUMMON                = 4,
    EVENT_INTRO_BEGIN           = 5,
    EVENT_INTRO_STEP            = 6,
    EVENT_INTRO_END             = 7,

    EVENT_SPIRIT_ACTIVE         = 8
};

enum Phases
{
    PHASE_INTRO                 = 1,
    PHASE_NORMAL                = 2
};

Position const PosSummonBrood[7] =
{
    { -118.1717f, 284.5299f, 121.2287f, 2.775074f },
    { -98.15528f, 293.4469f, 109.2385f, 0.174533f },
    { -99.70160f, 270.1699f, 98.27389f, 6.178465f },
    { -69.25543f, 303.0768f, 97.84479f, 5.532694f },
    { -87.59662f, 263.5181f, 92.70478f, 1.658063f },
    { -73.54323f, 276.6267f, 94.25807f, 2.802979f },
    { -81.70527f, 280.8776f, 44.58830f, 0.526849f }
};

uint32 const AnzuSpirits[] = { NPC_HAWK_SPIRIT, NPC_EAGLE_SPIRIT, NPC_FALCON_SPIRIT };

Position const PosAnzuSpirit[3] =
{
    { -96.5290f,  303.6788f, 26.4831f, 5.1741f },
    { -100.1466f, 276.8206f, 24.1406f, 0.6503f },
    { -70.7110f,  290.0608f, 26.4994f, 3.2177f }
};

class boss_anzu : public CreatureScript
{
    public:
        boss_anzu() : CreatureScript("boss_anzu") { }

        struct boss_anzuAI : public BossAI
        {
            boss_anzuAI(Creature* creature) : BossAI(creature, DATA_ANZU), _summons(me)
            {
                Initialize();
                _JustSummoned();
            }

            void _JustSummoned()
            {
                _introDone = false;

                DoCast(me, SPELL_SHADOWFORM);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);

                events.SetPhase(PHASE_INTRO);
                events.ScheduleEvent(EVENT_INTRO_BEGIN, Seconds(1));
            }

            void Initialize()
            {
                _under33Percent = false;
                _under66Percent = false;
            }

            void Reset() override
            {
                //_Reset();
                if (_introDone)
                {
                    events.Reset();
                    _summons.DespawnAll();
                }

                Initialize();
            }

            void EnterCombat(Unit* /*who*/) override
            {
                _EnterCombat();
                events.ScheduleEvent(EVENT_PARALYZING_SCREECH, 14000);
                events.ScheduleEvent(EVENT_CYCLONE_OF_FEATHERS, 5000);
                events.ScheduleEvent(EVENT_SPELL_BOMB, 10000);

                SummonSpirits();
            }

            void SummonSpirits()
            {
                for (uint8 i = 0; i < 3; ++i)
                {
                    if (Creature* spirit = me->SummonCreature(AnzuSpirits[i], PosAnzuSpirit[i], TEMPSUMMON_MANUAL_DESPAWN, 0))
                        _summons.Summon(spirit);
                }
            }

            void JustDied(Unit* /*killer*/) override
            {
                _JustDied();
            }

            void DamageTaken(Unit* /*killer*/, uint32 &damage) override
            {
                if (me->HealthBelowPctDamaged(33, damage) && !_under33Percent)
                {
                    _under33Percent = true;
                    Talk(SAY_SUMMON_BROOD);
                    events.ScheduleEvent(EVENT_SUMMON, 3000);
                }

                if (me->HealthBelowPctDamaged(66, damage) && !_under66Percent)
                {
                    _under66Percent = true;
                    Talk(SAY_SUMMON_BROOD);
                    events.ScheduleEvent(EVENT_SUMMON, 3000);
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim() && !events.IsInPhase(PHASE_INTRO))
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_INTRO_BEGIN:
                            Talk(SAY_INTRO_1);
                            events.ScheduleEvent(EVENT_INTRO_STEP, Seconds(6));
                            break;
                        case EVENT_INTRO_STEP:
                            Talk(SAY_INTRO_2);
                            events.ScheduleEvent(EVENT_INTRO_END, Seconds(2));
                            break;
                        case EVENT_INTRO_END:
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                            me->RemoveAurasDueToSpell(SPELL_SHADOWFORM);
                            events.SetPhase(PHASE_NORMAL);
                            _introDone = true;
                            break;
                        case EVENT_PARALYZING_SCREECH:
                            DoCastVictim(SPELL_PARALYZING_SCREECH);
                            events.ScheduleEvent(EVENT_PARALYZING_SCREECH, 26000);
                            break;
                        case EVENT_CYCLONE_OF_FEATHERS:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_CYCLONE_OF_FEATHERS);
                            events.ScheduleEvent(EVENT_CYCLONE_OF_FEATHERS, 21000);
                            break;
                        case EVENT_SUMMON:
                            // TODO: Add pathing for Brood of Anzu
                            for (uint8 i = 0; i < 7; i++)
                                me->SummonCreature(NPC_BROOD_OF_ANZU, PosSummonBrood[i], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 46000);

                            DoCast(me, SPELL_BANISH_SELF);
                            events.ScheduleEvent(EVENT_SPELL_BOMB, 12000);
                            break;
                        case EVENT_SPELL_BOMB:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                            {
                                if (target->getPowerType() == POWER_MANA)
                                {
                                    DoCast(target, SPELL_SPELL_BOMB);
                                    Talk(SAY_SPELL_BOMB, target);
                                }
                            }
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                bool _under33Percent;
                bool _under66Percent;
                bool _introDone;
                SummonList _summons;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetSethekkHallsAI<boss_anzuAI>(creature);
        }
};

class npc_anzu_spirit : public CreatureScript
{
public:
    npc_anzu_spirit() : CreatureScript("npc_anzu_spirit") { }

    struct npc_anzu_spiritAI : public ScriptedAI
    {
        npc_anzu_spiritAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
            me->SetReactState(REACT_PASSIVE);
        }

        void SpellHit(Unit* caster, SpellInfo const* spell) override
        {
            if (spell->SpellFamilyName == SPELLFAMILY_DRUID &&
                (spell->SpellFamilyFlags[0] & 0x00000050 ||     // Regrowth & Rejuvenation
                    spell->SpellFamilyFlags[1] & 0x00000010))   // Lifebloom
            {
                DoCast(caster, SpellId);
                me->RemoveAurasDueToSpell(SPELL_SHADOWFORM_2);
                Events.ScheduleEvent(EVENT_SPIRIT_ACTIVE, Seconds(5));
            }
        }

        void Initialize()
        {
            switch (me->GetEntry())
            {
                case NPC_EAGLE_SPIRIT:
                    SpellId = SPELL_SPITE_OF_THE_EAGLE;
                    break;
                case NPC_HAWK_SPIRIT:
                    SpellId = SPELL_PROTECTION_OF_THE_HAWK;
                    break;
                case NPC_FALCON_SPIRIT:
                    SpellId = SPELL_SPEED_OF_THE_FALCON;
                    break;
                default:
                    SpellId = 0;
                    break;
            }
        }

        void Reset() override
        {
            Initialize();
            DoCast(me, SPELL_SHADOWFORM_2);
        }

        void UpdateAI(uint32 diff) override
        {
            Events.Update(diff);

            while (uint32 eventId = Events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SPIRIT_ACTIVE:
                        DoCast(me, SPELL_SHADOWFORM_2);
                        break;
                    default:
                        break;
                }
            }
        }

        private:
            EventMap Events;
            uint32 SpellId;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_anzu_spiritAI(creature);
    }
};

void AddSC_boss_anzu()
{
    new boss_anzu();
    new npc_anzu_spirit();
}
