/*
* Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
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

/* ScriptData
SDName: Argent Challenge Encounter.
SD%Complete: 90 %
SDComment: AI from bosses need more improvements. Need AI for lightwell
SDCategory: Trial of the Champion
EndScriptData */


#include "trial_of_the_champion.h"
#include "ScriptedEscortAI.h"

enum eSpells
{
	SPELL_KNEE = 68442,
	// Monk
	SPELL_DIVINE_SHIELD = 67251,
	SPELL_FINAL_MEDITATION = 67255,
	SPELL_FLURRY_OF_BLOWS = 67233,
	SPELL_PUMMEL = 67235,
	// Lightwielder
	SPELL_BLAZING_LIGHT = 67247,
	SPELL_CLEAVE = 15284,
	SPELL_UNBALANCING_STRIKE = 67237,
	// Priest
	SPELL_HOLY_SMITE = 36176,
	SPELL_HOLY_SMITE_H = 67289,
	SPELL_SHADOW_WORD_PAIN = 34941,
	SPELL_SHADOW_WORD_PAIN_H = 34942,
	SPELL_MIND_CONTROL = 67229,
	SPELL_FOUNTAIN_OF_LIGHT = 67194,

	//Eadric
	SPELL_EADRIC_ACHIEVEMENT = 68197,
	SPELL_HAMMER_JUSTICE = 66863,
	SPELL_HAMMER_JUSTICE_STUN = 66940,
	SPELL_HAMMER_RIGHTEOUS = 66867,
	SPELL_HAMMER_OVERRIDE_BAR = 66904, // overrides players cast bar
	SPELL_HAMMER_THROWBACK_DMG = 66905, // the hammer that is thrown back by the player
	SPELL_RADIANCE = 66935,
	SPELL_VENGEANCE = 66865,

	//Paletress
	SPELL_CONFESSOR_ACHIEVEMENT = 68206,
	SPELL_SMITE = 66536,
	SPELL_SMITE_H = 67674,
	SPELL_HOLY_FIRE = 66538,
	SPELL_HOLY_FIRE_H = 67676,
	SPELL_RENEW = 66537,
	SPELL_RENEW_H = 67675,
	SPELL_HOLY_NOVA = 66546,
	SPELL_SHIELD = 66515,
	SPELL_CONFESS = 66680,

	//Npc_argent_soldier
	SPELL_STRIKE = 67237,

	SPELL_PAIN = 34942,
	SPELL_MIND = 67229,
	SPELL_SSMITE = 67289,
	SPELL_LIGHT_H = 67290,
	SPELL_LIGHT = 67247,
	SPELL_FLURRY = 67233,
	SPELL_FINAL = 67255,
	SPELL_DIVINE = 67251,

	//Memory
	SPELL_SHADOW_FORM = 41408,
	SPELL_MEMORY_SPAWN_EFFECT = 66675,
	SPELL_OLD_WOUNDS = 66620,
	SPELL_OLD_WOUNDS_H = 67679,
	SPELL_SHADOWS_PAST = 66619,
	SPELL_SHADOWS_PAST_H = 67678,
	SPELL_WAKING_NIGHTMARE = 66552,
	SPELL_WAKING_NIGHTMARE_H = 67677
};

enum Misc
{
	ACHIEV_FACEROLLER = 3803,
	ACHIEV_CONF = 3802
};

enum Talk
{
	SAY_ARGENT_ENTERS = 19,
	SAY_ARGENT_READY = 20,

	// Paletress
	SAY_PALETRESS_AGGRO = 2,
	SAY_PALETRESS_SUMMON_MEMORY = 3,
	SAY_PALETRESS_MEMORY_DIES = 4,
	SAY_PALETRESS_PLAYER_DIES = 5,
	SAY_PALETRESS_DEFEATED = 6,

	// Eadric
	SAY_EADRIC_AGGRO = 1,
	SAY_EADRIC_HAMMER = 2,
	SAY_EADRIC_PLAYER_DIES = 3,
	SAY_EADRIC_DEFEATED = 4
};

class OrientationCheck
{
public:
	explicit OrientationCheck(Unit* _caster) : caster(_caster) { }
	bool operator() (WorldObject* object)
	{
		return !object->isInFront(caster, 40.0f) || !object->IsWithinDist(caster, 40.0f);
	}

private:
	Unit* caster;
};

class spell_eadric_radiance : public SpellScriptLoader
{
public:
	spell_eadric_radiance() : SpellScriptLoader("spell_eadric_radiance") { }

	class spell_eadric_radiance_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_eadric_radiance_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(OrientationCheck(GetCaster()));
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_eadric_radiance_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_eadric_radiance_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
		}
	};

	SpellScript *GetSpellScript() const
	{
		return new spell_eadric_radiance_SpellScript();
	}
};

class spell_eadric_hoj : public SpellScriptLoader
{
public:
	spell_eadric_hoj() : SpellScriptLoader("spell_eadric_hoj") { }

	class spell_eadric_hoj_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_eadric_hoj_SpellScript);

		void HandleOnHit()
		{
			if (GetHitUnit() && GetHitUnit()->GetTypeId() == TYPEID_PLAYER)
				if (!GetHitUnit()->HasAura(SPELL_HAMMER_JUSTICE_STUN))
				{
					SetHitDamage(0);
					GetHitUnit()->AddAura(SPELL_HAMMER_OVERRIDE_BAR, GetHitUnit());
				}
		}

		void Register()
		{
			OnHit += SpellHitFn(spell_eadric_hoj_SpellScript::HandleOnHit);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_eadric_hoj_SpellScript();
	}
};


class boss_eadric : public CreatureScript
{
public:
	boss_eadric() : CreatureScript("boss_eadric") {}

	struct boss_eadricAI : public BossAI
	{
		boss_eadricAI(Creature* creature) : BossAI(creature, BOSS_ARGENT_CHALLENGE_E)
		{
			instance = creature->GetInstanceScript();
			creature->SetReactState(REACT_PASSIVE);
			creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

			hasBeenInCombat = false;
			bCredit = false;
		}

		InstanceScript* instance;

		uint32 uiVenganceTimer;
		uint32 uiRadianceTimer;
		uint32 uiHammerJusticeTimer;
		uint32 uiResetTimer;

		bool bDone;
		bool hasBeenInCombat;
		bool bCredit;

		void Reset()
		{
			uiVenganceTimer = 10000;
			uiRadianceTimer = 16000;
			uiHammerJusticeTimer = 25000;
			uiResetTimer = 5000;

			bDone = false;
			Map* pMap = me->GetMap();
			if (hasBeenInCombat && pMap && pMap->IsDungeon())
			{
				Map::PlayerList const &players = pMap->GetPlayers();
				for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
				{
					if (itr->GetSource() && itr->GetSource()->IsAlive() && !itr->GetSource()->IsGameMaster())
						return;
				}

				if (instance)
				{
					GameObject* GO = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(DATA_MAIN_GATE1));
					if (GO)
						instance->HandleGameObject(GO->GetGUID(), true);
					Creature* announcer = pMap->GetCreature(instance->GetGuidData(DATA_ANNOUNCER));
					instance->SetData(DATA_ARGENT_SOLDIER_DEFEATED, 0);
					announcer->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				}

				me->RemoveFromWorld();
			}
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, 68575);
				}

				EnterEvadeMode();
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				Talk(SAY_EADRIC_DEFEATED);
				me->setFaction(35);
				bDone = true;
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(DATA_MAIN_GATE)))
					instance->HandleGameObject(pGO->GetGUID(), true);
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(DATA_MAIN_GATE1)))
					instance->HandleGameObject(pGO->GetGUID(), true);
				if (instance)
					instance->SetData(BOSS_ARGENT_CHALLENGE_E, DONE);
			}
		}

		void MovementInform(uint32 MovementType, uint32 Data)
		{
			if (MovementType != POINT_MOTION_TYPE)
				return;
		}

		void EnterCombat(Unit* pWho)
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			_EnterCombat();
			me->SetHomePosition(746.843f, 665.000f, 412.339f, 4.670f);
			Talk(SAY_EADRIC_AGGRO);
			hasBeenInCombat = true;
		}

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (IsHeroic() && !bDone)
				if (caster->GetTypeId() == TYPEID_PLAYER)
					if (spell->Id == SPELL_HAMMER_THROWBACK_DMG && me->GetHealth() <= spell->Effects[0].BasePoints)
						DoCast(caster, SPELL_EADRIC_ACHIEVEMENT);
		}

		void UpdateAI(uint32 uiDiff)
		{
			if (bDone && uiResetTimer <= uiDiff)
			{
				me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
				bDone = false;
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, instance->GetGuidData(DATA_MAIN_GATE)))
					instance->HandleGameObject(pGO->GetGUID(), false);
			}
			else
				uiResetTimer -= uiDiff;

			if (!UpdateVictim())
				return;

			if (uiHammerJusticeTimer <= uiDiff)
			{
				me->InterruptNonMeleeSpells(true);

				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
				{
					if (target && target->IsAlive())
					{
						Talk(SAY_EADRIC_HAMMER);
						DoCast(target, SPELL_HAMMER_JUSTICE);
						DoCast(target, SPELL_HAMMER_RIGHTEOUS);
					}
				}

				uiHammerJusticeTimer = 25000;
			}
			else
				uiHammerJusticeTimer -= uiDiff;

			if (uiVenganceTimer <= uiDiff)
			{
				DoCast(me, SPELL_VENGEANCE);

				uiVenganceTimer = 10000;
			}
			else
				uiVenganceTimer -= uiDiff;

			if (uiRadianceTimer <= uiDiff)
			{
				DoCastAOE(SPELL_RADIANCE);

				uiRadianceTimer = 16000;
			}
			else
				uiRadianceTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_eadricAI(creature);
	};
};

class boss_paletress : public CreatureScript
{
public:
	boss_paletress() : CreatureScript("boss_paletress") {}

	struct boss_paletressAI : public BossAI
	{
		boss_paletressAI(Creature* creature) : BossAI(creature, BOSS_ARGENT_CHALLENGE_P)
		{
			pInstance = creature->GetInstanceScript();

			hasBeenInCombat = false;
			bCredit = false;
			creature->SetReactState(REACT_PASSIVE);
			creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			creature->RestoreFaction();
		}

		InstanceScript* pInstance;

		Creature* pMemory;
		ObjectGuid MemoryGUID;

		bool bHealth;
		bool bDone;
		bool hasBeenInCombat;
		bool bCredit;
		bool introDone;

		uint32 uiHolyFireTimer;
		uint32 uiHolySmiteTimer;
		uint32 uiRenewTimer;
		uint32 uiResetTimer;
		uint32 introPart2;

		uint32 summonDelayTimer;
		bool needsToSummonMemory;
		bool wipe;

		void Reset()
		{
			me->RemoveAllAuras();

			introDone = false;

			uiHolyFireTimer = urand(9000, 12000);
			uiHolySmiteTimer = urand(5000, 7000);
			uiRenewTimer = urand(2000, 5000);
			summonDelayTimer = 0;
			needsToSummonMemory = false;
			uiResetTimer = 7000;
			bHealth = false;
			bDone = false;
			if (Creature* pMemory = ObjectAccessor::GetCreature(*me, MemoryGUID))
				if (pMemory->IsAlive())
					pMemory->RemoveFromWorld();

			if (wipe)
			{
				if (Creature* announcer = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(DATA_ANNOUNCER)))
				{
					announcer->AI()->Reset();
					announcer->AI()->EnterEvadeMode();
				}
			}

			wipe = false;

			Map* pMap = me->GetMap();
			if (hasBeenInCombat && pMap && pMap->IsDungeon())
			{

				Map::PlayerList const &players = pMap->GetPlayers();
				for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
				{
					if (itr->GetSource() && itr->GetSource()->IsAlive() && !itr->GetSource()->IsGameMaster())
						return;
				}

				if (pInstance)
				{
					GameObject* GO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1));
					if (GO)
						pInstance->HandleGameObject(GO->GetGUID(), true);
					if (Creature* announcer = pMap->GetCreature(pInstance->GetGuidData(DATA_ANNOUNCER)))
					{
						pInstance->SetData(DATA_ARGENT_SOLDIER_DEFEATED, 0);
						announcer->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
					}
				}

				me->RemoveFromWorld();
			}

		}

		void EnterCombat(Unit* pWho)
		{
			if (Creature* highlord = me->FindNearestCreature(NPC_HIGHLORD, 300.0f))
				highlord->AI()->Talk(20);

			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			_EnterCombat();
			me->SetHomePosition(746.843f, 665.000f, 412.339f, 4.670f);
			hasBeenInCombat = true;
			Talk(SAY_PALETRESS_AGGRO);
			wipe = true;
		}

		void SetData(uint32 uiId, uint32 uiValue)
		{
			if (uiId == 1)
				me->RemoveAura(SPELL_SHIELD);
			Talk(SAY_PALETRESS_MEMORY_DIES);
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, 68574);
				}

				EnterEvadeMode();
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				Talk(SAY_PALETRESS_DEFEATED);
				me->setFaction(35);
				bDone = true;
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE)))
					pInstance->HandleGameObject(pGO->GetGUID(), true);
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1)))
					pInstance->HandleGameObject(pGO->GetGUID(), true);
				pInstance->SetData(BOSS_ARGENT_CHALLENGE_P, DONE);
			}
		}

		void MovementInform(uint32 MovementType, uint32 Data)
		{
			if (MovementType != POINT_MOTION_TYPE)
				return;

			if (Data == 1)
			{
				Talk(0);
				introPart2 = 4000;
			}
		}

		void UpdateAI(uint32 uiDiff)
		{
			if (bDone && uiResetTimer <= uiDiff)
			{
				me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
				bDone = false;
				if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE)))
					pInstance->HandleGameObject(pGO->GetGUID(), false);
			}
			else
				uiResetTimer -= uiDiff;

			if (!introDone && introPart2 <= uiDiff)
			{
				Talk(1);
				introDone = true;
			}
			else
				introPart2 -= uiDiff;

			if (!UpdateVictim())
				return;

			if (uiHolyFireTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
				{
					if (target && target->IsAlive())
						DoCast(target, DUNGEON_MODE(SPELL_HOLY_FIRE, SPELL_HOLY_FIRE_H));
				}

				if (me->HasAura(SPELL_SHIELD))
					uiHolyFireTimer = 13000;
				else
					uiHolyFireTimer = urand(9000, 12000);
			}
			else
				uiHolyFireTimer -= uiDiff;

			if (uiHolySmiteTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 250, true))
				{
					if (target && target->IsAlive())
						DoCast(target, DUNGEON_MODE(SPELL_SMITE, SPELL_SMITE_H));
				}
				if (me->HasAura(SPELL_SHIELD))
					uiHolySmiteTimer = 9000;
				else
					uiHolySmiteTimer = urand(5000, 7000);
			}
			else
				uiHolySmiteTimer -= uiDiff;

			if (me->HasAura(SPELL_SHIELD))
			{
				if (uiRenewTimer <= uiDiff)
				{
					me->InterruptNonMeleeSpells(true);
					uint8 uiTarget = urand(0, 1);
					switch (uiTarget)
					{
					case 0:
						DoCast(me, DUNGEON_MODE(SPELL_RENEW, SPELL_RENEW_H));
						break;
					case 1:
						if (Creature* pMemory = ObjectAccessor::GetCreature(*me, MemoryGUID))
							if (pMemory->IsAlive())
								DoCast(pMemory, DUNGEON_MODE(SPELL_RENEW, SPELL_RENEW_H));
						break;
					}
					uiRenewTimer = urand(15000, 17000);
				}
				else
					uiRenewTimer -= uiDiff;
			}

			if (needsToSummonMemory)
				if (summonDelayTimer <= uiDiff)
				{
					/*uint32 spellId = urand(66694, 66715); // 66543...91,92
					//quizá montar un objecto spell y extraer el valor misc A para despawnear?
					// o quizá simplemente un despawn desde el propio script de la memoria al reset, que compruebe algo de la instancia (get el estado del encuentro, por ejemplo)*/

					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
					{
						target->CastSpell(target, 66694); // Hack, used a spell just for the smoke effect, but removed the summon and so, spawned them via manual.
						switch (urand(0, 24))
						{
						case 0:
							me->SummonCreature(MEMORY_ALGALON, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 1:
							me->SummonCreature(MEMORY_CHROMAGGUS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 2:
							me->SummonCreature(MEMORY_CYANIGOSA, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 3:
							me->SummonCreature(MEMORY_DELRISSA, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 4:
							me->SummonCreature(MEMORY_ECK, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 5:
							me->SummonCreature(MEMORY_ENTROPIUS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 6:
							me->SummonCreature(MEMORY_GRUUL, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 7:
							me->SummonCreature(MEMORY_HAKKAR, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 8:
							me->SummonCreature(MEMORY_HEIGAN, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 9:
							me->SummonCreature(MEMORY_HEROD, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 10:
							me->SummonCreature(MEMORY_HOGGER, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 11:
							me->SummonCreature(MEMORY_IGNIS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 12:
							me->SummonCreature(MEMORY_ILLIDAN, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 13:
							me->SummonCreature(MEMORY_INGVAR, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 14:
							me->SummonCreature(MEMORY_KALITHRESH, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 15:
							me->SummonCreature(MEMORY_LUCIFRON, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 16:
							me->SummonCreature(MEMORY_MALCHEZAAR, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 17:
							me->SummonCreature(MEMORY_MUTANUS, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 18:
							me->SummonCreature(MEMORY_ONYXIA, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 19:
							me->SummonCreature(MEMORY_THUNDERAAN, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 20:
							me->SummonCreature(MEMORY_VANCLEEF, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 21:
							me->SummonCreature(MEMORY_VASHJ, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 22:
							me->SummonCreature(MEMORY_VEKNILASH, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 23:
							me->SummonCreature(MEMORY_VEZAX, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						case 24:
							me->SummonCreature(MEMORY_ARCHIMONDE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
							break;
						}
					}



					needsToSummonMemory = false;
				}
				else
					summonDelayTimer -= uiDiff;

			if (!bHealth && me->GetHealth() * 100 / me->GetMaxHealth() <= 35)
			{
				Talk(SAY_PALETRESS_SUMMON_MEMORY);
				me->InterruptNonMeleeSpells(true);
				DoCastAOE(SPELL_HOLY_NOVA, false);
				DoCast(me, SPELL_SHIELD);
				DoCastAOE(SPELL_CONFESS, false);
				summonDelayTimer = 1000;
				needsToSummonMemory = true;

				bHealth = true;

			}

			DoMeleeAttackIfReady();
		}

		void JustSummoned(Creature* summon)
		{
			MemoryGUID = summon->GetGUID();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_paletressAI(creature);
	};
};

class npc_memory : public CreatureScript
{
public:
	npc_memory() : CreatureScript("npc_memory") {}

	struct npc_memoryAI : public ScriptedAI
	{
		npc_memoryAI(Creature* creature) : ScriptedAI(creature)
		{
			pInstance = creature->GetInstanceScript();
		}

		InstanceScript* pInstance;
		uint32 uiOldWoundsTimer;
		uint32 uiShadowPastTimer;
		uint32 uiWakingNightmare;

		void Reset()
		{
			uiOldWoundsTimer = 12000;
			uiShadowPastTimer = 5000;
			uiWakingNightmare = 7000;

			DoCast(SPELL_SHADOW_FORM);
			DoCast(SPELL_MEMORY_SPAWN_EFFECT);
		}

		void UpdateAI(uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (uiOldWoundsTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
				{
					if (target && target->IsAlive())
						DoCast(target, SPELL_OLD_WOUNDS);
				}
				uiOldWoundsTimer = 12000;
			}
			else uiOldWoundsTimer -= uiDiff;

			if (uiWakingNightmare <= uiDiff)
			{
				//Talk(); // Nightmare
				DoCast(me, DUNGEON_MODE(SPELL_WAKING_NIGHTMARE, SPELL_WAKING_NIGHTMARE_H));
				uiWakingNightmare = 15000;
			}
			else
				uiWakingNightmare -= uiDiff;

			if (uiShadowPastTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
				{
					if (target && target->IsAlive())
						DoCast(target, DUNGEON_MODE(SPELL_SHADOWS_PAST, SPELL_SHADOWS_PAST_H));
				}

				uiShadowPastTimer = 9000;
			}
			else
				uiShadowPastTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}

		void JustDied(Unit* killer)
		{
			if (Creature* argentChampion = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(DATA_ARGENT_CHAMPION)))
			{
				argentChampion->AI()->SetData(1, 0);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_memoryAI(creature);
	};
};

class npc_argent_soldier : public CreatureScript
{
public:
	npc_argent_soldier() : CreatureScript("npc_argent_soldier") {}

	struct npc_argent_soldierAI : public npc_escortAI
	{
		npc_argent_soldierAI(Creature* creature) : npc_escortAI(creature)
		{
			pInstance = creature->GetInstanceScript();
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE)))
				pInstance->HandleGameObject(pGO->GetGUID(), true);
			SetDespawnAtEnd(false);
			uiWaypoint = 0;
			bStarted = false;
			me->SetWalk(true);
		}

		InstanceScript* pInstance;

		uint8 uiWaypoint;

		uint32 uiUnbalancedStrikeTimer;
		uint32 uiCleaveTimer;
		uint32 uiPummelTimer;
		uint32 uiPainTimer;
		uint32 uiMindTimer;
		uint32 uiSsmiteTimer;
		uint32 uiBlazingLightTimer;
		uint32 uiFlurryTimer;
		uint32 uiFinalTimer;
		uint32 uiDivineTimer;
		uint32 timerFountain;

		bool shieldCasted;
		bool bStarted;

		bool monk;
		bool priestess;
		bool lightwielder;

		void Reset()
		{
			/*



			uiSsmiteTimer = 6000;
			uiBlazingLightTimer = 3000;

			uiFinalTimer = 30000;
			uiDivineTimer = 70000;*/
			monk = false;
			priestess = false;
			lightwielder = false;
			me->SetWalk(true);
			switch (me->GetEntry())
			{
			case NPC_ARGENT_LIGHWIELDER:
				lightwielder = true;
				uiCleaveTimer = 6000;
				uiUnbalancedStrikeTimer = 5000;
				uiBlazingLightTimer = 3000;
				break;
			case NPC_ARGENT_MONK:
				uiPummelTimer = 1000;
				uiFlurryTimer = 2000;
				monk = true;
				shieldCasted = false;
				break;
			case NPC_PRIESTESS:
				timerFountain = 7000;
				uiPainTimer = 2000;
				uiMindTimer = 10000;
				uiSsmiteTimer = 1000;
				priestess = true;
				break;
			}
			if (bStarted)
			{
				me->SetReactState(REACT_AGGRESSIVE);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			}
		}

		void WaypointReached(uint32 uiPoint)
		{
			if (uiPoint == 0)
			{
				switch (uiWaypoint)
				{
				case 1:
					me->SetOrientation(4.60f);
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
					bStarted = true;
					break;
				}
			}

			if (uiPoint == 1)
			{

				switch (uiWaypoint)
				{
				case 0:
					me->SetOrientation(5.81f);
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
					bStarted = true;
					break;
				case 2:
					me->SetOrientation(3.39f);
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
					bStarted = true;
					if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE)))
						pInstance->HandleGameObject(pGO->GetGUID(), false);
					break;
				}

				me->SendMovementFlagUpdate();
			}
		}

		void SetData(uint32 uiType, uint32 uiData)
		{
			switch (me->GetEntry())
			{
			case NPC_ARGENT_LIGHWIELDER:
				switch (uiType)
				{
				case 0:
					AddWaypoint(0, 737.14f, 655.42f, 412.88f);
					AddWaypoint(1, 712.14f, 628.42f, 411.88f);
					break;
				case 1:
					AddWaypoint(0, 742.44f, 650.29f, 411.79f);
					break;
				case 2:
					AddWaypoint(0, 756.14f, 655.42f, 411.88f);
					AddWaypoint(1, 775.912f, 639.033f, 411.907f);
					break;
				}
				break;
			case NPC_ARGENT_MONK:
				switch (uiType)
				{
				case 0:
					AddWaypoint(0, 737.14f, 655.42f, 412.88f);
					AddWaypoint(1, 713.12f, 632.97f, 411.90f);
					break;
				case 1:
					AddWaypoint(0, 746.73f, 650.24f, 411.56f);
					break;
				case 2:
					AddWaypoint(0, 756.14f, 655.42f, 411.88f);
					AddWaypoint(1, 784.817f, 629.883f, 411.908f);
					break;
				}
				break;
			case NPC_PRIESTESS:
				switch (uiType)
				{
				case 0:
					AddWaypoint(0, 737.14f, 655.42f, 412.88f);
					AddWaypoint(1, 715.06f, 637.07f, 411.91f);
					break;
				case 1:
					AddWaypoint(0, 750.72f, 650.20f, 411.77f);
					break;
				case 2:
					AddWaypoint(0, 756.14f, 655.42f, 411.88f);
					AddWaypoint(1, 779.942f, 634.061f, 411.905f);
					break;
				}
				break;
			}

			Start(false, true, ObjectGuid::Empty);
			uiWaypoint = uiType;
		}

		void DamageTaken(Unit* /*attacker*/, uint32 & damage)
		{
			if (!monk)
				return;

			if (damage >= me->GetHealth() && !shieldCasted)
			{
				damage = 0;
				DoCast(me, SPELL_DIVINE_SHIELD, true);
				DoCastVictim(SPELL_FINAL_MEDITATION);
				shieldCasted = true;
			}
		}

		void UpdateAI(uint32 uiDiff)
		{
			npc_escortAI::UpdateAI(uiDiff);

			if (!UpdateVictim())
				return;

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;


			if (monk)
				if (me->HasAura(SPELL_DIVINE_SHIELD))
					return;

			if (lightwielder)
				if (uiCleaveTimer <= uiDiff)
				{
					DoCastVictim(SPELL_CLEAVE);
					uiCleaveTimer = urand(7000, 8500);
				}
				else
					uiCleaveTimer -= uiDiff;

			if (lightwielder)
				if (uiUnbalancedStrikeTimer <= uiDiff)
				{
					DoCastVictim(SPELL_UNBALANCING_STRIKE);
					uiUnbalancedStrikeTimer = urand(3000, 6000);
				}
				else
					uiUnbalancedStrikeTimer -= uiDiff;

			if (monk)
				if (uiPummelTimer <= uiDiff)
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(target, SPELL_PUMMEL);
					uiPummelTimer = urand(3000, 6000);
				}
				else
					uiPummelTimer -= uiDiff;

			if (priestess)
				if (uiPainTimer <= uiDiff)
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
						if (!target->HasAura(IsHeroic() ? SPELL_SHADOW_WORD_PAIN_H : SPELL_SHADOW_WORD_PAIN))
							DoCast(target, IsHeroic() ? SPELL_SHADOW_WORD_PAIN_H : SPELL_SHADOW_WORD_PAIN);

					uiPainTimer = urand(3000, 5000);
				}
				else
					uiPainTimer -= uiDiff;

			if (priestess)
				if (uiMindTimer <= uiDiff)
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(target, SPELL_MIND);
					uiMindTimer = urand(15000, 20000);
				}
				else
					uiMindTimer -= uiDiff;

			if (priestess)
				if (uiSsmiteTimer <= uiDiff)
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
						DoCast(target, IsHeroic() ? SPELL_HOLY_SMITE_H : SPELL_HOLY_SMITE);

					uiSsmiteTimer = urand(1000, 2000);
				}
				else
					uiSsmiteTimer -= uiDiff;

			if (priestess)
				if (timerFountain <= uiDiff)
				{
					DoCast(SPELL_FOUNTAIN_OF_LIGHT);
					timerFountain = urand(30000, 35000);
				}
				else timerFountain -= uiDiff;

				if (lightwielder)
					if (uiBlazingLightTimer <= uiDiff)
					{
						if (Unit* target = DoSelectLowestHpFriendly(40))
						{
							if (!target || target->GetHealth() > me->GetHealth())
								target = me;

							DoCast(target, DUNGEON_MODE(SPELL_LIGHT, SPELL_LIGHT_H));
						}

						uiBlazingLightTimer = urand(8000, 10000);
					}
					else
						uiBlazingLightTimer -= uiDiff;

				if (monk)
					if (uiFlurryTimer <= uiDiff)
					{
						DoCast(me, SPELL_FLURRY);
						uiFlurryTimer = urand(7000, 10000);
					}
					else
						uiFlurryTimer -= uiDiff;

				DoMeleeAttackIfReady();
		}

		void JustDied(Unit* killer)
		{
			if (pInstance)
				pInstance->SetData(DATA_ARGENT_SOLDIER_DEFEATED, pInstance->GetData(DATA_ARGENT_SOLDIER_DEFEATED) + 1);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_argent_soldierAI(creature);
	};
};

enum ReflectiveShield
{
	SPELL_REFLECTIVE_SHIELD_TRIGGERED = 33619,
};

// Reflective Shield 66515
class spell_gen_reflective_shield : public SpellScriptLoader
{
public:
	spell_gen_reflective_shield() : SpellScriptLoader("spell_gen_reflective_shield") { }

	class spell_gen_reflective_shield_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_gen_reflective_shield_AuraScript);

		bool Validate(SpellInfo const* /*spellEntry*/)
		{
			return sSpellStore.LookupEntry(SPELL_REFLECTIVE_SHIELD_TRIGGERED);
		}

		void Trigger(AuraEffect * aurEff, DamageInfo & dmgInfo, uint32 & absorbAmount)
		{
			Unit * target = dmgInfo.GetAttacker();
			if (!target)
				return;
			Unit * caster = GetCaster();
			if (!caster)
				return;
			int32 bp = CalculatePct(absorbAmount, 25);
			target->CastCustomSpell(target, SPELL_REFLECTIVE_SHIELD_TRIGGERED, &bp, NULL, NULL, true, NULL, aurEff);
		}

		void Register()
		{
			AfterEffectAbsorb += AuraEffectAbsorbFn(spell_gen_reflective_shield_AuraScript::Trigger, EFFECT_0);
		}
	};

	AuraScript *GetAuraScript() const
	{
		return new spell_gen_reflective_shield_AuraScript();
	}
};

class achievement_toc5_argent_challenge : public AchievementCriteriaScript
{
public:
	uint32 creature_entry;

	achievement_toc5_argent_challenge(const char* name, uint32 original_entry) : AchievementCriteriaScript(name)
	{
		creature_entry = original_entry;
	}

	bool OnCheck(Player* source, Unit* target)
	{
		if (!target)
			return false;

		if (Creature* creature = target->ToCreature())
			if (creature->GetOriginalEntry() == creature_entry)
				return true;

		return false;
	}
};

void AddSC_boss_argent_challenge()
{
	new boss_eadric();
	new spell_eadric_radiance();
	new spell_eadric_hoj();
	new boss_paletress();
	new npc_memory();
	new npc_argent_soldier();
	new spell_gen_reflective_shield();
	new achievement_toc5_argent_challenge("achievement_toc5_paletress", NPC_PALETRESS);
	new achievement_toc5_argent_challenge("achievement_toc5_eadric", NPC_EADRIC);
}