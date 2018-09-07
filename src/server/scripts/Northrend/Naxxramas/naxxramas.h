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

#ifndef DEF_NAXXRAMAS_H
#define DEF_NAXXRAMAS_H

#define DataHeader "NAX"

enum MyEvents
{
	EVENT_BOSS_CHECK	=	1,
	EVENT_THADDIUS_LAMENTS = 2,

	EVENT_FROGGER_SUMMON_LIVING_POISON = 3,

    EVENT_KT_LK_DIALOG1_KT                                       = 4, 
    EVENT_KT_LK_DIALOG2_LICH									 = 5, 
    EVENT_KT_LK_DIALOG3_KT                                       = 6, 
    EVENT_KT_LK_DIALOG4_LICH                                     = 7, 
    EVENT_KT_LK_DIALOG5_KT                                      = 8,
	EVENT_SUMMON_FROGGER_WAVE									=9,
};

uint32 const EncounterCount     = 15;

enum Encounter
{
    BOSS_ANUBREKHAN,
    BOSS_FAERLINA,
    BOSS_MAEXXNA,
    BOSS_NOTH,
    BOSS_HEIGAN,
    BOSS_LOATHEB,
    BOSS_PATCHWERK,
    BOSS_GROBBULUS,
    BOSS_GLUTH,
    BOSS_THADDIUS,
    BOSS_RAZUVIOUS,
    BOSS_GOTHIK,
    BOSS_HORSEMEN,
    BOSS_SAPPHIRON,
    BOSS_KELTHUZAD
};

enum Data
{
    DATA_HEIGAN_ERUPT,
    DATA_GOTHIK_GATE,
    DATA_SAPPHIRON_BIRTH,

    DATA_HORSEMEN0,
    DATA_HORSEMEN1,
    DATA_HORSEMEN2,
    DATA_HORSEMEN3,
    DATA_ABOMINATION_KILLED,
	DATA_TELEPORT_ORB,
	DATA_HAD_SAPPHIRON_BIRTH
};

enum Data64
{
	DATA_PATCHWERK,
	DATA_GROBBULUS,
	DATA_GLUTH,
    DATA_FAERLINA,
	DATA_GOTHIK,
	DATA_MAEXXNA,
    DATA_THANE,
    DATA_LADY,
    DATA_BARON,
    DATA_SIR,
    DATA_THADDIUS,
    DATA_HEIGAN,
	DATA_LOATHEB,
    DATA_FEUGEN,
    DATA_STALAGG,
    DATA_KELTHUZAD,
    DATA_KELTHUZAD_PORTAL01,
    DATA_KELTHUZAD_PORTAL02,
    DATA_KELTHUZAD_PORTAL03,
    DATA_KELTHUZAD_PORTAL04,
    DATA_KELTHUZAD_TRIGGER,

	DATA_THADDIUS_LAMMENT_BUNNY01,
	DATA_THADDIUS_LAMMENT_BUNNY02,
	DATA_THADDIUS_LAMMENT_BUNNY03,
	DATA_THADDIUS_LAMMENT_BUNNY04,
	DATA_THADDIUS_LAMMENT_BUNNY05,
	DATA_THADDIUS_LAMMENT_BUNNY06,
	DATA_THADDIUS_LAMMENT_BUNNY07,

	DATA_STALAGG_TESLA_COIL,
	DATA_FEUGEN_TESLA_COIL,
	DATA_SAPPHIRON,

	DATA_PLAGUE_QUARTER_RAMP,
	DATA_ARACHNID_QUARTER_RAMP,
	DATA_MILITARY_QUARTER_RAMP,
	DATA_CONSTRUCT_QUARTER_RAMP
};

enum CreaturesIds
{
    NPC_FAERLINA                = 15953,
	NPC_GOTHIK					= 16060,
	NPC_MAEXXNA					= 15952,
    NPC_THANE                   = 16064,
    NPC_LADY                    = 16065,
    NPC_BARON                   = 30549,
    NPC_SIR                     = 16063,
    NPC_THADDIUS                = 15928,
    NPC_HEIGAN                  = 15936,
    NPC_FEUGEN                  = 15930,
    NPC_STALAGG                 = 15929,
    NPC_SAPPHIRON               = 15989,
    NPC_KEL_THUZAD              = 15990,
    NPC_CRYPT_GUARD             = 16573,
    NPC_NAXXRAMAS_FOLLOWER      = 16505,
    NPC_FOLLOWER_WORSHIPPER     = 16506,
    NPC_DK_UNDERSTUDY           = 16803,
	NPC_PATCHWERK				= 16028,
	NPC_GROBBULUS				= 15931,
	NPC_GLUTH					= 15932,
	NPC_LOATHEB					= 16011,
	/**/

	NPC_THADDIUS_LAMMENT_BUNNY01	=381532,
	NPC_THADDIUS_LAMMENT_BUNNY02	=381533,
	NPC_THADDIUS_LAMMENT_BUNNY03	=381534,
	NPC_THADDIUS_LAMMENT_BUNNY04	=381535,
	NPC_THADDIUS_LAMMENT_BUNNY05	=381536,
	NPC_THADDIUS_LAMMENT_BUNNY06	=381537,
	NPC_THADDIUS_LAMMENT_BUNNY07	=381538,

	NPC_STALAGG_TESLA_COIL			= 225154,
	NPC_FEUGEN_TESLA_COIL			= 225155,
	

	NPC_PLAGUE_QUARTER_RAMP			= 381551,
	NPC_ARACHNID_QUARTER_RAMP		= 381553,
	NPC_MILITARY_QUARTER_RAMP		= 381555,
	NPC_CONSTRUCT_QUARTER_RAMP		= 381557,
	NPC_OLD_WORLD_TRIGGER = 15384,
	NPC_FROGGER = 16027


};

enum GameObjectsIds
{
    GO_HORSEMEN_CHEST_HERO      = 193426,
    GO_HORSEMEN_CHEST           = 181366,
    GO_GOTHIK_GATE              = 181170,
    GO_KELTHUZAD_PORTAL01       = 181402,
    GO_KELTHUZAD_PORTAL02       = 181403,
    GO_KELTHUZAD_PORTAL03       = 181404,
    GO_KELTHUZAD_PORTAL04       = 181405,
    GO_KELTHUZAD_TRIGGER        = 181444,
    GO_ROOM_ANUBREKHAN          = 181126,
    GO_PASSAGE_ANUBREKHAN       = 181195,
    GO_PASSAGE_FAERLINA         = 194022,
    GO_ROOM_MAEXXNA             = 181209,
    GO_ROOM_NOTH                = 181200,
    GO_PASSAGE_NOTH             = 181201,
    GO_ROOM_HEIGAN              = 181202,
    GO_PASSAGE_HEIGAN           = 181203,
    GO_ROOM_LOATHEB             = 181241,
    GO_ROOM_GROBBULUS           = 181123,
    GO_PASSAGE_GLUTH            = 181120,
    GO_ROOM_THADDIUS            = 181121,
    GO_ROOM_GOTHIK              = 181124,
    GO_PASSAGE_GOTHIK           = 181125,
    GO_ROOM_HORSEMEN            = 181119,
    GO_PASSAGE_SAPPHIRON        = 181225,
    GO_ROOM_KELTHUZAD           = 181228,
    GO_ARAC_PORTAL              = 181575,
    GO_PLAG_PORTAL              = 181577,
    GO_MILI_PORTAL              = 181578,
    GO_CONS_PORTAL              = 181576,
    GO_ARAC_EYE_RAMP            = 181212,
    GO_PLAG_EYE_RAMP            = 181211,
    GO_MILI_EYE_RAMP            = 181210,
    GO_CONS_EYE_RAMP            = 181213,
    GO_ARAC_EYE_RAMP_BOSS       = 181233,
    GO_PLAG_EYE_RAMP_BOSS       = 181231,
    GO_MILI_EYE_RAMP_BOSS       = 181230,
    GO_CONS_EYE_RAMP_BOSS       = 181232,
    GO_CONS_NOX_TESLA_FEUGEN    = 181477,
    GO_CONS_NOX_TESLA_STALAGG   = 181478,
    GO_BIRTH                    = 181356,
	GO_TELEPORT_ORB				= 202278
};

enum SpellIds
{
    SPELL_ERUPTION              = 29371,
    SPELL_SLIME                 = 28801,

	SPELL_LIVING_POISON_EXPLOSION =28433
};

/*
template<class AI>
CreatureAI* GetNaxxramasAI(Creature* creature)
{
    if (InstanceMap* instance = creature->GetMap()->ToInstanceMap())
        if (instance->GetInstanceScript())
            if (instance->GetScriptId() == sObjectMgr->GetScriptId(NaxxramasScriptName))
                return new AI(creature);

    return NULL;
}
*/

#endif
