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

#ifndef DEF_GNOMEREGAN_H
#define DEF_GNOMEREGAN_H

#define DataHeader "GNO"
#define MAX_GNOME_FACES 6

enum GameObjectIds
{
    GO_CAVE_IN_LEFT     = 146085,
    GO_CAVE_IN_RIGHT    = 146086,
    GO_RED_ROCKET       = 103820,

    //Mekgineer Thermaplugg
    GO_GNOME_FACE_01    = 142211,
    GO_GNOME_FACE_02    = 142210,
    GO_GNOME_FACE_03    = 142209,
    GO_GNOME_FACE_04    = 142208,
    GO_GNOME_FACE_05    = 142213,
    GO_GNOME_FACE_06    = 142212,

    GO_BUTTON_01        = 142214,
    GO_BUTTON_02        = 142215,
    GO_BUTTON_03        = 142216,
    GO_BUTTON_04        = 142217,
    GO_BUTTON_05        = 142218,
    GO_BUTTON_06        = 142219,
};

enum CreatureIds
{
    NPC_BLASTMASTER_EMI_SHORTFUSE   = 7998,
    NPC_CAVERNDEEP_AMBUSHER         = 6207,
    NPC_GRUBBIS                     = 7361,
    NPC_CHOMPER                     = 6215,

    //Mekgineer Thermaplugg
    NPC_MEKGINEER_THERMAPLUG        = 7800,
    NPC_WALKING_BOMB                = 7915,

    NPC_WORLD_TRIGGER               = 22515
};

enum Data
{
    TYPE_EVENT = 1
};

enum Data64
{
    DATA_GO_CAVE_IN_LEFT,
    DATA_GO_CAVE_IN_RIGHT,
    DATA_NPC_BASTMASTER_EMI_SHORTFUSE,
    DATA_MEKGINEER_THERMAPLUGG,
};

uint32 const GnomeFaces[MAX_GNOME_FACES] =
{
    142211,
    142210,
    142209,
    142208,
    142213,
    142212,
};

#endif
