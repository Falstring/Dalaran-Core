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

#ifndef SLAVE_PENS_H
#define SLAVE_PENS_H

uint32 const EncounterCount               = 3;

#define SPScriptName "instance_the_slave_pens"
#define DataHeader "SP"

enum DataTypes
{
    DATA_MENNU_THE_BETRAYER               = 1,
    DATA_ROKMAR_THE_CRACKLER              = 2,
	DATA_QUAGMIRRAN = 3,
	DATA_AHUNE = 4,
	DATA_AHUNE_EVENT = 5,
	DATA_AHUNE_BUNNY = 6,
	DATA_FROZEN_CORE = 7,
	DATA_ICE_SPEAR = 8,
	DATA_TOTEM_A = 9,
	DATA_TOTEM_B = 10,
	DATA_TOTEM_C = 11,
	DATA_FLAMECALLER_A = 12,
	DATA_FLAMECALLER_B = 13,
	DATA_FLAMECALLER_C = 14
};

enum CreaturesIds
{
	NPC_AHUNITE_COLDWEAVE = 25756,
	NPC_AHUNITE_FROSTWIND = 25757,
	NPC_AHUNITE_HAILSTONE = 25755,
	NPC_AHUNE = 25740,
	NPC_FROZEN_CORE = 25865,
	NPC_GHOST_OF_AHUNE = 26239,
	NPC_SLIPPERY_FLOOR = 25952,
	NPC_EARTHEN_RING_TOTEM = 25961,
	NPC_ICE_SPEAR_BUNNY = 25985,
	NPC_AHUNE_LOC_BUNNY = 25745,
	NPC_EARTHEN_RING_FLAMECALLER = 25754
};

enum GameObjectIds
{
	GO_ICE_SPEAR = 188077,
	GO_ICE_STONE = 187882,
	GO_ICE_CHEST = 187892
};

#endif // SLAVE_PENS_H
