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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "ulduar.h"

enum HodirYells
{
	SAY_AGGRO = 0,
	SAY_SLAY = 1,
	SAY_FLASH_FREEZE = 2,
	SAY_STALACTITE = 3,
	SAY_DEATH = 4,
	SAY_BERSERK = 5,
	SAY_HARD_MODE_FAILED = 6,
	EMOTE_FREEZE = 7,
	EMOTE_BLOWS = 8
};

enum HodirSpells
{
	// Hodir
	SPELL_FROZEN_BLOWS = 62478,
	SPELL_FLASH_FREEZE = 61968,
	SPELL_FLASH_FREEZE_VISUAL = 62148,
	SPELL_BITING_COLD = 62038,
	SPELL_BITING_COLD_TRIGGERED = 62039, // Needed for Achievement Getting Cold In Here
	SPELL_BITING_COLD_DAMAGE = 62188,
	SPELL_FREEZE = 62469,
	SPELL_ICICLE = 62234,
	SPELL_ICICLE_SNOWDRIFT = 62462,
	SPELL_BLOCK_OF_ICE = 61969, // Player + Helper
	SPELL_SUMMON_FLASH_FREEZE_HELPER = 61989, // Helper
	SPELL_SUMMON_BLOCK_OF_ICE = 61970, // Player + Helper
	SPELL_FLASH_FREEZE_HELPER = 61990, // Helper
	SPELL_FLASH_FREEZE_KILL = 62226,
	SPELL_ICICLE_FALL = 69428,
	SPELL_FALL_DAMAGE = 62236,
	SPELL_FALL_SNOWDRIFT = 62460,
	SPELL_BERSERK = 47008,
	SPELL_ICE_SHARD = 62457,
	SPELL_ICE_SHARD_HIT = 65370,

	SPELL_KILL_CREDIT = 64899,

	// Druids
	SPELL_WRATH = 62793,
	SPELL_STARLIGHT = 62807,

	// Shamans
	SPELL_LAVA_BURST = 61924,
	SPELL_STORM_CLOUD = 65123,
	SPELL_STORM_POWER_10 = 63711,
	SPELL_STORM_POWER_25 = 65134,

	// Mages
	SPELL_FIREBALL = 61909,
	SPELL_CONJURE_FIRE = 62823,
	SPELL_MELT_ICE = 64528,
	SPELL_SINGED = 62821,

	// Priests
	SPELL_SMITE = 61923,
	SPELL_GREATER_HEAL = 62809,
	SPELL_DISPEL_MAGIC = 63499,
};

#define SPELL_STORM_POWER RAID_MODE(SPELL_STORM_POWER_10, SPELL_STORM_POWER_25)

enum HodirNPC
{
	NPC_ICE_BLOCK = 32938,
	NPC_FLASH_FREEZE = 32926,
	NPC_SNOWPACKED_ICICLE = 33174,
	NPC_ICICLE = 33169,
	NPC_ICICLE_SNOWDRIFT = 33173,
	NPC_TOASTY_FIRE = 33342,
};

enum HodirGameObjects
{
	GO_TOASTY_FIRE = 194300,
	GO_SNOWDRIFT = 194173,
};

enum HodirEvents
{
	// Hodir
	EVENT_FREEZE = 1,
	EVENT_FLASH_FREEZE = 2,
	EVENT_FLASH_FREEZE_EFFECT = 3,
	EVENT_ICICLE = 4,
	EVENT_BLOWS = 5,
	EVENT_RARE_CACHE = 6,
	EVENT_BERSERK = 7,

	// Priest
	EVENT_HEAL = 8,
	EVENT_DISPEL_MAGIC = 9,

	// Shaman
	EVENT_STORM_CLOUD = 10,

	// Druid
	EVENT_STARLIGHT = 11,

	// Mage
	EVENT_CONJURE_FIRE = 12,
	EVENT_MELT_ICE = 13,

	EVENT_ICE_BLOCK_CLEANER = 14,
};

enum HodirActions
{
	ACTION_I_HAVE_THE_COOLEST_FRIENDS = 1,
	ACTION_CHEESE_THE_FREEZE = 2,
	ACTION_DESPAWN_AFTER_FLASH_FREEZE = 3,
};

#define ACHIEVEMENT_ICOULD_SAY_THIS_CACHE_WAS_RARE            RAID_MODE(3182, 3184)
#define ACHIEVEMENT_CHEESE_THE_FREEZE            RAID_MODE(2961, 2962)
#define ACHIEVEMENT_GETTING_COLD_IN_HERE         RAID_MODE(2967, 2968)
#define ACHIEVEMENT_COOLEST_FRIENDS              RAID_MODE(2963, 2965)
#define ACHIEVEMENT_STAYING_BUFFED_ALL_WINTER    RAID_MODE(2969, 2970) // 10223, 10240, 10241 - 10229, 10238, 10239
#define FRIENDS_COUNT                            RAID_MODE(4, 8)

enum Misc
{
	DATA_GETTING_COLD_IN_HERE = 29672968 // 2967, 2968 are achievement IDs
};

Position const SummonPositions[8] =
{
	{ 1983.75f, -243.36f, 432.767f, 1.57f }, // Field Medic Penny    &&  Battle-Priest Eliza
	{ 1999.90f, -230.49f, 432.767f, 1.57f }, // Eivi Nightfeather    &&  Tor Greycloud
	{ 2010.06f, -243.45f, 432.767f, 1.57f }, // Elementalist Mahfuun &&  Spiritwalker Tara
	{ 2021.12f, -236.65f, 432.767f, 1.57f }, // Missy Flamecuffs     &&  Amira Blazeweaver
	{ 2028.10f, -244.66f, 432.767f, 1.57f }, // Field Medic Jessi    &&  Battle-Priest Gina
	{ 2014.18f, -232.80f, 432.767f, 1.57f }, // Ellie Nightfeather   &&  Kar Greycloud
	{ 1992.90f, -237.54f, 432.767f, 1.57f }, // Elementalist Avuun   &&  Spiritwalker Yona
	{ 1976.60f, -233.53f, 432.767f, 1.57f }, // Sissy Flamecuffs     &&  Veesha Blazeweaver
};

uint32 const Entry[8] =
{
	NPC_FIELD_MEDIC_PENNY,
	NPC_EIVI_NIGHTFEATHER,
	NPC_ELEMENTALIST_MAHFUUN,
	NPC_MISSY_FLAMECUFFS,
	NPC_FIELD_MEDIC_JESSI,
	NPC_ELLIE_NIGHTFEATHER,
	NPC_ELEMENTALIST_AVUUN,
	NPC_SISSY_FLAMECUFFS,
};

class npc_flash_freeze : public CreatureScript
{
public:
	npc_flash_freeze() : CreatureScript("npc_flash_freeze") { }

	struct npc_flash_freezeAI : public ScriptedAI
	{
		npc_flash_freezeAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);
		}

		InstanceScript* instance;

		ObjectGuid targetGUID;
		uint32 checkDespawnTimer;

		void Reset() override
		{
		//	targetGUID = 0;
			checkDespawnTimer = 1000;
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;

			if (!UpdateVictim()
				|| !me->GetVictim()
				|| me->EnsureVictim()->HasAura(SPELL_BLOCK_OF_ICE)
				|| me->EnsureVictim()->HasAura(SPELL_FLASH_FREEZE_HELPER))
				return;

			if (me->EnsureVictim()->GetGUID() != targetGUID || instance->GetBossState(BOSS_HODIR) != IN_PROGRESS)
				me->DespawnOrUnsummon();

			if (checkDespawnTimer <= diff)
			{
				if (Unit* target = ObjectAccessor::GetUnit(*me, targetGUID))
					if (!target->IsAlive())
						me->DisappearAndDie();
				checkDespawnTimer = 2500;
			}
			else
				checkDespawnTimer -= diff;
		}

			void IsSummonedBy(Unit* summoner) override
		{
			targetGUID = summoner->GetGUID();
			me->SetInCombatWith(summoner);
			me->AddThreat(summoner, 250.0f);
			if (Unit* target = ObjectAccessor::GetUnit(*me, targetGUID))
			{
				DoCast(target, SPELL_BLOCK_OF_ICE, true);
				// Prevents to have Ice Block on other place than target is
				me->NearTeleportTo(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation());
				if (target->GetTypeId() == TYPEID_PLAYER)
					if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
						Hodir->AI()->DoAction(ACTION_CHEESE_THE_FREEZE);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_flash_freezeAI(creature);
	}
};

class npc_ice_block : public CreatureScript
{
public:
	npc_ice_block() : CreatureScript("npc_ice_block") { }

	struct npc_ice_blockAI : public ScriptedAI
	{
		npc_ice_blockAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);
			//targetGUID = 0;
		}

		InstanceScript* instance;

		ObjectGuid targetGUID;

		void IsSummonedBy(Unit* summoner) override
		{
			targetGUID = summoner->GetGUID();
			summoner->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);
			me->SetInCombatWith(summoner);
			me->AddThreat(summoner, 250.0f);
			summoner->AddThreat(me, 250.0f);
			if (Creature* target = ObjectAccessor::GetCreature(*me, targetGUID))
			{
				DoCast(target, SPELL_FLASH_FREEZE_HELPER, true);
				// Prevents to have Ice Block on other place than target is
				me->NearTeleportTo(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation());
			}
		}

			void JustDied(Unit* /*who*/) override
		{
			if (Creature* iceBlock = me->FindNearestCreature(NPC_ICE_BLOCK, 1.0f)) //  NPC_FLASH_FREEZE
			{
				iceBlock->DespawnOrUnsummon();
			}

			if (Creature* flashFreeze = me->FindNearestCreature(NPC_FLASH_FREEZE, 1.0f))
			{
				flashFreeze->DespawnOrUnsummon();
			}
		}

			void DamageTaken(Unit* who, uint32& damage) override
		{

			if (Creature* Helper = ObjectAccessor::GetCreature(*me, targetGUID))
			{
				Helper->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_STUNNED | UNIT_FLAG_PACIFIED);

				if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
				{
					if (!Hodir->IsInCombat() && !Hodir->IsInEvadeMode() && !Hodir->GetVictim())
					{
						/*Hodir->SetReactState(REACT_AGGRESSIVE);
						Hodir->AI()->DoZoneInCombat();*/
						Hodir->SetReactState(REACT_AGGRESSIVE);
						//Hodir->AI()->DoZoneInCombat();
						Hodir->AI()->AttackStart(who);
						//Hodir->AI()->EnterCombat(who);
					}
					Helper->AI()->AttackStart(Hodir);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ice_blockAI(creature);
	}
};

class boss_hodir : public CreatureScript
{
public:
	boss_hodir() : CreatureScript("boss_hodir") { }

	struct boss_hodirAI : public BossAI
	{
		boss_hodirAI(Creature* creature) : BossAI(creature, BOSS_HODIR)
		{
			gotEncounterFinished = false;
			me->SetReactState(REACT_PASSIVE);
			homePosition = creature->GetHomePosition();
		}

		uint32 gettingColdInHereTimer;

		//Reset/Evade Security.

		Position homePosition;

		bool gettingColdInHere;
		bool cheeseTheFreeze;
		bool iHaveTheCoolestFriends;
		bool iCouldSayThatThisCacheWasRare;
		bool gotEncounterFinished;

		void Despawn(uint32 id)
		{
			std::list<Creature*> pCreatureList;

			Trinity::AllCreaturesOfEntryInRange checker(me, id, 250.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, pCreatureList, checker);

            me->VisitNearbyObject(250.0f, searcher);

			if (pCreatureList.empty())
				return;

			if (!pCreatureList.empty())
			{
				for (std::list<Creature*>::iterator i = pCreatureList.begin(); i != pCreatureList.end(); ++i)
				{
					(*i)->DespawnOrUnsummon();
				}

			}
		}

		void Reset() override
		{
			//_EnterEvadeMode();

			_Reset();
			gotEncounterFinished = gotEncounterFinished || (instance->GetBossState(BOSS_HODIR) == DONE);

			if (gotEncounterFinished)
			{
				me->setFaction(FACTION_FRIENDLY);
				return;
			}

			//me->setFaction(FACTION_HOSTILE);
			me->SetReactState(REACT_PASSIVE);

			Despawn(NPC_FLASH_FREEZE);
			Despawn(NPC_ICE_BLOCK);

			for (uint8 n = 0; n < FRIENDS_COUNT; ++n)
				if (Creature* FrozenHelper = me->SummonCreature(Entry[n], SummonPositions[n], TEMPSUMMON_MANUAL_DESPAWN))
					FrozenHelper->CastSpell(FrozenHelper, SPELL_SUMMON_FLASH_FREEZE_HELPER, true);
		}

			void JustReachedHome() override
		{
			if (me->getFaction() == FACTION_FRIENDLY)
			me->setFaction(FACTION_HOSTILE);
		}

			void EnterEvadeMode() override
		{
			if (!_EnterEvadeMode())
			return;

			//_EnterEvadeMode();

			me->setFaction(FACTION_FRIENDLY);
			me->SetHomePosition(homePosition);
			me->GetMotionMaster()->MoveTargetedHome();
			Reset();
		}

			void EnterCombat(Unit* who) override
		{

			/*if(me->GetReactState() == REACT_PASSIVE){
			me->SetReactState(REACT_AGGRESSIVE);
			}*/


			_EnterCombat();
			DoZoneInCombat();
			Talk(SAY_AGGRO);
			//
			if (me->GetReactState() != REACT_AGGRESSIVE)
				me->SetReactState(REACT_AGGRESSIVE);

			if (me->getFaction() == FACTION_FRIENDLY)
				me->setFaction(FACTION_HOSTILE);

			if (who)
				AttackStart(who);


			//Start Comabt when someone attacks just Thorim, no Ice Blocks.

			//me->AI()->AttackStart(who);

			//Spell bite.
			DoCast(me, SPELL_BITING_COLD, true);

			gettingColdInHereTimer = 1000;
			gettingColdInHere = true;
			cheeseTheFreeze = true;
			iHaveTheCoolestFriends = true;
			iCouldSayThatThisCacheWasRare = true;


			events.ScheduleEvent(EVENT_ICICLE, 2000);
			events.ScheduleEvent(EVENT_FREEZE, 15000);
			events.ScheduleEvent(EVENT_BLOWS, 41000);
			events.ScheduleEvent(EVENT_FLASH_FREEZE, 40000);
			events.ScheduleEvent(EVENT_RARE_CACHE, 160000); // Currently, 3 minutes. 2 minutes, pre-nerf. Maybe too hardcore?
			events.ScheduleEvent(EVENT_BERSERK, 480000);
		}

			void KilledUnit(Unit* who) override
		{
			if (who->GetTypeId() == TYPEID_PLAYER)
			Talk(SAY_SLAY);
		}

			void DamageTaken(Unit* who, uint32& damage) override
		{

			if (damage >= me->GetHealth())
			{
				damage = 0;
				me->SetFullHealth();
				me->SetReactState(REACT_PASSIVE);
				EncounterPostProgress();
			}
		}

			void EncounterPostProgress()
		{
			if (gotEncounterFinished)  // lock, function should not be called twice
				return;            

            Despawn(NPC_FLASH_FREEZE);
            Despawn(NPC_ICE_BLOCK);
			gotEncounterFinished = true;

			Talk(SAY_DEATH);

			if (iCouldSayThatThisCacheWasRare || iHaveTheCoolestFriends || cheeseTheFreeze || gettingColdInHere)
			{


				if (iCouldSayThatThisCacheWasRare)
				{
					instance->SetData(DATA_HODIR_RARE_CACHE, 1);
					if (GameObject* normalCache = me->FindNearestGameObject(RAID_MODE(GO_HODIR_CHEST, GO_HODIR_CHEST_HERO), 100.0f))
						normalCache->RemoveFromWorld();
				}

				Map* map = me->GetMap();
				if (map && map->IsDungeon())
				{
					std::list<Player*> playerList;
					Map::PlayerList const& players = map->GetPlayers();
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						if (Player* player = itr->GetSource())
						{
							if (iCouldSayThatThisCacheWasRare)
							{
								if (AchievementEntry const* IcouldSayThisCacheWasRare = sAchievementMgr->GetAchievement(ACHIEVEMENT_ICOULD_SAY_THIS_CACHE_WAS_RARE))
									player->CompletedAchievement(IcouldSayThisCacheWasRare);
							}

							if (iHaveTheCoolestFriends)
							{
								if (AchievementEntry const* IhaveTheCoolestFriends = sAchievementMgr->GetAchievement(ACHIEVEMENT_COOLEST_FRIENDS))
									player->CompletedAchievement(IhaveTheCoolestFriends);
							}

							if (cheeseTheFreeze)
							{
								if (AchievementEntry const* CheeseTheFreeze = sAchievementMgr->GetAchievement(ACHIEVEMENT_CHEESE_THE_FREEZE))
									player->CompletedAchievement(CheeseTheFreeze);
							}

							if (gettingColdInHere)
							{
								if (AchievementEntry const* GettingColdInHere = sAchievementMgr->GetAchievement(ACHIEVEMENT_GETTING_COLD_IN_HERE))
									player->CompletedAchievement(GettingColdInHere);
							}
						}
					}
				}
			}



			DoCastAOE(SPELL_KILL_CREDIT);
			instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, 64899);
			
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
			me->setFaction(35);
			me->AttackStop();
			me->CombatStop();
			me->RemoveAllAuras();
			me->RemoveAllAttackers();
			me->GetMotionMaster()->Clear();
			me->InterruptNonMeleeSpells(true);
			instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BITING_COLD_TRIGGERED);
			me->StopMoving();			
			
			me->SetControlled(true, UNIT_STATE_STUNNED);
			me->CombatStop(true);

            Map::PlayerList const& pList = me->GetMap()->GetPlayers();
            for (Map::PlayerList::const_iterator itr = pList.begin(); itr != pList.end(); ++itr)
            {
                if (me->GetDistance(itr->GetSource()) > 100.0f || !itr->GetSource()->IsAlive())
                    continue;

                itr->GetSource()->CombatStopWithPets();
            }
			
			events.Reset();
			summons.DespawnAll();
			me->DespawnOrUnsummon(10000);
            _JustDied();
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			return;


			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;


			if (!me->IsWithinDist(me->GetVictim()->ToPlayer(), 200.0f))
			{
				EnterEvadeMode();
				//if (!me->GetVictim()->HasAura(SPELL_FLASH_FREEZE_HELPER))

				return;
			}

			/*
			if (checkTargetTimer < diff)
			{
			if (!SelectTarget(SELECT_TARGET_RANDOM, 0, 200.0f, true))
			{
			EnterEvadeMode();
			return;
			}
			checkTargetTimer = 7*IN_MILLISECONDS;
			}
			else
			checkTargetTimer -= diff;
			*/

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FREEZE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
						DoCast(target, SPELL_FREEZE);
					//DoCastAOE(SPELL_FREEZE);
					events.ScheduleEvent(EVENT_FREEZE, urand(18 * IN_MILLISECONDS, 25 * IN_MILLISECONDS));
					break;
				case EVENT_ICICLE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
						DoCast(target, SPELL_ICICLE);
					events.ScheduleEvent(EVENT_ICICLE, RAID_MODE(4500, 3000));
					break;
				case EVENT_FLASH_FREEZE: // + 14 secs delay
					Talk(SAY_FLASH_FREEZE);
					Talk(EMOTE_FREEZE);
					for (uint8 n = 0; n < RAID_MODE(2, 3); ++n)
						if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
							target->CastSpell(target, SPELL_ICICLE_SNOWDRIFT, true);
					DoCast(SPELL_FLASH_FREEZE);
					events.DelayEvents(14 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_FLASH_FREEZE_EFFECT, 500);
					break;
				case EVENT_FLASH_FREEZE_EFFECT: // El spell 62148 61968 tiene SPELL_ATTR2_CAN_TARGET_NOT_IN_LOS asi que quitaselo para ver si asi no agrea a los de Thorim.
				{
					
					if (Creature* snowpacked = me->FindNearestCreature(NPC_SNOWPACKED_ICICLE, 150.0f))
						snowpacked->CastSpell(me, SPELL_FLASH_FREEZE_VISUAL, true);

					FlashFreeze();
					events.CancelEvent(EVENT_FLASH_FREEZE_EFFECT);

					events.ScheduleEvent(EVENT_FLASH_FREEZE, 45000);
					break;
				}
				case EVENT_BLOWS:
					Talk(SAY_STALACTITE);
					Talk(EMOTE_BLOWS);
					DoCast(me, SPELL_FROZEN_BLOWS);
					events.ScheduleEvent(EVENT_BLOWS, urand(43000, 48000));
					break;
				case EVENT_RARE_CACHE:
					Talk(SAY_HARD_MODE_FAILED);
					if (Creature* cacheTrigger = me->FindNearestCreature(22515, 150.0f)) //62501
					{
						cacheTrigger->AI()->DoCast(62501);
					}

					iCouldSayThatThisCacheWasRare = false;
					instance->SetData(DATA_HODIR_RARE_CACHE, 0);
					events.CancelEvent(EVENT_RARE_CACHE);
					break;
				case EVENT_BERSERK:
					Talk(SAY_BERSERK);
					DoCast(me, SPELL_BERSERK, true);
					events.CancelEvent(EVENT_BERSERK);
					break;
				}
			}

			if (gettingColdInHereTimer <= diff && gettingColdInHere)
			{
				std::list<HostileReference*> ThreatList = me->getThreatManager().getThreatList();
				for (std::list<HostileReference*>::const_iterator itr = ThreatList.begin(); itr != ThreatList.end(); ++itr)
					if (Unit* target = ObjectAccessor::GetUnit(*me, (*itr)->getUnitGuid()))
						if (Aura* BitingColdAura = target->GetAura(SPELL_BITING_COLD_TRIGGERED))
							if ((target->GetTypeId() == TYPEID_PLAYER) && (BitingColdAura->GetStackAmount() > 2))
							{
					me->AI()->SetData(DATA_GETTING_COLD_IN_HERE, 0);
					gettingColdInHere = false;
							}
				gettingColdInHereTimer = 1000;
			}
			else
				gettingColdInHereTimer -= diff;

			DoMeleeAttackIfReady();
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_I_HAVE_THE_COOLEST_FRIENDS:
				iHaveTheCoolestFriends = false;
				break;
			case ACTION_CHEESE_THE_FREEZE:
				cheeseTheFreeze = false;
				break;
			default:
				break;
			}
		}

			void FlashFreeze()
		{
			std::list<Unit*> TargetList;
			Trinity::AnyUnfriendlyUnitInObjectRangeCheck checker(me, me, 100.0f);
			Trinity::UnitListSearcher<Trinity::AnyUnfriendlyUnitInObjectRangeCheck> searcher(me, TargetList, checker);
			me->VisitNearbyObject(100.0f, searcher);

			for (std::list<Unit*>::iterator itr = TargetList.begin(); itr != TargetList.end(); ++itr)
			{
				Unit* target = *itr;
				if (!target || target->GetEntry() == 30298 || target->GetEntry() == NPC_ICE_BLOCK || target->GetEntry() == NPC_FLASH_FREEZE || target->IsTotem() || target->IsPet() || !target->IsAlive() || GetClosestCreatureWithEntry(target, NPC_SNOWPACKED_ICICLE, 5.0f) || !me->IsWithinLOSInMap(target))
					continue;
				if (target->HasAura(SPELL_SINGED) && !target->HasAura(SPELL_BLOCK_OF_ICE) && !target->HasAura(SPELL_FLASH_FREEZE_HELPER))
					continue;

				if (target->HasAura(SPELL_FLASH_FREEZE_HELPER) || target->HasAura(SPELL_BLOCK_OF_ICE))
				{
					if (Creature* iceBlock = target->FindNearestCreature(NPC_ICE_BLOCK, 2.0f))
					{
						iceBlock->DespawnOrUnsummon();
					}

					if (Creature* flashFreeze = me->FindNearestCreature(NPC_FLASH_FREEZE, 2.0f))
					{
						flashFreeze->DespawnOrUnsummon();
					}

					switch (target->GetTypeId())
					{
					case TYPEID_PLAYER:
						me->CastSpell(target, SPELL_FLASH_FREEZE_KILL, true);
						break;
					case TYPEID_UNIT:
						if (target->ToCreature())
							target->ToCreature()->DespawnOrUnsummon();
						break;
					}

					continue;
				}

				target->CastSpell(target, SPELL_SUMMON_BLOCK_OF_ICE, true);
			}

			/* After everything is processed and players who have Singed aura are protected, extinguish the Toasty fires and their effects. */

			std::list<Creature*> pToastyFireList;

			Trinity::AllCreaturesOfEntryInRange toastyChecker(me, NPC_TOASTY_FIRE, 150.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> toastySearcher(me, pToastyFireList, toastyChecker);

			me->VisitNearbyObject(150.0f, toastySearcher);

			if (pToastyFireList.empty())
				return;

			if (!pToastyFireList.empty())
			{
				for (std::list<Creature*>::iterator i = pToastyFireList.begin(); i != pToastyFireList.end(); ++i)
				{
					(*i)->AI()->DoAction(ACTION_DESPAWN_AFTER_FLASH_FREEZE);
				}

			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<boss_hodirAI>(creature);
	};
};

class npc_icicle : public CreatureScript
{
public:
	npc_icicle() : CreatureScript("npc_icicle") { }

	struct npc_icicleAI : public ScriptedAI
	{
		npc_icicleAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid1);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_PASSIVE);
		}

		uint32 icicleTimer;

		void Reset() override
		{
			icicleTimer = 2500;
		}

			void UpdateAI(uint32 diff) override
		{
			if (icicleTimer <= diff)
			{
				if (me->GetEntry() == NPC_ICICLE_SNOWDRIFT)
				{
					DoCast(me, SPELL_FALL_SNOWDRIFT);
					DoCast(me, SPELL_ICICLE_FALL);
				}
				else if (me->GetEntry() == NPC_ICICLE)
				{
					DoCast(me, SPELL_ICICLE_FALL);
					DoCast(me, SPELL_FALL_DAMAGE, true);
				}
				icicleTimer = 10000;
			}
			else
				icicleTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_icicleAI>(creature);
	};
};

class npc_snowpacked_icicle : public CreatureScript
{
public:
	npc_snowpacked_icicle() : CreatureScript("npc_snowpacked_icicle") { }

	struct npc_snowpacked_icicleAI : public ScriptedAI
	{
		npc_snowpacked_icicleAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PACIFIED);
			me->SetReactState(REACT_PASSIVE);
		}

		uint32 despawnTimer;

		void Reset() override
		{
			despawnTimer = 12000;
		}

			void UpdateAI(uint32 diff) override
		{
			if (despawnTimer <= diff)
			{
				if (GameObject* Snowdrift = me->FindNearestGameObject(GO_SNOWDRIFT, 2.0f))
					me->RemoveGameObject(Snowdrift, true);
				me->DespawnOrUnsummon();
			}
			else
				despawnTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_snowpacked_icicleAI>(creature);
	};
};

class npc_hodir_priest : public CreatureScript
{
public:
	npc_hodir_priest() : CreatureScript("npc_hodir_priest") { }

	struct npc_hodir_priestAI : public ScriptedAI
	{
		npc_hodir_priestAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			//DoCast(me, SPELL_SUMMON_FLASH_FREEZE_HELPER);
		}

		void Reset() override
		{
			events.Reset();
			events.ScheduleEvent(EVENT_HEAL, urand(4000, 8000));
			events.ScheduleEvent(EVENT_DISPEL_MAGIC, urand(15000, 20000));
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_STUNNED) || me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (HealthBelowPct(30))
				DoCast(me, SPELL_GREATER_HEAL);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_HEAL:
					DoCastAOE(SPELL_GREATER_HEAL);
					events.ScheduleEvent(EVENT_HEAL, urand(7500, 10000));
					break;
				case EVENT_DISPEL_MAGIC:
				{
					std::list<Unit*> TargetList;
					Trinity::AnyFriendlyUnitInObjectRangeCheck checker(me, me, 30.0f);
					Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(me, TargetList, checker);
					me->VisitNearbyObject(30.0f, searcher);
					for (std::list<Unit*>::iterator itr = TargetList.begin(); itr != TargetList.end(); ++itr)
						if ((*itr)->HasAura(SPELL_FREEZE))
							DoCast(*itr, SPELL_DISPEL_MAGIC, true);
					events.ScheduleEvent(EVENT_DISPEL_MAGIC, urand(15000, 20000));
					break;
				}
				default:
					break;
				}
			}

			DoSpellAttackIfReady(SPELL_SMITE);
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
			Hodir->AI()->DoAction(ACTION_I_HAVE_THE_COOLEST_FRIENDS);
		}

	private:
		InstanceScript* instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_hodir_priestAI>(creature);
	};
};

enum ShamanEvents
{
	EVENT_ST_CLOUD,
};
class npc_hodir_shaman : public CreatureScript
{
public:
	npc_hodir_shaman() : CreatureScript("npc_hodir_shaman") { }

	struct npc_hodir_shamanAI : public ScriptedAI
	{
		npc_hodir_shamanAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			//DoCast(me, SPELL_SUMMON_FLASH_FREEZE_HELPER);

		}

		void Reset() override
		{
			events.Reset();
			events.ScheduleEvent(EVENT_STORM_CLOUD, 8000);
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_STUNNED) || me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_STORM_CLOUD:
				{
					std::list<Unit*> allies;
					Trinity::AnyFriendlyUnitInObjectRangeCheck checker(me, me, 30.0f);
					Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(me, allies, checker);
					me->VisitNearbyWorldObject(30.0f, searcher);
					if (!allies.empty())
					{
						std::list<Unit*>::iterator iter = allies.begin();
						DoCast((*iter), SPELL_STORM_CLOUD, true);
						events.ScheduleEvent(EVENT_STORM_CLOUD, urand(20 * IN_MILLISECONDS, 30 * IN_MILLISECONDS));
					}
					else
						events.ScheduleEvent(EVENT_STORM_CLOUD, urand(2 * IN_MILLISECONDS, 3 * IN_MILLISECONDS)); // No target found, check again in a short period of time

				}
					break;
				default:
					break;
				}
			}

			DoSpellAttackIfReady(SPELL_LAVA_BURST);
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
			Hodir->AI()->DoAction(ACTION_I_HAVE_THE_COOLEST_FRIENDS);
		}

	private:
		InstanceScript* instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_hodir_shamanAI>(creature);
	};
};

enum AuraDruid
{
	AURA_MOONKIN = 24907
};

class npc_hodir_druid : public CreatureScript
{
public:
	npc_hodir_druid() : CreatureScript("npc_hodir_druid") { }

	struct npc_hodir_druidAI : public ScriptedAI
	{
		npc_hodir_druidAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = me->GetInstanceScript();
			//DoCast(me, SPELL_SUMMON_FLASH_FREEZE_HELPER);
		}

		void Reset() override
		{
			events.Reset();
			events.ScheduleEvent(EVENT_STARLIGHT, urand(15000, 18000));
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_STUNNED) || me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_STARLIGHT:
					DoCast(me, SPELL_STARLIGHT, true);
					events.ScheduleEvent(EVENT_STARLIGHT, urand(25000, 35000));
					break;
				default:
					break;
				}
			}

			if (!me->HasAura(AURA_MOONKIN))
				me->AddAura(AURA_MOONKIN, me);

			DoSpellAttackIfReady(SPELL_WRATH);
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
			Hodir->AI()->DoAction(ACTION_I_HAVE_THE_COOLEST_FRIENDS);
		}

	private:
		InstanceScript* instance;
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_hodir_druidAI>(creature);
	};
};

class npc_hodir_mage : public CreatureScript
{
public:
	npc_hodir_mage() : CreatureScript("npc_hodir_mage") { }

	struct npc_hodir_mageAI : public ScriptedAI
	{
		npc_hodir_mageAI(Creature* creature) : ScriptedAI(creature), summons(me)
		{
			instance = me->GetInstanceScript();
			//DoCast(me, SPELL_SUMMON_FLASH_FREEZE_HELPER);
		}

		void Reset() override
		{
			events.Reset();
			summons.DespawnAll();
			events.ScheduleEvent(EVENT_CONJURE_FIRE, urand(10000, 15000));
			events.ScheduleEvent(EVENT_MELT_ICE, 5000);
		}

			void JustSummoned(Creature* summoned) override
		{
			if (summoned->GetEntry() == NPC_TOASTY_FIRE)
			summons.Summon(summoned);
		}

			void SummonedCreatureDespawn(Creature* summoned) override
		{
			if (summoned->GetEntry() == NPC_TOASTY_FIRE)
			summons.Despawn(summoned);
		}

			void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_STUNNED) || me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
			return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CONJURE_FIRE:
					if (summons.size() >= RAID_MODE<uint64>(2, 4))
						break;
					DoCast(me, SPELL_CONJURE_FIRE, true);
					events.ScheduleEvent(EVENT_CONJURE_FIRE, urand(25000, 40000));
					break;
				case EVENT_MELT_ICE:
					if (Creature* FlashFreeze = me->FindNearestCreature(NPC_ICE_BLOCK, 50.0f, true)) // 32938 is the correct flash freeze from NPCs.
						DoCast(FlashFreeze, SPELL_MELT_ICE, true);

					if (Creature* FlashFreeze = me->FindNearestCreature(NPC_FLASH_FREEZE, 50.0f, true))
						DoCast(FlashFreeze, SPELL_MELT_ICE, true);

					events.ScheduleEvent(EVENT_MELT_ICE, urand(15000, 25000));
					break;
				}
			}

			DoSpellAttackIfReady(SPELL_FIREBALL);
		}

			void JustDied(Unit* /*killer*/) override
		{
			if (Creature* Hodir = ObjectAccessor::GetCreature(*me, instance ? instance->GetGuidData(BOSS_HODIR) : ObjectGuid::Empty))
			Hodir->AI()->DoAction(ACTION_I_HAVE_THE_COOLEST_FRIENDS);
		}

	private:
		InstanceScript* instance;
		EventMap events;
		SummonList summons;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_hodir_mageAI>(creature);
	};
};

class npc_toasty_fire : public CreatureScript
{
public:
	npc_toasty_fire() : CreatureScript("npc_toasty_fire") { }

	struct npc_toasty_fireAI : public ScriptedAI
	{

		npc_toasty_fireAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetDisplayId(me->GetCreatureTemplate()->Modelid2);
		}

		void Reset() override
		{
			DoCast(me, SPELL_SINGED, true);
		}

			void DoAction(int32 action) override
		{
			switch (action)
			{
				/* Why this way and not via Spellhit (spell->Id==SPELL_FLASH_FREEZE? Because we need to execute this action after the Flash Freeze Effect hits,
				first Singed spell which is being provided for this NPC must "protect" the players,
				and right after, despawn itself and the associated Game Object. */

			case ACTION_DESPAWN_AFTER_FLASH_FREEZE:
			{
				if (GameObject* ToastyFire = me->FindNearestGameObject(GO_TOASTY_FIRE, 1.5f))
					ToastyFire->RemoveFromWorld();

				me->DespawnOrUnsummon();
				break;
			}
			default:
				break;
			}
		}

			void SpellHit(Unit* /*who*/, const SpellInfo* spell) override
		{
			if (spell->Id == SPELL_BLOCK_OF_ICE || spell->Id == SPELL_ICE_SHARD || spell->Id == SPELL_ICE_SHARD_HIT)
			{
				if (GameObject* ToastyFire = me->FindNearestGameObject(GO_TOASTY_FIRE, 1.5f))
					ToastyFire->RemoveFromWorld();

				me->DespawnOrUnsummon();
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return GetUlduarAI<npc_toasty_fireAI>(creature);
	};
};

class spell_biting_cold : public SpellScriptLoader
{
public:
	spell_biting_cold() : SpellScriptLoader("spell_biting_cold") { }

	class spell_biting_cold_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_biting_cold_AuraScript);

		void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
		{
			Unit* target = GetTarget();
			bool found = false;

			if (!target->ToPlayer())
				return;

			if (target->HasAura(SPELL_SINGED))
			{
				target->RemoveAura(SPELL_BITING_COLD_TRIGGERED);
				return;
			}

			for (TargetList::iterator itr = listOfTargets.begin(); itr != listOfTargets.end(); ++itr)
			{

				if (itr->first != target->GetGUID())
					continue;

				if (itr->second >= 4)
				{
					target->CastSpell(target, SPELL_BITING_COLD_TRIGGERED, true);
					itr->second = 1;
				}
				else
				{
					if (target->isMoving())
						itr->second = 1;
					else
						itr->second++;
				}

				found = true;
				break;
			}

			if (!found)
				listOfTargets.push_back(std::make_pair(target->GetGUID(), 1));
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_biting_cold_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}

	private:
		typedef std::list< std::pair<uint64, uint8> > TargetList;
		TargetList listOfTargets;
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_biting_cold_AuraScript();
	}
};

class spell_biting_cold_dot : public SpellScriptLoader
{
public:
	spell_biting_cold_dot() : SpellScriptLoader("spell_biting_cold_dot") { }

	class spell_biting_cold_dot_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_biting_cold_dot_AuraScript);

		void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
		{
			Unit* caster = GetCaster();

			if (!caster)
				return;

			int32 damage = int32(200 * pow(2.0f, GetStackAmount()));
			caster->CastCustomSpell(caster, SPELL_BITING_COLD_DAMAGE, &damage, NULL, NULL, true);

			if (caster->isMoving())
				caster->RemoveAuraFromStack(SPELL_BITING_COLD_TRIGGERED);
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_biting_cold_dot_AuraScript::HandleEffectPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_biting_cold_dot_AuraScript();
	}
};

class achievement_staying_buffed_all_winter : public AchievementCriteriaScript
{
public:
	achievement_staying_buffed_all_winter(const char* name) : AchievementCriteriaScript(name) {}

	bool OnCheck(Player* player, Unit* /*target*/)
	{
		if (player->HasAura(SPELL_SINGED) && player->HasAura(SPELL_STARLIGHT) && (player->HasAura(SPELL_STORM_POWER_10) || player->HasAura(SPELL_STORM_POWER_25)))
			return true;

		return false;
	}
};

void AddSC_boss_hodir()
{
	new boss_hodir();
	new npc_icicle();
	new npc_snowpacked_icicle();
	new npc_hodir_priest();
	new npc_hodir_shaman();
	new npc_hodir_druid();
	new npc_hodir_mage();
	new npc_toasty_fire();
	new npc_ice_block();
	new npc_flash_freeze();
	new spell_biting_cold();
	new spell_biting_cold_dot();

	new achievement_staying_buffed_all_winter("achievement_staying_buffed_all_winter");
	new achievement_staying_buffed_all_winter("achievement_staying_buffed_all_winter_25");
}

#undef SPELL_STORM_POWER