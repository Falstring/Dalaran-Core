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
#include "GameObjectAI.h"
#include "Player.h"
#include "naxxramas.h"
#include "AchievementMgr.h"

/*


INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -28084, 1, 'Positive Charge - Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-28059, -29659, 0, 'Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28084, -28059, 1, 'Negative Charge - Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-28084, -29660, 0, 'Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39088, -39091, 1, 'Positive Charge - Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-39088, -29659, 0, 'Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39091, -39088, 1, 'Negative Charge - Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-39091, -39092, 0, 'Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -28062, 2, 'Positive polarity immunity');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28084, -28085, 2, 'Negative polarity immunity');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28062, 29659, 0, 'Positive - Positive = stack');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28085, 29660, 0, 'Negative - Negative = stack');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -29660, 2, 'Positive polarity -> Immuni to negative buff stack');





*/

//Stalagg
enum StalaggYells
{
    SAY_STAL_AGGRO          = 0,
    SAY_STAL_SLAY           = 1,
    SAY_STAL_DEATH          = 2
};

enum StalagSpells
{
    SPELL_POWERSURGE        = 28134,
    H_SPELL_POWERSURGE      = 54529,
    SPELL_MAGNETIC_PULL     = 28338,
    SPELL_STALAGG_TESLA     = 28097,

	SPELL_STALAGG_TESLA_CHAIN	=28096
};

//Feugen
enum FeugenYells
{
    SAY_FEUG_AGGRO          = 0,
    SAY_FEUG_SLAY           = 1,
    SAY_FEUG_DEATH          = 2
};

enum FeugenSpells
{
    SPELL_STATICFIELD       = 28135,
    H_SPELL_STATICFIELD     = 54528,
    SPELL_FEUGEN_TESLA      = 28109,

	SPELL_FEUGEN_TESLA_CHAIN	= 28111
};

// Thaddius DoAction
enum ThaddiusActions
{
    ACTION_FEUGEN_RESET,
    ACTION_FEUGEN_DIED,
    ACTION_STALAGG_RESET,
    ACTION_STALAGG_DIED
};

enum TeslaCoils
{
	GO_STALAGG_TESLA_COIL	= 181477,
	GO_FEUGEN_TESLA_COIL	= 181478
};

//generic
#define C_TESLA_COIL            16218           //the coils (emotes "Tesla Coil overloads!")

//Thaddius
enum ThaddiusYells
{
    SAY_GREET               = 0,
    SAY_AGGRO               = 1,
    SAY_SLAY                = 2,
    SAY_ELECT               = 3,
    SAY_DEATH               = 4,
    SAY_SCREAM              = 5
};

enum ThaddiusSpells
{
    SPELL_POLARITY_SHIFT        = 28089,
    SPELL_BALL_LIGHTNING        = 28299,
    SPELL_CHAIN_LIGHTNING       = 28167,
    H_SPELL_CHAIN_LIGHTNING     = 54531,
    SPELL_BERSERK               = 27680,
    SPELL_POSITIVE_CHARGE       = 28062,
    SPELL_POSITIVE_CHARGE_STACK = 29659,
    SPELL_NEGATIVE_CHARGE       = 28085,
    SPELL_NEGATIVE_CHARGE_STACK = 29660,
    SPELL_POSITIVE_POLARITY     = 28059,
    SPELL_NEGATIVE_POLARITY     = 28084,

	SPELL_SHOCK_TESLA 			= 28099
};

enum Events
{
    EVENT_NONE,
    EVENT_SHIFT,
    EVENT_CHAIN,
    EVENT_BERSERK,

	EVENT_OVERLOAD
};

enum Achievement
{
    DATA_POLARITY_SWITCH    = 76047605,
};

class boss_thaddius : public CreatureScript
{
public:
    boss_thaddius() : CreatureScript("boss_thaddius") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<boss_thaddiusAI>(creature);
    }

    struct boss_thaddiusAI : public BossAI
    {
        boss_thaddiusAI(Creature* creature) : BossAI(creature, BOSS_THADDIUS)
        {

            checkFeugenAlive = true;

            if (Creature* pFeugen = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN)))
			{
                checkFeugenAlive = pFeugen->IsAlive();

			}

            checkStalaggAlive = true;

            if (Creature* pStalagg = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG)))
			{
                checkStalaggAlive = pStalagg->IsAlive();

			}

            if (!checkFeugenAlive && !checkStalaggAlive)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_AGGRESSIVE);
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_PASSIVE);			
            }


			if(GameObject* goFeugenTesla = me->FindNearestGameObject(GO_FEUGEN_TESLA_COIL, 100.f))
			{
				goFeugenTesla->setActive(true);
				goFeugenTesla->SetGoState(GO_STATE_ACTIVE);
			}

			if(GameObject* goStalaggTesla = me->FindNearestGameObject(GO_STALAGG_TESLA_COIL, 100.f))
			{
				goStalaggTesla->setActive(true);
				goStalaggTesla->SetGoState(GO_STATE_ACTIVE);
			}

			me->AddAura(59123, me);
        }

        bool checkStalaggAlive;
        bool checkFeugenAlive;
        bool polaritySwitch;
        uint32 uiAddsTimer;

		void Reset() override
		{						
			_Reset();
            if (Creature* pFeugen = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN)))			
				if(!pFeugen->IsAlive())
				{
					pFeugen->Respawn();
					checkFeugenAlive = true;
				}
			
			if (Creature* pStalagg = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG)))
				if(!pStalagg->IsAlive())
				{
					pStalagg->Respawn();
					checkStalaggAlive = true;
				}

			if(GameObject* goFeugenTesla = me->FindNearestGameObject(GO_FEUGEN_TESLA_COIL, 100.f))
			{
				goFeugenTesla->setActive(true);
				goFeugenTesla->SetGoState(GO_STATE_ACTIVE);
			}

			if(GameObject* goStalaggTesla = me->FindNearestGameObject(GO_STALAGG_TESLA_COIL, 100.f))
			{
				goStalaggTesla->setActive(true);
				goStalaggTesla->SetGoState(GO_STATE_ACTIVE);
			}
			polaritySwitch = true;
			events.Reset();
		}

        void KilledUnit(Unit* /*victim*/) override
        {
            if (!(rand()%5))
                Talk(SAY_SLAY);
        }

        void JustDied(Unit* /*killer*/) override
        {
			/*if (polaritySwitch) // Need a proper rework.
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
							if (AchievementEntry const* shocking = sAchievementMgr->GetAchievement(RAID_MODE(2178, 2179)))
								player->CompletedAchievement(shocking);
						}
					}
				}
			}*/

            _JustDied();
            Talk(SAY_DEATH);
        }

        void DoAction(int32 action) override
        {
            switch (action)
            {
                case ACTION_FEUGEN_RESET:
                    checkFeugenAlive = true;
                    break;
                case ACTION_FEUGEN_DIED:
                    checkFeugenAlive = false;
                    break;
                case ACTION_STALAGG_RESET:
                    checkStalaggAlive = true;
                    break;
                case ACTION_STALAGG_DIED:
                    checkStalaggAlive = false;
                    break;
            }

            if (!checkFeugenAlive && !checkStalaggAlive)
            {

				_EnterCombat();
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
                me->SetReactState(REACT_PASSIVE);
            }
        }

        void EnterCombat(Unit* /*who*/) override
        {                        
			events.ScheduleEvent(EVENT_OVERLOAD, 15000);
			me->AddAura(61902, me);
        }

        void DamageTaken(Unit* /*pDoneBy*/, uint32 & /*uiDamage*/) override
        {
            me->SetReactState(REACT_AGGRESSIVE);
        }

        void SetData(uint32 id, uint32 data) override
        {
            if (id == DATA_POLARITY_SWITCH && data==1)
                polaritySwitch = false;
        }

        uint32 GetData(uint32 id) const override
        {
            if (id != DATA_POLARITY_SWITCH)
                return 0;

            return uint32(polaritySwitch);
        }

        void UpdateAI(uint32 diff) override
        {
            if (checkFeugenAlive && checkStalaggAlive)
                uiAddsTimer = 0;

            if (checkStalaggAlive != checkFeugenAlive)
            {
                uiAddsTimer += diff;
                if (uiAddsTimer > 5000)
                {
                    if (!checkStalaggAlive)
                    {
                        if (Creature* pStalagg = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG)))
                            pStalagg->Respawn();
                    }
                    else
                    {
                        if (Creature* pFeugen = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN)))
                            pFeugen->Respawn();
                    }
                }
            }

            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {

                    case EVENT_SHIFT:
                        DoCastAOE(SPELL_POLARITY_SHIFT);
                        events.ScheduleEvent(EVENT_SHIFT, 30000);
                        return;
                    case EVENT_CHAIN:
                        DoCastVictim(RAID_MODE(SPELL_CHAIN_LIGHTNING, H_SPELL_CHAIN_LIGHTNING));
                        events.ScheduleEvent(EVENT_CHAIN, urand(8000, 15000));
                        return;
                    case EVENT_BERSERK:
                        DoCast(me, SPELL_BERSERK);
                        return;
					case EVENT_OVERLOAD:	

						if(me->HasAura(61902))
							me->RemoveAura(61902);

						if(me->HasAura(59123))
							me->RemoveAura(59123);	

						if(GameObject* goFeugenTesla = me->FindNearestGameObject(GO_FEUGEN_TESLA_COIL, 100.f))
						{

							goFeugenTesla->setActive(false);
							goFeugenTesla->SetGoState(GO_STATE_READY);
						}

						if(GameObject* goStalaggTesla = me->FindNearestGameObject(GO_STALAGG_TESLA_COIL, 100.f))
						{
							goStalaggTesla->setActive(false);
							goStalaggTesla->SetGoState(GO_STATE_READY);
						}						

						Talk(6);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
						me->SetReactState(REACT_AGGRESSIVE);						

						Talk(SAY_AGGRO);
						events.ScheduleEvent(EVENT_SHIFT, 30000);
						events.ScheduleEvent(EVENT_CHAIN, urand(9000, 16000));
						events.ScheduleEvent(EVENT_BERSERK, 360000);
						return;
                }
            }

            if (me->isAttackReady())
            {
                if (!me->IsWithinMeleeRange(me->GetVictim()))
                    me->CastSpell(me->GetVictim(), SPELL_BALL_LIGHTNING, false);
                else
                    DoMeleeAttackIfReady();
            }
        }
    };

};

class npc_stalagg : public CreatureScript
{
public:
    npc_stalagg() : CreatureScript("npc_stalagg") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<npc_stalaggAI>(creature);
    }

    struct npc_stalaggAI : public ScriptedAI
    {
        npc_stalaggAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();

				if(Creature* stalaggTeslaCoilTrigger = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG_TESLA_COIL)))
				{
					stalaggTeslaCoilTrigger->AI()->DoCast(SPELL_STALAGG_TESLA_CHAIN);
				}
        }

        InstanceScript* instance;

        uint32 powerSurgeTimer;
        uint32 magneticPullTimer;

        void Reset() override
        {
            if (Creature* pThaddius = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_STALAGG_RESET);
            powerSurgeTimer = urand(20000, 25000);
            magneticPullTimer = 20000;

				if(Creature* stalaggTeslaCoilTrigger = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG_TESLA_COIL)))
				{
					stalaggTeslaCoilTrigger->AI()->DoCast(SPELL_STALAGG_TESLA_CHAIN);
				}
        }

        void KilledUnit(Unit* /*victim*/) override
        {
            if (!(rand()%5))
                Talk(SAY_STAL_SLAY);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            Talk(SAY_STAL_AGGRO);
            DoCast(SPELL_STALAGG_TESLA);			
        }

        void JustDied(Unit* /*killer*/) override
        {
            Talk(SAY_STAL_DEATH);
            if (Creature* pThaddius = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_STALAGG_DIED);

			Talk(4);
        }

        void UpdateAI(uint32 uiDiff) override
        {
            if (!UpdateVictim())
                return;

            if (magneticPullTimer <= uiDiff)
            {
                if (Creature* pFeugen = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN)))
                {
                    Unit* pStalaggVictim = me->GetVictim();
                    Unit* pFeugenVictim = pFeugen->GetVictim();

                    if (pFeugenVictim && pStalaggVictim)
                    {
 
                        pFeugenVictim->JumpTo(me, 0.3f);	
						pStalaggVictim->JumpTo(pFeugen, 0.3f);	

						pFeugen->getThreatManager().resetAllAggro();
						me->getThreatManager().resetAllAggro();
						
						me->getThreatManager().doAddThreat(pFeugenVictim, 80000.0f);
						pFeugen->getThreatManager().doAddThreat(pStalaggVictim, 80000.0f);
						
                    }
                }

                magneticPullTimer = 20000;
            }
            else magneticPullTimer -= uiDiff;

            if (powerSurgeTimer <= uiDiff)
            {
                DoCast(me, RAID_MODE(SPELL_POWERSURGE, H_SPELL_POWERSURGE));
                powerSurgeTimer = urand(15000, 20000);
            } else powerSurgeTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

};

class npc_feugen : public CreatureScript
{
public:
    npc_feugen() : CreatureScript("npc_feugen") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<npc_feugenAI>(creature);
		
    }

    struct npc_feugenAI : public ScriptedAI
    {
        npc_feugenAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();

				if(Creature* feugenTeslaCoilTrigger = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN_TESLA_COIL)))
				{
					feugenTeslaCoilTrigger->AI()->DoCast(SPELL_FEUGEN_TESLA_CHAIN);
				}
        }

        InstanceScript* instance;

        uint32 staticFieldTimer;

        void Reset() override
        {
            if (Creature* pThaddius = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_FEUGEN_RESET);
            staticFieldTimer = 5000;

				if(Creature* feugenTeslaCoilTrigger = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN_TESLA_COIL)))
				{
					feugenTeslaCoilTrigger->AI()->DoCast(SPELL_FEUGEN_TESLA_CHAIN);
				}
        }

        void KilledUnit(Unit* /*victim*/) override
        {
            if (!(rand()%5))
                Talk(SAY_FEUG_SLAY);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            Talk(SAY_FEUG_AGGRO);
            DoCast(SPELL_FEUGEN_TESLA);						
        }

        void JustDied(Unit* /*killer*/) override
        {
            Talk(SAY_FEUG_DEATH);
            if (Creature* pThaddius = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_FEUGEN_DIED);

			Talk(4);
        }

        void UpdateAI(uint32 uiDiff) override
        {
            if (!UpdateVictim())
                return;

            if (staticFieldTimer <= uiDiff)
            {
                DoCast(me, RAID_MODE(SPELL_STATICFIELD, H_SPELL_STATICFIELD));
                staticFieldTimer = 5000;
            } else staticFieldTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

};

class spell_thaddius_pos_neg_charge : public SpellScriptLoader
{
    public:
        spell_thaddius_pos_neg_charge() : SpellScriptLoader("spell_thaddius_pos_neg_charge") { }

        class spell_thaddius_pos_neg_charge_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_thaddius_pos_neg_charge_SpellScript);

            bool Validate(SpellInfo const* /*spell*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_CHARGE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_CHARGE_STACK))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_NEGATIVE_CHARGE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_NEGATIVE_CHARGE_STACK))
                    return false;
                return true;
            }

            bool Load() override
            {
                return GetCaster()->GetTypeId() == TYPEID_PLAYER;
            }

            void HandleTargets(std::list<WorldObject*>& targets)
            {

                uint8 count = 0;
                for (std::list<WorldObject*>::iterator ihit = targets.begin(); ihit != targets.end(); ++ihit)
                    if ((*ihit)->GetGUID() != GetCaster()->GetGUID())
                        if (Player* target = (*ihit)->ToPlayer())
                            if (target->HasAura(GetTriggeringSpell()->Id))
                                ++count;

				uint32 spellId = 0;

                if (GetSpellInfo()->Id == SPELL_POSITIVE_CHARGE)
					spellId = SPELL_POSITIVE_CHARGE_STACK;
                else // if (GetSpellInfo()->Id == SPELL_NEGATIVE_CHARGE)
					spellId = SPELL_NEGATIVE_CHARGE_STACK;
				
				if(GetCaster()->HasAura(spellId))
					GetCaster()->RemoveAura(spellId);
				
				if (count)                				
                    GetCaster()->SetAuraStack(spellId, GetCaster(), count);
            }

            void HandleDamage(SpellEffIndex /*effIndex*/)
            {

                if (!GetTriggeringSpell())
                    return;

                Unit* target = GetHitUnit();
				if (target->GetTypeId() != TYPEID_PLAYER)
					return;

                Unit* caster = GetCaster();

                if (target->HasAura(GetTriggeringSpell()->Id))
                    SetHitDamage(0);
                else
                {
                    if (target->GetTypeId() == TYPEID_PLAYER && caster->IsAIEnabled)
                        caster->ToCreature()->AI()->SetData(DATA_POLARITY_SWITCH, 1);
                }

            }

            void Register() override
            {				
                OnEffectHitTarget += SpellEffectFn(spell_thaddius_pos_neg_charge_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_thaddius_pos_neg_charge_SpellScript::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ALLY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_thaddius_pos_neg_charge_SpellScript();
        }
};

class spell_thaddius_polarity_shift : public SpellScriptLoader
{
    public:
        spell_thaddius_polarity_shift() : SpellScriptLoader("spell_thaddius_polarity_shift") { }

        class spell_thaddius_polarity_shift_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_thaddius_polarity_shift_SpellScript);

            bool Validate(SpellInfo const* /*spell*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_POSITIVE_POLARITY) || !sSpellMgr->GetSpellInfo(SPELL_NEGATIVE_POLARITY))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /* effIndex */)
            {
                Unit* caster = GetCaster();
                if (Unit* target = GetHitUnit())
				{
					target->RemoveAura(SPELL_POSITIVE_POLARITY);
					target->RemoveAura(SPELL_NEGATIVE_POLARITY);
                    target->CastSpell(target, roll_chance_i(50) ? SPELL_POSITIVE_POLARITY : SPELL_NEGATIVE_POLARITY, true, NULL, NULL, caster->GetGUID());
				}
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_thaddius_polarity_shift_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_thaddius_polarity_shift_SpellScript();
        }
};

class achievement_polarity_switch : public AchievementCriteriaScript
{
    public:
        achievement_polarity_switch() : AchievementCriteriaScript("achievement_polarity_switch") { }

        bool OnCheck(Player* /*source*/, Unit* target) override
        {
            return target && target->GetAI()->GetData(DATA_POLARITY_SWITCH);
        }
};

/*
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (225154, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Stalagg - World Trigger', '', NULL, 0, 60, 60, 0, 114, 114, 0, 1, 0.99206, 1, 0, 104, 138, 0, 252, 7.5, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_stalagg_tesla_coil', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (225155, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Feugen - World Trigger', '', NULL, 0, 60, 60, 0, 114, 114, 0, 1, 0.99206, 1, 0, 104, 138, 0, 252, 7.5, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_feugen_tesla_coil', 12340);


INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (259608, 225154, 533, 3, 1, 0, 0, 3487.65, -2910.56, 319.433, 3.93139, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (260401, 225155, 533, 3, 1, 0, 0, 3526.34, -2952.86, 318.807, 3.9894, 300, 0, 0, 4121, 0, 0, 0, 0, 0);



INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15930, 3, 0, 'Tesla Coils loses its link!', 41, 0, 100, 0, 0, 0, 'Feugen Tesla Coil unlinked');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15929, 3, 0, 'Tesla Coils loses its link!', 41, 0, 100, 0, 0, 0, 'Stalagg Tesla Coil unlinked');

INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15928, 6, 0, 'Tesla Coil overloads!', 41, 0, 100, 0, 0, 0, 'Tesla Coil overloads!');

*/

class npc_feugen_tesla_coil : public CreatureScript
{
    public:
        npc_feugen_tesla_coil() : CreatureScript("npc_feugen_tesla_coil") { }

        struct npc_feugen_tesla_coilAI : public ScriptedAI
        {
            npc_feugen_tesla_coilAI(Creature* creature) : ScriptedAI(creature),
                instance(creature->GetInstanceScript())
            {
				isLinked  = true;
            }

            void Reset() override
            {
				DoCast(SPELL_FEUGEN_TESLA_CHAIN);
				isLinked  = true;
            }

			void UpdateAI(uint32 Diff) override
			{
				
				if(Creature* pFeugen = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_FEUGEN)))
				{
					if(!pFeugen->IsWithinDistInMap(me, 55.0f,true))
					{												
						if(isLinked)
						{
							me->CastStop();
							pFeugen->AI()->Talk(3);							
							isLinked = false;														
						}						
																		
						DoCast(pFeugen->GetVictim(), SPELL_SHOCK_TESLA);		

					}
					else
					{						
						if(!isLinked)
						{
							me->CastStop();
							DoCast(SPELL_FEUGEN_TESLA_CHAIN);
							isLinked = true;
						}
					}
				}

			}

        private:
            InstanceScript* const instance;
			bool isLinked;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_feugen_tesla_coilAI>(creature);
        }
};

class npc_stalagg_tesla_coil : public CreatureScript
{
    public:
        npc_stalagg_tesla_coil() : CreatureScript("npc_stalagg_tesla_coil") { }

        struct npc_stalagg_tesla_coilAI : public ScriptedAI
        {
            npc_stalagg_tesla_coilAI(Creature* creature) : ScriptedAI(creature),
                instance(creature->GetInstanceScript())
            {
				isLinked = true;
            }

            void Reset() override
            {
				DoCast(SPELL_STALAGG_TESLA_CHAIN);
				isLinked  = true;
            }

		void UpdateAI(uint32 Diff) override
			{
				
				if(Creature* pStalagg = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_STALAGG)))
				{
					if(!pStalagg->IsWithinDistInMap(me, 55.0f,true))
					{												
						if(isLinked)
						{
							me->CastStop();
							pStalagg->AI()->Talk(3);
							isLinked = false;														
						}						
																		
						DoCast(pStalagg->GetVictim(), SPELL_SHOCK_TESLA);		

					}
					else
					{						
						if(!isLinked)
						{
							me->CastStop();
							DoCast(SPELL_STALAGG_TESLA_CHAIN);
							isLinked = true;
						}
					}
				}

			}

        private:
            InstanceScript* const instance;
			bool isLinked;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_stalagg_tesla_coilAI>(creature);
        }
};


void AddSC_boss_thaddius()
{
    new boss_thaddius();
    new npc_stalagg();
    new npc_feugen();
    new spell_thaddius_pos_neg_charge();
    new spell_thaddius_polarity_shift();
    new achievement_polarity_switch();

	new npc_feugen_tesla_coil();
	new npc_stalagg_tesla_coil();
}
