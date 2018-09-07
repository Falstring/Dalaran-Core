
-- Hitbox.
UPDATE creature_model_info SET bounding_radius=3.5, combat_reach=8 WHERE modelid=27035;

-- Portals.
DELETE FROM gameobject_template WHERE entry=193988;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (193988, 10, 1327, 'Twilight Portal', '', '', '', 35, 32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

-- Portal spawns.
DELETE FROM gameobject WHERE id=193988;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034768, 193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086, 0.911698, -20, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034769, 193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235, 0.932475, -20, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034770, 193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211, -0.654328, -20, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034771, 193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664, -0.984091, -20, 0, 1);

-- Trigger controller:
DELETE FROM creature WHERE guid=256901;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (256901, 22515, 615, 3, 1, 0, 0, 3249.02, 534.955, 58.9436, 1.6132, 300, 0, 0, 4121, 0, 0, 0, 0, 0);

-- Twilight Shift removes Twilight Torment from Vesperon.
DELETE FROM `spell_linked_spell` WHERE spell_trigger=57874;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (57874, -57935, 1, 'Twilight Shift removes Twilight Torment');

-- NPC_FLAME_TSUNAMI must not aggro players... it got broken with one of the latest updates.
UPDATE creature_template SET flags_extra=130 WHERE entry=30616;

-- Lava Strike
DELETE FROM spell_script_names WHERE spell_id IN(57578, 57591, 56911);
INSERT INTO spell_script_names VALUES(57578, "spell_sartharion_lava_strike");
INSERT INTO spell_script_names VALUES(57591, "spell_sartharion_lava_strike");

-- Gonna Go When the Volcano Blows (10 player) (2047)
DELETE FROM achievement_criteria_data WHERE criteria_id IN(7326);
DELETE FROM disables WHERE sourceType=4 AND entry IN(7326);
INSERT INTO achievement_criteria_data VALUES(7326, 18, 0, 0, "");
INSERT INTO achievement_criteria_data VALUES(7326, 12, 0, 0, "");

-- Gonna Go When the Volcano Blows (25 player) (2048)
DELETE FROM achievement_criteria_data WHERE criteria_id IN(7327);
DELETE FROM disables WHERE sourceType=4 AND entry IN(7327);
INSERT INTO achievement_criteria_data VALUES(7327, 18, 0, 0, "");
INSERT INTO achievement_criteria_data VALUES(7327, 12, 1, 0, "");