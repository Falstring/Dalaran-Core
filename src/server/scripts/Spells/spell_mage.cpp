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
 * Scripts for spells with SPELLFAMILY_MAGE and SPELLFAMILY_GENERIC spells used by mage players.
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "spell_mage_".
 */

#include "Player.h"
#include "ScriptMgr.h"
#include "SpellHistory.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"

enum MageSpells
{
    SPELL_MAGE_BURNOUT                           = 29077,
    SPELL_MAGE_COLD_SNAP                         = 11958,
    SPELL_MAGE_FOCUS_MAGIC_PROC                  = 54648,
    SPELL_MAGE_FROST_WARDING_R1                  = 11189,
    SPELL_MAGE_FROST_WARDING_TRIGGERED           = 57776,
    SPELL_MAGE_INCANTERS_ABSORBTION_R1           = 44394,
    SPELL_MAGE_INCANTERS_ABSORBTION_TRIGGERED    = 44413,
    SPELL_MAGE_IGNITE                            = 12654,
    SPELL_MAGE_MASTER_OF_ELEMENTS_ENERGIZE       = 29077,
    SPELL_MAGE_SQUIRREL_FORM                     = 32813,
    SPELL_MAGE_GIRAFFE_FORM                      = 32816,
    SPELL_MAGE_SERPENT_FORM                      = 32817,
    SPELL_MAGE_DRAGONHAWK_FORM                   = 32818,
    SPELL_MAGE_WORGEN_FORM                       = 32819,
    SPELL_MAGE_SHEEP_FORM                        = 32820,
    SPELL_MAGE_GLYPH_OF_ETERNAL_WATER            = 70937,
    SPELL_MAGE_SHATTERED_BARRIER                 = 55080,
    SPELL_MAGE_SUMMON_WATER_ELEMENTAL_PERMANENT  = 70908,
    SPELL_MAGE_SUMMON_WATER_ELEMENTAL_TEMPORARY  = 70907,
    SPELL_MAGE_GLYPH_OF_BLAST_WAVE               = 62126,
    SPELL_MAGE_FINGERS_OF_FROST                  = 74396,
    SPELL_MAGE_PET_SCALING_01                    = 35657,
    SPELL_MAGE_PET_SCALING_02                    = 35658,
    SPELL_MAGE_PET_SCALING_03                    = 35659,
    SPELL_MAGE_PET_SCALING_04                    = 35660
};

enum MageSpellIcons
{
    SPELL_ICON_MAGE_SHATTERED_BARRIER = 2945
};

// Incanter's Absorbtion
class spell_mage_incanters_absorbtion_base_AuraScript : public AuraScript
{
    public:
        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_INCANTERS_ABSORBTION_TRIGGERED))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_INCANTERS_ABSORBTION_R1))
                return false;
            return true;
        }

        void Trigger(AuraEffect* aurEff, DamageInfo& /*dmgInfo*/, uint32& absorbAmount)
        {
            Unit* target = GetTarget();

            if (AuraEffect* talentAurEff = target->GetAuraEffectOfRankedSpell(SPELL_MAGE_INCANTERS_ABSORBTION_R1, EFFECT_0))
            {
                int32 bp = CalculatePct(absorbAmount, talentAurEff->GetAmount());
                target->CastCustomSpell(target, SPELL_MAGE_INCANTERS_ABSORBTION_TRIGGERED, &bp, NULL, NULL, true, NULL, aurEff);
            }
        }
};

// -11113 - Blast Wave
class spell_mage_blast_wave : public SpellScriptLoader
{
    public:
        spell_mage_blast_wave() : SpellScriptLoader("spell_mage_blast_wave") { }

        class spell_mage_blast_wave_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_mage_blast_wave_SpellScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_GLYPH_OF_BLAST_WAVE))
                    return false;
                return true;
            }

            void HandleKnockBack(SpellEffIndex effIndex)
            {
                if (GetCaster()->HasAura(SPELL_MAGE_GLYPH_OF_BLAST_WAVE))
                    PreventHitDefaultEffect(effIndex);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_mage_blast_wave_SpellScript::HandleKnockBack, EFFECT_2, SPELL_EFFECT_KNOCK_BACK);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_mage_blast_wave_SpellScript();
        }
};

// -44449 - Burnout
class spell_mage_burnout : public SpellScriptLoader
{
    public:
        spell_mage_burnout() : SpellScriptLoader("spell_mage_burnout") { }

        class spell_mage_burnout_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mage_burnout_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_BURNOUT))
                    return false;
                return true;
            }

            bool CheckProc(ProcEventInfo& eventInfo)
            {
                return eventInfo.GetDamageInfo()->GetSpellInfo() != nullptr;
            }

            void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();

                int32 mana = int32(eventInfo.GetDamageInfo()->GetSpellInfo()->CalcPowerCost(GetTarget(), eventInfo.GetDamageInfo()->GetSchoolMask()));
                mana = CalculatePct(mana, aurEff->GetAmount());

                GetTarget()->CastCustomSpell(SPELL_MAGE_BURNOUT, SPELLVALUE_BASE_POINT0, mana, GetTarget(), true, NULL, aurEff);
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_mage_burnout_AuraScript::CheckProc);
                OnEffectProc += AuraEffectProcFn(spell_mage_burnout_AuraScript::HandleProc, EFFECT_1, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_burnout_AuraScript();
        }
};

// 11958 - Cold Snap
class spell_mage_cold_snap : public SpellScriptLoader
{
    public:
        spell_mage_cold_snap() : SpellScriptLoader("spell_mage_cold_snap") { }

        class spell_mage_cold_snap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_mage_cold_snap_SpellScript);

            bool Load() override
            {
                return GetCaster()->GetTypeId() == TYPEID_PLAYER;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                GetCaster()->GetSpellHistory()->ResetCooldowns([](SpellHistory::CooldownStorageType::iterator itr) -> bool
                {
                    SpellInfo const* spellInfo = sSpellMgr->EnsureSpellInfo(itr->first);
                    return spellInfo->SpellFamilyName == SPELLFAMILY_MAGE && (spellInfo->GetSchoolMask() & SPELL_SCHOOL_MASK_FROST) &&
                        spellInfo->Id != SPELL_MAGE_COLD_SNAP && spellInfo->GetRecoveryTime() > 0;
                }, true);
            }

            void Register() override
            {
                OnEffectHit += SpellEffectFn(spell_mage_cold_snap_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_mage_cold_snap_SpellScript();
        }
};

// -543  - Fire Ward
// -6143 - Frost Ward
class spell_mage_fire_frost_ward : public SpellScriptLoader
{
    public:
        spell_mage_fire_frost_ward() : SpellScriptLoader("spell_mage_fire_frost_ward") { }

        class spell_mage_fire_frost_ward_AuraScript : public spell_mage_incanters_absorbtion_base_AuraScript
        {
            PrepareAuraScript(spell_mage_fire_frost_ward_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_FROST_WARDING_TRIGGERED))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_FROST_WARDING_R1))
                    return false;
                return true;
            }

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& canBeRecalculated)
            {
                canBeRecalculated = false;
                if (Unit* caster = GetCaster())
                {
                    // +80.68% from sp bonus
                    float bonus = 0.8068f;

                    bonus *= caster->SpellBaseHealingBonusDone(GetSpellInfo()->GetSchoolMask());
                    bonus *= caster->CalculateLevelPenalty(GetSpellInfo());

                    amount += int32(bonus);
                }
            }

            void Absorb(AuraEffect* aurEff, DamageInfo& dmgInfo, uint32& absorbAmount)
            {
                Unit* target = GetTarget();
                if (AuraEffect* talentAurEff = target->GetAuraEffectOfRankedSpell(SPELL_MAGE_FROST_WARDING_R1, EFFECT_0))
                {
                    int32 chance = talentAurEff->GetSpellInfo()->Effects[EFFECT_1].CalcValue(); // SPELL_EFFECT_DUMMY with NO_TARGET

                    if (roll_chance_i(chance))
                    {
                        int32 bp = dmgInfo.GetDamage();
                        dmgInfo.AbsorbDamage(bp);
                        target->CastCustomSpell(target, SPELL_MAGE_FROST_WARDING_TRIGGERED, &bp, NULL, NULL, true, NULL, aurEff);
                        absorbAmount = 0;
                        PreventDefaultAction();
                    }
                }
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_fire_frost_ward_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
                OnEffectAbsorb += AuraEffectAbsorbFn(spell_mage_fire_frost_ward_AuraScript::Absorb, EFFECT_0);
                AfterEffectAbsorb += AuraEffectAbsorbFn(spell_mage_fire_frost_ward_AuraScript::Trigger, EFFECT_0);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_fire_frost_ward_AuraScript();
        }
};

// 54646 - Focus Magic
class spell_mage_focus_magic : public SpellScriptLoader
{
    public:
        spell_mage_focus_magic() : SpellScriptLoader("spell_mage_focus_magic") { }

        class spell_mage_focus_magic_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mage_focus_magic_AuraScript);

        public:
            spell_mage_focus_magic_AuraScript()
            {
                _procTarget = nullptr;
            }

        private:
            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_FOCUS_MAGIC_PROC))
                    return false;
                return true;
            }

            bool CheckProc(ProcEventInfo& /*eventInfo*/)
            {
                _procTarget = GetCaster();
                return _procTarget && _procTarget->IsAlive();
            }

            void HandleProc(AuraEffect const* aurEff, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                GetTarget()->CastSpell(_procTarget, SPELL_MAGE_FOCUS_MAGIC_PROC, true, NULL, aurEff);
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_mage_focus_magic_AuraScript::CheckProc);
                OnEffectProc += AuraEffectProcFn(spell_mage_focus_magic_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_MOD_SPELL_CRIT_CHANCE);
            }

        private:
            Unit* _procTarget;
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_focus_magic_AuraScript();
        }
};

// -11426 - Ice Barrier
class spell_mage_ice_barrier : public SpellScriptLoader
{
    public:
        spell_mage_ice_barrier() : SpellScriptLoader("spell_mage_ice_barrier") { }

        class spell_mage_ice_barrier_AuraScript : public spell_mage_incanters_absorbtion_base_AuraScript
        {
            PrepareAuraScript(spell_mage_ice_barrier_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_SHATTERED_BARRIER))
                    return false;
                return true;
            }

            void CalculateAmount(AuraEffect const* aurEff, int32& amount, bool& canBeRecalculated)
            {
                canBeRecalculated = false;
                if (Unit* caster = GetCaster())
                {
                    // +80.68% from sp bonus
                    float bonus = 0.8068f;

                    bonus *= caster->SpellBaseHealingBonusDone(GetSpellInfo()->GetSchoolMask());

                    // Glyph of Ice Barrier: its weird having a SPELLMOD_ALL_EFFECTS here but its blizzards doing :)
                    // Glyph of Ice Barrier is only applied at the spell damage bonus because it was already applied to the base value in CalculateSpellDamage
                    bonus = caster->ApplyEffectModifiers(GetSpellInfo(), aurEff->GetEffIndex(), bonus);

                    bonus *= caster->CalculateLevelPenalty(GetSpellInfo());

                    amount += int32(bonus);
                }
            }

            void AfterRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
            {
                // Shattered Barrier
                // Procs only if removed by damage.
                if (aurEff->GetAmount() <= 0)
                    if (Unit* caster = GetCaster())
                        if (AuraEffect* dummy = caster->GetDummyAuraEffect(SPELLFAMILY_MAGE, SPELL_ICON_MAGE_SHATTERED_BARRIER, EFFECT_0))
                            if (roll_chance_i(dummy->GetSpellInfo()->ProcChance))
                                caster->CastSpell(GetTarget(), SPELL_MAGE_SHATTERED_BARRIER, true, nullptr, aurEff);
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_ice_barrier_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
                AfterEffectAbsorb += AuraEffectAbsorbFn(spell_mage_ice_barrier_AuraScript::Trigger, EFFECT_0);
                AfterEffectRemove += AuraEffectRemoveFn(spell_mage_ice_barrier_AuraScript::AfterRemove, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_ice_barrier_AuraScript();
        }
};

// -11119 - Ignite
class spell_mage_ignite : public SpellScriptLoader
{
    public:
        spell_mage_ignite() : SpellScriptLoader("spell_mage_ignite") { }

        class spell_mage_ignite_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mage_ignite_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_IGNITE))
                    return false;
                return true;
            }

            bool CheckProc(ProcEventInfo& eventInfo)
            {
                if (!eventInfo.GetActor() || !eventInfo.GetProcTarget())
                    return false;

                // Molten Armor
                if (SpellInfo const* spellInfo = eventInfo.GetDamageInfo()->GetSpellInfo())
                    if (spellInfo->SpellFamilyFlags[1] & 0x8)
                        return false;

                return true;
            }

            void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();

                SpellInfo const* igniteDot = sSpellMgr->EnsureSpellInfo(SPELL_MAGE_IGNITE);
                int32 pct = 8 * GetSpellInfo()->GetRank();

                int32 amount = int32(CalculatePct(eventInfo.GetDamageInfo()->GetDamage(), pct) / igniteDot->GetMaxTicks());
                amount += eventInfo.GetProcTarget()->GetRemainingPeriodicAmount(eventInfo.GetActor()->GetGUID(), SPELL_MAGE_IGNITE, SPELL_AURA_PERIODIC_DAMAGE);
                GetTarget()->CastCustomSpell(SPELL_MAGE_IGNITE, SPELLVALUE_BASE_POINT0, amount, eventInfo.GetProcTarget(), true, NULL, aurEff);
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_mage_ignite_AuraScript::CheckProc);
                OnEffectProc += AuraEffectProcFn(spell_mage_ignite_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_ignite_AuraScript();
        }
};

// -44457 - Living Bomb
class spell_mage_living_bomb : public SpellScriptLoader
{
    public:
        spell_mage_living_bomb() : SpellScriptLoader("spell_mage_living_bomb") { }

        class spell_mage_living_bomb_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mage_living_bomb_AuraScript);

            bool Validate(SpellInfo const* spell) override
            {
                if (!sSpellMgr->GetSpellInfo(uint32(spell->Effects[EFFECT_1].CalcValue())))
                    return false;
                return true;
            }

            void AfterRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
            {
                AuraRemoveMode removeMode = GetTargetApplication()->GetRemoveMode();
                if (removeMode != AURA_REMOVE_BY_ENEMY_SPELL && removeMode != AURA_REMOVE_BY_EXPIRE)
                    return;

                if (Unit* caster = GetCaster())
                    caster->CastSpell(GetTarget(), uint32(aurEff->GetAmount()), true, NULL, aurEff);
            }

            void Register() override
            {
                AfterEffectRemove += AuraEffectRemoveFn(spell_mage_living_bomb_AuraScript::AfterRemove, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_living_bomb_AuraScript();
        }
};

// -1463 - Mana Shield
class spell_mage_mana_shield : public SpellScriptLoader
{
    public:
        spell_mage_mana_shield() : SpellScriptLoader("spell_mage_mana_shield") { }

        class spell_mage_mana_shield_AuraScript : public spell_mage_incanters_absorbtion_base_AuraScript
        {
            PrepareAuraScript(spell_mage_mana_shield_AuraScript);

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& canBeRecalculated)
            {
                canBeRecalculated = false;
                if (Unit* caster = GetCaster())
                {
                    // +80.53% from sp bonus
                    float bonus = 0.8053f;

                    bonus *= caster->SpellBaseHealingBonusDone(GetSpellInfo()->GetSchoolMask());
                    bonus *= caster->CalculateLevelPenalty(GetSpellInfo());

                    amount += int32(bonus);
                }
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_mana_shield_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_MANA_SHIELD);
                AfterEffectManaShield += AuraEffectManaShieldFn(spell_mage_mana_shield_AuraScript::Trigger, EFFECT_0);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_mana_shield_AuraScript();
        }
};

// -29074 - Master of Elements
class spell_mage_master_of_elements : public SpellScriptLoader
{
    public:
        spell_mage_master_of_elements() : SpellScriptLoader("spell_mage_master_of_elements") { }

        class spell_mage_master_of_elements_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mage_master_of_elements_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_MASTER_OF_ELEMENTS_ENERGIZE))
                    return false;
                return true;
            }

            bool CheckProc(ProcEventInfo& eventInfo)
            {
                return eventInfo.GetDamageInfo()->GetSpellInfo() != nullptr;
            }

            void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();

                int32 mana = int32(eventInfo.GetDamageInfo()->GetSpellInfo()->CalcPowerCost(GetTarget(), eventInfo.GetDamageInfo()->GetSchoolMask()));
                mana = CalculatePct(mana, aurEff->GetAmount());

                if (mana > 0)
                    GetTarget()->CastCustomSpell(SPELL_MAGE_MASTER_OF_ELEMENTS_ENERGIZE, SPELLVALUE_BASE_POINT0, mana, GetTarget(), true, NULL, aurEff);
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_mage_master_of_elements_AuraScript::CheckProc);
                OnEffectProc += AuraEffectProcFn(spell_mage_master_of_elements_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mage_master_of_elements_AuraScript();
        }
};

enum SilvermoonPolymorph
{
    NPC_AUROSALIA   = 18744,
};

/// @todo move out of here and rename - not a mage spell
// 32826 - Polymorph (Visual)
class spell_mage_polymorph_cast_visual : public SpellScriptLoader
{
    public:
        spell_mage_polymorph_cast_visual() : SpellScriptLoader("spell_mage_polymorph_visual") { }

        class spell_mage_polymorph_cast_visual_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_mage_polymorph_cast_visual_SpellScript);

            static const uint32 PolymorhForms[6];

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                // check if spell ids exist in dbc
                for (uint32 i = 0; i < 6; ++i)
                    if (!sSpellMgr->GetSpellInfo(PolymorhForms[i]))
                        return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                if (Unit* target = GetCaster()->FindNearestCreature(NPC_AUROSALIA, 30.0f))
                    if (target->GetTypeId() == TYPEID_UNIT)
                        target->CastSpell(target, PolymorhForms[urand(0, 5)], true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_mage_polymorph_cast_visual_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_mage_polymorph_cast_visual_SpellScript();
        }
};

const uint32 spell_mage_polymorph_cast_visual::spell_mage_polymorph_cast_visual_SpellScript::PolymorhForms[6] =
{
    SPELL_MAGE_SQUIRREL_FORM,
    SPELL_MAGE_GIRAFFE_FORM,
    SPELL_MAGE_SERPENT_FORM,
    SPELL_MAGE_DRAGONHAWK_FORM,
    SPELL_MAGE_WORGEN_FORM,
    SPELL_MAGE_SHEEP_FORM
};

// 31687 - Summon Water Elemental
class spell_mage_summon_water_elemental : public SpellScriptLoader
{
    public:
        spell_mage_summon_water_elemental() : SpellScriptLoader("spell_mage_summon_water_elemental") { }

        class spell_mage_summon_water_elemental_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_mage_summon_water_elemental_SpellScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_GLYPH_OF_ETERNAL_WATER) || !sSpellMgr->GetSpellInfo(SPELL_MAGE_SUMMON_WATER_ELEMENTAL_TEMPORARY) || !sSpellMgr->GetSpellInfo(SPELL_MAGE_SUMMON_WATER_ELEMENTAL_PERMANENT))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                // Glyph of Eternal Water
                if (caster->HasAura(SPELL_MAGE_GLYPH_OF_ETERNAL_WATER))
                    caster->CastSpell(caster, SPELL_MAGE_SUMMON_WATER_ELEMENTAL_PERMANENT, true);
                else
                    caster->CastSpell(caster, SPELL_MAGE_SUMMON_WATER_ELEMENTAL_TEMPORARY, true);
            }

            void Register() override
            {
                OnEffectHit += SpellEffectFn(spell_mage_summon_water_elemental_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_mage_summon_water_elemental_SpellScript();
        }
};

// 74396 - Fingers of Frost
class spell_mage_fingers_of_frost : public SpellScriptLoader
{
public:
    spell_mage_fingers_of_frost() : SpellScriptLoader("spell_mage_fingers_of_frost") { }

    class spell_mage_fingers_of_frost_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_mage_fingers_of_frost_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_FINGERS_OF_FROST))
                return false;
            return true;
        }

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            // Arcane Blast (Apply Aura - Self Aura)
            if (eventInfo.GetActor() == eventInfo.GetDamageInfo()->GetVictim())
                return false;

            return true;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_mage_fingers_of_frost_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_mage_fingers_of_frost_AuraScript();
    }
};

// 35657 - Mage Pet Scaling 01 (SERVERSIDE)
// 35658 - Mage Pet Scaling 02 (SERVERSIDE)
// 35659 - Mage Pet Scaling 03 (SERVERSIDE)
// 35660 - Mage Pet Scaling 04 (SERVERSIDE)
class spell_mage_pet_scaling : public SpellScriptLoader
{
public:
    spell_mage_pet_scaling() : SpellScriptLoader("spell_mage_pet_scaling") { }

    class spell_mage_pet_scaling_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_mage_pet_scaling_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MAGE_PET_SCALING_01) || !sSpellMgr->GetSpellInfo(SPELL_MAGE_PET_SCALING_02) ||
                !sSpellMgr->GetSpellInfo(SPELL_MAGE_PET_SCALING_03) || !sSpellMgr->GetSpellInfo(SPELL_MAGE_PET_SCALING_04))
                return false;
            return true;
        }

        void CalculateStatAmount(AuraEffect const* aurEff, int32& amount, bool& /*canBeRecalculated*/)
        {
            if (Unit* owner = GetUnitOwner()->GetOwner())
            {
                Stats stat = Stats(aurEff->GetSpellInfo()->Effects[aurEff->GetEffIndex()].MiscValue);
                float ownerStat = owner->GetStat(stat);
                int32 mod = 30;
                amount = CalculatePct(std::max<int32>(0, ownerStat), mod);
            }
        }

        void CalculateAPAmount(AuraEffect const* aurEff, int32& amount, bool& /*canBeRecalculated*/)
        {
        }

        void CalculateSPAmount(AuraEffect const* aurEff, int32& amount, bool& /*canBeRecalculated*/)
        {
            if (Unit* owner = GetUnitOwner()->GetOwner())
            {
                int32 mod = 33;
                int32 frostMod = owner->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_FROST);

                amount = CalculatePct(std::max<int32>(0, frostMod), mod);

                if (owner->GetTypeId() == TYPEID_PLAYER)
                    owner->SetUInt32Value(PLAYER_PET_SPELL_POWER, (uint32)amount);
            }
        }

        void CalculateResistanceAmount(AuraEffect const* aurEff, int32& amount, bool& /*canBeRecalculated*/)
        {
            if (Unit* owner = GetUnitOwner()->GetOwner())
            {
                SpellSchoolMask schoolMask = SpellSchoolMask(aurEff->GetMiscValue());
                // 35% for Armor and 40% for Magic Resistance
                int32 mod = schoolMask == SPELL_SCHOOL_NORMAL ? 35 : 40;

                float ownerResistance = owner->GetResistance(schoolMask);

                amount = CalculatePct(std::max<int32>(0, ownerResistance), mod);
            }
        }

        void CalcPeriodic(AuraEffect const* /*aurEff*/, bool& isPeriodic, int32& amplitude)
        {
            isPeriodic = true;
            amplitude = 2 * IN_MILLISECONDS;
        }

        void HandlePeriodic(AuraEffect const* aurEff)
        {
            PreventDefaultAction();
            if (aurEff->GetAuraType() == SPELL_AURA_MOD_STAT && (aurEff->GetMiscValue() == STAT_STAMINA || aurEff->GetMiscValue() == STAT_INTELLECT))
            {
                int32 currentAmount = aurEff->GetAmount();
                int32 newAmount = GetEffect(aurEff->GetEffIndex())->CalculateAmount(GetCaster());
                if (newAmount != currentAmount)
                {
                    if (aurEff->GetMiscValue() == STAT_STAMINA)
                    {
                        uint32 actStat = GetUnitOwner()->GetHealth();
                        GetEffect(aurEff->GetEffIndex())->ChangeAmount(newAmount, false);
                        GetUnitOwner()->SetHealth(std::min<uint32>(GetUnitOwner()->GetMaxHealth(), actStat));
                    }
                    else
                    {
                        uint32 actStat = GetUnitOwner()->GetPower(POWER_MANA);
                        GetEffect(aurEff->GetEffIndex())->ChangeAmount(newAmount, false);
                        GetUnitOwner()->SetPower(POWER_MANA, std::min<uint32>(GetUnitOwner()->GetMaxPower(POWER_MANA), actStat));
                    }
                }
            }
            else
                GetEffect(aurEff->GetEffIndex())->RecalculateAmount();
        }

        void Register() override
        {
            if (m_scriptSpellId != SPELL_MAGE_PET_SCALING_01)
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_pet_scaling_AuraScript::CalculateResistanceAmount, EFFECT_ALL, SPELL_AURA_MOD_RESISTANCE);

            if (m_scriptSpellId == SPELL_MAGE_PET_SCALING_01 || m_scriptSpellId == SPELL_MAGE_PET_SCALING_02)
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_pet_scaling_AuraScript::CalculateStatAmount, EFFECT_ALL, SPELL_AURA_MOD_STAT);

            if (m_scriptSpellId == SPELL_MAGE_PET_SCALING_01)
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_pet_scaling_AuraScript::CalculateAPAmount, EFFECT_ALL, SPELL_AURA_MOD_ATTACK_POWER);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mage_pet_scaling_AuraScript::CalculateSPAmount, EFFECT_ALL, SPELL_AURA_MOD_DAMAGE_DONE);
            }

            DoEffectCalcPeriodic += AuraEffectCalcPeriodicFn(spell_mage_pet_scaling_AuraScript::CalcPeriodic, EFFECT_ALL, SPELL_AURA_ANY);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_mage_pet_scaling_AuraScript::HandlePeriodic, EFFECT_ALL, SPELL_AURA_ANY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_mage_pet_scaling_AuraScript();
    }
};

class DalaranBrillianceTargetSelector
{
public:
    bool operator() (WorldObject* object)
    {
        if (Unit* unit = object->ToUnit())
            if (unit->getLevel() >= 70)
                return false;

        return true;
    }
};

class spell_dalaran_brilliance : public SpellScriptLoader
{
public:
    spell_dalaran_brilliance() : SpellScriptLoader("spell_dalaran_brilliance") { }

    class spell_dalaran_brilliance_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_dalaran_brilliance_SpellScript);

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            unitList.remove_if(DalaranBrillianceTargetSelector());
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_dalaran_brilliance_SpellScript::FilterTargets, EFFECT_ALL, TARGET_UNIT_CASTER_AREA_RAID);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_dalaran_brilliance_SpellScript();
    }
};


void AddSC_mage_spell_scripts()
{
    new spell_mage_blast_wave();
    new spell_mage_burnout();
    new spell_mage_cold_snap();
    new spell_mage_fire_frost_ward();
    new spell_mage_focus_magic();
    new spell_mage_ice_barrier();
    new spell_mage_ignite();
    new spell_mage_living_bomb();
    new spell_mage_mana_shield();
    new spell_mage_master_of_elements();
    new spell_mage_polymorph_cast_visual();
    new spell_mage_summon_water_elemental();
    new spell_mage_fingers_of_frost();
    new spell_mage_pet_scaling();
    new spell_dalaran_brilliance();
}
