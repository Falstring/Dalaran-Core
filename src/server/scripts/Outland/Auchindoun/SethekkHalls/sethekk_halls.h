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

#ifndef SETHEKK_HALLS_H_
#define SETHEKK_HALLS_H_

#define SHScriptName "instance_sethekk_halls"
#define DataHeader "SH"

uint32 const EncounterCount             = 3;

enum DataTypes
{
    // Encounter States/Boss GUIDs
    DATA_DARKWEAVER_SYTH                = 0,
    DATA_TALON_KING_IKISS               = 1,
    DATA_ANZU                           = 2,

    // Additional Data
    DATA_TALON_KING_COFFER              = 3
};

enum CreatureIds
{
    NPC_ANZU                            = 23035,
    NPC_BROOD_OF_ANZU                   = 23132,
    NPC_RAVEN_GOD_CASTER                = 23058,
    NPC_RAVEN_GOD_TARGET                = 23057,
    NPC_RAVEN_GOD_PORTAL                = 23046,
    NPC_HAWK_SPIRIT                     = 23134,
    NPC_EAGLE_SPIRIT                    = 23136,
    NPC_FALCON_SPIRIT                   = 23135,
    NPC_AVIAN_FLYER                     = 21931  // NEED 5 TIMES FLYING AROUND ANZU
};

enum GameObjectIds
{
    GO_IKISS_DOOR                       = 177203,
    GO_TALON_KING_COFFER                = 187372,
    GO_RAVENS_CLAW                      = 185554,
    GO_MOONSTONE                        = 185590,
    GO_RIFT                             = 185595
};

enum SpellIds
{
    SPELL_PORTAL                        = 39952,
    SPELL_SUMMONING_BEAMS               = 39978,
    SPELL_RED_LIGHTNING                 = 39990,
    SPELL_SHAKE_CAMERA                  = 39983,
    SPELL_PURPLE_BANISH                 = 32566
};

enum AnzuEvents
{
    EVENT_ANZU_INTRO_1                  = 1,
    EVENT_ANZU_INTRO_2                  = 2,
    EVENT_ANZU_INTRO_3                  = 3,
    EVENT_ANZU_INTRO_4                  = 4,
    EVENT_ANZU_INTRO_5                  = 5,
    
    PHASE_ANZU_INTRO                    = 1
};

template<class AI>
AI* GetSethekkHallsAI(Creature* creature)
{
    return GetInstanceAI<AI>(creature, SHScriptName);
}

#endif // SETHEKK_HALLS_H_
