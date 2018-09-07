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
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "SpellAuras.h"
#include "SpellScript.h"
#include "Player.h"
#include "TemporarySummon.h"
#include "CombatAI.h"
#include "Vehicle.h"
#include "SmartScriptMgr.h"
#include "ScriptedEscortAI.h"
#include "SmartAI.h"

/*######
## npc_argent_valiant
######*/

enum ArgentValiant
{
    SPELL_CHARGE                = 63010,
    SPELL_SHIELD_BREAKER        = 65147,
    SPELL_KILL_CREDIT           = 63049
};

class npc_argent_valiant : public CreatureScript
{
public:
    npc_argent_valiant() : CreatureScript("npc_argent_valiant") { }

    struct npc_argent_valiantAI : public ScriptedAI
    {
        npc_argent_valiantAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
            creature->GetMotionMaster()->MovePoint(0, 8599.258f, 963.951f, 547.553f);
            creature->setFaction(35); //wrong faction in db?
        }

        void Initialize()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset() override
        {
            Initialize();
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/) override
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage) override
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                pDoneBy->CastSpell(pDoneBy, SPELL_KILL_CREDIT, true);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(uint32 uiDiff) override
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_argent_valiantAI(creature);
    }
};

/*######
## npc_guardian_pavilion
######*/

enum GuardianPavilion
{
    SPELL_TRESPASSER_H                            = 63987,
    AREA_SUNREAVER_PAVILION                       = 4676,

    AREA_SILVER_COVENANT_PAVILION                 = 4677,
    SPELL_TRESPASSER_A                            = 63986,
};

class npc_guardian_pavilion : public CreatureScript
{
public:
    npc_guardian_pavilion() : CreatureScript("npc_guardian_pavilion") { }

    struct npc_guardian_pavilionAI : public ScriptedAI
    {
        npc_guardian_pavilionAI(Creature* creature) : ScriptedAI(creature)
        {
            SetCombatMovement(false);
        }

        void MoveInLineOfSight(Unit* who) override

        {
            if (me->GetAreaId() != AREA_SUNREAVER_PAVILION && me->GetAreaId() != AREA_SILVER_COVENANT_PAVILION)
                return;

            if (!who || who->GetTypeId() != TYPEID_PLAYER || !me->IsHostileTo(who) || !me->isInBackInMap(who, 5.0f))
                return;

            if (who->HasAura(SPELL_TRESPASSER_H) || who->HasAura(SPELL_TRESPASSER_A))
                return;

            if (who->ToPlayer()->GetTeamId() == TEAM_ALLIANCE)
                who->CastSpell(who, SPELL_TRESPASSER_H, true);
            else
                who->CastSpell(who, SPELL_TRESPASSER_A, true);

        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_guardian_pavilionAI(creature);
    }
};

/*######
* npc_tournament_training_dummy
######*/
enum TournamentDummy
{
    NPC_CHARGE_TARGET         = 33272,
    NPC_MELEE_TARGET          = 33229,
    NPC_RANGED_TARGET         = 33243,

    SPELL_CHARGE_CREDIT       = 62658,
    SPELL_MELEE_CREDIT        = 62672,
    SPELL_RANGED_CREDIT       = 62673,

    SPELL_PLAYER_THRUST       = 62544,
    SPELL_PLAYER_BREAK_SHIELD = 62626,
    SPELL_PLAYER_CHARGE       = 62874,

    SPELL_RANGED_DEFEND       = 62719,
    SPELL_CHARGE_DEFEND       = 64100,
    SPELL_VULNERABLE          = 62665,

    SPELL_COUNTERATTACK       = 62709,

    EVENT_DUMMY_RECAST_DEFEND = 1,
    EVENT_DUMMY_RESET         = 2,
};

class npc_tournament_training_dummy : public CreatureScript
{
    public:
        npc_tournament_training_dummy(): CreatureScript("npc_tournament_training_dummy"){ }

        struct npc_tournament_training_dummyAI : ScriptedAI
        {
            npc_tournament_training_dummyAI(Creature* creature) : ScriptedAI(creature)
            {
                Initialize();
                SetCombatMovement(false);
            }

            void Initialize()
            {
                isVulnerable = false;
            }

            EventMap events;
            bool isVulnerable;

            void Reset() override
            {
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                Initialize();

                // Cast Defend spells to max stack size
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        DoCast(SPELL_CHARGE_DEFEND);
                        break;
                    case NPC_RANGED_TARGET:
                        me->CastCustomSpell(SPELL_RANGED_DEFEND, SPELLVALUE_AURA_STACK, 3, me);
                        break;
                }

                events.Reset();
                events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
            }

            void EnterEvadeMode() override
            {
                if (!_EnterEvadeMode())
                    return;

                Reset();
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage) override
            {
                damage = 0;
                events.RescheduleEvent(EVENT_DUMMY_RESET, 10000);
            }

            void SpellHit(Unit* caster, SpellInfo const* spell) override
            {
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        if (spell->Id == SPELL_PLAYER_CHARGE)
                            if (isVulnerable)
                                DoCast(caster, SPELL_CHARGE_CREDIT, true);
                        break;
                    case NPC_MELEE_TARGET:
                        if (spell->Id == SPELL_PLAYER_THRUST)
                        {
                            DoCast(caster, SPELL_MELEE_CREDIT, true);

                            if (Unit* target = caster->GetVehicleBase())
                                DoCast(target, SPELL_COUNTERATTACK, true);
                        }
                        break;
                    case NPC_RANGED_TARGET:
                        if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                            if (isVulnerable)
                                DoCast(caster, SPELL_RANGED_CREDIT, true);
                        break;
                }

                if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                    if (!me->HasAura(SPELL_CHARGE_DEFEND) && !me->HasAura(SPELL_RANGED_DEFEND))
                        isVulnerable = true;
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);

                switch (events.ExecuteEvent())
                {
                    case EVENT_DUMMY_RECAST_DEFEND:
                        switch (me->GetEntry())
                        {
                            case NPC_CHARGE_TARGET:
                            {
                                if (!me->HasAura(SPELL_CHARGE_DEFEND))
                                    DoCast(SPELL_CHARGE_DEFEND);
                                break;
                            }
                            case NPC_RANGED_TARGET:
                            {
                                Aura* defend = me->GetAura(SPELL_RANGED_DEFEND);
                                if (!defend || defend->GetStackAmount() < 3 || defend->GetDuration() <= 8000)
                                    DoCast(SPELL_RANGED_DEFEND);
                                break;
                            }
                        }
                        isVulnerable = false;
                        events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
                        break;
                    case EVENT_DUMMY_RESET:
                        if (UpdateVictim())
                        {
                            EnterEvadeMode();
                            events.ScheduleEvent(EVENT_DUMMY_RESET, 10000);
                        }
                        break;
                }

                if (!UpdateVictim())
                    return;

                if (!me->HasUnitState(UNIT_STATE_STUNNED))
                    me->SetControlled(true, UNIT_STATE_STUNNED);
            }

            void MoveInLineOfSight(Unit* /*who*/) override { }

        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_tournament_training_dummyAI(creature);
        }

};

// Battle for Crusaders' Pinnacle
enum BlessedBanner
{
    SPELL_BLESSING_OF_THE_CRUSADE       = 58026,
    SPELL_THREAT_PULSE                  = 58113,
    SPELL_CRUSADERS_SPIRE_VICTORY       = 58084,
    SPELL_TORCH                         = 58121,

    NPC_BLESSED_BANNER                  = 30891,
    NPC_CRUSADER_LORD_DALFORS           = 31003,
    NPC_ARGENT_BATTLE_PRIEST            = 30919,
    NPC_ARGENT_MASON                    = 30900,
    NPC_REANIMATED_CAPTAIN              = 30986,
    NPC_SCOURGE_DRUDGE                  = 30984,
    NPC_HIDEOUS_PLAGEBRINGER            = 30987,
    NPC_HALOF_THE_DEATHBRINGER          = 30989,
    NPC_LK                              = 31013,

    BANNER_SAY                          = 0, // "The Blessed Banner of the Crusade has been planted.\n Defend the banner from all attackers!"
    DALFORS_SAY_PRE_1                   = 0, // "BY THE LIGHT! Those damned monsters! Look at what they've done to our people!"
    DALFORS_SAY_PRE_2                   = 1, // "Burn it down, boys. Burn it all down."
    DALFORS_SAY_START                   = 2, // "Let 'em come. They'll pay for what they've done!"
    DALFORS_YELL_FINISHED               = 3, // "We've done it, lads! We've taken the pinnacle from the Scourge! Report to Father Gustav at once and tell him the good news! We're gonna get to buildin' and settin' up! Go!"
    LK_TALK_1                           = 0, // "Leave no survivors!"
    LK_TALK_2                           = 1, // "Cower before my terrible creations!"
    LK_TALK_3                           = 2, // "Feast my children! Feast upon the flesh of the living!"
    LK_TALK_4                           = 3, // "Lay down your arms and surrender your souls!"

    EVENT_SPAWN                         = 1,
    EVENT_INTRO_1                       = 2,
    EVENT_INTRO_2                       = 3,
    EVENT_INTRO_3                       = 4,
    EVENT_MASON_ACTION                  = 5,
    EVENT_START_FIGHT                   = 6,
    EVENT_WAVE_SPAWN                    = 7,
    EVENT_HALOF                         = 8,
    EVENT_ENDED                         = 9,
};

Position const DalforsPos[3] =
{
    {6458.703f, 403.858f, 490.498f, 3.1205f}, // Dalfors spawn point
    {6422.950f, 423.335f, 510.451f, 0.0f}, // Dalfors intro pos
    {6426.343f, 420.515f, 508.650f, 0.0f}, // Dalfors fight pos
};

Position const Priest1Pos[2] =
{
    {6462.025f, 403.681f, 489.721f, 3.1007f}, // priest1 spawn point
    {6421.480f, 423.576f, 510.781f, 5.7421f}, // priest1 intro pos
};

Position const Priest2Pos[2] =
{
    {6463.969f, 407.198f, 489.240f, 2.2689f}, // priest2 spawn point
    {6419.778f, 421.404f, 510.972f, 5.7421f}, // priest2 intro pos
};

Position const Priest3Pos[2] =
{
    {6464.371f, 400.944f, 489.186f, 6.1610f}, // priest3 spawn point
    {6423.516f, 425.782f, 510.774f, 5.7421f}, // priest3 intro pos
};

Position const Mason1Pos[3] =
{
    {6462.929f, 409.826f, 489.392f, 3.0968f}, // mason1 spawn point
    {6428.163f, 421.960f, 508.297f, 0.0f}, // mason1 intro pos
    {6414.335f, 454.904f, 511.395f, 2.8972f}, // mason1 action pos
};

Position const Mason2Pos[3] =
{
    {6462.650f, 405.670f, 489.576f, 2.9414f}, // mason2 spawn point
    {6426.250f, 419.194f, 508.219f, 0.0f}, // mason2 intro pos
    {6415.014f, 446.849f, 511.395f, 3.1241f}, // mason2 action pos
};

Position const Mason3Pos[3] =
{
    {6462.646f, 401.218f, 489.601f, 2.7864f}, // mason3 spawn point
    {6423.855f, 416.598f, 508.305f, 0.0f}, // mason3 intro pos
    {6417.070f, 438.824f, 511.395f, 3.6651f}, // mason3 action pos
};

class npc_blessed_banner : public CreatureScript
{
public:
    npc_blessed_banner() : CreatureScript("npc_blessed_banner") { }

    struct npc_blessed_bannerAI : public ScriptedAI
    {
        npc_blessed_bannerAI(Creature* creature) : ScriptedAI(creature), Summons(me)
        {
            HalofSpawned = false;
            PhaseCount = 0;

            SetCombatMovement(false);
        }

        EventMap events;

        bool HalofSpawned;

        uint32 PhaseCount;

        SummonList Summons;

        ObjectGuid guidDalfors;
        ObjectGuid guidPriest[3];
        ObjectGuid guidMason[3];
        ObjectGuid guidHalof;

        void Reset() override
        {
            me->setRegeneratingHealth(false);
            DoCast(SPELL_THREAT_PULSE);
            Talk(BANNER_SAY);
            events.ScheduleEvent(EVENT_SPAWN, 3000);
        }

        void EnterCombat(Unit* /*who*/) override { }

        void MoveInLineOfSight(Unit* /*who*/) override { }


        void JustSummoned(Creature* Summoned) override
        {
            Summons.Summon(Summoned);
        }

        void JustDied(Unit* /*killer*/) override
        {
            Summons.DespawnAll();
            me->DespawnOrUnsummon();
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            switch (events.ExecuteEvent())
            {
                case EVENT_SPAWN:
                    {
                        if (Creature* Dalfors = DoSummon(NPC_CRUSADER_LORD_DALFORS, DalforsPos[0]))
                        {
                            guidDalfors = Dalfors->GetGUID();
                            Dalfors->GetMotionMaster()->MovePoint(0, DalforsPos[1]);
                        }
                        if (Creature* Priest1 = DoSummon(NPC_ARGENT_BATTLE_PRIEST, Priest1Pos[0]))
                        {
                            guidPriest[0] = Priest1->GetGUID();
                            Priest1->GetMotionMaster()->MovePoint(0, Priest1Pos[1]);
                        }
                        if (Creature* Priest2 = DoSummon(NPC_ARGENT_BATTLE_PRIEST, Priest2Pos[0]))
                        {
                            guidPriest[1] = Priest2->GetGUID();
                            Priest2->GetMotionMaster()->MovePoint(0, Priest2Pos[1]);
                        }
                        if (Creature* Priest3 = DoSummon(NPC_ARGENT_BATTLE_PRIEST, Priest3Pos[0]))
                        {
                            guidPriest[2] = Priest3->GetGUID();
                            Priest3->GetMotionMaster()->MovePoint(0, Priest3Pos[1]);
                        }
                        if (Creature* Mason1 = DoSummon(NPC_ARGENT_MASON, Mason1Pos[0]))
                        {
                            guidMason[0] = Mason1->GetGUID();
                            Mason1->GetMotionMaster()->MovePoint(0, Mason1Pos[1]);
                        }
                        if (Creature* Mason2 = DoSummon(NPC_ARGENT_MASON, Mason2Pos[0]))
                        {
                            guidMason[1] = Mason2->GetGUID();
                            Mason2->GetMotionMaster()->MovePoint(0, Mason2Pos[1]);
                        }
                        if (Creature* Mason3 = DoSummon(NPC_ARGENT_MASON, Mason3Pos[0]))
                        {
                            guidMason[2] = Mason3->GetGUID();
                            Mason3->GetMotionMaster()->MovePoint(0, Mason3Pos[1]);
                        }
                        events.ScheduleEvent(EVENT_INTRO_1, 15000);
                    }
                    break;
                case EVENT_INTRO_1:
                    {
                        if (Creature* Dalfors = ObjectAccessor::GetCreature(*me, guidDalfors))
                            Dalfors->AI()->Talk(DALFORS_SAY_PRE_1);
                        events.ScheduleEvent(EVENT_INTRO_2, 5000);
                    }
                    break;
                case EVENT_INTRO_2:
                    {
                        if (Creature* Dalfors = ObjectAccessor::GetCreature(*me, guidDalfors))
                        {
                            Dalfors->SetFacingTo(6.215f);
                            Dalfors->AI()->Talk(DALFORS_SAY_PRE_2);
                        }
                    events.ScheduleEvent(EVENT_INTRO_3, 5000);
                    }
                    break;
                case EVENT_INTRO_3:
                    {
                        if (Creature* Dalfors = ObjectAccessor::GetCreature(*me, guidDalfors))
                        {
                            Dalfors->GetMotionMaster()->MovePoint(0, DalforsPos[2]);
                            Dalfors->SetHomePosition(DalforsPos[2]);
                        }
                        if (Creature* Priest1 = ObjectAccessor::GetCreature(*me, guidPriest[0]))
                        {
                            Priest1->SetFacingTo(5.7421f);
                            Priest1->SetHomePosition(Priest1Pos[1]);
                        }
                        if (Creature* Priest2 = ObjectAccessor::GetCreature(*me, guidPriest[1]))
                        {
                            Priest2->SetFacingTo(5.7421f);
                            Priest2->SetHomePosition(Priest2Pos[1]);
                        }
                        if (Creature* Priest3 = ObjectAccessor::GetCreature(*me, guidPriest[2]))
                        {
                            Priest3->SetFacingTo(5.7421f);
                            Priest3->SetHomePosition(Priest3Pos[1]);
                        }
                        if (Creature* Mason1 = ObjectAccessor::GetCreature(*me, guidMason[0]))
                        {
                            Mason1->GetMotionMaster()->MovePoint(0, Mason1Pos[2]);
                            Mason1->SetHomePosition(Mason1Pos[2]);
                        }
                        if (Creature* Mason2 = ObjectAccessor::GetCreature(*me, guidMason[1]))
                        {
                            Mason2->GetMotionMaster()->MovePoint(0, Mason2Pos[2]);
                            Mason2->SetHomePosition(Mason2Pos[2]);
                        }
                        if (Creature* Mason3 = ObjectAccessor::GetCreature(*me, guidMason[2]))
                        {
                            Mason3->GetMotionMaster()->MovePoint(0, Mason3Pos[2]);
                            Mason3->SetHomePosition(Mason3Pos[2]);
                        }
                        events.ScheduleEvent(EVENT_START_FIGHT, 5000);
                        events.ScheduleEvent(EVENT_MASON_ACTION, 15000);
                    }
                    break;
                case EVENT_MASON_ACTION:
                    {
                        if (Creature* Mason1 = ObjectAccessor::GetCreature(*me, guidMason[0]))
                        {
                            Mason1->SetFacingTo(2.8972f);
                            Mason1->AI()->SetData(1, 1); // triggers SAI actions on npc
                        }
                        if (Creature* Mason2 = ObjectAccessor::GetCreature(*me, guidMason[1]))
                        {
                            Mason2->SetFacingTo(3.1241f);
                            Mason2->AI()->SetData(1, 1); // triggers SAI actions on npc
                        }
                        if (Creature* Mason3 = ObjectAccessor::GetCreature(*me, guidMason[2]))
                        {
                            Mason3->SetFacingTo(3.6651f);
                            Mason3->AI()->SetData(1, 1); // triggers SAI actions on npc
                        }
                    }
                    break;
                case EVENT_START_FIGHT:
                    {
                        if (Creature* LK = GetClosestCreatureWithEntry(me, NPC_LK, 100))
                            LK->AI()->Talk(LK_TALK_1);
                        if (Creature* Dalfors = ObjectAccessor::GetCreature(*me, guidDalfors))
                            Dalfors->AI()->Talk(DALFORS_SAY_START);
                        events.ScheduleEvent(EVENT_WAVE_SPAWN, 1000);
                    }
                    break;
                case EVENT_WAVE_SPAWN:
                    {
                        if (PhaseCount == 3)
                        {
                            if (Creature* LK = GetClosestCreatureWithEntry(me, NPC_LK, 100))
                                LK->AI()->Talk(LK_TALK_2);
                        }
                        else if (PhaseCount == 6)
                        {
                            if (Creature* LK = GetClosestCreatureWithEntry(me, NPC_LK, 100))
                                LK->AI()->Talk(LK_TALK_3);
                        }
                        if (Creature* tempsum = DoSummon(NPC_SCOURGE_DRUDGE, Mason3Pos[0]))
                            {
                                tempsum->SetHomePosition(DalforsPos[2]);
                                tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                            }
                        if (urand(0, 1) == 0)
                        {
                            if (Creature* tempsum = DoSummon(NPC_HIDEOUS_PLAGEBRINGER, Mason1Pos[0]))
                            {
                                tempsum->SetHomePosition(DalforsPos[2]);
                                tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                            }
                            if (Creature* tempsum = DoSummon(NPC_HIDEOUS_PLAGEBRINGER, Mason2Pos[0]))
                            {
                                tempsum->SetHomePosition(DalforsPos[2]);
                                tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                            }
                        }
                        else
                        {
                            if (Creature* tempsum = DoSummon(NPC_REANIMATED_CAPTAIN, Mason1Pos[0]))
                            {
                                tempsum->SetHomePosition(DalforsPos[2]);
                                tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                            }
                            if (Creature* tempsum = DoSummon(NPC_REANIMATED_CAPTAIN, Mason2Pos[0]))
                            {
                                tempsum->SetHomePosition(DalforsPos[2]);
                                tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                            }
                        }

                        PhaseCount++;

                        if (PhaseCount < 8)
                            events.ScheduleEvent(EVENT_WAVE_SPAWN, urand(10000, 20000));
                        else
                            events.ScheduleEvent(EVENT_HALOF, urand(10000, 20000));
                    }
                    break;
                case EVENT_HALOF:
                    {
                        if (Creature* LK = GetClosestCreatureWithEntry(me, NPC_LK, 100))
                            LK->AI()->Talk(LK_TALK_4);
                        if (Creature* tempsum = DoSummon(NPC_SCOURGE_DRUDGE, Mason1Pos[0]))
                        {
                            tempsum->SetHomePosition(DalforsPos[2]);
                            tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                        }
                        if (Creature* tempsum = DoSummon(NPC_SCOURGE_DRUDGE, Mason2Pos[0]))
                        {
                            tempsum->SetHomePosition(DalforsPos[2]);
                            tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                        }
                        if (Creature* tempsum = DoSummon(NPC_HALOF_THE_DEATHBRINGER, DalforsPos[0]))
                        {
                            HalofSpawned = true;
                            guidHalof = tempsum->GetGUID();
                            tempsum->SetHomePosition(DalforsPos[2]);
                            tempsum->AI()->AttackStart(GetClosestCreatureWithEntry(me, NPC_BLESSED_BANNER, 100));
                        }
                    }
                    break;
                case EVENT_ENDED:
                    {
                        Summons.DespawnAll();
                        me->DespawnOrUnsummon();
                    }
                    break;
            }

            if (PhaseCount == 8)
                if (Creature* Halof = ObjectAccessor::GetCreature(*me, guidHalof))
                    if (Halof->isDead())
                    {
                        DoCast(me, SPELL_CRUSADERS_SPIRE_VICTORY, true);
                        Summons.DespawnEntry(NPC_HIDEOUS_PLAGEBRINGER);
                        Summons.DespawnEntry(NPC_REANIMATED_CAPTAIN);
                        Summons.DespawnEntry(NPC_SCOURGE_DRUDGE);
                        Summons.DespawnEntry(NPC_HALOF_THE_DEATHBRINGER);
                        if (Creature* Dalfors = ObjectAccessor::GetCreature(*me, guidDalfors))
                            Dalfors->AI()->Talk(DALFORS_YELL_FINISHED);
                        events.ScheduleEvent(EVENT_ENDED, 10000);
                    }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_blessed_bannerAI(creature);
    }
};

/*######
## Borrowed Technology - Id: 13291, The Solution Solution (daily) - Id: 13292, Volatility - Id: 13239, Volatiliy - Id: 13261 (daily)
######*/

enum BorrowedTechnologyAndVolatility
{
    // Spells
    SPELL_GRAB             = 59318,
    SPELL_PING_BUNNY       = 59375,
    SPELL_IMMOLATION       = 54690,
    SPELL_EXPLOSION        = 59335,
	SPELL_RIDE			   = 59319,


    // Points
    POINT_GRAB_DECOY       = 1,
    POINT_FLY_AWAY         = 2,

    // Events
    EVENT_FLY_AWAY         = 1
};

class npc_frostbrood_skytalon : public CreatureScript
{
    public:
        npc_frostbrood_skytalon() : CreatureScript("npc_frostbrood_skytalon") { }

        struct npc_frostbrood_skytalonAI : public VehicleAI
        {
            npc_frostbrood_skytalonAI(Creature* creature) : VehicleAI(creature) { }

            EventMap events;

            void IsSummonedBy(Unit* summoner) override
            {
                me->GetMotionMaster()->MovePoint(POINT_GRAB_DECOY, summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ());
            }

            void MovementInform(uint32 type, uint32 id) override
            {
                if (type != POINT_MOTION_TYPE)
                    return;

                if (id == POINT_GRAB_DECOY)
                    if (TempSummon* summon = me->ToTempSummon())
                        if (Unit* summoner = summon->GetSummoner())
                            DoCast(summoner, SPELL_GRAB);
            }

            void UpdateAI(uint32 diff) override
            {
                VehicleAI::UpdateAI(diff);
                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    if (eventId == EVENT_FLY_AWAY)
                    {
                        Position randomPosOnRadius;
                        randomPosOnRadius.m_positionZ = (me->GetPositionZ() + 40.0f);
                        me->GetNearPoint2D(randomPosOnRadius.m_positionX, randomPosOnRadius.m_positionY, 40.0f, me->GetAngle(me));
                        me->GetMotionMaster()->MovePoint(POINT_FLY_AWAY, randomPosOnRadius);
                    }
                }
            }

            void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
            {
                switch (spell->Id)
                {
                    case SPELL_EXPLOSION:
                        DoCast(me, SPELL_IMMOLATION);
                        break;
                    case SPELL_RIDE:
                        DoCastAOE(SPELL_PING_BUNNY);
                        events.ScheduleEvent(EVENT_FLY_AWAY, 100);
                        break;
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_frostbrood_skytalonAI(creature);
        }
};


/*######
## Infra Green Bomber Quests
######*/

enum infraGreenBomberQuests
{
    SPELL_ENGINEERING           = 59193,
    SPELL_BOMBER_BAY            = 59194,
    SPELL_ANTI_AIR_TURRET       = 59196,

    SPELL_CHARGE_SHIELD         = 59061,
    SPELL_INFRA_GREEN_SHIELD    = 59288,
    SPELL_SHIELD_VISUAL         = 59290,

    SPELL_BURNING               = 61171,
    SPELL_COSMETIC_FIRE         = 51195,
    SPELL_EXTINGUISH_FIRE       = 61172,

    SPELL_WAITING_FOR_A_BOMBER  = 59563,
    SPELL_FLIGHT_ORDERS         = 61281,
    SPELL_PARACHUTE             = 44795,

    NPC_GARGOYLE                = 32769,
    NPC_SENTRY                  = 32767,
    NPC_SHIELD_BUNNY            = 32256,

    EVENT_TAKE_PASSENGER        = 1,
    EVENT_START_FLIGHT          = 2,
    EVENT_CHECK_PATH_REGEN_HEALTH_BURN_DAMAGE           = 3,
    EVENT_SYNCHRONIZE_SHIELDS   = 4,
    EVENT_SPREAD_FIRE           = 5,

    SEAT_BOMBER                 = 0,
    SEAT_TURRET                 = 1,
    SEAT_ENGINEERING            = 2
};

class spell_switch_infragreen_bomber_station : public SpellScriptLoader
{
    public:
        spell_switch_infragreen_bomber_station() : SpellScriptLoader("spell_switch_infragreen_bomber_station") { }

        class spell_switch_infragreen_bomber_station_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_switch_infragreen_bomber_station_SpellScript);

            uint8 GetSeatNumber(uint32 spellId)
            {
                if (spellId == SPELL_ENGINEERING)
                    return 2;
                else if (spellId == SPELL_ANTI_AIR_TURRET)
                    return 1;
                else
                    return 0;
            }

            void HandleDummy(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Vehicle* kit = GetCaster()->GetVehicle();
                Unit* charmer = GetCaster()->GetCharmer(); // Player controlling station
                if (!kit || !charmer)
                    return;

                uint8 seatNumber = GetSeatNumber(GetSpellInfo()->Id);
                SeatMap::iterator itr = kit->GetSeatIteratorForPassenger(GetCaster());
                if (itr == kit->Seats.end())
                    return;

                // Xinef: Same seat, no change required
                if (seatNumber == itr->first)
                    return;

                if (Unit* station = kit->GetPassenger(seatNumber))
                    station->HandleSpellClick(charmer, 0);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_switch_infragreen_bomber_station_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_switch_infragreen_bomber_station_SpellScript();
        }

};

class spell_charge_shield_bomber : public SpellScriptLoader
{
    public:
        spell_charge_shield_bomber() : SpellScriptLoader("spell_charge_shield_bomber") { }

        class spell_charge_shield_bomber_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_charge_shield_bomber_SpellScript);

            void HandleDummy(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit* ship = GetCaster()->GetVehicleBase();
                if (!ship)
                    return;

                ship->CastSpell(ship, SPELL_INFRA_GREEN_SHIELD, true);
                Aura* aura = ship->GetAura(SPELL_INFRA_GREEN_SHIELD);
                if (!aura)
                    return;

                aura->ModStackAmount(GetEffectValue() - 1);
            }

            void Register() override
            {
                if (m_scriptSpellId == SPELL_CHARGE_SHIELD)
                    OnEffectHitTarget += SpellEffectFn(spell_charge_shield_bomber_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_charge_shield_bomber_SpellScript();
        }

        class spell_charge_shield_bomber_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_charge_shield_bomber_AuraScript);

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32 & amount, bool & /*canBeRecalculated*/)
            {
                // Set absorbtion amount to unlimited
                amount = -1;
            }

            void Absorb(AuraEffect* /*aurEff*/, DamageInfo & dmgInfo, uint32 & absorbAmount)
            {
                //uint32 absorbPct = GetStackAmount()/2;
                uint32 absorbPct = GetStackAmount();
                absorbAmount = CalculatePct(dmgInfo.GetDamage(), absorbPct);
                ModStackAmount(-1);
            }

            void Register() override
            {
                if (m_scriptSpellId == SPELL_INFRA_GREEN_SHIELD)
                {
                    DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_charge_shield_bomber_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
                    OnEffectAbsorb += AuraEffectAbsorbFn(spell_charge_shield_bomber_AuraScript::Absorb, EFFECT_0);
                }
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_charge_shield_bomber_AuraScript();
        }
};

class spell_fight_fire_bomber : public SpellScriptLoader
{
    public:
        spell_fight_fire_bomber() : SpellScriptLoader("spell_fight_fire_bomber") { }

        class spell_fight_fire_bomber_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_fight_fire_bomber_SpellScript);

            void HandleDummy(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Vehicle* kit = GetCaster()->GetVehicle();
                if (!kit)
                    return;

                bool extinguished = false;
                uint8 fireCount = 0;
                for (uint8 seat = 3; seat <= 5; ++seat)
                    if (Unit* banner = kit->GetPassenger(seat))
                        if (banner->HasAura(SPELL_COSMETIC_FIRE))
                        {
                            if (!extinguished)
                            {
                                GetCaster()->CastSpell(banner, SPELL_EXTINGUISH_FIRE, true);
                                extinguished = true;
                                if (urand(0,2))
                                {
                                    banner->RemoveAurasDueToSpell(SPELL_COSMETIC_FIRE);
                                    continue;
                                }
                            }
                            fireCount++;
                        }

                if (fireCount == 0)
                    GetCaster()->RemoveAurasDueToSpell(SPELL_BURNING);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_fight_fire_bomber_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_fight_fire_bomber_SpellScript();
        }
};

class spell_anti_air_rocket_bomber : public SpellScriptLoader
{
    public:
        spell_anti_air_rocket_bomber() : SpellScriptLoader("spell_anti_air_rocket_bomber") { }

        class spell_anti_air_rocket_bomber_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_anti_air_rocket_bomber_SpellScript);

            void HandleDummy(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                const WorldLocation* loc = GetExplTargetDest();
                GetCaster()->CastSpell(loc->GetPositionX(), loc->GetPositionY(), loc->GetPositionZ(), GetSpellInfo()->Effects[effIndex].CalcValue(), true);
            }

            void Register()
            {
                OnEffectLaunch += SpellEffectFn(spell_anti_air_rocket_bomber_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_anti_air_rocket_bomber_SpellScript();
        }
};

class npc_infra_green_bomber_generic : public CreatureScript
{
    public:
        npc_infra_green_bomber_generic(): CreatureScript("npc_infra_green_bomber_generic"){}

        struct npc_infra_green_bomber_genericAI : NullCreatureAI
        {
            npc_infra_green_bomber_genericAI(Creature* creature) : NullCreatureAI(creature)
            {
                events.Reset();
            }

            Unit* GetSummoner()
            {
                if (TempSummon* tempSummon = me->ToTempSummon())
                    return tempSummon->GetSummoner();
                return NULL;
            }

            void IsSummonedBy(Unit* summoner) override
            {
                if (!summoner)
                    return;

                summoner->CastSpell(summoner, SPELL_WAITING_FOR_A_BOMBER, true);
                summoner->CastSpell(summoner, SPELL_FLIGHT_ORDERS, true);
                events.ScheduleEvent(EVENT_START_FLIGHT, 0);
                events.ScheduleEvent(EVENT_TAKE_PASSENGER, 3000);
                me->SetCanFly(true);
                me->AddUnitMovementFlag(MOVEMENTFLAG_FLYING);
                me->SetSpeed(MOVE_FLIGHT, 0.1f);
                me->setFaction(summoner->getFaction());
            }

            void DamageTaken(Unit* who, uint32& damage) override
            {
                if (who != me) {
                    if (me->HealthBelowPct(80) && urand(0,1))
                        SpreadFire(true);
                }

                Creature* shield_bunny = me->FindNearestCreature(NPC_SHIELD_BUNNY, 20.0f);
                shield_bunny->RemoveAurasDueToSpell(SPELL_SHIELD_VISUAL);

                Aura* aura = me->GetAura(SPELL_INFRA_GREEN_SHIELD);
                if (aura) {
                    uint8 stackAmount = aura->GetStackAmount();
                    if (stackAmount) {
                        uint32 absorbPct = stackAmount/1.25;
                        uint32 absorbAmount = CalculatePct(damage, absorbPct);
                        damage -= absorbAmount;
                        uint8 newStack = uint8(stackAmount-1);
                        aura->SetStackAmount(newStack);
                    }
                }
            }

            void JustDied(Unit* /*killer*/) override
            {
                Unit* summoner = GetSummoner();
                summoner->CastSpell(summoner, SPELL_PARACHUTE, true);

                std::list<Creature*> gargoylesList;
                GetCreatureListWithEntryInGrid(gargoylesList, me, NPC_GARGOYLE, 100.0f);
                for (std::list<Creature*>::const_iterator itr = gargoylesList.begin(); itr != gargoylesList.end(); ++itr)
                {
                    (*itr)->DespawnOrUnsummon();
                }

                std::list<Creature*> sentriesList;
                GetCreatureListWithEntryInGrid(sentriesList, me, NPC_SENTRY, 100.0f);
                for (std::list<Creature*>::const_iterator itr = sentriesList.begin(); itr != sentriesList.end(); ++itr)
                {
                    (*itr)->DespawnOrUnsummon();
                }
            }

            void SpreadFire(bool init)
            {
                Vehicle* kit = me->GetVehicleKit();
                if (!kit)
                    return;

                if (Unit* passenger = kit->GetPassenger(SEAT_ENGINEERING))
                    if (init && !passenger->HasAura(SPELL_BURNING))
                    {
                        me->TextEmote("Your Vehicle is burning!", GetSummoner(), true);
                        passenger->AddAura(SPELL_BURNING, passenger);
                    }

                for (uint8 seat = 3; seat <= 5; ++seat)
                    if (Unit* banner = kit->GetPassenger(seat))
                        if (!banner->HasAura(SPELL_COSMETIC_FIRE))
                        {
                            banner->AddAura(SPELL_COSMETIC_FIRE, banner);
                            break;
                        }
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);
                uint32 eventId = events.ExecuteEvent();
                switch (eventId)
                {
                    case EVENT_TAKE_PASSENGER:
                        if (Unit* owner = GetSummoner())
                            if (Vehicle* kit = me->GetVehicleKit())
                                if (Unit* turret = kit->GetPassenger(SEAT_TURRET))
                                {
                                    me->SetSpeed(MOVE_FLIGHT, 1.2f);
                                    owner->RemoveAurasDueToSpell(SPELL_WAITING_FOR_A_BOMBER);
                                    turret->HandleSpellClick(owner, 0);
                                    return;
                                }
                        me->DespawnOrUnsummon(1);
                        break;
                    case EVENT_START_FLIGHT:
                    {
                        WPPath* path = sSmartWaypointMgr->GetPath(me->GetEntry());
                        if (!path || path->empty())
                        {
                            me->DespawnOrUnsummon(1);
                            return;
                        }

                        Movement::PointsArray pathPoints;
                        pathPoints.push_back(G3D::Vector3(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()));

                        uint32 wpCounter = 1;
                        WPPath::const_iterator itr;
                        while ((itr = path->find(wpCounter++)) != path->end())
                        {
                            WayPoint* wp = itr->second;
                            pathPoints.push_back(G3D::Vector3(wp->x, wp->y, wp->z));
                        }

                        me->GetMotionMaster()->MoveSplinePath(&pathPoints);
                        events.ScheduleEvent(EVENT_CHECK_PATH_REGEN_HEALTH_BURN_DAMAGE, 60000);
                        events.ScheduleEvent(EVENT_SYNCHRONIZE_SHIELDS, 5000);
                        break;
                    }
                    case EVENT_CHECK_PATH_REGEN_HEALTH_BURN_DAMAGE:
                    {
                        // Check if path is finished
                        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != ESCORT_MOTION_TYPE)
                        {
                            me->DespawnOrUnsummon(1);
                            return;
                        }

                        // Check fire count
                        uint8 fireCount = 0;
                        if (Vehicle* kit = me->GetVehicleKit())
                            for (uint8 seat = 3; seat <= 5; ++seat)
                                if (Unit* banner = kit->GetPassenger(seat))
                                    if (banner->HasAura(SPELL_COSMETIC_FIRE))
                                        fireCount++;

                        if (fireCount)
                            me->DealDamage(me, 3000*fireCount, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_FIRE);
                        else // Heal
                            me->ModifyHealth(2000);

                        events.ScheduleEvent(EVENT_CHECK_PATH_REGEN_HEALTH_BURN_DAMAGE, 4000);
                        break;
                    }
                    case EVENT_SYNCHRONIZE_SHIELDS:
                        if (Vehicle* kit = me->GetVehicleKit())
                        {
                            // Xinef: check if we have player on any of the stations
                            bool playerPresent = false;
                            uint32 stackAmount = me->GetAuraCount(SPELL_INFRA_GREEN_SHIELD);
                            for (uint8 i = SEAT_BOMBER; i <= SEAT_ENGINEERING; ++i)
                                if (Unit* station = kit->GetPassenger(i))
                                {
                                    if (Vehicle* stationKit = station->GetVehicleKit())
                                        if (stationKit->GetPassenger(0))
                                            playerPresent = true;

                                    if (stackAmount)
                                        station->SetAuraStack(SPELL_INFRA_GREEN_SHIELD, station, stackAmount);
                                    else
                                        station->RemoveAurasDueToSpell(SPELL_INFRA_GREEN_SHIELD);
                                }

                            if (Creature* shield_bunny = me->FindNearestCreature(NPC_SHIELD_BUNNY, 20.0f))
                            {
                                if (stackAmount) {
                                    if (!me->HasAura(SPELL_SHIELD_VISUAL))
                                        me->AddAura(SPELL_SHIELD_VISUAL, shield_bunny);
                                }
                                else                                
                                    shield_bunny->RemoveAurasDueToSpell(SPELL_SHIELD_VISUAL);                                
                            }                               

                            if (!playerPresent)
                                me->DespawnOrUnsummon(1);
                        }
                        events.ScheduleEvent(EVENT_SYNCHRONIZE_SHIELDS, 1000);
                        break;
                    case EVENT_SPREAD_FIRE:
                        break;
                }
            }

            private:
                EventMap events;

        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_infra_green_bomber_genericAI(creature);
        }
};

/*######
## npc_gargoyle_ambusher
## npc_frostbrood_sentry
######*/

enum GargoyleAndSentry
{
    BOMBER1 = 31406,
    BOMBER2 = 32512,
    BOMBER3 = 31838,
    BOMBER4 = 32513,
    SPELL_AMBUSHER_STRIKE = 60239,
    SPELL_BITTER_BLAST = 60542,
    SPELL_ANTI_AIR_ROCKET = 59622,
    GARGOYLE_KILL_CREDIT = 32188,
    SENTRY_KILL_CREDIT = 31721
};

class npc_gargoyle_ambusher : public CreatureScript
{
public:
    npc_gargoyle_ambusher() : CreatureScript("npc_gargoyle_ambusher") { }

    struct npc_gargoyle_ambusherAI : public ScriptedAI
    {
        npc_gargoyle_ambusherAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        uint32 uiAmbusherTimer;
        ObjectGuid PlayerGUID;

        void Reset() override
        {
            Initialize();
        }

        void Initialize()
        {
            uiAmbusherTimer = 3000;
            me->m_CombatDistance = 100.0f;
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (!who || who->GetTypeId() == TYPEID_PLAYER)
                return;

            if (who->IsVehicle() && (who->GetGUID() == BOMBER1 || who->GetGUID() == BOMBER2 || who->GetGUID() == BOMBER3 || who->GetGUID() == BOMBER4))
                AttackStart(who);
            else return;

            CreatureAI::MoveInLineOfSight(who);
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
        {
            if (spell->Id == SPELL_ANTI_AIR_ROCKET)
                me->DealDamage(me, (me->GetMaxHealth() * 0.4), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

            if(Player* player = me->SelectNearestPlayer(100.0f))
                PlayerGUID = player->GetGUID();
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
            {
                player->KilledMonsterCredit(GARGOYLE_KILL_CREDIT);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (!me || !me->IsInCombat() || !me->GetVictim())
                return;

            if (uiAmbusherTimer <= diff)
            {
                if (me->IsInRange(me->GetVictim(), 0.0f, 40.0f))
                    DoCastVictim(SPELL_AMBUSHER_STRIKE);
                uiAmbusherTimer = 1500;
            } else uiAmbusherTimer -= diff;

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_gargoyle_ambusherAI(creature);
    }
};

class npc_frostbrood_sentry : public CreatureScript
{
public:
    npc_frostbrood_sentry() : CreatureScript("npc_frostbrood_sentry") { }

    struct npc_frostbrood_sentryAI : public ScriptedAI
    {
        npc_frostbrood_sentryAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        uint32 uiBitterTimer;
        ObjectGuid PlayerGUID;

        void Reset() override
        {
            Initialize();
        }

        void Initialize()
        {
            uiBitterTimer = 2000;
            me->m_CombatDistance = 100.0f;
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (!who || who->GetTypeId() == TYPEID_PLAYER)
                return;

            if (who->IsVehicle() && (who->GetGUID() == BOMBER1 || who->GetGUID() == BOMBER2 || who->GetGUID() == BOMBER3 || who->GetGUID() == BOMBER4))
                AttackStart(who);
            else return;

            CreatureAI::MoveInLineOfSight(who);
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
        {
            if (spell->Id == SPELL_ANTI_AIR_ROCKET)
                me->DealDamage(me, (me->GetMaxHealth() * 0.4), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

            if(Player* player = me->SelectNearestPlayer(100.0f))
                PlayerGUID = player->GetGUID();
        }

        void JustDied(Unit* /*killer*/) override
        {
            if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
            {
                player->KilledMonsterCredit(SENTRY_KILL_CREDIT);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (!me || !me->IsInCombat() || !me->GetVictim())
                return;

            if (uiBitterTimer <= diff)
            {
                if (me->IsInRange(me->GetVictim(), 0.0f, 40.0f))
                    DoCastVictim(SPELL_BITTER_BLAST);
                uiBitterTimer = 2000;
            } else uiBitterTimer -= diff;

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_frostbrood_sentryAI(creature);
    }
};

enum tirionsGambit
{
    ACTION_START_EVENT          = 1,
    ACTION_SUMMON_MOVE_STRAIGHT = 2,
    ACTION_SUMMON_EMOTE         = 3,
    ACTION_SUMMON_DESPAWN       = 4,
    ACTION_SUMMON_ORIENTATION   = 5,
    ACTION_SUMMON_TALK          = 6,
    ACTION_SUMMON_STAND_STATE   = 7,

    EVENT_START_SCENE           = 1,
    EVENT_SCENE_0               = 2,

    NPC_DISGUISED_CRUSADER      = 32241,
    NPC_GAMBIT_TIRION_FORDRING  = 32239,
    NPC_INVOKER_BASALEPH        = 32272,
    NPC_CHOSEN_ZEALOT           = 32175,
    NPC_TIRION_LICH_KING        = 32184,
    NPC_TIRION_EBON_KNIGHT      = 32309,
    NPC_TIRION_THASSARIAN       = 32310,
    NPC_TIRION_KOLTIRA          = 32311,
    NPC_TIRION_MOGRAINE         = 32312,

    GO_FROZEN_HEART             = 193794,
    GO_ESCAPE_PORTAL            = 193941,

    SPELL_TIRION_SMASH_HEART    = 60456,
    SPELL_HEART_EXPLOSION       = 60484,
    SPELL_HEART_EXPLOSION_EFF   = 60532,
    SPELL_LICH_KINGS_FURY       = 60536,
    SPELL_TIRIONS_GAMBIT_CREDIT = 61487,
};

class npc_tirions_gambit_tirion : public CreatureScript
{
    public:
        npc_tirions_gambit_tirion(): CreatureScript("npc_tirions_gambit_tirion"){}

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->AI()->DoAction(ACTION_START_EVENT);
            return true;
        }

        struct npc_tirions_gambit_tirionAI : public npc_escortAI
        {
            npc_tirions_gambit_tirionAI(Creature* creature) : npc_escortAI(creature), summons(me)
            {
            }

            EventMap events;
            SummonList summons;

            void Reset()
            {
                me->setActive(false);
                me->SetStandState(UNIT_STAND_STATE_STAND);
            }

            void SetData(uint32 type, uint32 data)
            {
                if (type == 1 && data == 1)
                    events.ScheduleEvent(EVENT_SCENE_0+30, 10000);
            }


            void DoAction(int32 param)
            {
                if (param == ACTION_START_EVENT)
                {
                    me->setActive(true);

                    Talk(0);
                    events.Reset();
                    summons.DespawnAll();
                    Start(false, false);

                    int8 i = -1;
                    std::list<Creature*> cList;
                    GetCreatureListWithEntryInGrid(cList, me, NPC_DISGUISED_CRUSADER, 15.0f);
                    for (std::list<Creature*>::const_iterator itr = cList.begin(); itr != cList.end(); ++itr, ++i)
                    {
                        (*itr)->SetCorpseDelay(2);
                        (*itr)->SetRespawnTime(60);
                        (*itr)->SetRespawnDelay(60);
                        (*itr)->SetWalk(true);
                        (*itr)->GetMotionMaster()->MoveFollow(me, 1.0f, Position::NormalizeOrientation(M_PI*i/2.0f));
                        summons.Summon(*itr);
                    }
                }
            }

            void JustSummoned(Creature* summon)
            {
                summons.Summon(summon);
                if (summon->GetEntry() == NPC_CHOSEN_ZEALOT || summon->GetEntry() == NPC_TIRION_LICH_KING)
                    summon->SetWalk(true);
                else if (summon->GetEntry() != NPC_INVOKER_BASALEPH)
                {
                    summon->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY2H);
                    summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC|UNIT_FLAG_IMMUNE_TO_NPC);
                    summon->GetMotionMaster()->MovePoint(4, 6135.97f, 2753.84f, 573.92f);
                }
            }

            void SummonedCreatureDespawn(Creature* summon)
            {
                summons.Despawn(summon);
            }

            void WaypointReached(uint32 pointId)
            {
                switch (pointId)
                {
                    case 6:
                        me->SummonCreature(NPC_INVOKER_BASALEPH, 6130.26f, 2764.83f, 573.92f, 5.19f, TEMPSUMMON_TIMED_DESPAWN, 10*MINUTE*IN_MILLISECONDS);
                        Talk(1);
                        break;
                    case 15:
                    {
                        uint8 i = 1;
                        for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr, ++i)
                            if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                                if (summon->GetEntry() == NPC_DISGUISED_CRUSADER)
                                {
                                    summon->GetMotionMaster()->Clear(false);
                                    summon->GetMotionMaster()->MovePoint(1, 6165.3f + 3*i, 2759.85f + 1.5f*i, 573.914f);
                                }
                        break;
                    }
                    case 17:
                        SetEscortPaused(true);
                        events.ScheduleEvent(EVENT_START_SCENE, 7000);
                        break;
                    case 19:
                        SetEscortPaused(true);
                        events.ScheduleEvent(EVENT_SCENE_0+8, 5000);
                        break;
                }
            }

            void DoSummonAction(uint32 entry, uint8 id, int32 param = 0)
            {
                for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
                    if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                        if (summon->GetEntry() == entry)
                        {
                            switch (id)
                            {
                                case ACTION_SUMMON_MOVE_STRAIGHT:
                                    summon->GetMotionMaster()->MovePoint(1, summon->GetPositionX()-param, summon->GetPositionY()+param*2+3, summon->GetPositionZ());
                                    break;
                                case ACTION_SUMMON_EMOTE:
                                    summon->SetUInt32Value(UNIT_NPC_EMOTESTATE, param);
                                    break;
                                case ACTION_SUMMON_DESPAWN:
                                    summon->DespawnOrUnsummon(param);
                                    break;
                                case ACTION_SUMMON_ORIENTATION:
                                    summon->SetFacingTo(param/100.0f);
                                    break;
                                case ACTION_SUMMON_TALK:
                                    summon->AI()->Talk(param);
                                    break;
                                case ACTION_SUMMON_STAND_STATE:
                                    summon->SetStandState(param);
                                    break;
                            }
                        }
            }

            void UpdateEscortAI(uint32 diff)
            {
                events.Update(diff);
                switch (events.ExecuteEvent())
                {
                    case EVENT_START_SCENE:
                        Talk(2);
                        DoSummonAction(NPC_DISGUISED_CRUSADER, ACTION_SUMMON_ORIENTATION, 200);

                        me->SummonCreature(NPC_CHOSEN_ZEALOT, 6160.74f, 2695.90f, 573.92f, 2.04f, TEMPSUMMON_TIMED_DESPAWN, 5*MINUTE*IN_MILLISECONDS);
                        me->SummonCreature(NPC_CHOSEN_ZEALOT, 6164.98f, 2697.90f, 573.92f, 2.04f, TEMPSUMMON_TIMED_DESPAWN, 5*MINUTE*IN_MILLISECONDS);
                        me->SummonCreature(NPC_CHOSEN_ZEALOT, 6161.26f, 2700.05f, 573.92f, 2.04f, TEMPSUMMON_TIMED_DESPAWN, 5*MINUTE*IN_MILLISECONDS);

                        DoSummonAction(NPC_CHOSEN_ZEALOT, ACTION_SUMMON_MOVE_STRAIGHT, 27);
                        events.ScheduleEvent(EVENT_SCENE_0, 30000);
                        break;
                    case EVENT_SCENE_0:
                        DoSummonAction(NPC_CHOSEN_ZEALOT, ACTION_SUMMON_STAND_STATE, UNIT_STAND_STATE_KNEEL);
                        me->SummonGameObject(GO_FROZEN_HEART, 6132.38f, 2760.76f, 574.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 180);
                        events.ScheduleEvent(EVENT_SCENE_0+1, 10000);
                        break;
                    case EVENT_SCENE_0+1:
                        DoSummonAction(NPC_CHOSEN_ZEALOT, ACTION_SUMMON_STAND_STATE, UNIT_STAND_STATE_STAND);
                        events.ScheduleEvent(EVENT_SCENE_0+2, 2000);
                        break;
                    case EVENT_SCENE_0+2:
                        DoSummonAction(NPC_CHOSEN_ZEALOT, ACTION_SUMMON_MOVE_STRAIGHT, -27);
                        DoSummonAction(NPC_CHOSEN_ZEALOT, ACTION_SUMMON_DESPAWN, 20000);
                        events.ScheduleEvent(EVENT_SCENE_0+3, 2000);
                        break;
                    case EVENT_SCENE_0+3:
                        Talk(3);
                        if (Creature* cr = me->SummonCreature(NPC_TIRION_LICH_KING, 6161.26f, 2700.05f, 573.92f, 2.04f, TEMPSUMMON_TIMED_DESPAWN, 5 * MINUTE*IN_MILLISECONDS))
                        {
                            cr->GetMotionMaster()->MovePoint(2, 6131.93f, 2756.84f, 573.92f);
                            cr->setActive(true);
                        };
                        events.ScheduleEvent(EVENT_SCENE_0 + 4, 4000);
                        break;
                    case EVENT_SCENE_0+4:
                        Talk(4);
                        me->SetFacingTo(4.42f);
                        events.ScheduleEvent(EVENT_SCENE_0+5, 25000);
                        break;
                    case EVENT_SCENE_0+5:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_ORIENTATION, 11);
                        events.ScheduleEvent(EVENT_SCENE_0+6, 4000);
                        break;
                    case EVENT_SCENE_0+6:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 0);
                        me->LoadEquipment(2, true);
                        SetEscortPaused(false);
                        events.ScheduleEvent(EVENT_SCENE_0+7, 6000);
                        break;
                    case EVENT_SCENE_0+7:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 1);
                        break;
                    case EVENT_SCENE_0+8:
                        Talk(5);
                        events.ScheduleEvent(EVENT_SCENE_0+9, 5000);
                        break;
                    case EVENT_SCENE_0+9:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 2);
                        events.ScheduleEvent(EVENT_SCENE_0+10, 11000);
                        break;
                    case EVENT_SCENE_0+10:
                        Talk(6);
                        events.ScheduleEvent(EVENT_SCENE_0+11, 6000);
                        break;
                    case EVENT_SCENE_0+11:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 3);
                        events.ScheduleEvent(EVENT_SCENE_0+12, 7000);
                        break;
                    case EVENT_SCENE_0+12:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 4);
                        events.ScheduleEvent(EVENT_SCENE_0+13, 5000);
                        break;
                    case EVENT_SCENE_0+13:
                        Talk(7);
                        events.ScheduleEvent(EVENT_SCENE_0+14, 14000);
                        break;
                    case EVENT_SCENE_0+14:
                        Talk(8);
                        events.ScheduleEvent(EVENT_SCENE_0+15, 3000);
                        break;
                    case EVENT_SCENE_0+15:
                    {
                        me->CastSpell(me, SPELL_TIRION_SMASH_HEART, true);
                        events.ScheduleEvent(EVENT_SCENE_0+16, 1200);
                        uint8 i = 0;
                        for (SummonList::iterator itr = summons.begin(); itr != summons.end(); ++itr, ++i)
                            if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                                if (summon->GetEntry() == NPC_DISGUISED_CRUSADER)
                                {
                                    summon->SetWalk(false);
                                    summon->GetMotionMaster()->MovePoint(2, 6132.38f + 4*cos(2*M_PI*(i/3.0)), 2760.76f + 4*sin(2*M_PI*(i/3.0)), me->GetPositionZ());
                                }
                        break;
                    }
                    case EVENT_SCENE_0+16:
                        me->CastSpell(me, SPELL_HEART_EXPLOSION, true);
                        me->CastSpell(me, SPELL_HEART_EXPLOSION_EFF, true);
                        me->SetStandState(UNIT_STAND_STATE_DEAD);
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 5);
                        if (GameObject* go = me->FindNearestGameObject(GO_FROZEN_HEART, 20.0f))
                            go->Delete();
                        events.ScheduleEvent(EVENT_SCENE_0+17, 2000);
                        break;
                    case EVENT_SCENE_0+17:
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_STAND_STATE, UNIT_STAND_STATE_KNEEL);
                        events.ScheduleEvent(EVENT_SCENE_0+170, 3000);
                        break;
                    case EVENT_SCENE_0+170:
                        DoSummonAction(NPC_DISGUISED_CRUSADER, ACTION_SUMMON_ORIENTATION, 500);
                        DoSummonAction(NPC_DISGUISED_CRUSADER, ACTION_SUMMON_EMOTE, EMOTE_STATE_READY2H);
                        if (Creature* cr = me->FindNearestCreature(NPC_DISGUISED_CRUSADER, 10.0f))
                            cr->AI()->Talk(0);
                        events.ScheduleEvent(EVENT_SCENE_0+18, 1000);
                        break;
                    case EVENT_SCENE_0+18:
                    {
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_TALK, 6);

                        std::list<Creature*> zealotList;
                        Position pos1 = {6160.0f, 2765.0f, 573.92f, 0.0f};
                        Position pos2 = {6115.0f, 2742.0f, 573.92f, 0.0f};
                        GetCreatureListWithEntryInGrid(zealotList, me, NPC_CHOSEN_ZEALOT, 100.0f);
                        for (std::list<Creature*>::const_iterator itr = zealotList.begin(); itr != zealotList.end(); ++itr)
                        {
                            (*itr)->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY_UNARMED);
                            if ((*itr)->GetPositionX() > 6150.0f)
                            {
                                Position tpos = pos1;
                                (*itr)->MovePosition(tpos, frand(1.0f, 14.0f), frand(3.14f, 4.14f));
                                (*itr)->GetMotionMaster()->MovePoint(3, tpos.GetPositionX(), tpos.GetPositionY(), tpos.GetPositionZ());
                            }
                            else
                            {
                                Position tpos = pos2;
                                (*itr)->MovePosition(tpos, frand(1.0f, 14.0f), frand(0.0f, 1.0f));
                                (*itr)->GetMotionMaster()->MovePoint(3, tpos.GetPositionX(), tpos.GetPositionY(), tpos.GetPositionZ());
                            }
                        }

                        events.ScheduleEvent(EVENT_SCENE_0+19, 3000);
                        break;
                    }
                    case EVENT_SCENE_0+19:
                        me->SummonCreatureGroup(1);
                        events.ScheduleEvent(EVENT_SCENE_0+20, 3700);
                        break;
                    case EVENT_SCENE_0+20:
                    {
                        for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
                            if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                            {
                                summon->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC|UNIT_FLAG_IMMUNE_TO_NPC);
                                if (summon->GetEntry() >= NPC_TIRION_EBON_KNIGHT && summon->GetEntry() <= NPC_TIRION_MOGRAINE)
                                {
                                    if (summon->GetEntry() == NPC_TIRION_MOGRAINE)
                                        summon->SetHomePosition(6135.97f, 2753.84f, 573.92f, 3.70f);
                                    else
                                        summon->SetHomePosition(6138.36f+frand(-2.0f, 2.0f), 2749.25f+frand(-2.0f, 2.0f), 573.92f, 2.03f);
                                }
                            }
                        DoSummonAction(NPC_TIRION_THASSARIAN, ACTION_SUMMON_TALK, 0);
                        std::list<Creature*> zealotList;
                        GetCreatureListWithEntryInGrid(zealotList, me, NPC_CHOSEN_ZEALOT, 100.0f);
                        Unit* target = me->FindNearestCreature(NPC_TIRION_MOGRAINE, 100.0f);
                        for (std::list<Creature*>::const_iterator itr = zealotList.begin(); itr != zealotList.end(); ++itr)
                        {
                            if (!target)
                                target = (*itr)->SelectNearestTarget(40.0f);
                            if (target)
                                (*itr)->AI()->AttackStart(target);
                        }

                        break;
                    }
                    case EVENT_SCENE_0+30:
                        for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
                            if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                                if (summon->GetEntry() >= NPC_TIRION_EBON_KNIGHT && summon->GetEntry() <= NPC_TIRION_MOGRAINE)
                                {
                                    if (summon->GetEntry() == NPC_TIRION_MOGRAINE)
                                        summon->GetMotionMaster()->MovePoint(6, 6135.97f, 2753.84f, 573.92f);
                                    else
                                        summon->GetMotionMaster()->MovePoint(6, 6138.36f+frand(-2.0f, 2.0f), 2749.25f+frand(-2.0f, 2.0f), 573.92f);
                                }

                        events.ScheduleEvent(EVENT_SCENE_0+310, 4000);
                        break;
                    case EVENT_SCENE_0+310:
                        DoSummonAction(NPC_TIRION_MOGRAINE, ACTION_SUMMON_TALK, 0);
                        DoSummonAction(NPC_TIRION_LICH_KING, ACTION_SUMMON_STAND_STATE, UNIT_STAND_STATE_STAND);
                        me->SummonGameObject(GO_ESCAPE_PORTAL, 6133.83f, 2757.24f, 573.914f, 1.97f, 0.0f, 0.0f, 0.0f, 0.0f, 60);
                        me->CastSpell(me, SPELL_TIRIONS_GAMBIT_CREDIT, true);
                        events.ScheduleEvent(EVENT_SCENE_0+31, 6000);
                        DoSummonAction(NPC_DISGUISED_CRUSADER, ACTION_SUMMON_EMOTE, EMOTE_ONESHOT_NONE);
                        break;
                    case EVENT_SCENE_0+31:
                        DoSummonAction(NPC_TIRION_THASSARIAN, ACTION_SUMMON_TALK, 1);
                        events.ScheduleEvent(EVENT_SCENE_0+32, 7000);
                        break;
                    case EVENT_SCENE_0+32:
                        DoSummonAction(NPC_TIRION_MOGRAINE, ACTION_SUMMON_TALK, 1);
                        events.ScheduleEvent(EVENT_SCENE_0+33, 7000);
                        break;
                    case EVENT_SCENE_0+33:
                        for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
                            if (Creature* summon = ObjectAccessor::GetCreature(*me, *itr))
                            {
                                if (summon->GetEntry() == NPC_TIRION_LICH_KING)
                                    summon->CastSpell(summon, SPELL_LICH_KINGS_FURY, false);
                                summon->DespawnOrUnsummon(summon->GetEntry() == NPC_TIRION_LICH_KING ? 10000 : 4000);
                            }
                        me->SetCorpseDelay(2);
                        me->SetRespawnTime(60);
                        me->SetRespawnDelay(60);
                        me->DespawnOrUnsummon(10000);
                        break;
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_tirions_gambit_tirionAI(creature);
        }
};


/*######
## npc_vargul_assailant
## npc_grimmr_hound
######*/

enum SumParts
{
    NPC_NERGELD = 30403,
    SPELL_CHOP = 43410,
    SPELL_SUM_IS_GREATER = 32067
};

class npc_vargul_assailant : public CreatureScript
{
public:
    npc_vargul_assailant() : CreatureScript("npc_vargul_assailant") { }

    struct npc_vargul_assailantAI : public ScriptedAI
    {
        npc_vargul_assailantAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        uint32 uiChopTimer;
        uint32 uiSearchNergeldTimer;

        void Reset() override
        {
            Initialize();
        }

        void Initialize()
        {
            uiChopTimer = 4500;
            uiSearchNergeldTimer = 3000;
        }

        void IsSummonedBy(Unit* summoner) override
        {
            me->GetMotionMaster()->MovePoint(1, summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ());
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
        {
            if (spell->Id == SPELL_SUM_IS_GREATER)
                me->DespawnOrUnsummon();
        }

        void UpdateAI(uint32 diff) override
        {
            bool ooc = false;

            if (!me)
                return;

            if (!me->IsInCombat() || !me->GetVictim())
                ooc = true;

            if (uiChopTimer <= diff && !ooc)
            {
                if (me->IsInRange(me->GetVictim(), 0.0f, 3.0f))
                    DoCastVictim(SPELL_CHOP);
                uiChopTimer = 5599;
            } else uiChopTimer -= diff;

            if (uiSearchNergeldTimer <= diff)
            {
                Creature* nergeld = me->FindNearestCreature(NPC_NERGELD, 80.0f);
                if (!nergeld)
                {
                    me->DespawnOrUnsummon();
                    return;
                } else {
                    if (me->IsInRange(nergeld, 0.0f, 1.0f)) {
                        AttackStart(nergeld);
                    }
                }
                uiSearchNergeldTimer = 2000;
            } else uiSearchNergeldTimer -= diff;

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_vargul_assailantAI(creature);
    }
};

class npc_grimmr_hound : public CreatureScript
{
public:
    npc_grimmr_hound() : CreatureScript("npc_grimmr_hound") { }

    struct npc_grimmr_houndAI : public ScriptedAI
    {
        npc_grimmr_houndAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        uint32 uiSearchNergeldTimer;

        void Reset() override
        {
            Initialize();
        }

        void Initialize()
        {
            uiSearchNergeldTimer = 3000;
        }

        void IsSummonedBy(Unit* summoner) override
        {
            me->GetMotionMaster()->MovePoint(1, summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ());
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
        {
            if (spell->Id == SPELL_SUM_IS_GREATER)
                me->DespawnOrUnsummon();
        }

        void UpdateAI(uint32 diff) override
        {
            bool ooc = false;

            if (!me)
                return;

            if (!me->IsInCombat() || !me->GetVictim())
                ooc = true;

            if (uiSearchNergeldTimer <= diff)
            {
                Creature* nergeld = me->FindNearestCreature(NPC_NERGELD, 80.0f);
                if (!nergeld)
                {
                    me->DespawnOrUnsummon();
                    return;
                } else {
                    if (me->IsInRange(nergeld, 0.0f, 1.0f)) {
                        AttackStart(nergeld);
                    }
                }
                uiSearchNergeldTimer = 2000;
            } else uiSearchNergeldTimer -= diff;

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_grimmr_houndAI(creature);
    }
};

enum AssaultByGroundData
{
    EVENT_CHECK_ENEMIES = 1,
    NPC_YMIRHEIM_DEFENDER = 31746,
};

class npc_assault_by_ground_squad_leader : public CreatureScript
{
public:
    npc_assault_by_ground_squad_leader() : CreatureScript("npc_assault_by_ground_squad_leader") { }
    struct npc_assault_by_ground_squad_leaderAI : public SmartAI
    {
        npc_assault_by_ground_squad_leaderAI(Creature* creature) : SmartAI(creature) { _isDataSet = false; }

        void SetData(uint32 type, uint32 value)
        {
            if (type != 1)
                return;
            if (value == 6)
            {
                _isDataSet = true;
                _events.ScheduleEvent(EVENT_CHECK_ENEMIES, Seconds(12));
            }                
        }

        void UpdateAI(uint32 diff) override
        {
            if (!_isDataSet)
                return;

            _events.Update(diff);

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_CHECK_ENEMIES:                    
                    if (!me->IsInCombat())
                        if (Creature* defender = me->FindNearestCreature(NPC_YMIRHEIM_DEFENDER, 30.0f))
                        {
                            me->SetInCombatWith(defender);
                            AttackStart(defender);
                            defender->SetInCombatWith(me);
                            defender->CallForHelp(20.0f);
                        }

                    _events.ScheduleEvent(EVENT_CHECK_ENEMIES, Seconds(3));
                    break;
                default:
                    break;
                }
            }
            SmartAI::UpdateAI(diff);
        }

    private:
        EventMap _events;
        bool _isDataSet;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_assault_by_ground_squad_leaderAI(creature);
    }
};

void AddSC_icecrown()
{
    new npc_argent_valiant;
    new npc_guardian_pavilion;
    new npc_tournament_training_dummy;
    new npc_blessed_banner();
    new npc_frostbrood_skytalon();
    new spell_switch_infragreen_bomber_station();
    new spell_charge_shield_bomber();
    new spell_fight_fire_bomber();
    new spell_anti_air_rocket_bomber();
    new npc_infra_green_bomber_generic();
    new npc_tirions_gambit_tirion();
    new npc_gargoyle_ambusher();
    new npc_frostbrood_sentry();
    new npc_vargul_assailant();
    new npc_grimmr_hound();
    new npc_assault_by_ground_squad_leader();
}
