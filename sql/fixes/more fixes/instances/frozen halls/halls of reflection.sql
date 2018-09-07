DELETE FROM disables WHERE sourceType=2 AND entry IN(668);
-- INSERT INTO disables VALUES(2, 668, 0, 0, 3, "", "", "");
REPLACE INTO `access_requirement` VALUES (668, 0, 78, 0, 180, 0, 0, 24710, 24712, 0, NULL, "Halls of Reflection (Entrance)");
REPLACE INTO `access_requirement` VALUES (668, 1, 80, 0, 219, 0, 0, 24710, 24712, 0, NULL, "Halls of Reflection (Entrance)");



-- ###################
-- ### GAMEOBJECTS
-- ###################

-- Ice Wall (201385)
UPDATE gameobject_template SET flags=48 WHERE entry=201385;
DELETE FROM gameobject WHERE id=201385 AND map=668;

-- The Captain's Chest
UPDATE gameobject_template SET flags=0 WHERE entry IN(201710,202336);

-- Gunship Stairs (202211) (horde)
-- Gunship Stairs (201709) (alliance)
DELETE FROM gameobject WHERE id IN(202211, 201709) AND map=668;

-- Cave In (201596)

-- The Skybreaker (201598) -- map 712 -- copy some npcs from original in icecrown (map 623)
-- copy Skybreaker Deckhand (30351), Skybreaker Marine (30352), Skybreaker Cannoneer (30380), Skybreaker Engineer (30394), Skybreaker Shield-Mage (30867)
UPDATE gameobject_template SET flags=40 WHERE entry=201598;
DELETE FROM gameobject WHERE map=712;
DELETE FROM creature WHERE map=712;
INSERT INTO `gameobject` VALUES (NULL, 201710, 712, 0, 0, 1, 1, -14.99, 11.43, 20.41, 1.46, 0, 0, 0.386597, 0.922249, 86400, 0, 1, 0);
INSERT INTO `gameobject` VALUES (NULL, 202336, 712, 0, 0, 2, 1, -14.99, 11.43, 20.41, 1.46, 0, 0, 0.386597, 0.922249, 86400, 0, 1, 0);
INSERT INTO `gameobject` VALUES (NULL, 195682, 712, 0, 0, 3, 1, -3.86, 11.99, 20.44, 1.68, 0, 0, 0.514372, 0.857567, 86400, 0, 1, 0);
INSERT INTO `creature` VALUES (247300, 30344, 712, 0, 0, 3, 1, 0, 1, -9.51, 9.77, 20.43, 1.52, 300, 0, 0, 21368, 0, 0, 0, 0, 0, 0);
SET @myguid = 247300;
INSERT INTO creature SELECT @myguid := @myguid+1, id, 712, 0, 0, 3, 1, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, 0 FROM creature WHERE map=623 AND id IN(30351,30352,30380,30394,30867);


-- Orgrim's Hammer (201599) -- map 713 -- copy some npcs from original in icecrown (map 622)
-- copy Orgrim's Hammer Gunner (30752), Orgrim's Hammer Engineer (30753), Orgrim's Hammer Crew (30754), Kor'kron Reaver (30755), Orgrim's Hammer Shadow-Warder (30866), Warsong Cannon (31243)
UPDATE gameobject_template SET flags=40 WHERE entry=201599;
DELETE FROM gameobject WHERE map=713;
DELETE FROM creature WHERE map=713;
INSERT INTO `gameobject` VALUES (NULL, 201710, 713, 0, 0, 1, 1, 7.43, 19.12, 34.78, 1.14, 0, 0, 0.376252, 0.926518, 86400, 0, 1, 0);
INSERT INTO `gameobject` VALUES (NULL, 202336, 713, 0, 0, 2, 1, 7.43, 19.12, 34.78, 1.14, 0, 0, 0.376252, 0.926518, 86400, 0, 1, 0);
INSERT INTO `gameobject` VALUES (NULL, 195682, 713, 0, 0, 3, 1, 22.28, 20.47, 35.53, 1.88, 0, 0, 0.70357, 0.710626, 86400, 0, 1, 0);
INSERT INTO `creature` VALUES (247400, 30824, 713, 0, 0, 3, 1, 0, 1, 14.81, 16.84, 34.97, 1.55, 300, 0, 0, 21368, 0, 0, 0, 0, 0, 0);
SET @myguid = 247400;
INSERT INTO creature SELECT @myguid := @myguid+1, id, 713, 0, 0, 3, 1, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, 0 FROM creature WHERE map=622 AND id IN(30752,30753,30754,30755,30866,31243);



-- ###################
-- ### NPCS
-- ###################

-- Imprisoned Soul (37906)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37906) AND `map`=668 );
DELETE FROM creature WHERE id IN(37906) AND `map`=668;
UPDATE creature_template SET flags_extra=130 WHERE entry=37906;

-- Frostmourne Altar Bunny (Quel'Delar) (37704)
UPDATE creature_template SET modelid1=17612, modelid2=0, faction=114, unit_flags=33554432, AIName='NullCreatureAI', InhabitType=4, ScriptName='', flags_extra=0 WHERE entry=37704;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37704) AND `map`=668 );
DELETE FROM creature WHERE id IN(37704) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37704, 668, 0, 0, 3, 1, 17612, 0, 5309.26, 2006.39, 718.047, 3.97935, 86400, 0, 0, 12600, 0, 0, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES(37704, 0, 0, 50331648, 1, 0, '');

-- Dark Ranger Loralen (37779,37797)
-- Archmage Elandra (37774,37809)
-- template changes in FoS sql file
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37779, 37774) AND `map`=668 );
DELETE FROM creature WHERE id IN(37779, 37774) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37779,  668, 0, 0,  3, 1, 30687, 1, 5232.69, 1931.52, 707.778, 0.820305, 86400, 0, 0, 75600, 0, 0, 0, 0, 0, 0);

-- Uther the Lightbringer (37225)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37225) AND `map`=668 );
DELETE FROM creature WHERE id IN(37225) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37225, 668, 0, 0, 3, 1, 30821, 1, 5307.81, 2003.17, 709.424, 4.53786, 86400, 0, 0, 315000, 59910, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_run=1.14, unit_flags=33600, AIName='', ScriptName='' WHERE entry=37225;

-- Lady Sylvanas Windrunner (37223)
-- Lady Jaina Proudmoore (37221)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37221, 37223) AND `map`=668 );
DELETE FROM creature WHERE id IN(37221, 37223) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37223,  668, 0, 0,  3, 1, 28213, 1, 5236.67, 1929.91, 707.778, 0.837758, 86400, 0, 0, 6972500, 85160, 0, 0, 0, 0, 0);
UPDATE creature_template SET minlevel=83, maxlevel=83, faction=35, npcflag=2, speed_walk=0.888888, speed_run=0.99206, rank=3, unit_flags=33600, unit_flags2=2048, AIName='', ScriptName='npc_hor_leader' WHERE entry IN(37221, 37223);


DELETE from creature_queststarter WHERE id=37221 and quest=24500;
INSERT INTO `creature_queststarter` VALUES (37221, 24500);

DELETE from creature_queststarter WHERE id=37223 and quest=24802;
INSERT INTO `creature_queststarter` VALUES (37223, 24802);

-- The Lich King (37226) -- for the intro
UPDATE creature_template SET speed_walk=2, speed_run=1.4, AIName='', ScriptName='' WHERE entry=37226;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37226) AND `map`=668 );
DELETE FROM creature WHERE id IN(37226) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37226,  668, 0, 0,  3, 1, 30721, 0, 5362.46, 2062.69, 707.778, 3.94444, 86400, 0, 0, 27890000, 0, 0, 0, 0, 0, 0);
DELETE FROM creature_equip_template WHERE creatureid=37226;
INSERT INTO creature_equip_template VALUES(37226, 1, 49706, 0, 0, 0);

-- Falric (38112, 38599)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38112, 38599) AND `map`=668 );
DELETE FROM creature WHERE id IN(38112, 38599) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38112,  668, 0, 0,  3, 1, 0, 1, 5284.161133, 2030.691650, 709.319336, 5.489386, 86400, 0, 0, 377468, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET minlevel=82, maxlevel=82, faction=16, speed_walk=1.2, speed_run=1.42857, baseattacktime=1800, unit_flags=832, AIName='', mechanic_immune_mask=617299839, ScriptName='boss_falric', flags_extra=0+0x200000 WHERE entry=38112;
UPDATE creature_template SET minlevel=82, maxlevel=82, faction=16, speed_walk=1.2, speed_run=1.42857, baseattacktime=1800, unit_flags=832, AIName='', mechanic_immune_mask=617299839, ScriptName='', flags_extra=1+0x200000 WHERE entry=38599;

-- Marwyn (38113, 38603)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38113, 38603) AND `map`=668 );
DELETE FROM creature WHERE id IN(38113, 38603) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38113,  668, 0, 0,  3, 1, 0, 1, 5335.330078, 1982.376221, 709.319580, 2.339942, 86400, 0, 0, 539240, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET minlevel=82, maxlevel=82, faction=16, speed_walk=1.2, speed_run=1.42857,  baseattacktime=2000, unit_flags=832, AIName='', mechanic_immune_mask=617299839, ScriptName='boss_marwyn', flags_extra=0+0x200000 WHERE entry=38113;
UPDATE creature_template SET minlevel=82, maxlevel=82, faction=16, speed_walk=1.2, speed_run=1.42857,  baseattacktime=2000, unit_flags=832, AIName='', mechanic_immune_mask=617299839, ScriptName='', flags_extra=1+0x200000 WHERE entry=38603;

-- Shadowy Mercenary (38177, 38564)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38177, 38564) AND `map`=668 );
DELETE FROM creature WHERE id IN(38177, 38564) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5302.25, 1972.41, 707.778, 1.37881, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5311.03, 1972.23, 707.778, 1.64061, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5277.36, 1993.23, 707.778, 0.401426, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5318.7, 2036.11, 707.778, 4.2237, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5335.72, 1996.86, 707.778, 2.74017, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38177,  668, 0, 0,  3, 1, 0, 1, 5299.43, 1979.01, 707.778, 1.23918, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=1200, unit_flags=33555264, AIName='', ScriptName='npc_shadowy_mercenary' WHERE entry=38177;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=1200, unit_flags=33555264, AIName='', ScriptName='' WHERE entry=38564;

-- Spectral Footman (38173, 38525)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38173, 38525) AND `map`=668 );
DELETE FROM creature WHERE id IN(38173, 38525) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5306.06, 2037, 707.778, 4.81711, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5344.15, 2007.17, 707.778, 3.15905, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5337.83, 2010.06, 707.778, 3.22886, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5343.29, 1999.38, 707.778, 2.9147, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5340.84, 1992.46, 707.778, 2.75762, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5325.07, 1977.6, 707.778, 2.07694, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5336.6, 2017.28, 707.778, 3.47321, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5313.82, 1978.15, 707.778, 1.74533, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5280.63, 2012.16, 707.778, 6.05629, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38173,  668, 0, 0,  3, 1, 0, 1, 5322.96, 2040.29, 707.778, 4.34587, 86400, 0, 0, 132300, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='npc_spectral_footman' WHERE entry=38173;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='' WHERE entry=38525;

-- Tortured Rifleman (38176, 38544)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38176, 38544) AND `map`=668 );
DELETE FROM creature WHERE id IN(38176, 38544) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5343.47, 2015.95, 707.778, 3.49066, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5337.86, 2003.4, 707.778, 2.98451, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5319.16, 1974, 707.778, 1.91986, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5299.25, 2036, 707.778, 5.02655, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5295.64, 1973.76, 707.778, 1.18682, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38176,  668, 0, 0,  3, 1, 0, 1, 5282.9, 2019.6, 707.778, 5.88176, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='npc_tortured_rifleman' WHERE entry=38176;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='' WHERE entry=38544;

-- Ghostly Priest (38175, 38563)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38175, 38563) AND `map`=668 );
DELETE FROM creature WHERE id IN(38175, 38563) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5277.74, 2016.88, 707.778, 5.96903, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5295.88, 2040.34, 707.778, 5.07891, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5320.37, 1980.13, 707.778, 2.00713, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5280.51, 1997.84, 707.778, 0.296706, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5302.45, 2042.22, 707.778, 4.90438, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38175, 668, 0, 0, 3, 1, 0, 1, 5306.57, 1977.47, 707.778, 1.50098, 86400, 0, 0, 132300, 19970, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='npc_ghostly_priest' WHERE entry=38175;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='' WHERE entry=38563;

-- Phantom Mage (38172, 38524)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38172, 38524) AND `map`=668 );
DELETE FROM creature WHERE id IN(38172, 38524) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5312.75, 2037.12, 707.778, 4.59022, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5309.58, 2042.67, 707.778, 4.69494, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5275.08, 2008.72, 707.778, 6.21337, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5279.65, 2004.66, 707.778, 0.069813, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5275.48, 2001.14, 707.778, 0.174533, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38172, 668, 0, 0, 3, 1, 0, 0, 5316.7, 2041.55, 707.778, 4.50295, 86400, 0, 0, 132300, 39940, 0, 0, 0, 0, 0);
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='npc_phantom_mage' WHERE entry=38172;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,     baseattacktime=0, unit_flags=33555264, AIName='', ScriptName='' WHERE entry=38524;

-- Phantom Hallucination (38567, 38568)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38567, 38568) AND `map`=668 );
DELETE FROM creature WHERE id IN(38567, 38568) AND `map`=668;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=0, AIName='', ScriptName='npc_phantom_hallucination' WHERE entry=38567;
UPDATE creature_template SET speed_walk=1, speed_run=1.28571,    baseattacktime=0, unit_flags=0, AIName='', ScriptName='' WHERE entry=38568;

-- Frostsworn General (36723, 37720)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36723, 37720) AND `map`=668 );
DELETE FROM creature WHERE id IN(36723, 37720) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 36723, 668, 0, 0, 3, 1, 0, 1, 5413.92, 2116.5, 707.695, 3.95015, 86400, 0, 0, 441000, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=16, speed_walk=1, speed_run=1.28,     baseattacktime=2000, unit_flags=64, AIName='', mechanic_immune_mask=617299839, ScriptName='boss_frostsworn_general', flags_extra=0+0x200000 WHERE entry=36723;
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=16, speed_walk=1, speed_run=1.28,     baseattacktime=2000, unit_flags=64, AIName='', mechanic_immune_mask=617299839, ScriptName='', flags_extra=1+0x200000 WHERE entry=37720;

-- Spiritual Reflection (37068, 37721), (37107, 37722)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37068, 37721, 37107, 37722) AND `map`=668 );
DELETE FROM creature WHERE id IN(37068, 37721, 37107, 37722) AND `map`=668;
UPDATE creature_template SET difficulty_entry_1=0 WHERE entry IN(37068, 37721, 37107, 37722);
UPDATE creature_template SET difficulty_entry_1=37721, exp=2, minlevel=80, maxlevel=80, faction=16, speed_walk=1, speed_run=1.14286,     baseattacktime=2000, unit_flags=33024, InhabitType=7, AIName='', mechanic_immune_mask=0, ScriptName='npc_hor_spiritual_reflection', flags_extra=0 WHERE entry=37068;
UPDATE creature_template SET exp=2, minlevel=80, maxlevel=80, faction=16, speed_walk=1, speed_run=1.14286,    baseattacktime=2000, unit_flags=33024, InhabitType=7, AIName='', mechanic_immune_mask=0, ScriptName='', flags_extra=0 WHERE entry=37721;
INSERT INTO `creature` VALUES (NULL, 37068, 668, 0, 0, 3, 1, 0, 0, 5377.687500, 2115.718262, 716.400000, 0.000000, 86400, 0, 0, 100800, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37068, 668, 0, 0, 3, 1, 0, 0, 5450.000488, 2116.960938, 716.400000, 3.140000, 86400, 0, 0, 100800, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37068, 668, 0, 0, 3, 1, 0, 0, 5412.994141, 2152.547852, 716.400000, 4.710000, 86400, 0, 0, 100800, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37068, 668, 0, 0, 3, 1, 0, 0, 5414.404297, 2080.310059, 716.400000, 1.570000, 86400, 0, 0, 100800, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37068, 668, 0, 0, 3, 1, 0, 0, 5382.038574, 2134.820068, 716.400000, 5.750000, 86400, 0, 0, 100800, 0, 0, 0, 0, 0, 0);

-- The Lich King (36954)
UPDATE creature_template SET difficulty_entry_1=0, speed_walk=2, speed_run=0.86, unit_flags=0, AIName='', RegenHealth=0, ScriptName='npc_hor_lich_king', mechanic_immune_mask=650854271, flags_extra=0+0x200000 WHERE entry=36954;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36954) AND `map`=668 );
DELETE FROM creature WHERE id IN(36954) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 36954, 668, 0, 0, 3, 1, 0, 1, 5553.07, 2261.91, 733.011, 4.23995, 86400, 0, 0, 27890000, 0, 0, 0, 0, 0, 0);

-- Lady Sylvanas Windrunner (37554)
UPDATE creature_template SET speed_walk=0.888888, speed_run=0.99206, unit_flags=0, AIName='', RegenHealth=0, ScriptName='npc_hor_leader_second' WHERE entry=37554;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37554) AND `map`=668 );
DELETE FROM creature WHERE id IN(37554) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37554, 668, 0, 0, 3, 1, 0, 1, 5551.277, 2257.195, 733.011, 1.22009, 86400, 0, 0, 5040000, 881400, 0, 0, 0, 0, 0);
REPLACE INTO `areatrigger_scripts` VALUES(5605, 'at_hor_shadow_throne');

-- Lady Jaina Proudmoore (36955)
UPDATE creature_template SET speed_walk=0.888888, speed_run=0.99206, unit_flags=0, AIName='', RegenHealth=0, ScriptName='npc_hor_leader_second' WHERE entry=36955;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36955) AND `map`=668 );
DELETE FROM creature WHERE id IN(36955) AND `map`=668;





-- Ice Wall Target (37014)
UPDATE creature_template SET difficulty_entry_1=0, modelid1=16925, modelid2=0, unit_flags=33555200, AIName='NullCreatureAI', ScriptName='', flags_extra=128 WHERE entry=37014;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37014) AND `map`=668 );
DELETE FROM creature WHERE id IN(37014) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 37014, 668, 0, 0, 3, 1, 0, 0, 5550.62, 2079.75, 731.715, 4.32146, 86400, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37014, 668, 0, 0, 3, 1, 0, 0, 5504.2, 1974.7, 737.318, 4.04659, 86400, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37014, 668, 0, 0, 3, 1, 0, 0, 5445.09, 1881.48, 752.654, 4.13302, 86400, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37014, 668, 0, 0, 3, 1, 0, 0, 5321.39, 1758.07, 770.419, 3.70108, 86400, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Raging Ghoul (36940, 37550)
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='npc_hor_raging_ghoul', mechanic_immune_mask=8388624 WHERE entry=36940;
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='', mechanic_immune_mask=8388624 WHERE entry=37550;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36940, 37550) AND `map`=668 );
DELETE FROM creature WHERE id IN(36940, 37550) AND `map`=668;
DELETE FROM smart_scripts WHERE entryorguid IN(36940, 37550) AND source_type=0;

-- Risen Witch Doctor (36941, 37551)
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='npc_hor_risen_witch_doctor', mechanic_immune_mask=8388624 WHERE entry=36941;
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='', mechanic_immune_mask=8388624 WHERE entry=37551;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36941, 37551) AND `map`=668 );
DELETE FROM creature WHERE id IN(36941, 37551) AND `map`=668;
DELETE FROM smart_scripts WHERE entryorguid IN(36941, 37551) AND source_type=0;

-- Lumbering Abomination (37069, 37549)
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='npc_hor_lumbering_abomination', mechanic_immune_mask=8388624 WHERE entry=37069;
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=1771, speed_walk=2, speed_run=1.42857,    baseattacktime=2000, unit_flags=0, AIName='', ScriptName='', mechanic_immune_mask=8388624 WHERE entry=37549;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37069, 37549) AND `map`=668 );
DELETE FROM creature WHERE id IN(37069, 37549) AND `map`=668;
DELETE FROM smart_scripts WHERE entryorguid IN(37069, 37549) AND source_type=0;

-- Cave In Dummy (32200)
UPDATE creature_template SET modelid1=11686, modelid2=0, faction=35, unit_flags=768+33554432, InhabitType=4, AIName='NullCreatureAI', flags_extra=0 WHERE entry=32200; 
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(32200) AND `map`=668 );
DELETE FROM creature WHERE id IN(32200) AND `map`=668;
INSERT INTO `creature` VALUES (NULL, 32200, 668, 0, 0, 3, 1, 0, 0, 5274.607910, 1691.748535, 793.158447, 0.000000, 86400, 0, 0, 1, 0, 0, 0, 0, 0, 0);



-- ###################
-- ### SPELLS
-- ###################

-- Shared Suffering (72368, 72369)
-- additional ids: 72373
DELETE FROM spell_script_names WHERE spell_id IN(72368, 72369, 72373, -72368, -72369, -72373);
DELETE FROM spell_scripts WHERE id IN(72368, 72369, 72373, -72368, -72369, -72373);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(72368, 72369, 72373, -72368, -72369, -72373) OR spell_effect IN(72368, 72369, 72373, -72368, -72369, -72373);
INSERT INTO spell_script_names VALUES(72368, "spell_hor_shared_suffering");
INSERT INTO spell_script_names VALUES(72369, "spell_hor_shared_suffering");

-- Halls of Reflection Clone (69828)
DELETE FROM spell_script_names WHERE spell_id=69828;

-- Ice Prison (69708)
DELETE FROM spell_script_names WHERE spell_id IN(69708, -69708);
DELETE FROM spell_scripts WHERE id IN(69708, -69708);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69708, -69708) OR spell_effect IN(69708, -69708);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=69708;
INSERT INTO `conditions` VALUES (13, 3, 69708, 0, 0, 31, 0, 3, 36954, 0, 0, 0, 0, '', 'Ice Prison (Halls of Reflection)');

-- Dark Binding (70194)
DELETE FROM spell_script_names WHERE spell_id IN(70194, -70194);
DELETE FROM spell_scripts WHERE id IN(70194, -70194);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(70194, -70194) OR spell_effect IN(70194, -70194);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=70194;
INSERT INTO `conditions` VALUES (13, 3, 70194, 0, 0, 31, 0, 3, 36954, 0, 0, 0, 0, '', 'Dark Binding (Halls of Reflection)');

-- Destroy Wall (69784) (Jaina)
DELETE FROM spell_script_names WHERE spell_id IN(69784, -69784);
DELETE FROM spell_scripts WHERE id IN(69784, -69784);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69784, -69784) OR spell_effect IN(69784, -69784);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=69784;
INSERT INTO `conditions` VALUES (13, 1, 69784, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Destroy Wall (Halls of Reflection)');

-- Destroy Wall (70224) (Sylvanas)
-- additional ids: 70225
DELETE FROM spell_script_names WHERE spell_id IN(70224, -70224, 70225, -70225);
DELETE FROM spell_scripts WHERE id IN(70224, -70224, 70225, -70225);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(70224, -70224, 70225, -70225) OR spell_effect IN(70224, -70224, 70225, -70225);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(70224, 70225);
INSERT INTO `conditions` VALUES (13, 1, 70224, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Destroy Wall (Halls of Reflection)');
INSERT INTO `conditions` VALUES (13, 1, 70225, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Destroy Wall (Halls of Reflection)');

-- Summon Ice Wall (69768)
-- additional ids: 69767
DELETE FROM spell_script_names WHERE spell_id IN(69768, -69768, 69767, -69767);
DELETE FROM spell_scripts WHERE id IN(69768, -69768, 69767, -69767);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69768, -69768, 69767, -69767) OR spell_effect IN(69768, -69768, 69767, -69767);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(69768, 69767);
-- INSERT INTO `conditions` VALUES (13, 1, 69768, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Summon Ice Wall (Halls of Reflection)');
-- INSERT INTO `conditions` VALUES (13, 5, 69767, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Summon Ice Wall (Halls of Reflection)');

-- Gunship Cannon Fire (70017)
-- additional ids: 70021, 70246
DELETE FROM spell_script_names WHERE spell_id IN(70017, -70017, 70021, 70246, -70021, -70246);
DELETE FROM spell_scripts WHERE id IN(70017, -70017, 70021, 70246, -70021, -70246);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(70017, -70017, 70021, 70246, -70021, -70246) OR spell_effect IN(70017, -70017, 70021, 70246, -70021, -70246);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(70017, 70021, 70246);
INSERT INTO `conditions` VALUES (13, 1, 70021, 0, 0, 31, 0, 3, 32200, 0, 0, 0, 0, '', 'Gunship Cannon Fire (Halls of Reflection)');
INSERT INTO `conditions` VALUES (13, 1, 70246, 0, 0, 31, 0, 3, 32200, 0, 0, 0, 0, '', 'Gunship Cannon Fire (Halls of Reflection)');
INSERT INTO spell_script_names VALUES(70017, "spell_hor_gunship_cannon_fire");

-- Achievement Check (72830)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(72830);
INSERT INTO `conditions` VALUES (13, 1, 72830, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Achievement Check (Halls of Reflection)');



-- ###################
-- ### ACHIEVEMENTS
-- ###################

-- The Halls of Reflection (4518)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12742, 12990, 12743);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12742, 12990, 12743);
REPLACE INTO achievement_criteria_data VALUES(12742, 12, 0, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12990, 12, 0, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12743, 12, 0, 0, "");

-- Heroic: The Halls of Reflection (4521)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12750, 12991, 12751);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12750, 12991, 12751);
REPLACE INTO achievement_criteria_data VALUES(12750, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12991, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12751, 12, 1, 0, "");

-- We're Not Retreating; We're Advancing in a Different Direction. (4526)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12756);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12756);
REPLACE INTO achievement_criteria_data VALUES(12756, 12, 1, 0, "");

-- Delete the area trigger.
DELETE FROM areatrigger_Teleport WHERE id=5740;

-- Trigger from the end of the instance.
UPDATE creature_template SET flags_extra=130 WHERE entry=22515;
UPDATE creature_template SET flags_extra=130 WHERE entry=36736;
UPDATE creature_template SET flags_extra=130 WHERE entry=37071;

-- ###################
-- ### TEXTS
-- ###################

-- insert into creature_text select 37225, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%UTHER%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37223, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%SAY_SYLVANAS_INTRO%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37221, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%SAY_JAINA_INTRO%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37226, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%LK_INTRO%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 38112, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%Falric SAY%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 38113, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%Marwyn SAY%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 36723, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%SAY_FROSTSWORN_GENERAL%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 36954, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%LK - %' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37554, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%SYLVANAS - %' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 36955, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%JAINA - %' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37182, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%Transport_ally%' and type<=3 and (entry between -1668128 and -1668001);
-- insert into creature_text select 37833, ABS(entry+1668000), 0, content_default, IF(type=0,12,IF(type=1,14,IF(type=2,16,IF(type=3,41,0)))), language, 100, emote, 0, sound, comment from script_texts where comment like '%Transport_horda%' and type<=3 and (entry between -1668128 and -1668001);
DELETE FROM creature_text WHERE entry IN(37182, 37833);
DELETE FROM creature_text WHERE entry IN(37225, 37223, 37221, 37226, 38112, 38113, 36723, 36954, 37554, 36955, 30344, 30824); -- uther, sylv 1, jaina 1, lk intro, falric, marwyn, frostsworn general, lk boss, sylv, jaina, bartlett, blackstar
INSERT INTO creature_text VALUES (36723, 98, 0, 'You are not worthy to face the Lich King!', 14, 0, 100, 0, 0, 16921, 0, 0, 'SAY_FROSTSWORN_GENERAL_AGGRO');
INSERT INTO creature_text VALUES (36723, 99, 0, 'Master, I have failed...', 14, 0, 100, 0, 0, 16922, 0, 0, 'SAY_FROSTSWORN_GENERAL_DEATH');
INSERT INTO creature_text VALUES (36954, 100, 0, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', 14, 0, 100, 0, 0, 17213, 0, 0, 'LK -  AGGRO HORDE');
INSERT INTO creature_text VALUES (36954, 101, 0, 'Your allies have arrived, Jaina, just as you promised. Your will all become powerful agents of the Scourge.', 14, 0, 100, 0, 0, 17212, 0, 0, 'LK -  AGGRO ALLY');
INSERT INTO creature_text VALUES (36954, 104, 0, 'There is no escape!', 14, 0, 100, 0, 0, 17217, 0, 0, 'LK -  IceWall_1');
INSERT INTO creature_text VALUES (36954, 105, 0, 'Succumb to the chill of the grave.', 14, 0, 100, 0, 0, 17218, 0, 0, 'LK -  IiceWALL_2');
INSERT INTO creature_text VALUES (36954, 106, 0, 'Another dead end.', 14, 0, 100, 0, 0, 17219, 0, 0, 'LK -  IiceWALL_3');
INSERT INTO creature_text VALUES (36954, 107, 0, 'How long can you fight it?', 14, 0, 100, 0, 0, 17220, 0, 0, 'LK -  IiceWALL_4');
INSERT INTO creature_text VALUES (36954, 108, 0, 'Death\'s cold embrace awaits.', 14, 0, 100, 0, 0, 17221, 0, 0, 'LK -  IiceWALL_1_summon');
INSERT INTO creature_text VALUES (36954, 115, 0, 'Nowhere to run... You\'re mine now!', 14, 0, 100, 0, 0, 17223, 0, 0, 'LK -  KILING SILVANAS');
INSERT INTO creature_text VALUES (36955, 103, 0, 'He is too powerful. We must leave this place at once! My magic can hold him in place for only a short time. Come quickly heroes!', 14, 0, 100, 0, 0, 16606, 0, 0, 'JAINA -  Leave the place');
INSERT INTO creature_text VALUES (36955, 119, 0, 'I will destroy this barrier. You must hold the undead back!', 14, 0, 100, 0, 0, 16607, 0, 0, 'JAINA -  IceWALL_1');
INSERT INTO creature_text VALUES (36955, 120, 0, 'Another ice wall! Keep the undead from interrupting my incantations so that I may bring this wall down.', 14, 0, 100, 0, 0, 16608, 0, 0, 'JAINA -  IceWALL_2');
INSERT INTO creature_text VALUES (36955, 121, 0, 'He\'s toying with us! I\'ll show him what happens to ice when it meets fire.', 14, 0, 100, 0, 0, 16609, 0, 0, 'JAINA -  IceWALL_3');
INSERT INTO creature_text VALUES (36955, 122, 0, 'Your barriers can\'t hold us back much longer, monster! I will shatter them all! ', 14, 0, 100, 0, 0, 16610, 0, 0, 'JAINA -  IceWALL_4');
INSERT INTO creature_text VALUES (36955, 123, 0, 'There\'s an opening up ahead. GO NOW!', 14, 0, 100, 0, 0, 16645, 0, 0, 'JAINA -  IceWALL_4_broken_after');
INSERT INTO creature_text VALUES (36955, 124, 0, 'It... It\'s a dead end. We have no choice but to fight. Steal yourselves, heroes, for this is our last stand!', 14, 0, 100, 0, 0, 16647, 0, 0, 'JAINA -  Sem Saida');
INSERT INTO creature_text VALUES (36955, 127, 0, 'Forgive me heroes, I should have listened to Uther. I ... I had to see for myself, to look into his eyes one last time ... I am sorry.', 14, 0, 100, 0, 0, 16648, 0, 0, 'JAINA -  FINAL');
INSERT INTO creature_text VALUES (36955, 128, 0, 'We now know what must be done. I will deliver this news to King Varian and Highlord Fordring.', 14, 0, 100, 0, 0, 16649, 0, 0, 'JAINA -  FINAL 2');
INSERT INTO creature_text VALUES (30344, 125, 0, 'FIRE! FIRE!', 14, 0, 100, 0, 0, 16721, 0, 0, 'Transport_ally -  FIRE!');
INSERT INTO creature_text VALUES (30344, 126, 0, 'Quickly, climb adoard! We mustn\'t tarry here! There\'s no telling when this whole mountainside will collapse.', 14, 0, 100, 0, 0, 16722, 0, 0, 'Transport_ally -  ONBOARD');
INSERT INTO creature_text VALUES (37221, 1, 0, 'The chill of this place... Brr... I can feel my blood freezing.', 14, 0, 100, 0, 0, 16631, 0, 0, 'Jaina SAY_JAINA_INTRO_1');
INSERT INTO creature_text VALUES (37221, 2, 0, 'What is that? Up ahead! Could it be... ? Heroes at my side!', 14, 0, 100, 0, 0, 16632, 0, 0, 'Jaina SAY_JAINA_INTRO_2');
INSERT INTO creature_text VALUES (37221, 3, 0, 'Frostmourne! The blade that destroyed our kingdom...', 14, 0, 100, 0, 0, 16633, 0, 0, 'Jaina SAY_JAINA_INTRO_3');
INSERT INTO creature_text VALUES (37221, 4, 0, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', 14, 0, 100, 0, 0, 16634, 0, 0, 'Jaina SAY_JAINA_INTRO_4');
INSERT INTO creature_text VALUES (37221, 6, 0, 'Uther! Dear Uther! ... I... I\'m so sorry.', 12, 0, 100, 0, 0, 16635, 0, 0, 'Jaina SAY_JAINA_INTRO_5');
INSERT INTO creature_text VALUES (37221, 8, 0, 'Arthas is here? Maybe I...', 12, 0, 100, 0, 0, 16636, 0, 0, 'Jaina SAY_JAINA_INTRO_6');
INSERT INTO creature_text VALUES (37221, 10, 0, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', 12, 0, 100, 0, 0, 16637, 0, 0, 'Jaina SAY_JAINA_INTRO_7');
INSERT INTO creature_text VALUES (37221, 12, 0, 'Tell me how, Uther? How do I destroy my prince? My...', 12, 0, 100, 0, 0, 16638, 0, 0, 'Jaina SAY_JAINA_INTRO_8');
INSERT INTO creature_text VALUES (37221, 14, 0, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', 12, 0, 100, 0, 0, 16639, 0, 0, 'Jaina SAY_JAINA_INTRO_9');
INSERT INTO creature_text VALUES (37221, 17, 0, 'Who could bear such a burden?', 12, 0, 100, 0, 0, 16640, 0, 0, 'Jaina SAY_JAINA_INTRO_10');
INSERT INTO creature_text VALUES (37221, 19, 0, 'Then maybe there is still hope...', 12, 0, 100, 0, 0, 16641, 0, 0, 'Jaina SAY_JAINA_INTRO_11');
INSERT INTO creature_text VALUES (37221, 42, 0, 'You won\'t deny me this Arthas! I must know! I must find out!', 14, 0, 100, 0, 0, 16642, 0, 0, 'Jaina SAY_JAINA_INTRO_END');
INSERT INTO creature_text VALUES (37223, 21, 0, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', 14, 0, 100, 0, 0, 17049, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_1');
INSERT INTO creature_text VALUES (37223, 22, 0, 'Standing this close to the blade that ended my life... The pain... It is renewed.', 14, 0, 100, 0, 0, 17050, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_2');
INSERT INTO creature_text VALUES (37223, 23, 0, 'I dare not touch it. Stand back! Stand back as I attempt to commune with the blade! Perhaps our salvation lies within...', 14, 0, 100, 0, 0, 17051, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_3');
INSERT INTO creature_text VALUES (37223, 25, 0, 'Uther...Uther the Lightbringer. How...', 12, 0, 100, 0, 0, 17052, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_4');
INSERT INTO creature_text VALUES (37223, 27, 0, 'The Lich King is here? Then my destiny shall be fulfilled today!', 12, 0, 100, 0, 0, 17053, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_5');
INSERT INTO creature_text VALUES (37223, 29, 0, 'There must be a way... ', 12, 0, 100, 0, 0, 17054, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_6');
INSERT INTO creature_text VALUES (37223, 31, 0, 'Who could bear such a burden?', 12, 0, 100, 0, 0, 17055, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_7');
INSERT INTO creature_text VALUES (37223, 34, 0, 'The Frozen Throne...', 12, 0, 100, 0, 0, 17056, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_8');
INSERT INTO creature_text VALUES (37223, 43, 0, 'You will not escape me that easily, Arthas! I will have my vengeance!', 14, 0, 100, 0, 0, 17057, 0, 0, 'Sylvanas SAY_SYLVANAS_INTRO_END');
INSERT INTO creature_text VALUES (37225, 5, 0, 'Jaina! Could it truly be you?', 14, 0, 100, 0, 0, 16666, 0, 0, 'Uther SAY_UTHER_INTRO_A2_1');
INSERT INTO creature_text VALUES (37225, 7, 0, 'Jaina you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly!', 12, 0, 100, 0, 0, 16667, 0, 0, 'Uther SAY_UTHER_INTRO_A2_2');
INSERT INTO creature_text VALUES (37225, 9, 0, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', 12, 0, 100, 0, 0, 16668, 0, 0, 'Uther SAY_UTHER_INTRO_A2_3');
INSERT INTO creature_text VALUES (37225, 11, 0, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', 12, 0, 100, 0, 0, 16669, 0, 0, 'Uther SAY_UTHER_INTRO_A2_4');
INSERT INTO creature_text VALUES (37225, 13, 0, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way.', 12, 0, 100, 0, 0, 16670, 0, 0, 'Uther SAY_UTHER_INTRO_A2_5');
INSERT INTO creature_text VALUES (37225, 15, 0, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', 12, 0, 100, 0, 0, 16671, 0, 0, 'Uther SAY_UTHER_INTRO_A2_6');
INSERT INTO creature_text VALUES (37225, 16, 0, 'A grand sacrifice by a noble soul...', 12, 0, 100, 0, 0, 16672, 0, 0, 'Uther SAY_UTHER_INTRO_A2_7');
INSERT INTO creature_text VALUES (37225, 18, 0, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 12, 0, 100, 0, 0, 16673, 0, 0, 'Uther SAY_UTHER_INTRO_A2_8');
INSERT INTO creature_text VALUES (37225, 20, 0, 'No, Jaina! Aargh! He... He is coming! You... You must...', 12, 0, 100, 0, 0, 16674, 0, 0, 'Uther SAY_UTHER_INTRO_A2_9');
INSERT INTO creature_text VALUES (37225, 24, 0, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', 12, 0, 100, 0, 0, 16659, 0, 0, 'Uther SAY_UTHER_INTRO_H2_1');
INSERT INTO creature_text VALUES (37225, 26, 0, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', 12, 0, 100, 0, 0, 16660, 0, 0, 'Uther SAY_UTHER_INTRO_H2_2');
INSERT INTO creature_text VALUES (37225, 28, 0, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', 12, 0, 100, 0, 0, 16661, 0, 0, 'Uther SAY_UTHER_INTRO_H2_3');
INSERT INTO creature_text VALUES (37225, 30, 0, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', 12, 0, 100, 0, 0, 16662, 0, 0, 'Uther SAY_UTHER_INTRO_H2_4');
INSERT INTO creature_text VALUES (37225, 32, 0, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 12, 0, 100, 0, 0, 16663, 0, 0, 'Uther SAY_UTHER_INTRO_H2_5');
INSERT INTO creature_text VALUES (37225, 33, 0, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', 12, 0, 100, 0, 0, 16664, 0, 0, 'Uther SAY_UTHER_INTRO_H2_6');
INSERT INTO creature_text VALUES (37225, 35, 0, 'I... Aargh... He... He is coming... You... You must...', 12, 0, 100, 0, 0, 16665, 0, 0, 'Uther SAY_UTHER_INTRO_H2_7');
INSERT INTO creature_text VALUES (37226, 36, 0, 'SILENCE, PALADIN!', 14, 0, 100, 0, 0, 17225, 0, 0, 'Lich King SAY_LK_INTRO_1');
INSERT INTO creature_text VALUES (37226, 37, 0, 'So you wish to commune with the dead? You shall have your wish.', 14, 0, 100, 0, 0, 17226, 0, 0, 'Lich King SAY_LK_INTRO_2');
INSERT INTO creature_text VALUES (37226, 38, 0, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', 14, 0, 100, 0, 0, 17227, 0, 0, 'Lich King SAY_LK_INTRO_3');
INSERT INTO creature_text VALUES (37554, 102, 0, 'He\'s... too powerful. Heroes, quickly... come to me! We must leave this place at once! I will do that. I can hold him in place while we flee.', 14, 0, 100, 0, 0, 17058, 0, 0, 'SYLVANAS -  Leave the place');
INSERT INTO creature_text VALUES (37554, 109, 0, 'No wall can hold the Banshee Queen. Keep the undead at bay, heroes. I will tear this barrier down!', 14, 0, 100, 0, 0, 17029, 0, 0, 'SYLVANAS -  IceWALL_1');
INSERT INTO creature_text VALUES (37554, 110, 0, 'Another barrier? Stand strong champions. I will bring the wall down.', 14, 0, 100, 0, 0, 17030, 0, 0, 'SYLVANAS -  IceWALL_2');
INSERT INTO creature_text VALUES (37554, 111, 0, 'I grow tired of these games, Arthas! Your wall can\'t stop me!', 14, 0, 100, 0, 0, 17031, 0, 0, 'SYLVANAS -  IceWALL_3');
INSERT INTO creature_text VALUES (37554, 112, 0, 'You wan\'t impede our escape. Fend! Keep the undead of me while I bring this barrier down.', 14, 0, 100, 0, 0, 17032, 0, 0, 'SYLVANAS -  IceWALL_4');
INSERT INTO creature_text VALUES (37554, 113, 0, 'There\'s an opening up ahead. GO NOW!', 14, 0, 100, 0, 0, 17059, 0, 0, 'SYLVANAS -  IceWALL_4_broken_after');
INSERT INTO creature_text VALUES (37554, 114, 0, 'BLASTED DEAD END! So this is how it ends. Propare yourselves, heroes, for today we make our final stand!', 14, 0, 100, 0, 0, 17061, 0, 0, 'SYLVANAS -  Sem Saida');
INSERT INTO creature_text VALUES (37554, 118, 0, 'We are safe... for now. His strength has increased ten-fold since our last battle. It will take a mighty army to destroy the Lich King. An army greater then even the Horde can route.', 14, 0, 100, 0, 0, 17062, 0, 0, 'SYLVANAS -  FINAL');
INSERT INTO creature_text VALUES (30824, 116, 0, 'FIRE! FIRE!', 14, 0, 100, 0, 0, 16732, 0, 0, 'Transport_horda -  FIRE!');
INSERT INTO creature_text VALUES (30824, 117, 0, 'Get on board, now! This whole mountainside could collapse at any moment.', 14, 0, 100, 0, 0, 16733, 0, 0, 'Transport_horda -  ONBOARD');
INSERT INTO creature_text VALUES (38112, 39, 0, 'As you wish, my lord.', 14, 0, 100, 0, 0, 16717, 0, 0, 'Falric SAY_FALRIC_INTRO_1');
INSERT INTO creature_text VALUES (38112, 41, 0, 'Soldiers of Lordaeron, rise to meet your master\'s call!', 14, 0, 100, 0, 0, 16714, 0, 0, 'Falric SAY_FALRIC_INTRO_2');
INSERT INTO creature_text VALUES (38112, 50, 0, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', 14, 0, 100, 0, 0, 16710, 0, 0, 'Falric SAY_AGGRO');
INSERT INTO creature_text VALUES (38112, 51, 0, 'Sniveling maggot!', 14, 0, 100, 0, 0, 16711, 0, 0, 'Falric SAY_SLAY_1');
INSERT INTO creature_text VALUES (38112, 52, 0, 'The children of Stratholme fought with more ferocity!', 14, 0, 100, 0, 0, 16712, 0, 0, 'Falric SAY_SLAY_2');
INSERT INTO creature_text VALUES (38112, 53, 0, 'Marwyn, finish them...', 14, 0, 100, 0, 0, 16713, 0, 0, 'Falric SAY_DEATH');
INSERT INTO creature_text VALUES (38112, 54, 0, 'Despair... so delicious...', 14, 0, 100, 0, 0, 16715, 0, 0, 'Falric SAY_IMPENDING_DESPAIR');
INSERT INTO creature_text VALUES (38112, 55, 0, 'Fear... so exhilarating...', 14, 0, 100, 0, 0, 16716, 0, 0, 'Falric SAY_DEFILING_HORROR');
INSERT INTO creature_text VALUES (38113, 40, 0, 'As you wish, my lord.', 14, 0, 100, 0, 0, 16741, 0, 0, 'Marwyn SAY_MARWYN_INTRO_1');
INSERT INTO creature_text VALUES (38113, 60, 0, 'Death is all that you will find here!', 14, 0, 100, 0, 0, 16734, 0, 0, 'Marwyn SAY_AGGRO');
INSERT INTO creature_text VALUES (38113, 61, 0, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', 14, 0, 100, 0, 0, 16735, 0, 0, 'Marwyn SAY_SLAY_1');
INSERT INTO creature_text VALUES (38113, 62, 0, 'Choke on your suffering!', 14, 0, 100, 0, 0, 16736, 0, 0, 'Marwyn SAY_SLAY_2');
INSERT INTO creature_text VALUES (38113, 63, 0, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', 14, 0, 100, 0, 0, 16737, 0, 0, 'Marwyn SAY_DEATH');
INSERT INTO creature_text VALUES (38113, 64, 0, 'Your flesh has decayed before your very eyes!', 14, 0, 100, 0, 0, 16739, 0, 0, 'Marwyn SAY_CORRUPTED_FLESH_1');
INSERT INTO creature_text VALUES (38113, 65, 0, 'Waste away into nothingness!', 14, 0, 100, 0, 0, 16740, 0, 0, 'Marwyn SAY_CORRUPTED_FLESH_2');
INSERT INTO creature_text VALUES (37225, 200, 0, 'Halt! Do not carry that blade any further!', 14, 0, 100, 5, 0, 16675, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 201, 0, 'Quel\'Delar leaps to life in the presence of Frostmourne!', 41, 0, 100, 0, 0, 0, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 202, 0, 'Do you realise what you have done?', 14, 0, 100, 5, 0, 16676, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 203, 0, 'Quel\'Delar prepares to attack!', 41, 0, 100, 0, 0, 0, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 204, 0, 'You have forged this blade from saronite, the very blood of an old god! The power of the Lich King calls to this weapon!', 12, 0, 100, 1, 0, 16677, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 205, 0, 'Each moment you tarry here Quel\'Delar drinks in the evil of this place!', 12, 0, 100, 1, 0, 16678, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 206, 0, 'There is only one way to cleanse this sword, make haste for the sunwell, and emerse the blade in its waters!', 12, 0, 100, 1, 0, 16679, 0, 0, 'Uther Quel\'Delar');
INSERT INTO creature_text VALUES (37225, 207, 0, 'I can resist Frostmourne\'s call no more.', 12, 0, 100, 1, 0, 16680, 0, 0, 'Uther Quel\'Delar');


-- Missing Quel'Delar from DB.

-- Sunreaver agent.
UPDATE creature_template SET unit_flags=0 WHERE entry=36776;

-- Return to Caladis Brightspear (24454)
UPDATE smart_scripts SET action_param1=3664200 WHERE entryorguid=36624 AND source_type=0 AND action_type=80 AND action_param1=3662400;

-- The Halls of Reflection (24480)
-- The Halls of Reflection (24561)
REPLACE INTO areatrigger_scripts VALUES(5632, 'at_hor_battered_hilt_start');
REPLACE INTO areatrigger_scripts VALUES(5660, 'at_hor_battered_hilt_throw');
DELETE FROM spell_script_names WHERE spell_id IN(73036, -73036, 73035, -73035, 70720, -70720, 70719, -70719);
DELETE FROM spell_scripts WHERE id IN(73036, -73036, 73035, -73035, 70720, -70720, 70719, -70719);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(73036, -73036, 73035, -73035, 70720, -70720, 70719, -70719) OR spell_effect IN(73036, -73036, 73035, -73035, 70720, -70720, 70719, -70719);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(73036, -73036, 73035, -73035, 70720, -70720, 70719, -70719);
REPLACE INTO spell_target_position VALUES(70719, 0, 668, 5300.53, 1987.80, 707.70, 3.89, 0);
INSERT INTO `conditions` VALUES (13, 1, 73035, 0, 0, 31, 0, 3, 37704, 0, 0, 0, 0, '', 'Essence of the Captured (Battered Hilt, Quel''Delar, Halls of Reflections HoR, Uther)');
DELETE FROM spell_script_names WHERE spell_id IN(69966, 70698, 70700, -69966, -70698, -70700);
DELETE FROM spell_scripts WHERE id IN(69966, 70698, 70700, -69966, -70698, -70700);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69966, 70698, 70700, -69966, -70698, -70700) OR spell_effect IN(69966, 70698, 70700, -69966, -70698, -70700);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(69966, 70698, 70700, -69966, -70698, -70700);
REPLACE INTO spell_target_position VALUES(70700, 0, 668, 5296.53, 1992.97, 712.70, 3.98, 0);
REPLACE INTO spell_target_position VALUES(69966, 0, 668, 5296.53, 1992.97, 712.70, 3.98, 0);
UPDATE creature_template SET modelid1=30547, modelid2=0, speed_run=2.0, unit_flags=256+512, lootid=37158, InhabitType=4, AIName='SmartAI', ScriptName='', flags_extra=0 WHERE entry=37158;
-- REPLACE INTO creature_loot_template VALUES(37158, 50254, -100, 1, 0, 1, 1);
REPLACE INTO creature_template_addon VALUES(37158, 0, 0, 50331648, 1, 0, '');
DELETE FROM smart_scripts WHERE entryorguid IN(37158) AND source_type=0;
INSERT INTO `smart_scripts` VALUES (37158, 0, 0, 0, 0, 0, 100, 0, 1000, 3000, 6000, 8000, 11, 29426, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Heroic Strike');
INSERT INTO `smart_scripts` VALUES (37158, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 6000, 9000, 11, 16856, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mortal Strike');
INSERT INTO `smart_scripts` VALUES (37158, 0, 2, 0, 0, 0, 100, 0, 7000, 9000, 15000, 20000, 11, 67541, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bladestorm');
INSERT INTO `smart_scripts` VALUES (37158, 0, 3, 0, 58, 0, 100, 0, 0, 0, 0, 0, 34, 6, 5, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Set inst data on finish movement');
INSERT INTO `smart_scripts` VALUES (37158, 0, 4, 0, 37, 0, 100, 0, 0, 0, 0, 0, 11, 70300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast aura on AI init');
INSERT INTO `smart_scripts` VALUES (37158, 0, 5, 0, 1, 0, 100, 1, 2000, 2000, 0, 0, 53, 1, 3715800, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Start movement');
DELETE FROM waypoints WHERE entry=3715800;
INSERT INTO waypoints VALUES (3715800, 1, 5288.35, 2001.96, 715.839, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 2, 5287.78, 2012.3, 718.648, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 3, 5293.66, 2022.44, 721.733, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 4, 5304.64, 2024.97, 724.804, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 5, 5322.97, 2022.09, 728.212, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 6, 5330.45, 2013.93, 729.987, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 7, 5329.63, 2000.81, 731.98, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 8, 5318.02, 1988.14, 733.196, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 9, 5296.81, 1986.27, 732.414, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 10, 5288.66, 1999.81, 733.286, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 11, 5291.78, 2015.84, 732.737, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 12, 5306.19, 2029.22, 732.899, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 13, 5327.48, 2022, 730.3, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 14, 5331.94, 2004.94, 726.963, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 15, 5325.13, 1990.92, 722.842, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 16, 5313.1, 1984.14, 719.322, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 17, 5303.81, 1984.66, 717.071, 'Quel''Delar in HoR');
INSERT INTO waypoints VALUES (3715800, 18, 5296.86, 1993.15, 716.888, 'Quel''Delar in HoR');



-- Thalorien Dawnseeker (24535)
-- Thalorien Dawnseeker (24563)
DELETE FROM spell_area WHERE spell=70193;
INSERT INTO spell_area VALUES(70193, 4092, 24535, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4092, 24563, 0, 0, 0, 2, 1, 10, 0);
-- npc Thalorien Dawnseeker's Remains (37552)
UPDATE creature_template SET `exp`=2, minlevel=80, maxlevel=80, gossip_menu_id=37552, AIName='SmartAI', ScriptName='' WHERE entry=37552;
REPLACE INTO creature_template_addon VALUES(37552, 0, 0, 7, 1, 0, '');
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37552));
DELETE FROM creature WHERE id IN(37552);
INSERT INTO `creature` VALUES (NULL, 37552, 530, 0, 0, 1, 2048, 0, 0, 11781.6, -7068.71, 24.9312, 3.10074, 300, 0, 0, 123, 180, 0, 1, 256+512, 32, 0);
REPLACE INTO gossip_menu VALUES(37552, 15155, 0);
DELETE FROM gossip_menu_option WHERE menu_id=37552 AND option_text LIKE '%Examine the remains%';
REPLACE INTO gossip_menu_option VALUES(37552, 0, 0, 'Examine the remains.', 0, 1, 1, 0, 0, 0, 0, '', 0, 0);
DELETE FROM smart_scripts WHERE entryorguid IN(37552) AND source_type=0;
INSERT INTO `smart_scripts` VALUES (37552, 0, 0, 1, 62, 0, 100, 0, 37552, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'close gossip menu');
INSERT INTO `smart_scripts` VALUES (37552, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 37205, 100, 0, 0, 0, 0, 0, 'call DoAction on nearby Thalorien');
INSERT INTO `smart_scripts` VALUES (37552, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'remove gossip flag');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=37552;
INSERT INTO conditions VALUES(15, 37552, 0, 0, 0, 9, 0, 24535, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37552, 0, 0, 1, 9, 0, 24563, 0, 0, 0, 0, 0, '', '');
-- go Aura Trap Yellow Tall (scale 2.00) (185579)
DELETE FROM gameobject WHERE id=185579 AND `map`=530 AND phaseMask=2048;
INSERT INTO `gameobject` VALUES (NULL, 185579, 530, 0, 0, 1, 2048, 11781.6, -7068.48, 24.9352, 3.43394, 0, 0, 0.989336, -0.145654, 300, 0, 1, 0);
-- npc Thalorien Dawnseeker (37205)
UPDATE creature_template SET `exp`=2, faction=42, minlevel=80, maxlevel=80, AIName='', ScriptName='npc_bh_thalorien_dawnseeker' WHERE entry=37205;
REPLACE INTO creature_template_addon VALUES(37205, 0, 0, 0, 1, 0, '');
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37205));
DELETE FROM creature WHERE id IN(37205);
INSERT INTO `creature` VALUES (NULL, 37205, 530, 0, 0, 1, 2048, 0, 1, 11787.2, -7070.58, 25.8613, 5.92758, 300, 0, 0, 144, 180, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=37205;
INSERT INTO creature_text VALUES (37205, 0, 0, 'We must defend the sunwell from the enemy at all costs.', 12, 0, 100, 1, 0, 16769, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 1, 0, 'I am ordering you to withdraw to the sunwell proper to help prepare the defences.', 12, 0, 100, 25, 0, 16770, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 2, 0, 'I will make my stand here and buy you as much as time as I am able. Use it well, and make our prince proud.', 12, 0, 100, 1, 0, 16771, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 3, 0, 'It has been a great honour to fight beside you in defence of our land, and our people.', 12, 0, 100, 2, 0, 16772, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 4, 0, 'You, stranger! You are not one of my soldiers! Will you stay and stand with me to face the enemy?', 12, 0, 100, 0, 0, 16773, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 5, 0, 'Listen well, scourge defilers! None of you will reach the sunwell, so long as I stand!', 14, 0, 100, 1, 0, 16774, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 6, 0, 'I... I wasn''t meant to survive this attack!', 12, 0, 100, 1, 0, 16775, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 7, 0, 'Why has this happened? Why have you come here?', 12, 0, 100, 1, 0, 16776, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 8, 0, 'It''s Quel''Delar! You possess the sword!', 12, 0, 100, 1, 0, 16777, 0, 0, 'Thalorien Dawnseeker');
INSERT INTO creature_text VALUES (37205, 9, 0, 'I don''t know how, but the blade has chosen you to be its new wielder. Take it, with my blessing, and wield it against the scourge as I once did!', 12, 0, 100, 1, 0, 16778, 0, 0, 'Thalorien Dawnseeker');



-- The Purification of Quel'Delar (24553)
-- The Purification of Quel'Delar (24564)
-- The Purification of Quel'Delar (24594)
-- The Purification of Quel'Delar (24595)
-- The Purification of Quel'Delar (24596)
-- The Purification of Quel'Delar (24598)

-- For now, player must be in raid.
UPDATE quest_template SET Flags=192 WHERE id IN(24553, 24564, 24594, 24595, 24596, 24598);

DELETE FROM disables WHERE sourceType=1 AND entry IN(SELECT Id FROM quest_template WHERE LogTitle='The purification of Quel''Delar');
INSERT INTO disables SELECT 1, Id, 0, '', '', 'Invalid version of quest The purification of Quel''Delar' FROM quest_template WHERE LogTitle='The purification of Quel''Delar' AND Id NOT IN(24553,24564,24594,24595,24596,24598);
DELETE FROM spell_area WHERE spell=70193 AND area=4075;
INSERT INTO spell_area VALUES(70193, 4075, 24553, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4075, 24564, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4075, 24594, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4075, 24595, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4075, 24596, 0, 0, 0, 2, 1, 10, 0);
INSERT INTO spell_area VALUES(70193, 4075, 24598, 0, 0, 0, 2, 1, 10, 0);
UPDATE creature_template SET minlevel=80, maxlevel=80, npcflag=1, gossip_menu_id=37523, AIname='SmartAI' WHERE entry=37523;
DELETE FROM smart_scripts WHERE entryorguid IN(37523) AND source_type=0;
INSERT INTO `smart_scripts` VALUES (37523, 0, 0, 1, 62, 0, 100, 0, 37523, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'close gossip menu');
INSERT INTO `smart_scripts` VALUES (37523, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 70746, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'invoker cast teleport spell');
DELETE FROM spell_target_position WHERE id=70746;
INSERT INTO spell_target_position VALUES(70746, 0, 580, 1783.02, 659.59, 71.20, 2.20, 0);
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37523));
DELETE FROM creature WHERE id IN(37523);
INSERT INTO `creature` VALUES (NULL, 37523, 530, 0, 0, 1, 1, 0, 0, 12556.9, -6770.12, 15.0919, 6.25983, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37523, 530, 0, 0, 1, 1, 0, 0, 12556.7, -6779.32, 15.0386, 0.000207424, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
DELETE FROM gossip_menu WHERE entry=37523 AND text_id=15240;
INSERT INTO gossip_menu VALUES(37523, 15240, 0);
DELETE FROM gossip_menu_option WHERE menu_id=37523 AND option_text LIKE '%I''m ready to enter the Sunwell%';
REPLACE INTO gossip_menu_option VALUES(37523, 0, 0, 'I''m ready to enter the Sunwell.', 0, 1, 1, 0, 0, 0, 0, '', 0, 0);
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(14,15) AND SourceGroup=37523;
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 0, 9, 0, 24553, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 1, 9, 0, 24564, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 2, 9, 0, 24594, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 3, 9, 0, 24595, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 4, 9, 0, 24596, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(14, 37523, 15240, 0, 5, 9, 0, 24598, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 0, 9, 0, 24553, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 1, 9, 0, 24564, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 2, 9, 0, 24594, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 3, 9, 0, 24595, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 4, 9, 0, 24596, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(15, 37523, 0, 0, 5, 9, 0, 24598, 0, 0, 0, 0, 0, '', '');
UPDATE item_template SET ScriptName='' WHERE entry IN(49879, 49889);
REPLACE INTO spell_script_names VALUES(70548, 'spell_bh_cleanse_quel_delar');
REPLACE INTO spell_script_names VALUES(70477, 'spell_bh_cleanse_quel_delar');
UPDATE gameobject_template SET flags=16 WHERE entry=201794;
DELETE FROM gameobject WHERE id=201794;
DELETE FROM event_scripts WHERE id IN(22833, 22854);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=70466;
INSERT INTO `conditions` VALUES (13, 1, 70466, 0, 0, 31, 0, 3, 37000, 0, 0, 0, 0, '', 'Sunwell Light Ray (The Purification of Quel''Delar)');
DELETE FROM waypoint_data WHERE id IN(3776300, 3776400, 3776500);
INSERT INTO `waypoint_data` VALUES (3776300, 1, 1671.68, 618.795, 28.0503, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3776300, 2, 1679.77, 621.26, 28.1748, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3776400, 1, 1674.75, 616.184, 28.0504, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3776400, 2, 1680.19, 618.883, 28.2728, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3776500, 1, 1681.22, 612.877, 28.4345, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3776500, 2, 1683.17, 614.606, 28.2502, 0, 0, 0, 0, 100, 0);
-- go Portal to Dalaran (195682)
DELETE FROM gameobject WHERE id=195682 AND `map`=580;
INSERT INTO `gameobject` VALUES (NULL, 195682, 580, 0, 0, 1, 2048, 1666.13, 662.584, 28.0504, 5.44551, 0, 0, 0.916432, -0.400191, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (NULL, 195682, 580, 0, 0, 1, 2048, 1732.62, 594.658, 28.0503, 2.27643, 0, 0, 0.907888, 0.419214, 300, 0, 1, 0);
-- go TEMP Sunwell (201796)
DELETE FROM gameobject WHERE id IN(201796, 300246) AND `map`=580;
INSERT INTO `gameobject` VALUES (NULL, 201796, 580, 0, 0, 1, 2048, 1689.47, 622.197, 27.8568, 3.69591, 0, 0, 0.961836, -0.273625, 300, 0, 1, 0);
-- npc Sunwell Honor Guard (37781)
UPDATE creature_template SET IconName='', minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=37781;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37781));
DELETE FROM creature WHERE id IN(37781);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1793.8, 661.515, 71.1943, 2.194, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1776.09, 652.853, 71.1943, 2.17044, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1769.97, 650.558, 71.1914, 1.95623, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1764.82, 663.761, 71.1902, 0.638909, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1760.28, 670.492, 71.1902, 0.674254, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1748.59, 683.721, 71.1902, 0.623205, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1742.9, 688.146, 71.1902, 1.0591, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1727.47, 696.601, 71.1902, 1.10622, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1718.79, 698.847, 71.1902, 1.34184, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1704.8, 720.264, 71.058, 4.78581, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1727.06, 716.86, 71.1904, 4.48343, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1748.77, 709.204, 71.1904, 4.24389, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1767.5, 697.132, 71.1904, 3.91795, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1781.84, 680.202, 71.1904, 3.67448, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1683.62, 624.152, 27.3538, 3.42313, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1688.26, 616.497, 27.3452, 3.95328, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1672.48, 631.053, 28.0503, 4.5541, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1674.14, 638.984, 28.0503, 4.49519, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1665.48, 640.896, 28.0503, 4.49519, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1663.75, 633.058, 28.0503, 4.49519, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1662.86, 658.458, 28.0503, 5.59866, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1670.23, 665.44, 28.0503, 5.41408, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1727.98, 591.396, 28.0505, 2.23714, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1735.87, 599.171, 28.0505, 2.41386, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1632.77, 627.612, 32.9608, 3.26994, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1635.69, 610.968, 33.3212, 3.45451, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1638.94, 602.943, 33.3212, 3.5252, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1649.73, 588.163, 33.3212, 3.86292, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1654.74, 583.131, 33.3212, 4.03963, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1669.38, 573.631, 33.3212, 4.2242, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1677.1, 570.175, 33.3212, 4.29488, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 37781, 580, 0, 0, 1, 2048, 0, 0, 1614.89, 598.706, 33.3211, 0.367885, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=37781;
INSERT INTO creature_text VALUES (37781, 0, 0, 'Can that really be Quel''Delar?', 12, 0, 100, 1, 0, 0, 0, 0, 'Sunwell Honor Guard');
-- npc Sunwell Guardian (36991)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=36991;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36991));
DELETE FROM creature WHERE id IN(36991);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1744.84, 621.776, 28.0503, 3.00868, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1694.93, 674.09, 28.0503, 4.76796, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1653.75, 634.033, 28.085, 6.10314, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1704.09, 583.276, 28.182, 1.75203, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1658.87, 545.124, 33.3213, 1.16691, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1640.45, 558.392, 33.3213, 0.856672, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1625.67, 577.498, 33.3213, 0.628905, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 36991, 580, 0, 0, 1, 2048, 0, 0, 1619.75, 634.382, 33.486, 4.90934, 300, 0, 0, 84, 0, 0, 0, 0, 0, 0);
-- npc Blood Elf Pilgrim (38047)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=38047;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38047));
DELETE FROM creature WHERE id IN(38047);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1704.05, 656.947, 28.0503, 4.53049, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1701.32, 657.371, 28.0503, 4.61296, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1707.11, 656.197, 28.0503, 4.4873, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1706.31, 658.903, 28.0503, 4.53049, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1702.88, 659.398, 28.0503, 4.55014, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1699.66, 659.52, 28.0503, 4.68366, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1682.23, 633.38, 27.638, 6.01488, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1683.64, 636.337, 27.6529, 5.82246, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1685.62, 638.985, 27.6363, 5.59078, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1700.1, 610.616, 27.6777, 1.69127, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1702.86, 611.087, 27.6827, 1.85227, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1705.7, 612.287, 27.6113, 1.99757, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1716.75, 632.675, 27.7991, 3.43485, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1667.75, 625.38, 28.0504, 5.73998, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1669.28, 624.177, 28.0504, 2.57876, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1690.91, 605.88, 28.3581, 3.61548, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1688.99, 604.902, 28.0608, 0.489597, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1692.36, 582.342, 29.06, 0.230404, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 38047, 580, 0, 0, 1, 2048, 0, 0, 1695.1, 583.061, 28.2018, 3.56442, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
INSERT INTO creature_addon (SELECT guid, 0, 0, 8, 1, 0, '' FROM creature WHERE id=38047 ORDER BY guid ASC LIMIT 0,13);
INSERT INTO creature_addon (SELECT guid, 0, 0, 0, 1, 378, '' FROM creature WHERE id=38047 ORDER BY guid ASC LIMIT 13, 6);
-- npc Sunwell Caster Bunny (37746)
UPDATE creature_template SET modelid1=11686, modelid2=0, scale=1, minlevel=80, maxlevel=80, unit_flags=33554432, InhabitType=4, AIName='NullCreatureAI', ScriptName='', flags_extra=0 WHERE entry=37746;
REPLACE INTO creature_template_addon VALUES(37746, 0, 0, 50331648, 1, 0, '46822 70474');
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37746));
DELETE FROM creature WHERE id IN(37746);
INSERT INTO `creature` VALUES (NULL, 37746, 580, 0, 0, 1, 2048, 0, 0, 1698.87, 628.417, 28.1989, 3.6959, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);
-- npc Sunwell Visual Bunny (37000)
UPDATE creature_template SET modelid1=11686, modelid2=0, unit_flags=33554432, InhabitType=4, AIName='NullCreatureAI', ScriptName='', flags_extra=0 WHERE entry=37000;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37000));
DELETE FROM creature WHERE id IN(37000);
-- Grand Magister Rommath (37763)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='', ScriptName='npc_grand_magister_rommath' WHERE entry=37763;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37763));
DELETE FROM creature WHERE id IN(37763);
INSERT INTO `creature` VALUES (NULL, 37763, 580, 0, 0, 1, 2048, 0, 0, 1662.56, 622.758, 28.0502, 4.8897, 300, 0, 0, 8200, 1200, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=37763;
INSERT INTO creature_text VALUES (37763, 0, 0, 'Look at it, Lor''themar. It is certainly Quel''Delar.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
INSERT INTO creature_text VALUES (37763, 1, 0, 'The regent speaks truly, $N. Thalorien''s sacrifice could not prevent the fall of this very Sunwell.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
INSERT INTO creature_text VALUES (37763, 2, 0, 'When you found the sword, it was broken and abandoned, much like Silvermoon after Kael''thas''s betrayal.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
INSERT INTO creature_text VALUES (37763, 3, 0, 'Let Quel''Delar be a sign that we will never give up, that we will face any enemy without fear.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
INSERT INTO creature_text VALUES (37763, 4, 0, 'Reclaim the sword, $N, and bear it through that portal to Dalaran. Archmage Aethas Sunreaver will be waiting to congratulate you.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
INSERT INTO creature_text VALUES (37763, 5, 0, 'Reclaim the sword, $N, and bear it through that portal to Dalaran. Vereesa Windrunner will be waiting to congratulate you.', 12, 0, 100, 1, 0, 0, 0, 0, 'Grand Magister Rommath');
-- Chamberlain Galiros (38056)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=38056;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38056));
DELETE FROM creature WHERE id IN(38056);
INSERT INTO `creature` VALUES (NULL, 38056, 580, 0, 0, 1, 2048, 0, 0, 1671.49, 606.427, 28.0503, 3.79407, 300, 0, 0, 41, 60, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=38056;
INSERT INTO creature_text VALUES (38056, 0, 0, 'My lords and ladies, I present $N, bearer of Quel''Delar.', 14, 0, 100, 1, 0, 0, 0, 0, 'Chamberlain Galiros');
-- Lor'themar Theron (37764)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=37764;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37764));
DELETE FROM creature WHERE id IN(37764);
INSERT INTO `creature` VALUES (NULL, 37764, 580, 0, 0, 1, 2048, 0, 0, 1666.48, 620.999, 28.0504, 5.00359, 300, 0, 0, 16400, 1800, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=37764;
INSERT INTO creature_text VALUES (37764, 0, 0, 'We shall see.', 12, 0, 100, 1, 0, 0, 0, 0, 'Lor''themar Theron');
INSERT INTO creature_text VALUES (37764, 1, 0, 'It is indeed Quel''Delar. I had not thought I''d live to see the day when Thalorien Dawnseeker''s legendary sword would be restored to us.', 12, 0, 100, 1, 0, 0, 0, 0, 'Lor''themar Theron');
INSERT INTO creature_text VALUES (37764, 2, 0, 'You are a hero and an inspiration to the sin''dorei, $N, a symbol of our endurance in the face of tragedy and treachery.', 12, 0, 100, 1, 0, 0, 0, 0, 'Lor''themar Theron');
-- Captain Auric Sunchaser (37765)
UPDATE creature_template SET minlevel=80, maxlevel=80, unit_flags=0, AIName='NullCreatureAI', ScriptName='' WHERE entry=37765;
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37765));
DELETE FROM creature WHERE id IN(37765);
INSERT INTO `creature` VALUES (NULL, 37765, 580, 0, 0, 1, 2048, 0, 0, 1686.1, 607.186, 28.1281, 1.99552, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);
DELETE FROM creature_text WHERE entry=37765;
INSERT INTO creature_text VALUES (37765, 0, 0, 'Quel''Delar is not held in high esteem by the sin''dorei alone. It holds a place in the heart of all children of Silvermoon.', 12, 0, 100, 1, 0, 0, 0, 0, 'Captain Auric Sunchaser');
INSERT INTO creature_text VALUES (37765, 1, 0, 'This blade has been returned to us for a reason, my lords. Now is the time to rally behind the bearer of Quel''Delar and avenge the destruction of Silvermoon and the Sunwell.', 12, 0, 100, 1, 0, 0, 0, 0, 'Captain Auric Sunchaser');
