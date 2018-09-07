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
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "npc_pet_gen_".
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"
#include "SpellHistory.h"
#include "PassiveAI.h"

enum Mojo
{
    SAY_MOJO                = 0,

    SPELL_FEELING_FROGGY    = 43906,
    SPELL_SEDUCTION_VISUAL  = 43919
};

class npc_pet_gen_mojo : public CreatureScript
{
    public:
        npc_pet_gen_mojo() : CreatureScript("npc_pet_gen_mojo") { }

        struct npc_pet_gen_mojoAI : public ScriptedAI
        {
            npc_pet_gen_mojoAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            void Reset() override
            {
                _victimGUID.Clear();

                if (Unit* owner = me->GetOwner())
                    me->GetMotionMaster()->MoveFollow(owner, 0.0f, 0.0f);
            }

            void EnterCombat(Unit* /*who*/) override { }
            void UpdateAI(uint32 /*diff*/) override { }

            void ReceiveEmote(Player* player, uint32 emote) override
            {
                me->HandleEmoteCommand(emote);
                Unit* owner = me->GetOwner();
                if (emote != TEXT_EMOTE_KISS || !owner || owner->GetTypeId() != TYPEID_PLAYER ||
                    owner->ToPlayer()->GetTeam() != player->GetTeam())
                {
                    return;
                }

                Talk(SAY_MOJO, player);

                if (_victimGUID)
                    if (Player* victim = ObjectAccessor::GetPlayer(*me, _victimGUID))
                        victim->RemoveAura(SPELL_FEELING_FROGGY);

                _victimGUID = player->GetGUID();

                DoCast(player, SPELL_FEELING_FROGGY, true);
                DoCast(me, SPELL_SEDUCTION_VISUAL, true);
                me->GetMotionMaster()->MoveFollow(player, 0.0f, 0.0f);
            }

        private:
            ObjectGuid _victimGUID;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_pet_gen_mojoAI(creature);
        }
};

enum WhelplingSpells
{
	SPELL_WHELPLING_SMOKE_RING = 69004,
};

enum WhelplingEvents
{
	EVENT_DEEP_BREATH = 1,
};


class npc_pet_onyxian_whelpling : public CreatureScript
{
public:
	npc_pet_onyxian_whelpling() : CreatureScript("npc_pet_onyxian_whelpling") { }

	struct npc_pet_onyxian_whelplingAI : public ScriptedAI
	{
		npc_pet_onyxian_whelplingAI(Creature* creature) : ScriptedAI(creature)
		{
			events.Reset();
			canInteract = false;
			cooldownTimer = 10 * IN_MILLISECONDS;
		}

		void ReceiveEmote(Player* player, uint32 emote) override
		{
			if (canInteract)
			{
				me->HandleEmoteCommand(emote);
				Unit* owner = me->GetOwner();
				if (emote == TEXT_EMOTE_BREATH && owner && owner->GetTypeId() == TYPEID_PLAYER)
				{
					Talk(0);
					events.ScheduleEvent(EVENT_DEEP_BREATH, 3000);
					return;
				}
			}		
		}	

		void UpdateAI(uint32 diff)
		{
			events.Update(diff);

			if(!canInteract)
			if (cooldownTimer <= diff)							
				canInteract = true;							
			else
				cooldownTimer -= diff;

			switch (events.ExecuteEvent())
			{
			case EVENT_DEEP_BREATH:
				DoCast(SPELL_WHELPLING_SMOKE_RING);
				cooldownTimer = 30 * IN_MILLISECONDS;
				canInteract = false;
				break;
			default:
				break;
			}
		}		

		private:
			EventMap events;
			uint32 cooldownTimer;
			bool canInteract;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_pet_onyxian_whelplingAI(creature);
	}
};

enum eArgentPony
{
	ARGENT_PONY_STATE_NONE = 0,
	ARGENT_PONY_STATE_ENCH = 1,
	ARGENT_PONY_STATE_VENDOR = 2,
	ARGENT_PONY_STATE_BANK = 3,
	ARGENT_PONY_STATE_MAILBOX = 4,

	SPELL_PONY_MOUNT = 16083,

	SPELL_AURA_POSTMAN_S = 67376,
	SPELL_AURA_SHOP_S = 67377,
	SPELL_AURA_BANK_S = 67368,
	SPELL_AURA_TIRED_S = 67401,

	SPELL_AURA_BANK_G = 68849,
	SPELL_AURA_POSTMAN_G = 68850,
	SPELL_AURA_SHOP_G = 68851,
	SPELL_AURA_TIRED_G = 68852,

	ACHIEVEMENT_PONY_UP = 3736,

	GOSSIP_ACTION_MAILBOX = 1001,

	NPC_ARGENT_SQUIRE = 33238,
	NPC_ARGENT_GRUNTLING = 33239,
};

static uint32 argentPonyService[2][3] =
{
	{ ARGENT_PONY_STATE_MAILBOX, ARGENT_PONY_STATE_VENDOR, ARGENT_PONY_STATE_BANK },
	{ ARGENT_PONY_STATE_BANK, ARGENT_PONY_STATE_MAILBOX, ARGENT_PONY_STATE_VENDOR }
};

struct argentPonyBanner
{
	uint32 achievement;
	uint32 spell;
	const char* text;
};

static argentPonyBanner argentBanners[MAX_RACES] =
{
	{ 0, 0, "" },
	{ 2781, 62594, "Stormwind Champion's Pennant" },
	{ 2783, 63433, "Orgrimmar Champion's Pennant" },
	{ 2780, 63427, "Ironforge Champion's Pennant" },
	{ 2777, 63406, "Darnassus Champion's Pennant" },
	{ 2787, 63430, "Forsaken Champion's Pennant" },
	{ 2786, 63436, "Thunder Bluff Champion's Pennant" },
	{ 2779, 63396, "Gnomeregan Champion's Pennant" },
	{ 2784, 63399, "Darkspear Champion's Pennant" },
	{ 0, 0, "" },
	{ 2785, 63403, "Silvermoon Champion's Pennant" },
	{ 2778, 63423, "Exodar Champion's Pennant" }
};

class npc_pet_gen_argent_pony_bridle : public CreatureScript
{
public:
	npc_pet_gen_argent_pony_bridle() : CreatureScript("npc_pet_gen_argent_pony_bridle")	{ }

	struct npc_pet_gen_argent_pony_bridleAI : public ScriptedAI
	{
		npc_pet_gen_argent_pony_bridleAI(Creature *c) : ScriptedAI(c)
		{
			_state = ARGENT_PONY_STATE_NONE;
			_init = false;
			_mountTimer = 4000;
			_lastAura = 0;
			memset(_banners, 0, sizeof(_banners));
		}

		void EnterEvadeMode()
		{
			if (Unit* owner = me->GetCharmerOrOwner())
			{
				me->GetMotionMaster()->Clear(false);
				me->GetMotionMaster()->MoveFollow(owner, PET_FOLLOW_DIST, me->GetFollowAngle(), MOTION_SLOT_ACTIVE);
			}
		}

		void Reset()
		{
			if (_init)
				return;

			_init = true;
			uint32 duration = 0;
			uint32 aura = 0;
			me->SetUInt32Value(UNIT_NPC_FLAGS, 0);

			if (Unit* owner = me->GetCharmerOrOwner())
				if (Player* player = owner->ToPlayer())
					if (player->HasAchieved(ACHIEVEMENT_PONY_UP))
					{
						_state = ARGENT_PONY_STATE_ENCH;

						aura = (player->GetTeamId() == TEAM_ALLIANCE ? SPELL_AURA_TIRED_S : SPELL_AURA_TIRED_G);
						duration = player->GetSpellHistory()->GetRemainingCooldown(sSpellMgr->EnsureSpellInfo(aura));
						me->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

						for (uint8 i = 0; i < 3; ++i)
						{
							if (player->GetTeamId() == TEAM_ALLIANCE)
							{
								if (uint32 cooldown = player->GetSpellHistory()->GetRemainingCooldown(sSpellMgr->EnsureSpellInfo(SPELL_AURA_POSTMAN_S + i)))
								{
									duration = cooldown;
									aura = SPELL_AURA_POSTMAN_S + i;
									_state = argentPonyService[TEAM_ALLIANCE][i];
									me->ToTempSummon()->UnSummon(duration);
									break;
								}
							}
							else
							{
								if (uint32 cooldown = player->GetSpellHistory()->GetRemainingCooldown(sSpellMgr->EnsureSpellInfo(SPELL_AURA_BANK_G + i)))
								{
									duration = cooldown*IN_MILLISECONDS;
									aura = SPELL_AURA_BANK_G + i;
									_state = argentPonyService[TEAM_HORDE][i];
									me->ToTempSummon()->UnSummon(duration);
									break;
								}
							}
						}

						// Generate Banners
						uint32 mask = player->GetTeamId() ? RACEMASK_HORDE : RACEMASK_ALLIANCE;
						for (uint8 i = 1; i < MAX_RACES; ++i)
							if (mask & (1 << (i - 1)) && player->HasAchieved(argentBanners[i].achievement))
								_banners[i] = true;
					}

			if (duration && aura)
			{
				if (Aura* aur = me->AddAura(aura, me))
					aur->SetDuration(duration);
			}
		}

		void UpdateAI(uint32 diff)
		{
			_mountTimer += diff;
			if (_mountTimer > 5000)
			{
				_mountTimer = 0;
				if (_state == ARGENT_PONY_STATE_NONE)
					me->SetUInt32Value(UNIT_NPC_FLAGS, 0);
				else if (Unit* owner = me->GetCharmerOrOwner())
				{
					if (owner->IsMounted() && !me->IsMounted())
						me->CastSpell(me, SPELL_PONY_MOUNT, false);
					else if (!owner->IsMounted() && me->IsMounted())
						me->RemoveAurasDueToSpell(SPELL_PONY_MOUNT);
				}
			}
		}

		uint32 GetData(uint32 param) const
		{
			if (param == 0)
				return _state;

			return _banners[param];
		}

		void DoAction(int32 param)
		{
			if (param > 60000)
			{
				if (_lastAura)
					me->RemoveAurasDueToSpell(_lastAura);
				_lastAura = param;
				return;
			}

			_state = param;
		}

	private:
		bool _init;
		uint8 _state;
		int32 _mountTimer;
		bool _banners[MAX_RACES];
		uint32 _lastAura;
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetGUID() != creature->GetOwnerGUID())
			return true;

		if (!creature->HasAura(player->GetTeamId() ? SPELL_AURA_TIRED_G : SPELL_AURA_TIRED_S))
		{
			uint8 _state = creature->AI()->GetData(0 /*GET_DATA_STATE*/);
			if (_state == ARGENT_PONY_STATE_ENCH || _state == ARGENT_PONY_STATE_VENDOR)
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Visit a trader.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
			if (_state == ARGENT_PONY_STATE_ENCH || _state == ARGENT_PONY_STATE_BANK)
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Visit a bank.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_BANK);
			if (_state == ARGENT_PONY_STATE_ENCH || _state == ARGENT_PONY_STATE_MAILBOX)
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Visit a mailbox.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_MAILBOX);
		}

		for (uint8 i = RACE_HUMAN; i < MAX_RACES; ++i)
			if (creature->AI()->GetData(i) == uint32(true))
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, argentBanners[i].text, GOSSIP_SENDER_MAIN, argentBanners[i].spell);

		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 action)
	{
		player->CLOSE_GOSSIP_MENU();
		uint32 spellId = 0;
		switch (action)
		{
		case GOSSIP_ACTION_TRADE:
			creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_VENDOR);
			player->GetSession()->SendListInventory(creature->GetGUID());
			spellId = player->GetTeamId() ? SPELL_AURA_SHOP_G : SPELL_AURA_SHOP_S;
			creature->AI()->DoAction(ARGENT_PONY_STATE_VENDOR);
			break;
		case GOSSIP_ACTION_BANK:
			creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_BANKER);
			player->GetSession()->SendShowBank(player->GetGUID());
			spellId = player->GetTeamId() ? SPELL_AURA_BANK_G : SPELL_AURA_BANK_S;
			creature->AI()->DoAction(ARGENT_PONY_STATE_BANK);
			break;
		case GOSSIP_ACTION_MAILBOX:
		{
			creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_MAILBOX);
			player->GetSession()->SendShowMailBox(creature->GetGUID());
			spellId = player->GetTeamId() ? SPELL_AURA_POSTMAN_G : SPELL_AURA_POSTMAN_S;
			creature->AI()->DoAction(ARGENT_PONY_STATE_MAILBOX);
			break;
		}
		default:
			if (action > 60000)
			{
				creature->AI()->DoAction(action);
				creature->CastSpell(creature, action, true);
			}
			return true;
		}

		if (spellId && !creature->HasAura(spellId))
		{
			creature->CastSpell(creature, spellId, true);
			player->GetSpellHistory()->AddCooldown(spellId, 0, std::chrono::minutes(3));			
			player->GetSpellHistory()->AddCooldown(player->GetTeamId() ? SPELL_AURA_TIRED_G : SPELL_AURA_TIRED_S, 0, std::chrono::minutes(3) + std::chrono::hours(4));
			creature->DespawnOrUnsummon(3 * MINUTE*IN_MILLISECONDS);
		}
		return true;
	}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_pet_gen_argent_pony_bridleAI(creature);
	}
};

class npc_pet_gen_wind_rider_cub_gryphon_hatch : public CreatureScript
{
public:
    npc_pet_gen_wind_rider_cub_gryphon_hatch() : CreatureScript("npc_pet_gen_wind_rider_cub_gryphon_hatch") { }

    struct npc_pet_gen_wind_rider_cub_gryphon_hatchAI : public NullCreatureAI
    {
        npc_pet_gen_wind_rider_cub_gryphon_hatchAI(Creature *c) : NullCreatureAI(c)
        {
            allowMove = true;
            isFlying = true;
            checkTimer = 0;
            checkTimer2 = 2000;            
        }

        bool isFlying;
        bool allowMove;
        uint32 checkTimer;
        uint32 checkTimer2;

        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE && id == 1)
                allowMove = true;
        }

        void UpdateAI(uint32 diff)
        {
            checkTimer2 += diff;
            if (checkTimer2 > 2000)
            {
                checkTimer2 = 0;
                if (Unit* owner = me->GetOwner())
                {
                    if (owner->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED) || owner->IsMounted())
                    {
                        isFlying = true;
                        me->SetCanFly(true);
                        me->SetDisableGravity(true);
                    }
                    else if (isFlying)
                    {
                        isFlying = false;
                        me->SetCanFly(false);
                        me->SetDisableGravity(false);
                        me->GetMotionMaster()->MoveFall();
                    }
                }
            }

            checkTimer += diff;
            if (allowMove || checkTimer > 2000)
            {
                allowMove = false;
                checkTimer = 0;
                if (Unit* owner = me->GetOwner())
                {
                    if (me->GetMotionMaster()->GetMotionSlotType(MOTION_SLOT_ACTIVE) == POINT_MOTION_TYPE ||
                        me->GetDistance(owner) < 1.0f)
                        return;
                    float x, y, z;
                    owner->GetNearPoint2D(x, y, 0.5f, owner->GetOrientation() + PET_FOLLOW_ANGLE);
                    z = owner->GetPositionZ() + (isFlying ? 2.5f : 0.0f);

                    me->GetMotionMaster()->MovePoint(1, x, y, z);
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_pet_gen_wind_rider_cub_gryphon_hatchAI(pCreature);
    }
};

enum turkey
{
    GO_BASIC_CAMPFIRE = 29784,
    SPELL_TURKEY_STARTS_TO_BURN = 61768,
};

class npc_pet_gen_plump_turkey : public CreatureScript
{
public:
    npc_pet_gen_plump_turkey() : CreatureScript("npc_pet_gen_plump_turkey") { }

    struct npc_pet_gen_plump_turkeyAI : public PassiveAI
    {
        npc_pet_gen_plump_turkeyAI(Creature *c) : PassiveAI(c)
        {
            jumpTimer = 0;
            checkTimer = 0;
            jumping = false;
        }

        ObjectGuid goGUID;
        uint32 jumpTimer;
        uint32 checkTimer;
        bool jumping;

        void MovementInform(uint32 type, uint32 id)
        {
            if (type == EFFECT_MOTION_TYPE && id == 1)
            {
                me->Kill(me);
                me->AddAura(SPELL_TURKEY_STARTS_TO_BURN, me);
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (jumping)
                return;

            if (jumpTimer)
            {
                jumpTimer += diff;
                if (jumpTimer >= 2000)
                {
                    if (GameObject* go = me->GetMap()->GetGameObject(goGUID))
                        me->GetMotionMaster()->MoveJump(*go, 5.0f, 10.0f, 1);
                    jumping = true;
                }
                return;
            }

            checkTimer += diff;
            if (checkTimer > 3000)
            {
                checkTimer = 0;
                if (GameObject* go = me->FindNearestGameObject(GO_BASIC_CAMPFIRE, 7.0f))
                {
                    goGUID = go->GetGUID();
                    me->StopMoving();
                    me->GetMotionMaster()->Clear(false);
                    me->SetFacingTo(me->GetAngle(go));
                    Talk(0);
                    jumpTimer = 1;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_pet_gen_plump_turkeyAI(pCreature);
    }
};

enum TargetFollowingBombMisc
{
    NPC_EXPLOSIVE_SHEEP = 2675,
    SPELL_EXPLOSIVE_SHEEP = 4050,

    NPC_GOBLIN_BOMB = 8937,
    SPELL_EXPLOSIVE_GOBLIN = 13259,

    NPC_HIGH_EXPLOSIVE_SHEEP = 24715,
    SPELL_HIGH_EXPLOSIVE_SHEEP = 44279,
};

class npc_pet_gen_target_following_bomb : public CreatureScript
{
public:
    npc_pet_gen_target_following_bomb() : CreatureScript("npc_pet_gen_target_following_bomb") { }

    struct npc_pet_gen_target_following_bombAI : public NullCreatureAI
    {
        npc_pet_gen_target_following_bombAI(Creature *c) : NullCreatureAI(c)
        {
            checkTimer = 0;
            bombSpellId = 0;

            switch (me->GetEntry())
            {
            case NPC_EXPLOSIVE_SHEEP:
                bombSpellId = SPELL_EXPLOSIVE_SHEEP;
                break;
            case NPC_GOBLIN_BOMB:
                bombSpellId = SPELL_EXPLOSIVE_GOBLIN;
                break;
            case NPC_HIGH_EXPLOSIVE_SHEEP:
                bombSpellId = SPELL_HIGH_EXPLOSIVE_SHEEP;
                break;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            checkTimer += diff;
            if (checkTimer >= 1000)
            {
                checkTimer = 0;
                if (Unit* target = me->SelectNearestTarget(30.0f))
                {
                    me->GetMotionMaster()->MoveChase(target);
                    if (me->GetDistance(target) < 3.0f)
                    {
                        me->CastSpell(me, bombSpellId, false);
                        me->DespawnOrUnsummon(500);
                    }
                }
                else if (!me->HasUnitState(UNIT_STATE_FOLLOW))
                {
                    if (Unit* owner = me->GetCharmerOrOwner())
                    {
                        me->GetMotionMaster()->MoveFollow(owner, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
                    }
                }
            }
        }

    private:
        uint32 bombSpellId;
        uint32 checkTimer;
    };

    CreatureAI* GetAI(Creature* pCreature) const override
    {
        return new npc_pet_gen_target_following_bombAI(pCreature);
    }
};

void AddSC_generic_pet_scripts()
{
    new npc_pet_gen_mojo();
	new npc_pet_onyxian_whelpling();
	new npc_pet_gen_argent_pony_bridle();
    new npc_pet_gen_wind_rider_cub_gryphon_hatch();
    new npc_pet_gen_plump_turkey();
    new npc_pet_gen_target_following_bomb();
}
