/*
* Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
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

/* ScriptData
SDName: boss_grand_champions
SD%Complete: 50 %
SDComment: Is missing the ai to make the npcs look for a new mount and use it.
SDCategory: Trial Of the Champion
EndScriptData */


#include "ScriptedEscortAI.h"
#include "Vehicle.h"
#include "trial_of_the_champion.h"
#include "Player.h"

enum eSpells
{
	//Vehicle
	SPELL_SHIELD_BREAKER = 62575,
	SPELL_SHIELD = 62544,
	SPELL_THRUST = 68505,
	SPELL_SHIELD_1 = 66482,
	SPELL_CHARGE = 63010,
	SPELL_DEFEND = 62719,

	// Marshal Jacob Alerius && Mokra the Skullcrusher || Warrior
	SPELL_MORTAL_STRIKE = 68783,
	SPELL_MORTAL_STRIKE_H = 68784,
	SPELL_BLADESTORM = 63784,
	SPELL_INTERCEPT = 67540,
	SPELL_ROLLING_THROW = 47115, //not implemented in the AI yet...

	// Ambrose Boltspark && Eressea Dawnsinger || Mage
	SPELL_FIREBALL = 66042,
	SPELL_FIREBALL_H = 68310,
	SPELL_BLAST_WAVE = 66044,
	SPELL_BLAST_WAVE_H = 68312,
	SPELL_HASTE = 66045,
	SPELL_POLYMORPH = 66043,
	SPELL_POLYMORPH_H = 68311,

	// Colosos && Runok Wildmane || Shaman
	SPELL_CHAIN_LIGHTNING = 67529,
	SPELL_CHAIN_LIGHTNING_H = 68319,
	SPELL_EARTH_SHIELD = 67530,
	SPELL_HEALING_WAVE = 67528,
	SPELL_HEALING_WAVE_H = 68318,
	SPELL_HEX_OF_MENDING = 67534,
	SPELL_HEX_OF_MENDING_HEAL = 67535,
	// Jaelyne Evensong && Zul'tore || Hunter
	SPELL_DISENGAGE = 68339,
	SPELL_LIGHTNING_ARROWS = 66083,
	SPELL_MULTI_SHOT = 49047,
	SPELL_SHOOT = 65868,
	SPELL_SHOOT_H = 67988,

	// Lana Stouthammer Evensong && Deathstalker Visceri || Rouge
	SPELL_EVISCERATE = 67709,
	SPELL_EVISCERATE_H = 68317,
	SPELL_FAN_OF_KNIVES = 67706,
	SPELL_POISON_BOTTLE = 67701,

	// Achievement Credit
	SPELL_GRAND_CHAMPIONS_CREDIT = 68572,

	SPELL_DUAL_WIELD = 42459
};

enum Talk
{
	SAY_CHAMPION_DIED = 0,
	WARNING_WEAPONS = 1,
};

enum eSeat
{
	SEAT_ID_0 = 0
};

void AggroAllPlayers(Creature* pTemp)
{
	Map::PlayerList const &PlList = pTemp->GetMap()->GetPlayers();

	if (PlList.isEmpty())
		return;

	for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
	{
		if (Player* player = i->GetSource())
		{
			if (player->IsGameMaster())
				continue;

			if (player->IsAlive())
			{
				pTemp->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
				pTemp->SetReactState(REACT_AGGRESSIVE);
				pTemp->SetInCombatWith(player);
				player->SetInCombatWith(pTemp);
				pTemp->AddThreat(player, 0.0f);
			}
		}
	}
}

uint8 HowManyChampionsOutVehicle(Creature* me)
{
	InstanceScript* pInstance = me->GetInstanceScript();

	if (!pInstance)
		return false;

	uint8 championOutCount = 0;
	Creature* pGrandChampion1 = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(DATA_GRAND_CHAMPION_1));
	Creature* pGrandChampion2 = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(DATA_GRAND_CHAMPION_2));
	Creature* pGrandChampion3 = ObjectAccessor::GetCreature(*me, pInstance->GetGuidData(DATA_GRAND_CHAMPION_3));

	/*

	CUANDO LO RESPAWNEAS, SE PIERDE EL RASTRO DE LOS CHAMPIONS, ASÍ QUE SETEA O ALGO.

	*/

	/*if (pGrandChampion1)
	std::cout << "\n \n GRAND CHAMPION 1 EXISTE \n \n";
	else if (!pGrandChampion1)
	std::cout << "\n \n GRAND CHAMPION NO NO NO NO NO NO NON ON O EXISTE \n \n";*/

	if (pGrandChampion1 && pGrandChampion2 && pGrandChampion3)
	{
		if (!pGrandChampion1->GetVehicle())
			championOutCount++;
		if (!pGrandChampion2->GetVehicle())
			championOutCount++;
		if (!pGrandChampion3->GetVehicle())
			championOutCount++;
	}
	return championOutCount++;
}


void CheckPlayersInRange(Creature* me, float rangeMin, float rangeMax)
{
	Map* map = me->GetMap();
	if (map && map->IsDungeon())
	{
		std::list<Player*> PlayerList;
		Map::PlayerList const& Players = map->GetPlayers();
		for (Map::PlayerList::const_iterator itr = Players.begin(); itr != Players.end(); ++itr)
		{
			if (Player* player = itr->GetSource())
			{
				float distance = player->GetDistance(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
				if (rangeMin > distance || distance > rangeMax)
					continue;

				if (!player->GetVehicle())
					player->CastSpell(player, 67868);
			}
		}

	}
}
/*
* Generic AI for vehicles used by npcs in ToC, it needs more improvements.  *
* Script Complete: 25%.                                                     *
*/
class generic_vehicleAI_toc5 : public CreatureScript
{
public:
	generic_vehicleAI_toc5() : CreatureScript("generic_vehicleAI_toc5") {}

	struct generic_vehicleAI_toc5AI : public npc_escortAI
	{
		generic_vehicleAI_toc5AI(Creature* creature) : npc_escortAI(creature)
		{
			hasBeenInCombat = false;
			SetDespawnAtEnd(false);
			uiWaypointPath = 0;
			uiCheckTimer = 5000;
			pInstance = creature->GetInstanceScript();

			//A
			if (pInstance)
				if (pInstance->GetData(DATA_GRAND_CHAMPIONS_STARTED))
					me->SetHealth(DUNGEON_MODE(40000, 80000));
		}

		InstanceScript* pInstance;

		bool hasBeenInCombat;
		bool combatEntered;

		uint32 combatCheckTimer;
		uint32 uiShieldBreakerTimer;
		uint32 uiBuffTimer;
		uint32 uiCheckTimer;
		uint32 uiDefendTimer;
		uint32 uiChargeTimer;
		uint32 uiWaypointPath;
		uint32 moveForwardTimer;
		uint32 setReactTimer;
		uint32 checkTargetTimer;

		void Reset()
		{
			combatCheckTimer = 500;
			uiBuffTimer = urand(30000, 60000);
			uiShieldBreakerTimer = 8000;
			uiDefendTimer = urand(30000, 60000);
			uiChargeTimer = urand(1000, 4000);
			//moveForwardTimer = urand(9000, 18000);
			checkTargetTimer = 1000;
		}

		void SetData(uint32 uiType, uint32 /*uiData8*/)
		{
			switch (uiType)
			{
			case 1:
				AddWaypoint(0, 746.45f, 647.03f, 411.57f);
				AddWaypoint(1, 771.434f, 642.606f, 411.9f);
				AddWaypoint(2, 779.807f, 617.535f, 411.716f);
				AddWaypoint(3, 771.098f, 594.635f, 411.625f);
				AddWaypoint(4, 746.887f, 583.425f, 411.668f);
				AddWaypoint(5, 715.176f, 583.782f, 412.394f);
				AddWaypoint(6, 720.719f, 591.141f, 411.737f);
				uiWaypointPath = 1;
				break;
			case 2:
				AddWaypoint(0, 746.45f, 647.03f, 411.57f);
				AddWaypoint(1, 771.434f, 642.606f, 411.9f);
				AddWaypoint(2, 779.807f, 617.535f, 411.716f);
				AddWaypoint(3, 771.098f, 594.635f, 411.625f);
				AddWaypoint(4, 746.887f, 583.425f, 411.668f);
				AddWaypoint(5, 746.16f, 571.678f, 412.389f);
				AddWaypoint(6, 746.887f, 583.425f, 411.668f);
				uiWaypointPath = 2;
				break;
			case 3:
				AddWaypoint(0, 746.45f, 647.03f, 411.57f);
				AddWaypoint(1, 771.434f, 642.606f, 411.9f);
				AddWaypoint(2, 779.807f, 617.535f, 411.716f);
				AddWaypoint(3, 771.098f, 594.635f, 411.625f);
				AddWaypoint(4, 777.759f, 584.577f, 412.393f);
				AddWaypoint(5, 772.48f, 592.99f, 411.68f);
				uiWaypointPath = 3;
				break;
			case 4:
				combatEntered = true;
				break;
			}

			if (uiType <= 3)
				Start(false, true, ObjectGuid::Empty, NULL);
		}

		void WaypointReached(uint32 i)
		{
			switch (i)
			{
			case 2:
				DoCastSpellDefend();
				if ((pInstance && uiWaypointPath == 3) || uiWaypointPath == 2)
					pInstance->SetData(DATA_MOVEMENT_DONE, pInstance->GetData(DATA_MOVEMENT_DONE) + 1);
				break;
			case 3:
				DoCastSpellDefend();
				if (pInstance)
					pInstance->SetData(DATA_MOVEMENT_DONE, pInstance->GetData(DATA_MOVEMENT_DONE) + 1);
				break;
			}
		}

		void EnterCombat(Unit* who)
		{
			if (Unit* passenger = me->GetVehicleKit()->GetPassenger(0))
				passenger->SetInCombatWith(who);
			
			hasBeenInCombat = true;
			me->SetSpeed(MOVE_RUN, 1.57f);
			DoCastSpellDefend();
			DoCastSpellDefend();
			DoCastSpellDefend();
			me->CallForHelp(50.0f);
		}

		void DoCastSpellDefend()
		{
			DoCast(me, SPELL_DEFEND, true);
		}

		void SpellHit(Unit* source, const SpellInfo* spell)
		{

			uint32 defendAuraStackAmount = 0;

			if (me->HasAura(SPELL_DEFEND))
				if (Aura* defendAura = me->GetAura(SPELL_DEFEND))
					defendAuraStackAmount = defendAura->GetStackAmount();

			// Shield-Break by player vehicle
			if (spell->Id == 62575)
			{
				source->DealDamage(me, uint32(2000 * (1 - 0.3f * defendAuraStackAmount)));
				source->SendSpellNonMeleeDamageLog(me, 62575, uint32(2000 * (1 - 0.3f * defendAuraStackAmount)), SPELL_SCHOOL_MASK_NORMAL, 0, 0, true, 0, false);

				if (me->HasAura(SPELL_DEFEND))
					me->RemoveAuraFromStack(SPELL_DEFEND);
			}

			// Charge by player vehicle
			if (spell->Id == 68282)
			{
				source->DealDamage(me, uint32(20000 * (1 - 0.3f * defendAuraStackAmount)));
				source->SendSpellNonMeleeDamageLog(me, 68282, uint32(20000 * (1 - 0.3f * defendAuraStackAmount)), SPELL_SCHOOL_MASK_NORMAL, 0, 0, true, 0, false);

				if (source->GetMotionMaster())
					source->GetMotionMaster()->MoveCharge(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());

				if (me->HasAura(SPELL_DEFEND))
					me->RemoveAuraFromStack(SPELL_DEFEND);
			}
		}

		bool StayInCombatAndCleanup(bool combat, bool cleanup)
		{
			if (me->GetMap())
			{
				Map::PlayerList const& players = me->GetMap()->GetPlayers();
				bool foundtarget = false;

				if (me->GetMap()->IsDungeon() && !players.isEmpty())
				{
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						Player* player = itr->GetSource();
						if (player && !player->IsGameMaster() && player->IsAlive())
						{
							// Handle combat variable
							if (combat)
							{
								if (combatEntered)
								{
									me->SetInCombatWith(player);
									player->SetInCombatWith(me);
									me->AddThreat(player, 0.0f);

									foundtarget = true;

									if (Vehicle* pVehicle = player->GetVehicle())
									{
										if (Unit* vehicleCreature = pVehicle->GetBase())
										{
											me->SetInCombatWith(vehicleCreature);
											vehicleCreature->SetInCombatWith(me);
											me->AddThreat(vehicleCreature, 0.0f);
										}
									}
								}
							}

							// Handle cleanup variable
							if (cleanup)
								if (player->HasAura(SPELL_DEFEND))
									player->RemoveAurasDueToSpell(SPELL_DEFEND);
						}
					}
				}

				if (combatEntered && combat && !foundtarget)
				{
					me->SetFullHealth();
					return false;
				}
			}

			return true;
		}

		void EnterEvadeMode()
		{
			// Try to stay in combat, otherwise reset
			if (!StayInCombatAndCleanup(true, false))
				ScriptedAI::EnterEvadeMode();
		}

		bool CheckPlayersAlive()
		{
			Map* pMap = me->GetMap();
			if (pMap && pMap->IsDungeon())
			{
				Map::PlayerList const &players = pMap->GetPlayers();
				for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
				{
					if (itr->GetSource() && itr->GetSource()->IsAlive() && !itr->GetSource()->IsGameMaster())
						return true;
				}
			}

			return false;
		}

		/*void DoCastSpellShield()
		{
		for (uint8 i = 0; i < 3; ++i)
		DoCast(me, SPELL_SHIELD, true);
		}*/

		void UpdateAI(uint32 uiDiff) override
		{
			// Try to keep players clean of defend aura
			if (combatEntered)
			{
				if (combatCheckTimer <= uiDiff)
				{
					StayInCombatAndCleanup(false, true);
					combatCheckTimer = 1000;
				}
				else
					combatCheckTimer -= uiDiff;
			}

			npc_escortAI::UpdateAI(uiDiff);

			if (!UpdateVictim())
				return;


			if (checkTargetTimer <= uiDiff)
			{
				if (Unit* victim = me->GetVictim())
				{
					/*if (!victim->IsVehicle() && victim->GetTypeId()==TYPEID_PLAYER)
					{*/
					if (Unit* pass = me->GetVehicleKit()->GetPassenger(0))
						pass->Attack(victim, true);
					//}
				}
				checkTargetTimer = 2000;
			}
			else
				checkTargetTimer -= uiDiff;


			if (setReactTimer <= uiDiff)
			{
				me->SetReactState(REACT_AGGRESSIVE);
				if (me->GetVictim())
					me->GetMotionMaster()->MoveChase(me->GetVictim());
				else
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
					{
						me->GetMotionMaster()->MoveChase(target);
					}
				}
			}
			else
				setReactTimer -= uiDiff;

			if (uiDefendTimer <= uiDiff)
			{
				DoCastSpellDefend();
				uiDefendTimer = urand(7000, 12000);
			}
			else
				uiDefendTimer -= uiDiff;

			/*if (moveForwardTimer <= uiDiff)
			{
				if (me->GetVictim())
					if (me->GetDistance(me->GetVictim()) < 6.0f)
					{

						me->SetReactState(REACT_PASSIVE);
						me->GetMotionMaster()->MoveFleeing(me->GetVictim(), 3000);
						//me->GetMotionMaster()->MovePoint(4, me->GetPositionX() + 16, me->GetPositionY(), me->GetPositionZ());
						setReactTimer = 3000;
						uiChargeTimer = 3500;
					}

				//moveForwardTimer = urand(7000, 15000);
			}
			else
				moveForwardTimer -= uiDiff;*/

			if (uiShieldBreakerTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
				{
					if (target->GetTypeId() == TYPEID_PLAYER && me->GetDistance(target) > 5.0f && me->GetDistance(target) < 25.0f)
					{
						if (target->GetVehicle())
						{
							if (Unit* vehTarget = target->GetVehicle()->GetBase())
							{
								DoCast(vehTarget, SPELL_SHIELD_BREAKER);
								vehTarget->RemoveAuraFromStack(SPELL_DEFEND);
							}
						}
					}
					else
						if (target->GetTypeId() == TYPEID_UNIT && me->GetDistance(target) > 5.0f && me->GetDistance(target) < 25.0f)
						{
							DoCast(target, SPELL_SHIELD_BREAKER);
							target->RemoveAuraFromStack(SPELL_DEFEND);
						}
				}

				uiShieldBreakerTimer = urand(8000, 12000);
			}
			else
				uiShieldBreakerTimer -= uiDiff;

			if (uiChargeTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
				{
					if (target->GetTypeId() == TYPEID_PLAYER && me->GetDistance(target) > 6.0f && me->GetDistance(target) < 25.0f)
					{
						if (target->GetVehicle())
						{
							if (Unit* vehTarget = target->GetVehicle()->GetBase())
							{
								DoCast(vehTarget, SPELL_CHARGE);

								if (vehTarget->HasAura(SPELL_DEFEND))
									vehTarget->RemoveAuraFromStack(SPELL_DEFEND);
							}
						}
					}
					else
						if (target->GetTypeId() == TYPEID_UNIT && me->GetDistance(target) > 8.0f && me->GetDistance(target) < 25.0f)
						{
							DoCast(target, SPELL_CHARGE);

							if (target->HasAura(SPELL_DEFEND))
								target->RemoveAuraFromStack(SPELL_DEFEND);
						}
				}

				uiChargeTimer = urand(6000, 15000);
			}
			else
				uiChargeTimer -= uiDiff;

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new generic_vehicleAI_toc5AI(creature);
	}
};

// Marshal Jacob Alerius && Mokra the Skullcrusher || Warrior
class boss_warrior_toc5 : public CreatureScript
{
public:
	boss_warrior_toc5() : CreatureScript("boss_warrior_toc5") {}

	struct boss_warrior_toc5AI : public BossAI
	{
		boss_warrior_toc5AI(Creature* creature) : BossAI(creature, BOSS_GRAND_CHAMPIONS)
		{
			pInstance = creature->GetInstanceScript();

			bDone = false;
			bHome = false;
			bCredit = false;
			hasBeenInCombat = false;

			uiPhase = 0;
			uiPhaseTimer = 0;
			surviving = false;
			walking = false;
			trampleTimer = 0;
			me->SetReactState(REACT_PASSIVE);
			// THIS IS A HACK, SHOULD BE REMOVED WHEN THE EVENT IS FULL SCRIPTED
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->LoadEquipment(2);
		}

		InstanceScript* pInstance;

		uint8 uiPhase;
		uint32 uiPhaseTimer;

		uint32 uiBladeStormTimer;
		uint32 uiInterceptTimer;
		uint32 uiMortalStrikeTimer;
		uint32 uiAttackTimer;
		uint32 trampleTimer;
		uint32 thrustTimer;

		bool bDone;
		bool bHome;
		bool bCredit;
		bool hasBeenInCombat;
		bool surviving;
		bool walking;

		void Reset()
		{
			uiBladeStormTimer = urand(15000, 20000);
			uiInterceptTimer = 7000;
			uiMortalStrikeTimer = urand(8000, 12000);
			me->GetMotionMaster()->MoveTargetedHome();
		}

		void JustReachedHome()
		{
			ScriptedAI::JustReachedHome();

			if (!bHome)
				return;

			uiPhaseTimer = 15000;
			uiPhase = 1;

			bHome = false;
		}

		void EnterCombat(Unit* who)
		{
			_EnterCombat();
			hasBeenInCombat = true;
			me->CallForHelp(65.f);
			if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1)))
				pInstance->HandleGameObject(pGO->GetGUID(), false);

			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
				{
					me->Attack(mount, true);
					thrustTimer = 4000;
				}
			}
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType != POINT_MOTION_TYPE)
				return;

			if (bDone)
				return;
			if (!surviving && !walking)
				return;

			if (pointId == 0)
			{
				if (Creature* newBoss = me->SummonCreature(me->GetEntry() == NPC_MOKRA ? VEHICLE_MOKRA_SKILLCRUSHER_MOUNT : VEHICLE_MARSHAL_JACOB_ALERIUS_MOUNT,
					me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				{
					newBoss->SetInCombatWithZone();

					uint32 bossdata = me->GetEntry() == NPC_MOKRA ? DATA_MOKRA : DATA_MARSHAL_JACOB;

					if (instance->GetGuidData(DATA_GRAND_CHAMPION_1) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_1, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_2) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_2, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_3) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_3, instance->GetGuidData(bossdata));
				}


				me->DespawnOrUnsummon();
			}

		}

		void UpdateAI(uint32 uiDiff) override
		{

			if (trampleTimer <= uiDiff)
			{
				if (!bDone && me->GetVehicle() && me->IsInCombat())
					DoCastAOE(67868);
									

				trampleTimer = 5000;
			}
			else
				trampleTimer -= uiDiff;


			//
			if (!bDone)
				if (thrustTimer <= uiDiff)
				{
					if (me->GetVehicle())
						if (me->GetVictim())
						{
							DoCast(me->GetVictim(), SPELL_THRUST);
							thrustTimer = urand(5000, 12000);
						}
				}
				else
					thrustTimer -= uiDiff;

			if (!bDone && (HowManyChampionsOutVehicle(me) == 3))
			{
				bDone = true;
				surviving = false;
				walking = false;
				me->LoadEquipment(1);
				Talk(WARNING_WEAPONS); //acceder al speaker y ahcer +1, cuando tenga 3 que escupa el mensaje.
				me->RemoveAura(64723); // [DND] ReadyJoust Pose Effect
				me->RemoveAura(58806);
				if (pInstance)
					pInstance->SetData(DATA_PHASE1_GRANDCHAMPIONS_DONE, 0);

				if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_1))
					me->SetHomePosition(739.678f, 662.541f, 413.395f, 4.49f);
				else
					if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_2))
						me->SetHomePosition(746.71f, 661.02f, 412.695f, 4.6f);
					else
						if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_3))
							me->SetHomePosition(754.34f, 660.70f, 413.395f, 4.79f);

				EnterEvadeMode();
				bHome = true;
			}
			else if (!bDone && !me->GetVehicle()) // He must start checking for players near him and if there are not he must be stand and walking slowly for a mount.
			{
				surviving = true;
				me->AttackStop();
			}

			if (!bDone && walking && surviving)
			{
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					//walking = false;
					//me->StopMoving();
					if (player->GetVehicle())
					{
						me->GetMotionMaster()->Clear();
						me->StopMoving();
						me->AddAura(58806, me);
						walking = false;
					}

				}
			}


			if (!bDone && surviving)
			{
				//Check players
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					if (player->GetVehicle())
						walking = false;
				}
				else if (!walking)
				{
					walking = true;
					me->RemoveAura(58806);


					if (Creature* mount = me->FindNearestCreature(me->GetEntry() == NPC_MOKRA ? VEHICLE_ARGENT_BATTLEWORG : VEHICLE_ARGENT_WARHORSE, 60.0f, true))
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, mount->GetPositionX(), mount->GetPositionY(), mount->GetPositionZ());
					}
				}
			}

			//
			if (uiPhaseTimer <= uiDiff)
			{
				if (uiPhase == 1)
				{
					AggroAllPlayers(me);
					uiPhase = 0;
				}
			}
			else
				uiPhaseTimer -= uiDiff;

			DoMeleeAttackIfReady();

			if (!UpdateVictim() || me->GetVehicle() || !bDone)
				return;

			if (uiInterceptTimer <= uiDiff)
			{
				Map::PlayerList const& players = me->GetMap()->GetPlayers();
				if (me->GetMap()->IsDungeon() && !players.isEmpty())
				{
					for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
					{
						Player* player = itr->GetSource();
						if (player && !player->IsGameMaster() && me->IsInRange(player, 8.0f, 25.0f, false))
						{
							DoResetThreat();
							me->AddThreat(player, 5.0f);
							DoCast(player, SPELL_INTERCEPT);
							break;
						}
					}
				}

				uiInterceptTimer = 7000;
			}
			else
				uiInterceptTimer -= uiDiff;

			if (uiBladeStormTimer <= uiDiff)
			{
				DoCastVictim(SPELL_BLADESTORM);
				uiBladeStormTimer = urand(15000, 25000);
			}
			else
				uiBladeStormTimer -= uiDiff;

			if (uiMortalStrikeTimer <= uiDiff)
			{
				DoCastVictim(DUNGEON_MODE(SPELL_MORTAL_STRIKE, SPELL_MORTAL_STRIKE_H));
				uiMortalStrikeTimer = urand(8000, 12000);
			}
			else
				uiMortalStrikeTimer -= uiDiff;

		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{

			if (damage >= me->GetHealth())
			{
				me->CombatStop();
				me->SetFullHealth();
				Talk(SAY_CHAMPION_DIED);
				me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
				// Instance encounter counting mechanics
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, SPELL_GRAND_CHAMPIONS_CREDIT);
				}

				hasBeenInCombat = false;

				if (pInstance)
				{
					me->CastStop();
					me->StopMoving();

					if (pInstance->GetData(DATA_CHAMPIONS_DEATHS) != 2)
					{
						me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
						me->SetStandState(UNIT_STAND_STATE_KNEEL);
					}
					EnterEvadeMode();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setFaction(35);
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
				}

				//EnterEvadeMode();

				//me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
			}
		}

		void JustDied(Unit* /*killer*/)
		{

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_warrior_toc5AI(creature);
	}
};

// Ambrose Boltspark && Eressea Dawnsinger || Mage
class boss_mage_toc5 : public CreatureScript
{
public:
	boss_mage_toc5() : CreatureScript("boss_mage_toc5") {}

	struct boss_mage_toc5AI : public BossAI
	{
		boss_mage_toc5AI(Creature* creature) : BossAI(creature, BOSS_GRAND_CHAMPIONS)
		{
			pInstance = creature->GetInstanceScript();

			bDone = false;
			bHome = false;
			bCredit = false;

			hasBeenInCombat = false;
			trampleTimer = 0;
			uiPhase = 0;
			uiPhaseTimer = 0;
			surviving = false;
			walking = false;

			me->SetReactState(REACT_PASSIVE);
			// THIS IS A HACK, SHOULD BE REMOVED WHEN THE EVENT IS FULL SCRIPTED
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->LoadEquipment(2);
		}

		InstanceScript* pInstance;

		uint8 uiPhase;
		uint32 uiPhaseTimer;

		uint32 uiFireBallTimer;
		uint32 uiBlastWaveTimer;
		uint32 uiHasteTimer;
		uint32 uiPolymorphTimer;
		uint32 trampleTimer;
		uint32 thrustTimer;

		bool bDone;
		bool bHome;

		bool hasBeenInCombat;
		bool bCredit;
		bool surviving;
		bool walking;

		void Reset()
		{
			uiFireBallTimer = 5000;
			uiPolymorphTimer = 8000;
			uiBlastWaveTimer = 12000;
			uiHasteTimer = 22000;
			uiFireBallTimer = 1000;
		}

		void JustReachedHome()
		{
			ScriptedAI::JustReachedHome();

			if (!bHome)
				return;

			uiPhaseTimer = 15000;
			uiPhase = 1;

			bHome = false;
		}

		void EnterCombat(Unit* who)
		{
			_EnterCombat();
			hasBeenInCombat = true;
			me->CallForHelp(65.f);

			if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1)))
				pInstance->HandleGameObject(pGO->GetGUID(), false);

			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
				{
					me->Attack(mount, true);
					thrustTimer = 4000;
				}
			}
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType != POINT_MOTION_TYPE)
				return;

			if (bDone)
				return;

			if (!surviving && !walking)
				return;

			if (pointId == 0)
			{
				if (Creature* newBoss = me->SummonCreature(me->GetEntry() == NPC_ERESSEA ? VEHICLE_ERESSEA_DAWNSINGER_MOUNT : VEHICLE_AMBROSE_BOLTSPARK_MOUNT,
					me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				{
					newBoss->SetInCombatWithZone();

					uint32 bossdata = me->GetEntry() == NPC_ERESSEA ? DATA_ERESSEA : DATA_AMBROSE;

					if (instance->GetGuidData(DATA_GRAND_CHAMPION_1) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_1, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_2) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_2, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_3) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_3, instance->GetGuidData(bossdata));
				}

				me->DespawnOrUnsummon();
			}
		}

		void UpdateAI(uint32 uiDiff) override
		{


			if (trampleTimer <= uiDiff)
			{
				if (!bDone && me->GetVehicle() && me->IsInCombat())				
					DoCastAOE(67868);									

				trampleTimer = 5000;
			}
			else
				trampleTimer -= uiDiff;

			if (!bDone)
				if (thrustTimer <= uiDiff)
				{
					if (me->GetVehicle())
						if (me->GetVictim())
						{
							DoCast(me->GetVictim(), SPELL_THRUST);
							thrustTimer = urand(5000, 12000);
						}
				}
				else
					thrustTimer -= uiDiff;

			if (!bDone && (HowManyChampionsOutVehicle(me) == 3))
			{
				bDone = true;
				surviving = false;
				walking = false;
				me->LoadEquipment(1);
				Talk(WARNING_WEAPONS);
				me->RemoveAura(64723); // [DND] ReadyJoust Pose Effect
				me->RemoveAura(58806);

				if (pInstance)
					pInstance->SetData(DATA_PHASE1_GRANDCHAMPIONS_DONE, 0);

				if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_1))
					me->SetHomePosition(739.678f, 662.541f, 413.395f, 4.49f);
				else
					if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_2))
						me->SetHomePosition(746.71f, 661.02f, 412.695f, 4.6f);
					else
						if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_3))
							me->SetHomePosition(754.34f, 660.70f, 413.395f, 4.79f);

				if (pInstance)
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, IN_PROGRESS);

				EnterEvadeMode();
				bHome = true;
			}
			else if (!bDone && !me->GetVehicle()) // He must start checking for players near him and if there are not he must be stand and walking slowly for a mount.
			{
				surviving = true;
				me->AttackStop();
			}

			if (!bDone && walking && surviving)
			{
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					//walking = false;
					//me->StopMoving();
					if (player->GetVehicle())
					{
						me->GetMotionMaster()->Clear();
						me->StopMoving();
						me->AddAura(58806, me);
						walking = false;
					}

				}
			}


			if (!bDone && surviving)
			{
				//Check players
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					if (player->GetVehicle())
						walking = false;
				}
				else if (!walking)
				{
					walking = true;
					me->RemoveAura(58806);


					if (Creature* mount = me->FindNearestCreature(me->GetEntry() == NPC_ERESSEA ? VEHICLE_ARGENT_BATTLEWORG : VEHICLE_ARGENT_WARHORSE, 60.0f, true))
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, mount->GetPositionX(), mount->GetPositionY(), mount->GetPositionZ());
					}
				}
			}

			if (uiPhaseTimer <= uiDiff)
			{
				if (uiPhase == 1)
				{
					AggroAllPlayers(me);
					uiPhase = 0;
				}
			}
			else
				uiPhaseTimer -= uiDiff;

			if (!UpdateVictim() || me->GetVehicle() || !bDone)
				return;

			if (uiFireBallTimer <= uiDiff)
			{
				DoCastVictim(DUNGEON_MODE(SPELL_FIREBALL, SPELL_FIREBALL_H));
				uiFireBallTimer = 3000;
			}
			else
				uiFireBallTimer -= uiDiff;

			if (uiPolymorphTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
					DoCast(target, DUNGEON_MODE(SPELL_POLYMORPH, SPELL_POLYMORPH_H));
				uiPolymorphTimer = 22000;
			}
			else
				uiPolymorphTimer -= uiDiff;

			if (uiBlastWaveTimer <= uiDiff)
			{
				DoCastAOE(DUNGEON_MODE(SPELL_BLAST_WAVE, SPELL_BLAST_WAVE_H), false);
				uiBlastWaveTimer = 18000;
			}
			else
				uiBlastWaveTimer -= uiDiff;

			if (uiHasteTimer <= uiDiff)
			{
				me->InterruptNonMeleeSpells(true);

				DoCast(me, SPELL_HASTE);
				uiHasteTimer = 40000;
			}
			else
				uiHasteTimer -= uiDiff;

			//DoSpellAttackIfReady(DUNGEON_MODE(SPELL_FIREBALL, SPELL_FIREBALL_H));
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				me->CombatStop();
				me->SetFullHealth();
				Talk(SAY_CHAMPION_DIED);
				me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
				// Instance encounter counting mechanics
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, SPELL_GRAND_CHAMPIONS_CREDIT);
				}

				hasBeenInCombat = false;

				if (pInstance)
				{
					me->CastStop();
					me->StopMoving();

					if (pInstance->GetData(DATA_CHAMPIONS_DEATHS) != 2)
					{
						me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
						me->SetStandState(UNIT_STAND_STATE_KNEEL);
					}
					EnterEvadeMode();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setFaction(35);
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
				}

				//EnterEvadeMode();

				//me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			hasBeenInCombat = false;

			if (pInstance)
				pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_mage_toc5AI(creature);
	};
};

// Colosos && Runok Wildmane || Shaman
class boss_shaman_toc5 : public CreatureScript
{
public:
	boss_shaman_toc5() : CreatureScript("boss_shaman_toc5") {}

	struct boss_shaman_toc5AI : public BossAI
	{
		boss_shaman_toc5AI(Creature* creature) : BossAI(creature, BOSS_GRAND_CHAMPIONS)
		{
			pInstance = creature->GetInstanceScript();

			bDone = false;
			bHome = false;
			bCredit = false;

			hasBeenInCombat = false;

			uiPhase = 0;
			uiPhaseTimer = 0;
			surviving = false;
			walking = false;
			trampleTimer = 0;
			me->SetReactState(REACT_PASSIVE);
			// THIS IS A HACK, SHOULD BE REMOVED WHEN THE EVENT IS FULL SCRIPTED
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->LoadEquipment(2);
		}

		InstanceScript* pInstance;

		uint8 uiPhase;
		uint32 uiPhaseTimer;

		uint32 uiChainLightningTimer;
		uint32 uiEartShieldTimer;
		uint32 uiHealingWaveTimer;
		uint32 uiHexMendingTimer;
		uint32 trampleTimer;
		uint32 thrustTimer;

		bool bDone;
		bool bHome;
		bool hasBeenInCombat;
		bool bCredit;
		bool surviving;
		bool walking;

		void Reset()
		{
			uiChainLightningTimer = 16000;
			uiHealingWaveTimer = 12000;
			uiHexMendingTimer = urand(4000, 8000);
			DoCast(me, SPELL_EARTH_SHIELD);
		}

		void EnterCombat(Unit* who)
		{
			_EnterCombat();
			hasBeenInCombat = true;

			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
				{
					me->Attack(mount, true);
					thrustTimer = 4000;
				}
			}

			me->CallForHelp(65.f);
			if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1)))
				pInstance->HandleGameObject(pGO->GetGUID(), false);
		};

		void JustReachedHome()
		{
			ScriptedAI::JustReachedHome();

			if (!bHome)
				return;

			uiPhaseTimer = 15000;
			uiPhase = 1;

			bHome = false;
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType != POINT_MOTION_TYPE)
				return;

			if (bDone)
				return;

			if (!surviving && !walking)
				return;

			if (pointId == 0)
			{
				if (Creature* newBoss = me->SummonCreature(me->GetEntry() == NPC_RUNOK ? VEHICLE_RUNOK_WILDMANE_MOUNT : VEHICLE_COLOSOS_MOUNT,
					me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				{
					newBoss->SetInCombatWithZone();

					uint32 bossdata = me->GetEntry() == NPC_RUNOK ? DATA_RUNOK : DATA_COLOSOS;

					if (instance->GetGuidData(DATA_GRAND_CHAMPION_1) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_1, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_2) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_2, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_3) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_3, instance->GetGuidData(bossdata));
				}

				me->DespawnOrUnsummon();
			}

		}

		void UpdateAI(uint32 uiDiff) override
		{
			if (trampleTimer <= uiDiff)
			{
				if (!bDone && me->GetVehicle() && me->IsInCombat())
					DoCastAOE(67868);

				trampleTimer = 5000;
			}
			else
				trampleTimer -= uiDiff;

			if (!bDone)
				if (thrustTimer <= uiDiff)
				{
					if (me->GetVehicle())
						if (me->GetVictim())
						{
							DoCast(me->GetVictim(), SPELL_THRUST);
							thrustTimer = urand(5000, 12000);
						}
				}
				else
					thrustTimer -= uiDiff;

			if (!bDone && (HowManyChampionsOutVehicle(me) == 3))
			{
				bDone = true;
				surviving = false;
				walking = false;

				me->LoadEquipment(1);
				Talk(WARNING_WEAPONS);
				me->RemoveAura(64723); // [DND] ReadyJoust Pose Effect
				me->RemoveAura(58806);

				if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_1))
					me->SetHomePosition(739.678f, 662.541f, 413.395f, 4.49f);
				else
					if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_2))
						me->SetHomePosition(746.71f, 661.02f, 412.695f, 4.6f);
					else
						if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_3))
							me->SetHomePosition(754.34f, 660.70f, 413.395f, 4.79f);

				if (pInstance)
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, IN_PROGRESS);

				EnterEvadeMode();
				bHome = true;
			}
			else if (!bDone && !me->GetVehicle()) // He must start checking for players near him and if there are not he must be stand and walking slowly for a mount.
			{
				surviving = true;
				me->AttackStop();
			}

			if (!bDone && walking && surviving)
			{
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					//walking = false;
					//me->StopMoving();
					if (player->GetVehicle())
					{
						me->GetMotionMaster()->Clear();
						me->StopMoving();
						me->AddAura(58806, me);
						walking = false;
					}
				}
			}


			if (!bDone && surviving)
			{
				//Check players
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					if (player->GetVehicle())
						walking = false;
				}
				else if (!walking)
				{
					walking = true;
					me->RemoveAura(58806);


					if (Creature* mount = me->FindNearestCreature(me->GetEntry() == NPC_RUNOK ? VEHICLE_ARGENT_BATTLEWORG : VEHICLE_ARGENT_WARHORSE, 60.0f, true))
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, mount->GetPositionX(), mount->GetPositionY(), mount->GetPositionZ());
					}
				}
			}

			if (uiPhaseTimer <= uiDiff)
			{
				if (uiPhase == 1)
				{
					AggroAllPlayers(me);
					uiPhase = 0;
				}
			}
			else
				uiPhaseTimer -= uiDiff;

			DoMeleeAttackIfReady();

			if (!UpdateVictim() || me->GetVehicle() || !bDone)
				return;

			/*if (!me->HasAura(SPELL_EARTH_SHIELD))
				DoCast(me, SPELL_EARTH_SHIELD);*/

			if (uiChainLightningTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
					DoCast(target, DUNGEON_MODE(SPELL_CHAIN_LIGHTNING, SPELL_CHAIN_LIGHTNING_H));

				uiChainLightningTimer = 23000;
			}
			else
				uiChainLightningTimer -= uiDiff;

			if (uiHealingWaveTimer <= uiDiff)
			{
				bool bChance = urand(0, 1);

				if (!bChance)
				{
					if (Unit* pFriend = DoSelectLowestHpFriendly(40))
						DoCast(pFriend, DUNGEON_MODE(SPELL_HEALING_WAVE, SPELL_HEALING_WAVE_H));
				}
				else
					DoCast(me, DUNGEON_MODE(SPELL_HEALING_WAVE, SPELL_HEALING_WAVE_H));

				uiHealingWaveTimer = 19000;
			}
			else
				uiHealingWaveTimer -= uiDiff;

			/*if (uiEartShieldTimer <= uiDiff)
			{
			DoCast(me, SPELL_EARTH_SHIELD);

			uiEartShieldTimer = urand(40000, 45000);
			}
			else
			uiEartShieldTimer -= uiDiff;*/

			if (uiHexMendingTimer <= uiDiff)
			{
				DoCastVictim(SPELL_HEX_OF_MENDING, true);

				uiHexMendingTimer = urand(30000, 35000);
			}
			else
				uiHexMendingTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				me->CombatStop();
				me->SetFullHealth();
				Talk(SAY_CHAMPION_DIED);
				me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
				// Instance encounter counting mechanics
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, SPELL_GRAND_CHAMPIONS_CREDIT);
				}

				hasBeenInCombat = false;

				if (pInstance)
				{
					me->CastStop();
					me->StopMoving();

					if (pInstance->GetData(DATA_CHAMPIONS_DEATHS) != 2)
					{
						me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
						me->SetStandState(UNIT_STAND_STATE_KNEEL);
					}
					EnterEvadeMode();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setFaction(35);
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
				}

				//EnterEvadeMode();

				//me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_shaman_toc5AI(creature);
	}
};

// Jaelyne Evensong && Zul'tore || Hunter
class boss_hunter_toc5 : public CreatureScript
{
public:
	boss_hunter_toc5() : CreatureScript("boss_hunter_toc5") {}

	struct boss_hunter_toc5AI : public BossAI
	{
		boss_hunter_toc5AI(Creature* creature) : BossAI(creature, BOSS_GRAND_CHAMPIONS)
		{
			pInstance = creature->GetInstanceScript();

			bDone = false;
			bHome = false;
			hasBeenInCombat = false;
			bCredit = false;
			trampleTimer = 0;
			uiPhase = 0;
			uiPhaseTimer = 0;
			surviving = false;
			walking = false;

			me->SetReactState(REACT_PASSIVE);
			// THIS IS A HACK, SHOULD BE REMOVED WHEN THE EVENT IS FULL SCRIPTED
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->LoadEquipment(2);
		}

		InstanceScript* pInstance;

		uint8 uiPhase;
		uint32 uiPhaseTimer;

		uint32 uiShootTimer;
		uint32 uiDisengageCooldown;
		uint32 uiMultiShotTimer;
		uint32 uiLightningArrowsTimer;
		uint32 trampleTimer;
		ObjectGuid uiTargetGUID;
		uint32 thrustTimer;

		bool bShoot;
		bool bDone;
		bool bHome;
		bool hasBeenInCombat;
		bool bCredit;
		bool surviving;
		bool walking;
		bool setup;

		void Reset()
		{
			uiShootTimer = 1000;
			uiMultiShotTimer = 8000;
			uiLightningArrowsTimer = 7000;
			uiDisengageCooldown = 10000;

			setup = false;
			bShoot = false;
		}

		void JustReachedHome()
		{
			ScriptedAI::JustReachedHome();

			if (!bHome)
				return;

			uiPhaseTimer = 15000;
			uiPhase = 1;

			bHome = false;
		}

		void EnterCombat(Unit* who)
		{
			_EnterCombat();
			hasBeenInCombat = true;
			me->CallForHelp(65.f);

			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
				{
					me->Attack(mount, true);
					thrustTimer = 4000;
				}
			}
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType != POINT_MOTION_TYPE)
				return;

			if (bDone)
				return;

			if (!surviving && !walking)
				return;

			if (pointId == 0)
			{
				if (Creature* newBoss = me->SummonCreature(me->GetEntry() == NPC_ZULTORE ? VEHICLE_ZUL_TORE_MOUNT : VEHICLE_EVENSONG_MOUNT,
					me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				{
					newBoss->SetInCombatWithZone();

					uint32 bossdata = me->GetEntry() == NPC_ZULTORE ? DATA_ZUL_TORE : DATA_EVENSONG;

					if (instance->GetGuidData(DATA_GRAND_CHAMPION_1) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_1, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_2) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_2, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_3) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_3, instance->GetGuidData(bossdata));
				}

				me->DespawnOrUnsummon();
			}

		}

		void UpdateAI(uint32 uiDiff) override
		{

			if (trampleTimer <= uiDiff)
			{
				if (!bDone && me->GetVehicle() && me->IsInCombat())
					DoCastAOE(67868);

				trampleTimer = 5000;
			}
			else
				trampleTimer -= uiDiff;

			if (!bDone)
				if (thrustTimer <= uiDiff)
				{
					if (!bDone && me->GetVehicle())
						if (me->GetVictim())
						{
							DoCast(me->GetVictim(), SPELL_THRUST);
							thrustTimer = urand(5000, 12000);
						}
				}
				else
					thrustTimer -= uiDiff;

			if (!bDone && (HowManyChampionsOutVehicle(me) == 3))
			{
				bDone = true;
				surviving = false;
				walking = false;
				me->LoadEquipment(1);
				Talk(WARNING_WEAPONS);
				me->RemoveAura(64723); // [DND] ReadyJoust Pose Effect
				me->RemoveAura(58806);

				if (pInstance)
					pInstance->SetData(DATA_PHASE1_GRANDCHAMPIONS_DONE, 0);

				if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_1))
					me->SetHomePosition(739.678f, 662.541f, 413.395f, 4.49f);
				else
					if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_2))
						me->SetHomePosition(746.71f, 661.02f, 412.695f, 4.6f);
					else
						if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_3))
							me->SetHomePosition(754.34f, 660.70f, 413.395f, 4.79f);

				if (pInstance)
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, IN_PROGRESS);

				EnterEvadeMode();
				bHome = true;
			}
			else if (!bDone && !me->GetVehicle()) // He must start checking for players near him and if there are not he must be stand and walking slowly for a mount.
			{
				surviving = true;
				me->AttackStop();
			}

			if (!bDone && walking && surviving)
			{
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					//walking = false;
					//me->StopMoving();
					if (player->GetVehicle())
					{
						me->GetMotionMaster()->Clear();
						me->StopMoving();
						me->AddAura(58806, me);
						walking = false;
					}
				}
			}


			if (!bDone && surviving)
			{
				//Check players
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					if (player->GetVehicle())
						walking = false;
				}
				else if (!walking)
				{
					walking = true;
					me->RemoveAura(58806);


					if (Creature* mount = me->FindNearestCreature(me->GetEntry() == NPC_ZULTORE ? VEHICLE_ARGENT_BATTLEWORG : VEHICLE_ARGENT_WARHORSE, 60.0f, true))
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, mount->GetPositionX(), mount->GetPositionY(), mount->GetPositionZ());
					}
				}
			}

			if (uiPhaseTimer <= uiDiff)
			{
				if (uiPhase == 1)
				{
					AggroAllPlayers(me);
					uiPhase = 0;
				}
			}
			else
				uiPhaseTimer -= uiDiff;

			if (!UpdateVictim() || me->GetVehicle() || !bDone)
				return;


			if (uiDisengageCooldown <= uiDiff)
			{
				me->GetMotionMaster()->MoveIdle();

				if (me->IsWithinDistInMap(me->GetVictim(), 6.f))
				{
					me->CastStop();
					me->StopMoving();
					DoCast(me, SPELL_DISENGAGE);
					uiDisengageCooldown = 15000;
				}
				else
					uiDisengageCooldown = 5000;
			}
			else
				uiDisengageCooldown -= uiDiff;

			if (uiLightningArrowsTimer <= uiDiff)
			{
				me->CastStop();
				me->StopMoving();
				DoCastAOE(SPELL_LIGHTNING_ARROWS, false);
				me->AddAura(66085, me); // Actual buff with stacks.
				uiLightningArrowsTimer = 30000;

			}
			else
				uiLightningArrowsTimer -= uiDiff;

			/*if (uiShootTimer <= uiDiff)
			{
			/*if (Unit* target = SelectTarget(SELECT_TARGET_FARTHEST, 0, 30.0f))
			{
			uiTargetGUID = target->GetGUID();
			DoCast(target, DUNGEON_MODE(SPELL_SHOOT, SPELL_SHOOT_H));
			}

			if (me->IsWithinDistInMap(me->GetVictim(), 16.f))
			me->StopMoving();

			uiShootTimer = 1000;

			bShoot = true;
			}
			else
			uiShootTimer -= uiDiff;*/

			if (uiMultiShotTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_FARTHEST))
					if (target->IsInRange(me, 5.0f, 35.0f))
					{
						DoCast(target, SPELL_MULTI_SHOT);
						uiMultiShotTimer = 6000;
					}
					else uiMultiShotTimer = 1000;
			}
			else uiMultiShotTimer -= uiDiff;

			DoSpellAttackIfReady(DUNGEON_MODE(SPELL_SHOOT, SPELL_SHOOT_H));
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				me->CombatStop();
				me->SetFullHealth();
				Talk(SAY_CHAMPION_DIED);
				me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
				// Instance encounter counting mechanics
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, SPELL_GRAND_CHAMPIONS_CREDIT);
				}

				hasBeenInCombat = false;

				if (pInstance)
				{
					me->CastStop();
					me->StopMoving();

					if (pInstance->GetData(DATA_CHAMPIONS_DEATHS) != 2)
					{
						me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
						me->SetStandState(UNIT_STAND_STATE_KNEEL);
					}
					EnterEvadeMode();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setFaction(35);
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
				}

				//EnterEvadeMode();

				//me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
			}
		}

		void JustDied(Unit* killer)
		{

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_hunter_toc5AI(creature);
	}
};

// Lana Stouthammer Evensong && Deathstalker Visceri || Rouge
class boss_rouge_toc5 : public CreatureScript
{
public:
	boss_rouge_toc5() : CreatureScript("boss_rouge_toc5") {}

	struct boss_rouge_toc5AI : public BossAI
	{
		boss_rouge_toc5AI(Creature* creature) : BossAI(creature, BOSS_GRAND_CHAMPIONS)
		{
			pInstance = creature->GetInstanceScript();

			bDone = false;
			bHome = false;
			bCredit = false;

			uiPhase = 0;
			uiPhaseTimer = 0;
			surviving = false;
			walking = false;

			trampleTimer = 0;
			hasBeenInCombat = false;
			lastPhase = false;
			me->SetReactState(REACT_PASSIVE);
			// THIS IS A HACK, SHOULD BE REMOVED WHEN THE EVENT IS FULL SCRIPTED
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->LoadEquipment(2);
		}

		InstanceScript* pInstance;

		uint8 uiPhase;
		uint32 uiPhaseTimer;
		uint32 uiEviscerateTimer;
		uint32 uiFanKivesTimer;
		uint32 uiPosionBottleTimer;
		uint32 trampleTimer;
		uint32 thrustTimer;

		bool bDone;
		bool bHome;
		bool hasBeenInCombat;
		bool bCredit;
		bool surviving;
		bool walking;
		bool lastPhase;
		bool setup;

		void Reset()
		{
			uiEviscerateTimer = 8000;
			uiFanKivesTimer = 14000;
			uiPosionBottleTimer = 19000;
			setup = false;
		}

		void JustReachedHome()
		{
			ScriptedAI::JustReachedHome();

			if (!bHome)
				return;

			uiPhaseTimer = 15000;
			uiPhase = 1;

			bHome = false;
		}

		void EnterCombat(Unit* who)
		{
			_EnterCombat();
			hasBeenInCombat = true;
			me->CallForHelp(65.f);
			if (GameObject* pGO = ObjectAccessor::GetGameObject(*me, pInstance->GetGuidData(DATA_MAIN_GATE1)))
				pInstance->HandleGameObject(pGO->GetGUID(), false);

			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
				{
					me->Attack(mount, true);
					thrustTimer = 4000;
				}
			}
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType != POINT_MOTION_TYPE)
				return;

			if (bDone)
				return;

			if (!surviving && !walking)
				return;

			if (pointId == 0)
			{
				if (Creature* newBoss = me->SummonCreature(me->GetEntry() == NPC_VISCERI ? VEHICLE_DEATHSTALKER_VESCERI_MOUNT : VEHICLE_LANA_STOUTHAMMER_MOUNT,
					me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
				{
					newBoss->SetInCombatWithZone();

					uint32 bossdata = me->GetEntry() == NPC_VISCERI ? DATA_DEATHSTALKER_VISCERI : DATA_LANA;

					if (instance->GetGuidData(DATA_GRAND_CHAMPION_1) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_1, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_2) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_2, instance->GetGuidData(bossdata));
					else if (instance->GetGuidData(DATA_GRAND_CHAMPION_3) == me->GetGUID())
						instance->SetGuidData(DATA_GRAND_CHAMPION_3, instance->GetGuidData(bossdata));
				}

				me->DespawnOrUnsummon();
			}
		}

		void UpdateAI(uint32 uiDiff) override
		{
			if (trampleTimer <= uiDiff)
			{
				if (!bDone && me->GetVehicle() && me->IsInCombat())				
					DoCastAOE(67868);
					
				trampleTimer = 5000;
			}
			else
				trampleTimer -= uiDiff;

			if (!bDone)
				if (thrustTimer <= uiDiff)
				{
					if (me->GetVehicle())
						if (me->GetVictim())
						{
							DoCast(me->GetVictim(), SPELL_THRUST);
							thrustTimer = urand(5000, 12000);
						}
				}
				else
					thrustTimer -= uiDiff;

			if (!bDone && (HowManyChampionsOutVehicle(me) == 3))
			{
				bDone = true;
				surviving = false;
				walking = false;
				me->LoadEquipment(1);
				Talk(WARNING_WEAPONS);
				me->RemoveAura(64723); // [DND] ReadyJoust Pose Effect
				me->RemoveAura(58806);

				if (pInstance)
					pInstance->SetData(DATA_PHASE1_GRANDCHAMPIONS_DONE, 0);

				if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_1))
					me->SetHomePosition(739.678f, 662.541f, 413.395f, 4.49f);
				else
					if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_2))
						me->SetHomePosition(746.71f, 661.02f, 412.695f, 4.6f);
					else
						if (pInstance && me->GetGUID() == pInstance->GetGuidData(DATA_GRAND_CHAMPION_3))
							me->SetHomePosition(754.34f, 660.70f, 413.395f, 4.79f);

				if (pInstance)
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, IN_PROGRESS);

				EnterEvadeMode();
				bHome = true;
			}
			else if (!bDone && !me->GetVehicle()) // He must start checking for players near him and if there are not he must be stand and walking slowly for a mount.
			{
				surviving = true;
				me->AttackStop();
			}

			if (!bDone && walking && surviving)
			{
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					//walking = false;
					//me->StopMoving();
					if (player->GetVehicle())
					{
						me->GetMotionMaster()->Clear();
						me->StopMoving();
						me->AddAura(58806, me);
						walking = false;
					}
				}
			}

			if (!bDone && surviving)
			{
				//Check players
				if (Player* player = me->SelectNearestPlayer(1.0f))
				{
					if (player->GetVehicle())
						walking = false;
				}
				else if (!walking)
				{
					walking = true;
					me->RemoveAura(58806);


					if (Creature* mount = me->FindNearestCreature(me->GetEntry() == NPC_VISCERI ? VEHICLE_ARGENT_BATTLEWORG : VEHICLE_ARGENT_WARHORSE, 60.0f, true))
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, mount->GetPositionX(), mount->GetPositionY(), mount->GetPositionZ());
					}
				}
			}

			if (uiPhaseTimer <= uiDiff)
			{
				if (uiPhase == 1)
				{
					AggroAllPlayers(me);
					uiPhase = 0;
				}
			}
			else
				uiPhaseTimer -= uiDiff;

			DoMeleeAttackIfReady();

			if (!UpdateVictim() || me->GetVehicle() || !bDone)
				return;

			if (!setup)
			{
				if (!me->HasAura(67711))
					me->AddAura(67711, me); // Deadly poison

				DoCast(me, SPELL_DUAL_WIELD, true);
				me->SetAttackTime(OFF_ATTACK, 1400);
				me->SetStatFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE, IsHeroic() ? 5000.0f : 3000.0f);
				me->SetStatFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE, IsHeroic() ? 6000.0f : 4000.0f);
				setup = true;
			}


			if (uiEviscerateTimer <= uiDiff)
			{
				DoCast(me->GetVictim(), DUNGEON_MODE(SPELL_EVISCERATE, SPELL_EVISCERATE_H));
				uiEviscerateTimer = 12000;
			}
			else
				uiEviscerateTimer -= uiDiff;

			if (uiFanKivesTimer <= uiDiff)
			{
				DoCastAOE(SPELL_FAN_OF_KNIVES, false);
				uiFanKivesTimer = 20000;
			}
			else
				uiFanKivesTimer -= uiDiff;

			if (uiPosionBottleTimer <= uiDiff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
					DoCast(target, SPELL_POISON_BOTTLE);
				uiPosionBottleTimer = 19000;
			}
			else
				uiPosionBottleTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				me->CombatStop();
				me->SetFullHealth();
				Talk(SAY_CHAMPION_DIED);
				me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
				// Instance encounter counting mechanics
				if (!bCredit)
				{
					bCredit = true;
					HandleSpellOnPlayersInInstanceToC5(me, SPELL_GRAND_CHAMPIONS_CREDIT);
				}

				hasBeenInCombat = false;

				if (pInstance)
				{
					me->CastStop();
					me->StopMoving();

					if (pInstance->GetData(DATA_CHAMPIONS_DEATHS) != 2)
					{
						me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
						me->SetStandState(UNIT_STAND_STATE_KNEEL);
					}
					EnterEvadeMode();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->setFaction(35);
					pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);
				}

				//EnterEvadeMode();

				//me->GetMotionMaster()->MovePoint(0, 746.843f, 695.68f, 412.339f);
			}
		}

		void JustDied(Unit* killer)
		{
			hasBeenInCombat = false;
			if (pInstance)
				pInstance->SetData(BOSS_GRAND_CHAMPIONS, DONE);

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_rouge_toc5AI(creature);
	}
};

class achievement_toc5_grand_champions : public AchievementCriteriaScript
{
public:
	uint32 creature_entry;

	achievement_toc5_grand_champions(const char* name, uint32 original_entry) : AchievementCriteriaScript(name)
	{
		creature_entry = original_entry;
	}

	bool OnCheck(Player* source, Unit* target)
	{
		if (!target)
			return false;

		if (Creature* creature = target->ToCreature())
			if (creature->GetEntry() == creature_entry)
				return true;

		return false;
	}
};

class npc_champion_rider : public CreatureScript
{
private:

public:
	npc_champion_rider() : CreatureScript("npc_champion_rider") {}

	struct npc_champion_riderAI : public ScriptedAI
	{
		npc_champion_riderAI(Creature* creature) : ScriptedAI(creature), instance(me->GetInstanceScript()) {}

		void Reset()
		{

		}

		void EnterCombat(Unit* who) override
		{
			if (who->GetTypeId() == TYPEID_PLAYER)
			{
				if (Unit* mount = who->ToPlayer()->GetVehicleBase())
					me->Attack(mount, true);
			}

			thrustTimer = 3000;
		}

		void UpdateAI(uint32 diff)
		{

			if (!UpdateVictim())
				return;


			if (thrustTimer <= diff)
			{
				if (me->GetVictim())
					DoCast(me->GetVictim(), SPELL_THRUST);
				thrustTimer = urand(5000, 12000);
			}
			else
				thrustTimer -= diff;

			DoMeleeAttackIfReady();
		}


	private:
		InstanceScript* instance;
		uint32 thrustTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_champion_riderAI(creature);
	}
};

class player_hex_mendingAI : public PlayerAI
{
public:
	player_hex_mendingAI(Player* player) : PlayerAI(player) {}

	void HealReceived(Unit* healer, uint32 & addHealth)
	{
		PlayerAI::HealReceived(healer, addHealth);
		me->CastCustomSpell(SPELL_HEX_OF_MENDING_HEAL, SPELLVALUE_BASE_POINT0, int32(addHealth*2.0f), me, true);
	}

	void UpdateAI(uint32 /*diff*/) override { }

private:
	uint64 casterGUID;
};

class spell_toc5_hex_mending : public SpellScriptLoader
{
public:
	spell_toc5_hex_mending() : SpellScriptLoader("spell_toc5_hex_mending") { }

	class spell_toc5_hex_mending_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_toc5_hex_mending_AuraScript);

		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
				return;

			oldAI = GetTarget()->GetAI();
			GetTarget()->SetAI(new player_hex_mendingAI(GetTarget()->ToPlayer()));
			oldAIState = GetTarget()->IsAIEnabled;
			GetTarget()->IsAIEnabled = true;
		}

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
				return;

			delete GetTarget()->GetAI();
			GetTarget()->SetAI(oldAI);
			GetTarget()->IsAIEnabled = oldAIState;
		}

		void Register()
		{
			AfterEffectApply += AuraEffectApplyFn(spell_toc5_hex_mending_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
			AfterEffectRemove += AuraEffectRemoveFn(spell_toc5_hex_mending_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}

		UnitAI* oldAI;
		bool oldAIState;
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_toc5_hex_mending_AuraScript();
	}
};

class npc_argent_tournament_mount : public CreatureScript
{
public:
	npc_argent_tournament_mount() : CreatureScript("npc_argent_tournament_mount") { }

	struct npc_argent_tournament_mountAI : public PassiveAI
	{
		npc_argent_tournament_mountAI(Creature* creature) : PassiveAI(creature)
		{
		}

		void OnCharmed(bool /*apply*/) override
		{
			if (Unit* charmer = me->GetCharmer())
				if (charmer->GetTypeId() == TYPEID_PLAYER)
					charmer->AddAura(63034, charmer);
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_argent_tournament_mountAI(creature);
	}
};


void AddSC_boss_grand_champions()
{
	new generic_vehicleAI_toc5();
	new boss_warrior_toc5();
	new boss_mage_toc5();
	new boss_shaman_toc5();
	new boss_hunter_toc5();
	new boss_rouge_toc5();
	new npc_champion_rider();
	new spell_toc5_hex_mending();
	new achievement_toc5_grand_champions("achievement_toc5_champions_mokra", NPC_MOKRA);
	new achievement_toc5_grand_champions("achievement_toc5_champions_eressea", NPC_ERESSEA);
	new achievement_toc5_grand_champions("achievement_toc5_champions_runok", NPC_RUNOK);
	new achievement_toc5_grand_champions("achievement_toc5_champions_zultore", NPC_ZULTORE);
	new achievement_toc5_grand_champions("achievement_toc5_champions_visceri", NPC_VISCERI);
	new achievement_toc5_grand_champions("achievement_toc5_champions_alerius", NPC_JACOB);
	new achievement_toc5_grand_champions("achievement_toc5_champions_ambrose", NPC_AMBROSE);
	new achievement_toc5_grand_champions("achievement_toc5_champions_colosos", NPC_COLOSOS);
	new achievement_toc5_grand_champions("achievement_toc5_champions_jaelyne", NPC_JAELYNE);
	new achievement_toc5_grand_champions("achievement_toc5_champions_lana", NPC_LANA);
}