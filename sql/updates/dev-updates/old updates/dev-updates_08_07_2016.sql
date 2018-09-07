/* 
*/ 
-- -------------------------------------------
-- ELEMENTAL INVASION
-- -------------------------------------------

-- Cleanup
DELETE FROM `linked_respawn` WHERE `guid` IN(SELECT `guid` FROM `creature` WHERE `id` IN(14461, 14460, 14454, 14455, 14457, 14458, 14464, 14462));
DELETE FROM `creature_addon` WHERE `guid` IN(SELECT `guid` FROM `creature` WHERE `id` IN(14461, 14460, 14454, 14455, 14457, 14458, 14464, 14462));
DELETE FROM `creature_formations` WHERE `memberGUID` IN(SELECT `guid` FROM `creature` WHERE `id` IN(14461, 14460, 14454, 14455, 14457, 14458, 14464, 14462));
DELETE FROM `creature` WHERE `id` IN(14461, 14460, 14454, 14455, 14457, 14458, 14464, 14462);
DELETE FROM `gameobject` WHERE `id` IN(179666, 179667, 179665, 179664);


-- Blazing Invaders
SET @BARON :=14461;
SET @GUID :=24172;
SET @BLAZINV :=14460;
SET @GOFER :=179666;

-- Baron Charr (14461)
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID, @GUID*10, 0, 0, 4097, 0, '');

DELETE FROM `creature_formations` WHERE  `leaderGUID`=@GUID;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@GUID, @GUID, 0, 0, 2, 0, 0),
(@GUID, @GUID+1, 7, 45, 2, 0, 0),
(@GUID, @GUID+2, 7, 135, 2, 0, 0),
(@GUID, @GUID+3, 7, 225, 2, 0, 0),
(@GUID, @GUID+4, 7, 315, 2, 0, 0);

DELETE FROM `creature` WHERE `id` IN(@BARON,@BLAZINV);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(@GUID, @BARON, 1, 0, 0, 1, 1, 0, 0, -6997.41, -1373.95, -269.32, 1.90849, 300000, 0, 0, 14355, 0, 2, 0, 0, 0, 0),
(@GUID+1, @BLAZINV, 1, 0, 0, 1, 1, 0, 0, -6997.41, -1373.95, -269.32, 1.90849, 1000000, 0, 0, 2614, 0, 0, 0, 0, 0, 0),
(@GUID+2, @BLAZINV, 1, 0, 0, 1, 1, 0, 0, -6997.41, -1373.95, -269.32, 1.90849, 1000000, 0, 0, 2614, 0, 0, 0, 0, 0, 0),
(@GUID+3, @BLAZINV, 1, 0, 0, 1, 1, 0, 0, -6997.41, -1373.95, -269.32, 1.90849, 1000000, 0, 0, 2614, 0, 0, 0, 0, 0, 0),
(@GUID+4, @BLAZINV, 1, 0, 0, 1, 1, 0, 0, -6997.41, -1373.95, -269.32, 1.90849, 1000000, 0, 0, 2614, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=@BARON;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@BARON, 0, 0, 'Hear me, denizens of the Crater!  I come to burn this land of its impurity!', 14, 0, 100, 0, 0, 0, 9662, 2, 'Baron Charr Spawn'),
(@BARON, 1, 0, 'Where are the so-called heroes of this world?  Too frightened to come out and play?', 14, 0, 100, 0, 0, 9676, 0, 2, 'Baron Charr OOC'),
(@BARON, 2, 0, 'You have not seen the last of me fools!  All shall be consumed in the end!', 14, 0, 100, 0, 0, 0, 9661, 2, 'Baron Charr Death');

UPDATE `creature_template` SET `unit_class`=2, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1' WHERE `entry`=@BARON;

-- Baron Charr SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BARON;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BARON, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - On Respawn - Say Line 0'),
(@BARON, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - OOC - Say Line 1'),
(@BARON, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0,  1, 2, 0, 0, 0, 0, 0, 15, @GOFER, 1000, 0, 0, 0, 0, 0, 'Baron Charr - On Death - Say Line 2'),
(@BARON, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - On Death - Remove All Fire Elemental Rifts'),
(@BARON, 0, 4, 0, 0, 0, 100, 0, 3000, 6000, 8000, 11000, 11, 15285, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - IC - Cast Fireball Volley'),
(@BARON, 0, 5, 0, 0, 0, 100, 0, 0, 0, 10000, 16000, 11, 9574, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - IC - Cast Flame Buffet'),
(@BARON, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 14, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7115.23, -1303.52, -186.023, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 15, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7159.79, -1340.77, -184.387, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 16, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7172.53, -1282.03, -184.389, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 17, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7271.34, -1205.2, -241.216, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 18, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7305.77, -1314.89, -240.622, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 19, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7239.31, -1408.76, -232.555, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 20, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7207.49, -1452.04, -231.648, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 21, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7170.79, -1478.02, -265.446, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 22, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7132.25, -1435.83, -265.447, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 23, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7030.19, -1449.66, -262.58, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 24, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7019.3, -1269.13, -269.652, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 25, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7045.36, -1199.41, -267.884, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 26, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7106.72, -1120.15, -266.057, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 27, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7202.57, -1124.08, -266.719, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 28, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7074.14, -1420.95, -234.381, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift'),
(@BARON, 0, 29, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7109.12, -1481.67, -247.611, 0, 'Baron Charr - On Respawn - Summon Fire Elemental Rift');

-- Baron Charr WP Data
DELETE FROM `waypoint_data` WHERE `id`=@GUID*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@GUID*10, 1, -6999.11, -1358.55, -270.021, 0, 0, 0, 0, 100, 0),
(@GUID*10, 2, -7003.22, -1335.53, -270.783, 0, 0, 0, 0, 100, 0),
(@GUID*10, 3, -7007.51, -1311.45, -271.273, 0, 0, 0, 0, 100, 0),
(@GUID*10, 4, -7012.83, -1288.75, -268.084, 0, 0, 0, 0, 100, 0),
(@GUID*10, 5, -7016.54, -1270.43, -269.679, 0, 0, 0, 0, 100, 0),
(@GUID*10, 6, -7022.18, -1247.83, -271.085, 0, 0, 0, 0, 100, 0),
(@GUID*10, 7, -7025.58, -1228.32, -270.156, 0, 0, 0, 0, 100, 0),
(@GUID*10, 8, -7027.61, -1208.54, -270.386, 0, 0, 0, 0, 100, 0),
(@GUID*10, 9, -7036.25, -1197.58, -269.042, 0, 0, 0, 0, 100, 0),
(@GUID*10, 10, -7047.88, -1181.62, -267.949, 0, 0, 0, 0, 100, 0),
(@GUID*10, 11, -7062.23, -1163.26, -267.162, 0, 0, 0, 0, 100, 0),
(@GUID*10, 12, -7080.47, -1145.16, -268.569, 0, 0, 0, 0, 100, 0),
(@GUID*10, 13, -7096.59, -1126.72, -267.95, 0, 0, 0, 0, 100, 0),
(@GUID*10, 14, -7100.79, -1115.88, -266.678, 0, 0, 0, 0, 100, 0),
(@GUID*10, 15, -7110.32, -1102.65, -270.179, 0, 0, 0, 0, 100, 0),
(@GUID*10, 16, -7123.67, -1093.27, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 17, -7145.41, -1084.86, -272.059, 0, 0, 0, 0, 100, 0),
(@GUID*10, 18, -7164.07, -1083.83, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 19, -7188.14, -1087.99, -272.115, 0, 0, 0, 0, 100, 0),
(@GUID*10, 20, -7202.02, -1086.79, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 21, -7219.31, -1089.52, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 22, -7241.86, -1095.42, -271.906, 0, 0, 0, 0, 100, 0),
(@GUID*10, 23, -7260.84, -1100.9, -269.854, 0, 0, 0, 0, 100, 0),
(@GUID*10, 24, -7276.08, -1109.35, -267.855, 0, 0, 0, 0, 100, 0),
(@GUID*10, 25, -7294.53, -1125.48, -269.514, 0, 0, 0, 0, 100, 0),
(@GUID*10, 26, -7311.23, -1140.09, -269.329, 0, 0, 0, 0, 100, 0),
(@GUID*10, 27, -7324.17, -1156.63, -268.45, 0, 0, 0, 0, 100, 0),
(@GUID*10, 28, -7334.7, -1176.16, -270.318, 0, 0, 0, 0, 100, 0),
(@GUID*10, 29, -7345.38, -1196.82, -268.78, 0, 0, 0, 0, 100, 0),
(@GUID*10, 30, -7348.25, -1216.42, -265.408, 0, 0, 0, 0, 100, 0),
(@GUID*10, 31, -7363.39, -1232.54, -268.287, 0, 0, 0, 0, 100, 0),
(@GUID*10, 32, -7366.13, -1248.62, -271.157, 0, 0, 0, 0, 100, 0),
(@GUID*10, 33, -7367.61, -1268.37, -271.197, 0, 0, 0, 0, 100, 0),
(@GUID*10, 34, -7367.78, -1289.21, -269.417, 0, 0, 0, 0, 100, 0),
(@GUID*10, 35, -7360.25, -1307.58, -265.402, 0, 0, 0, 0, 100, 0),
(@GUID*10, 36, -7354.79, -1322.95, -261.729, 0, 0, 0, 0, 100, 0),
(@GUID*10, 37, -7347.48, -1329.33, -260.949, 0, 0, 0, 0, 100, 0),
(@GUID*10, 38, -7344.24, -1339.31, -264.618, 0, 0, 0, 0, 100, 0),
(@GUID*10, 39, -7348.17, -1351.58, -268.716, 0, 0, 0, 0, 100, 0),
(@GUID*10, 40, -7353.15, -1367.11, -269.562, 0, 0, 0, 0, 100, 0),
(@GUID*10, 41, -7354.79, -1371.5, -272.105, 0, 0, 0, 0, 100, 0),
(@GUID*10, 42, -7359.33, -1384.75, -272.105, 0, 0, 0, 0, 100, 0),
(@GUID*10, 43, -7365.74, -1403.49, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 44, -7366.64, -1419.85, -272.116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 45, -7366.87, -1433.84, -271.897, 0, 0, 0, 0, 100, 0),
(@GUID*10, 46, -7379.12, -1449.31, -272.115, 0, 0, 0, 0, 100, 0),
(@GUID*10, 47, -7391.14, -1469.28, -272.118, 0, 0, 0, 0, 100, 0),
(@GUID*10, 48, -7394.18, -1485.31, -272.104, 0, 0, 0, 0, 100, 0),
(@GUID*10, 49, -7394.18, -1504, -271.786, 0, 0, 0, 0, 100, 0),
(@GUID*10, 50, -7384.12, -1519.69, -271.425, 0, 0, 0, 0, 100, 0),
(@GUID*10, 51, -7376.03, -1529.63, -271.218, 0, 0, 0, 0, 100, 0),
(@GUID*10, 52, -7364.17, -1544.08, -271.51, 0, 0, 0, 0, 100, 0),
(@GUID*10, 53, -7348.04, -1545.99, -272.362, 0, 0, 0, 0, 100, 0),
(@GUID*10, 54, -7323.57, -1544.84, -272.903, 0, 0, 0, 0, 100, 0),
(@GUID*10, 55, -7301.47, -1543.8, -274.061, 0, 0, 0, 0, 100, 0),
(@GUID*10, 56, -7279.33, -1542.42, -274.2, 0, 0, 0, 0, 100, 0),
(@GUID*10, 57, -7256.04, -1540.41, -273.428, 0, 0, 0, 0, 100, 0),
(@GUID*10, 58, -7232.74, -1538.39, -273.573, 0, 0, 0, 0, 100, 0),
(@GUID*10, 59, -7213.77, -1544.07, -273.216, 0, 0, 0, 0, 100, 0),
(@GUID*10, 60, -7194.21, -1551.72, -273.692, 0, 0, 0, 0, 100, 0),
(@GUID*10, 61, -7174.95, -1556.11, -271.317, 0, 0, 0, 0, 100, 0),
(@GUID*10, 62, -7152.84, -1554.2, -271.585, 0, 0, 0, 0, 100, 0),
(@GUID*10, 63, -7128.43, -1552.09, -272.111, 0, 0, 0, 0, 100, 0),
(@GUID*10, 64, -7112.74, -1556.52, -272.038, 0, 0, 0, 0, 100, 0),
(@GUID*10, 65, -7098.88, -1558.5, -271.985, 0, 0, 0, 0, 100, 0),
(@GUID*10, 66, -7078.09, -1561.46, -271.579, 0, 0, 0, 0, 100, 0),
(@GUID*10, 67, -7058.48, -1564.26, -271.802, 0, 0, 0, 0, 100, 0),
(@GUID*10, 68, -7039.01, -1557.35, -271.181, 0, 0, 0, 0, 100, 0),
(@GUID*10, 69, -7020.51, -1554.7, -270.069, 0, 0, 0, 0, 100, 0),
(@GUID*10, 70, -7008.79, -1547.03, -269.455, 0, 0, 0, 0, 100, 0),
(@GUID*10, 71, -7001.09, -1536.8, -269.278, 0, 0, 0, 0, 100, 0),
(@GUID*10, 72, -7000.33, -1524.02, -270.062, 0, 0, 0, 0, 100, 0),
(@GUID*10, 73, -7006.28, -1508.83, -268.36, 0, 0, 0, 0, 100, 0),
(@GUID*10, 74, -7005.58, -1497.23, -266.614, 0, 0, 0, 0, 100, 0),
(@GUID*10, 75, -6995.95, -1485.49, -268.974, 0, 0, 0, 0, 100, 0),
(@GUID*10, 76, -6989.49, -1473.06, -271.318, 0, 0, 0, 0, 100, 0),
(@GUID*10, 77, -6987.94, -1460.35, -270.445, 0, 0, 0, 0, 100, 0),
(@GUID*10, 78, -6990.73, -1440.71, -267.886, 0, 0, 0, 0, 100, 0),
(@GUID*10, 79, -6992.86, -1425.74, -265.27, 0, 0, 0, 0, 100, 0),
(@GUID*10, 80, -6996.49, -1418.4, -262.819, 0, 0, 0, 0, 100, 0),
(@GUID*10, 81, -6995.25, -1407.98, -264.201, 0, 0, 0, 0, 100, 0),
(@GUID*10, 82, -6995.62, -1398.67, -265.759, 0, 0, 0, 0, 100, 0),
(@GUID*10, 83, -6996.73, -1388.23, -267.499, 0, 0, 0, 0, 100, 0),
(@GUID*10, 84, -6997.69, -1380.1, -268.447, 0, 0, 0, 0, 100, 0);

-- Blazing Invader (14460V)
UPDATE `creature_template` SET `unit_class`=2, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `MovementType`='1' WHERE entry=@BLAZINV;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@BLAZINV;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BLAZINV, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 89, 11, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Blazing Invader - On Spawn - Random Move'),
(@BLAZINV, 0, 1, 0, 0, 0, 100, 0, 0, 11000, 10000, 16000, 11, 23113, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Blazing Invader - IC - Cast Blast Wave'),
(@BLAZINV, 0, 2, 3, 12, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 11, @BARON, 10, 0, 0, 0, 0, 0, 'Blazing Invader - Target Dead'),
(@BLAZINV, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Blazing Invader - Link - Random Move'); 

-- GO Fire Elemental Rift (179666)
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@GOFER;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOFER AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOFER, 1, 0, 0, 60, 0, 100, 0, 0, 5000, 3600000, 3600000, 12, @BLAZINV,  1, 10800000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fire Elemental Rift - On Update - Summon Blazing Invader');


-- Thundering Invaders
SET @AVALA :=14464;
SET @GUID :=24177;
SET @THUINV :=14462;
SET @GOTER :=179664;

-- Avalanchion (14464)
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID, @GUID*10, 0, 0, 4097, 0, '');

DELETE FROM `creature_formations` WHERE  `leaderGUID`=@GUID;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@GUID, @GUID, 0, 0, 2, 0, 0),
(@GUID, @GUID+1, 7, 45, 2, 0, 0),
(@GUID, @GUID+2, 7, 135, 2, 0, 0),
(@GUID, @GUID+3, 7, 225, 2, 0, 0),
(@GUID, @GUID+4, 7, 315, 2, 0, 0);

DELETE FROM `creature` WHERE `id` IN(@AVALA,@THUINV);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(@GUID, @AVALA, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 2.8*86400, 0, 0, 14335, 0, 2, 0, 0, 0, 0),
(@GUID+1, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 5*86400, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+2, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 5*86400, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+3, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 5*86400, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+4, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 5*86400, 0, 0, 2784, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=@AVALA;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@AVALA, 0, 0, 'Tiny mortals - me HERE! Doom you meet!', 14, 0, 100, 0, 0, 0, 9658, 2, 'Avalanchion Spawn'),
(@AVALA, 1, 0, 'You be too scared!  Me find you!', 14, 0, 100, 0, 0, 0, 9673, 2, 'Avalanchion OOC'),
(@AVALA, 2, 0, 'What?!  You no can beat me!  Me will return!', 14, 0, 100, 0, 0, 0, 9660, 2, 'Avalanchion Death');

UPDATE `creature_template` SET `unit_class`=1, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `InhabitType`='3' WHERE `entry`=@AVALA;

-- Avalanchion SAI
DELETE FROM `smart_scripts` WHERE entryorguid=@AVALA;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@AVALA, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - On Respawn - Say Line 0'),
(@AVALA, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - OOC - Say Line 1'),
(@AVALA, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - On Death - Say Line 2'),
(@AVALA, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0,  41, 0, 0, 0, 0, 0, 0, 15, @GOTER, 1000, 0, 0, 0, 0, 0, 'Avalanchion - On Death - Remove All Earth Elemental Rifts'),
(@AVALA, 0, 4, 0, 0, 0, 100, 0, 0, 1000, 3000, 3000, 11, 23392, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - Within Range 5-30 - Cast Boulder'),
(@AVALA, 0, 5, 0, 0, 0, 100, 0, 0, 8000, 10000, 16000, 11, 5568, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - IC - Cast Trample'),
(@AVALA, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 6524, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - IC - Cast Ground Tremor'),
(@AVALA, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 14, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4748.31, -7160.86, 82.3083, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 15, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4786.63, -7135.98, 90.4752, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 16, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4756.69, -7114.65, 89.7484, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 17, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4707.82, -7088.9, 92.0439, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 18, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4669.64, -7128.59, 95.5044, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 19, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4622.24, -7125.71, 103.437, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 20, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4583.15, -7101.45, 95.9793, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 21, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4532.45, -7069.51, 105.254, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 22, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4520.24, -7134.03, 101.638, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 23, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4538.76, -7181.96, 108.442, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 24, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4470.76, -7193.62, 98.87, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 25, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4438.13, -7236.33, 97.9613, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 26, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4464.92, -7272.94, 98.3938, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 27, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4523.81, -7287.35, 100.579, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 28, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4466.47, -7344.25, 88.6556, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 29, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4485.29, -7405.54, 81.6972, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 30, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4539.42, -7376.79, 90.9745, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 31, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4566.54, -7434.58, 89.2819, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 32, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4538.07, -7503.54, 70.4429, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 33, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4610.4, -7478.49, 80.3099, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 34, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4632.75, -7447.73, 81.7821, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 35, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4687.43, -7438.17, 76.1585, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 36, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4705.93, -7528.15, 79.8415, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 37, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4766.07, -7446.41, 88.1181, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 38, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4716.25, -7358.45, 69.2486, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 39, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4714.05, -7295.35, 69.2923, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 40, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4756.13, -7252.54, 73.7236, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 41, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4746, -7197.88, 82.9989, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift'),
(@AVALA, 0, 42, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4798.16, -7183.17, 89.342, 0, 'Avalanchion - On Respawn - Summon Earth Elemental Rift');

-- Avalanchion WP Data
DELETE FROM `waypoint_data` WHERE `id`=@GUID*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@GUID*10, 1, 4534.96, -7400.33, 88.4305, 0, 0, 0, 0, 100, 0),
(@GUID*10, 2, 4565.56, -7421.5, 89.4375, 0, 0, 0, 0, 100, 0),
(@GUID*10, 3, 4583.52, -7432.13, 90.6386, 0, 0, 0, 0, 100, 0),
(@GUID*10, 4, 4602.62, -7440.85, 85.6074, 0, 0, 0, 0, 100, 0),
(@GUID*10, 5, 4623.12, -7445.44, 82.942, 0, 0, 0, 0, 100, 0),
(@GUID*10, 6, 4652.63, -7452.05, 79.6445, 0, 0, 0, 0, 100, 0),
(@GUID*10, 7, 4672.85, -7446.95, 77.2518, 0, 0, 0, 0, 100, 0),
(@GUID*10, 8, 4695.73, -7442.87, 75.0314, 0, 0, 0, 0, 100, 0),
(@GUID*10, 9, 4707.72, -7422.8, 73.5057, 0, 0, 0, 0, 100, 0),
(@GUID*10, 10, 4709.83, -7394.74, 73.0452, 0, 0, 0, 0, 100, 0),
(@GUID*10, 11, 4712.45, -7359.84, 69.1881, 0, 0, 0, 0, 100, 0),
(@GUID*10, 12, 4714.54, -7334.17, 68.2217, 0, 0, 0, 0, 100, 0),
(@GUID*10, 13, 4720.41, -7302.08, 65.9683, 0, 0, 0, 0, 100, 0),
(@GUID*10, 14, 4732.31, -7276.82, 68.7514, 0, 0, 0, 0, 100, 0),
(@GUID*10, 15, 4745.53, -7257.54, 72.3969, 0, 0, 0, 0, 100, 0),
(@GUID*10, 16, 4757.41, -7240.23, 75.454, 0, 0, 0, 0, 100, 0),
(@GUID*10, 17, 4765.46, -7220.83, 79.0023, 0, 0, 0, 0, 100, 0),
(@GUID*10, 18, 4766.49, -7202.23, 81.5804, 0, 0, 0, 0, 100, 0),
(@GUID*10, 19, 4763.86, -7181.4, 81.7583, 0, 0, 0, 0, 100, 0),
(@GUID*10, 20, 4750.2, -7165.27, 81.8136, 0, 0, 0, 0, 100, 0),
(@GUID*10, 21, 4735.13, -7147.46, 84.6125, 0, 0, 0, 0, 100, 0),
(@GUID*10, 22, 4719.49, -7130.26, 88.647, 0, 0, 0, 0, 100, 0),
(@GUID*10, 23, 4702.1, -7118.63, 90.6803, 0, 0, 0, 0, 100, 0),
(@GUID*10, 24, 4683.37, -7117.59, 92.3254, 0, 0, 0, 0, 100, 0),
(@GUID*10, 25, 4667.04, -7117.07, 96.8419, 0, 0, 0, 0, 100, 0),
(@GUID*10, 26, 4648.59, -7120.44, 100.377, 0, 0, 0, 0, 100, 0),
(@GUID*10, 27, 4627.73, -7120.43, 101.51, 0, 0, 0, 0, 100, 0),
(@GUID*10, 28, 4609.61, -7116.15, 98.3574, 0, 0, 0, 0, 100, 0),
(@GUID*10, 29, 4591.49, -7111.86, 94.905, 0, 0, 0, 0, 100, 0),
(@GUID*10, 30, 4575.12, -7112.63, 96.7954, 0, 0, 0, 0, 100, 0),
(@GUID*10, 31, 4563.22, -7123.88, 98.8996, 0, 0, 0, 0, 100, 0),
(@GUID*10, 32, 4547.99, -7134.59, 101.488, 0, 0, 0, 0, 100, 0),
(@GUID*10, 33, 4536.92, -7143.16, 101.549, 0, 0, 0, 0, 100, 0),
(@GUID*10, 34, 4523.09, -7155.84, 101.362, 0, 0, 0, 0, 100, 0),
(@GUID*10, 35, 4513.15, -7165.69, 101.851, 0, 0, 0, 0, 100, 0),
(@GUID*10, 36, 4498.23, -7180.48, 98.7522, 0, 0, 0, 0, 100, 0),
(@GUID*10, 37, 4484.91, -7196.71, 96.1799, 0, 0, 0, 0, 100, 0),
(@GUID*10, 38, 4472.35, -7207, 96.1632, 0, 0, 0, 0, 100, 0),
(@GUID*10, 39, 4459.54, -7220.52, 97.3785, 0, 0, 0, 0, 100, 0),
(@GUID*10, 40, 4450.06, -7236.55, 97.7249, 0, 0, 0, 0, 100, 0),
(@GUID*10, 41, 4446.16, -7252.46, 95.4364, 0, 0, 0, 0, 100, 0),
(@GUID*10, 42, 4448.54, -7273.33, 95.8551, 0, 0, 0, 0, 100, 0),
(@GUID*10, 43, 4458.9, -7294.29, 95.7072, 0, 0, 0, 0, 100, 0),
(@GUID*10, 44, 4472.01, -7316.46, 93.6741, 0, 0, 0, 0, 100, 0),
(@GUID*10, 45, 4476.63, -7334.5, 89.6147, 0, 0, 0, 0, 100, 0),
(@GUID*10, 46, 4486.96, -7352.79, 87.6991, 0, 0, 0, 0, 100, 0),
(@GUID*10, 47, 4498.82, -7367.14, 87.6533, 0, 0, 0, 0, 100, 0),
(@GUID*10, 48, 4512.51, -7383.06, 86.2541, 0, 0, 0, 0, 100, 0);

-- Thundering Invader (14462)
UPDATE `creature_template` SET `unit_class`=1, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `MovementType`='1' WHERE `entry`=@THUINV;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@THUINV;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@THUINV, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 89, 11, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thundering Invader - On Spawn - Random Move'),
(@THUINV, 0, 1, 0, 0, 0, 100, 0, 0, 7000, 8000, 14000, 11, 23114, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thundering Invader - IC - Cast Earth Shock'),
(@THUINV, 0, 2, 3, 12, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 11, @AVALA, 10, 0, 0, 0, 0, 0, 'Thundering Invader - Target Dead'),
(@THUINV, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thundering Invader - Link - Random Move'); 

-- GO Earth Elemental Rift (179664)
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@GOTER;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOTER;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOTER, 1, 0, 0, 60, 0, 100, 0, 0, 5000, 3600000, 3600000, 12, @THUINV, 1, 10800000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Earth Elemental Rift - On Update - Summon Thundering Invader');


-- Watery Invaders
SET @TEMPES :=14457;
SET @GUID :=24182;
SET @WATINV :=14458;
SET @GOWER :=179665;

-- Princess Tempestria (14457)
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID, @GUID*10, 0, 0, 4097, 0, '');

DELETE FROM `creature_formations` WHERE  `leaderGUID`=@GUID;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@GUID, @GUID, 0, 0, 2, 0, 0),
(@GUID, @GUID+1, 7, 45, 2, 0, 0),
(@GUID, @GUID+2, 7, 135, 2, 0, 0),
(@GUID, @GUID+3, 7, 225, 2, 0, 0),
(@GUID, @GUID+4, 7, 315, 2, 0, 0);

DELETE FROM `creature` WHERE `id` IN(@TEMPES,@WATINV);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(@GUID, @TEMPES, 1, 0, 0, 1, 1, 0, 0, 6471.87, -4076.27, 658.521, 1.06, 230000, 0, 0, 15260, 0, 2, 0, 0, 0, 0),
(@GUID+1, @WATINV, 1, 0, 0, 1, 1, 0, 0, 6471.87, -4076.27, 658.521, 1.06, 1000000, 0, 0, 2699, 0, 0, 0, 0, 0, 0),
(@GUID+2, @WATINV, 1, 0, 0, 1, 1, 0, 0, 6471.87, -4076.27, 658.521, 1.06, 1000000, 0, 0, 2699, 0, 0, 0, 0, 0, 0),
(@GUID+3, @WATINV, 1, 0, 0, 1, 1, 0, 0, 6471.87, -4076.27, 658.521, 1.06, 1000000, 0, 0, 2699, 0, 0, 0, 0, 0, 0),
(@GUID+4, @WATINV, 1, 0, 0, 1, 1, 0, 0, 6471.87, -4076.27, 658.521, 1.06, 1000000, 0, 0, 2699, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=@TEMPES;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@TEMPES, 0, 0, 'This frozen land shall suffice for a start.  Come to me, mortals - and I shall give you a quick and painful death.', 14, 0, 100, 0, 0, 0, 9666, 2, 'Princess Tempestria Spawn'),
(@TEMPES, 1, 0, 'If you mortals are all so craven, this will be easier than I thought!', 14, 0, 100, 0, 0, 0, 9674, 2, 'Princess Tempestria OOC'),
(@TEMPES, 2, 0, 'You will all pay dearly when I return from the depths!', 14, 0, 100, 0, 0, 0, 9664, 2, 'Princess Tempestria Death');

UPDATE `creature_template` SET unit_class=8, AIName='SmartAI', ScriptName='', `speed_run`='1.14286', `speed_walk`='1' WHERE entry=@TEMPES;

-- Princess Tempestria SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TEMPES;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TEMPES, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Say Line 0'),
(@TEMPES, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - OOC - Say Line 1'),
(@TEMPES, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - On Death - Say Line 2'),
(@TEMPES, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 15, @GOWER, 1000, 0, 0, 0, 0, 0, 'Princess Tempestria - On Death - Remove All Water Elemental Rifts'),
(@TEMPES, 0, 4, 0, 0, 0, 100, 0, 0, 1000, 3000, 4500, 11, 23102, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Frostbolt'),
(@TEMPES, 0, 5, 0, 0, 0, 100, 0, 0, 14000, 10000, 16000, 11, 10987, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Geyser'),
(@TEMPES, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 14907, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Frost Nova'),
(@TEMPES, 0, 7, 0, 0, 0, 100, 0, 3000, 10000, 11000, 17000, 11, 22746, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Cone of Cold'),
(@TEMPES, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 14, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6552.74, -4240.22, 658.296, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 15, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6551.11, -4189.69, 658.464, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 16, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6523.7, -4157.58, 658.34, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 17, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6501.46, -4225.49, 658.688, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 18, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6484.71, -4184.13, 658.819, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 19, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6493.89, -4129.62, 658.518, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 20, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6459.01, -4024.87, 658.297, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 21, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6512.79, -4044.29, 658.327, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 22, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6523.37, -3984.89, 658.372, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 23, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6491.97, -3952.45, 658.993, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 24, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6462.44, -3984.73, 658.286, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 25, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6551.45, -4029.24, 658.576, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 26, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6578.54, -4092.35, 658.371, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 27, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6612.45, -4111.76, 658.332, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 28, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6626.92, -4156.29, 658.411, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 29, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6588.69, -4160.86, 658.566, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 30, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6599.22, -4214.35, 658.342, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift'),
(@TEMPES, 0, 31, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6559.97, -3943.21, 658.356, 0, 'Princess Tempestria - On Respawn - Summon Water Elemental Rift');

-- Princess Tempestria WP Data
DELETE FROM `waypoint_data` WHERE `id`=@GUID*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@GUID*10, 1, 6471.87, -4076.27, 658.521, 0, 0, 0, 0, 100, 0),
(@GUID*10, 2, 6480.27, -4096.81, 658.395, 0, 0, 0, 0, 100, 0),
(@GUID*10, 3, 6485.64, -4123.08, 658.468, 0, 0, 0, 0, 100, 0),
(@GUID*10, 4, 6489.6, -4142.49, 658.66, 0, 0, 0, 0, 100, 0),
(@GUID*10, 5, 6495.05, -4163.99, 658.848, 0, 0, 0, 0, 100, 0),
(@GUID*10, 6, 6502.97, -4187.17, 658.851, 0, 0, 0, 0, 100, 0),
(@GUID*10, 7, 6517.24, -4199.24, 658.531, 0, 0, 0, 0, 100, 0),
(@GUID*10, 8, 6536.3, -4210.51, 658.674, 0, 0, 0, 0, 100, 0),
(@GUID*10, 9, 6555.55, -4215.19, 658.547, 0, 0, 0, 0, 100, 0),
(@GUID*10, 10, 6575.18, -4213.33, 658.297, 0, 0, 0, 0, 100, 0),
(@GUID*10, 11, 6592.88, -4202.17, 658.356, 0, 0, 0, 0, 100, 0),
(@GUID*10, 12, 6608.26, -4164.77, 658.508, 0, 0, 0, 0, 100, 0),
(@GUID*10, 13, 6611.58, -4146.45, 658.542, 0, 0, 0, 0, 100, 0),
(@GUID*10, 14, 6609.06, -4131.47, 658.503, 0, 0, 0, 0, 100, 0),
(@GUID*10, 15, 6601.31, -4118.54, 658.313, 0, 0, 0, 0, 100, 0),
(@GUID*10, 16, 6589.84, -4103.78, 658.354, 0, 0, 0, 0, 100, 0),
(@GUID*10, 17, 6579.42, -4085.56, 658.352, 0, 0, 0, 0, 100, 0),
(@GUID*10, 18, 6568.4, -4066.29, 658.284, 0, 0, 0, 0, 100, 0),
(@GUID*10, 19, 6564.72, -4051.56, 658.3, 0, 0, 0, 0, 100, 0),
(@GUID*10, 20, 6562.44, -4029.54, 658.386, 0, 0, 0, 0, 100, 0),
(@GUID*10, 21, 6558.56, -4008.97, 658.322, 0, 0, 0, 0, 100, 0),
(@GUID*10, 22, 6550.59, -3994.74, 658.419, 0, 0, 0, 0, 100, 0),
(@GUID*10, 23, 6537.42, -3981.49, 658.416, 0, 0, 0, 0, 100, 0),
(@GUID*10, 24, 6521.82, -3971.2, 658.304, 0, 0, 0, 0, 100, 0),
(@GUID*10, 25, 6505.46, -3970.38, 658.703, 0, 0, 0, 0, 100, 0),
(@GUID*10, 26, 6490.15, -3980.98, 658.598, 0, 0, 0, 0, 100, 0),
(@GUID*10, 27, 6482.31, -3995.28, 658.319, 0, 0, 0, 0, 100, 0),
(@GUID*10, 28, 6474.37, -4012.21, 658.37, 0, 0, 0, 0, 100, 0),
(@GUID*10, 29, 6468.58, -4026.25, 658.45, 0, 0, 0, 0, 100, 0),
(@GUID*10, 30, 6465.27, -4043.42, 658.474, 0, 0, 0, 0, 100, 0),
(@GUID*10, 31, 6466.07, -4055.08, 658.571, 0, 0, 0, 0, 100, 0);

-- Watery Invader (14458)
UPDATE `creature_template` SET `unit_class`=8, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `InhabitType`='3', `MovementType`='1' WHERE `entry`=@WATINV;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@WATINV;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WATINV, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 89, 11, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Watery Invader - On Spawn - Random Move'),
(@WATINV, 0, 1, 0, 0, 0, 100, 0, 0, 7000, 8000, 14000, 11, 19133, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Watery Invader - IC - Cast Frost Shock'),
(@WATINV, 0, 2, 3, 12, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 11, @TEMPES, 10, 0, 0, 0, 0, 0, 'Whirling Invader - Target Dead'),
(@WATINV, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Whirling Invader - Link - Random Move'); 

-- GO Water Elemental Rift (179665)
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@GOWER;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOWER AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOWER, 1, 0, 0, 60, 0, 100, 0, 0, 5000, 3600000, 3600000, 12, @WATINV, 1, 10800000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Water Elemental Rift - On Update - Summon Watery Invader');


-- Whirling Invaders
SET @WINDR :=14454;
SET @GUID :=42188;
SET @WHIRLINV :=14455;
SET @GOAER :=179667;

-- The Windreaver (14454)
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID, @GUID*10, 0, 0, 4097, 0, '');

DELETE FROM `creature_formations` WHERE  `leaderGUID`=@GUID;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@GUID, @GUID, 0, 0, 2, 0, 0),
(@GUID, @GUID+1, 7, 45, 2, 0, 0),
(@GUID, @GUID+2, 7, 135, 2, 0, 0),
(@GUID, @GUID+3, 7, 225, 2, 0, 0),
(@GUID, @GUID+4, 7, 315, 2, 0, 0);

DELETE FROM `creature` WHERE `id` IN(@WINDR,@WHIRLINV);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(@GUID, @WINDR, 1, 0, 0, 1, 1, 0, 0, -6316.154, 1347.962, 5.207, 1.06, 250000, 0, 0, 15260, 0, 2, 0, 0, 0, 0),
(@GUID+1, @WHIRLINV, 1, 0, 0, 1, 1, 0, 0, -6316.154, 1347.962, 5.207, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+2, @WHIRLINV, 1, 0, 0, 1, 1, 0, 0, -6316.154, 1347.962, 5.207, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+3, @WHIRLINV, 1, 0, 0, 1, 1, 0, 0, -6316.154, 1347.962, 5.207, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+4, @WHIRLINV, 1, 0, 0, 1, 1, 0, 0, -6316.154, 1347.962, 5.207, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=@WINDR;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@WINDR, 0, 0, '%s and his invading forces appear amidst a tumultuous conflagration in the northwest of Silithus.', 16, 0, 100, 0, 0, 0, 9669, 2, 'The Windreaver Spawn'),
(@WINDR, 1, 0, '%s causes a gale to sweep across the land, the sound of his mindless fury coming from the northwest.', 16, 0, 100, 0, 0, 0, 9679, 2, 'The Windreaver OOC'),
(@WINDR, 2, 0, '%s dissipates into the ether, his howling winds still ringing in your ears.', 16, 0, 100, 0, 0, 0, 9668, 2, 'The Windreaver Death');

UPDATE `creature_template` SET `unit_class`=8, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1' WHERE `entry`=@WINDR;

-- The Windreaver SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WINDR;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WINDR, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - On Respawn - Say Line 0'),
(@WINDR, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - OOC - Say Line 1'),
(@WINDR, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - On Death - Say Line 2'),
(@WINDR, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 15, @GOAER, 1000, 0, 0, 0, 0, 0, 'The Windreaver - On Death - Remove All Air Elemental Rifts'),
(@WINDR, 0, 4, 0, 0, 0, 100, 0, 3000, 6000, 8000, 11000, 11, 23106, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Chain Lightning'),
(@WINDR, 0, 5, 0, 0, 0, 100, 0, 0, 14000, 10000, 16000, 11, 23105, 0, 0, 0, 0, 0, 5, 20, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Lightning Cloud'),
(@WINDR, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 23103, 0, 0, 0, 0, 0, 6, 20, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Enveloping Winds'),
(@WINDR, 0, 7, 0, 0, 0, 100, 0, 3000, 6000, 8000, 14000, 11, 23104, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Shock'),
(@WINDR, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 14, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6324.1, 1349.34, 4.39246, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 15, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6265.87, 1332.98, 14.2791, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 16, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6287.71, 1390.8, 9.90502, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 17, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6286.39, 1440.51, 10.2443, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 18, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6308.11, 1497.98, 4.06939, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 19, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6263, 1517.72, 9.75825, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 20, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6309.46, 1535.09, 3.51532, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 21, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6353.25, 1512.41, 4.66918, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 22, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6389.05, 1462.01, 2.95468, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 23, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6405.61, 1415.61, -1.48166, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 24, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6438.17, 1511.42, 6.13047, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 25, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6501.51, 1505.89, 4.09383, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 26, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6556.16, 1444.78, 2.96919, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 27, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6601.16, 1474.43, 4.0009, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 28, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6573.24, 1530.22, 3.10244, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 29, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6636.07, 1504.24, 3.69889, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt'),
(@WINDR, 0, 30, 0, 11, 0, 100, 1, 0, 0, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6483.56, 1453.19, 2.10941, 0, 'The Windreaver - On Respawn - Summon Air Elemental Riftt');

-- The Windreaver WP Data
DELETE FROM `waypoint_data` WHERE `id`=@GUID*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@GUID*10, 1, -6315.81, 1356.37, 5.25458, 0, 0, 0, 0, 100, 0),
(@GUID*10, 2, -6302.42, 1374.06, 8.68165, 0, 0, 0, 0, 100, 0),
(@GUID*10, 3, -6290.7, 1392.85, 9.76755, 0, 0, 0, 0, 100, 0),
(@GUID*10, 4, -6285.7, 1409.55, 9.06444, 0, 0, 0, 0, 100, 0),
(@GUID*10, 5, -6285.42, 1423.55, 11.3973, 0, 0, 0, 0, 100, 0),
(@GUID*10, 6, -6289.02, 1444.19, 9.88459, 0, 0, 0, 0, 100, 0),
(@GUID*10, 7, -6298.88, 1459.99, 6.63575, 0, 0, 0, 0, 100, 0),
(@GUID*10, 8, -6307.62, 1482.88, 4.62563, 0, 0, 0, 0, 100, 0),
(@GUID*10, 9, -6326.69, 1496.28, 3.20733, 0, 0, 0, 0, 100, 0),
(@GUID*10, 10, -6350.8, 1505.08, 5.14763, 0, 0, 0, 0, 100, 0),
(@GUID*10, 11, -6373.98, 1502.62, 5.52059, 0, 0, 0, 0, 100, 0),
(@GUID*10, 12, -6403.17, 1503.08, 4.19517, 0, 0, 0, 0, 100, 0),
(@GUID*10, 13, -6415.98, 1502.83, 4.26121, 0, 0, 0, 0, 100, 0),
(@GUID*10, 14, -6434.55, 1502.47, 6.93398, 0, 0, 0, 0, 100, 0),
(@GUID*10, 15, -6460.15, 1504.61, 6.75268, 0, 0, 0, 0, 100, 0),
(@GUID*10, 16, -6479.9, 1506.04, 6.74363, 0, 0, 0, 0, 100, 0),
(@GUID*10, 17, -6505.53, 1504.23, 4.0931, 0, 0, 0, 0, 100, 0),
(@GUID*10, 18, -6525.29, 1506.41, 2.15644, 0, 0, 0, 0, 100, 0),
(@GUID*10, 19, -6547.33, 1504.5, 3.53133, 0, 0, 0, 0, 100, 0),
(@GUID*10, 20, -6557.73, 1503.6, 4.35006, 0, 0, 0, 0, 100, 0),
(@GUID*10, 21, -6556.72, 1480.32, 1.1815, 0, 0, 0, 0, 100, 0),
(@GUID*10, 22, -6556.86, 1462.82, -0.342604, 0, 0, 0, 0, 100, 0),
(@GUID*10, 23, -6556.54, 1439.45, 3.30604, 0, 0, 0, 0, 100, 0),
(@GUID*10, 24, -6547.8, 1416.56, 3.37939, 0, 0, 0, 0, 100, 0),
(@GUID*10, 25, -6528.03, 1402.08, 3.01431, 0, 0, 0, 0, 100, 0),
(@GUID*10, 26, -6506.35, 1397.35, 1.23802, 0, 0, 0, 0, 100, 0),
(@GUID*10, 27, -6480.82, 1396.45, 1.71924, 0, 0, 0, 0, 100, 0),
(@GUID*10, 28, -6459.15, 1400.85, 1.12839, 0, 0, 0, 0, 100, 0),
(@GUID*10, 29, -6444.04, 1399.3, 3.57583, 0, 0, 0, 0, 100, 0),
(@GUID*10, 30, -6418.63, 1395.48, 4.18943, 0, 0, 0, 0, 100, 0),
(@GUID*10, 31, -6398.9, 1388.26, 4.39496, 0, 0, 0, 0, 100, 0),
(@GUID*10, 32, -6377.58, 1374.01, 4.37222, 0, 0, 0, 0, 100, 0),
(@GUID*10, 33, -6372.94, 1344.95, 2.82732, 0, 0, 0, 0, 100, 0),
(@GUID*10, 34, -6355.21, 1333.7, 3.20116, 0, 0, 0, 0, 100, 0),
(@GUID*10, 35, -6343.59, 1335.03, 3.21992, 0, 0, 0, 0, 100, 0);

-- Whirling Invader (14455)
UPDATE `creature_template` SET `unit_class`=2, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `MovementType`='1' WHERE `entry`=@WHIRLINV;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@WHIRLINV;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WHIRLINV, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Whirling Invader - On Spawn - Random Move'),
(@WHIRLINV, 0, 1, 0, 0, 0, 100, 0, 0, 7000, 8000, 14000, 11, 17207, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Whirling Invader - IC - Cast Whirlwind'),
(@WHIRLINV, 0, 2, 3, 12, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 11, @WINDR, 10, 0, 0, 0, 0, 0, 'Whirling Invader - Target Dead'),
(@WHIRLINV, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Whirling Invader - Link - Random Move'); 

-- GO Air Elemental Rift (179667)
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@GOAER;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOAER AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOAER, 1, 0, 0, 60, 0, 100, 0, 0, 5000, 3600000, 3600000, 12, @WHIRLINV, 1, 10800000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Elemental Rift - On Update - Summon Whirling Invader');
 
 
/* 
*/ 
-- -------------------------------------------
-- Onslaught Execution
-- -------------------------------------------

-- Insert Game Event
DELETE FROM `game_event` WHERE `eventEntry`=70;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`, `announce`) VALUES 
(70, '2016-01-01 20:01:00', '2020-12-31 20:00:00', 360, 5, 0, 'Forsaken Prisoner Execution', 0, 2);

-- Forsaken Prisoner creature update
UPDATE `creature` SET `unit_flags`='33555200', `dynamicflags`='32' WHERE  `guid`IN(97213,97212);
UPDATE `creature_template` SET `unit_flags`='0', `dynamicflags`='0', `mechanic_immune_mask`='0', `AIName`='SmartAI' WHERE  `entry`=27400;
UPDATE `creature_template` SET `unit_flags`='768', `dynamicflags`='0', `mechanic_immune_mask`='0',`AIName`='SmartAI',`ScriptName`='' WHERE  `entry`=27219;
UPDATE `creature_addon` SET `bytes1`='7', `emote`='65' WHERE `guid`IN(97213,103288);



-- Forsaken Prisoner SAI
SET @ENTRY :=27219;
UPDATE `creature_template` SET `ScriptName`='SmartAI' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@ENTRY,@ENTRY*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 68, 0, 100, 0, 70, 0, 0, 0, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Event Start - Start WP'),
(@ENTRY, 0, 1, 2, 40, 0, 100, 0, 1, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 1 - Remove FB1 Dead'),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 1, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 1 - State None'),
(@ENTRY, 0, 3, 0, 40, 0, 100, 0, 2, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 2 - Set FB1 Stand'),
(@ENTRY, 0, 4, 0, 40, 0, 100, 0, 4, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27203, 5, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 4 - Set Data 0 1 (OF)'),
(@ENTRY, 0, 5, 6, 40, 0, 100, 0, 14, 0, 0, 0, 54, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 14 - Pause WP'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27211, 5, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 14 - Set Data 0 1 (OE)'),
(@ENTRY, 0, 7, 8, 40, 0, 100, 0, 17, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 17 - Pause WP'),
(@ENTRY, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2889.193848, -379.011780, 116.388832, 5.6231, 'Forsaken Prisoner - Link - Set Orientation'),
(@ENTRY, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Remove FB1 Stand'),
(@ENTRY, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Kneel'),
(@ENTRY, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Play Emote Kneel'),
(@ENTRY, 0, 12, 0, 38, 0, 100, 0, 0, 2, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Data 0 2 - Resume WP'),
(@ENTRY, 0, 13, 14, 38, 0, 100, 0, 0, 1, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Data 0 1 - Remove FB1 Kneel'),
(@ENTRY, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 5, 65, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Play Emote Dead'),
(@ENTRY, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Dead'),
(@ENTRY, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*10, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Run Script'),
(@ENTRY, 0, 17, 18, 40, 0, 100, 0, 32, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On WP 32 reached - Go Home'),
(@ENTRY, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Despawn'),
(@ENTRY, 0, 19, 20, 11, 0, 100, 0, 0, 0, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Respawn - Go Visible'),
(@ENTRY, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set Data 0 0'),
(@ENTRY, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Remove FB1 Stand'),
(@ENTRY, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - State Dead'),
(@ENTRY, 0, 23, 0, 61, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Dead'),

(@ENTRY*10, 9, 0, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Go Invisible'),
(@ENTRY*10, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Remove FB1 Dead'),
(@ENTRY*10, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - State None'),
(@ENTRY*10, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Set FB1 Stand'),
(@ENTRY*10, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Resume WP');

-- Onslaught Executioner SAI
SET @ENTRY :=27211;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@ENTRY,@ENTRY*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 9, 0, 100, 0, 0, 5, 9000, 13000, 11, 9080, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Onslaught Executioner - Within 0-5 Range - Cast 'Hamstring' (No Repeat)"), 
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, 11, 43673, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Onslaught Executioner - In Combat - Cast 'Mighty Blow' (No Repeat)"), 
(@ENTRY, 0, 2, 0, 8, 0, 100, 0, 48268, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On Spellhit Despawn'),
(@ENTRY, 0, 3, 4, 38, 0, 100, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On Data 0 1 - Say Text 1'),
(@ENTRY, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Start WP'),
(@ENTRY, 0, 5, 6, 61, 0, 100, 0, 9, 0, 0, 0, 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Pause WP'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 33536, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Unit Flag'),
(@ENTRY, 0, 7, 8, 40, 0, 100, 0, 3, 0, 0, 0, 54, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 3 - Pause WP'),
(@ENTRY, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Say Text 2'),
(@ENTRY, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*10, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Run Script'),
(@ENTRY, 0, 10, 0, 40, 0, 100, 0, 4, 0, 0, 0, 45, 0, 2, 0, 0, 0, 0, 19, 27203, 5, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 4 - Set Data 0 2 (OF)'),
(@ENTRY, 0, 11, 0, 40, 0, 100, 0, 5, 0, 0, 0, 1, 4, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 5 - Say Text 5'),
(@ENTRY, 0, 12, 13, 40, 0, 100, 0, 6, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - On WP 6 - Go Home'),
(@ENTRY, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Data 0 0'),
(@ENTRY, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 32768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Unit Flag'),

(@ENTRY*10, 9, 0, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Script - Say Text 3'),
(@ENTRY*10, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 5, 38, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Play Emote (Execute)'),
(@ENTRY*10, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Say Text 4'),
(@ENTRY*10, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27219, 5, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Set Data 0 1 (FP)'),
(@ENTRY*10, 9, 4, 0, 0, 0, 100, 0, 12000, 12000, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Resume WP');

-- Onslaught Footman SAI
SET @ENTRY :=-102176;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 8, 0, 100, 0, 48268, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Spellhit Despawn'), 
(@ENTRY, 0, 1, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Agro - Say'),
(@ENTRY, 0, 2, 3, 38, 0, 100, 0, 0, 1, 0, 0, 53, 0, 27203, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Data 0 1 - Start WP'),
(@ENTRY, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 33536, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Unit Flag'),
(@ENTRY, 0, 4, 5, 40, 0, 100, 0, 9, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 9 reached - Pause WP'),
(@ENTRY, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2878.271484, -391.718750, 112.461624, 0.7136, 'Onslaught Footman - Link - Set Orientation'),
(@ENTRY, 0, 6, 7, 40, 0, 100, 0, 12, 0, 0, 0, 54, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 12 reached - Pause WP'),
(@ENTRY, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2886.305420, -379.218506,116.388504, 6.000139, 'Onslaught Footman - Link - Set Orientation'),
(@ENTRY, 0, 8, 0, 38, 0, 100, 0, 0, 2, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Data 0 2 - Resume WP'),
(@ENTRY, 0, 9, 10, 40, 0, 100, 0, 23, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 23 reached - Go Home'),
(@ENTRY, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 18, 32768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Unit Flag'),
(@ENTRY, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Data 0 0');

-- Onslaught Executioner text
SET @ENTRY :=27211;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'About time!', 12, 0, 100, 5, 0, 0, 26292, 0, 'Onslaught Executioner'),
(@ENTRY, 1, 0, 'Any last words you impure mongrel?', 12, 0, 100, 6, 0, 0, 26293, 0, 'Onslaught Executioner'),
(@ENTRY, 2, 0, 'On second thought, I don\'t care. Burn in hell wretch!', 12, 0, 100, 5, 0, 0, 26294, 0, 'Onslaught Executioner'),
(@ENTRY, 3, 0, 'The executioner cuts down the prisoner and walks off the gallows.', 16, 0, 100, 38, 0, 0, 0, 0, 'Onslaught Executioner'),
(@ENTRY, 4, 0, 'Hah! That never gets old.', 12, 0, 100, 0, 0, 0, 26295, 0, 'Onslaught Executioner');

-- Onslaught Executioner waypoints
SET @ENTRY :=27211;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2883.031006, -387.130035, 112.462036, 'Onslaught Executioner'), 
(@ENTRY, 2, 2886.141357, -384.093109, 116.389175, 'Onslaught Executioner'),
(@ENTRY, 3, 2889.506836, -380.807159, 116.389175, 'Onslaught Executioner'),
(@ENTRY, 4, 2886.141357, -384.093109, 116.389175, 'Onslaught Executioner'), 
(@ENTRY, 5, 2883.031006, -387.130035, 112.462036, 'Onslaught Executioner'),
(@ENTRY, 6, 2879.770000, -387.146000, 112.462000, 'Onslaught Executioner');

-- Onslaught Footman waypoints
SET @ENTRY :=27203;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2893.011475, -275.699097, 107.242134, 'Onslaught Footman'),
(@ENTRY, 2, 2893.001953, -287.614807, 114.034653, 'Onslaught Footman'),
(@ENTRY, 3, 2894.372314, -292.698425, 114.034653, 'Onslaught Footman'),
(@ENTRY, 4, 2907.858643, -293.368256, 114.034653, 'Onslaught Footman'),
(@ENTRY, 5, 2907.169434, -304.399536, 114.034653, 'Onslaught Footman'),
(@ENTRY, 6, 2885.362061, -305.039612, 112.536087, 'Onslaught Footman'),
(@ENTRY, 7, 2883.634766, -362.634216, 112.461624, 'Onslaught Footman'),
(@ENTRY, 8, 2866.434326, -380.423492, 112.461624, 'Onslaught Footman'),
(@ENTRY, 9, 2878.271484, -391.718750, 112.461624, 'Onslaught Footman'),
(@ENTRY, 10, 2883.031006, -387.130035, 112.462036, 'Onslaught Footman'), 
(@ENTRY, 11, 2886.141357, -384.093109, 116.389175, 'Onslaught Footman'),
(@ENTRY, 12, 2886.305420, -379.218506, 116.388504, 'Onslaught Footman'),
(@ENTRY, 13, 2886.141357, -384.093109, 116.389175, 'Onslaught Footman'),
(@ENTRY, 14, 2883.031006, -387.130035, 112.462036, 'Onslaught Footman'),
(@ENTRY, 15, 2878.271484, -391.718750, 112.461624, 'Onslaught Footman'), 
(@ENTRY, 16, 2866.434326, -380.423492, 112.461624, 'Onslaught Footman'),
(@ENTRY, 17, 2883.634766, -362.634216, 112.461624, 'Onslaught Footman'),
(@ENTRY, 18, 2885.362061, -305.039612, 112.536087, 'Onslaught Footman'),
(@ENTRY, 19, 2907.169434, -304.399536, 114.034653, 'Onslaught Footman'),
(@ENTRY, 20, 2907.858643, -293.368256, 114.034653, 'Onslaught Footman'),
(@ENTRY, 21, 2894.372314, -292.698425, 114.034653, 'Onslaught Footman'),
(@ENTRY, 22, 2893.001953, -287.614807, 114.034653, 'Onslaught Footman'),
(@ENTRY, 23, 2893.011475, -275.699097, 107.242134, 'Onslaught Footman');

-- Frosaken Prisoner waypoints
SET @ENTRY :=27219;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2876.191650, -281.550446, 106.880356, 'Forsaken Prisoner'),
(@ENTRY, 2, 2877.175781, -280.941956, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 3, 2890.545410, -274.634338, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 4, 2893.005615, -274.593140, 107.243553, 'Forsaken Prisoner'),
(@ENTRY, 5, 2893.011475, -275.699097, 107.242134, 'Forsaken Prisoner'),
(@ENTRY, 6, 2893.001953, -287.614807, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 7, 2894.372314, -292.698425, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 8, 2907.858643, -293.368256, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 9, 2907.169434, -304.399536, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 10, 2885.362061, -305.039612, 112.536087, 'Forsaken Prisoner'),
(@ENTRY, 11, 2883.634766, -362.634216, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 12, 2866.434326, -380.423492, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 13, 2878.271484, -391.718750, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 14, 2883.031006, -387.130035, 112.462036, 'Forsaken Prisoner'), 
(@ENTRY, 15, 2886.141357, -384.093109, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 16, 2889.506836, -380.807159, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 17, 2890.368148, -379.838684, 116.389015, 'Forsaken Prisoner'),
(@ENTRY, 18, 2889.506836, -380.807159, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 19, 2886.141357, -384.093109, 116.389175, 'Forsaken Prisoner'), 
(@ENTRY, 20, 2883.031006, -387.130035, 112.462036, 'Forsaken Prisoner'),
(@ENTRY, 21, 2878.271484, -391.718750, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 22, 2866.434326, -380.423492, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 23, 2883.634766, -362.634216, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 24, 2885.362061, -305.039612, 112.536087, 'Forsaken Prisoner'),
(@ENTRY, 25, 2907.169434, -304.399536, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 26, 2907.858643, -293.368256, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 27, 2894.372314, -292.698425, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 28, 2893.001953, -287.614807, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 29, 2893.011475, -275.699097, 107.242134, 'Forsaken Prisoner'),
(@ENTRY, 30, 2893.005615, -274.593140, 107.243553, 'Forsaken Prisoner'),
(@ENTRY, 31, 2890.545410, -274.634338, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 32, 2877.175781, -280.941956, 106.879684, 'Forsaken Prisoner');
 
 
/* 
*/ 
-- Gameobjectscripts

-- Higher Learning (1956)
UPDATE gameobject_template SET data11=1, AIName='SmartGameObjectAI', ScriptName='' WHERE entry IN (192708, 192706, 192871, 192905, 192710, 192886, 192869, 192880, 192895, 192713, 192889, 192890, 192894, 192884, 192866, 192891, 192872, 192881, 192709 ,192883 ,192651, 192888, 192711, 192653 ,192887, 192652, 192865, 192874 ,192868, 192870, 192885, 192867, 192882, 192707, 192896);
DELETE FROM smart_scripts WHERE source_type=1 AND entryorguid IN (192708, 192706, 192871, 192905, 192710, 192886, 192869, 192880, 192895, 192713, 192889, 192890, 192894, 192884, 192866, 192891, 192872, 192881, 192709 ,192883 ,192651, 192888, 192711, 192653 ,192887, 192652, 192865, 192874 ,192868, 192870, 192885, 192867, 192882, 192707, 192896);
INSERT INTO smart_scripts VALUES (192708, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192708, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192706, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192706, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192871, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192871, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192905, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192905, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192710, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192710, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192886, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192886, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192869, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192869, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192880, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192880, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192895, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192895, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192713, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192713, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192889, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192889, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192890, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192890, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192894, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192894, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192884, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192884, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192866, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192866, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192891, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192891, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192872, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192872, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192881, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192881, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192709, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192709, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192883, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192883, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192651, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192651, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192888, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192888, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192711, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192711, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192653, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192653, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192887, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192887, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192652, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192652, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192865, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192865, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192874, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192874, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192868, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192868, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192870, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192870, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192885, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192885, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192867, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192867, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192882, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192882, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192707, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192707, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192896, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192896, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
 
 
/* 
*/ 
-- Attumen the Huntsman (16152) -- http://www.wowhead.com/npc=16152
DELETE FROM creature_text WHERE entry=16152;
INSERT INTO creature_text VALUES (16152, 0, 0, 'I always knew... someday I would become... the hunted.', 14, 0, 100, 0, 0, 9165, 0, 0, 'attumen SAY_DEATH');
INSERT INTO creature_text VALUES (16152, 1, 0, 'It was... inevitable.', 14, 0, 100, 0, 0, 9169, 0, 0, 'attumen SAY_KILL1');
INSERT INTO creature_text VALUES (16152, 1, 1, 'Another trophy to add to my collection!', 14, 0, 100, 0, 0, 9300,  0, 0, 'attumen SAY_KILL2');
INSERT INTO creature_text VALUES (16152, 3, 0, 'Weapons are merely a convenience for a warrior of my skill!', 14, 0, 100, 0, 0, 9166, 0, 0, 'attumen SAY_DISARMED');
INSERT INTO creature_text VALUES (16152, 4, 0, 'Such easy sport.', 14, 0, 100, 0, 0, 9170,  0, 0,'attumen SAY_RANDOM1');
INSERT INTO creature_text VALUES (16152, 4, 1, 'Amateurs! Do not think you can best me! I kill for a living.', 14, 0, 100, 0, 0, 9304,  0, 0, 'attumen SAY_RANDOM2');
DELETE FROM creature_loot_template WHERE entry=16152;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(16152, 1, 34016, 100, 0, 1, 1, 1, 2, NULL),
(16152, 30480, 0, 0.5, 0, 1, 0, 1, 1, NULL),
(16152, 29434, 0, 100, 0, 1, 0, 1, 1, NULL),
(16152, 23809, 0, 5, 0, 1, 0, 1, 1, NULL);

UPDATE creature_template SET lootid=16152, mechanic_immune_mask=650854267, flags_extra=1+0x100+0x200000, AIName='', ScriptName='boss_attumen_midnight' WHERE entry=16152;

-- SPELL Mount (29769)
-- SPELL Mount (29770)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(29769, 29770);
INSERT INTO conditions VALUES (13, 1, 29769, 0, 0, 31, 0, 3, 15550, 0, 0, 0, 0, '', 'Target Attumen the Huntsman');
INSERT INTO conditions VALUES (13, 1, 29770, 0, 0, 31, 0, 3, 16151, 0, 0, 0, 0, '', 'Target Midnight');
 
 
/* 
*/ 
-- -------------------------------------------
-- DIRE MAUL
-- -------------------------------------------


-- The Madness Within - [A][H]http://www.wowhead.com/quest=27110/the-madness-within
-- Prince Tortheldrin
UPDATE creature_template SET faction=14 WHERE entry=11486; 
 
/* 
*/ 
-- 
-- ZUL'FARRAK
-- 

-- Chief Ukorz Sandscalp SAI
SET @ENTRY := 7267;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,2,0,0,0,0,11,7366,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Aggro - Cast 'Berserker Stance' (Normal Dungeon)"),
(@ENTRY,0,1,0,61,0,100,2,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Aggro - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,100,2,3500,3500,12000,13000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - In Combat - Cast 'Cleave' (Normal Dungeon)"),
(@ENTRY,0,3,0,0,0,100,2,3000,4000,15000,18000,11,11837,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - In Combat - Cast 'Wide Slash' (Normal Dungeon)"),
(@ENTRY,0,4,5,2,0,100,3,0,30,80000,80000,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 0-30% Health - Cast 'Frenzy' (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,5,0,61,0,100,2,0,30,80000,80000,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 0-30% Health - Say Line 1 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,6,0,2,0,100,3,34,70,120000,120000,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 34-70% Health - Say Line 2 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,7,0,5,0,100,0,5000,5000,1,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Killed Unit - Say Line 3");

DELETE FROM `creature_text` WHERE `entry`=7267;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(7267, 0, 0, 'This desert be mine!', 14, 0, 0, 0, 0, 5876, 'Chief Ukorz Sandscalp - Say on Aggro', 6225),
(7267, 1, 0, 'Feel the fury of the sands', 14, 0, 0, 0, 0, 5879, 'Chief Ukorz Sandscalp - Say on 30% Enrage', 6227),
(7267, 2, 0, 'The Sandfury regin supreme', 14, 0, 0, 0, 0, 5878, 'Chief Ukorz Sandscalp - Yell on 70%', 6228),
(7267, 3, 0, 'Die, outlander!', 14, 0, 0, 0, 0, 5878, 'Chief Ukorz Sandscalp - Yell on 70%', 0);
 
 
/* 
*/ 
-- -------------------------------------------
--                ULDUAR
-- -------------------------------------------


-- ###################
-- ### GENERAL VEZAX
-- ###################

UPDATE creature_template SET flags_extra=flags_extra|256 WHERE entry IN (33271, 33449); 
 
/* 
*/ 
-- Plans: Goblin Rocket Boots - http://www.wowhead.com/item=7192/schematic-goblin-rocket-boots
DELETE FROM `creature_loot_template` WHERE `item` = 7192;

-- Healthy Dragon Scale http://db.vanillagaming.org/?item=13920
DELETE FROM `conditions` WHERE  `SourceGroup`=10678 AND `SourceEntry`=13920;
DELETE FROM `conditions` WHERE  `SourceGroup`=10678 AND `SourceEntry`=5582 AND `ConditionValue1`=5529;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(1, 10678, 13920, 0, 0, 8, 0, 5529, 0, 0, 0, 0, 0, '', 'Healthy Dragon Scale drop if Quest rewarded');

UPDATE `creature_loot_template` SET `Chance`='6' WHERE  `Entry`=10678 AND `Item`=13920;

-- Blue Pearls -- http://wotlk.openwow.com/item=4611
UPDATE `spell_loot_template` SET `Chance`='1' WHERE  `Entry`=58172 AND `Item`=4611;
 
 
/* 
*/ 
-- -------------------------------------------
-- STORM PEAKS
-- -------------------------------------------

-- Brittle Revenant loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30160;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30160, 42246, 0, 68, 1, 1, 0, 1, 1, NULL),
(30160, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30160, 42780, 0, 34, 0, 1, 0, 1, 1, NULL),
(30160, 37701, 0, 26, 0, 1, 0, 1, 2, NULL),
(30160, 42107, 0, 0.2, 1, 1, 0, 1, 1, NULL),
(30160, 39512, 0, 81, 0, 1, 0, 1, 1, NULL),
(30160, 39513, 0, 19, 0, 1, 0, 1, 1, NULL);

-- Niflheim Forefather loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=29974;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(29974, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(29974, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(29974, 33454, 0, 5, 0, 1, 0, 1, 1, NULL),
(29974, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(29974, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(29974, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(29974, 36678, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36146, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36145, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36255, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(29974, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

-- Restless Frostborn Warrior loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30135;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30135, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30135, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30135, 35947, 0, 5, 0, 1, 0, 1, 1, NULL),
(30135, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30135, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30135, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30135, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30135, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30135;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30135, 38269, 0, 31, 0, 1, 0, 1, 1, NULL),
(30135, 43575, 0, 19, 0, 1, 0, 1, 1, NULL),
(30135, 35947, 0, 1, 0, 1, 0, 1, 1, NULL),
(30135, 33447, 0, 1, 0, 1, 0, 1, 1, NULL);

-- Restless Frostborn Ghost loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30144;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30144, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30144, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30144, 35945, 0, 5, 0, 1, 0, 1, 1, NULL),
(30144, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30144, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30144, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30144, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30144, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30144;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30144, 38269, 0, 30, 0, 1, 0, 1, 1, NULL),
(30144, 43575, 0, 25, 0, 1, 0, 1, 1, NULL),
(30144, 35947, 0, 1, 0, 1, 0, 1, 1, NULL),
(30144, 33447, 0, 1, 0, 1, 0, 1, 1, NULL);

-- Viscous Oil loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30325;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30325, 42640, 0, 100, 1, 1, 0, 1, 1, NULL),
(30325, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36678, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36255, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30325, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36145, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 39551, 0, 81, 0, 1, 0, 1, 1, NULL),
(30325, 39552, 0, 19, 0, 1, 0, 1, 1, NULL);

-- Stormforged Infiltrator loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30222;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30222, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30222, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30222, 33454, 0, 5, 0, 1, 0, 1, 1, NULL),
(30222, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30222, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30222, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30222, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30222, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30222, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30222, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30222;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30222, 43575, 0, 32, 0, 1, 0, 1, 1, NULL), 
(30222, 37467, 0, 26, 0, 1, 0, 1, 1, NULL),
(30222, 35950, 0, 21, 0, 1, 0, 1, 1, NULL);
 
 
/* 
*/ 
-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------

-- Masat T'andr <Superior Leatherworker> -- [A][H] http://www.wowhead.com/npc=11874/masat-tandr
UPDATE `creature_template` SET `faction`='35' WHERE  `entry`=11874;

-- Skeletal Executioner http://www.wowhead.com/npc=1787/skeletal-executioner
DELETE FROM `creature` WHERE  `guid`=52542 AND `id`=1787;
-- Jamie Nore - http://www.wowhead.com/npc=2310/jamie-nore
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=31921;
-- Ravenholdt Guard <Assassin's League> -wowhead.com/npc=6766
DELETE FROM `gossip_menu` WHERE  `entry`=4861 AND `text_id`=5935;
-- Crawler - http://wotlk.openwow.com/npc=6250
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry` IN (6250, 1860);
-- Archmage Leryda - http://wotlk.openwow.com/npc=18253
DELETE FROM `npc_text` WHERE `ID` = 10884;
DELETE FROM `gossip_menu` WHERE `entry`=8441 AND `text_id`=10884;
-- Azshir the Sleepless (6490)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6490;
DELETE FROM smart_scripts WHERE entryorguid=6490 AND source_type=0;
INSERT INTO smart_scripts VALUES (6490, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6490, 0, 1, 0, 0, 0, 100, 0, 7000, 11000, 70000, 70000, 11, 5137, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Call of the Grave');
INSERT INTO smart_scripts VALUES (6490, 0, 2, 0, 0, 0, 100, 0, 6000, 8000, 20000, 20000, 11, 7399, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Terrify');
INSERT INTO smart_scripts VALUES (6490, 0, 3, 0, 0, 0, 100, 0, 14000, 14000, 20000, 20000, 11, 9373, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Soul Siphon');

-- Ironspine (6489)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6489;
DELETE FROM smart_scripts WHERE entryorguid=6489 AND source_type=0;
INSERT INTO smart_scripts VALUES (6489, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ironspine - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6489, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 30000, 30000, 11, 702, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 'Ironspine - In Combat - Cast Curse of Weakness');
INSERT INTO smart_scripts VALUES (6489, 0, 2, 0, 0, 0, 100, 0, 2000, 3000, 25000, 25000, 11, 3815, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ironspine - In Combat - Cast Poison Cloud');

-- Fallen Champion (6488)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6488;
DELETE FROM smart_scripts WHERE entryorguid=6488 AND source_type=0;
INSERT INTO smart_scripts VALUES (6488, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6488, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 6000, 14000, 11, 19642, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Cleave');
INSERT INTO smart_scripts VALUES (6488, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 19644, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Strike');
INSERT INTO smart_scripts VALUES (6488, 0, 3, 0, 0, 0, 100, 0, 10000, 10000, 30000, 30000, 11, 21949, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Rend');

-- Azshir the Sleepless (6490)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=6490);
DELETE FROM creature WHERE id=6490;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(554, 6490, 189, 1, 1, 0, 0, 1850.97, 1392.82, 20.4821, 3.13054, 300, 0, 0, 2664, 1870, 0, 0, 0, 0);

-- Tethis http://wotlk.openwow.com/npc=730
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=730;

-- King Bangalash http://www.wowhead.com/npc=731/king-bangalash
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=731;

-- Frostwave Lieutenant SAI
SET @ENTRY := 26116;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,122,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frostwave Lieutenant - On Aggro - Cast 'Frost Nova'"),
(@ENTRY,0,1,0,0,0,100,0,2000,2000,15000,16000,11,8056,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frostwave Lieutenant - In Combat - Cast 'Frost Shock'");
-- Hailstone Lieutenant SAI
SET @ENTRY := 26178;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5276,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailstone Lieutenant - Between 0-50% Health - Cast 'Freeze' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,16000,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailstone Lieutenant - In Combat - Cast 'Knockdown'");
-- Chillwind Lieutenant SAI
SET @ENTRY := 26204;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,16000,20000,11,6982,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chillwind Lieutenant - In Combat - Cast 'Gust of Wind'"),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,9000,10000,11,23115,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chillwind Lieutenant - In Combat - Cast 'Frost Shock'");
-- Frigid Lieutenant SAI
SET @ENTRY := 26214;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,8000,15000,11,3131,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frigid Lieutenant - In Combat - Cast 'Frost Breath'");
-- Glacial Lieutenant SAI
SET @ENTRY := 26215;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,14907,0,0,0,0,0,2,0,0,0,0,0,0,0,"Glacial Lieutenant - On Aggro - Cast 'Frost Nova'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,9000,12000,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,"Glacial Lieutenant - In Combat - Cast 'Frost Shock'");
 
 
/* 
*/ 
-- 
-- "Sea Wolf" MacKinley SAI
SET @ENTRY := 2501;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,609,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sea Wolf MacKinley - On Quest 'Voodoo Dues' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 250100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2501;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2501, 0, 0, '%s tries opening Maury\'s Clubbed Foot...', 16, 0, 100, 0, 0, 0, 'MacKinley'),
(2501, 1, 0, 'Bah! $N, this foot won\'t budge!', 12, 0, 100, 0, 0, 0, 'MacKinley');

-- 
-- 
-- Zelot Event Sdt
DELETE FROM `gameobject` WHERE `id`=180105;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES 
(2134506, 180105, 0, 0, 0, 1, 1, -11823.3, 1244.24, 2.02101, 2.63221, 0, 0, 0.967741, 0.251949, 300, 0, 1, 0);

-- Exzhal SAI
SET @ENTRY := 14910;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,600000,600000,53,0,14910,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - Out of Combat - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,3,14910,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,7,14910,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Waypoint 7 Reached - Run Script");

DELETE FROM `waypoints` WHERE `entry`=14910;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(14910, 1, -11826.5, 1249.88, 2.45471, 'Exzhal'),
(14910, 2, -11830.1, 1253.57, 2.25573, 'Exzhal'),
(14910, 3, -11832.6, 1255.68, 2.21323, 'Exzhal'),
(14910, 4, -11829.2, 1253.21, 2.25743, 'Exzhal'),
(14910, 5, -11825.7, 1250.48, 2.46781, 'Exzhal'),
(14910, 6, -11828.2, 1246.82, 2.31921, 'Exzhal'),
(14910, 7, -11827.8, 1246.61, 2.30972, 'Exzhal');

-- Actionlist SAI
SET @ENTRY := 1491000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,14911,20,0,0,0,0,0,"On Script - Say Line 0");

-- Actionlist SAI
SET @ENTRY := 1491001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,19,14911,20,0,0,0,0,0,"Exzhal - On Script - Set Data 1 1"),
(@ENTRY,9,1,0,0,0,100,0,15000,15000,0,0,45,2,2,0,0,0,0,19,14911,20,0,0,0,0,0,"Exzhal - On Script - Set Data 2 2"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Set Data 2 2"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,1,1,2000,0,0,0,0,1,14911,20,0,0,0,0,0,"Exzhal - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,0,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 0"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,2,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,45,3,3,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Set Data 3 3"),
(@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,1,3,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 3"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 1"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,4,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 4"),
(@ENTRY,9,10,0,0,0,100,0,5000,5000,0,0,1,2,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 2"),
(@ENTRY,9,11,0,0,0,100,0,2000,2000,0,0,1,3,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 3"),
(@ENTRY,9,12,0,0,0,100,0,5000,5000,0,0,1,5,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 5"),
(@ENTRY,9,13,0,0,0,100,0,5000,5000,0,0,1,2,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 2"),
(@ENTRY,9,14,0,0,0,100,0,2000,2000,0,0,1,4,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 4"),
(@ENTRY,9,15,0,0,0,100,0,5000,5000,0,0,1,5,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 5"),
(@ENTRY,9,16,0,0,0,100,0,5000,5000,0,0,1,6,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 6"),
(@ENTRY,9,17,0,0,0,100,0,5000,5000,0,0,1,6,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 6"),
(@ENTRY,9,18,0,0,0,100,0,2000,2000,0,0,1,7,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 7"),
(@ENTRY,9,19,0,0,0,100,0,5000,5000,0,0,1,8,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 8"),
(@ENTRY,9,20,0,0,0,100,0,5000,5000,0,0,1,9,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 9"),
(@ENTRY,9,21,0,0,0,100,0,5000,5000,0,0,1,7,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 7"),
(@ENTRY,9,22,0,0,0,100,0,5000,5000,0,0,1,2,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 2"),
(@ENTRY,9,23,0,0,0,100,0,2000,2000,0,0,1,10,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 10"),
(@ENTRY,9,24,0,0,0,100,0,5000,5000,0,0,1,11,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 11"),
(@ENTRY,9,25,0,0,0,100,0,5000,5000,0,0,1,12,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 12"),
(@ENTRY,9,26,0,0,0,100,0,2000,2000,0,0,1,13,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 13"),
(@ENTRY,9,27,0,0,0,100,0,5000,5000,0,0,1,8,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 8"),
(@ENTRY,9,28,0,0,0,100,0,5000,5000,0,0,1,14,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 14"),
(@ENTRY,9,29,0,0,0,100,0,2000,2000,0,0,11,23950,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Cast 'Exzhal Searches for Wild Gods DND'"),
(@ENTRY,9,30,0,0,0,100,0,0,0,0,0,1,9,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Exzhal - On Script - Say Line 9"),
(@ENTRY,9,31,0,0,0,100,0,5000,5000,0,0,1,15,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 15"),
(@ENTRY,9,32,0,0,0,100,0,5000,5000,0,0,1,16,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 16"),
(@ENTRY,9,33,0,0,0,100,0,5000,5000,0,0,1,17,2000,0,0,0,0,19,14912,20,0,0,0,0,0,"Exzhal - On Script - Say Line 17"),
(@ENTRY,9,34,0,0,0,100,0,5000,5000,0,0,45,4,4,0,0,0,0,19,14911,20,0,0,0,0,0,"Exzhal - On Script - Set Data 4 4");

-- Zandalar Enforcer SAI
SET @ENTRY := 14911;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zandalar Enforcer - On Data Set 1 1 - Set Run Off"),
(@ENTRY,0,1,2,61,0,100,0,1,1,0,0,9,0,0,0,0,0,0,20,180104,20,0,0,0,0,0,"Zandalar Enforcer - On Data Set 1 1 - Activate Gameobject"),
(@ENTRY,0,2,3,61,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,-11819.1,1242.81,1.7513,0,"Zandalar Enforcer - On Data Set 1 1 - Move To Position"),
(@ENTRY,0,3,4,61,0,100,0,1,1,0,0,45,1,1,0,0,0,0,19,14912,20,0,0,0,0,0,"Zandalar Enforcer - On Data Set 1 1 - Set Data 1 1"),
(@ENTRY,0,4,0,61,0,100,0,1,1,0,0,1,1,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Zandalar Enforcer - On Data Set 1 1 - Say Line 1"),
(@ENTRY,0,5,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.70683,"Zandalar Enforcer - On Data Set 2 2 - Set Orientation 2,70683"),
(@ENTRY,0,6,7,38,0,100,0,4,4,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zandalar Enforcer - On Data Set 4 4 - Play Emote 36"),
(@ENTRY,0,7,8,61,0,100,0,4,4,0,0,51,0,0,0,0,0,0,19,14912,20,0,0,0,0,0,"Zandalar Enforcer - On Data Set 4 4 - Kill Target"),
(@ENTRY,0,8,9,61,0,100,0,4,4,0,0,1,2,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Zandalar Enforcer - On Data Set 4 4 - Say Line 2"),
(@ENTRY,0,9,0,61,0,100,0,4,4,0,0,53,0,14911,0,0,0,0,1,0,0,0,0,0,0,0,"Zandalar Enforcer - On Data Set 4 4 - Start Waypoint");

DELETE FROM `waypoints` WHERE `entry`=14911;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(14911, 1, -11820.1, 1245.06, 2.06946, 'Envorcer'),
(14911, 2, -11827.9, 1252.08, 2.36752, 'Envorcer'),
(14911, 3, -11835.8, 1258.33, 2.14388, 'Envorcer'),
(14911, 4, -11834.8, 1257.81, 2.14911, 'Envorcer');

-- Captured Hakkari Zealot SAI
SET @ENTRY := 14912;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Data Set 1 1 - Set Run Off"),
(@ENTRY,0,1,0,61,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,-11822.2,1246.72,2.283,0,"Captured Hakkari Zealot - On Data Set 1 1 - Move To Position"),
(@ENTRY,0,2,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.40329,"Captured Hakkari Zealot - On Data Set 2 2 - Set Orientation 4.40329"),
(@ENTRY,0,3,0,38,0,100,0,3,3,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Data Set 3 3 - Set Flag Standstate Kneel"),
(@ENTRY,0,4,0,25,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Reset - Remove Flag Standstate Kneel"),
(@ENTRY,0,5,6,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Just Died - set respawntime 60 seconds");

UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry`=14912;
DELETE FROM `creature_text` WHERE `entry`=14911;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(14911, 0, 0, 'Right away, Servitor.', 12, 14, 100, 0, 0, 0, 10307, 'Zandalar Enforcer'),
(14911, 1, 0, 'Move!', 12, 14, 100, 0, 0, 0, 10308, 'Zandalar Enforcer'),
(14911, 2, 0, '%s spits on the corpse of the fallen zealot.', 16, 0, 100, 0, 0, 0, 10336, 'Zandalar Enforcer');

DELETE FROM `creature_text` WHERE `entry`=14910;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(14910, 0, 0, 'Guard, Bring forth the prisoner. Place him in the Circle of Binding.', 14, 0, 100, 0, 0, 0, 10306, 'Exzhal'),
(14910, 1, 0, 'Kneel, heathen.', 12, 14, 100, 0, 0, 0, 10309, 'Exzhal'),
(14910, 2, 0, 'I said KNEEL!', 14, 0, 100, 0, 0, 0, 10311, 'Exzhal'),
(14910, 3, 0, 'Do you know who I am, zealot?', 12, 0, 100, 0, 0, 0, 10312, 'Exzhal'),
(14910, 4, 0, 'I could crush you with but a single motion. Do not anger me.', 12, 0, 100, 0, 0, 0, 10314, 'Exzhal'),
(14910, 5, 0, 'So Hakkar has returned?', 12, 0, 100, 0, 0, 0, 10317, 'Exzhal'),
(14910, 6, 0, 'We will never allow it... We have banished him from our world before and we will banish him again.', 12, 0, 100, 0, 0, 0, 10320, 'Exzhal'),
(14910, 7, 0, 'Times have changed. The young races will join us. You will never succeed.', 14, 0, 100, 0, 0, 0, 10325, 'Exzhal'),
(14910, 8, 0, 'The Primal Gods? Impossible!', 12, 0, 100, 0, 0, 0, 10330, 'Exzhal'),
(14910, 9, 0, '%s uses his index finger to make a cutting motion across his neck.', 16, 0, 100, 0, 0, 0, 10332, 'Exzhal');

DELETE FROM `creature_text` WHERE `entry`=14912;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(14912, 0, 0, 'Curious. A Servitor of Rastakhan that does not know the Hakkari do not converse in the old tongue?', 12, 0, 100, 0, 0, 0, 10310, 'Captured Hakkari Zealot'),
(14912, 1, 0, 'You are a fool, soon to forfeit his life. No?', 12, 0, 100, 0, 0, 0, 10313, 'Captured Hakkari Zealot'),
(14912, 2, 0, '%s laughs.', 16, 0, 100, 0, 0, 0, 2047, 'Captured Hakkari Zealot'),
(14912, 3, 0, 'How pathetic. I am infused with the power of the Soulflayer. I fear nothing but the wrath of the almighty Hakkar. I serve no one but my master, Jin.', 12, 0, 100, 0, 0, 0, 10316, 'Captured Hakkari Zealot'),
(14912, 4, 0, 'Do you really need to ask? Can you not feel him? Has the almighty King Rastakhan sent his Servitor and Hand here on a mission of diplomacy?', 12, 0, 100, 0, 0, 0, 10318, 'Captured Hakkari Zealot'),
(14912, 5, 0, 'Oh yes, old one, Hakkar has returned. Soon the world shall crumble beneath his might. Consumed. Left in ruin...', 12, 0, 100, 0, 0, 0, 10319, 'Captured Hakkari Zealot'),
(14912, 6, 0, '%s laughs maniacally.', 16, 0, 100, 0, 0, 0, 10321, 'Captured Hakkari Zealot'),
(14912, 7, 0, 'FOOL! Do you purport to have even one-tenth of the power you held during the Uprising? The nations were united and still were nearly consumed by a shadow of Hakkar. You stand no chance.', 12, 0, 100, 0, 0, 0, 10322, 'Captured Hakkari Zealot'),
(14912, 8, 0, 'And now, even those nations that you would have called allies have recoiled and joined forces with us... Yes, old one, do not look so surprised.', 12, 0, 100, 0, 0, 0, 10323, 'Captured Hakkari Zealot'),
(14912, 9, 0, 'Bloodscalp, Sandfury, Skullsplitter, Vilebranch and Witherbark. They all pledge their allegiance to Jin - their souls to Hakkar. You have lost.', 12, 0, 100, 0, 0, 0, 10324, 'Captured Hakkari Zealot'),
(14912, 10, 0, 'The young races? The infants? Humans? Orcs? Dwarves? You expect to defeat the Hakkari? To destroy a GOD?', 12, 0, 100, 0, 0, 0, 10326, 'Captured Hakkari Zealot'),
(14912, 11, 0, 'It shall NEVER happen. We are legion. We are united. Where are your heroes? Vol''jin sits in sanctuary at the side of the young Warchief, unaware. Zul''jin missing, probably dead.', 12, 0, 100, 0, 0, 0, 10327, 'Captured Hakkari Zealot'),
(14912, 12, 0, 'And... do you expect to defeat the Primal Gods?', 12, 0, 100, 0, 0, 0, 10328, 'Captured Hakkari Zealot'),
(14912, 13, 0, '%s smirks.', 16, 0, 100, 0, 0, 0, 10329, 'Captured Hakkari Zealot'),
(14912, 14, 0, 'Is it? Call out to them, Servitor.', 12, 0, 100, 0, 0, 0, 10331, 'Captured Hakkari Zealot'),
(14912, 15, 0, 'Where are your Gods now? WHERE, SERVITOR?', 12, 0, 100, 0, 0, 0, 10333, 'Captured Hakkari Zealot'),
(14912, 16, 0, 'Strike me down. I shall be reborn... Even more powerful...', 12, 0, 100, 0, 0, 0, 10334, 'Captured Hakkari Zealot'),
(14912, 17, 0, '%s drops his shoulders and exposes his neck.', 16, 0, 100, 0, 0, 0, 10335, 'Captured Hakkari Zealot');
UPDATE `creature_text` SET `emote`=1, `duration`=1000 WHERE  `entry` IN (14910, 14912, 14911);
UPDATE `gameobject_template` SET `data2`=5000 WHERE  `entry`=180104;
-- 
-- 
-- Mebok Mizzyrix SAI [H] - http://www.wowhead.com/npc=3446/mebok-mizzyrix
SET @ENTRY := 3446;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,865,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Quest 'Raptor Horns' Finished - Run Script"),
(@ENTRY,0,1,0,19,0,100,0,1221,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Quest 'Blueleaf Tubers' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 344600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,11,17550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Cast 'Purification'"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,5,34,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Play Emote 34"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 344601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,21,20,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Say Line 4"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-929.023,-3696.98,7.97395,1.7352,"Mebok Mizzyrix - On Script - Move To Position"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mebok Mizzyrix - On Script - Play Emote 25"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,-928.778,-3697.25,7.99705,6.17741,"Mebok Mizzyrix - On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-928.982,-3697.23,8.06642,3.08923,"Mebok Mizzyrix - On Script - Move To Position");

SET @ENTRY := 3446;

DELETE FROM `creature_text` WHERE `entry`= @ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@ENTRY,0,0,"Now let's try it...",   12,0,100, 7,0,0,2078,0,'Mebok Mizzyrix on Quest 865 rewarded'),
(@ENTRY,1,0,"Ugh!  That's terrible!",12,0,100,33,0,0,2079,0,'Mebok Mizzyrix on Quest 865 rewarded'),
(@ENTRY,4,0,'Hey $N! Don\'t forget to grab a crate, a manual and a command stick!', 12, 0, 100, 0, 0, 0, 1788, 0, 'Mebok Mizzyrix on Quest 865 rewarded');

-- Argent Guard Thaelrid
UPDATE `creature_template` SET `unit_flags`='512', `faction`='35' WHERE  `entry`=4787;

-- Stinglasher - http://www.wowhead.com/npc=14661/stinglasher
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x20000000 WHERE  `entry`=14661;
UPDATE `creature` SET `MovementType`=0 WHERE  `guid`=50074;
UPDATE `creature_addon` SET `path_id`=0 WHERE  `guid`=50074;
DELETE FROM `waypoint_data` WHERE `id`=500740;

-- Knot Thimblejack
DELETE FROM `creature` WHERE `id`=14338;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(213755, 14338, 429, 0, 0, 1, 1, 0, 0, 581.198, 523.249, -25.4026, 3.5032, 1000000, 0, 0, 2215, 0, 0, 0, 0, 0, 0);

-- Kruban Darkblade (ID: 14843)
DELETE FROM `game_event` WHERE `eventEntry`=110;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`, `announce`) VALUES 
(110, '2014-01-02 00:01:00', '2020-12-28 06:00:00', 131040, 4320, 0, 'Kruban Darkblade (Mulgore)- Building Up', 0, 2);
DELETE FROM `game_event_creature` WHERE `guid`=54395;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(110, 54395);

SET @NPC := 54395;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH, 1, 1655.08, -4419.68, 16.5508, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 1665.29, -4410.1, 17.5011, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 1675, -4400.03, 19.5435, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 1682, -4392.2, 21.6826, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 1688.96, -4384.34, 24.3434, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 1703.03, -4370.72, 25.8188, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 1715.13, -4360.12, 27.4335, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 1718.12, -4345.2, 26.4889, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 1715.72, -4331.33, 22.7541, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 1710.78, -4322.08, 19.0335, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 1702.2, -4311.05, 13.3393, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 1695.01, -4304.19, 9.83699, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 1683.52, -4299.75, 5.41857, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 1673.3, -4299.6, 2.86653, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 1656.62, -4304.8, 1.21106, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 1649.62, -4308.73, 0.893883, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 1639.56, -4318.45, 0.729914, 0, 0, 0, 0, 100, 0),
(@PATH, 18, 1631.45, -4325.11, 1.08178, 0, 0, 0, 0, 100, 0),
(@PATH, 19, 1619.7, -4330.62, 2.08178, 0, 0, 0, 0, 100, 0),
(@PATH, 20, 1605.3, -4337.13, 2.11894, 0, 0, 0, 0, 100, 0),
(@PATH, 21, 1597.35, -4346.65, 1.85579, 0, 0, 0, 0, 100, 0),
(@PATH, 22, 1598.76, -4352.92, 3.49681, 0, 0, 0, 0, 100, 0),
(@PATH, 23, 1604.88, -4361.45, 8.18655, 0, 0, 0, 0, 100, 0),
(@PATH, 24, 1606.23, -4370.79, 9.54036, 0, 0, 0, 0, 100, 0),
(@PATH, 25, 1604.84, -4380.24, 9.85954, 0, 0, 0, 0, 100, 0),
(@PATH, 26, 1610.06, -4390.94, 10.3995, 0, 0, 0, 0, 100, 0),
(@PATH, 27, 1621.34, -4396.69, 11.6895, 0, 0, 0, 0, 100, 0),
(@PATH, 28, 1632.07, -4402.99, 15.6502, 0, 0, 0, 0, 100, 0),
(@PATH, 29, 1638.73, -4411.09, 16.7887, 0, 0, 0, 0, 100, 0),
(@PATH, 30, 1646.91, -4422.45, 15.9479, 0, 0, 0, 0, 100, 0),
(@PATH, 31, 1651.78, -4422.32, 16.178, 0, 0, 0, 0, 100, 0);

-- Melnan Darkstone
DELETE FROM `creature` WHERE `guid`=3107344;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(3107344, 14842, 0, 1, 1, 0, 0, -4917.77, -951.327, 501.508, 3.88213, 300, 0, 0, 955, 0, 0, 0, 0, 0);
 
DELETE FROM `game_event_creature` WHERE `eventEntry`=4 AND `guid`=3107344;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(4, 3107344);
 
 -- The Swarm Grows 
SET @FIRSTBUG   := 3107103;
DELETE FROM `creature` WHERE `guid` BETWEEN @FIRSTBUG AND @FIRSTBUG+5 AND `id`=4131;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@FIRSTBUG, 4131, 1, 1, 1, 11143, 0, -6410.51, -3488.5, -71.1379, 3.93507, 300, 5, 0, 1280, 0, 1, 0, 0, 0),
(@FIRSTBUG+1, 4131, 1, 1, 1, 11143, 0, -6543.58, -3471.38, -80.4753, 0.418449, 300, 5, 0, 1280, 0, 1, 0, 0, 0),
(@FIRSTBUG+2, 4131, 1, 1, 1, 11143, 0, -6504.13, -3438.54, -70.034, 0.889688, 300, 3, 0, 1342, 0, 1, 0, 0, 0),
(@FIRSTBUG+3, 4131, 1, 1, 1, 11143, 0, -6479.96, -3285.22, -109.381, 5.2993, 300, 4, 0, 1280, 0, 1, 0, 0, 0),
(@FIRSTBUG+4, 4131, 1, 1, 1, 11143, 0, -6445.73, -3290.01, -105.235, 3.03068, 300, 5, 0, 1342, 0, 1, 0, 0, 0),
(@FIRSTBUG+5, 4131, 1, 1, 1, 11143, 0, -6375.22, -3460.83, -77.5705, 2.96746, 300, 4, 0, 1342, 0, 1, 0, 0, 0);

-- Rivern Frostwind - http://wotlk.openwow.com/npc=10618
DELETE FROM `player_factionchange_reputations` WHERE `alliance_id`= 589;
INSERT INTO `player_factionchange_reputations` (`alliance_id`, `horde_id`) VALUES 
(589, 1137);

-- Ashenvale Outrunner SAI
SET @ENTRY := 12856;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Ashenvale Outrunner - Combat CMC - Cast 'Shoot'"),
(@ENTRY,0,1,0,9,0,100,0,5,30,35900,52300,11,18545,1,0,0,0,0,2,0,0,0,0,0,0,0,"Ashenvale Outrunner - Within 5-30 Range - Cast 'Scorpid Sting'"),
(@ENTRY,0,2,0,9,0,100,0,0,5,7100,15300,11,8646,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ashenvale Outrunner - Within 0-5 Range - Cast 'Snap Kick'"),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,75,20540,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassian Scout - On Reset - Cast 'Stealth'"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,28,20540,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassian Scout - On Aggro - Remove Aura 'Stealth'");

-- Battleguard Sartura -- http://wotlk.openwow.com/npc=15516
UPDATE `creature_template` SET `BaseAttackTime`=1200 WHERE  `entry`=15516;

-- Stormscale Sorceress SAI -- http://wotlk.openwow.com/npc=2182
SET @ENTRY := 2182;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1800000,1800000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormscale Sorceress - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,2,0,0,0,100,0,0,0,2300,3900,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,"Stormscale Sorceress - In Combat - Cast 'Frostbolt'");

-- DB/Creature: Restless Spirit of Earth - http://wotlk.openwow.com/npc=17179
UPDATE `creature` SET `spawntimesecs`=240 WHERE  `id`=17179;

-- DB/Creature: Morin Cloudstalker -- http://wotlk.openwow.com/npc=2988
DELETE FROM `creature_addon` WHERE `guid`=26577;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (26577, 265770, 0, 0, 1, 0, '');
UPDATE `creature` SET `MovementType`=2 WHERE  `guid`=26577;
DELETE FROM `waypoint_data` WHERE `id`=265770;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(265770, 1, -2369.16, -876.936, -9.42208, 0, 0, 0, 0, 100, 0),
(265770, 2, -2366.53, -856.691, -9.36085, 0, 0, 0, 0, 100, 0),
(265770, 3, -2357.15, -811.864, -9.42138, 0, 0, 0, 0, 100, 0),
(265770, 4, -2345.23, -748.967, -9.42454, 0, 0, 0, 0, 100, 0),
(265770, 5, -2341.13, -700.582, -9.29519, 0, 0, 0, 0, 100, 0),
(265770, 6, -2335.57, -673.555, -9.41523, 0, 0, 0, 0, 100, 0),
(265770, 7, -2323.8, -641.711, -9.34184, 0, 0, 0, 0, 100, 0),
(265770, 8, -2310.09, -613.217, -9.42431, 0, 0, 0, 0, 100, 0),
(265770, 9, -2295.38, -586.808, -9.4231, 2.39676, 21600, 0, 0, 100, 0),
(265770, 10, -2323.09, -595.375, -9.42242, 0, 0, 0, 0, 100, 0),
(265770, 11, -2312.27, -614.66, -9.42405, 0, 0, 0, 0, 100, 0),
(265770, 12, -2326.41, -645.536, -9.34993, 0, 0, 0, 0, 100, 0),
(265770, 13, -2336.51, -676.214, -9.40864, 0, 0, 0, 0, 100, 0),
(265770, 14, -2344.05, -723.843, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 15, -2346.75, -760.367, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 16, -2357.56, -811.652, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 17, -2366.12, -855.675, -9.32695, 0, 0, 0, 0, 100, 0),
(265770, 18, -2376.83, -896.428, -9.39643, 6.2165, 21600, 0, 0, 100, 0);
 
 
/* 
*/ 
-- -------------------------------------------
-- BOREAN TUNDRA
-- -------------------------------------------


-- Winterfin Tadpole text  -- http://www.wowhead.com/npc=25201/winterfin-tadpole
SET @ENTRY:= 25201;
DELETE FROM `creature_text` WHERE `entry` = @ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(@ENTRY, 0, 0, '$G Da-da : Ma-ma;?', 12, 0, 100, 35, 0, 0, 24446, 0, 'Winterfin Tadpole'),
(@ENTRY, 1, 0, 'Alurglgl..', 12, 0, 100, 0, 0, 0, 24447, 0,'Winterfin Tadpole');


-- Winterfin Tadpole spawns
SET @GUID:= 145042;

DELETE FROM `creature` WHERE `id`=@ENTRY;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@GUID,   @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3956.90, 6367.73, 11.2895, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+1, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3957.40, 6368.23, 11.2895, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+2, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3957.40, 6367.23, 11.2895, -1.29154, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+3, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3956.40, 6368.23, 11.2895, -2.28638, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+4, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3956.40, 6367.23, 11.2895, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+5, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4176.06, 6243.41, 8.2004, -1.29154, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+6, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4176.56, 6243.91, 8.2004, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+7, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4176.56, 6242.91, 8.2004, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+8, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4175.56, 6243.91, 8.2004, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+9, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4298.07, 6206.28, 0.487122, -2.28638, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+10, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4298.57, 6206.78, 0.487122, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+11, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4298.57, 6205.78, 0.487122, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+12, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3932.65, 6394.14, 11.2002, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+13, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3933.15, 6394.64, 11.2002, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+14, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3933.15, 6393.64, 11.2002, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+15, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3932.15, 6394.64, 11.2002, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+16, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3932.15, 6393.64, 11.2002, 1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+17, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4031.30, 6332.22, 8.90955, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+18, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4031.80, 6332.72, 8.90955, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+19, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4031.80, 6331.72, 8.90955, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+20, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4030.80, 6332.72, 8.90955, -1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+21, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4283.26, 6297.99, 0.404293, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+22, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4283.76, 6298.49, 0.404293, 0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+23, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4283.76, 6297.49, 0.404293, 1.8325, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+24, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4231.63, 6183.1, 1.05165, 1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+25, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4232.13, 6183.6, 1.05165, -1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+26, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4232.13, 6182.6, 1.05165, -1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+27, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4231.13, 6183.6, 1.05165, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+28, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4231.13, 6182.6, 1.05165, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+29, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4161.53, 6188.07, 9.17654, -1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+30, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4162.03, 6188.57, 9.17654,  1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+31, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4162.03, 6187.57, 9.17654, 0.366518, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+32, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4161.03, 6188.57, 9.17654, 1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+33, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4062.06, 6253.62, 21.8839, 0.366518, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+34, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4061.06, 6254.62, 21.8839, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+35, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4061.06, 6253.62, 21.8839, -1.22173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+36, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4296.52, 6250.31, 0.182616, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+37, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4297.02, 6250.81, 0.182616, -1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+38, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4297.02, 6249.81, 0.182616, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+39, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4296.02, 6250.81, 0.182616, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+40, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4296.02, 6249.81, 0.182616, -2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+41, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3984.93, 6343.08, 7.85525, -1.22173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+42, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3985.43, 6343.58, 7.85525, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+43, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3985.43, 6342.58, 7.85525, - 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+44, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3984.43, 6342.58, 7.85525, 2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+45, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3986.92, 6481.15, 21.8128, -2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+46, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3987.42, 6481.65, 21.8128, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+47, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3986.42, 6480.65, 21.8128, 0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+48, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4180.65, 6308.74, 13.0965, -2.1293, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+49, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4181.15, 6309.24, 13.0965, 2.1293, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+50, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4181.15, 6308.24, 13.0965, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+51, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4180.15, 6309.24, 13.0965, 0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+52, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4180.15, 6308.24, 13.0965, 1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+53, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4225.75, 6230.07, 0.987369, -2.87979, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+54, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4226.25, 6230.57, 0.987369, 1.87979, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+55, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4226.25, 6239.57, 0.987369, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+56, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4225.25, 6239.57, 0.987369, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+57, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3997.79, 6282.02, 7.97459, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+58, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3997.29, 6282.52, 7.97459, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+59, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3997.29, 6281.52, 7.97459, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+60, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4104.50, 6300.65, 23.2685, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+61, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4105.00, 6301.15, 23.2685, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+62, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4105.00, 6300.15, 23.2685, -2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+63, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4104.00, 6301.15, 23.2685, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+64, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4104.00, 6300.15, 23.2685, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+65, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4052.17, 6298.94, 2.58589, 1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+66, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4052.17, 6297.94, 2.58589, 1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+67, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4051.17, 6298.94, 2.58589, -1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+68, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4051.17, 6297.94, 2.58589, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+69, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3830.89, 6424.93, 21.8597, -2.11185, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+70, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3831.39, 6425.43, 21.8597, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+71, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3831.39, 6424.43, 21.8597, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+72, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4038.38, 6468.67, 22.2306, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+73, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4038.88, 6469.17, 22.2306, -1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+74, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4038.88, 6468.17, 22.2306, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+75, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4037.88, 6469.17, 22.2306, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+76, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4037.88, 6468.17, 22.2306, 2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+77, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3973.45, 6313.41, 7.9676, -1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+78, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3973.95, 6313.91, 7.9676, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+79, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3973.95, 6312.91, 7.9676, 1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+80, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 3972.95, 6312.91, 7.9676, -1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+81, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4271.32, 6400.22, 0.4071, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+82, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4270.32, 6401.22, 0.4071, -1.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+83, @ENTRY, 571, 0, 0, 1, 1, 22987, 0, 4270.32, 6400.22, 0.4071, -1.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0);

-- Marsh Caribous (dead) around Karen the Kuller
UPDATE `creature` SET `MovementType`='0', `dynamicflags`='32', `unit_flags`='33555200', `spawndist`='0' WHERE `guid`IN (103024,103025,103026,103027,103028) AND  `id`=25680;


-- Karen "I Don't Caribou" the Culler (25803)
SET @ENTRY :=25803;
UPDATE `creature` SET `MovementType`='0', `orientation`=0.7 WHERE `id`=@ENTRY;

-- Karen "I Don't Caribou" the Culler SAI
UPDATE `creature_template` SET AIName='SmartAI', ScriptName='' WHERE entry=@ENTRY;
DELETE FROM `smart_scripts` WHERE entryorguid IN(@ENTRY,@ENTRY*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 8000, 10000, 10000, 15000, 11, 42724, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - In Combat - Cast Cleave'),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 4000, 4000, 15000, 21000, 11, 48280, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - In Combat - Cast Whirlwind'),
(@ENTRY, 0, 2, 0, 9, 0, 100, 0, 8, 25, 10000, 10000, 11, 27577, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - Within Range 8-25yd - Cast Intercept'),
(@ENTRY, 0, 3, 0, 1, 0, 100, 0, 1000, 2000, 300000, 360000, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - OOC - Start WP'),
(@ENTRY, 0, 4, 5, 40, 0, 100, 0, 1, 0, 0, 0, 54, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - WP 1 - Pause WP'),
(@ENTRY, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 5.718607, 'Karen "I Don''t Caribou" the Culler - Link - Set Orientation'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48141, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - Link - Cast Cannibalize Meat Visual'),
(@ENTRY, 0, 7, 0, 40, 0, 100, 0, 2, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Karen "I Don''t Caribou" the Culler - WP 2 - Go Home');

-- Loot Crazed Poacher (the two guarding Karen)
DELETE FROM `creature` WHERE `guid`IN(132927,132928);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(132927, 25806, 571, 0, 0, 1, 1, 23391, 1, 2721.595215, 5272.994141, 71.021484, 0.7, 300, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
(132928, 25806, 571, 0, 0, 1, 1, 23391, 1, 2726.572266, 5264.083008, 71.521576, 0.7, 300, 0, 0, 7984, 0, 0, 0, 0, 0, 0);

-- Karen "I Don't Caribou" the Culler WP for her mini event
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@ENTRY, 1, 2735.346924, 5276.308594, 71.105652, 'Karen the Culler'),
(@ENTRY, 2, 2730.85, 5273.42, 71.247, 'Karen the Culler');

-- Crafty Wobblesprocket SAI
SET @ENTRY := 25477;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=6;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,6,0,64,0,100,0,0,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crafty Wobblesprocket - On Gossip Hello - Pause Waypoint");
 
 
/* 
*/ 
-- -------------------------------------------
-- Dalaran
-- -------------------------------------------
-- Civilian flag for guards in Dalaran
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|768, `flags_extra`=`flags_extra`|2 WHERE `entry` IN (32724,32722,29636,28989,29476,29493,32690,32725,32723,32653,34244,29547,29715,32680,29548,32337,32688,32679,32216,28951,32675,32691,29496,28991,29499,29497,30659,29156,28958,28956,28774,28776,30726,29528,32527,29529,28994,29494,28692,28691,35500,35497,29523,28992,28742,32683,32686,30607,30608,30605,30606,30604,29528,29527,29529,32681,32685,32287,28995,35496,29491,29702,29495,29702,36856,28693,32514,28714,29628,28706,29640,32651,32652,32650,38699,28726,29512,29511,28701,28721,32172,28699,28726,28696,28700,28718,29507,29508,29509,32515,32677,32684,28697,28722,29514,29513,28728,28698,28703,28725,28701,28721,32172,28716,29506,29505,28694,34252,28997,35498,28990,28704,28727,32693,32678,28702,28723,33027,29641,29716,29478,29491,35496,28995,28687,32411,32680,32676,29548,28708,32451,29282,28675,28677,28676,32337,32688,32679,32216,28951,28690,32687,32692,28160,32732,32730,36776,32727,32726,32516,32731,32729,32451,9636,28715,32733,32728);
 
 
/* 
*/ 
-- -------------------------------------------
-- DRAGONBLIGHT
-- -------------------------------------------

-- Quartermaster Bartlett -- http://www.wowhead.com/npc=27267/quartermaster-bartlett
-- Adding repair Gossip option

UPDATE `creature_template` SET `gossip_menu_id`=9487 WHERE `entry`=27267;

DELETE FROM `gossip_menu` WHERE `entry`=9487 AND `text_id`=12759;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9487,12759);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9487 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9487,0,1,'Let me browse your goods.',3,128,0,0,0,0,'');


-- Respawn all spawns for: -- Risen Wintergarde Defender http://www.wowhead.com/npc=27284/risen-wintergarde-defender
--                         -- Risen Wintergarde Miner http://www.wowhead.com/npc=27401/risen-wintergarde-miner
-- Adding SAI, Pathing for both and emote to the Miners

SET @CGUID:=132940;
DELETE FROM `creature` WHERE `id` IN (27284,27401);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+31;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`) VALUES 
(@CGUID+0 , 27284, 571, 3970.129, -831.1373, 123.1972, 1.419617, 120, 10, 0),
(@CGUID+1 , 27284, 571, 3892.15, -898.545, 116.7031, 4.747295, 120, 0, 0), -- idle no waypoints
(@CGUID+2 , 27284, 571, 3877.338, -886.6799, 119.6563, 5.410521, 120, 0, 0), -- idle no waitpoints
(@CGUID+3 , 27284, 571, 3981.821, -915.338, 103.8165, 0.4941546, 120, 10, 0), 
(@CGUID+4 , 27284, 571, 4063.601, -863.5172, 112.0916, 3.294994, 120, 10, 0), 
(@CGUID+5 , 27284, 571, 4029.796, -817.8798, 122.6137, 5.148721, 120, 10, 0), 
(@CGUID+6 , 27284, 571, 4020.966, -913.8099, 107.1895, 1.902651, 120, 0, 0), 
(@CGUID+7 , 27401, 571, 4012.309, -778.3416, 119.4081, 5.117236, 120, 10, 0), 
(@CGUID+8 , 27401, 571, 3957.39, -879.4473, 120.6337, 1.665177, 120, 10, 0),
(@CGUID+9 , 27401, 571, 3979.763, -878.6928, 118.7674, 2.167667, 120, 0, 0),
(@CGUID+10, 27401, 571, 3891.449, -871.9622, 110.0855, 4.131083, 120, 10, 0),
(@CGUID+11, 27401, 571, 3908.99, -867.735, 108.25, 0.07704493, 120, 0, 0),
(@CGUID+12, 27401, 571, 4005.749, -911.3463, 107.528, 3.572126, 120, 10, 0),
(@CGUID+13, 27401, 571, 4018.18, -838.5659, 120.1189, 3.396627, 120, 10, 0),
(@CGUID+14, 27401, 571, 3997.235, -935.1, 104.7279, 0.895307, 120, 10, 0),
(@CGUID+15, 27401, 571, 4046.337, -872.1385, 115.5023, 2.777797, 120, 10, 0),
(@CGUID+16, 27401, 571, 4040.803, -824.1927, 119.995, 3.689994, 120, 10, 0), 
(@CGUID+17, 27401, 571, 4079.794, -860.7454, 111.5424, 3.844261, 120, 10, 0), 
(@CGUID+18, 27401, 571, 4112.891, -862.1273, 114.5041, 5.726786, 120, 0, 0),
(@CGUID+19, 27401, 571, 3962.095, -841.9584, 121.1146, 1.314913, 120, 10, 0), 
(@CGUID+20, 27401, 571, 3972.828, -817.3924, 124.1117, 1.684451, 120, 10, 0), 
(@CGUID+21, 27401, 571, 3927.054, -862.1707, 121.9197, 5.969274, 120, 10, 0), 
(@CGUID+22, 27401, 571, 3983.165, -884.7412, 117.6653, 3.801475, 120, 10, 0), 
(@CGUID+23, 27401, 571, 4000.266, -806.4115, 124.4378, 2.8901, 120, 10, 0), 
(@CGUID+24, 27401, 571, 3995.780, -802.8200, 123.5410, 4.96206, 120, 10, 0),
(@CGUID+25, 27401, 571, 4029.540, -842.3110, 117.1140, 5.81106, 120, 10, 0), 
(@CGUID+26, 27401, 571, 4063.478, -903.8126, 115.2312, 3.785855, 120, 10, 0), 
(@CGUID+27, 27401, 571, 3971.025, -913.7602, 104.5964, 1.58825, 120, 0, 0), 
(@CGUID+28, 27401, 571, 3992.506, -939.1702, 105.5502, 4.213991, 120, 0, 0), 
(@CGUID+29, 27401, 571, 3930.066, -870.2675, 104.4508, 0.4872836, 120, 10, 0), 
(@CGUID+30, 27401, 571, 3961.272, -872.5833, 104.2002, 2.95032, 120, 0, 0),
(@CGUID+31, 27401, 571, 3912.686, -865.0364, 120.8479, 6.199958, 120, 0, 0); 
UPDATE `creature` SET `MovementType`='1' WHERE `guid` IN (@CGUID+17, @CGUID+25, @CGUID+28, @CGUID+30);


-- Risen Wintergarde Defender SAI -- http://www.wowhead.com/npc=27284/risen-wintergarde-defender
SET @ENTRY := 27284;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `spell1`='51307' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,40000,60000,11,51307,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Defender - IC - Self cast Unwavering Will (No Repeat)');

-- Risen Wintergarde Miner SAI  -- http://www.wowhead.com/npc=27401/risen-wintergarde-miner
SET @ENTRY := 27401;
SET @CGUID := -132940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `spell1`='48374' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@ENTRY, @CGUID-8, @CGUID-9, @CGUID-10, @CGUID-11, @CGUID-12, @CGUID-13, @CGUID-14, @CGUID-18, @CGUID-23, @CGUID-24) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-8,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-8,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-9,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-9,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-10,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-10,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-11,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-11,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-12,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-12,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-13,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-13,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-14,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-14,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-18,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-18,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-23,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-23,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-24,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-24,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound');

-- Pathing for Risen Wintergarde Defender 1
SET @NPC := 132940;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3962.255,`position_y`=-845.7626,`position_z`=120.7226 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3962.255,-845.7626,120.7226,0,0,0,0,100,0), 
(@PATH,2,3964.674,-842.7882,121.4607,0,0,0,0,100,0), 
(@PATH,3,3967.174,-837.5382,122.2107,0,0,0,0,100,0), 
(@PATH,4,3971.408,-823.0021,124.1822,0,0,0,0,100,0), 
(@PATH,5,3972.536,-818.4142,124.181,0,0,0,0,100,0), 
(@PATH,6,3974.286,-811.9142,124.181,0,0,0,0,100,0), 
(@PATH,7,3977.374,-807.4382,123.8934,0,0,0,0,100,0), 
(@PATH,8,3990.374,-797.4382,122.8934,0,0,0,0,100,0), 
(@PATH,9,3996.358,-796.3887,122.3552,0,0,0,0,100,0), 
(@PATH,10,4002.608,-795.8887,121.8552,0,0,0,0,100,0),
(@PATH,11,4005.141,-794.809,121.2954,0,0,0,0,100,0),
(@PATH,12,3991.292,-796.7651,122.3158,0,0,0,0,100,0),
(@PATH,13,3989.065,-798.5057,122.8027,0,0,0,0,100,0),
(@PATH,14,3977.315,-807.5057,123.8027,0,0,0,0,100,0),
(@PATH,15,3973.799,-814.1797,124.0833,0,0,0,0,100,0),
(@PATH,16,3972.049,-819.9297,124.0833,0,0,0,0,100,0),
(@PATH,17,3971.736,-820.819,124.0339,0,0,0,0,100,0),
(@PATH,18,3970.236,-831.069,123.5339,0,0,0,0,100,0),
(@PATH,19,3967.212,-837.6317,122.1643,0,0,0,0,100,0),
(@PATH,20,3964.712,-842.6317,121.4143,0,0,0,0,100,0),
(@PATH,21,3955.197,-848.4968,121.6359,0,0,0,0,100,0),
(@PATH,22,3950.197,-850.4968,122.3859,0,0,0,0,100,0),
(@PATH,23,3946.476,-852.2645,122.539,0,0,0,0,100,0),
(@PATH,24,3938.226,-855.0145,122.289,0,0,0,0,100,0),
(@PATH,25,3935.217,-855.6635,122.2252,0,0,0,0,100,0),
(@PATH,26,3928.967,-856.4135,121.7252,0,0,0,0,100,0),
(@PATH,27,3935.146,-855.8206,122.0987,0,0,0,0,100,0),
(@PATH,28,3938.241,-854.9574,122.219,0,0,0,0,100,0),
(@PATH,29,3946.491,-852.2074,122.719,0,0,0,0,100,0),
(@PATH,30,3954.914,-848.747,121.6653,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 4
SET @NPC := 132943;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3954.649,`position_y`=-896.4279,`position_z`=104.172 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3954.649,-896.4279,104.172,0,0,0,0,100,0),
(@PATH,2,3956.389,-893.2208,104.3171,0,0,0,0,100,0),
(@PATH,3,3950.639,-880.2208,104.8171,0,0,0,0,100,0),
(@PATH,4,3948.071,-877.5638,104.6277,0,0,0,0,100,0),
(@PATH,5,3934.321,-870.3138,103.8777,0,0,0,0,100,0),
(@PATH,6,3933.527,-870.0614,103.9755,0,0,0,0,100,0),
(@PATH,7,3922.027,-870.3114,105.9755,0,0,0,0,100,0),
(@PATH,8,3917.903,-870.4968,106.363,0,0,0,0,100,0),
(@PATH,9,3905.903,-870.4968,108.363,0,0,0,0,100,0),
(@PATH,10,3897.389,-869.1989,109.0091,0,0,0,0,100,0),
(@PATH,11,3895.139,-868.6989,109.0091,0,0,0,0,100,0),
(@PATH,12,3893.163,-868.3932,109.3621,0,0,0,0,100,0),
(@PATH,13,3903.502,-871.1569,108.7203,0,0,0,0,100,0),
(@PATH,14,3918.319,-872.118,105.7782,0,0,0,0,100,0),
(@PATH,15,3935.749,-871.7728,103.4062,0,0,0,0,100,0),
(@PATH,16,3937.464,-872.5975,104.0017,0,0,0,0,100,0),
(@PATH,17,3946.714,-877.3475,104.5017,0,0,0,0,100,0),
(@PATH,18,3953.698,-875.124,104.5628,0,0,0,0,100,0),
(@PATH,19,3959.198,-868.874,104.0628,0,0,0,0,100,0),
(@PATH,20,3964.888,-870.4577,104.2536,0,0,0,0,100,0),
(@PATH,21,3960.319,-875.5621,104.8488,0,0,0,0,100,0),
(@PATH,22,3955.069,-879.8121,104.8488,0,0,0,0,100,0),
(@PATH,23,3953.761,-883.5623,104.9101,0,0,0,0,100,0),
(@PATH,24,3954.511,-894.0623,104.4101,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 5
SET @NPC := 132944;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4070.011,`position_y`=-911.9304,`position_z`=115.397 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4070.011,-911.9304,115.397,0,0,0,0,100,0),
(@PATH,2,4063.844,-904.7043,115.3745,0,0,0,0,100,0),
(@PATH,3,4058.64,-895.9709,115.1423,0,0,0,0,100,0),
(@PATH,4,4057.89,-894.7209,115.1423,0,0,0,0,100,0),
(@PATH,5,4055.97,-891.5008,115.2825,0,0,0,0,100,0),
(@PATH,6,4052.97,-881.5008,114.5325,0,0,0,0,100,0),
(@PATH,7,4052.165,-878.6388,114.2091,0,0,0,0,100,0),
(@PATH,8,4051.415,-864.6388,113.4591,0,0,0,0,100,0),
(@PATH,9,4054.136,-862.9764,112.8409,0,0,0,0,100,0),
(@PATH,10,4066.636,-860.9764,112.3409,0,0,0,0,100,0),
(@PATH,11,4072.034,-859.8044,112.1062,0,0,0,0,100,0),
(@PATH,12,4086.284,-857.0544,112.1062,0,0,0,0,100,0),
(@PATH,13,4091.908,-853.9102,112.7256,0,0,0,0,100,0),
(@PATH,14,4101.408,-844.1602,113.7256,0,0,0,0,100,0),
(@PATH,15,4105.021,-846.8843,114.2492,0,0,0,0,100,0),
(@PATH,16,4106.521,-848.6343,114.2492,0,0,0,0,100,0),
(@PATH,17,4109.933,-852.9023,114.737,0,0,0,0,100,0),
(@PATH,18,4111.266,-854.6176,115.0273,0,0,0,0,100,0),
(@PATH,19,4108.093,-862.4123,113.6716,0,0,0,0,100,0),
(@PATH,20,4093.593,-861.4123,113.6716,0,0,0,0,100,0),
(@PATH,21,4087.883,-860.7225,112.5768,0,0,0,0,100,0),
(@PATH,22,4084.479,-860.3036,112.2872,0,0,0,0,100,0),
(@PATH,23,4063.229,-863.3036,112.5372,0,0,0,0,100,0),
(@PATH,24,4059.42,-867.1846,112.8684,0,0,0,0,100,0),
(@PATH,25,4058.17,-873.9346,113.6184,0,0,0,0,100,0),
(@PATH,26,4058.563,-877.7594,113.9066,0,0,0,0,100,0),
(@PATH,27,4060.313,-890.0094,114.1566,0,0,0,0,100,0),
(@PATH,28,4065.274,-896.5776,114.7585,0,0,0,0,100,0),
(@PATH,29,4071.021,-903.6585,115.7979,0,0,0,0,100,0),
(@PATH,30,4073.021,-911.4085,115.0479,0,0,0,0,100,0);


-- Pathing for Risen Wintergarde Defender 6
SET @NPC := 132945;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4008.271,`position_y`=-870.0803,`position_z`=117.5745 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4008.271,-870.0803,117.5745,0,0,0,0,100,0),
(@PATH,2,3996.876,-880.48,118.3026,0,0,0,0,100,0),
(@PATH,3,3991.834,-882.1507,118.5546,0,0,0,0,100,0),
(@PATH,4,3961.252,-886.0806,119.2003,0,0,0,0,100,0),
(@PATH,5,3958.834,-887.8701,119.2766,0,0,0,0,100,0),
(@PATH,6,3958.712,-888.809,119.2599,0,0,0,0,100,0),
(@PATH,7,3983.712,-886.309,118.0099,0,0,0,0,100,0),
(@PATH,8,3990.516,-884.9421,118.4627,0,0,0,0,100,0),
(@PATH,9,4001.527,-882.609,118.6914,0,0,0,0,100,0),
(@PATH,10,4009.196,-881.325,118.3849,0,0,0,0,100,0),
(@PATH,11,4017.301,-863.9352,116.9195,0,0,0,0,100,0),
(@PATH,12,4023.301,-849.1852,116.9195,0,0,0,0,100,0),
(@PATH,13,4025.668,-847.6936,116.7459,0,0,0,0,100,0),
(@PATH,14,4036.918,-842.1936,116.7459,0,0,0,0,100,0),
(@PATH,15,4041.683,-837.2839,117.6779,0,0,0,0,100,0),
(@PATH,16,4031.176,-820.0336,121.8801,0,0,0,0,100,0),
(@PATH,17,4027.651,-834.1048,118.0815,0,0,0,0,100,0),
(@PATH,18,4023.714,-843.688,117.5524,0,0,0,0,100,0),
(@PATH,19,4020.757,-848.9363,117.5502,0,0,0,0,100,0),
(@PATH,20,4010.505,-867.1548,117.3328,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 7
SET @NPC := 132946;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3998.09,`position_y`=-941.3831,`position_z`=105.5378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3998.09,-941.3831,105.5378,0,0,0,0,100,0),
(@PATH,2,3982.87,-921.863,104.2338,0,0,0,0,100,0),
(@PATH,3,3980.532,-918.3081,104.4937,0,0,0,0,100,0),
(@PATH,4,3980.812,-915.6993,104.2544,0,0,0,0,100,0),
(@PATH,5,3993.312,-909.1993,106.0044,0,0,0,0,100,0),
(@PATH,6,4001.392,-906.8644,107.0495,0,0,0,0,100,0),
(@PATH,7,4005.606,-907.3997,107.3568,0,0,0,0,100,0),
(@PATH,8,4018.356,-914.8997,106.8568,0,0,0,0,100,0),
(@PATH,9,4019.2,-915.515,107.0822,0,0,0,0,100,0),
(@PATH,10,4016.712,-901.4606,107.2446,0,0,0,0,100,0),
(@PATH,11,4006.091,-900.8485,107.6517,0,0,0,0,100,0),
(@PATH,12,3999.341,-903.3485,107.4017,0,0,0,0,100,0),
(@PATH,13,3990.741,-907.1246,106.0392,0,0,0,0,100,0),
(@PATH,14,3981.241,-911.3746,104.0392,0,0,0,0,100,0),
(@PATH,15,3998.09,-941.3831,105.5378,0,0,0,0,100,0);

-- Frigid Ghoul Attacker
UPDATE creature_template SET flags_extra=64 WHERE  entry=27685;
 
 
/* 
*/ 
-- -------------------------------------------
-- ICECROWN
-- -------------------------------------------

-- Arthur Denny - Spawn - wowhead.com/npc=33603/arthur-denny#screenshots:id=126386
DELETE FROM `creature` WHERE `id`=33603;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(3110518, 33603, 571, 0, 0, 1, 1, 0, 0, 8549.57, 945.324, 547.375, 1.28961, 300, 0, 0, 8508, 7981, 0, 0, 0, 0, 0);

-- Chosen Zealot Combat SAI -- http://www.wowhead.com/npc=@ENTRY/chosen-zealot
SET @ENTRY :=32175;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `id` IN(11,12);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 11, 0, 0, 0, 100, 0, 1000, 2000, 16000, 18000, 11, 13445, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chosen Zealot - IC - Cast Rend'),
(@ENTRY, 0, 12, 0, 0, 0, 100, 0, 0, 2000, 65000, 70000, 11, 12530, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chosen Zealot - IC - Cast Frailty');

-- Chosen Zealot loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@ENTRY, 33470, 0, 44, 0, 1, 0, 1, 4, NULL),
(@ENTRY, 33443, 0, 7, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 37760, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 43297, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 44309, 0, 0.1, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@ENTRY, 43575, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 37467, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 38261, 0, 1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33447, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35950, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35948, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35952, 0, 5, 0, 1, 0, 1, 1, NULL);

-- Converted Hero -- http://www.wowhead.com/npc=32255
UPDATE `creature_template` SET `mingold`=900, `maxgold`=1000 WHERE `entry`=32255;
 
 
/* 
*/ 
-- -------------------------------------------
-- SHOLAZAR BASIN
-- -------------------------------------------

-- Vic's Flying Machine - http://www.wowhead.com/npc=28710/vics-flying-machine
SET @PLANE          := 28710; -- Vic's Flying Machine
UPDATE `creature_template` SET InhabitType='4', `vehicleid`=129, `speed_walk`=10 WHERE `entry`=28710;
DELETE FROM `vehicle_template_accessory` WHERE `entry`=@PLANE;

-- Urgreth of the Thousand Tombs SAI
SET @ENTRY := 28103;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,9000,12000,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Cast 'Mortal Strike'"),
(@ENTRY,0,1,0,0,0,100,0,11000,16000,18000,24000,11,51074,1,0,0,0,0,2,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Cast 'Shadow Barrage'"),
(@ENTRY,0,2,0,0,0,100,0,11000,16000,18000,24000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Say Line 0"),
(@ENTRY,0,3,4,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - set respawntime 60 seconds");

-- Hailscorn SAI
SET @ENTRY := 28208;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,5000,7000,11,3130,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Ice Claw'"),
(@ENTRY,0,1,0,0,0,100,0,9000,16000,18000,23000,11,51144,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Wing Buffet'"),
(@ENTRY,0,2,0,0,0,100,0,14000,20000,75000,90000,11,51061,1,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Skeleton Army'"),
(@ENTRY,0,3,4,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - set respawntime 60 seconds");

-- Bythius the Flesh-Shaper SAI
SET @ENTRY := 28212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,10000,12000,17000,11,30043,0,0,0,0,0,5,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - In Combat - Cast 'Poison Spray'"),
(@ENTRY,0,1,2,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - set respawntime 60 seconds");

-- Cerberon SAI
SET @ENTRY := 28207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - set respawntime 60 seconds");

-- Glonn SAI
SET @ENTRY := 28211;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - set respawntime 60 seconds");
 
 
/* 
*/ 
-- -------------------------------------------
-- STORMPEAKS
-- -------------------------------------------

-- Brunnhildar Prisoner
UPDATE `creature` SET `spawntimesecs`=100 WHERE  `id`=29639;

-- Unwelcome Guests - Spawns -- http://www.wowhead.com/quest=12876
DELETE FROM `creature` WHERE `id` IN (29586, 29843, 29862);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(109726, 29586, 571, 67, 4472, 1, 1, 25952, 1, 6966.27, -18.0699, 808.949, 3.08246, 300, 5, 0, 11770, 0, 1, 0, 0, 0, 0),
(3106877, 29586, 571, 67, 4472, 1, 1, 0, 1, 6929.81, -25.5735, 804.277, 2.04994, 300, 0, 0, 11770, 0, 0, 0, 0, 0, 0),
(3106876, 29586, 571, 67, 4472, 1, 1, 0, 1, 6899.53, 5.13585, 799.022, 0.632301, 300, 5, 0, 11770, 1, 0, 0, 0, 0, 0),
(3106875, 29586, 571, 67, 4472, 1, 1, 0, 1, 6890.2, 57.0572, 793.808, 5.34469, 300, 0, 0, 11770, 0, 0, 0, 0, 0, 0),
(3106874, 29586, 571, 67, 4472, 1, 1, 0, 1, 6911.86, 85.5297, 807.334, 1.01322, 300, 5, 0, 12175, 1, 0, 0, 0, 0, 0),
(3106873, 29586, 571, 67, 4472, 1, 1, 0, 1, 6958.12, 55.0994, 815.893, 0.997524, 300, 5, 0, 11770, 1, 0, 0, 0, 0, 0),
(3106872, 29586, 571, 67, 4472, 1, 1, 0, 1, 7018.88, 63.6291, 811.717, 4.53575, 300, 5, 0, 12175, 1, 0, 0, 0, 0, 0),
(3106871, 29586, 571, 67, 4472, 1, 1, 0, 1, 7049.6, -25.4819, 808.624, 3.85245, 300, 0, 0, 11770, 0, 0, 0, 0, 0, 0),
(3106868, 29843, 571, 67, 4472, 1, 1, 0, 1, 6926.22, 34.919, 795.126, 3.37728, 300, 5, 0, 12175, 3893, 0, 1, 0, 0, 0),
(3106867, 29843, 571, 67, 4472, 1, 1, 0, 1, 6880.83, 35.0521, 795.836, 0.451672, 300, 0, 0, 11770, 3809, 0, 0, 0, 0, 0),
(3106866, 29843, 571, 67, 4472, 1, 1, 0, 1, 6919.78, 107.378, 811.318, 5.37219, 300, 5, 0, 12175, 3893, 1, 0, 0, 0, 0),
(3106869, 29843, 571, 67, 4472, 1, 1, 0, 1, 6922.04, 21.0084, 797.222, 2.35234, 300, 0, 0, 11770, 3809, 0, 0, 0, 0, 0),
(109768, 29843, 571, 67, 4472, 1, 1, 25954, 1, 6949.23, -19.8659, 807.096, 0.694126, 300, 5, 0, 11770, 3809, 1, 0, 0, 0, 0),
(109767, 29843, 571, 67, 4472, 1, 1, 25954, 1, 7007.16, -8.43711, 807.854, 2.70526, 300, 5, 0, 11770, 3809, 1, 0, 0, 0, 0),
(109766, 29843, 571, 67, 4472, 1, 1, 25954, 1, 6956.14, -2.51432, 808.53, 2.05879, 300, 5, 0, 11770, 3809, 1, 0, 0, 0, 0),
(109764, 29843, 571, 67, 4472, 1, 1, 25954, 1, 6984.83, -0.527235, 809.966, 0.034907, 300, 0, 0, 11770, 3809, 0, 0, 0, 0, 0),
(3106865, 29843, 571, 67, 4472, 1, 1, 0, 1, 6955.02, 89.8383, 810.359, 5.01877, 300, 0, 0, 12175, 3893, 0, 0, 0, 0, 0),
(3106870, 29843, 571, 67, 4472, 1, 1, 0, 1, 6970.58, 35.9574, 805.185, 4.42578, 300, 5, 0, 12175, 3893, 0, 1, 0, 0, 0),
(3106864, 29843, 571, 67, 4472, 1, 1, 0, 1, 7018.52, 41.2376, 811.017, 3.08276, 300, 0, 0, 12175, 3893, 0, 0, 0, 0, 0);

-- CREATURE_FLAG_EXTRA_NO_CREATURE_DAMAGE
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x00000400 WHERE  `entry` IN (29358, 29351, 29500, 29498);

-- Ravenous Jormungar -- http://www.wowhead.com/npc=29605/ravenous-jormungar
DELETE FROM `creature` WHERE `id` IN (30291, 29605);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(111453, 29605, 571, 67, 4455, 1, 1, 26262, 0, 7174.96, -2128.25, 762.898, 0.901649, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(111454, 29605, 571, 67, 4455, 1, 1, 26262, 0, 7180.05, -2126.77, 763.287, -2.21793, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(111455, 29605, 571, 67, 67, 1, 1, 26262, 0, 7268.51, -2125.38, 778.158, 3.66114, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(111456, 29605, 571, 67, 4455, 1, 1, 26262, 0, 7211.42, -2111.94, 772.201, 2.53219, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106547, 29605, 571, 67, 4455, 1, 1, 0, 0, 7208.93, -2114.6, 771.16, 2.29832, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106548, 29605, 571, 67, 4455, 1, 1, 0, 0, 7240.42, -2119.66, 777.613, 3.32484, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106549, 29605, 571, 67, 4455, 1, 1, 0, 0, 7268.07, -2127.93, 778.245, 1.37862, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106550, 29605, 571, 67, 4455, 1, 1, 0, 0, 7273.03, -2122.86, 777.058, 1.15478, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106551, 29605, 571, 67, 4455, 1, 1, 0, 0, 7327.25, -2096.77, 773.223, 0.0332317, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(3106552, 29605, 571, 67, 4455, 1, 1, 0, 0, 7316.03, -2073.4, 763.126, 2.75542, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(3106553, 29605, 571, 67, 4455, 1, 1, 0, 0, 7282.36, -2071.02, 761.786, 2.97141, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106554, 29605, 571, 67, 4455, 1, 1, 0, 0, 7303.1, -2035.5, 762.862, 0.846119, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(3106555, 29605, 571, 67, 4455, 1, 1, 0, 0, 7313.73, -2023.51, 763.368, 0.846119, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106556, 29605, 571, 67, 4455, 1, 1, 0, 0, 7272.99, -2013.75, 768.012, 4.7841, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106557, 29605, 571, 67, 4455, 1, 1, 0, 0, 7256.09, -1971.18, 769.577, 4.24847, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(3106558, 29605, 571, 67, 4455, 1, 1, 0, 0, 7216.88, -1984.99, 766.763, 3.57695, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106559, 29605, 571, 67, 4455, 1, 1, 0, 0, 7201.03, -2022.43, 765.454, 5.13283, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106560, 29605, 571, 67, 4455, 1, 1, 0, 0, 7200.02, -2026.43, 765.271, 5.13283, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(3106561, 29605, 571, 67, 4455, 1, 1, 0, 0, 7202.76, -2033.38, 764.745, 3.65078, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(3106562, 29605, 571, 67, 4455, 1, 1, 0, 0, 7200.63, -2057.87, 764.617, 4.31602, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0),
(202993, 30291, 571, 67, 4455, 1, 4, 0, 0, 7329.02, -2096.36, 772.981, 4.2904, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202992, 30291, 571, 67, 4455, 1, 4, 0, 0, 7315.78, -2071.91, 763.048, 3.6818, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202991, 30291, 571, 67, 4455, 1, 4, 0, 0, 7315, -2021.31, 763.381, 5.7145, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202990, 30291, 571, 67, 4455, 1, 4, 0, 0, 7304.69, -2036.38, 762.714, 0.867, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202989, 30291, 571, 67, 4455, 1, 4, 0, 0, 7280.62, -2072.3, 761.956, 0.4111, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202988, 30291, 571, 67, 4455, 1, 4, 0, 0, 7272.03, -2014.92, 768.024, 5.081, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202987, 30291, 571, 67, 4455, 1, 4, 0, 0, 7270.6, -2119.66, 776.91, 4.382, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202986, 30291, 571, 67, 4455, 1, 4, 0, 0, 7252.53, -2072.12, 763.08, 2.8011, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202985, 30291, 571, 67, 4455, 1, 4, 0, 0, 7250.86, -2092.35, 774.785, 3.593, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202984, 30291, 571, 67, 4455, 1, 4, 0, 0, 7237.44, -2120.75, 777.29, 2.9318, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202983, 30291, 571, 67, 4455, 1, 4, 0, 0, 7208.14, -2036.18, 764.755, 4.6086, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202982, 30291, 571, 67, 4455, 1, 4, 0, 0, 7207.08, -2039.97, 764.517, 1.13, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202981, 30291, 571, 67, 4455, 1, 4, 0, 0, 7206.73, -2036.56, 764.543, 5.3588, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202980, 30291, 571, 67, 4455, 1, 4, 0, 0, 7342.41, -2037.04, 763.419, 2.9583, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202979, 30291, 571, 67, 4455, 1, 4, 0, 0, 7203.25, -2056.41, 765.201, 5.4181, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(202978, 30291, 571, 67, 4455, 1, 4, 0, 0, 7158.9, -2137.43, 764.273, 3.6641, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0);
 
 
/* 
*/ 
-- -------------------------------------------
-- HELLFIRE PENINSULA
-- -------------------------------------------

-- Formula: Runed Adamantite Rod -- http://wotlk.openwow.com/item=25848 [A] Vodesiin http://wotlk.openwow.com/npc=19004
-- Respawn time corrected

UPDATE `world`.`npc_vendor` SET `incrtime`='180' WHERE  `entry`=19004 AND `item`=25848 AND `ExtendedCost`=0;

-- 
-- Magister Aledis (20159) -- http://www.wowhead.com/npc=20159
DELETE FROM `waypoint_data` WHERE `id`=868730;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(868730, 1, -691.909, 4180.54, 57.2065, 0, 0, 0, 0, 100, 0),
(868730, 2, -692.213, 4188.72, 56.9376, 0, 0, 0, 0, 100, 0),
(868730, 3, -690.58, 4197.96, 56.8627, 0, 0, 0, 0, 100, 0),
(868730, 4, -685.58, 4208.53, 56.9631, 0, 0, 0, 0, 100, 0),
(868730, 5, -677.946, 4217.29, 56.9471, 0, 0, 0, 0, 100, 0),
(868730, 6, -669.282, 4220.7, 55.025, 0, 0, 0, 0, 100, 0),
(868730, 7, -657.687, 4219.94, 54.093, 0, 0, 0, 0, 100, 0),
(868730, 8, -642.529, 4218.96, 52.9759, 0, 0, 0, 0, 100, 0),
(868730, 9, -626.253, 4217.9, 50.8905, 0, 0, 0, 0, 100, 0),
(868730, 10, -609.217, 4221.58, 48.8962, 0, 0, 0, 0, 100, 0),
(868730, 11, -593.279, 4225.04, 48.6672, 0, 0, 0, 0, 100, 0),
(868730, 12, -581.253, 4220.63, 48.7387, 0, 0, 0, 0, 100, 0),
(868730, 13, -569.36, 4213.24, 48.228, 0, 0, 0, 0, 100, 0),
(868730, 14, -556.283, 4203.38, 46.664, 0, 0, 0, 0, 100, 0),
(868730, 15, -548.853, 4191.52, 45.8989, 0, 0, 0, 0, 100, 0),
(868730, 16, -543.603, 4176.13, 47.4096, 0, 0, 0, 0, 100, 0),
(868730, 17, -537.444, 4159.75, 47.2852, 0, 0, 0, 0, 100, 0),
(868730, 18, -529.523, 4142.82, 47.1382, 0, 0, 0, 0, 100, 0),
(868730, 19, -521.601, 4125.89, 47.214, 0, 0, 0, 0, 100, 0),
(868730, 20, -513.815, 4111.62, 47.8326, 0, 0, 0, 0, 100, 0),
(868730, 21, -503.393, 4097.56, 49.8002, 0, 0, 0, 0, 100, 0),
(868730, 22, -494.103, 4081.35, 51.7653, 0, 0, 0, 0, 100, 0),
(868730, 23, -488.019, 4066.23, 53.3722, 0, 0, 0, 0, 100, 0),
(868730, 24, -481.36, 4046.39, 54.1493, 0, 0, 0, 0, 100, 0),
(868730, 25, -477.318, 4034.19, 55.6787, 0, 0, 0, 0, 100, 0),
(868730, 26, -476.03, 4020.25, 56.7391, 0, 0, 0, 0, 100, 0),
(868730, 27, -476.599, 4005.07, 57.3918, 0, 0, 0, 0, 100, 0),
(868730, 28, -480.315, 3989.19, 58.1137, 0, 0, 0, 0, 100, 0),
(868730, 29, -485.327, 3973.67, 57.0802, 0, 0, 0, 0, 100, 0),
(868730, 30, -490.838, 3959.51, 57.5119, 0, 0, 0, 0, 100, 0),
(868730, 31, -495.145, 3946.19, 58.0008, 0, 0, 0, 0, 100, 0),
(868730, 32, -497.38, 3930.04, 57.818, 0, 0, 0, 0, 100, 0),
(868730, 33, -497.688, 3914.94, 57.9498, 0, 0, 0, 0, 100, 0),
(868730, 34, -493.332, 3895.61, 58.5075, 0, 0, 0, 0, 100, 0),
(868730, 35, -490.088, 3881.99, 59.0036, 0, 0, 0, 0, 100, 0),
(868730, 36, -485.563, 3872.52, 59.6395, 0, 0, 0, 0, 100, 0),
(868730, 37, -474.635, 3861.97, 58.2834, 0, 0, 0, 0, 100, 0),
(868730, 38, -464.896, 3858.04, 57.983, 0, 0, 0, 0, 100, 0),
(868730, 39, -455.644, 3859.08, 58.8371, 0, 0, 0, 0, 100, 0),
(868730, 40, -444.311, 3865.05, 58.7931, 0, 0, 0, 0, 100, 0),
(868730, 41, -432.21, 3871.98, 58.8558, 0, 0, 0, 0, 100, 0),
(868730, 42, -409.477, 3880.6, 61.1951, 0, 0, 0, 0, 100, 0),
(868730, 43, -395.143, 3885.41, 62.9083, 0, 0, 0, 0, 100, 0),
(868730, 44, -383.347, 3890.41, 63.7271, 0, 0, 0, 0, 100, 0),
(868730, 45, -366.257, 3897.76, 65.8394, 0, 0, 0, 0, 100, 0),
(868730, 46, -349.696, 3906.15, 69.6185, 0, 0, 0, 0, 100, 0),
(868730, 47, -333.799, 3915.85, 74.0012, 0, 0, 0, 0, 100, 0),
(868730, 48, -320.095, 3930.15, 78.6473, 0, 0, 0, 0, 100, 0),
(868730, 49, -309.762, 3944.19, 82.741, 0, 0, 0, 0, 100, 0),
(868730, 50, -297.979, 3962.99, 88.2883, 0, 0, 0, 0, 100, 0),
(868730, 51, -286.642, 3982.07, 92.9243, 0, 0, 0, 0, 100, 0),
(868730, 52, -277.875, 3999.87, 96.1902, 0, 0, 0, 0, 100, 0),
(868730, 53, -269.826, 4017.97, 99.057, 0, 0, 0, 0, 100, 0),
(868730, 54, -263.605, 4034.32, 99.6187, 0, 0, 0, 0, 100, 0),
(868730, 55, -255.257, 4054.81, 99.6206, 0, 0, 0, 0, 100, 0),
(868730, 56, -246.641, 4075.26, 99.27, 0, 0, 0, 0, 100, 0),
(868730, 57, -238.487, 4094.61, 98.4586, 0, 0, 0, 0, 100, 0),
(868730, 58, -233.033, 4109.98, 97.7601, 0, 0, 0, 0, 100, 0),
(868730, 59, -228.441, 4130.46, 96.8335, 0, 0, 0, 0, 100, 0),
(868730, 60, -227.122, 4150.22, 97.472, 0, 0, 0, 0, 100, 0),
(868730, 61, -226.5, 4171.22, 97.8333, 0, 0, 0, 0, 100, 0),
(868730, 62, -226.344, 4196.9, 96.7709, 0, 0, 0, 0, 100, 0),
(868730, 63, -226.233, 4214.4, 95.6005, 0, 0, 0, 0, 100, 0),
(868730, 64, -224.009, 4234.16, 94.0461, 0, 0, 0, 0, 100, 0),
(868730, 65, -222.177, 4250.44, 92.1034, 0, 0, 0, 0, 100, 0),
(868730, 66, -220.485, 4265.46, 89.4869, 0, 0, 0, 0, 100, 0),
(868730, 67, -218.27, 4285.15, 85.6488, 0, 0, 0, 0, 100, 0),
(868730, 68, -216.57, 4300.24, 82.3554, 0, 0, 0, 0, 100, 0),
(868730, 69, -214.354, 4319.93, 76.0681, 0, 0, 0, 0, 100, 0),
(868730, 70, -212.397, 4337.32, 70.8465, 0, 0, 0, 0, 100, 0),
(868730, 71, -210.048, 4358.19, 65.2421, 0, 0, 0, 0, 100, 0),
(868730, 72, -207.174, 4383.71, 58.4553, 0, 0, 0, 0, 100, 0),
(868730, 73, -204.3, 4409.24, 51.3753, 0, 0, 0, 0, 100, 0),
(868730, 74, -204.067, 4425.62, 47.5379, 0, 0, 0, 0, 100, 0),
(868730, 75, -205.184, 4442.88, 43.677, 0, 0, 0, 0, 100, 0),
(868730, 76, -206.54, 4463.83, 39.3516, 0, 0, 0, 0, 100, 0),
(868730, 77, -207.742, 4482.41, 35.9478, 0, 0, 0, 0, 100, 0),
(868730, 78, -209.73, 4499.8, 32.2897, 0, 0, 0, 0, 100, 0),
(868730, 79, -215.279, 4517.65, 28.9732, 0, 0, 0, 0, 100, 0),
(868730, 80, -222.039, 4537.53, 27.3868, 0, 0, 0, 0, 100, 0),
(868730, 81, -228.055, 4555.22, 25.3029, 0, 0, 0, 0, 100, 0),
(868730, 82, -231.579, 4571.15, 23.3626, 0, 0, 0, 0, 100, 0),
(868730, 83, -232.983, 4588.59, 21.3321, 0, 0, 0, 0, 100, 0),
(868730, 84, -234.388, 4606.03, 19.0375, 0, 0, 0, 0, 100, 0),
(868730, 85, -235.983, 4625.85, 15.9809, 0, 0, 0, 0, 100, 0),
(868730, 86, -237.482, 4644.48, 14.4488, 0, 0, 0, 0, 100, 0),
(868730, 87, -239.072, 4664.23, 13.3003, 0, 0, 0, 0, 100, 0),
(868730, 88, -240.661, 4683.97, 12.675, 0, 0, 0, 0, 100, 0),
(868730, 89, -242.415, 4716.61, 11.0585, 0, 0, 0, 0, 100, 0),
(868730, 90, -242.947, 4737.6, 11.0917, 0, 0, 0, 0, 100, 0),
(868730, 91, -242.074, 4760.9, 13.6885, 0, 0, 0, 0, 100, 0),
(868730, 92, -242.688, 4781.89, 17.3099, 0, 0, 0, 0, 100, 0),
(868730, 93, -241.635, 4801.67, 20.313, 0, 0, 0, 0, 100, 0),
(868730, 94, -240.579, 4817.9, 22.8415, 0, 0, 0, 0, 100, 0),
(868730, 95, -239.37, 4836.48, 27.1798, 0, 0, 0, 0, 100, 0),
(868730, 96, -239.026, 4843.47, 28.9299, 0, 0, 0, 0, 100, 0),
(868730, 97, -238.609, 4866.78, 28.6379, 0, 0, 0, 0, 100, 0),
(868730, 98, -238.562, 4888.9, 31.1383, 0, 0, 0, 0, 100, 0),
(868730, 99, -238.505, 4915.64, 37.7508, 0, 0, 0, 0, 100, 0),
(868730, 100, -238.961, 4935.46, 42.5558, 0, 0, 0, 0, 100, 0),
(868730, 101, -241.771, 4958.6, 47.446, 0, 0, 0, 0, 100, 0),
(868730, 102, -249.689, 4978.05, 50.8571, 0, 0, 0, 0, 100, 0),
(868730, 103, -255.67, 4994.57, 54.3075, 0, 0, 0, 0, 100, 0),
(868730, 104, -256.249, 5014.37, 59.3448, 0, 0, 0, 0, 100, 0),
(868730, 105, -254.188, 5034.07, 63.7478, 0, 0, 0, 0, 100, 0),
(868730, 106, -252.127, 5053.77, 67.9566, 0, 0, 0, 0, 100, 0),
(868730, 107, -250.186, 5072.33, 71.8052, 0, 0, 0, 0, 100, 0),
(868730, 108, -246.5, 5090.65, 76.916, 0, 0, 0, 0, 100, 0),
(868730, 109, -244.551, 5100.97, 79.4995, 0, 0, 0, 0, 100, 0),
(868730, 110, -238.887, 5121.19, 80.5727, 0, 0, 0, 0, 100, 0),
(868730, 111, -236.856, 5133.84, 80.8793, 0, 0, 0, 0, 100, 0),
(868730, 112, -237.986, 5152.44, 81.9878, 0, 0, 0, 0, 100, 0),
(868730, 113, -242.718, 5168.05, 82.9673, 0, 0, 0, 0, 100, 0),
(868730, 114, -248.501, 5182.09, 81.6072, 0, 0, 0, 0, 100, 0),
(868730, 115, -254.804, 5200.87, 76.4362, 0, 0, 0, 0, 100, 0),
(868730, 116, -258.831, 5210.57, 73.8081, 0, 0, 0, 0, 100, 0),
(868730, 117, -267.476, 5227.14, 68.0707, 0, 0, 0, 0, 100, 0),
(868730, 118, -276.639, 5244.7, 63.4011, 0, 0, 0, 0, 100, 0),
(868730, 119, -270.746, 5230.7, 67.0313, 0, 0, 0, 0, 100, 0),
(868730, 120, -264.419, 5215.67, 72.3729, 0, 0, 0, 0, 100, 0),
(868730, 121, -255.786, 5199.09, 77.2371, 0, 0, 0, 0, 100, 0),
(868730, 122, -248.73, 5181.96, 81.6437, 0, 0, 0, 0, 100, 0),
(868730, 123, -244.067, 5167.5, 83.1118, 0, 0, 0, 0, 100, 0),
(868730, 124, -239.618, 5150.57, 81.9561, 0, 0, 0, 0, 100, 0),
(868730, 125, -237.532, 5134.4, 80.8486, 0, 0, 0, 0, 100, 0),
(868730, 126, -238.413, 5121.62, 80.5941, 0, 0, 0, 0, 100, 0),
(868730, 127, -244.476, 5106.4, 79.2985, 0, 0, 0, 0, 100, 0),
(868730, 128, -248.581, 5098.05, 78.9945, 0, 0, 0, 0, 100, 0),
(868730, 129, -252.317, 5077.38, 73.082, 0, 0, 0, 0, 100, 0),
(868730, 130, -251.553, 5058.78, 68.9012, 0, 0, 0, 0, 100, 0),
(868730, 131, -250.773, 5037.79, 64.993, 0, 0, 0, 0, 100, 0),
(868730, 132, -250.037, 5018, 60.9685, 0, 0, 0, 0, 100, 0),
(868730, 133, -249.302, 4998.2, 55.8128, 0, 0, 0, 0, 100, 0),
(868730, 134, -246.926, 4979.66, 51.4516, 0, 0, 0, 0, 100, 0),
(868730, 135, -244.798, 4957.57, 47.02, 0, 0, 0, 0, 100, 0),
(868730, 136, -242.449, 4933.19, 41.7712, 0, 0, 0, 0, 100, 0),
(868730, 137, -240.435, 4912.28, 36.7266, 0, 0, 0, 0, 100, 0),
(868730, 138, -240.863, 4892.41, 31.614, 0, 0, 0, 0, 100, 0),
(868730, 139, -241.371, 4869.1, 28.4148, 0, 0, 0, 0, 100, 0),
(868730, 140, -240.62, 4843.49, 28.8237, 0, 0, 0, 0, 100, 0),
(868730, 141, -240.466, 4828.37, 24.6993, 0, 0, 0, 0, 100, 0),
(868730, 142, -241.207, 4806.27, 20.9674, 0, 0, 0, 0, 100, 0),
(868730, 143, -242.029, 4781.78, 17.3464, 0, 0, 0, 0, 100, 0),
(868730, 144, -242.851, 4757.29, 13.1134, 0, 0, 0, 0, 100, 0),
(868730, 145, -240.244, 4734.06, 10.8927, 0, 0, 0, 0, 100, 0),
(868730, 146, -241.141, 4714.27, 11.1482, 0, 0, 0, 0, 100, 0),
(868730, 147, -239.944, 4689.8, 12.4676, 0, 0, 0, 0, 100, 0),
(868730, 148, -238.597, 4667.65, 13.2154, 0, 0, 0, 0, 100, 0),
(868730, 149, -236.991, 4645.52, 14.3721, 0, 0, 0, 0, 100, 0),
(868730, 150, -235.13, 4619.9, 16.7743, 0, 0, 0, 0, 100, 0),
(868730, 151, -233.356, 4595.46, 20.4947, 0, 0, 0, 0, 100, 0),
(868730, 152, -231.415, 4568.72, 23.6737, 0, 0, 0, 0, 100, 0),
(868730, 153, -223.089, 4550.74, 25.749, 0, 0, 0, 0, 100, 0),
(868730, 154, -212.983, 4528.47, 27.8519, 0, 0, 0, 0, 100, 0),
(868730, 155, -209.298, 4505.46, 31.0941, 0, 0, 0, 0, 100, 0),
(868730, 156, -206.516, 4482.32, 35.9556, 0, 0, 0, 0, 100, 0),
(868730, 157, -206.2, 4459.01, 40.2931, 0, 0, 0, 0, 100, 0),
(868730, 158, -207.115, 4434.6, 45.6278, 0, 0, 0, 0, 100, 0),
(868730, 159, -207.857, 4414.8, 50.2298, 0, 0, 0, 0, 100, 0),
(868730, 160, -208.689, 4392.63, 55.9925, 0, 0, 0, 0, 100, 0),
(868730, 161, -209.607, 4368.15, 62.6319, 0, 0, 0, 0, 100, 0),
(868730, 162, -210.524, 4343.66, 69.0275, 0, 0, 0, 0, 100, 0),
(868730, 163, -211.442, 4319.18, 76.1648, 0, 0, 0, 0, 100, 0),
(868730, 164, -212.402, 4293.58, 83.8358, 0, 0, 0, 0, 100, 0),
(868730, 165, -213.913, 4273.76, 87.5529, 0, 0, 0, 0, 100, 0),
(868730, 166, -215.507, 4254.04, 90.8655, 0, 0, 0, 0, 100, 0),
(868730, 167, -218.629, 4229.74, 93.9048, 0, 0, 0, 0, 100, 0),
(868730, 168, -221.751, 4205.44, 96.0334, 0, 0, 0, 0, 100, 0),
(868730, 169, -221.972, 4183.34, 97.1349, 0, 0, 0, 0, 100, 0),
(868730, 170, -223.413, 4163.58, 97.576, 0, 0, 0, 0, 100, 0),
(868730, 171, -226.565, 4143.95, 97.1474, 0, 0, 0, 0, 100, 0),
(868730, 172, -232.454, 4122.61, 97.4176, 0, 0, 0, 0, 100, 0),
(868730, 173, -239.356, 4101.52, 98.3286, 0, 0, 0, 0, 100, 0),
(868730, 174, -246.76, 4083.14, 99.0722, 0, 0, 0, 0, 100, 0),
(868730, 175, -254.379, 4063.57, 99.607, 0, 0, 0, 0, 100, 0),
(868730, 176, -261.142, 4044.95, 99.6202, 0, 0, 0, 0, 100, 0),
(868730, 177, -266.885, 4027.17, 99.5641, 0, 0, 0, 0, 100, 0),
(868730, 178, -273.201, 4012.13, 98.3073, 0, 0, 0, 0, 100, 0),
(868730, 179, -282.194, 3994.4, 95.0834, 0, 0, 0, 0, 100, 0),
(868730, 180, -292.201, 3974.67, 91.2379, 0, 0, 0, 0, 100, 0),
(868730, 181, -302.24, 3954.88, 85.9459, 0, 0, 0, 0, 100, 0),
(868730, 182, -312.574, 3936.52, 80.6977, 0, 0, 0, 0, 100, 0),
(868730, 183, -325.014, 3918.15, 75.2926, 0, 0, 0, 0, 100, 0),
(868730, 184, -337.837, 3904.55, 70.8475, 0, 0, 0, 0, 100, 0),
(868730, 185, -355.666, 3899.18, 67.4994, 0, 0, 0, 0, 100, 0),
(868730, 186, -377.627, 3891.37, 63.862, 0, 0, 0, 0, 100, 0),
(868730, 187, -395.392, 3885.56, 62.9443, 0, 0, 0, 0, 100, 0),
(868730, 188, -414.071, 3878.96, 60.8102, 0, 0, 0, 0, 100, 0),
(868730, 189, -432.468, 3871.62, 58.7983, 0, 0, 0, 0, 100, 0),
(868730, 190, -450.507, 3863.26, 59.0757, 0, 0, 0, 0, 100, 0),
(868730, 191, -467.48, 3859, 58.161, 0, 0, 0, 0, 100, 0),
(868730, 192, -481.096, 3867.91, 59.1249, 0, 0, 0, 0, 100, 0),
(868730, 193, -488.102, 3880.03, 59.3624, 0, 0, 0, 0, 100, 0),
(868730, 194, -492.594, 3894.54, 58.5079, 0, 0, 0, 0, 100, 0),
(868730, 195, -495.757, 3912.89, 58.1861, 0, 0, 0, 0, 100, 0),
(868730, 196, -496.938, 3929.15, 57.8582, 0, 0, 0, 0, 100, 0),
(868730, 197, -494.605, 3945.3, 58.2258, 0, 0, 0, 0, 100, 0),
(868730, 198, -486.988, 3963.58, 57.9091, 0, 0, 0, 0, 100, 0),
(868730, 199, -480.605, 3982.33, 58.0763, 0, 0, 0, 0, 100, 0),
(868730, 200, -477.596, 3997.22, 58.0104, 0, 0, 0, 0, 100, 0),
(868730, 201, -477.242, 4017.1, 56.4737, 0, 0, 0, 0, 100, 0),
(868730, 202, -478.845, 4038.04, 54.9391, 0, 0, 0, 0, 100, 0),
(868730, 203, -484.329, 4055.9, 53.7096, 0, 0, 0, 0, 100, 0),
(868730, 204, -491.746, 4071.75, 52.2469, 0, 0, 0, 0, 100, 0),
(868730, 205, -499.668, 4088.68, 50.7983, 0, 0, 0, 0, 100, 0),
(868730, 206, -507.679, 4101.59, 48.9656, 0, 0, 0, 0, 100, 0),
(868730, 207, -519.381, 4120.44, 47.3699, 0, 0, 0, 0, 100, 0),
(868730, 208, -524.765, 4132.06, 47.2874, 0, 0, 0, 0, 100, 0),
(868730, 209, -533.591, 4151.12, 47.2907, 0, 0, 0, 0, 100, 0),
(868730, 210, -541.917, 4169.1, 47.4396, 0, 0, 0, 0, 100, 0),
(868730, 211, -548.77, 4185.2, 46.2386, 0, 0, 0, 0, 100, 0),
(868730, 212, -553.392, 4200.77, 46.1799, 0, 0, 0, 0, 100, 0),
(868730, 213, -562.48, 4209.9, 47.5274, 0, 0, 0, 0, 100, 0),
(868730, 214, -575.95, 4219.1, 48.5694, 0, 0, 0, 0, 100, 0),
(868730, 215, -589.139, 4223.64, 48.7336, 0, 0, 0, 0, 100, 0),
(868730, 216, -605.34, 4221.76, 48.7685, 0, 0, 0, 0, 100, 0),
(868730, 217, -619.85, 4217.27, 50.1118, 0, 0, 0, 0, 100, 0),
(868730, 218, -637.194, 4218.02, 52.435, 0, 0, 0, 0, 100, 0),
(868730, 219, -649.879, 4219.81, 53.5643, 0, 0, 0, 0, 100, 0),
(868730, 220, -666.149, 4220.95, 54.4457, 0, 0, 0, 0, 100, 0),
(868730, 221, -679.908, 4218.37, 57.3408, 0, 0, 0, 0, 100, 0),
(868730, 222, -685.602, 4208.16, 56.9413, 0, 0, 0, 0, 100, 0),
(868730, 223, -692.28, 4195.85, 56.9043, 0, 0, 0, 0, 100, 0),
(868730, 224, -693.737, 4181.93, 57.2345, 0, 0, 0, 0, 100, 0),
(868730, 225, -690.174, 4172.09, 57.8966, 0, 0, 0, 0, 100, 0),
(868730, 226, -685.762, 4156.31, 61.4249, 0, 0, 0, 0, 100, 0);

-- Bleeding Hollow Tormentor SAI - http://www.wowhead.com/npc=19424
SET @ENTRY := 19424;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,5000,5000,10000,10000,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bleeding Hollow Tormentor - In Combat - Cast 'Fear' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,1,0,0,3000,3000,11,34368,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bleeding Hollow Tormentor - In Combat - Cast 'Summon Riding Worg' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,11,31553,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bleeding Hollow Tormentor - Between 0-15% Health - Cast 'Hamstring' (No Repeat)"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bleeding Hollow Tormentor - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Creating a new SmartAI script for [Creature] ENTRY 19640 (name: Bleeding Hollow Riding Worg)
-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 19640;
-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 19640);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19640, 0, 0, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Riding Worg - On Evade - Despawn Instant');
 
 
/* 
*/ 
-- -------------------------------------------
-- TEROKKAR FOREST
-- -------------------------------------------

-- Formula: Runed Adamantite Rod -- http://wotlk.openwow.com/item=25848  [H] Rungor http://wotlk.openwow.com/npc=18960
-- Respawn time corrected

UPDATE `world`.`npc_vendor` SET `incrtime`='180' WHERE  `entry`=18960 AND `item`=25848 AND `ExtendedCost`=0; 
 
/* 
*/ 
-- -------------------------------------------
-- HOWLING FJORD
-- -------------------------------------------


-- We Have the Technology -- [A] http://www.wowhead.com/quest=11484/we-have-the-technology


/*
Code
*/


-- Rivenwood Captives -- [H] http://www.wowhead.com/quest=11296/rivenwood-captives


/*
Code
*/


-- Dead Man's Debt -- [A][H] http://www.wowhead.com/quest=11467/dead-mans-debt


/*
Code
*/


-- Scouting the Sinkholes [A] http://www.wowhead.com/quest=11713/scouting-the-sinkholes [H] http://www.wowhead.com/quest=11684/scouting-the-sinkholes


/*
Code
*/ 
 
/* 
*/ 
-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------


-- Spawn creature ID 16399 Bloodsail Traitor

DELETE FROM `creature` WHERE `id` = 16399;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
(4761, 16399, 0, 0, 0, 1, 1, 2557, 1, -14184.4, 192.764, 20.6905, 3.735, 300, 0, 0, 2059, 0, 0, 0, 0, 0, 0);

-- Traitor to the Bloodsail -- [A/H] http://wotlk.openwow.com/quest=9259
DELETE FROM `quest_template` WHERE `ID`=9259;
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES 
(9259, 0, -1, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 7, 0, 87, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Traitor to the Bloodsail', '', 'That mangy dog, Revilgaz, has offered to pardon any former Bloodsails willing to turn on their cap\'n! That bilge sucker asked me to go an\' off me ole\' mates and to bring back their bandannas as proof.', NULL, 'Return to Bloodsail Traitor in Stranglethorn Vale.', 0, 0, 0, 0, 0, 0, 0, 0, 4306, 2604, 0, 0, 0, 0, 40, 4, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- 
-- Quest Urok Doomhowl [A] - http://www.wowhead.com/quest=4867/urok-doomhowl
SET @MAGUS    = 10602;
SET @ENFORCER = 10601;
SET @UROK     = 10584;
SET @OGUID    = 21202;

UPDATE `creature_template` SET `faction`=40 WHERE  `entry`IN(10601,10602);

DELETE FROM `gameobject` WHERE `id` IN(175571,175584);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 175571, 229, 3, 1, -47.90947, -369.0891, 51.54253, 1.378809, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+1, 175571, 229, 3, 1, -27.88039, -385.8911, 48.50668, 3.700105, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+2, 175571, 229, 3, 1, -13.72754, -384.8161, 48.97457, 3.68265, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+3, 175571, 229, 3, 1, -12.36894, -376.4748, 49.335, 5.044002, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+4, 175571, 229, 3, 1, -24.88243, -369.6189, 49.70592, 3.403396, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+5, 175584, 229, 3, 1, -14.3415, -395.7287, 48.53813, 2.862335, 0, 0, 0, 1, -1, 255, 0), -- 175584 (Area: 0)
(@OGUID+6, 175571, 229, 3, 1, -34.54366, -370.2325, 50.3396, 5.358161, 0, 0, 0, 1, -1, 255, 1); -- 175571 (Area: 0)

UPDATE `gameobject` SET `position_y`=-395.729 WHERE  `guid`=99791;

DELETE FROM `event_scripts` WHERE `id`=4845;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(4845, 0, 9, @OGUID+0, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+1, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+2, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+3, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+4, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+5, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+6, 66, 0, 0, 0, 0, 0),

(4845, 5, 10, @MAGUS, 900000, 0, -33.04, -385.57, 48.60, 5.98),
(4845, 5, 10, @ENFORCER, 900000, 0, -16.12, -376.99, 49.20, 4.89),
(4845, 5, 10, @ENFORCER, 900000, 0, -25.13, -376.60, 48.94, 5.17),
(4845, 13, 10, @MAGUS, 900000, 0, -14.93, -381.99, 49.04, 4.70),
(4845, 28, 10, @MAGUS, 900000, 0, -35.47, -371.36, 50.22, 4.79),
(4845, 28, 10, @ENFORCER, 900000, 0, -47.54, -368.11, 51.67, 5.70),
(4845, 42, 10, @MAGUS, 900000, 0, -33.04, -385.57, 48.60, 5.98),
(4845, 42, 10, @MAGUS, 900000, 0, -14.58, -375.16, 49.31, 4.73),
(4845, 42, 10, @ENFORCER, 900000, 0, -24.91, -376.41, 48.95, 4.67),
(4845, 58, 10, @MAGUS, 900000, 0, -47.54, -368.11, 51.67, 5.70),
(4845, 66, 10, @UROK, 900000, 0, -23.97, -391.89, 48.58, 1.68);

-- Urok Ogre Magus SAI
SET @ENTRY := 10602;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,0,0,3400,4700,11,15979,64,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Ogre Magus - In Combat - Cast 'Arcane Bolt' (Normal Dungeon)"),
(@ENTRY,0,1,2,2,0,100,3,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - Between 0-15% Health - Flee For Assist (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,2,0,61,0,100,3,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - Between 0-15% Health - Say Line 0 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,3,0,16,0,100,2,6742,30,10000,15000,11,6742,0,0,0,0,0,7,0,0,0,0,0,0,0,"Urok Ogre Magus - On Friendly Unit Missing Buff 'Bloodlust' - Cast 'Bloodlust' (Normal Dungeon)"),
(@ENTRY,0,4,0,0,0,100,2,3000,4000,5000,8000,11,13747,1,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Ogre Magus - In Combat - Cast 'Slow' (Normal Dungeon)"),
(@ENTRY,0,5,0,54,0,100,1,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - On Just Summoned - Cast 'Simple Teleport' (No Repeat)"),
(@ENTRY,0,6,0,54,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Urok Ogre Magus - On Just Summoned - Start Attacking (No Repeat)");

-- NPC talk text insert
SET @ENTRY := 10602;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@ENTRY,0,0, '%s attempts to run away in fear!',16,0,100,0,0,0, 'combat Flee', 1150);

-- Urok Enforcer SAI
SET @ENTRY := 10601;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,3000,5000,3000,6000,11,16856,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Mortal Strike' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,1,0,1000,6000,7000,11,11084,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Shock' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,2,8000,8000,12000,17000,11,14516,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Strike' (Normal Dungeon)"),
(@ENTRY,0,3,0,54,0,100,1,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Enforcer - On Just Summoned - Cast 'Simple Teleport' (No Repeat)"),
(@ENTRY,0,4,0,54,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Urok Enforcer - On Just Summoned - Start Attacking (No Repeat)");

-- Beer Basted Boar Ribs -- [A] http://www.wowhead.com/quest=384/beer-basted-boar-ribsS

UPDATE `quest_template_addon` SET `RequiredSkillID`='0', `RequiredSkillPoints`='0' WHERE  `ID`=384;

-- Quest Fields of Grief - [H] - http://www.wowhead.com/quest=407/fields-of-grief
-- Captured Scarlet Zealot SAI
SET @ENTRY := 1931;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,407,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Quest '' Finished - Run Script"),
(@ENTRY,0,1,2,6,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - Despawn Instant"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - ACTION_SET_CORPSE_DELAY 2 sec"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,200,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - ACTION_SET_RESPAWN_TIME 2 sec");

-- Actionlist SAI
SET @ENTRY := 193100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,11,3287,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Cast 'Ghoul Form'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2292,239.481,27.0892,0.693878,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2287.97,236.253,27.0892,2.6613,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,2292.52,235.226,27.0892,4.8345,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2288.96,237.96,27.0892,2.48773,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,51,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Kill Target");

-- [Q] Rumors for Kravel - http://www.wowhead.com/quest=1117/rumors-for-kravel
-- Kravel Koalbeard SAI
SET @ENTRY := 4452;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1117,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Rumors for Kravel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 445200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Remove Flag Standstate Kneel");

-- Actionlist SAI
SET @ENTRY := 445200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Remove Flag Standstate Kneel"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,200,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,5,94,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 94"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 0"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 16"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Set Flag Standstate Kneel");

DELETE FROM `creature_text` WHERE `entry`=4452;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4452, 0, 0, '%s listens to $N\'s plea.', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 1, 0, 'You were right to come. My wisdom will be yours.', 12, 0, 100, 0, 0, 0, 'Kravel Koalbeard');

-- [Q] Saving Sharpbeak - http://www.wowhead.com/quest=2994/saving-sharpbeak
-- Sharpbeak's Cage SAI
SET @ENTRY := 144070;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,45,1,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Cage - On Gameobject State Changed - Set Data 1 0");
UPDATE `creature` SET `spawntimesecs`=60 WHERE  `guid`=92997;

-- Sharpbeak SAI
SET @ENTRY := 8023;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Remove Flag Standstate Dead"),
(@ENTRY,0,1,0,61,0,100,0,1,8023,0,0,53,0,8023,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Start Waypoint"),
(@ENTRY,0,2,0,61,0,100,0,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Set Active On"),
(@ENTRY,0,3,0,40,0,100,0,1,8023,0,0,12,8024,3,120000,0,0,0,8,0,0,0,-150.362167,-3511.225830,274.172699,4.062795,"Sharpbeak - On Waypoint 1 Reached - Summon Creature 'Sharpbeak's Father'"),
(@ENTRY,0,4,0,38,0,100,0,2,0,0,0,29,2,270,0,0,0,0,19,8024,10,0,0,0,0,0,"Sharpbeak - On Data Set 2 0 - Start Follow Closest Creature 'Sharpbeak's Father'"),
(@ENTRY,0,5,0,38,0,100,0,3,0,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Sharpbeak - On Data Set 3 0 - Say Line 0"),
(@ENTRY,0,6,0,38,0,100,0,4,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 4 0 - Despawn Instant");

-- waypoints
DELETE FROM `waypoints` WHERE `entry` IN (8023, 8024);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(8023, 1, -229.494385, -3623.708740, 237.462433, 'Sharpbeak'),
(8024, 1, -230.034515, -3627.350098, 237.616638, 'Sharpbeak father'),
(8024, 2, -244.359818, -3638.187500, 236.659546, 'Sharpbeak father'),
(8024, 3, -227.883606, -3624.622314, 237.235733, 'Sharpbeak father'),
(8024, 4, -122.637520, -3502.211914, 256.078064, 'Sharpbeak father');

UPDATE `creature_template` SET `InhabitType`=4, `speed_walk`=2 WHERE  `entry` IN (8024, 8025, 8023);
UPDATE `creature_template` SET `faction`=250 WHERE  `entry` IN (8024, 8025);

-- Sharpbeak's Father SAI
SET @ENTRY := 8024;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Just Summoned - Set Active On"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,53,0,8024,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,12,8025,3,120000,0,0,0,8,0,0,0,-168.569000,-3509.420166,276.238770,4.320847,"Sharpbeak's Father - On Just Summoned - Summon Creature 'Sharpbeak's Mother'"),
(@ENTRY,0,3,0,40,0,100,0,1,8024,0,0,45,2,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 1 Reached - Set Data 2 0"),
(@ENTRY,0,4,0,40,0,100,0,2,8024,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 2 Reached - Pause Waypoint"),
(@ENTRY,0,5,0,40,0,100,0,3,8024,0,0,45,3,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 3 Reached - Set Data 3 0"),
(@ENTRY,0,6,7,40,0,100,0,4,8024,0,0,45,4,0,0,0,0,0,9,0,0,100,0,0,0,0,"Sharpbeak's Father - On Waypoint 4 Reached - Set Data 4 0"),
(@ENTRY,0,7,0,61,0,100,0,4,8024,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 4 Reached - Despawn Instant");

-- Sharpbeak's Mother SAI
SET @ENTRY := 8025;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Mother - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,29,2,90,0,0,0,0,19,8024,20,0,0,0,0,0,"Sharpbeak's Mother - On Just Summoned - Start Follow Closest Creature 'Sharpbeak's Father'"),
(@ENTRY,0,2,0,38,0,100,0,4,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Mother - On Data Set 4 0 - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=8023;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8023, 0, 0, '%s chirps a goodbye to $n.', 16, 0, 100, 0, 0, 0, 'Sharpbeak');

-- A Terrible Purpose  - Reward - http://wotlk.openwow.com/quest=8287
DELETE FROM `quest_template_addon` WHERE `ID`=8287;
INSERT INTO `quest_template_addon` (`ID`, `RewardMailTemplateID`, `RewardMailDelay`, `PrevQuestID`, `ProvidedItemCount`) VALUES 
(8287, 110, 86400, 8279, 1);

DELETE FROM `mail_loot_template` WHERE `entry`=110;
INSERT INTO `mail_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(110, 20645, 0, 100, 0, 0, 0, 1, 1, NULL);

-- Suntara Stones (3367)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=8284);
UPDATE creature_template SET unit_flags=4096, ScriptName='' WHERE entry=8284;
-- Dorius Stonetender SAI
SET @ENTRY := 8284;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,10,11,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Respawn - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,1,2,19,0,100,0,3367,0,0,0,53,1,8284,0,3367,30000,1,7,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Start Waypoint"),
(@ENTRY,0,2,3,61,0,100,0,3367,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,3,0,61,0,100,0,3367,0,0,0,91,255,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Remove Flag <Unknown bytes1 (UnitStandStateType)>"),
(@ENTRY,0,4,5,40,0,100,0,36,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Waypoint 36 Reached - Pause Waypoint"),
(@ENTRY,0,5,6,61,0,100,0,36,0,0,0,12,5856,4,30000,0,1,0,8,0,0,0,-6753.4,-1790.25,256.8,2.81,"Dorius Stonetender - On Waypoint 36 Reached - Summon Creature 'Glassweb Spider'"),
(@ENTRY,0,6,0,61,0,100,0,36,0,0,0,12,5856,4,30000,0,1,0,8,0,0,0,-6760.36,-1812.86,256.69,1.57,"Dorius Stonetender - On Waypoint 36 Reached - Summon Creature 'Glassweb Spider'"),
(@ENTRY,0,7,8,40,0,100,0,61,0,0,0,12,8338,4,30000,0,1,0,8,0,0,0,-6370.26,-1974.93,256.79,3.55,"Dorius Stonetender - On Waypoint 61 Reached - Summon Creature 'Dark Iron Marksman'"),
(@ENTRY,0,8,0,61,0,100,0,61,0,0,0,45,1,1,0,0,0,0,19,8338,50,0,0,0,0,0,"Dorius Stonetender - On Waypoint 61 Reached - Set Data 1 1"),
(@ENTRY,0,9,11,8,0,100,0,61512,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Spellhit 'Shoot' - Kill Self"),
(@ENTRY,0,10,0,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Respawn - Set Flag Standstate Dead"),
(@ENTRY,0,11,0,61,0,100,0,61512,0,0,0,41,0,0,0,0,0,0,19,8284,50,0,0,0,0,0,"Dorius Stonetender - On Spellhit 'Shoot' - Despawn Instant"),
(@ENTRY,0,12,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Aggro - Say Line 0");
UPDATE creature_template SET AIName='SmartAI' WHERE entry=8338;
DELETE FROM smart_scripts WHERE entryorguid=8338 AND source_type=0;
INSERT INTO smart_scripts VALUES (8338, 0, 0, 1, 38, 0, 100, 0, 1, 1, 0, 0, 11, 61512, 0, 0, 0, 0, 0, 19, 8284, 50, 0, 0, 0, 0, 0, 'On Data Set - Cast At Dorius');
DELETE FROM waypoints WHERE entry=8284;
INSERT INTO waypoints VALUES (8284, 1, -7006.92, -1744, 234.1, 'Dorius Stonetender'),(8284, 2, -7007.75, -1732.05, 234.099, 'Dorius Stonetender'),(8284, 3, -7005.47, -1724.57, 234.099, 'Dorius Stonetender'),(8284, 4, -7001.05, -1727.62, 235.274, 'Dorius Stonetender'),(8284, 5, -6991.56, -1734.18, 239.239, 'Dorius Stonetender'),(8284, 6, -6983.94, -1734.93, 241.622, 'Dorius Stonetender'),(8284, 7, -6976.7, -1724.36, 241.667, 'Dorius Stonetender'),(8284, 8, -6974.22, -1720.38, 243.028, 'Dorius Stonetender'),(8284, 9, -6973.37, -1715.84, 243.68, 'Dorius Stonetender'),(8284, 10, -6971.87, -1711.4, 241.999, 'Dorius Stonetender'),(8284, 11, -6961.39, -1700.4, 240.744, 'Dorius Stonetender'),(8284, 12, -6956.36, -1695.64, 241.267, 'Dorius Stonetender'),(8284, 13, -6952.62, -1692.92, 242.201, 'Dorius Stonetender'),(8284, 14, -6941.59, -1686.27, 243.609, 'Dorius Stonetender'),(8284, 15, -6931.58, -1680.24, 241.976, 'Dorius Stonetender'),(8284, 16, -6925.64, -1676.66, 241.205, 'Dorius Stonetender'),(8284, 17, -6916.67, -1671.26, 243.154, 'Dorius Stonetender'),
(8284, 18, -6906.39, -1669.08, 243.1, 'Dorius Stonetender'),(8284, 19, -6895.02, -1666.73, 244.364, 'Dorius Stonetender'),(8284, 20, -6888.45, -1671.61, 243.537, 'Dorius Stonetender'),(8284, 21, -6883.87, -1675.19, 243.67, 'Dorius Stonetender'),(8284, 22, -6878.07, -1679.1, 245.459, 'Dorius Stonetender'),(8284, 23, -6866.53, -1680.46, 251.159, 'Dorius Stonetender'),(8284, 24, -6847.84, -1680.24, 251.522, 'Dorius Stonetender'),(8284, 25, -6837.27, -1680.11, 251.522, 'Dorius Stonetender'),(8284, 26, -6824.46, -1679.9, 251.531, 'Dorius Stonetender'),(8284, 27, -6809.48, -1682.39, 250.33, 'Dorius Stonetender'),(8284, 28, -6807.54, -1685.24, 251.937, 'Dorius Stonetender'),(8284, 29, -6799.99, -1697.03, 259.171, 'Dorius Stonetender'),(8284, 30, -6791.55, -1705.01, 259.55, 'Dorius Stonetender'),(8284, 31, -6783.92, -1712.23, 259.55, 'Dorius Stonetender'),(8284, 32, -6779.7, -1724.39, 259.55, 'Dorius Stonetender'),(8284, 33, -6779.37, -1740.73, 259.574, 'Dorius Stonetender'),(8284, 34, -6778.38, -1749.98, 259.551, 'Dorius Stonetender'),
(8284, 35, -6776.43, -1761.44, 257.466, 'Dorius Stonetender'),(8284, 36, -6772.3, -1785.59, 256.858, 'Dorius Stonetender'),(8284, 37, -6761.17, -1794.08, 256.763, 'Dorius Stonetender'),(8284, 38, -6748.43, -1802.23, 255.501, 'Dorius Stonetender'),(8284, 39, -6731.69, -1812.94, 253.554, 'Dorius Stonetender'),(8284, 40, -6717.92, -1815.5, 252.284, 'Dorius Stonetender'),(8284, 41, -6700.58, -1817.83, 250.448, 'Dorius Stonetender'),(8284, 42, -6685.6, -1820.35, 249.568, 'Dorius Stonetender'),(8284, 43, -6675.33, -1831.45, 248.962, 'Dorius Stonetender'),(8284, 44, -6661.43, -1848.66, 246.148, 'Dorius Stonetender'),(8284, 45, -6654.52, -1859.53, 245.18, 'Dorius Stonetender'),(8284, 46, -6641.54, -1877.53, 244.144, 'Dorius Stonetender'),(8284, 47, -6628.57, -1895.53, 244.15, 'Dorius Stonetender'),(8284, 48, -6616.58, -1909.78, 244.72, 'Dorius Stonetender'),(8284, 49, -6603.96, -1915.83, 244.205, 'Dorius Stonetender'),(8284, 50, -6592.88, -1919.32, 244.152, 'Dorius Stonetender'),(8284, 51, -6572.35, -1923.48, 244.152, 'Dorius Stonetender'),(8284, 52, -6551.56, -1931.24, 244.151, 'Dorius Stonetender'),
(8284, 53, -6528.76, -1943.08, 244.151, 'Dorius Stonetender'),(8284, 54, -6509.06, -1953.3, 244.151, 'Dorius Stonetender'),(8284, 55, -6484.21, -1966.2, 244.151, 'Dorius Stonetender'),(8284, 56, -6461.49, -1975.08, 244.267, 'Dorius Stonetender'),(8284, 57, -6444.5, -1979.29, 244.423, 'Dorius Stonetender'),(8284, 58, -6432.82, -1979.66, 245.315, 'Dorius Stonetender'),(8284, 59, -6414.18, -1981.05, 247.111, 'Dorius Stonetender'),(8284, 60, -6401.38, -1981.34, 247.193, 'Dorius Stonetender'),(8284, 61, -6388.25, -1984.19, 246.733, 'Dorius Stonetender');
DELETE FROM `creature_text` WHERE `entry`=8284;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(8284, 0, 0, 'It\'s on! Enemy, meet my fists. Fists, say hello to enemy.', 12, 0, 100, 0, 0, 0, 0, 'Dorius Stonetender'),
(8284, 0, 1, 'I\'m about to open a can on this enemy.', 12, 0, 100, 0, 0, 0, 0, 'Dorius Stonetender');
-- A Sample of Slime... -- http://www.wowhead.com/quest=4293/a-sample-of-slime
UPDATE quest_template_addon SET NextQuestId=0, ExclusiveGroup=0 WHERE Id IN (4293, 4294);

-- The Gift That Keeps On Giving -- http://www.wowhead.com/quest=12698
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=190769;
DELETE FROM smart_scripts WHERE entryorguid=190769 AND source_type=1;
INSERT INTO smart_scripts VALUES (190769, 1, 0, 1, 60, 0, 100, 1, 2000, 2000, 0, 0, 93, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gift of the Harvester - On Update - SendCustomAnim');
INSERT INTO smart_scripts VALUES (190769, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 52479, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gift of the Harvester - On Update - Cast Spell');
DELETE FROM spell_script_names WHERE spell_id=52479;
UPDATE creature_template SET minlevel=56, maxlevel=56 WHERE entry=28845;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=28846;
DELETE FROM smart_scripts WHERE entryorguid=28846 AND source_type=0;
INSERT INTO smart_scripts VALUES (28846, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Ghost - On Respawn - Attack Start');
-- [Q] A Fine Mess (2904)
UPDATE creature_template SET AIName='', ScriptName='npc_kernobee' WHERE entry=7850;

-- [Q] Sunken Temple - Support for quest 3447: Secret of the Circle 
SET @GO_GUID := 5521;
SET @ALTAR := 148836;
SET @LIGHT := 148883;
SET @ATAL_ALARION := 8580;
SET @ATALAI_IDOL := 148838;

-- Altar of Hakkar
UPDATE `gossip_menu_option` SET `action_menu_id`=1302 WHERE `menu_id`=1288;
-- SAI: Add Pattern of lights
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@ALTAR;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALTAR AND `source_type`=1 AND `id`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALTAR*100 AND `source_type`=9 AND `id` BETWEEN 0 AND 5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ALTAR,1,0,0,62,0,100,0,1288,0,0,0,80,@ALTAR*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run script'),
(@ALTAR*100,9,0,0,1,0,100,0,0,0,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-515.553,95.25821,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,1,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-419.8487,94.48368,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,2,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-491.4003,135.9698,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,3,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-491.4909,53.48179,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,4,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-443.8549,136.1007,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,5,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-443.4171,53.83124,-148.7401,-1.500983, 'Script - Summon Temp GO');

-- Mini-boss Atal'alarion <Guardian of the Idol> and GameObject Idol of Hakkar
DELETE FROM `creature` WHERE `guid`=34521 AND `id`=@ATAL_ALARION; -- spawned by script

DELETE FROM `gameobject` WHERE `guid`=@GO_GUID AND `id`=@ATALAI_IDOL; -- spawned but hidden until creature die
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneid`,`areaid`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
(@GO_GUID,@ATALAI_IDOL,109,0,0,3,1,-476.2693,94.41199,-189.7297,1.588249,0,0,0,1,-1,255,1,12340);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ATAL_ALARION AND `source_type`=0 AND `id`=7;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ATAL_ALARION,0,7,0,6,0,100,0,0,0,0,0,70,7200,0,0,0,0,0,14,@GO_GUID,@ATALAI_IDOL,0,0,0,0,0, 'Atal''alarion - On Just Died - Respawn Idol of Hakkar');

-- DB/Quest: Matrix Punchograph quests http://www.wowhead.com/item=9327/security-delta-data-access-card#comments
/* remove corescript */
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE  `entry` IN (142345, 142475, 142476, 142696);

/* Matrix Punchograph 3005-A */
DELETE FROM `smart_scripts` WHERE `entryorguid`=142345 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(142345, 1, 0, 1, 62, 0, 100, 0, 1045, 0, 0, 0, 56, 9280, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip  - add yellow card'),
(142345, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 57, 9279, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - disadd white card'),
(142345, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - close gossip');

/* Matrix Punchograph 3005-C */
DELETE FROM `smart_scripts` WHERE `entryorguid`=142476 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(142476, 1, 0, 1, 62, 0, 100, 0, 1049, 0, 0, 0, 56, 9281, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip  - add red card'),
(142476, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 57, 9282, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - disadd blue card'),
(142476, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1047 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1047, 1, 0, 'Use engineering to access hidden schematics.', 1, 1, 0, 0, 0, 0, '');
     
-- Matrix Punchograph 3005-B SAI
SET @ENTRY := 142475;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,62,0,100,0,1047,0,0,0,56,9282,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Add Item 'Blue Punch Card' 1 Time"),
(@ENTRY,1,1,2,61,0,100,0,1047,0,0,0,57,9280,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Remove Item 'Yellow Punch Card' 1 Time"),
(@ENTRY,1,2,0,61,0,100,0,1047,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,1,4,5,62,0,100,0,1047,1,0,0,85,4011,2,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 1 Selected - Invoker Cast 'Minor Recombobulator'"),
(@ENTRY,1,5,0,61,0,100,0,1047,1,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 1 Selected - Close Gossip");
     
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1050 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1050, 1, 0, 'Use engineering to access hidden schematics.', 1, 1, 0, 0, 0, 0, '');
     
-- Matrix Punchograph 3005-D SAI
SET @ENTRY := 142696;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,62,0,100,0,1050,0,0,0,56,9316,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Add Item 'Prismatic Punch Card' 1 Time"),
(@ENTRY,1,1,2,61,0,100,0,1050,0,0,0,57,9281,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Remove Item 'Red Punch Card' 1 Time"),
(@ENTRY,1,2,0,61,0,100,0,1050,0,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,1,4,5,62,0,100,0,1050,1,0,0,85,11595,2,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 1 Selected - Invoker Cast 'Discombobulator Ray'"),
(@ENTRY,1,5,0,61,0,100,0,1050,1,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 1 Selected - Close Gossip");
     
/* conditions for all gossips */
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (1045, 1047, 1049, 1050);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 1045, 0, 0, 0, 2, 0, 9279, 1, 0, 0, 0, 0, '', 'Show gossip option if player has White Punch Card'),
(15, 1047, 0, 0, 0, 2, 0, 9280, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Yellow Punch Card'),
(15, 1049, 0, 0, 0, 2, 0, 9282, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Blue Punch Card'),
(15, 1050, 0, 0, 0, 2, 0, 9281, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Red Punch Card'),
(15, 1047, 1, 0, 0, 7, 0, 202, 140, 0, 0, 0, 0, '', 'Show gossip option if player has Engineering 140'),
(15, 1050, 1, 0, 0, 7, 0, 202, 140, 0, 0, 0, 0, '', 'Show gossip option if player has Engineering 140');

-- [Q] The Prodigal Lich Returns -- http://wotlk.openwow.com/?quest=411
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN(1498, 5666);
DELETE FROM `creature_text` WHERE `entry` IN(1498, 5666);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(1498, 0, 0, 'Farewell, my friend.', 12, 0, 100, 0, 0, 0, 'Bethor Iceshard'),
(5666, 0, 0, 'It has been a long time, Bethor, my friend.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage'),
(5666, 1, 0, 'When time permits, we must speak at length.  For we have much to discuss.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage'),
(5666, 2, 0, 'And thank you, $n.  Without your aid I may never have found my way to the Forsaken.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=1498;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 1, 1498, 0, 0, 29, 1, 5666, 10, 0, 1, 0, 0, '', 'Only run SAI if no Gunther''s Visage near');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(1498, 5666, 149800, 566600) AND `source_type` IN(0, 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1498, 0, 0, 0, 20, 0, 100, 0, 411, 0, 0, 0, 80, 149800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Quest ''The Prodigal Lich Returns'' Finished - Run Script'),
(5666, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 566600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Just Summoned - Run Script'),
(149800, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 7762, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Script - Cast ''Summon Gunther''s Visage'''),
(149800, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 12, 5666, 3, 23000, 0, 0, 0, 8, 0, 0, 0, 1768.58, 55.4891, -46.3198, 2.28248, 'Bethor Iceshard - On Script - Summon Creature ''Gunther''s Visage'''),
(149800, 9, 2, 0, 0, 0, 100, 0, 23000, 23000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Script - Say Line 0'),
(566600, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Set Run Off'),
(566600, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1766.39, 65.0166, -46.3214, 1.51672, 'Gunther''s Visage - On Script - Move To Position'),
(566600, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 0'),
(566600, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 1'),
(566600, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Set Orientation Closest Player'),
(566600, 9, 5, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 2 Closest Player');

-- DB/Quest: Elixir of Agony - Endevent -- http://wotlk.openwow.com/?quest=524
-- Dusty Rug SAI
SET @ENTRY := 1728;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,20,0,100,0,524,0,0,0,45,1,0,0,0,0,0,11,2284,50,0,0,0,0,0,"Dusty Rug - On Quest 'Elixir of Agony' Finished - Set Data 1 0");

-- npc 1
-- Captured Farmer SAI
SET @GUID := -15893;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589300,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,0.439,-940.84,61.93,4.94,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- npc 2
-- Captured Farmer SAI
SET @GUID := -15891;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,0.524,-944.41,61.93,1.66,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- npc 3
-- Captured Farmer SAI
SET @GUID := -15892;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589200,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1.632,-942.43,61.93,6.14,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- [Q] Stranglethorn Fever -- http://wotlk.openwow.com/quest=349
-- Actionlist SAI
SET @ENTRY := 144900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,12,1511,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Enraged Silverback Gorilla'"),
(@ENTRY,9,1,0,0,0,100,0,28000,28000,0,0,12,1516,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Konda'"),
(@ENTRY,9,2,0,0,0,100,0,20000,20000,0,0,12,1514,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Mokk the Savage'");

-- Enraged Silverback Gorilla SAI
SET @ENTRY := 1511;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enraged Silverback Gorilla - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Enraged Silverback Gorilla - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

-- Konda SAI
SET @ENTRY := 1516;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Konda - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Konda - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

-- Mokk the Savage SAI
SET @ENTRY := 1514;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mokk the Savage - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Mokk the Savage - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

DELETE FROM `waypoints` WHERE `entry`=151100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(151100, 1, -13827.2, 8.52635, 20.5824),
(151100, 2, -13813.6, 5.66898, 26.1583),
(151100, 3, -13802.9, 6.12354, 30.2606),
(151100, 4, -13793.4, 5.90325, 32.4506),
(151100, 5, -13784.7, 3.8825, 36.0005),
(151100, 6, -13777.5, -0.0832987, 39.5015),
(151100, 7, -13769, -6.19992, 43.0507),
(151100, 8, -13764, -11.6944, 44.8876),
(151100, 9, -13757.9, -15.1257, 45.1735),
(151100, 10, -13751.8, -18.5569, 44.0262),
(151100, 11, -13745.9, -22.2345, 44.7542),
(151100, 12, -13738.1, -27.4341, 44.5899);
UPDATE `creature_template` SET `speed_walk`=1.16 WHERE  `entry`=1511;

-- [Q] Brothers In Death(q.12725) -- http://wotlk.openwow.com/quest=12725
-- Thassarian SAI
SET @ENTRY := 28913;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,12725,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Quest 'Brothers In Death' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 2891300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,7000,7000,0,0,17,0,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Emote State 0"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,45,1,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Data 1 0"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.0962126,"Thassarian - On Script - Set Orientation 0,0962126"),
(@ENTRY,9,7,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 0"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 1"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 2"),
(@ENTRY,9,10,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 3"),
(@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5000,"Thassarian - On Script - Set Orientation 5000"),
(@ENTRY,9,12,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 4"),
(@ENTRY,9,13,0,0,0,100,0,3000,3000,0,0,45,2,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Data 2 0"),
(@ENTRY,9,14,0,0,0,100,0,2000,2000,0,0,17,8,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Emote State 8"),
(@ENTRY,9,15,0,0,0,100,0,2000,2000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Set Active Off");

-- Orbaz Bloodbane SAI
SET @ENTRY := 28914;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,12757,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Quest 'Scarlet Armies Approach...' Taken - Run Script"),
(@ENTRY,0,1,3,38,0,100,0,1,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.00062,"Orbaz Bloodbane - On Data Set 1 0 - Set Orientation 3,00062"),
(@ENTRY,0,2,4,38,0,100,0,2,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.23599,"Orbaz Bloodbane - On Data Set 2 0 - Set Orientation 5,23599"),
(@ENTRY,0,3,0,61,0,100,0,1,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Data Set 1 0 - Remove Flag Standstate Kneel"),
(@ENTRY,0,4,0,61,0,100,0,2,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Data Set 2 0 - Set Flag Standstate Kneel");

DELETE FROM `creature_text` WHERE `entry`=28913;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28913, 0, 0, 'What, Orbaz? That he\'s a blood elf?', 12, 0, 100, 6, 0, 0, ''), 
(28913, 1, 0, 'In life we were hated enemies - this is true...', 12, 0, 100, 1, 0, 0, ''), 
(28913, 2, 0, 'But in death... We are the children of the damned. The orphaned sons and daughters of the Scourge.', 12, 0, 100, 1, 0, 0, ''), 
(28913, 3, 0, 'In death we are brothers.', 12, 0, 100, 0, 0, 0, ''); 
 
DELETE FROM `creature_text` WHERE `entry`=28914 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28914, 1, 0, 'Why do you care, Thassarian?', 12, 0, 100, 6, 0, 0, ''), 
(28914, 2, 0, 'His weakness led to his capture.', 12, 0, 100, 1, 0, 0, ''), 
(28914, 3, 0, 'Only the strong should survive. Not to mention...', 12, 0, 100, 1, 0, 0, ''), 
(28914, 4, 0, 'To hell with you, Thassarian.', 12, 0, 100, 25, 0, 0, ''); 

-- DB/Quest: Translation to Ello -- http://wotlk.openwow.com/quest=252
DELETE FROM `waypoints` WHERE `entry`=412;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(412, 1, -10290.1, 73.7148, 38.849),
(412, 2, -10290.4, 81.547, 38.7702),
(412, 3, -10283.2, 86.6661, 38.7694),
(412, 4, -10271.1, 83.5772, 39.1122),
(412, 5, -10266, 76.0585, 39.4047),
(412, 6, -10272.4, 65.7703, 39.524),
(412, 7, -10283.4, 59.1681, 40.6902),
(412, 8, -10300.2, 45.8306, 47.3053),
(412, 9, -10315.3, 45.1015, 48.0097),
(412, 10, -10324.4, 38.7441, 47.3935),
(412, 11, -10330.2, 27.0829, 50.5753),
(412, 12, -10335.3, 13.4164, 50.1259),
(412, 13, -10342.2, 3.3501, 51.1675),
(412, 14, -10354.6, -13.0266, 47.1154),
(412, 15, -10379.4, -27.1456, 49.2841),
(412, 16, -10401, -30.8108, 48.1353),
(412, 17, -10416.5, -28.4794, 48.4772),
(412, 18, -10436.4, -34.2376, 46.5064),
(412, 19, -10468.7, -38.8985, 48.7035),
(412, 20, -10500.2, -44.6662, 45.882),
(412, 21, -10539.1, -39.3422, 43.0622),
(412, 22, -10568, -35.1434, 37.2048),
(412, 23, -10585.6, -37.5056, 37.4296),
(412, 24, -10606.3, -51.7202, 36.0713),
(412, 25, -10629.2, -64.211, 32.6163),
(412, 26, -10645.9, -73.4561, 32.7337),
(412, 27, -10671, -81.8316, 35.6535),
(412, 28, -10687.6, -85.57, 34.1549),
(412, 29, -10702.8, -89.2772, 37.9242),
(412, 30, -10709.1, -97.5837, 37.892),
(412, 31, -10725.6, -101.348, 34.5892),
(412, 32, -10748, -99.1517, 38.2323),
(412, 33, -10759.9, -93.0657, 38.5876),
(412, 34, -10774.9, -89.8001, 34.8007),
(412, 35, -10788.6, -86.7376, 33.4988),
(412, 36, -10802.7, -88.6347, 29.0679),
(412, 37, -10811.5, -97.1736, 29.2451),
(412, 38, -10821.4, -121.335, 30.142),
(412, 39, -10826.2, -134.391, 31.7845),
(412, 40, -10830.6, -148.284, 31.7985),
(412, 41, -10835.3, -164.201, 33.8299),
(412, 42, -10840.4, -182.63, 34.0254),
(412, 43, -10843.3, -193.104, 35.8227),
(412, 44, -10848.7, -215.175, 37.7986),
(412, 45, -10851.7, -235.779, 38.6853),
(412, 46, -10857.4, -264.019, 38.0974),
(412, 47, -10866.6, -293.454, 37.9429),
(412, 48, -10882.9, -332.562, 37.9688),
(412, 49, -10900, -365.26, 39.4542),
(412, 50, -10904.1, -393.833, 41.0451),
(412, 51, -10905.7, -431.964, 42.7237),
(412, 52, -10908, -461.901, 46.7191),
(412, 53, -10911.2, -510.492, 52.0594),
(412, 54, -10915.1, -533.78, 53.8047),
(412, 55, -10927, -565.685, 54.042),
(412, 56, -10936.5, -581.62, 53.8887),
(412, 57, -10950.1, -597.371, 55.177),
(412, 58, -10957.9, -619.554, 55.0689),
(412, 59, -10958.8, -637.183, 55.2047),
(412, 60, -10954.3, -652.46, 55.4423),
(412, 61, -10931.8, -681.568, 55.3955),
(412, 62, -10916.9, -710.733, 55.6988),
(412, 63, -10902.9, -734.1, 55.1313),
(412, 64, -10878.3, -760.091, 55.5638),
(412, 65, -10851.1, -787.76, 56.1885),
(412, 66, -10831.9, -818.655, 56.2795),
(412, 67, -10825.2, -833.223, 55.5758),
(412, 68, -10808.3, -873.497, 55.9567),
(412, 69, -10796.7, -912.719, 55.8731),
(412, 70, -10796.1, -934.562, 56.2303),
(412, 71, -10800.5, -949.721, 56.5614),
(412, 72, -10807.1, -969.027, 56.2941),
(412, 73, -10806.8, -992.166, 53.8349),
(412, 74, -10804.6, -1030.41, 47.0768),
(412, 75, -10801.3, -1047.26, 44.0233),
(412, 76, -10787.8, -1074.49, 37.7652),
(412, 77, -10783.3, -1095.07, 33.6488),
(412, 78, -10781.2, -1112.66, 30.3863),
(412, 79, -10763.6, -1138.91, 27.0977),
(412, 80, -10738, -1158.02, 26.4475),
(412, 81, -10705.3, -1179.29, 26.3723),
(412, 82, -10682.3, -1190.45, 27.2793),
(412, 83, -10662.5, -1193.06, 28.2884),
(412, 84, -10641.6, -1189.92, 28.5594),
(412, 85, -10615.7, -1182.78, 28.5022),
(412, 86, -10586.8, -1177.32, 28.3931),
(412, 87, -10576.4, -1179.26, 28.1946),
(412, 88, -10566.7, -1189.27, 27.8756),
(412, 89, -10557, -1192.38, 28.0606),
(412, 90, -10550.4, -1185.71, 27.8428),
(412, 91, -10554.4, -1167.97, 27.5984);

-- Lord Ello Ebonlocke SAI
SET @ENTRY := 263;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,20000,30000,120000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Ello Ebonlocke - Out of Combat - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,252,0,0,0,12,412,3,3600000,0,0,0,8,0,0,0,-10290.171875,72.781136,38.881119,4.801499,"Lord Ello Ebonlocke - On Quest 'Translation to Ello' Finished - Summon Creature 'Stitches'");

-- Stitches SAI
SET @ENTRY := 412;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6900,12100,3500,11300,11,3106,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stitches - In Combat - Cast 'Aura of Rot'"),
(@ENTRY,0,1,2,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Just Summoned - Set Active On"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,53,1,412,0,0,0,2,0,0,0,0,0,0,0,0,"Stitches - On Just Summoned - Start Waypoint"),
(@ENTRY,0,3,0,40,0,100,0,47,412,0,0,1,0,0,0,0,0,0,19,468,200,0,0,0,0,0,"Stitches - On Waypoint 47 Reached - Say Line 0"),
(@ENTRY,0,5,6,40,0,100,0,50,412,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 50 Reached - Say Line 0"),
(@ENTRY,0,6,0,61,0,100,0,50,412,0,0,1,1,0,0,0,0,0,19,468,200,0,0,0,0,0,"Stitches - On Waypoint 50 Reached - Say Line 1"),
(@ENTRY,0,7,8,40,0,100,0,91,412,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 91 Reached - Set Home Position"),
(@ENTRY,0,8,0,61,0,100,0,91,412,0,0,89,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 91 Reached - Start Random Movement");

DELETE FROM `creature_text` WHERE `entry` IN (468, 412);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(468, 0, 0, 'An abomination of the undead is approaching!', 14, 0, 100, 0, 0, 0, 'Guard'),
(468, 1, 0, 'The abomination has overrun the Night Watch camp! Quickly, we must intercept it before it reaches town!', 14, 0, 100, 0, 0, 0, 'Guard'),
(412, 0, 0, 'ROARRRRR!!', 14, 0, 100, 0, 0, 0, 'Stitches'),
(412, 0, 1, 'DARKSHIRE... I HUNGER!!', 14, 0, 100, 0, 0, 0, 'Stitches');

-- DB/Quest: Harlan Needs a Resupply -- http://wotlk.openwow.com/quest=333
-- Rema Schneider SAI
SET @ENTRY := 1428;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,333,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rema Schneider - On Quest 'Harlan Needs a Resupply' Finished - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,0,333,0,0,0,12,1433,3,600000,0,0,0,8,0,0,0,-8765.4,717.344,99.5342,3.88159,"Rema Schneider - On Quest 'Harlan Needs a Resupply' Finished - Summon Creature 'Corbett Schneider'");

DELETE FROM `creature_text` WHERE `entry` In (1428, 1433, 1427, 483);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(1428, 0, 0, 'Corbett, dear. Harlan needs a load of knitted shirts and pants as soon as we can manage.', 12, 0, 100, 0, 0, 0, 'Rema Schneider'), 
(1428, 0, 1, 'Corbett, you there? Harlan needs another load of knitted goods. Can you take it to him?', 12, 0, 100, 0, 0, 0, 'Rema Schneider'), 
-- 
(1433, 0, 0, 'My pleasure, sugar drop. I''ll be back soon...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 0, 1, 'Business must be good down at the bazaar. I''ll get him resupplied right away!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 1, 0, 'Hm... after dropping this off, I think I''ll head to that cheese shop for a snack.', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 1, 1, 'I should have a few extra coins from this sale. Maybe I''ll buy myself some lunch...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 2, 0, 'Glad to see you''re doing so well, Harlan. And I hope to see you again soon?', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 2, 1, 'Well, I am off than. Take care, Harlan!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 3, 0, 'Now for that snack...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 4, 0, 'Hullo, Trias clan! A ball of your smoked mozzarella, if you please!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 4, 1, 'Good day. Elling! Hullo Elaine! Let me have a wheel of blue cheese, eh?', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 5, 0, 'Yes ma''am, business is brisk!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 6, 0, 'Thanks for the cheese!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 7, 0, 'Time to get back to the shop...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 8, 0, 'I''m back!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
-- 
(1427, 0, 0, 'Hey Harlan. Here''s a load of knitted cloth for you.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 0, 1, 'Oomph! Here''s a load of supplies. It must be selling fast!', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 1, 0, 'Ah yes, and promptly delivered. As always, it''s a pleasure doing business with you, Corbett.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 1, 1, 'Ahh, much appreciated, Corbett. We''ll get these on the racks immediately.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
-- 
(483, 0, 0, 'Good day, Corbett. Here''s your cheese, fresh made this morning! And how are things at your shop?', 12, 0, 100, 0, 0, 0, 'Elaine Trias'), 
(483, 0, 1, 'Hi Corbett! Here, you go! I trust business is faring well at your clothier shop...?', 12, 0, 100, 0, 0, 0, 'Elaine Trias'); 

DELETE FROM `waypoints` WHERE `entry`=1433;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(1433, 1, -8768.19, 715.132, 99.5343),
(1433, 2, -8776.53, 714.943, 99.5343),
(1433, 3, -8764.02, 718.846, 99.5343),
(1433, 4, -8756.49, 726.23, 98.1827),
(1433, 5, -8737.77, 700.301, 98.7146),
(1433, 6, -8776.04, 669.29, 103.093),
(1433, 7, -8760.53, 646.648, 103.862),
(1433, 8, -8759.42, 624.292, 101.056),
(1433, 9, -8770.38, 609.041, 97.2165),
(1433, 10, -8797.7, 588.021, 97.3042),
(1433, 11, -8818.46, 616.102, 94.9164),
(1433, 12, -8818.67, 626.67, 93.9437),
(1433, 13, -8791.16, 634.711, 94.5033),
(1433, 14, -8779.68, 637.628, 97.2233),
(1433, 15, -8781.26, 638.974, 97.2233),
(1433, 16, -8781.68, 637.128, 97.2233),
(1433, 17, -8825.46, 624.483, 93.8268),
(1433, 18, -8849.64, 602.755, 92.1315),
(1433, 19, -8864.55, 585.043, 92.84),
(1433, 20, -8856.92, 577.403, 95.375),
(1433, 21, -8849.48, 570.495, 94.68),
(1433, 22, -8856.92, 577.403, 95.375),
(1433, 23, -8864.55, 585.043, 92.84),
(1433, 24, -8837.26, 611.555, 93.3786),
(1433, 25, -8843.4, 642.051, 95.825),
(1433, 26, -8850.36, 660.501, 97.1423),
(1433, 27, -8825.86, 677.315, 97.6257),
(1433, 28, -8843.57, 720.188, 97.4082),
(1433, 29, -8801.84, 745.453, 97.5976),
(1433, 30, -8773.15, 740.631, 99.4496),
(1433, 31, -8757.46, 725.815, 98.2184),
(1433, 32, -8769.03, 714.77, 99.5337),
(1433, 33, -8778.93, 715.753, 99.5337),
(1433, 34, -8775.91, 719.409, 101.569),
(1433, 35, -8770.39, 724.865, 105.913),
(1433, 36, -8765.45, 721.19, 105.913);

-- Corbett Schneider SAI
SET @ENTRY := 1433;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,0,1433,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,1,1433,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 1 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,7,1433,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 7 Reached - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,15,1433,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 15 Reached - Run Script"),
(@ENTRY,0,5,0,40,0,100,0,21,1433,0,0,80,@ENTRY*100+03,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 21 Reached - Run Script"),
(@ENTRY,0,6,0,40,0,100,0,32,1433,0,0,80,@ENTRY*100+04,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 32 Reached - Run Script"),
(@ENTRY,0,7,0,40,0,100,0,36,1433,0,0,80,@ENTRY*100+05,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 36 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 143300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0");

-- Actionlist SAI
SET @ENTRY := 143301;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 143302;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,1427,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,1427,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,30000,30000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 3");

-- Actionlist SAI
SET @ENTRY := 143303;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 4"),
(@ENTRY,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,19,483,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,0,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 5"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 6"),
(@ENTRY,9,5,0,0,0,100,0,25000,25000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 7");

-- Actionlist SAI
SET @ENTRY := 143304;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 8");

-- Actionlist SAI
SET @ENTRY := 143305;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Despawn In 2000 ms");

-- DB/Quest: Arugal Must Die -- http://wotlk.openwow.com/quest=1014
-- Dalar Dawnweaver SAI
SET @ENTRY := 1938;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,5,0,20,0,100,0,1014,0,0,0,75,8097,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dalar Dawnweaver - On Quest 'Arugal Must Die' Finished - Add Aura 'Intellect'");

-- DB/Quest: The Plaguebringer's Request -- http://wotlk.openwow.com/quest=12716
-- Noth the Plaguebringer SAI
SET @ENTRY := 28919;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,12716,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Noth the Plaguebringer - On Quest 'The Plaguebringer's Request' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2891900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,52706,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Plague Cauldron'");

DELETE FROM `creature_text` WHERE `entry`=28919;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28919, 0, 0, 'My task is done!', 12, 0, 100, 0, 0, 0, 'Noth the Plaguebringer');

-- Set Them Ablaze! -- http://wotlk.openwow.com/quest=3463
-- Squire Maltrake SAI
SET @ENTRY := 8509;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,3463,0,0,0,41,1,0,0,0,0,0,19,8479,20,0,0,0,0,0,"Squire Maltrake - On Quest 'Set Them Ablaze!' Finished - Despawn Instant"),
(@ENTRY,0,1,0,61,0,100,0,3463,0,0,0,12,8480,3,54000,0,0,0,8,0,0,0,-6679.93,-1194.36,240.297,2.96706,"Squire Maltrake - On Quest 'Set Them Ablaze!' Finished - Summon Creature 'Kalaran the Deceiver'");

-- factionchange 
UPDATE `creature_template` SET `faction`=35, `InhabitType`=4 WHERE  `entry`=8480;
UPDATE `creature` SET `spawntimesecs`=120 WHERE `id`=8479;

-- Kalaran the Deceiver SAI
SET @ENTRY := 8480;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kalaran the Deceiver - On Just Summoned - Run Script");

-- Actionlist SAI
SET @ENTRY := 848000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,19,8509,20,0,0,0,0,0,"On Script - Say Line 0"), -- 
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.65994,"On Script - Set Orientation 4,65994"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,8509,20,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,10,0,0,0,100,0,3000,3000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 6"),
(@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 7"),
(@ENTRY,9,12,0,0,0,100,0,5000,5000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 8"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-6879.3,-1187.34,253.384,3.10877,"On Script - Move To Position");

DELETE FROM `creature_text` WHERE `entry`=8480;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8480, 0, 0, 'Glorious, indeed, Maltrake. It looks as if my plan worked perfectly. Wouldn\'t you say so, mortal?', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 1, 0, '%s lets loose a reptilian laugh... at least you think it\'s a laugh.', 16, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 2, 0, 'You would not have helped the legion of Blackrock had we just asked for your assistance, now would you?', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 3, 0, 'SILENCE FOOL!', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 4, 0, 'They will live of only to see the fruits of their labor: the destruction and chaos that will surely ensue as the legion of Blackrock invade the gorge.', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 5, 0, 'I leave you now, mortals. Alive and with these trinkets. Maltrake! Present them with the trinkets!', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 6, 0, '%s begins to flap his massive wings faster. He is preparing for flight.', 16, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 7, 0, 'Oh yes, the molt - do not lose it. There are those of my kin in the Burning Steppes that would craft items that only the molt of the black dragonflight could fortify.', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 8, 0, 'The legion of Blackrock comes, dwarflings! We shall scorch the earth and set fire to the heavens. None shall survive...', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver');

DELETE FROM `creature_text` WHERE `entry`=8509;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8509, 0, 0, 'What will we do with them, master? They are of no use to us anymore.', 12, 0, 100, 1, 0, 0, 'Squire Maltrake'),
(8509, 1, 0, 'Right away, master!', 12, 0, 100, 0, 0, 0, 'Squire Maltrake');
 
 
/* 
*/ 
-- Hunting for Ectoplasm - http://www.wowhead.com/quest=8924/hunting-for-ectoplasm
-- Ectoplasmic Distiller SAI
SET @ENTRY := 181057;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,1,0,100,0,1000,1000,1000,1000,75,27420,0,0,0,0,0,17,0,20,0,0,0,0,0,"Ectoplasmic Distiller - Out of Combat - Add Aura 'Ectoplasmic Distiller'");

DELETE FROM `conditions` WHERE `ConditionValue1`=27420;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(1, 8538, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8539, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8540, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8541, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8542, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
-- 
(1, 7523, 21936, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Frozen Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 7524, 21936, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Frozen Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
-- 
(1, 12178, 21937, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Scorched Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 12179, 21937, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Scorched Ectoplasm - only lootable if player has aura Ectoplasmic Distiller');

-- [Q] Report to Orgnil - http://www.wowhead.com/quest=823/report-to-orgnil
-- Orgnil Soulscar SAI
SET @ENTRY := 3142;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,806,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgnil Soulscar - On Quest 'Dark Storms' Finished - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,823,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgnil Soulscar - On Quest 'Report to Orgnil' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 314200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=3142 AND `groupid` IN (1, 2);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3142, 1, 0, '%s listens to $N report...', 16, 0, 100, 0, 0, 0, 'Orgnil Soulscar'),
(3142, 2, 0, 'What?? The Burning Blade is spreading! We must investigate!', 12, 0, 100, 0, 0, 0, 'Orgnil Soulscar');

-- [Q] The Tear of the Moons - http://www.wowhead.com/quest=857/the-tear-of-the-moons
-- Feegly the Exiled SAI
SET @ENTRY := 3421;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Feegly the Exiled - On Quest Finished - Run Script"),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,3,3421,0,0,0,0,0,1,0,0,0,0,0,0,0,"Feegly the Exiled - On Respawn - Morph To Creature Feegly the Exiled");

-- Actionlist SAI
SET @ENTRY := 342100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 4"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.13708,"On Script - Set Orientation 5,13708"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,3,724,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Morph To Creature Burly Rockjaw Trogg"),
(@ENTRY,9,7,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4217.93,-2343.5,91.6918,4.6415,"On Script - Move To Position"),
(@ENTRY,9,8,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

DELETE FROM `creature_text` WHERE `entry`=3421;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3421, 0, 0, 'The power of the Tear of the Moons is mine! Mine I say!', 14, 0, 100, 5, 0, 0, 'Feegly the Exiled'),
(3421, 1, 0, '%s begins to rub the Tear of the Moons.', 16, 0, 100, 0, 0, 0, 'Feegly the Exiled'),
(3421, 2, 0, 'Power! Glorious power!', 12, 0, 100, 15, 0, 0, 'Feegly the Exiled'),
(3421, 3, 0, '%s begins to make strange grunting noises. The Tear of the Moons drops to the ground and shatters.', 16, 0, 100, 0, 0, 0, 'Feegly the Exiled');
UPDATE `creature` SET position_x = -4218.656250, position_y = -2339.575684, position_z = 91.730965, orientation = 1.864294, spawntimesecs = 60 WHERE guid = 14138;

-- [Q] Zanzil's Secret - http://www.wowhead.com/quest=621/zanzils-secret
-- Crank Fizzlebub SAI
SET @ENTRY := 2498;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,621,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crank Fizzlebub - On Quest 'Zanzil's Secret' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 249800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2498;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2498, 0, 0, 'Thank you, $N.', 12, 0, 100, 0, 0, 0, 'Crank Fizzlebub'),
(2498, 1, 0, 'I\'m sure I can find a use for this mixture...', 12, 0, 100, 0, 0, 0, 'Crank Fizzlebub');

-- [Q] Message in a Bottle - http://www.wowhead.com/quest=630/message-in-a-bottle
-- Princess Poobah SAI
SET @ENTRY := 2634;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,630,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Princess Poobah - On Quest 'Message in a Bottle' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 263400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 3"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=2634;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2634, 0, 0, 'Thank you again for your aid. May the wind always be at your back during your travels.', 12, 0, 100, 0, 0, 0, 'Princess Poobah');

-- [Q] The Broken Sigil - http://www.wowhead.com/quest=640/the-broken-sigil
-- Tor'gan SAI
SET @ENTRY := 2706;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,10,0,100,0,0,8,5000,5000,39,30,1,0,0,0,0,1,0,0,0,0,0,0,0,"Tor'gan - Within 0-8 Range Out of Combat LoS - Call For Help"),
(@ENTRY,0,1,0,20,0,100,0,640,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tor'gan - On Quest 'Das zerbrochene Siegel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 270600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 15"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=2706;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2706, 0, 0, 'Easier than I expected... the sigil of Thoradin is whole, once again.', 12, 0, 100, 0, 0, 0, 'Tor\'gan');

-- [Q] Sunken Treasure - http://www.wowhead.com/quest=670/sunken-treasure
-- Shakes O'Breen SAI
SET @ENTRY := 2610;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,5,0,20,0,100,0,670,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shakes O'Breen - On Quest 'Sunken Treasure' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 261001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=2610 AND `groupid`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2610, 2, 0, 'Wait, $N!!! It looks like we\'re going to need some help here...', 12, 0, 100, 0, 0, 0, 'Shakes');

-- [Q] Guile of the Raptor - http://www.wowhead.com/quest=702/guile-of-the-raptor
-- Gor'mul SAI
SET @ENTRY := 2792;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1500,4900,39000,46000,11,4153,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor'mul - In Combat - Cast 'Guile of the Raptor'"),
(@ENTRY,0,1,0,20,0,100,0,702,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor'mul - On Quest 'Guile of the Raptor' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 279200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4153,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Guile of the Raptor'"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Play Emote 15"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=2792;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2792, 0, 0, '%s watches as his blood begins to stir, and the guile of the raptor slips through him.', 16, 0, 100, 0, 0, 0, 'Gor\'mul'),
(2792, 1, 0, 'What is this power that flows through me? Is this the power of shamanism that Tor\'gan spoke of...?', 12, 0, 100, 0, 0, 0, 'Gor\'mul'),
(2792, 2, 0, 'Amazing! I feel... renewed. My strength returns!', 12, 0, 100, 0, 0, 0, 'Gor\'mul');

-- Mull Thunderhorn Questrewardscripts - [H] - http://www.wowhead.com/npc=2948/mull-thunderhorn
SET @ENTRY := 2948;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,748,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Poison Water' Finished - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,756,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Thunderhorn Totem' Finished - Run Script"),
(@ENTRY,0,2,0,20,0,100,0,759,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Thunderhorn TotemWildmane Totem' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 294800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2948;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2948, 0, 0, '%s begins a rite of creation...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 1, 0, 'I have created the totem. You, $N, must cleanse the well.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 2, 0, '%s creates a new totem...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 3, 0, 'The totem is made, $N.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 4, 0, '%s transforms the items $N gave him into a totem of cleansing...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 5, 0, 'The totem is made. The well may now be cleansed.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn');

-- 2
-- Actionlist SAI
SET @ENTRY := 294801;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3");

-- 3
-- Actionlist SAI
SET @ENTRY := 294802;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,5,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 5");

-- [Q] The Elder Crone - http://www.wowhead.com/quest=1063/deprecated-the-elder-crone
-- Magatha Grimtotem SAI
SET @ENTRY := 4046;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1063,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'The Elder Crone' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 404600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=4046;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4046, 0, 0, '%s listens to $N\'s plea.', 16, 0, 100, 0, 0, 0, 'Magatha Grimtotem'),
(4046, 1, 0, 'You were right to come. My wisdom will be yours.', 12, 0, 100, 0, 0, 0, 'Magatha Grimtotem');

-- [Q] Blood of Innocents - http://www.wowhead.com/quest=1066/deprecated-blood-of-innocents
-- Apothecary Lydon SAI
SET @ENTRY := 2216;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1066,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Lydon - On Quest 'Blood of Innocents' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 221600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2216;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2216, 0, 0, '%s creates his toxin...', 16, 0, 100, 0, 0, 0, 'Apothecary Lydon'),
(2216, 1, 0, 'There we are, $N. The toxin is ready.', 12, 0, 100, 0, 0, 0, 'Apothecary Lydon');

-- [Q] Return to Thunder Bluff - http://www.wowhead.com/quest=1067/deprecated-return-to-thunder-bluff
-- Apothecary Zamah SAI
SET @ENTRY := 3419;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1067,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Zamah - On Quest 'Return to Thunder Bluff' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 341900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=3419;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3419, 0, 0, '%s fills a container with the toxin.', 16, 0, 100, 0, 0, 0, 'Apothecary Zamah'),
(3419, 1, 0, 'The toxin is ready, $N.', 12, 0, 100, 0, 0, 0, 'Apothecary Zamah');

-- [Q] Rumors for Kravel + Parts for Kravel
-- Kravel Koalbeard SAI
SET @ENTRY := 4452;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1117,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Rumors for Kravel' Finished - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,1112,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Parts for Kravel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 445201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,50,19878,0,0,0,0,0,8,0,0,0,-6232.038574,-3854.885986,-58.749821,3.866077,"On Script - Summon Gameobject 'Parts Crate'"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4");

DELETE FROM `creature_text` WHERE `entry`=4452 AND `groupid` IN (2,3,4);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4452, 2, 0, '%s places the crate of parts on the ground.', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 3, 0, '%s grabs a part and puts it in his pocket...', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 4, 0, 'There, that should do it...', 12, 0, 100, 0, 0, 0, 'Kravel Koalbeard');

-- [Q] Dream Dust in the Swamp - http://www.wowhead.com/quest=1116/dream-dust-in-the-swamp
-- Krazek SAI
SET @ENTRY := 773;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1116,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krazek - On Quest 'Dream Dust in the Swamp' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 77300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,11,6903,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Krazek's Drug'"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3");

DELETE FROM `creature_text` WHERE `entry`=773;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(773, 0, 0, '%s snorts a speck of dream dust up his nose...', 16, 0, 100, 0, 0, 0, 'Krazek'),
(773, 1, 0, '%s is dazed...', 16, 0, 100, 0, 0, 0, 'Krazek'),
(773, 2, 0, 'ACHOO!', 12, 0, 100, 0, 0, 0, 'Krazek'),
(773, 3, 0, 'Wow! $N, that dream dust is powerful stuff!', 12, 0, 100, 0, 0, 0, 'Krazek');

-- [Q] Identifying the Brood - http://www.wowhead.com/quest=1169/deprecated-identifying-the-brood
-- Draz'Zilb SAI
SET @ENTRY := 4501;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1169,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Draz'Zilb - On Quest 'Identifying the Brood' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 450100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,6741,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Identify Brood'"),
(@ENTRY,9,2,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=4501;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4501, 0, 0, '%s begins to cast a spell over the hearts and tongues.', 16, 0, 100, 0, 0, 0, 'Draz\'Zilb'),
(4501, 1, 0, 'The brood of Onyxia!', 14, 0, 100, 0, 0, 0, 'Draz\'Zilb');

-- [Q] Load Lightening - http://www.wowhead.com/quest=1176/load-lightening
-- Pozzik SAI
SET @ENTRY := 4630;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1176,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pozzik - On Quest 'Load Lightening' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 463000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=4630;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4630, 0, 0, 'Okay, crew. Get to work on getting these bones installed.', 12, 0, 100, 0, 0, 0, 'Pozzik');

-- [Q] Nothing But The Truth - http://www.wowhead.com/quest=1383/nothing-but-the-truth
-- Apothecary Faustin SAI
SET @ENTRY := 5414;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1383,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Faustin - On Quest 'Nothing But The Truth' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 541400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,5088,0,180000,0,0,0,8,0,0,0,-3837.25,-4548.3,9.29486,0.786911,"On Script - Summon Creature 'Falgran Hastil'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.23291,"On Script - Set Orientation 6,23291"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,5,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 69"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 0"),
(@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.14159,"On Script - Set Orientation 3,14159"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=5414;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(5414, 0, 0, 'The serum will only take a few seconds to prepare, $N.', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin'),
(5414, 1, 0, 'Almost done...', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin'),
(5414, 2, 0, 'At last, the serum is complete, $N. Now, come closer. We must talk.', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin');

-- [Q] The Temple of Atal'Hakkar - http://www.wowhead.com/quest=1445/deprecated-the-temple-of-atalhakkar
-- Fel'zerul SAI
SET @ENTRY := 1443;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,1062,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'Goblin Invaders' Finished - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,0,1062,0,0,0,11,7437,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'Goblin Invaders' Finished - Cast 'Break Stuff'"),
(@ENTRY,0,2,0,20,0,100,0,1445,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'The Temple of Atal'Hakkar' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 144300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,11,7437,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Break Stuff'");

DELETE FROM `creature_text` WHERE `entry`=1443;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(1443, 1, 0, 'I hereby destroy these instruments of evil! For the Horde!', 14, 0, 100, 0, 0, 0, 'Fel\'zerul');

-- [Q] Barov Family Fortune - http://www.wowhead.com/quest=5341/barov-family-fortune
-- Alexi Barov SAI
SET @ENTRY := 11022;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,5341,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alexi Barov - On Quest 'Barov Family Fortune' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1102200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 1");

DELETE FROM `creature_text` WHERE `entry`=11022;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11022, 0, 0, 'The deeds are mine, brother! Soon you shall be out of my way for good!', 12, 0, 100, 0, 0, 0, 'Alexi Barov');

-- Therylune's Escape - http://www.wowhead.com/quest=945/therylunes-escape
-- Therylune SAI
SET @ENTRY := 3584;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,945,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Say Line 0"),
(@ENTRY,0,1,5,61,0,100,0,945,0,0,0,53,0,3584,0,0,0,2,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Start Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,20,3584,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Therylune - On Waypoint 20 Reached - Say Line 1"),
(@ENTRY,0,3,0,61,0,100,0,20,3584,0,0,15,945,0,0,0,0,0,18,50,0,0,0,0,0,0,"Therylune - On Waypoint 20 Reached - Quest Credit 'Therylune's Escape'"),
(@ENTRY,0,4,0,40,0,100,0,21,3584,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Waypoint 21 Reached - Despawn In 5000 ms"),
(@ENTRY,0,5,7,61,0,100,0,945,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Set Faction 250"),
(@ENTRY,0,6,8,11,0,100,0,0,0,0,0,2,124,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Respawn - Set Faction 124"),
(@ENTRY,0,7,9,61,0,100,0,945,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Remove Flag Immune To NPC's"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Respawn - Set Flag Immune To NPC's"),
(@ENTRY,0,9,0,61,0,100,0,945,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Remove Npc Flag Questgiver");

-- Celebras Scepter Event - http://www.wowhead.com/quest=7046/the-scepter-of-celebras
DELETE FROM `waypoints` WHERE `entry`=13716;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(13716, 1, 654.905, 87.382, -86.8597, 'Celebras Scepter Event'),
(13716, 2, 657.207, 80.8004, -86.8318, 'Celebras Scepter Event'),
(13716, 3, 656.58, 73.1467, -86.8285, 'Celebras Scepter Event'),
(13716, 4, 652.437, 73.9764, -85.3354, 'Celebras Scepter Event'),
(13716, 5, 656.595, 73.5683, -86.8284, 'Celebras Scepter Event'),
(13716, 6, 655.724, 67.3549, -86.828, 'Celebras Scepter Event'),
(13716, 7, 650.08, 65.0115, -86.7745, 'Celebras Scepter Event'),
(13716, 8, 655.445, 67.6601, -86.8283, 'Celebras Scepter Event'),
(13716, 9, 657.399, 78.0873, -86.8283, 'Celebras Scepter Event'),
(13716, 10, 652.611, 86.3702, -86.8453, 'Celebras Scepter Event');

-- Celebras the Redeemed SAI
SET @ENTRY := 13716;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,7046,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Quest 'The Scepter of Celebras' Started - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,3,13716,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,4,13716,0,0,80,@ENTRY*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 4 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,7,13716,0,0,54,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 7 Reached - Pause Waypoint"),
(@ENTRY,0,4,0,40,0,100,0,10,13716,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 10 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 1371600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,654.905,87.382,-86.8597,5.06689,"On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,53,0,13716,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Start Waypoint"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,21,100,0,0,0,0,0,0,"On Script - Say Line 2");

-- Actionlist SAI
SET @ENTRY := 1371601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,11,21916,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Celebras Waiting'"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5");

-- Actionlist SAI
SET @ENTRY := 1371602;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 6"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 7"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,11,21950,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Recite Words of Celebras'"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,50,178964,60,0,0,0,0,8,0,0,0,652.263,74.0125,-85.3354,6.10288,"On Script - Summon Gameobject 'Celebras Blue Aura'");

-- Actionlist SAI
SET @ENTRY := 1371603;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,10000,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,15,7046,0,0,0,0,0,17,0,100,0,0,0,0,0,"Celebras the Redeemed - On Script - Quest Credit 'The Scepter of Celebras'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Script - Add Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=13716;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(13716, 0, 0, 'You wish to learn of the stone? Follow me.', 12, 0, 100, 0, 0, 0, 8952, 'Celebras Scepter Event'),
(13716, 1, 0, 'For so long I have drifted in my cursed form. You have freed me... Your hard work shall be repaid.', 12, 0, 100, 0, 0, 0, 8953, 'Celebras Scepter Event'),
(13716, 2, 0, 'Please do as I instruct you, $N.', 12, 0, 100, 0, 0, 0, 8954, 'Celebras Scepter Event'),
(13716, 3, 0, 'Read this tome I have placed before you, and speak the words aloud.', 12, 0, 100, 0, 0, 0, 8950, 'Celebras Scepter Event'),
(13716, 4, 0, '%s begins to channel his energy, focusing on the stone.', 16, 0, 100, 0, 0, 0, 8951, 'Celebras Scepter Event'),
(13716, 5, 0, 'Together, the two parts shall become one, once again.', 12, 0, 100, 0, 0, 0, 8948, 'Celebras Scepter Event'),
(13716, 6, 0, 'Shal myrinan ishnu daldorah...', 12, 0, 100, 0, 0, 0, 8949, 'Celebras Scepter Event'),
(13716, 7, 0, 'My scepter will once again become whole!', 12, 0, 100, 0, 0, 0, 8955, 'Celebras Scepter Event');

-- [Q] The Videre Elixir - http://www.wowhead.com/quest=4041
UPDATE `creature_template` SET `ScriptName` = 'npc_miblon_snarltooth' WHERE `entry` =9467;
DELETE FROM `gameobject` WHERE `guid` = 17428;

-- [Q] One Shot. One Kill. (5713) - http://www.wowhead.com/quest=5713
-- Blackwood Tracker SAI
SET @ENTRY := 11713;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,60000,60000,11,6950,64,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Tracker - In Combat - Cast 'Faerie Fire'");

-- Marosh the Devious SAI
SET @ENTRY := 11714;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,60000,60000,11,6950,64,0,0,0,0,2,0,0,0,0,0,0,0,"Marosh the Devious - In Combat - Cast 'Faerie Fire'");

UPDATE `creature_template` SET `ScriptName`='npc_aynasha' WHERE  `entry`=11711;

DELETE FROM `creature_text` WHERE `entry`=11711;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11711, 0, 0, 'Wait... did you hear that? Something approaches from the west!', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 1, 0, 'I\'ve run out of arrows! I\'m afraid if any more come you will need to take them on by yourself my friend.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 2, 0, 'Praise Elune! I don\'t know if I could have survived the day without you, friend.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 3, 0, 'My legs feels much better now, the remedy must be working. If you will excuse me, I must go report to my superiors about what has transpired here.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 4, 0, 'Please speak with Sentinel Onaeya at Maestra\'s Post in Ashenvale, she will see to it that you are properly rewarded for your bravery this day.', 12, 0, 100, 0, 0, 0, 'npc_aynasha');

DELETE FROM `script_waypoint` WHERE entry=11711;
INSERT INTO `script_waypoint` (entry, pointid, location_x, location_y, location_z, waittime, point_comment) VALUES
(11711, 0, 4389.716309, -66.750832, 86.549103, 0, 'npc_aynasha'); 

-- [Q] Sathrah's Sacrifice - http://www.wowhead.com/item=8155/sathrahs-sacrifice
-- Sathrah's Sacrifice
DELETE FROM `event_scripts` WHERE `id`=2313;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(2313, 0, 10, 7411, 3000000, 0, 9639.5,2528.97,1331.72,5.28395);

-- Spirit of Sathrah SAI
SET @ENTRY := 7411;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,0,7411,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Sathrah - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,9,7411,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Sathrah - On Waypoint 9 Reached - Despawn In 3000 ms");

DELETE FROM `waypoints` WHERE `entry`=7411;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(7411, 1, 9642.47,2523.25,1331.54, 'Spirit of Sathrah'),
(7411, 2, 9640.32,2517.43,1331.57, 'Spirit of Sathrah'),
(7411, 3, 9635.62,2514.35,1331.4, 'Spirit of Sathrah'),
(7411, 4, 9630.91,2515.59,1331.72, 'Spirit of Sathrah'),
(7411, 5, 9626.52,2520.1,1331.73, 'Spirit of Sathrah'),
(7411, 6, 9625.02,2526.36,1331.61, 'Spirit of Sathrah'),
(7411, 7, 9630.56,2532.58,1331.39, 'Spirit of Sathrah'),
(7411, 8, 9636.59,2532.65,1331.73, 'Spirit of Sathrah'),
(7411, 9, 9640.05,2529.06,1331.77, 'Spirit of Sathrah');

-- [Q] Trek to Ashenvale - http://www.wowhead.com/quest=990/trek-to-ashenvale
-- Senetil Selarin spawn after completition of quest=995 or quest=994
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3694;
-- Terenthis SAI
SET @ENTRY := 3693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,995,0,0,0,12,3694,6,180000,0,0,0,8,0,0,0,6339.14,341.764,24.3387,0.498114,"Terenthis - On Quest 'Escape Through Stealth' Finished - Summon Creature 'Sentinel Selarin'"),
(@ENTRY,0,1,0,20,0,100,0,994,0,0,0,12,3694,6,180000,0,0,0,8,0,0,0,6339.14,341.764,24.3387,0.498114,"Terenthis - On Quest 'Escape Through Force' Finished - Summon Creature 'Sentinel Selarin'");

-- Sentinel Selarin SAI
SET @ENTRY := 3694;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,54,0,100,0,0,0,0,0,53,1,3694,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,23,3694,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 23 Reached - Despawn Instant"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Just Summoned - Set Active On"),
(@ENTRY,0,3,0,40,0,100,0,1,3694,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,4,0,40,0,100,0,12,3694,0,0,54,120000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 12 Reached - Pause Waypoint");

DELETE FROM `waypoints` WHERE `entry`=3694;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(3694, 1, 6339.14,341.764,24.3387, 'Sentinel Selarin'),
(3694, 2, 6353.39,354.557,22.3779, 'Sentinel Selarin'),
(3694, 3, 6368.99,357.894,21.5712, 'Sentinel Selarin'),
(3694, 4, 6387.81,359.455,18.9899, 'Sentinel Selarin'),
(3694, 5, 6398.12,363.588,17.366, 'Sentinel Selarin'),
(3694, 6, 6403.68,370.92,15.6815, 'Sentinel Selarin'),
(3694, 7, 6416.57,392.998,12.0215, 'Sentinel Selarin'),
(3694, 8, 6424.95,399.193,10.9586, 'Sentinel Selarin'),
(3694, 9, 6428.93,396.971,11.1736, 'Sentinel Selarin'),
(3694, 10, 6432,388.708,13.7662, 'Sentinel Selarin'),
(3694, 11, 6436.71,375.264,13.9403, 'Sentinel Selarin'),
(3694, 12, 6434.92,367.203,13.9403, 'Sentinel Selarin'), 
(3694, 13, 6436.9,374.833,13.9403, 'Sentinel Selarin'),
(3694, 14, 6431.63,389.723,13.5875, 'Sentinel Selarin'),
(3694, 15, 6428.84,397.45,11.0941, 'Sentinel Selarin'),
(3694, 16, 6424,400.084,10.9784, 'Sentinel Selarin'),
(3694, 17, 6413.76,392.804,12.2825, 'Sentinel Selarin'),
(3694, 18, 6401.4,368.195,16.4249, 'Sentinel Selarin'),
(3694, 19, 6393.69,360.887,18.1549, 'Sentinel Selarin'),
(3694, 20, 6377.21,357.731,20.6589, 'Sentinel Selarin'),
(3694, 21, 6358.35,357.353,22.2106, 'Sentinel Selarin'),
(3694, 22, 6348.45,352.662,22.6056, 'Sentinel Selarin'),
(3694, 23, 6322.42,326.649,25.3338, 'Sentinel Selarin');

-- [Q] Mana Surges - http://www.wowhead.com/quest=1957/mana-surges
-- 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=2 AND `SourceEntry`=6550;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 2, 6550, 0, 0, 9, 0, 1957, 0, 0, 0, 0, 0, '', 'Mana Surge - Allow sai action only if quest has been taken');

-- Tabetha SAI
SET @ENTRY := 6546;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,4961,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Cleansing of the Orb of Orahil' Taken - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,1957,0,0,0,9,0,0,0,0,0,0,14,28294,103680,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Activate Gameobject"),
(@ENTRY,0,2,3,19,0,100,0,1957,0,0,0,9,0,0,0,0,0,0,14,28294,103680,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Activate Gameobject"),
(@ENTRY,0,3,6,61,0,100,0,1957,0,0,0,87,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Run Random Script"),
(@ENTRY,0,4,0,38,1,100,0,1,1,0,0,87,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Data Set 1 1 - Run Random Script (Phase 1)"),
(@ENTRY,0,5,0,19,0,100,0,1955,0,0,0,12,6549,4,180000,0,0,0,8,0,0,0,-4042.29,-3372.32,35.1924,5.2417,"Tabetha - On Quest 'The Exorcism' Taken - Summon Creature 'Demon of the Orb'"),
(@ENTRY,0,6,0,61,0,100,0,1957,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Set Event Phase 1"),
(@ENTRY,0,7,8,20,0,100,0,1957,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Set Event Phase 0"),
(@ENTRY,0,8,0,61,0,100,0,1957,0,0,0,45,2,2,0,0,0,0,9,6550,0,200,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Set Data 2 2");

-- Actionlist SAI
SET @ENTRY := 654601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,3,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Actionlist SAI
SET @ENTRY := 654602;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.99,-3394.54,38.5507,1.8342,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.99,-3394.54,38.5507,1.8342,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Actionlist SAI
SET @ENTRY := 654603;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,3,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Mana Surge SAI
SET @ENTRY := 6550;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,1,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mana Surge - On Just Summoned - Start Random Movement (No Repeat)"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,6546,0,0,0,0,0,0,"Mana Surge - On Just Died - Set Data 1 1"),
(@ENTRY,0,2,0,0,0,100,0,3000,4000,8000,8000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mana Surge - In Combat - Cast 'Shock'"),
(@ENTRY,0,3,0,38,0,100,0,2,2,0,0,41,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mana Surge - On Data Set 2 2 - Despawn In 10 ms");

-- [Q] It's a Secret to Everybody - http://www.wowhead.com/quest=3908/its-a-secret-to-everybody
-- Donova Snowden SAI
SET @ENTRY := 9298;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,3908,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Donova Snowden - On Quest 'It's a Secret to Everybody' Finished - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,3908,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Donova Snowden - On Quest 'It's a Secret to Everybody' Finished - Set Active On");

-- Actionlist SAI
SET @ENTRY := 929800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,6384.54,-2527.25,538.736,2.52438,"On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,69,0,0,0,0,0,0,8,0,0,0,6370.12,-2525.52,532.268,2.82283,"On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,5,61,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 61"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,7,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,6364.25,-2524,527.058,2.9265,"On Script - Move To Position"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,9,0,0,0,100,0,1000,1000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 16"),
(@ENTRY,9,10,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,6370.3,-2524.19,532.27,6.26836,"On Script - Move To Position"),
(@ENTRY,9,12,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,6385.99,-2529.26,539.03,5.66753,"On Script - Move To Position"),
(@ENTRY,9,13,0,0,0,100,0,8000,8000,0,0,69,0,0,0,0,0,0,8,0,0,0,6395.57,-2536.75,541.548,5.66753,"On Script - Move To Position"),
(@ENTRY,9,14,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.86475,"On Script - Set Orientation 2,86475"),
(@ENTRY,9,15,0,0,0,100,0,1000,1000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5"),
(@ENTRY,9,16,0,0,0,100,0,1000,1000,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flags Gossip & Questgiver");

DELETE FROM `creature_text` WHERE `entry`=9298;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(9298, 0, 0, 'Please, follow me.', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 1, 0, 'I haven\'t really figured out what it is, but there\'s something strange about the hot springs...', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 2, 0, '%s tosses the sword into the shallow pool.', 16, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 3, 0, 'I\'ve found that when I throw something into this water, it has improved incredibly when I retrieve it.', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 4, 0, 'Well, whatever it is, it works quite well!', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 5, 0, 'And I am determined to find out more... So if you need my help again, you know where I\'ll be.', 12, 0, 100, 0, 0, 0, 'Donova Snowden');

-- [Q] Propaganda War - Endevent - http://www.wowhead.com/quest=11128/propaganda-war
-- Calia Hastings SAI
SET @ENTRY := 23566;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,11128,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Calia Hastings - On Quest 'Propaganda War' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2356600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3817.38,-4566.12,8.84245,1.07843,"On Script - Move To Position"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3816.62,-4564.31,8.97211,1.1499,"On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,5,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 69"),
(@ENTRY,9,7,0,0,0,100,0,9000,9000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 0"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-3817.38,-4566.12,8.84245,0,"On Script - Move To Position"),
(@ENTRY,9,9,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3819.74,-4562.35,9.14216,2.40855,"On Script - Move To Position"),
(@ENTRY,9,10,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,11,0,0,0,100,0,2000,2000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag Questgiver"),
(@ENTRY,9,12,0,0,0,100,0,1000,1000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=23566;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(23566, 0, 0, 'It would be a shame to let these leaflets go to waste, wouldn\'t it?', 12, 0, 100, 1, 0, 0, 'Calia Hastings'), 
(23566, 1, 0, 'With just a little creative editing, these are much more useful...', 12, 0, 100, 0, 0, 0, 'Calia Hastings'); 

-- [Q] The Tower of Althalaxx - http://www.wowhead.com/quest=970/the-tower-of-althalaxx
-- Delgren the Purifier SAI
SET @ENTRY := 3663;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Delgren the Purifier - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,2,20,0,100,0,970,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Delgren the Purifier - On Quest 'The Tower of Althalaxx' Finished - Run Script"),
(@ENTRY,0,2,0,61,0,100,0,970,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Delgren the Purifier - On Quest 'The Tower of Althalaxx' Finished - Set Active On");

-- Actionlist SAI
SET @ENTRY := 366300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 1"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.80526,"On Script - Set Orientation 2,80526"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,50,19862,60,0,0,0,0,8,0,0,0,3184.06,190.81,4.61263,5.55407,"On Script - Summon Gameobject 'Glowing Soulgem'"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,5,61,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 61"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,12,4509,3,38000,0,0,0,8,0,0,0,3184.06,190.81,4.61263,5.55407,"On Script - Summon Creature 'Sargath'"),
(@ENTRY,9,7,0,0,0,100,0,27000,27000,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 6"),
(@ENTRY,9,9,0,0,0,100,0,11000,11000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,10,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.471239,"On Script - Set Orientation 0,471239");

-- Sargath SAI
SET @ENTRY := 4509;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 0 (No Repeat)"), 
(@ENTRY,0,1,0,1,0,100,1,7000,7000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 1 (No Repeat)"),
(@ENTRY,0,2,0,1,0,100,1,12000,12000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 2 (No Repeat)"),
(@ENTRY,0,3,0,1,0,100,1,17000,17000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 3 (No Repeat)"),
(@ENTRY,0,4,0,1,0,100,1,22000,22000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 4 (No Repeat)"),
(@ENTRY,0,5,0,1,0,100,1,32000,32000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 5 (No Repeat)");


DELETE FROM `creature_text` WHERE `entry`=3663;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3663, 0, 0, 'A simple enough task to break this soulstone!', 12, 0, 100, 0, 0, 0, ''),
(3663, 1, 0, 'Soulgem bursts open!', 16, 0, 100, 0, 0, 0, ''),
(3663, 2, 0, 'Then we must put an end to Athrikus Narassin. Tell me, spirit, where might we find the other soulgems, to undo his magic?', 12, 0, 100, 0, 0, 0, ''),
(3663, 3, 0, 'Sargath fades into the mist...', 16, 0, 100, 0, 0, 0, '');

-- [Q] For Love Eternal - http://wowwiki.wikia.com/wiki/Quest:For_Love_Eternal
-- Cerellean Whiteclaw SAI
SET @ENTRY := 3644;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,20,0,100,0,963,0,0,0,12,3843,3,45000,0,0,0,8,0,0,0,6426.84,603.166,9.46655,4.14031,"Cerellean Whiteclaw - On Quest 'For Love Eternal' Finished - Summon Creature 'Anaya'"),
(@ENTRY,0,1,0,1,0,100,0,15000,15000,15000,15000,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerellean Whiteclaw - Out of Combat - Play Emote 18"),
(@ENTRY,0,2,0,61,0,100,0,963,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerellean Whiteclaw - On Quest 'For Love Eternal' Finished - Run Script");

UPDATE `creature_template` SET `faction`=35 WHERE  `entry`=3843;
UPDATE `creature_text` SET `type`=12 WHERE  `entry`=3644 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `type`=12 WHERE  `entry`=3644 AND `groupid`=2 AND `id`=0;

-- [Q] Survey Alcaz Island - http://wotlk.openwow.com/quest=11142
UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` IN(4968,23704);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(4968,23704) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2370400) AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(4968, 0, 0, 1, 62, 0, 100, 0, 2465, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Close Gossip'),
(4968, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Say Line 6'),
(4968, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 23122, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Cast Jaina''s Autograph'),
(4968, 0, 3, 4, 20, 0, 100, 0, 11142, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Face player'),
(4968, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Say Line 0'), -- 04:20:13.000
(4968, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Set NPC Flags'), 
(4968, 0, 6, 0, 52, 0, 100, 0, 0, 4968, 0, 0, 1, 1, 7000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 0 - Say Line 1'), -- 04:20:18.000
(4968, 0, 7, 0, 52, 0, 100, 0, 1, 4968, 0, 0, 1, 2, 6000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 1 - Say Line 2'), -- 04:20:25.000
(4968, 0, 8, 0, 52, 0, 100, 0, 2, 4968, 0, 0, 1, 3, 7000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 2 - Say Line 3'), -- 04:20:31.000
(4968, 0, 9, 0, 52, 0, 100, 0, 3, 4968, 0, 0, 1, 4, 6000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 3 - Say Line 4'), -- 04:20:38.000
(4968, 0, 10, 0, 52, 0, 100, 0, 4, 4968, 0, 0, 1, 5, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 4 - Say Line 5'), -- 04:20:44.000
(4968, 0, 11, 12, 52, 0, 100, 0, 5, 4968, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 5 - Set Npc Flag'),
(4968, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 5 - Evade'),
(23704, 0, 0, 1, 62, 0, 100, 0, 8782, 0, 0, 0, 11, 42295, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Cassa Crimsonwing - On Gossip Option 0 Selected - Cast Spell 42295'),
(23704, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Cassa Crimsonwing - On Linked Actions - Close Gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=2465;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(2465, 0, 0, 'Lady Jaina, this may sound like an odd request... but I have a young ward who is quite shy.  You are a hero to him, and he asked me to get your autograph.', 9663, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=2465;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 2465, 0, 0, 0, 9, 0, 558, 0, 0, 0, 0, 0, '', 'Lady Jaina Proudmoore Shows gossip option 2465 if player has quest Jaina''s Autograph');

DELETE FROM `creature_text` WHERE `entry`=4968;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(4968, 0, 0, 'Perhaps I should explain...', 12, 0, 100, 1, 0, 0, 33092, 'Lady Jaina Proudmoore to Player'),
(4968, 1, 0, 'I had arranged for a secret summit between Warchief Thrall and King Wrynn, here in Theramore.', 12, 0, 100, 1, 0, 0, 33093, 'Lady Jaina Proudmoore to Player'),
(4968, 2, 0, 'The king was to travel here by ship, in secret. But the ship never arrived, and King Wrynn disappeared.', 12, 0, 100, 1, 0, 0, 33094, 'Lady Jaina Proudmoore to Player'),
(4968, 3, 0, 'Your help enabled us to connect the Defias to the mastermind behind the abduction, Onyxia, who was posing as a member of the royal court.', 12, 0, 100, 1, 0, 0, 33095, 'Lady Jaina Proudmoore to Player'),
(4968, 4, 0, 'Meanwhile, the king managed to escape his captors, and returned to Stormwind to deal with Onyxia.', 12, 0, 100, 1, 0, 0, 33096, 'Lady Jaina Proudmoore to Player'),
(4968, 5, 0, 'I will send word that you have discovered the link to the Defias. I was a fool to think them broken with the defeat of Edwin Van Cleef, and King Wrynn will want to make an example of all who remain.', 12, 0, 100, 1, 0, 0, 33097, 'Lady Jaina Proudmoore to Player'),
(4968, 6, 0, 'Why... that is very sweet of you.  I gather that you are volunteering time for Children''s Week, yes $c?  Well, you are to be commended.  It is imperative that we remember those less fortunate - especially the children.$B$BI''d be happy to sign an autograph.  Here you go.', 12, 0, 100, 1, 0, 0, 9665, 'Lady Jaina Proudmoore to Player');

SET NAMES utf8;
DELETE FROM `gossip_menu_option` WHERE (`menu_id`=8782 AND `id`=0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(8782, 0, 0, 'I need to get a flight.', 0, 1, 1, 0, 0, 0, 0, NULL, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8782;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 8782, 0, 0, 0, 9, 0, 11142, 0, 0, 0, 0, 0, '', 'Cassa - show gossip if player has quest Survey Alcaz Island');

DELETE FROM `spell_area` WHERE  `spell`=42316 AND `area`=2079 AND `quest_start`=11142 AND `aura_spell`=0 AND `racemask`=1101 AND `gender`=2;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(42316, 2079, 11142, 0, 0, 1101, 2, 1, 74, 11);

-- King of the Foulweald - http://wotlk.openwow.com/quest=6621
DELETE FROM `spell_script_names` WHERE `spell_id`=20783;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(20783, 'spell_destroy_karangs_banner');

-- remove this shit - eventscripts will be running even without gameobject
DELETE FROM `event_scripts` where id=6721;

-- Karang's Banner SAI
SET @ENTRY := 178205;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,1,0,100,1,5000,5000,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Karang's Banner - Out of Combat - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 17820500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,2,0,0,0,100,0,20000,20000,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,5,0,0,0,100,0,30000,30000,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,7,0,0,0,100,0,20000,20000,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,10,0,0,0,100,0,30000,30000,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,12,0,0,0,100,0,20000,20000,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,15,0,0,0,100,0,30000,30000,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,17,0,0,0,100,0,25000,25000,0,0,12,12918,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Chief Murgut'");

-- Foulweald Ursa SAI
SET @ENTRY := 3749;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Ursa - Out of Combat - Move To Position"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Ursa - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=3749;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,3749,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Foulweald Warrior SAI
SET @ENTRY := 3743;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Warrior - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,3,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Warrior - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=3743;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,3,3743,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Foulweald Totemic SAI
SET @ENTRY := 3750;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Totemic - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Totemic - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=3750;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,3750,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Chief Murgut SAI
SET @ENTRY := 12918;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Chief Murgut - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Murgut - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=12918;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,12918,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- The Bait for Lar'korwi - http://wotlk.openwow.com/quest=4292
UPDATE `gameobject` SET `position_z` = -216.891 WHERE `guid` =99845;
DELETE FROM `gameobject` WHERE `id`=169216;
DELETE FROM `event_scripts` WHERE  `id`=3980;
DELETE FROM `spell_script_names` WHERE `spell_id`=15118;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(15118, 'spell_place_threshadon_carcass');
-- INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (27142, 169216, 1, 490, 1942, 1, 1, -7198.09, -2425, -216.693, 4.30284, 0, 0, 0.83612, -0.548546, -180, 0, 1, 0);

-- [Q] 'Rescue From Jaedenar' - http://wotlk.openwow.com/quest=5203
-- Spirit of Trey Lightforge SAI
SET @ENTRY := 11141;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,15493,64,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Trey Lightforge - Between 0-40% Health - Cast 'Holy Light' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,4000,4000,11,18164,64,0,0,0,0,2,0,0,0,0,0,0,0,"Spirit of Trey Lightforge - In Combat - Cast 'Shadow Bolt'");

UPDATE `creature_template` SET `ScriptName`='npc_captured_arkonarin' WHERE  `entry`=11016;
UPDATE `quest_template_addon` SET `SpecialFlags`=2 WHERE  `ID`=5203;

DELETE FROM `script_waypoint` WHERE `entry`=11016;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(11016, 0, 5004.98, -440.237, 319.059, 4000, 'SAY_ESCORT_START'),
(11016, 1, 4992.22, -449.964, 317.057, 0, 'npc_captured_arkonarin'),
(11016, 2, 4988.55, -457.438, 316.289, 0, 'npc_captured_arkonarin'),
(11016, 3, 4989.98, -464.297, 316.846, 0, 'npc_captured_arkonarin'),
(11016, 4, 4994.04, -467.754, 318.055, 0, 'npc_captured_arkonarin'),
(11016, 5, 5002.31, -466.318, 319.965, 0, 'npc_captured_arkonarin'),
(11016, 6, 5011.8, -462.889, 321.501, 0, 'npc_captured_arkonarin'),
(11016, 7, 5020.53, -460.797, 321.97, 0, 'npc_captured_arkonarin'),
(11016, 8, 5026.84, -463.171, 321.345, 0, 'npc_captured_arkonarin'),
(11016, 9, 5028.66, -476.805, 318.726, 0, 'npc_captured_arkonarin'),
(11016, 10, 5029.5, -487.131, 318.179, 0, 'npc_captured_arkonarin'),
(11016, 11, 5031.18, -497.678, 316.533, 0, 'npc_captured_arkonarin'),
(11016, 12, 5032.72, -504.748, 314.744, 0, 'npc_captured_arkonarin'),
(11016, 13, 5035, -513.138, 314.372, 0, 'npc_captured_arkonarin'),
(11016, 14, 5037.49, -521.733, 313.221, 6000, 'SAY_FIRST_STOP'),
(11016, 15, 5049.06, -519.546, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 16, 5059.17, -522.93, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 17, 5062.75, -529.933, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 18, 5063.9, -538.827, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 19, 5062.22, -545.635, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 20, 5061.69, -552.333, 313.101, 0, 'npc_captured_arkonarin'),
(11016, 21, 5060.33, -560.349, 310.873, 0, 'npc_captured_arkonarin'),
(11016, 22, 5055.62, -565.541, 308.737, 0, 'npc_captured_arkonarin'),
(11016, 23, 5049.8, -567.604, 306.537, 0, 'npc_captured_arkonarin'),
(11016, 24, 5043.01, -564.946, 303.682, 0, 'npc_captured_arkonarin'),
(11016, 25, 5038.22, -559.823, 301.463, 0, 'npc_captured_arkonarin'),
(11016, 26, 5039.46, -548.675, 297.824, 0, 'npc_captured_arkonarin'),
(11016, 27, 5043.44, -538.807, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 28, 5056.4, -528.954, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 29, 5064.4, -521.904, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 30, 5067.62, -512.999, 297.196, 0, 'npc_captured_arkonarin'),
(11016, 31, 5065.99, -505.329, 297.214, 0, 'npc_captured_arkonarin'),
(11016, 32, 5062.24, -499.086, 297.448, 0, 'npc_captured_arkonarin'),
(11016, 33, 5065.09, -492.069, 298.054, 0, 'npc_captured_arkonarin'),
(11016, 34, 5071.19, -491.173, 297.666, 5000, 'SAY_SECOND_STOP'),
(11016, 35, 5087.47, -496.478, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 36, 5095.55, -508.639, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 37, 5104.3, -521.014, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 38, 5110.13, -532.123, 296.677, 4000, 'open equipment chest'),
(11016, 39, 5110.13, -532.123, 296.677, 4000, 'cast SPELL_STRENGHT_ARKONARIN'),
(11016, 40, 5110.13, -532.123, 296.677, 4000, 'SAY_EQUIPMENT'),
(11016, 41, 5110.13, -532.123, 296.677, 0, 'SAY_ESCAPE'),
(11016, 42, 5099.75, -510.823, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 43, 5091.94, -497.516, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 44, 5079.38, -486.811, 297.638, 0, 'npc_captured_arkonarin'),
(11016, 45, 5069.21, -488.77, 298.082, 0, 'npc_captured_arkonarin'),
(11016, 46, 5064.24, -496.051, 297.275, 0, 'npc_captured_arkonarin'),
(11016, 47, 5065.08, -505.239, 297.361, 0, 'npc_captured_arkonarin'),
(11016, 48, 5067.82, -515.245, 297.125, 0, 'npc_captured_arkonarin'),
(11016, 49, 5064.62, -521.17, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 50, 5053.22, -530.739, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 51, 5045.73, -538.311, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 52, 5039.69, -548.112, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 53, 5038.78, -557.588, 300.787, 0, 'npc_captured_arkonarin'),
(11016, 54, 5042.01, -566.749, 303.838, 0, 'npc_captured_arkonarin'),
(11016, 55, 5050.56, -568.149, 306.782, 0, 'npc_captured_arkonarin'),
(11016, 56, 5056.98, -564.674, 309.342, 0, 'npc_captured_arkonarin'),
(11016, 57, 5060.79, -556.801, 311.936, 0, 'npc_captured_arkonarin'),
(11016, 58, 5059.58, -551.626, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 59, 5062.83, -541.994, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 60, 5063.55, -531.288, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 61, 5057.93, -523.088, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 62, 5049.47, -519.36, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 63, 5040.79, -519.809, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 64, 5034.3, -515.361, 313.948, 0, 'npc_captured_arkonarin'),
(11016, 65, 5032, -505.532, 314.663, 0, 'npc_captured_arkonarin'),
(11016, 66, 5029.92, -495.645, 316.821, 0, 'npc_captured_arkonarin'),
(11016, 67, 5028.87, -487, 318.179, 0, 'npc_captured_arkonarin'),
(11016, 68, 5028.11, -475.531, 318.839, 0, 'npc_captured_arkonarin'),
(11016, 69, 5027.76, -465.442, 320.643, 0, 'npc_captured_arkonarin'),
(11016, 70, 5019.96, -460.892, 321.969, 0, 'npc_captured_arkonarin'),
(11016, 71, 5009.43, -464.793, 321.248, 0, 'npc_captured_arkonarin'),
(11016, 72, 4999.57, -468.062, 319.426, 0, 'npc_captured_arkonarin'),
(11016, 73, 4992.03, -468.128, 317.894, 0, 'npc_captured_arkonarin'),
(11016, 74, 4988.17, -461.293, 316.369, 0, 'npc_captured_arkonarin'),
(11016, 75, 4990.62, -447.459, 317.104, 0, 'npc_captured_arkonarin'),
(11016, 76, 4993.48, -438.643, 318.272, 0, 'npc_captured_arkonarin'),
(11016, 77, 4995.45, -430.178, 318.462, 0, 'npc_captured_arkonarin'),
(11016, 78, 4993.56, -422.876, 318.864, 0, 'npc_captured_arkonarin'),
(11016, 79, 4985.4, -420.864, 320.205, 0, 'npc_captured_arkonarin'),
(11016, 80, 4976.52, -426.168, 323.112, 0, 'npc_captured_arkonarin'),
(11016, 81, 4969.83, -429.755, 325.029, 0, 'npc_captured_arkonarin'),
(11016, 82, 4960.7, -425.44, 325.834, 0, 'npc_captured_arkonarin'),
(11016, 83, 4955.45, -418.765, 327.433, 0, 'npc_captured_arkonarin'),
(11016, 84, 4949.7, -408.796, 328.004, 0, 'npc_captured_arkonarin'),
(11016, 85, 4940.02, -403.222, 329.956, 0, 'npc_captured_arkonarin'),
(11016, 86, 4934.98, -401.475, 330.898, 0, 'npc_captured_arkonarin'),
(11016, 87, 4928.69, -399.302, 331.744, 0, 'npc_captured_arkonarin'),
(11016, 88, 4926.94, -398.436, 333.079, 0, 'npc_captured_arkonarin'),
(11016, 89, 4916.16, -393.822, 333.729, 0, 'npc_captured_arkonarin'),
(11016, 90, 4908.39, -396.217, 333.217, 0, 'npc_captured_arkonarin'),
(11016, 91, 4905.61, -396.535, 335.05, 0, 'npc_captured_arkonarin'),
(11016, 92, 4897.88, -395.245, 337.346, 0, 'npc_captured_arkonarin'),
(11016, 93, 4895.21, -388.203, 339.295, 0, 'npc_captured_arkonarin'),
(11016, 94, 4896.94, -382.429, 341.04, 0, 'npc_captured_arkonarin'),
(11016, 95, 4901.88, -378.799, 342.771, 0, 'npc_captured_arkonarin'),
(11016, 96, 4908.09, -380.635, 344.597, 0, 'npc_captured_arkonarin'),
(11016, 97, 4911.91, -385.818, 346.491, 0, 'npc_captured_arkonarin'),
(11016, 98, 4910.1, -393.444, 348.798, 0, 'npc_captured_arkonarin'),
(11016, 99, 4903.5, -396.947, 350.812, 0, 'npc_captured_arkonarin'),
(11016, 100, 4898.08, -394.226, 351.821, 0, 'npc_captured_arkonarin'),
(11016, 101, 4891.33, -393.436, 351.801, 0, 'npc_captured_arkonarin'),
(11016, 102, 4881.2, -395.211, 351.59, 0, 'npc_captured_arkonarin'),
(11016, 103, 4877.84, -395.536, 349.713, 0, 'npc_captured_arkonarin'),
(11016, 104, 4873.97, -394.919, 349.844, 5000, 'SAY_FRESH_AIR'),
(11016, 105, 4873.97, -394.919, 349.844, 3000, 'SAY_BETRAYER'),
(11016, 106, 4873.97, -394.919, 349.844, 2000, 'SAY_TREY'),
(11016, 107, 4873.97, -394.919, 349.844, 0, 'SAY_ATTACK_TREY'),
(11016, 108, 4873.97, -394.919, 349.844, 5000, 'SAY_ESCORT_COMPLETE'),
(11016, 109, 4873.97, -394.919, 349.844, 1000, 'npc_captured_arkonarin'),
(11016, 110, 4863.02, -394.521, 350.65, 0, 'npc_captured_arkonarin'),
(11016, 111, 4848.7, -397.612, 351.215, 0, 'npc_captured_arkonarin');

DELETE FROM `creature_text` WHERE `entry`=11016;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11016, 0, 0, 'Please, help me to get through this cursed forest.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 1, 0, 'This creature suffers from the effect of the fel... We must end its misery.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 2, 0, 'The corruption of the fel has not left any of the creatures of Felwood untouched. Please, be on your guard.', 12, 0, 10, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 3, 0, 'I sense the taint of corruption upon this. Help me destroy it.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 4, 0, 'That I must fight against my own kind deeply saddens me.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 5, 0, 'I can sense it now. Ashenvale lies down this path.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 6, 0, 'I feel... something strange...', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 7, 0, 'My form has now changed! The true strength of my spirit is returning to me now... The cursed grasp of the forest is leaving me.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 8, 0, 'Thank you. Now my spirit will finally be at peace.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin');

UPDATE `creature_template` SET `faction`=35 WHERE  `entry`=11016;

-- Kroshius' Infernal Core -- http://www.wowhead.com/quest=7603/kroshius-infernal-core
UPDATE `creature` SET `position_x`=5800.322754, `position_y`=-986.270813, `position_z`=409.803802, `unit_flags`=1048576 WHERE `guid`=39715;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 and `SourceEntry`=14467;
DELETE FROM `creature_text` WHERE `entry`=14467;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(14467, 0, 0, 'Kroshius live? Kroshius crush!', 14, 0, 100, 0, 0, 0, 'Kroshius');

-- Bodyguard for Hire (5821)
-- Gizelton Caravan (5943)
-- Delete paths from quest givers and kodos
UPDATE `creature_template` SET `faction`=250, `unit_flags`=0, `ScriptName`='' WHERE  `entry`=11625;
UPDATE `creature_template` SET `faction`=250, `unit_flags`=0 WHERE  `entry` IN (11626, 11564);

DELETE FROM `creature_addon` WHERE  `guid`=28714;
DELETE FROM `creature_addon` WHERE  `guid`=27290;
DELETE FROM `creature_addon` WHERE  `guid`=28728;
DELETE FROM `creature_addon` WHERE  `guid`=27289;
DELETE FROM `creature_formations` WHERE `leaderGUID`=28714;

DELETE FROM `creature_text` WHERE `entry` IN (11625, 11626);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(11625, 0, 0, 'So sorry to leave a customer but we have places to go and people to swindle. We will be back sometime later today. Good-bye!', 12, 0, 100, 0, 0, 0, 'Cork Gizelton', 7505),
(11625, 1, 0, 'I am looking for some bodyguards that would like to protect the Gizelton Caravan. We are stopped on the road east of Kormek\'s Hut, north of Kolkar Centaur Village.', 14, 0, 100, 0, 0, 0, 'Cork Gizelton', 7474),
(11626, 0, 0, 'Time for the Gizleton Caravan to head on out! We\'ll be back soon but if you cannot wait, head north to Kormek\'s Hut. We open shop in about an hour', 12, 0, 100, 0, 0, 0,'Rigger Gizelton', 7506),
(11626, 1, 0, 'This is Rigger Gizelton asking for assistance escorting my caravan past Mannoroc Coven. I\'m on the road east of Shadowprey village.', 14, 0, 100, 0, 0, 0, 'Rigger Gizelton', 7475);

DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(12245, 12246));
DELETE FROM creature WHERE id IN(12245, 12246);
DELETE FROM creature_addon WHERE guid IN(27289, 27290, 28714, 28728);
DELETE FROM creature WHERE id IN(11625, 11626, 11564) AND guid IN(27289, 27290, 28714, 28728);
UPDATE creature_template SET speed_walk=1, ScriptName='npc_cork_gizelton' WHERE entry=11625;
DELETE FROM creature where guid IN (28714, 27290, 28728, 27289);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(28714, 11625, 1, 1, 1, 11629, 1, -1290.56, 1230.96, 109.39, 6.27641, 300, 0, 0, 1604, 0, 0, 0, 0, 0);

UPDATE creature_template SET speed_walk=1.04 WHERE entry=11564;
UPDATE creature_template SET speed_walk=1.06, AIName='SmartAI' WHERE entry=11626;
DELETE FROM smart_scripts WHERE entryorguid=11626 AND source_type=0;
INSERT INTO smart_scripts VALUES (11626, 0, 0, 0, 19, 0, 100, 0, 5943, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 11625, 50, 0, 0, 0, 0, 0, 'On Quest Accept - Set data');
-- Ambush
UPDATE creature_template SET AIName='CombatAI' WHERE entry IN(12976, 12977, 4684);

DELETE FROM `script_waypoint` WHERE `entry`=11625;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(11625, 1, -1290.31, 1231.38, 109.237, 0, 'Desolace Caravan'),
(11625, 2, -1277.59, 1225.54, 108.85, 0, 'Desolace Caravan'),
(11625, 3, -1264.86, 1219.71, 108.452, 0, 'Desolace Caravan'),
(11625, 4, -1230.04, 1204.31, 104.374, 0, 'Desolace Caravan'),
(11625, 5, -1216.17, 1206.24, 101.889, 0, 'Desolace Caravan'),
(11625, 6, -1202.32, 1208.28, 99.7026, 0, 'Desolace Caravan'),
(11625, 7, -1188.03, 1207.66, 97.2208, 0, 'Desolace Caravan'),
(11625, 8, -1170.99, 1195.93, 94.5615, 0, 'Desolace Caravan'),
(11625, 9, -1155.46, 1192.16, 92.4374, 0, 'Desolace Caravan'),
(11625, 10, -1127.52, 1190.39, 89.8358, 0, 'Desolace Caravan'),
(11625, 11, -1113.58, 1189.12, 89.7403, 0, 'Desolace Caravan'),
(11625, 12, -1070.8, 1186.15, 89.7403, 0, 'Desolace Caravan'),
(11625, 13, -1037.27, 1183.2, 89.8006, 0, 'Desolace Caravan'),
(11625, 14, -995.58, 1177.92, 89.7409, 0, 'Desolace Caravan'),
(11625, 15, -981.817, 1180.48, 89.8152, 0, 'Desolace Caravan'),
(11625, 16, -952.606, 1181.99, 89.7313, 0, 'Desolace Caravan'),
(11625, 17, -935.445, 1182.25, 91.2113, 0, 'Desolace Caravan'),
(11625, 18, -921.448, 1182.53, 93.1746, 0, 'Desolace Caravan'),
(11625, 19, -879.467, 1183.72, 97.6043, 0, 'Desolace Caravan'),
(11625, 20, -858.976, 1184.22, 99.0322, 0, 'Desolace Caravan'),
(11625, 21, -828.316, 1180.2, 99.6657, 0, 'Desolace Caravan'),
(11625, 22, -799.811, 1176, 99.3364, 0, 'Desolace Caravan'),
(11625, 23, -757.106, 1191.47, 96.9164, 0, 'Desolace Caravan'),
(11625, 24, -731.879, 1208.14, 92.6956, 0, 'Desolace Caravan'),
(11625, 25, -719.12, 1213.91, 91.3297, 0, 'Desolace Caravan'),
(11625, 26, -706.36, 1219.67, 90.2856, 0, 'Desolace Caravan'),
(11625, 27, -689.935, 1228.43, 89.4426, 0, 'Desolace Caravan'),
(11625, 28, -679.121, 1237.31, 89.17, 0, 'Desolace Caravan'),
(11625, 29, -661.434, 1247.28, 89.17, 0, 'Desolace Caravan'),
(11625, 30, -635.655, 1258.2, 89.2063, 0, 'Desolace Caravan'),
(11625, 31, -614.489, 1269.64, 89.1686, 0, 'Desolace Caravan'),
(11625, 32, -600.078, 1274.85, 89.1238, 0, 'Desolace Caravan'),
(11625, 33, -586.268, 1277.15, 89.145, 0, 'Desolace Caravan'),
(11625, 34, -546.297, 1287.15, 89.1597, 0, 'Desolace Caravan'),
(11625, 35, -541.257, 1300.21, 89.1602, 0, 'Desolace Caravan'),
(11625, 36, -536.026, 1313.2, 89.1314, 0, 'Desolace Caravan'),
(11625, 37, -525.098, 1338.97, 89.1005, 0, 'Desolace Caravan'),
(11625, 38, -518.852, 1356.12, 89.0827, 0, 'Desolace Caravan'),
(11625, 39, -516.879, 1395.56, 89.0827, 0, 'Desolace Caravan'),
(11625, 40, -518.905, 1436.25, 89.0696, 0, 'Desolace Caravan'),
(11625, 41, -525.605, 1446.54, 88.4907, 0, 'Desolace Caravan'),
(11625, 42, -543.459, 1462.9, 88.3752, 0, 'Desolace Caravan'),
(11625, 43, -557.591, 1471.17, 88.9477, 0, 'Desolace Caravan'),
(11625, 44, -584.698, 1478.14, 88.3754, 0, 'Desolace Caravan'),
(11625, 45, -598.459, 1480.72, 88.3754, 0, 'Desolace Caravan'),
(11625, 46, -632.084, 1491.03, 88.3754, 0, 'Desolace Caravan'),
(11625, 47, -644.249, 1497.95, 88.3754, 0, 'Desolace Caravan'),
(11625, 48, -660.456, 1507.56, 88.3874, 0, 'Desolace Caravan'),
(11625, 49, -666.507, 1504.7, 89.0746, 0, 'Desolace Caravan'),
(11625, 50, -673.795, 1499.48, 90.3922, 0, 'Desolace Caravan'),
(11625, 51, -692.154, 1480.43, 90.5302, 0, 'Desolace Caravan'),
(11625, 52, -710.764, 1470.11, 91.3034, 0, 'Desolace Caravan'),
(11625, 53, -697.048, 1484.75, 91.0929, 0, 'Desolace Caravan'),
(11625, 54, -676.552, 1497.37, 90.6505, 0, 'Desolace Caravan'),
(11625, 55, -665.209, 1505.76, 88.8321, 0, 'Desolace Caravan'),
(11625, 56, -657.898, 1510.94, 88.3752, 0, 'Desolace Caravan'),
(11625, 57, -647.387, 1501.69, 88.3752, 0, 'Desolace Caravan'),
(11625, 58, -630.597, 1491.17, 88.3752, 0, 'Desolace Caravan'),
(11625, 59, -603.756, 1483.26, 88.3752, 0, 'Desolace Caravan'),
(11625, 60, -576.573, 1476.54, 88.3752, 0, 'Desolace Caravan'),
(11625, 61, -556.868, 1470.92, 88.8685, 0, 'Desolace Caravan'),
(11625, 62, -547.471, 1464.89, 88.3747, 0, 'Desolace Caravan'),
(11625, 63, -529.316, 1449.97, 88.402, 0, 'Desolace Caravan'),
(11625, 64, -517.699, 1433.75, 89.0816, 0, 'Desolace Caravan'),
(11625, 65, -518.09, 1405.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 66, -518.149, 1377.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 67, -521.289, 1350.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 68, -531.625, 1324.74, 89.1339, 0, 'Desolace Caravan'),
(11625, 69, -537.391, 1311.99, 89.1594, 0, 'Desolace Caravan'),
(11625, 70, -551.845, 1284.12, 89.1594, 0, 'Desolace Caravan'),
(11625, 71, -578.054, 1278.57, 89.1685, 0, 'Desolace Caravan'),
(11625, 72, -591.957, 1276.92, 89.1634, 0, 'Desolace Caravan'),
(11625, 73, -611.806, 1271.05, 89.1694, 0, 'Desolace Caravan'),
(11625, 74, -623.928, 1264.06, 89.1694, 0, 'Desolace Caravan'),
(11625, 75, -653.384, 1249.74, 89.1694, 0, 'Desolace Caravan'),
(11625, 76, -666.372, 1244.51, 89.1694, 0, 'Desolace Caravan'),
(11625, 77, -684.6, 1232.06, 89.2134, 0, 'Desolace Caravan'),
(11625, 78, -694.027, 1225.67, 89.6627, 0, 'Desolace Caravan'),
(11625, 79, -706.605, 1219.58, 90.2981, 0, 'Desolace Caravan'),
(11625, 80, -732.184, 1208.23, 92.7376, 0, 'Desolace Caravan'),
(11625, 81, -738.514, 1204.75, 93.8662, 0, 'Desolace Caravan'),
(11625, 82, -754.159, 1193.91, 96.6195, 0, 'Desolace Caravan'),
(11625, 83, -766.62, 1187.59, 97.8394, 0, 'Desolace Caravan'),
(11625, 84, -792.515, 1177.07, 98.8327, 0, 'Desolace Caravan'),
(11625, 85, -802.533, 1175.57, 99.4435, 0, 'Desolace Caravan'),
(11625, 86, -821.772, 1178.84, 99.6542, 0, 'Desolace Caravan'),
(11625, 87, -835.435, 1181.9, 99.6662, 0, 'Desolace Caravan'),
(11625, 88, -848.98, 1184.67, 99.5782, 0, 'Desolace Caravan'),
(11625, 89, -861.251, 1185.3, 98.8033, 0, 'Desolace Caravan'),
(11625, 90, -889.179, 1183.34, 96.6117, 0, 'Desolace Caravan'),
(11625, 91, -903.158, 1182.57, 95.2033, 0, 'Desolace Caravan'),
(11625, 92, -931.15, 1182.17, 91.8346, 0, 'Desolace Caravan'),
(11625, 93, -945.149, 1182.01, 89.8612, 0, 'Desolace Caravan'),
(11625, 94, -959.149, 1181.92, 89.7397, 0, 'Desolace Caravan'),
(11625, 95, -973.149, 1181.97, 89.7397, 0, 'Desolace Caravan'),
(11625, 96, -1001.65, 1178.06, 89.7398, 0, 'Desolace Caravan'),
(11625, 97, -1011.8, 1177.4, 89.7398, 0, 'Desolace Caravan'),
(11625, 98, -1033.08, 1182.29, 89.7629, 0, 'Desolace Caravan'),
(11625, 99, -1073.62, 1186.33, 89.7398, 0, 'Desolace Caravan'),
(11625, 100, -1101.59, 1187.56, 89.7398, 0, 'Desolace Caravan'),
(11625, 101, -1129.48, 1190.01, 89.8855, 0, 'Desolace Caravan'),
(11625, 102, -1143.44, 1191.11, 91.0344, 0, 'Desolace Caravan'),
(11625, 103, -1166.85, 1194.28, 93.9649, 0, 'Desolace Caravan'),
(11625, 104, -1184.71, 1203.56, 96.6406, 0, 'Desolace Caravan'),
(11625, 105, -1201.45, 1208.2, 99.5698, 0, 'Desolace Caravan'),
(11625, 106, -1225.42, 1204.68, 103.502, 0, 'Desolace Caravan'),
(11625, 107, -1235.55, 1206.75, 105.129, 0, 'Desolace Caravan'),
(11625, 108, -1261.05, 1218.25, 108.207, 0, 'Desolace Caravan'),
(11625, 109, -1286.64, 1229.58, 109.112, 0, 'Desolace Caravan'),
(11625, 110, -1306.84, 1233.21, 109.771, 0, 'Desolace Caravan'),
(11625, 111, -1331.25, 1233.54, 110.674, 0, 'Desolace Caravan'),
(11625, 112, -1350.02, 1227.22, 111.201, 0, 'Desolace Caravan'),
(11625, 113, -1389.37, 1212.53, 111.587, 0, 'Desolace Caravan'),
(11625, 114, -1415.8, 1202.23, 111.948, 0, 'Desolace Caravan'),
(11625, 115, -1424.26, 1196.81, 112.038, 0, 'Desolace Caravan'),
(11625, 116, -1449.27, 1188.13, 111.53, 0, 'Desolace Caravan'),
(11625, 117, -1474.53, 1186.42, 109.366, 0, 'Desolace Caravan'),
(11625, 118, -1491.78, 1189.4, 106.114, 0, 'Desolace Caravan'),
(11625, 119, -1502.95, 1198.12, 101.757, 0, 'Desolace Caravan'),
(11625, 120, -1512.09, 1209.44, 96.2469, 0, 'Desolace Caravan'),
(11625, 121, -1520.19, 1226.67, 89.7861, 0, 'Desolace Caravan'),
(11625, 122, -1522.75, 1243.63, 83.3864, 0, 'Desolace Caravan'),
(11625, 123, -1520.9, 1257.51, 77.7027, 0, 'Desolace Caravan'),
(11625, 124, -1518.48, 1273.17, 71.8991, 0, 'Desolace Caravan'),
(11625, 125, -1516.17, 1290.94, 66.8473, 0, 'Desolace Caravan'),
(11625, 126, -1514.74, 1306.19, 63.4211, 0, 'Desolace Caravan'),
(11625, 127, -1511.54, 1328.73, 60.2051, 0, 'Desolace Caravan'),
(11625, 128, -1505.75, 1341.47, 59.2142, 0, 'Desolace Caravan'),
(11625, 129, -1494.42, 1367.08, 58.9254, 0, 'Desolace Caravan'),
(11625, 130, -1485.84, 1393.02, 58.9251, 0, 'Desolace Caravan'),
(11625, 131, -1485.47, 1407, 58.9469, 0, 'Desolace Caravan'),
(11625, 132, -1487.57, 1434.84, 58.9347, 0, 'Desolace Caravan'),
(11625, 133, -1489.45, 1448.71, 58.9302, 0, 'Desolace Caravan'),
(11625, 134, -1489.77, 1469.49, 58.9251, 0, 'Desolace Caravan'),
(11625, 135, -1483.8, 1482.15, 58.9251, 0, 'Desolace Caravan'),
(11625, 136, -1471.32, 1507.22, 58.9251, 0, 'Desolace Caravan'),
(11625, 137, -1464.94, 1519.68, 58.9251, 0, 'Desolace Caravan'),
(11625, 138, -1452.27, 1544.64, 58.9251, 0, 'Desolace Caravan'),
(11625, 139, -1442.94, 1584.75, 58.9255, 0, 'Desolace Caravan'),
(11625, 140, -1452.7, 1610.98, 58.9255, 0, 'Desolace Caravan'),
(11625, 141, -1464.1, 1641.7, 58.9255, 0, 'Desolace Caravan'),
(11625, 142, -1474.86, 1647.49, 58.9255, 0, 'Desolace Caravan'),
(11625, 143, -1500.84, 1657.91, 58.9255, 0, 'Desolace Caravan'),
(11625, 144, -1521.76, 1671.96, 58.9255, 0, 'Desolace Caravan'),
(11625, 145, -1541.37, 1691.94, 58.9255, 0, 'Desolace Caravan'),
(11625, 146, -1551.2, 1701.92, 58.9255, 0, 'Desolace Caravan'),
(11625, 147, -1571.41, 1721.29, 58.9255, 0, 'Desolace Caravan'),
(11625, 148, -1592.97, 1739.14, 58.9255, 0, 'Desolace Caravan'),
(11625, 149, -1613.28, 1758.07, 58.9255, 0, 'Desolace Caravan'),
(11625, 150, -1630.32, 1780.27, 58.9255, 0, 'Desolace Caravan'),
(11625, 151, -1645.92, 1803.52, 58.9296, 0, 'Desolace Caravan'),
(11625, 152, -1661.7, 1826.65, 58.9271, 0, 'Desolace Caravan'),
(11625, 153, -1681.42, 1858.29, 58.9271, 0, 'Desolace Caravan'),
(11625, 154, -1686.38, 1877.21, 59.2059, 0, 'Desolace Caravan'),
(11625, 155, -1692.06, 1899.02, 60.7504, 0, 'Desolace Caravan'),
(11625, 156, -1699.45, 1908.31, 61.1412, 0, 'Desolace Caravan'),
(11625, 157, -1717, 1915.93, 60.0908, 0, 'Desolace Caravan'),
(11625, 158, -1738.04, 1917.48, 59.0673, 0, 'Desolace Caravan'),
(11625, 159, -1757.16, 1918.92, 58.9757, 0, 'Desolace Caravan'),
(11625, 160, -1772.71, 1926.58, 59.1537, 0, 'Desolace Caravan'),
(11625, 161, -1791.81, 1939.62, 60.7298, 0, 'Desolace Caravan'),
(11625, 162, -1802.7, 1951.89, 60.7237, 0, 'Desolace Caravan'),
(11625, 163, -1809.79, 1963.96, 59.7477, 0, 'Desolace Caravan'),
(11625, 164, -1815.2, 1976.74, 59.0006, 0, 'Desolace Caravan'),
(11625, 165, -1817.51, 2008.7, 59.5336, 0, 'Desolace Caravan'),
(11625, 166, -1823, 2032.7, 60.6767, 0, 'Desolace Caravan'),
(11625, 167, -1821.87, 2042.21, 60.944, 0, 'Desolace Caravan'),
(11625, 168, -1813.14, 2068.68, 63.0096, 0, 'Desolace Caravan'),
(11625, 169, -1810.52, 2082.43, 63.114, 0, 'Desolace Caravan'),
(11625, 170, -1806.9, 2095.9, 63.1144, 0, 'Desolace Caravan'),
(11625, 171, -1802.03, 2111.56, 63.6862, 0, 'Desolace Caravan'),
(11625, 172, -1802.03, 2111.56, 63.6862, 0, 'Desolace Caravan'),
(11625, 173, -1801.53, 2141.07, 63.006, 0, 'Desolace Caravan'),
(11625, 174, -1801.53, 2141.07, 63.006, 0, 'Desolace Caravan'),
(11625, 175, -1802.25, 2155.05, 61.5195, 0, 'Desolace Caravan'),
(11625, 176, -1803.02, 2183.03, 59.8215, 0, 'Desolace Caravan'),
(11625, 177, -1808.36, 2207.2, 59.8215, 0, 'Desolace Caravan'),
(11625, 178, -1822.66, 2219.86, 59.8215, 0, 'Desolace Caravan'),
(11625, 179, -1836.76, 2232.87, 59.8215, 0, 'Desolace Caravan'),
(11625, 180, -1843.44, 2245.11, 59.8215, 0, 'Desolace Caravan'),
(11625, 181, -1844.75, 2266.9, 59.8215, 0, 'Desolace Caravan'),
(11625, 182, -1846.34, 2280.81, 59.8215, 0, 'Desolace Caravan'),
(11625, 183, -1849.89, 2294.13, 59.8215, 0, 'Desolace Caravan'),
(11625, 184, -1864.58, 2316.31, 59.8215, 0, 'Desolace Caravan'),
(11625, 185, -1872.72, 2327.7, 59.8224, 0, 'Desolace Caravan'),
(11625, 186, -1884.98, 2346.82, 59.8224, 0, 'Desolace Caravan'),
(11625, 187, -1887.2, 2354.3, 59.8696, 0, 'Desolace Caravan'),
(11625, 188, -1893.87, 2379.11, 59.9196, 0, 'Desolace Caravan'),
(11625, 189, -1900.07, 2391.67, 59.8224, 0, 'Desolace Caravan'),
(11625, 190, -1904, 2405.04, 59.8224, 0, 'Desolace Caravan'),
(11625, 191, -1904, 2405.04, 59.8224, 0, 'Desolace Caravan'),
(11625, 192, -1895.71, 2431.78, 59.8224, 0, 'Desolace Caravan'),
(11625, 193, -1888.72, 2458.89, 59.8224, 0, 'Desolace Caravan'),
(11625, 194, -1895.4, 2432.5, 59.8224, 0, 'Desolace Caravan'),
(11625, 195, -1899.03, 2418.98, 59.8224, 0, 'Desolace Caravan'),
(11625, 196, -1899.68, 2393.35, 59.8224, 0, 'Desolace Caravan'),
(11625, 197, -1892.03, 2375.61, 59.9178, 0, 'Desolace Caravan'),
(11625, 198, -1885.29, 2346.94, 59.8216, 0, 'Desolace Caravan'),
(11625, 199, -1881.12, 2339.05, 59.8216, 0, 'Desolace Caravan'),
(11625, 200, -1864.4, 2316.59, 59.8226, 0, 'Desolace Caravan'),
(11625, 201, -1852.79, 2300.12, 59.8226, 0, 'Desolace Caravan'),
(11625, 202, -1847.08, 2287.99, 59.8226, 0, 'Desolace Caravan'),
(11625, 203, -1844.34, 2264.2, 59.8226, 0, 'Desolace Caravan'),
(11625, 204, -1842.38, 2243.22, 59.8226, 0, 'Desolace Caravan'),
(11625, 205, -1840.11, 2237.75, 59.8226, 0, 'Desolace Caravan'),
(11625, 206, -1830.64, 2226.2, 59.8226, 0, 'Desolace Caravan'),
(11625, 207, -1810.22, 2209.43, 59.8226, 0, 'Desolace Caravan'),
(11625, 208, -1802.8, 2194.02, 59.8226, 0, 'Desolace Caravan'),
(11625, 209, -1800.41, 2180.08, 59.8226, 0, 'Desolace Caravan'),
(11625, 210, -1800.26, 2166.08, 60.1822, 0, 'Desolace Caravan'),
(11625, 211, -1801.62, 2148.85, 62.344, 0, 'Desolace Caravan'),
(11625, 212, -1801.15, 2134.86, 63.1766, 0, 'Desolace Caravan'),
(11625, 213, -1802.26, 2110.11, 63.6737, 0, 'Desolace Caravan'),
(11625, 214, -1805.87, 2096.6, 63.1784, 0, 'Desolace Caravan'),
(11625, 215, -1809.25, 2083.01, 63.0772, 0, 'Desolace Caravan'),
(11625, 216, -1812.63, 2069.43, 63.043, 0, 'Desolace Caravan'),
(11625, 217, -1816.72, 2056.04, 61.8496, 0, 'Desolace Caravan'),
(11625, 218, -1822.89, 2032.23, 60.6524, 0, 'Desolace Caravan'),
(11625, 219, -1822.76, 2027.39, 60.3783, 0, 'Desolace Caravan'),
(11625, 220, -1815.56, 2003.46, 59.4022, 0, 'Desolace Caravan'),
(11625, 221, -1814.41, 1983.18, 58.9549, 0, 'Desolace Caravan'),
(11625, 222, -1811.8, 1967.01, 59.4735, 0, 'Desolace Caravan'),
(11625, 223, -1803.12, 1951.78, 60.7154, 0, 'Desolace Caravan'),
(11625, 224, -1793.24, 1941.87, 60.8439, 0, 'Desolace Caravan'),
(11625, 225, -1775.92, 1926.82, 59.3033, 0, 'Desolace Caravan'),
(11625, 226, -1759.93, 1918.92, 58.9613, 0, 'Desolace Caravan'),
(11625, 227, -1751.9, 1917.2, 59.0003, 0, 'Desolace Caravan'),
(11625, 228, -1737.91, 1917.04, 59.0673, 0, 'Desolace Caravan'),
(11625, 229, -1712.18, 1914.85, 60.4394, 0, 'Desolace Caravan'),
(11625, 230, -1701.72, 1911.02, 61.0949, 0, 'Desolace Caravan'),
(11625, 231, -1694.06, 1904.03, 61.03, 0, 'Desolace Caravan'),
(11625, 232, -1687.1, 1886.34, 59.7501, 0, 'Desolace Caravan'),
(11625, 233, -1684.12, 1872.66, 59.0354, 0, 'Desolace Caravan'),
(11625, 234, -1673.14, 1845.28, 58.9273, 0, 'Desolace Caravan'),
(11625, 235, -1657.63, 1821.97, 58.9273, 0, 'Desolace Caravan'),
(11625, 236, -1649.83, 1810.34, 58.9273, 0, 'Desolace Caravan'),
(11625, 237, -1634.24, 1787.08, 58.9252, 0, 'Desolace Caravan'),
(11625, 238, -1626.45, 1775.45, 58.9252, 0, 'Desolace Caravan'),
(11625, 239, -1605.77, 1750.66, 58.9256, 0, 'Desolace Caravan'),
(11625, 240, -1594.91, 1741.83, 58.9256, 0, 'Desolace Caravan'),
(11625, 241, -1573.31, 1724.02, 58.9256, 0, 'Desolace Caravan'),
(11625, 242, -1553.4, 1704.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 243, -1543.67, 1694.29, 58.9256, 0, 'Desolace Caravan'),
(11625, 244, -1523.39, 1674.99, 58.9256, 0, 'Desolace Caravan'),
(11625, 245, -1505.1, 1659.98, 58.9256, 0, 'Desolace Caravan'),
(11625, 246, -1489.89, 1652.47, 58.9256, 0, 'Desolace Caravan'),
(11625, 247, -1460.15, 1634.27, 58.9256, 0, 'Desolace Caravan'),
(11625, 248, -1453.16, 1621.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 249, -1446.87, 1598.31, 58.9256, 0, 'Desolace Caravan'),
(11625, 250, -1440.81, 1573.28, 58.9256, 0, 'Desolace Caravan'),
(11625, 251, -1445.9, 1553.99, 58.9256, 0, 'Desolace Caravan'),
(11625, 252, -1451.91, 1541.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 253, -1458.46, 1528.97, 58.9256, 0, 'Desolace Caravan'),
(11625, 254, -1471.62, 1504.26, 58.9256, 0, 'Desolace Caravan'),
(11625, 255, -1478.08, 1491.84, 58.9256, 0, 'Desolace Caravan'),
(11625, 256, -1490.08, 1466.54, 58.9256, 0, 'Desolace Caravan'),
(11625, 257, -1491.71, 1455.14, 58.9291, 0, 'Desolace Caravan'),
(11625, 258, -1488.22, 1427.36, 58.9348, 0, 'Desolace Caravan'),
(11625, 259, -1486.41, 1413.48, 58.9418, 0, 'Desolace Caravan'),
(11625, 260, -1487.62, 1388.44, 58.9251, 0, 'Desolace Caravan'),
(11625, 261, -1491.84, 1375.08, 58.9301, 0, 'Desolace Caravan'),
(11625, 262, -1502.72, 1349.31, 58.9416, 0, 'Desolace Caravan'),
(11625, 263, -1508.49, 1336.58, 59.525, 0, 'Desolace Caravan'),
(11625, 264, -1511.68, 1327.41, 60.3754, 0, 'Desolace Caravan'),
(11625, 265, -1514.03, 1314.22, 62.0185, 0, 'Desolace Caravan'),
(11625, 266, -1514.79, 1300.27, 64.5471, 0, 'Desolace Caravan'),
(11625, 267, -1516.1, 1286.34, 68.0841, 0, 'Desolace Caravan'),
(11625, 268, -1518.52, 1272.55, 72.0932, 0, 'Desolace Caravan'),
(11625, 269, -1523.17, 1245.16, 82.7876, 0, 'Desolace Caravan'),
(11625, 270, -1522.5, 1234.75, 87.008, 0, 'Desolace Caravan'),
(11625, 271, -1517.95, 1221.51, 91.5343, 0, 'Desolace Caravan'),
(11625, 272, -1511.76, 1208.2, 96.7403, 0, 'Desolace Caravan'),
(11625, 273, -1501.33, 1196.53, 102.475, 0, 'Desolace Caravan'),
(11625, 274, -1490.76, 1188.95, 106.376, 0, 'Desolace Caravan'),
(11625, 275, -1475.92, 1185.48, 109.181, 0, 'Desolace Caravan'),
(11625, 276, -1452.6, 1187.95, 111.422, 0, 'Desolace Caravan'),
(11625, 277, -1433.28, 1193.58, 111.857, 0, 'Desolace Caravan'),
(11625, 278, -1414.55, 1203.63, 111.886, 0, 'Desolace Caravan'),
(11625, 279, -1388.31, 1213.37, 111.599, 0, 'Desolace Caravan'),
(11625, 280, -1375.11, 1218.03, 111.465, 0, 'Desolace Caravan'),
(11625, 281, -1348.49, 1226.69, 111.175, 0, 'Desolace Caravan'),
(11625, 282, -1319.41, 1232.27, 110.201, 0, 'Desolace Caravan');

-- The Northern Pylon -- http://www.wowhead.com/quest=24722/the-northern-pylon
UPDATE `smart_scripts` SET `action_type`=26 WHERE  `entryorguid` IN (164956, 164957, 164955) AND `source_type`=1 AND `id`=0 AND `link`=0;

-- Escape Through Force / Volcor -- http://www.wowhead.com/quest=994/escape-through-force
-- Volcor SAI
SET @ENTRY := 3692;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,994,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Quest 'Escape Through Force' Taken - Run Script"),
(@ENTRY,0,1,0,19,0,100,0,995,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Quest 'Escape Through Stealth' Taken - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,15,3692,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Waypoint 15 Reached - Despawn Instant"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Aggro - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 369200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,53,0,3692,0,0,0,2,1,0,0,0,0,0,0,0,"Volcor - On Script - Start Waypoint"),
(@ENTRY,9,2,0,0,0,100,0,110000,110000,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 2"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,15,994,0,0,0,0,0,17,0,30,0,0,0,0,0,"Volcor - On Script - Quest Credit 'Escape Through Force'");

-- Actionlist SAI
SET @ENTRY := 369201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,3,0,0,0,0,0,0,"Volcor - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,53,0,3692,0,0,0,2,1,0,0,0,0,0,0,0,"Volcor - On Script - Start Waypoint"),
(@ENTRY,9,2,0,0,0,100,0,110000,110000,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,15,995,0,0,0,0,0,17,0,30,0,0,0,0,0,"Volcor - On Script - Quest Credit 'Escape Through Stealth'");

-- DB/Quest: A lost Master -- http://www.wowhead.com/quest=986/a-lost-master
-- Terenthis SAI
SET @ENTRY := 3693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,20,0,100,0,986,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Quest 'A Lost Master' Finished - Run Script");

DELETE FROM `creature_text` WHERE `entry`=3693 AND `groupid`>=8;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3693, 8, 0, 'What was that noise? It sounded like a roar.!', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 9, 0, 'Grimclaw? Easy there, my friend... where is your master Volcor?', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 10, 0, 'Whoa, whoa there, my friend. One moment...', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 11, 0, '%s begins to cast a spell on Grimclaw.', 16, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 12, 0, 'There... that should help. Now, tell me what''s happened, Grimclaw.', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 13, 0, 'I understand, my friend. I shall find someone to help your master. Go back to him now, or at least stay close.', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 14, 0, 'If you have the time, Grimclaw and his master Volcor could use your help. If you''re interested, speak with me further...', 12, 0, 100, 1, 0, 0, 'Terenthis'); 

DELETE FROM `creature_text` WHERE `entry`=3695 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3695, 1, 0, '%s roars at Terenthis to get his attention.', 16, 0, 100, 1, 0, 0, 'Grimclaw'), 
(3695, 2, 0, '%s begins to moan and roar at Terenthis while stomping his paws on the ground.', 16, 0, 100, 1, 0, 0, 'Grimclaw'),
(3695, 3, 0, '%s roars at Terenthis more, but this time the druid seems to understand the bear.', 16, 0, 100, 1, 0, 0, 'Grimclaw'), 
(3695, 4, 0, '%s roars in acknowledgement at Terenthis.', 16, 0, 100, 1, 0, 0, 'Grimclaw'); 

-- Grimclaw SAI
SET @ENTRY := 3695;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - Received Emote 101 - Say Line 0"),
(@ENTRY,0,1,0,63,0,100,0,0,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Just Summoned - Run Script");

-- Actionlist SAI
SET @ENTRY := 369502;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Script - Set Run Off"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,6437.702148,368.423737,13.939653,4.166484,"Grimclaw - On Script - Move To Position"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.3688,"Grimclaw - On Script - Set Orientation 4,3688"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,43000,43000,0,0,69,0,0,0,0,0,0,8,0,0,0,6427.02,404.78,11.031,5.1137,"Grimclaw - On Script - Move To Position");

-- Actionlist SAI
SET @ENTRY := 369302;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,3695,3,56000,0,0,0,8,0,0,0,6432.260254,388.354980,13.836236,5.046920,"Terenthis - On Script - Summon Creature 'Grimclaw'"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 8"),
(@ENTRY,9,2,0,0,0,100,0,10000,10000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 9"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 10"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 11"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,11,6238,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Cast 'Speak with Animals'"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 12"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 3"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 13"),
(@ENTRY,9,10,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 4"),
(@ENTRY,9,11,0,0,0,100,0,5000,5000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 14");

-- DB/Quest: Cave Mushrooms -- http://www.wowhead.com/quest=947/cave-mushrooms
-- Barithras Moonshade SAI
SET @ENTRY := 3583;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,947,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Barithras Moonshade - On Quest 'Cave Mushrooms' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 358300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 2"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=3583;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3583, 0, 0, 'Thank you, $N. And luck to you.', 12, 0, 100, 0, 0, 0, 'Barithras Moonshade'), 
(3583, 1, 0, 'Cliffspring Falls lies along the mountains to the east and north.', 12, 0, 100, 0, 0, 0, 'Barithras Moonshade'); 

-- DB/Quest: Forsaken Aid -- http://www.wowhead.com/quest=1064/deprecated-forsaken-aid
-- Magatha Grimtotem SAI
SET @ENTRY := 4046;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1063,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'The Elder Crone' Finished - Run Script"),
(@ENTRY,0,1,0,19,0,100,0,1064,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'Forsaken Aid' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 404601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,6657,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Summon Serpent Messenger'"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,12,4068,3,433000,0,0,0,8,0,0,0,-1067.22,-213.737,160.473,5.25037,"On Script - Summon Creature 'Serpent Messenger'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 25");

DELETE FROM `creature_text` WHERE `entry`=4046 AND `groupid`>=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4046, 2, 0, '%s summons a messenger...', 16, 0, 100, 0, 0, 0, 'Magatha Grimtotem'), 
(4046, 3, 0, 'Go, my servant. Send word of Stonetalon to Apothecary Zamah.', 12, 0, 100, 0, 0, 0, 'Magatha Grimtotem'); 

DELETE FROM `creature_text` WHERE `entry`=4068;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4068, 0, 0, '%s gives message to Apothecary Zamah.', 16, 0, 100, 0, 0, 0, 'Serpent Messenger'); 

DELETE FROM `creature_text` WHERE `entry`=3419 AND `groupid`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3419, 2, 0, '%s gives message to Apothecary Zamah.', 16, 0, 100, 0, 0, 0, 'apo'); 

-- Serpent Messenger SAI
SET @ENTRY := 4068;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,3,54,0,100,0,0,0,0,0,53,1,4068,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,1,4068,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,36,4068,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Waypoint 36 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Just Summoned - Set Active On");
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=4068;

-- Actionlist SAI
SET @ENTRY := 406800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,19,3419,2,0,0,0,0,0,"Serpent Messenger - On Script - Say Line 2"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Despawn Instant");

DELETE FROM `waypoints` WHERE `entry`=4068;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(4068, 1, -1067.22, -213.737, 160.473),
(4068, 2, -1062.56, -221.981, 160.294),
(4068, 3, -1054.61, -221.248, 161.894),
(4068, 4, -1054.61, -221.248, 161.894),
(4068, 5, -1037.05, -191.12, 158.949),
(4068, 6, -1053.12, -173.969, 163.214),
(4068, 7, -1064.46, -140.953, 161.368),
(4068, 8, -1079.25, -97.1617, 156.371),
(4068, 9, -1085.39, -64.6974, 164.416),
(4068, 10, -1083.91, -26.7695, 159.369),
(4068, 11, -1084.44, -9.29896, 158.034),
(4068, 12, -1109.66, 7.02863, 154.732),
(4068, 13, -1132.07, 31.5715, 158.157),
(4068, 14, -1129.02, 47.1316, 154.19),
(4068, 15, -1095.17, 63.5461, 150.752),
(4068, 16, -1086.83, 113.827, 144.557),
(4068, 17, -1113.2, 129.364, 140.268),
(4068, 18, -1146.35, 119.028, 141.776),
(4068, 19, -1169.85, 118.638, 141.101),
(4068, 20, -1206.75, 117.618, 139.861),
(4068, 21, -1211.53, 129.623, 135.559),
(4068, 22, -1192.52, 144.921, 136.995),
(4068, 23, -1175.37, 157.22, 146.484),
(4068, 24, -1155.67, 169.875, 146.074),
(4068, 25, -1127.05, 179.696, 131.79),
(4068, 26, -1096.04, 189.663, 118.055),
(4068, 27, -1061.46, 191.502, 109.917),
(4068, 28, -1056.64, 215.227, 113.473),
(4068, 29, -1046.91, 223.356, 114.831),
(4068, 30, -1035.35, 218.46, 112.371),
(4068, 31, -1027.93, 217.483, 114.236),
(4068, 32, -1023.41, 229.152, 108.92),
(4068, 33, -1016.34, 236.136, 109.243),
(4068, 34, -1013.08, 246.142, 108.77),
(4068, 35, -1006.87, 255.833, 113.284),
(4068, 36, -997.047, 275.161, 112.343);

-- DB/Quest: Vyletongue Corruption -- http://wotlk.openwow.com/?quest=7041
-- Talendria SAI
SET @ENTRY := 11715;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,7041,0,0,0,1,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"Talendria - On Quest 'Vyletongue Corruption' Taken - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=11715;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11715, 0, 0, '$N, please take a look at the sample of the Vylestem vine that I took from the caverns, so that you know what to look for...', 12, 0, 100, 0, 0, 0, 'Talendria');

-- Return to Troyas -- http://wotlk.openwow.com/?quest=2943
-- Troyas Moonbreeze SAI
SET @ENTRY := 7764;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,2943,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Quest 'Return to Troyas' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 776400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4476.23,3230.55,13.7301,4.20931,"Troyas Moonbreeze - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.99471,"Troyas Moonbreeze - On Script - Set Orientation 4,99471"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4474.9,3232.88,13.7295,0.951991,"Troyas Moonbreeze - On Script - Move To Position");

DELETE FROM `creature_text` WHERE `entry`=7764;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(7764, 0, 0, 'A History... Hmmmm... Let me examine this for a moment.', 12, 0, 100, 0, 0, 0, 4039, 'Troyas Moonbreeze'),
(7764, 1, 0, '%s skims the pages of the book.', 16, 0, 100, 0, 0, 0, 4040, 'Troyas Moonbreeze'),
(7764, 2, 0, 'Amazing! I think I have found it, $n!', 12, 0, 100, 0, 0, 0, 4041, 'Troyas Moonbreeze');

-- Making Sense of It -- http://wotlk.openwow.com/?quest=4321
-- J.D. Collie SAI
SET @ENTRY := 9117;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,4321,0,0,0,80,@ENTRY*100+00,0,2,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Quest 'Making Sense of It' Taken - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,4321,0,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Quest 'Making Sense of It' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 911701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,50,174683,20,0,0,0,0,8,0,0,0,-6034.46,-1014.57,-216.735,6.07572,"On Script - Summon Gameobject 'J.D.'s Manual'"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.36912,"On Script - Set Orientation 2,36912"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.872665,"On Script - Set Orientation 0,872665"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=9117 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(9117, 1, 0, 'Now, let''s see... If I am correct, then... Hmmm...', 12, 0, 100, 0, 0, 0, 5287, 'J.D. Collie'),
(9117, 2, 0, 'Blue plus red... I predict...', 12, 0, 100, 0, 0, 0, 5288, 'J.D. Collie'),
(9117, 3, 0, '$n, that''s it! I have finally figured it out!', 12, 0, 100, 0, 0, 0, 5289, 'J.D. Collie');

-- Quest:Ancient Spirit -- http://wotlk.openwow.com/quest=4261
UPDATE `quest_template_addon` SET `SpecialFlags`=2 WHERE  `ID`=4261;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=15033;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`,`NegativeCondition`) VALUES
(17,0,15033,0,0,29,0,9598,100,0,0,"","Cannot cast Summon Ancient Spirits near Arei",1);

DELETE FROM `script_waypoint` WHERE entry=9598;
INSERT INTO `script_waypoint` VALUES
(9598, 0, 6004.265, -1180.494, 376.377, 0, 'Arei SAY_ESCORT_START'),
(9598, 1, 6002.512, -1157.294, 381.407, 0, 'Arei'),
(9598, 2, 6029.228, -1139.720, 383.127, 0, 'Arei'),
(9598, 3, 6042.479, -1128.963, 386.582, 0, 'Arei'),
(9598, 4, 6062.820, -1115.522, 386.850, 0, 'Arei'),
(9598, 5, 6089.188, -1111.907, 383.105, 0, 'Arei'),
(9598, 6, 6104.390, -1114.561, 380.490, 0, 'Arei'),
(9598, 7, 6115.080, -1128.572, 375.779, 0, 'Arei'),
(9598, 8, 6119.352, -1147.314, 372.518, 0, 'Arei'),
(9598, 9, 6119.003, -1176.082, 371.072, 0, 'Arei'),
(9598, 10, 6120.982, -1198.408, 373.432, 0, 'Arei'),
(9598, 11, 6123.521, -1226.636, 374.119, 0, 'Arei'),
(9598, 12, 6127.737, -1246.035, 373.574, 0, 'Arei'),
(9598, 13, 6133.433, -1253.642, 369.100, 0, 'Arei'),
(9598, 14, 6150.787, -1269.151, 369.240, 0, 'Arei'),
(9598, 15, 6155.805, -1275.029, 373.627, 0, 'Arei'),
(9598, 16, 6163.544, -1307.130, 376.234, 0, 'Arei'),
(9598, 17, 6174.800, -1340.885, 379.039, 0, 'Arei'),
(9598, 18, 6191.144, -1371.260, 378.453, 0, 'Arei'),
(9598, 19, 6215.652, -1397.517, 376.012, 0, 'Arei'),
(9598, 20, 6243.784, -1407.675, 371.594, 0, 'Arei'),
(9598, 21, 6280.775, -1408.259, 370.554, 0, 'Arei'),
(9598, 22, 6325.360, -1406.688, 370.082, 0, 'Arei'),
(9598, 23, 6355.000, -1404.337, 370.646, 0, 'Arei'),
(9598, 24, 6374.679, -1399.176, 372.105, 0, 'Arei'),
(9598, 25, 6395.803, -1367.057, 374.910, 0, 'Arei'),
(9598, 26, 6408.569, -1333.487, 376.616, 0, 'Arei'),
(9598, 27, 6409.075, -1312.168, 379.598, 0, 'Arei'),
(9598, 28, 6418.689, -1277.697, 381.638, 0, 'Arei'),
(9598, 29, 6441.689, -1247.316, 387.246, 0, 'Arei'),
(9598, 30, 6462.136, -1226.316, 397.610, 0, 'Arei'),
(9598, 31, 6478.021, -1216.260, 408.284, 0, 'Arei'),
(9598, 32, 6499.632, -1217.087, 419.461, 0, 'Arei'),
(9598, 33, 6523.165, -1220.780, 430.549, 0, 'Arei'),
(9598, 34, 6542.716, -1216.997, 437.788, 0, 'Arei'),
(9598, 35, 6557.279, -1211.125, 441.452, 0, 'Arei'),
(9598, 36, 6574.568, -1204.589, 443.216, 900000, 'SAY_EXIT_IRONTREE');

DELETE FROM `creature_text` WHERE `entry`=9598;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(9598, 0, 0, 'Please, help me to get through this cursed forest, $r.', 12, 0, 100, 0, 0, 0, 5004, 'arei SAY_AREI_ESCORT_START'),
(9598, 1, 0, 'This creature suffers from the effects of the fel... We must end its misery.', 12, 0, 100, 0, 0, 0, 5474, 'arei SAY_ATTACK_TOXIC_HORROR'),
(9598, 2, 0, 'The corruption of the fel has not left any of the creatures of Felwood untouched, $n. Please, be on your guard.', 12, 0, 100, 0, 0, 0, 5005, 'arei SAY_ATTACK_TOXIC_HORROR'),
(9598, 3, 0, 'I sense the taint of corruption upon this $n. Help me destroy it!', 12, 0, 100, 0, 0, 0, 5473, 'arei SAY_EXIT_WOODS'),
(9598, 4, 0, 'That I must fight against my own kind deeply saddens me.', 12, 0, 100, 0, 0, 0, 5008, 'arei SAY_CLEAR_PATH'),
(9598, 5, 0, 'I can sense it now, $n. Ashenvale lies down this path.', 12, 0, 100, 0, 0, 0, 5023, 'arei SAY_ASHENVALE'),
(9598, 6, 0, 'I feel... something strange...', 12, 0, 100, 0, 0, 0, 5026, 'arei SAY_TRANSFORM'),
(9598, 7, 0, '$n, my form has now changed! The true strength of my spirit is returning to me now... The cursed grasp of the forest is leaving me.', 12, 0, 100, 0, 0, 0, 5029, 'arei SAY_LIFT_CURSE'),
(9598, 8, 0, 'Thank you, $n. Now my spirit will finally be at peace.', 12, 0, 100, 0, 0, 0, 5036, 'arei SAY_ESCORT_COMPLETE');

UPDATE `creature_template` SET `ScriptName`='npc_arei' WHERE  `entry`=9598;
UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=2 WHERE  `entry`=9598;
DELETE FROM `creature` WHERE `guid`=40377;
-- 
-- Gelkis/Magram - Decissionquest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20)  AND `SourceEntry`=1368;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 1368, 0, 0, 8, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is rewarded.'),
(19, 0, 1368, 0, 0, 8, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is rewarded.'),
(19, 0, 1368, 0, 0, 28, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(20, 0, 1368, 0, 0, 28, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(19, 0, 1368, 0, 0, 9, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(20, 0, 1368, 0, 0, 9, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20)  AND `SourceEntry`=1367;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 1367, 0, 0, 8, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is rewarded.'),
(19, 0, 1367, 0, 0, 8, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is rewarded.'),
(19, 0, 1367, 0, 0, 28, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is completed.'),
(20, 0, 1367, 0, 0, 28, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is completed.'),
(19, 0, 1367, 0, 0, 9, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is active.'),
(20, 0, 1367, 0, 0, 9, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is avtive.');

-- 
-- Stillpine Captive
UPDATE creature SET orientation = 0.365682 WHERE guid = 90994;
-- The Prophecy of Akida -- http://wotlk.openwow.com/quest=9544
UPDATE creature SET orientation = 3.155424 WHERE guid = 90995;
UPDATE creature SET orientation = 4.971260 WHERE guid = 91001;
UPDATE creature SET orientation = 2.285983 WHERE guid = 91002;
UPDATE creature SET orientation = 1.334086 WHERE guid = 91003;
UPDATE creature SET orientation = 0.408888 WHERE guid = 91004;
UPDATE creature SET orientation = 4.620978 WHERE guid = 91005;
UPDATE creature SET orientation = 3.218260 WHERE guid = 91007;
UPDATE creature SET orientation = 4.423052 WHERE guid = 91008;

DELETE FROM `waypoint_data` WHERE `id` IN (909940, 909950, 909960, 909970, 909980, 909990, 910000, 910010, 910020, 910030, 910040, 910050, 910060, 910070, 910080);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(909940,1,-4616.35,-11646.3,20.9185),
(909940,2,-4597.68,-11659.9,19.9798),
(909940,3,-4585.35,-11682.6,19.4543),
(909940,4,-4585.35,-11682.6,19.4543),
-- #90995
(909950,1,-4576.57,-11625.6,17.7847),
(909950,2,-4571.72,-11613.7,17.8211),
(909950,3,-4547.22,-11602.9,15.7619),
(909950,4,-4547.22,-11602.9,15.7619),
-- #90996
(909960,1,-4607.84,-11661.3,20.1229),
(909960,2,-4585.93,-11683.3,19.4376),
(909960,3,-4585.93,-11683.3,19.4376),
-- #90997
(909970,1,-4514.16,-11636.2,13.2484),
(909970,2,-4486.92,-11666.6,10.1438),
(909970,3,-4486.92,-11666.6,10.1438),
-- #90998
(909980,1,-4500.7,-11599.9,12.4237),
(909980,2,-4466.86,-11611.1,12.5875),
(909980,3,-4466.86,-11611.1,12.5875),
-- #90999
(909990,1,-4488.83,-11626.2,10.9745),
(909990,2,-4499.94,-11635.9,12.4551),
(909990,3,-4486.48,-11666.1,10.0948),
(909990,4,-4486.48,-11666.1,10.0948),
-- #91000
(910000,1,-4486.69,-11613.6,11.0187),
(910000,2,-4481.08,-11605.5,11.5851),
(910000,3,-4449.55,-11613.6,10.2269),
(910000,4,-4449.55,-11613.6,10.2269),
-- #91001
(910010,1,-4609.22,-11616.5,18.0117),
(910010,2,-4601.83,-11652.7,18.9373),
(910010,3,-4601.83,-11652.7,18.9373),
-- #91002
(910020,1,-4586.47,-11641.1,19.3945),
(910020,2,-4592.15,-11651,20.6222),
(910020,3,-4586.04,-11682.2,19.4636),
(910020,4,-4586.04,-11682.2,19.4636),
-- #91003
(910030,1,-4630.73,-11541.2,17.2353),
(910030,2,-4606.58,-11554.9,18.5432),
(910030,3,-4606.58,-11554.9,18.5432),
-- #91004
(910040,1,-4643.38,-11533.1,17.4496),
(910040,2,-4608.98,-11550,18.4467),
(910040,3,-4608.98,-11550,18.4467),
-- #91005
(910050,1,-4634.94,-11502,19.9331),
(910050,2,-4601.03,-11510.5,19.9801),
(910050,3,-4601.03,-11510.5,19.9801),
-- #91006
(910060,1,-4619.91,-11503.7,20.3987),
(910060,2,-4583.83,-11514.8,19.4313),
(910060,3,-4583.83,-11514.8,19.4313),
-- #91007
(910070,1,-4606.49,-11519.3,19.3579),
(910070,2,-4608.57,-11512.2,20.0682),
(910070,3,-4572.14,-11514.7,19.567),
(910070,4,-4572.14,-11514.7,19.567),
-- #91008
(910080,1,-4606.48,-11538.3,17.9555),
(910080,2,-4603.26,-11543.9,18.3778),
(910080,3,-4575.63,-11540.1,17.8463),
(910080,4,-4575.63,-11540.1,17.8463);

UPDATE `waypoint_data` SET move_type=1 WHERE `id` IN (909940, 909950, 909960, 909970, 909980, 909990, 910000, 910010, 910020, 910030, 910040, 910050, 910060, 910070, 910080);
UPDATE `creature_template` SET `speed_run`=1.2 WHERE  `entry`=17375;

-- Echeyakee -- http://wotlk.openwow.com/quest=881
UPDATE `event_scripts` SET `x`=453.896027, `y`=-3039.76147, `z`=91.785370 WHERE `id`=2980;
UPDATE `gameobject` SET `id`=147524 WHERE `guid`=50383;
UPDATE `gameobject_template` SET `data1`=60 WHERE  `entry`=147524;

-- DB/Quest: The Burning of Spirits - Itemtargeting -- http://wotlk.openwow.com/quest=1435
-- Capture Spirit - targeting
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=7914;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,7914,0,0,31,1,3,3195,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,1,31,1,3,3196,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,2,31,1,3,3197,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,3,31,1,3,3198,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,4,31,1,3,3199,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,5,31,1,3,3379,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,6,31,1,3,3380,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,7,31,1,3,4663,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,8,31,1,3,4664,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,9,31,1,3,4665,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,10,31,1,3,4666,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,11,31,1,3,4667,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,12,31,1,3,4668,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,13,31,1,3,4669,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,14,31,1,3,4705,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,15,31,1,3,12319,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,16,31,1,3,12320,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,17,31,1,3,13019,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,18,31,1,3,13836,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,19,31,1,3,18305,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,20,31,1,3,18306,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,21,31,1,3,18307,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,22,31,1,3,18308,0,0,"","Capture Spirit - only target Burning Blade member");

-- Kaya - Texts -- http://wotlk.openwow.com/quest=6523
DELETE FROM `creature_text` WHERE `entry` = 11856;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`comment`) VALUES
(11856, 0, 0, "Let's go before they find out I'm free!", 12, 0, 100, 1, 0, 0, 8327, 'Kaya SAY_START'),
(11856, 1, 0, "Look out! We're under attack!", 12, 0, 100, 5, 0, 0, 8328, 'Kaya SAY_AMBUSH'),
(11856, 2, 0, "Thank you for helping me. I know my way back from here.", 12, 0, 100, 3, 0, 0, 8329, 'Kaya SAY_END');

-- The Lord of Blackrock - http://wotlk.openwow.com/quest=7782 + http://wotlk.openwow.com/quest=7784
-- Field Marshal Afrasiabi SAI
SET @ENTRY := 14721;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,7782,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Quest 'The Lord of Blackrock' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1472100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,14000,14000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,11,22888,0,0,0,0,0,1,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Cast 'Rallying Cry of the Dragonslayer'");

-- Overlord Runthak SAI
SET @ENTRY := 14392;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,7784,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Quest 'The Lord of Blackrock' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1439200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,14000,14000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,11,22888,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Cast 'Rallying Cry of the Dragonslayer'");

DELETE FROM `creature_text` WHERE `entry` IN (14721, 14392);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(14392, 0, 0, 'NEFARIAN IS SLAIN! people of Orgrimmar, bow down before the might of $N and his allies for they have laid a blow against the Black Dragonflight that is sure to stir the Aspects from their malaise! This defeat shall surely be felt by the father of the Black Flight: Deathwing reels in pain and anguish this day!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9867),
(14392, 1, 0, 'Be lifted by $N accomplishment! Revel in his rallying cry!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9868),
(14721, 0, 0, 'Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of $N and $Ghis:her; allies!', 14, 0, 100, 0, 0, 0, 'Field Marshal Afrasiabi', 9870),
(14721, 1, 0, 'Let your spirits rise! Rally around your champion, bask in $Ghis:her; glory! Revel in the rallying cry of the dragon slayer!', 14, 0, 100, 0, 0, 0, 'Field Marshal Afrasiabi', 9872);

-- DB/Quest: The Sleeper Has Awakened -- http://wotlk.openwow.com/quest=5321
UPDATE `creature_text` SET `sound`=6209 WHERE  `entry`=11218 AND `groupid`=0 AND `id`=0;


-- Seal of Ascension 4743

SET @ENTRY :=10321;
-- Emberstrife Template
UPDATE `creature_template` SET AIName='SmartAI', spell1=16054, spell2=9573, spell3=8269, spell4=40504, spell5=0, spell6=0, spell7=0 WHERE entry=@ENTRY;

-- Emberstrife Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Emberstrife will falters!', 16, 0, 100, 0, 0, 0, 0, 0, 'Emberstrife Emote when below 10%');

-- Emberstrife SAI 
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @ENTRY);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 2, 0, 100, 0, 0, 10, 60000, 60000, 1, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Emote Below 10%'),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 2000, 5000, 5000, 12000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Flame Breath'),
(@ENTRY, 0, 2, 0, 0, 0, 100, 0, 2000, 5000, 4000, 10000, 11, 40504, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Cleave'),
(@ENTRY, 0, 3, 0, 2, 0, 100, 0, 0, 10, 60000, 60000, 11, 8269, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Frenzy below 10%');

-- Unforged Seal of Ascension SAI
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=175321;
DELETE FROM `smart_scripts` WHERE `entryorguid`=175321 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(175321, 1, 0, 0, 8, 0, 100, 0, 16054, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Despawn');
 
 
/* 
*/ 
-- -------------------------------------------
-- BOREAN TUNDRA
-- -------------------------------------------

-- Scouting the Sinkholes -- [A] http://www.wowhead.com/quest=11684/scouting-the-sinkholes [H] http://www.wowhead.com/quest=11713/scouting-the-sinkholes

UPDATE creature SET position_z=8.4416 where guid=78;
UPDATE creature SET position_z=8.4051 where guid=79;
UPDATE creature SET position_z=8.3212 where guid=80;

-- Nedar, Lord of Rhinos... -- [A][H} http://www.wowhead.com/quest=11884/nedar-lord-of-rhinos

SET @ENTRY:= 25801;
DELETE FROM `creature` WHERE `id` =@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `id`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,9,0,7,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nedar, Lord of Rhinos - On Evade - Despawn In 60000 ms");

-- Help Those That Cannot Help Themselves -- [A][H] http://de.wowhead.com/quest=11876/hilfe-fur-die-hilflosen
-- spell_item_dehta_trap_smasher
DELETE FROM `spell_script_names` WHERE spell_id = 46201;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (46201, 'spell_item_dehta_trap_smasher');
UPDATE `item_template` SET ScriptName = "" WHERE entry = 35228;

-- Quest Bury Those Cockroaches! - wowhead.com/quest=11608
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45502 AND `ConditionTypeOrReference`=31;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 2, 45502, 0, 0, 31, 0, 3, 25402, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (South)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25403, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (East)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25404, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (West)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25405, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (North)');


-- Repurposed Technology -- [A} http://www.wowhead.com/quest=12035/repurposed-technology
-- Harvest Collector SAI
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`IN(25623,25650,26561);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(25623,25650,26561);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25623, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 4000, 6000, 11, 54185, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - IC - Cast Claw Slash'),
(25623, 0, 1, 0, 8, 0, 100, 0, 47166, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - On spell hit - Despawn Instant'),

-- Plagued Scavanger SAI
(25650, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 11, 26561, 100, 0, 0, 0, 0, 0, 'Plagued Scavenger - Just Summoned - Attack Nearby Converted Harvest Collector'),

-- Converted Harvest Collector SAI
(26561, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Converted Harvest Collector - Just Summoned - Despawn in 1 min'),
(26561, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 25650, 1, 60000, 0, 0, 0, 19, 101, 0, 0, 0, 0, 0, 0, 'Converted Harvest Collector - Link - Summon Plagued Scavenger for 1 min');

-- Plagued Scavanger Bunny spawn
DELETE FROM `creature_template` WHERE `entry`=101;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(101, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Plague Scavenger Bunny', NULL, NULL, 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 130, '', 0);

DELETE FROM `creature` WHERE `id`=101;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(52022, 101, 571, 0, 0, 1, 1, 0, 0, 2526.455322, 5246.518066, 35.246830, 0, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(52023, 101, 571, 0, 0, 1, 1, 0, 0, 2544.124268, 5304.271973, 32.552277, 0, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);

-- [Q] Stop the Plague -- http://www.wowhead.com/quest=11677
-- Stop the Plague Kill Credit Bunny SAI
SET @ENTRY := 25654;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,8,0,100,0,45835,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,1,3,8,0,100,0,45834,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,2,0,61,0,100,0,45835,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Set Data 2 2"),
(@ENTRY,0,3,0,61,0,100,0,45834,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Set Data 2 2");

-- ELM General Purpose Bunny SAI
SET @ENTRY := 23837;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,11,52388,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Cast 'You Reap What You Sow: Ritual Bunny Channel'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,28671,30,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Set Data 0 1"),
(@ENTRY,0,2,0,38,0,100,1,32,32,0,0,11,9010,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 32 32 - Cast 'Create Filled Containment Coffer' (No Repeat)"),
(@ENTRY,0,3,0,38,0,100,0,31,31,0,0,87,1636401,1636403,1636404,1636406,1636407,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 31 31 - Run Random Script"),
(@ENTRY,0,4,0,38,0,100,0,30,30,0,0,87,1636401,1636402,1636403,1636405,1636406,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 30 30 - Run Random Script"),
(@ENTRY,0,6,0,11,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,27249,0,0,0,0,0,0,"ELM General Purpose Bunny - On Respawn - Set Data 1 1"),
(@ENTRY,0,7,0,38,0,100,0,2,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 2 2 - Despawn Instant"); 
 
/* 
*/ 
-- -------------------------------------------
-- DRAGONBLIGHT
-- -------------------------------------------


-- Heated Battle -- [A] http://www.wowhead.com/quest=12416/heated-battle [H] http://www.wowhead.com/quest=12448/heated-battle

UPDATE creature_template SET ScriptName='npc_heated_battle' WHERE entry IN(27531, 27685, 27686);


-- Fresh Remounts -- [H] http://www.wowhead.com/quest=12214/fresh-remounts

UPDATE creature_loot_template SET Chance=100 WHERE Item=37202 AND entry=27206;

SET @ENTRY := 27213;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM smart_scripts WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM smart_scripts WHERE `entryorguid`=@ENTRY*100+00 AND `source_type`=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@ENTRY,0,0,0,31,0,100,0,48297,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Target Spellhit 'Hand Over Reins' - Run Script"),
    (@ENTRY,0,1,2,28,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Set Faction 35"),
    (@ENTRY,0,2,0,61,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Set Home Position"),
    (@ENTRY,0,3,0,28,0,100,0,0,0,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Remove Flag Pacified"),
    (@ENTRY,0,4,0,27,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Boarded - Set Flag Pacified"),
    (@ENTRY,0,5,0,27,0,100,0,0,0,0,0,59,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Boarded - Set Run On"),
    (@ENTRY,0,6,0,11,0,100,0,0,0,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Respawn - Remove Flag Pacified"),
    (@ENTRY*100+00,9,0,0,0,0,100,0,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Cast 'Eject All Passengers'"),
    (@ENTRY*100+00,9,1,0,0,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Flag Not Selectable"),
    (@ENTRY*100+00,9,2,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Run Off"),
    (@ENTRY*100+00,9,3,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,3263.98,-623.401,170.712,1.0592,"Onslaught Warhorse - On Script - Move To Position"),
    (@ENTRY*100+00,9,4,0,0,0,100,0,5000,5000,0,0,45,0,1,0,0,0,0,10,98539,23837,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Data 0 1"),
    (@ENTRY*100+00,9,5,0,0,0,100,0,4000,4000,0,0,11,48304,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Cast 'Fresh Remounts: Skeletal Warhorse Transform'"),
    (@ENTRY*100+00,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,3239.11,-648.268,165.651,3.71414,"Onslaught Warhorse - On Script - Move To Position"),
    (@ENTRY*100+00,9,7,0,0,0,100,0,9000,9000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Despawn Instant");

SET @GUID := -98539;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=23837;
DELETE FROM smart_scripts WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@GUID,0,0,0,38,0,100,0,0,1,0,0,11,48298,0,0,0,0,0,19,27213,20,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 0 1 - Cast 'Fresh Remounts: Plague Spigot'");

DELETE FROM `vehicle_template_accessory` WHERE `entry`=27213;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`)
VALUES
    (27213,27206,0,0, 'Onslaught Warhorse - Onslaught Knight', 8);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=48290;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
    (17,0,48290,0,0,31,1,3,27213,0,0,0,0,'','Only Onslaught Warhorse is a target for Onslaught Riding Crop'),
    (17,0,48290,0,0,1,1,43671,0,0,1,0,0,'','Only NOT RIDDEN Onslaught Warhorse is a target for Onslaught Riding Crop');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27213);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)
VALUES
    (27213,43671,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=27213 AND `SourceEntry` IN (43671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
    (18,27213,43671,0,0,31,0,3,0,0,0,0,'','Only npcs can use Onslaught Warhorse spellclick');

-- Quest The Plume of Alystros - [A][H] - http://www.wowhead.com/quest=12456/the-plume-of-alystros
-- increase SpellFocus diameter
UPDATE `gameobject_template` SET `Data1`=50 WHERE  `entry`=190033;

-- assign spell script to spell of quest item
DELETE FROM `spell_script_names` WHERE `spell_id`=49566;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(49566, 'spell_skytalon_molts');

-- 
-- Quest Blightbeasts be Damned! [H] http://www.wowhead.com/quest=12072/blightbeasts-be-damned
DELETE FROM `spell_custom_attr` WHERE `entry`=47257;
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (47257, 2097152);

-- Quest Xink's Shredder  - [A][H] - http://www.wowhead.com/quest=12052/harp-on-this
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=47938;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(17,0,47938,0,0,31,1,3,26577,0,0,0,0,'','Twisting Blade requires target Coldwind Witch'),
(17,0,47938,0,1,31,1,3,26316,0,0,0,0,'','Twisting Blade requires target Crystalline Ice Elemental'),
(17,0,47938,0,2,31,1,3,26575,0,0,0,0,'','Twisting Blade requires target Coldwind Waste Huntress'),
(17,0,47938,0,3,31,1,3,26578,0,0,0,0,'','Twisting Blade requires target Coldwind Master'),
(13,1,47938,0,0,31,0,3,26577,0,0,0,0,'','Twisting Blade can hit Coldwind Witch'),
(13,1,47938,0,1,31,0,3,26316,0,0,0,0,'','Twisting Blade can hit Crystalline Ice Elemental'),
(13,1,47938,0,2,31,0,3,26575,0,0,0,0,'','Twisting Blade can hit Coldwind Waste Huntress'),
(13,1,47938,0,3,31,0,3,26578,0,0,0,0,'','Twisting Blade can hit Coldwind Master');


-- Spiritual Insight -- [A][H] http://www.wowhead.com/quest=12028/spiritual-insight

UPDATE creature_template SET flags_extra=130, AIName='', ScriptName='npc_spiritual_insight' WHERE entry=26594;
DELETE FROM spell_linked_spell WHERE spell_trigger=47190;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
    (47190, 47189, 1, "Toalu'u's Spiritual Incense");

DELETE FROM event_scripts WHERE id IN(17604, 17605, 17606, 17607, 17608, 17609);

INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
    (17604, 0, 10, 26594, 1, 0, 2686, 934, 18, 0),
    (17605, 0, 10, 26594, 1, 0, 3097, 1037, 128, 0),
    (17606, 0, 10, 26594, 1, 0, 3014, 1321, 168, 0),
    (17607, 0, 10, 26594, 1, 0, 2854, 1514, 167, 0),
    (17608, 0, 10, 26594, 1, 0, 3129, 1556, 178, 0),
    (17609, 0, 10, 26594, 1, 0, 3117, 1288, 173, 0),
    (17609, 0, 7, 12028, 0, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=26594;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
    (26594, 0, 0, "You've successfully freed your spirit! You can serve as my eyes. Together we'll get to the bottom of this.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 1, 0, "You're coming up on the village now. Keep your eyes peeled.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 2, 0, "What's happened to the lake bed? Strange power is pouring out of it.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 3, 0, "No... no! My people are all dead spirits or deranged!", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 4, 0, "Elder Mana'loa, the statue there, sees you. This is a good sign!", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 5, 0, "Come back, $N. If you're out of your body for too long, you run the risk of not being able to return. We have much to discuss.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight");


-- Something that doesn't melt. -- [A][H] http://wotlk.openwow.com/quest=12047
-- Splintered Bone Chunk -- http://wotlk.openwow.com/item=36730
SET @OGUID := 66937;
DELETE FROM `gameobject` WHERE `id`=188441;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0 , 188441, 571, 1, 1, 4599.037, 285.0833, 95.23787, 0.4188786, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+1 , 188441, 571, 1, 1, 4556.1, 231.2934, 96.77894, 0.4537851, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+2 , 188441, 571, 1, 1, 4499.447, 108.0523, 89.83501, 3.996807, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+3 , 188441, 571, 1, 1, 4481.178, 127.8052, 88.98753, 5.044002, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+4 , 188441, 571, 1, 1, 4518.543, 226.8698, 90.04359, 4.97419, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+5 , 188441, 571, 1, 1, 4476.379, 92.48655, 88.96384, 2.321287, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+6 , 188441, 571, 1, 1, 4599.19, 760.0677, 93.87521, 5.654869, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+7, 188441, 571, 1, 1, 4593.348, 741.4844, 95.79951, 3.735006, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+8, 188441, 571, 1, 1, 4751.073, 453.6788, 130.7299, 0.6806767, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+9, 188441, 571, 1, 1, 4682.298, 401.2016, 113.0896, 0.9075702, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+10, 188441, 571, 1, 1, 4607.061, 650.2381, 99.33231, 0.3141584, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+11, 188441, 571, 1, 1, 4617.78, 647.2289, 100.198, 6.161013, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+12, 188441, 571, 1, 1, 4603.35, 646.6047, 99.39375, 3.281239, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+13, 188441, 571, 1, 1, 4601.033, 262.5729, 94.59935, 3.595379, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+14, 188441, 571, 1, 1, 4578.877, 274.382, 94.57744, 1.256636, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+15, 188441, 571, 1, 1, 4516.654, 214.9381, 90.17368, 4.76475, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+16, 188441, 571, 1, 1, 4570.082, 246.2316, 90.96891, 4.869471, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+17, 188441, 571, 1, 1, 4553.599, 249.401, 91.1224, 3.857183, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+18, 188441, 571, 1, 1, 4532.682, 221.2274, 92.86555, 5.340709, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+19, 188441, 571, 1, 1, 4505.154, 59.0905, 86.1317, 5.078908, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+20, 188441, 571, 1, 1, 4458.161, 127.8561, 89.45293, 5.881761, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+21, 188441, 571, 1, 1, 4583.655, 232.1632, 95.92954, 4.729844, 0, 0, 0, 1, 120, 255, 1); 

-- Into Hostile Territory - [A] http://www.wowhead.com/quest=12325/into-hostile-territory

SET @GRYPHON := 27661;

DELETE FROM creature_text WHERE entry=@GRYPHON;
INSERT INTO creature_text VALUES (@GRYPHON, 0, 0, 'Hang on your hat, pal! We\'re in for a bumpy ride', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');
INSERT INTO creature_text VALUES (@GRYPHON, 1, 0, 'This is your stop, pal. Safe landing!', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=27661;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (18, 27661, 48365, 0, 0, 28, 0, 12325, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

DELETE FROM vehicle_template_accessory WHERE entry=@GRYPHON;

UPDATE creature_template SET AIName="SmartAI", InhabitType=5, speed_run=2.5 WHERE entry=@GRYPHON;
DELETE FROM smart_scripts WHERE entryorguid=@GRYPHON AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@GRYPHON,0,0,1,27,0,100,0,0,0,0,0,1,0,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Say Line 0"),
    (@GRYPHON,0,1,0,61,0,100,0,0,0,0,0,53,1,27661,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Start Waypoint"),
    (@GRYPHON,0,2,3,40,0,100,0,10,27661,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Say Line 1"),
    (@GRYPHON,0,3,4,61,0,100,0,10,27661,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Remove Aura"),
    (@GRYPHON,0,4,0,61,0,100,0,10,27661,0,0,75,44795,0,0,0,0,0,17,0,30,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Add Aura 'Parachute'"),
    (@GRYPHON,0,5,0,40,0,100,0,11,27661,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 11 Reached - Despawn In 3000 ms"),
    (@GRYPHON,0,6,0,11,0,100,0,0,0,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Respawn - Set Npc Flag Spellclick");


DELETE FROM waypoints WHERE entry=@GRYPHON;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@GRYPHON, 1, 3706.73, -700.82, 218.26, 'Wintergarde Gryphon'),
    (@GRYPHON, 2, 3697.71, -724.01, 225.27, 'Wintergarde Gryphon'),
    (@GRYPHON, 3, 3717.61, -752.09, 225.80, 'Wintergarde Gryphon'),
    (@GRYPHON, 4, 3716.85, -779.71, 224.46, 'Wintergarde Gryphon'),
    (@GRYPHON, 5, 3739.56, -906.24, 199.36, 'Wintergarde Gryphon'),
    (@GRYPHON, 6, 3749.59, -1011.11, 184.11, 'Wintergarde Gryphon'),
    (@GRYPHON, 7, 3743.17, -1146.54, 175.47, 'Wintergarde Gryphon'),
    (@GRYPHON, 8, 3725.03, -1276.72, 163.01, 'Wintergarde Gryphon'),
    (@GRYPHON, 9, 3738.50, -1345.91, 161.58, 'Wintergarde Gryphon'),
    (@GRYPHON, 10, 3832.16, -1395.51, 178.19, 'Wintergarde Gryphon'),
    (@GRYPHON, 11, 3846.49, -1416.90, 163.93, 'Wintergarde Gryphon');


-- On Ruby Wings - [A][H] http://www.wowhead.com/quest=12498/on-ruby-wings

SET @ANTIOK := 28006;
SET @THIASSI := 28018;

DELETE FROM creature_text WHERE entry=@ANTIOK;
INSERT INTO creature_text VALUES (@ANTIOK, 0, 0, 'You think you''ve won, mortal? Face the unbridled power of Antiok!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell1');
INSERT INTO creature_text VALUES (@ANTIOK, 1, 0, 'Behold! The Scythe of Antiok!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell2');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 0, 'Soon, the bones of Galakrond will rise from their eternal slumber and wreak havoc upon this world!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell3');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 1, 'The Lich King demands more frost wyrms be sent to Angrathar! Meet his demands or face my wrath!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell4');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 2, 'Faster, dogs! We mustn''t relent in our assault against the interlopers!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell5');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 3, 'Attackers are upon us! Let none through to this ancient grave!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell6');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 4, 'Hear me, minions! Hear your lord, Antiok! Double your efforts or pay the consequences of failure!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell7');

UPDATE creature_template SET unit_flags=4 WHERE entry=@ANTIOK;
DELETE FROM vehicle_template_accessory WHERE entry=@THIASSI;
INSERT INTO vehicle_template_accessory VALUES (@THIASSI, @ANTIOK, 0, 0, 'Thiassi the Light Bringer', 8, 0);

DELETE FROM smart_scripts WHERE entryorguid IN(@ANTIOK, @THIASSI) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@ANTIOK*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 12000, 14000, 11, 50456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - In Combat - Cast Thiassi''s Stormbolt');
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 1, 0, 0, 0, 100, 0, 9000, 9000, 15000, 19000, 11, 15593, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - In Combat - Cast War Stomp');
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 0, 0, 0, 0, 0, 19, @ANTIOK, 10, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - On Death - remove unitflag from target');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 18000, 18000, 11, 32863, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - In Combat - Cast Seed of Corruption');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 1, 0, 0, 0, 100, 0, 1100, 1100, 2000, 3000, 11, 50455, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - In Combat - Cast Shadow Bolt');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 2, 0, 1, 0, 100, 0, 10000, 10000, 40000, 40000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Out of Combat - Say Line 2');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 3, 0, 2, 0, 100, 1, 0, 25, 0, 0, 11, 50497, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Between 0-25% Health - Cast Scream of Chaos');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 4, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 50472, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Just Died - Cast Drop Scythe of Antiok');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 5, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 50494, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Reset - Cast Shroud of Lightning');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 6, 0, 38, 0, 100, 0, 1, 0, 0, 0, 80, @ANTIOK*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Data Set - Run Script');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 7, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Evade - Despawn');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Say Line 0');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Say Line 1');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 11, 50501, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Cast Flesh Harvest');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 50494, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Remove Aura Shroud of Lightning');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Remove Unit Flags');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Attack Start');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=50501;
INSERT INTO conditions VALUES (13, 3, 50501, 0, 0, 31, 0, 3, 27996, 0, 0, 0, 0, '', 'Target Wyrmrest Vanquisher');
    
 
 
/* 
*/ 
-- -------------------------------------------
-- GRIZZLY_HILLS
-- -------------------------------------------


-- Shredder Repair -- [A] http://www.wowhead.com/quest=12244/shredder-repair 
-- Shred the Alliance -- [H] http://www.wowhead.com/quest=12270/shred-the-alliance


UPDATE creature_template SET npcflag=16777216 WHERE entry=27354;


-- Deciphering the Journal-- [H] http://www.wowhead.com/quest=12054/deciphering-the-journal

UPDATE creature_loot_template SET Chance=100 WHERE Item=36740 AND entry=26681;

-- [Q] Escape From Silverbrook - http://de.wowhead.com/quest=12308/flucht-aus-silberwasser
-- npc_ducals_horse
DELETE FROM `waypoints` WHERE `entry`=27409;
DELETE FROM `waypoint_data` WHERE `id`=2740900;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `move_type`) VALUES
(2740900, 2, 4449.24, -2471.33, 242.36, 1),
(2740900, 3, 4461.93, -2462.85, 239.52, 1),
(2740900, 4, 4462.99, -2448.24, 237.881, 1),
(2740900, 5, 4479.58, -2434.09, 235.04, 1),
(2740900, 6, 4488.5, -2420.69, 233.043, 1),
(2740900, 7, 4494.65, -2414.14, 230.241, 1),
(2740900, 8, 4499.73, -2414.86, 230.953, 1),
(2740900, 9, 4510.85, -2401.81, 226.619, 1),
(2740900, 10, 4517.01, -2388.02, 220.151, 1),
(2740900, 11, 4520.02, -2373.92, 213.042, 1),
(2740900, 12, 4524.58, -2355.4, 202.208, 1),
(2740900, 13, 4520.5, -2332.2, 190.854, 1),
(2740900, 14, 4509.68, -2314.53, 182.408, 1),
(2740900, 15, 4488.28, -2309.13, 184.352, 1),
(2740900, 16, 4480.72, -2311.42, 185.421, 1),
(2740900, 17, 4470.29, -2314.58, 183.929, 1),
(2740900, 18, 4453.35, -2318.29, 189.487, 1),
(2740900, 19, 4442.95, -2311.86, 192.656, 1),
(2740900, 20, 4414.56, -2297.74, 191.105, 1),
(2740900, 21, 4396.02, -2286.89, 192.638, 1),
(2740900, 22, 4383.11, -2278.55, 188.321, 1),
(2740900, 23, 4369.12, -2256.09, 187.593, 1),
(2740900, 24, 4339.65, -2250.22, 188.637, 1),
(2740900, 25, 4299.78, -2260.09, 205.304, 1),
(2740900, 26, 4292.07, -2261.81, 209.1, 1),
(2740900, 27, 4258.07, -2270.73, 212.054, 1),
(2740900, 28, 4224.15, -2276.5, 214.878, 1),
(2740900, 29, 4210.62, -2280.83, 214.911, 1),
(2740900, 30, 4193.76, -2285.94, 219.886, 1),
(2740900, 31, 4168.56, -2272.44, 221.375, 1),
(2740900, 32, 4151.02, -2269.35, 223.433, 1),
(2740900, 33, 4131.85, -2271.16, 221.921, 1),
(2740900, 34, 4112.48, -2276.04, 219.917, 1),
(2740900, 35, 4103.6, -2274.2, 219.276, 1),
(2740900, 36, 4093.84, -2276.39, 219.043, 1),
(2740900, 37, 4084.73, -2272.29, 217.87, 1),
(2740900, 38, 4063.24, -2261.99, 215.989, 1),
(2740900, 39, 4059.94, -2260.47, 216.993, 1),
(2740900, 40, 4028.19, -2252.87, 218.259, 1),
(2740900, 41, 4020.98, -2249.35, 217.13, 1),
(2740900, 42, 4005.43, -2256.11, 218.452, 1),
(2740900, 43, 3988.11, -2262.06, 217.11, 1),
(2740900, 44, 3968.36, -2267.24, 215.268, 1),
(2740900, 45, 3953.14, -2268.63, 212.391, 1),
(2740900, 46, 3935.73, -2276.52, 209.67, 1),
(2740900, 47, 3922.17, -2282.02, 211.201, 1),
(2740900, 48, 3913.77, -2300.28, 209.62, 1),
(2740900, 49, 3914.16, -2317.61, 208.95, 1),
(2740900, 50, 3911.53, -2330.58, 207.752, 1),
(2740900, 51, 3907.1, -2346.11, 204.631, 1),
(2740900, 52, 3901.43, -2362.48, 206.198, 1),
(2740900, 53, 3885.37, -2368.48, 202.271, 1),
(2740900, 54, 3871.68, -2371.44, 196.694, 1),
(2740900, 55, 3858.81, -2374.24, 194.039, 1),
(2740900, 56, 3833.32, -2390.12, 187.584, 1),
(2740900, 57, 3818.71, -2403.77, 183.719, 1),
(2740900, 58, 3812.4, -2425.27, 185.086, 1),
(2740900, 59, 3812.61, -2432.79, 186.024, 1),
(2740900, 60, 3812.22, -2453.93, 188.508, 1),
(2740900, 61, 3815.67, -2479.36, 192.388, 1),
(2740900, 62, 3819.47, -2503.68, 195.025, 1),
(2740900, 63, 3822.26, -2517.94, 194.068, 1),
(2740900, 64, 3825.49, -2534.36, 196.38, 1),
(2740900, 65, 3829.2, -2554.68, 196.714, 1),
(2740900, 66, 3836.67, -2578.53, 196.706, 1),
(2740900, 67, 3847.54, -2609.35, 200.06, 1),
(2740900, 68, 3861.53, -2624.76, 202.315, 1),
(2740900, 69, 3882.06, -2655.94, 203.425, 1),
(2740900, 70, 3886.7, -2663.55, 208.092, 1),
(2740900, 71, 3900.58, -2672.41, 212.663, 1),
(2740900, 72, 3909.82, -2687.58, 217.099, 1),
(2740900, 73, 3911.78, -2695.85, 220.364, 1),
(2740900, 74, 3916.01, -2703.19, 221.175, 1),
(2740900, 75, 3912.54, -2712.18, 221.06, 1),
(2740900, 76, 3900.4, -2743.33, 219.152, 1),
(2740900, 77, 3889.82, -2751.59, 221.799, 1),
(2740900, 78, 3883.42, -2756.96, 223.886, 1),
(2740900, 79, 3851.1, -2769.91, 227.46, 1),
(2740900, 80, 3837.9, -2769.54, 226.115, 1),
(2740900, 81, 3813.29, -2770.59, 220.927, 1),
(2740900, 82, 3801.16, -2771.02, 219.535, 1),
(2740900, 83, 3780.5, -2772.39, 213.906, 1),
(2740900, 84, 3767.55, -2775.39, 211.282, 1),
(2740900, 85, 3759.78, -2782.29, 209.166, 1),
(2740900, 86, 3752.76, -2787.6, 206.496, 1),
(2740900, 87, 3729.98, -2803.81, 210.023, 1),
(2740900, 88, 3723.95, -2808.09, 211.656, 1),
(2740900, 89, 3705.99, -2819.68, 215.066, 1),
(2740900, 90, 3685.56, -2832.99, 217.602, 1),
(2740900, 91, 3674.41, -2843.8, 217.875, 1),
(2740900, 92, 3662.46, -2853.29, 216.582, 1),
(2740900, 93, 3647.39, -2857.28, 213.151, 1),
(2740900, 94, 3630.63, -2860.27, 214.962, 1),
(2740900, 95, 3610.74, -2858.62, 208.904, 1),
(2740900, 96, 3587.92, -2854.56, 203.448, 1),
(2740900, 97, 3562.79, -2842.61, 197.044, 1),
(2740900, 98, 3534.27, -2828.21, 197.155, 1),
(2740900, 99, 3515.69, -2829.38, 201.276, 1),
(2740900, 100, 3487.66, -2829.19, 202.144, 1),
(2740900, 101, 3472.46, -2821.6, 201.429, 1),
(2740900, 102, 3460.58, -2817.21, 201.805, 1),
(2740900, 103, 3443.64, -2811.33, 202.098, 1);

UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_ducals_horse' WHERE  `entry`=27409;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27409;

-- Silverbrook Worgen SAI
SET @ENTRY := 27417;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,54,0,100,0,9,0,0,0,49,0,0,0,0,0,0,19,27409,60,0,0,0,0,0,"Silverbrook Worgen - On Just Summoned - Start Attacking"),
(@ENTRY,0,1,0,4,0,100,0,9,0,0,0,11,36589,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - On Aggro - Cast 'Dash'"),
(@ENTRY,0,2,0,61,0,100,0,9,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - On Just Summoned - Set Active On"),
(@ENTRY,0,3,0,1,0,100,0,3000,3000,3000,3000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - Out of Combat - Despawn Instant");
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80 WHERE  `entry`=27409;
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80 WHERE  `entry`=27411;

-- Conquest Hold Marauder SAI
SET @ENTRY := 27424;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,9,0,100,0,0,5,7000,10000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Conquest Hold Marauder - Within 0-5 Range - Cast 'Heroic Strike'"),
(@ENTRY,0,2,0,0,0,100,0,9000,12000,12000,18000,11,13730,1,0,0,0,0,1,0,0,0,0,0,0,0,"Conquest Hold Marauder - In Combat - Cast 'Demoralizing Shout'");

-- DB/Spell: Escape from Silverbrook
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=2 AND `SourceEntry`=48682;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,2,48682,0,0,31,0,3,27417,0,0,"","Escape from Silverbrook - Periodic Dummy - Only targets Worgs");


-- Eyes Above -- [H] http://www.wowhead.com/quest=12453/eyes-above
-- Imperial Eagle SAI
SET @ENTRY := 26369;
SET @SPELL := 49546;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,7000,5000,9000,11,55079,0,0,0,0,0,2,0,0,0,0,0,0,0,"Imperial Eagle - In Combat - Cast 'Swoop'"),
(@ENTRY,0,1,2,8,0,100,0,@SPELL,0,0,0,53,1,@ENTRY,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - On Spellhit 'Eagle Eyes' - Fly Up"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - On Spellhit 'Eagle Eyes' - Run Script"),
(@ENTRY,0,3,0,11,0,100,0,0,0,0,0,47,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Imperial Eagle - On Respawn - Set Visibility On"),
(@ENTRY,0,4,0,21,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Home Reached - Despawn Instant"),

(@ENTRY*100,9,0,0,0,0,100,0,7000,7000,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Set Visibility Off"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Stop WP Movement"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,201,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Move Home Position");

-- Siting Eagles Movement Type fix
UPDATE `creature` SET `MovementType`='0' AND `spawndist`='0' WHERE  `id`=@ENTRY AND `guid`IN(95613,95632,95633,95644,95657,95715,95731,95734,95735,95737,95747,95750,95770,95782,95783,95784,95786,95807,95810,95820,95821,95847,95848,95849,95860,95861,95885,95922,95924,95927,95930,95946,95947,95948,95983,95985,95986,95991,95992,96020,96025,96026,96072,96080,96125,96127,96129,96130,96136,96141,96143);

-- Spell target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL AND `ConditionValue2`=@ENTRY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17,0,@SPELL,0,0,31,1,3,@ENTRY,0,0,12,0,'','Target needs to be Imperial Eagle');

-- Imperial Eagles WP for the quest
DELETE FROM `waypoints` WHERE `entry`=@ENTRY AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY,1,4000,-3130,700,'Imperial Eagle');

-- Chill Out, Mon -- [A][H] www.wowhead.com/quest=12137/chill-out-mon
UPDATE `gameobject` SET `phaseMask`='2' WHERE  `guid`=58833;

-- Riding the Red Rocket - [A] http://www.wowhead.com/quest=12437/riding-the-red-rocket - [H] http://www.wowhead.com/quest=12432/riding-the-red-rocket

UPDATE creature SET curhealth=4920 WHERE id=27593;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup IN(27593);
INSERT INTO conditions VALUES(18, 27593, 49177, 0, 0, 2, 0, 37664, 1, 0, 0, 0, 0, '', '');
UPDATE creature_template SET AIName="", ScriptName="npc_riding_the_red_rocket" WHERE entry=27593;


-- Anatoly Will Talk - [A][H] http://www.wowhead.com/quest=12330/anatoly-will-talk

SET @HORSE := 27626;
SET @TATJANA := 27627;

DELETE FROM creature WHERE id=@TATJANA; -- I wan't to be sure that there aren't any other Tatjanas out there.
DELETE FROM creature WHERE guid=3110519 AND id=@TATJANA;
INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (3110519, @TATJANA, 571, 0, 0, 1, 1, 0, 1, 4034.35, -4376.06, 262.11, 4.31, 300, 0, 0, 10282, 0, 0, 0, 0, 0, 0);

UPDATE creature_template SET unit_flags=256 where entry=@HORSE;
UPDATE creature SET unit_flags=256 WHERE id=@HORSE and guid=118047;

DELETE FROM smart_scripts WHERE entryorguid IN(@HORSE, @TATJANA) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@HORSE*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@HORSE, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 28, 49138, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spawn - Remove aura Mount Tatjana''s Horse'),
    (@HORSE, 0, 1, 2, 8, 0, 100, 0, 49135, 0, 0, 0, 2, 1812, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Tatjana Ping - Set faction'),
    (@HORSE, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Tatjana Ping - Stop autoattack'),
    (@HORSE, 0, 4, 0, 8, 0, 100, 0, 49138, 0, 0, 0, 80, @HORSE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Mount Tatjana''s Horse (phase 1) - Run script'),
    (@HORSE, 0, 5, 6, 40, 0, 100, 0, 19, 0, 0, 0, 28, 49138, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Remove aura Mount Tatjana''s Horse'),
    (@HORSE, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 15, 12330, 0, 0, 0, 0, 0, 21, 2, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Quest credit'),
    (@HORSE, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, 26971, 0, 30, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
    (@HORSE, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Despawn'),
    (@HORSE, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 2, 0, 0, 0, 0, 9, @TATJANA, 0, 30, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
    (@TATJANA, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 19, 256+512+131072+262144, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On respawn - Remove unit_flags'),
    (@TATJANA, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 43671, 0, 0, 0, 0, 0, 9, @HORSE, 0, 5, 0, 0, 0, 0, 'Tatjana - On respawn - Spellcast Ride Vehicle'),
    (@TATJANA, 0, 2, 3, 8, 0, 100, 0, 49134, 0, 0, 0, 11, 49135, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On spellhit Tranquilizer Dart - Spellcast Tatjana Ping'),
    (@TATJANA, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 256+512+131072+262144, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On spellhit Tranquilizer Dart - Set unit_flags'),
    (@TATJANA, 0, 4, 0, 0, 0, 100, 0, 2000, 6000, 9000, 12000, 11, 32009, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On update IC - Spellcast Cutdown'),
    (@TATJANA, 0, 5, 0, 38, 0, 100, 0, 0, 1, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On data set 0 1 - Despawn after 15 seconds'),
    (@TATJANA, 0, 6, 0, 38, 0, 100, 0, 0, 2, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On data set 0 2 - Set home position'),
    (@HORSE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 9, 0, 0, 50, 0, 0, 0, 0, "Tatjana's Horse - On Script - Remove Flag In Combat"),
    (@HORSE*100, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0, 53, 1, 27626, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Tatjana's Horse - On Script - Start Waypoint"),
    (@HORSE*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Tatjana's Horse - On Script - Set Faction 35");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@HORSE;
INSERT INTO conditions VALUES (22, 5, @HORSE, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Run action if invoker is player');


 
 
/* 
*/ 
-- -------------------------------------------
-- HOWLING FJORD
-- -------------------------------------------


-- If Valgarde Falls... -- [A] http://www.wowhead.com/quest=11243/if-valgarde-falls

DELETE FROM creature WHERE id IN(24051, 24063);

INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (87530, 24051, 571, 0, 0, 1, 1, 0, 1, 738.176, -4933.92, 5.9536, 3.76332, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87531, 24051, 571, 0, 0, 1, 1, 0, 1, 740.399, -4941.34, 5.24911, 3.17662, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87532, 24063, 571, 0, 0, 1, 1, 0, 0, 769.433, -4955.05, 2.07196, 2.69753, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87533, 24051, 571, 0, 0, 1, 1, 0, 1, 766.205, -4986.84, 1.60532, 5.72917, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87534, 24051, 571, 0, 0, 1, 1, 0, 1, 733.168, -4999.25, 4.01414, 2.53968, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87535, 24063, 571, 0, 0, 1, 1, 0, 0, 708.769, -4917.59, 7.79307, 4.87781, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87536, 24051, 571, 0, 0, 1, 1, 0, 1, 770.842, -4877.62, 2.94487, 3.2049, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87537, 24051, 571, 0, 0, 1, 1, 0, 1, 753.224, -4849.59, 5.69775, 4.21807, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (87538, 24063, 571, 0, 0, 1, 1, 0, 0, 771.226, -4950.11, 2.26675, 3.23239, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87539, 24051, 571, 0, 0, 1, 1, 0, 1, 785.022, -4928.71, 1.15719, 6.147, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87540, 24051, 571, 0, 0, 1, 1, 0, 1, 730.868, -4893.85, 4.37402, 5.37731, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87541, 24051, 571, 0, 0, 1, 1, 0, 1, 736.414, -4895.24, 3.80446, 3.34313, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87542, 24063, 571, 0, 0, 1, 1, 0, 0, 733.528, -4891.04, 3.37424, 4.62332, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (118766, 24051, 571, 0, 0, 1, 1, 22048, 1, 709.307, -4939.81, 5.69565, 2.21077, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118767, 24051, 571, 0, 0, 1, 1, 22050, 1, 719.792, -4981.83, 6.26409, 1.5708, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118768, 24051, 571, 0, 0, 1, 1, 22049, 1, 710.86, -4936.77, 6.34196, -1.73661, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118769, 24051, 571, 0, 0, 1, 1, 22048, 1, 719.792, -4990.14, 6.70648, -2.03322, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118770, 24051, 571, 0, 0, 1, 1, 22048, 1, 739.815, -4866.26, 6.49782, 3.53406, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118771, 24051, 571, 0, 0, 1, 1, 22048, 1, 739.29, -4937.83, 5.74562, 3.5513, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118772, 24051, 571, 0, 0, 1, 1, 22050, 1, 773.114, -4973.18, 1.3794, 0.366519, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118773, 24051, 571, 0, 0, 1, 1, 22049, 1, 760.44, -4896.1, 2.77501, 1.78024, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (120557, 24063, 571, 0, 0, 1, 1, 22044, 0, 713.543, -4938.75, 6.11675, -2.70399, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120558, 24063, 571, 0, 0, 1, 1, 22044, 0, 759.329, -4927.86, 3.91054, 3.25516, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120559, 24063, 571, 0, 0, 1, 1, 22044, 0, 711.91, -4963.56, 4.99635, 3.34014, 120, 5, 0, 3728, 0, 1, 0, 0, 0, 0),
    (120560, 24063, 571, 0, 0, 1, 1, 22044, 0, 761.72, -4863.74, 4.49782, 3.24979, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120561, 24063, 571, 0, 0, 1, 1, 22044, 0, 766.92, -4893.33, 2.99759, 2.0975, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0);

UPDATE creature SET spawntimesecs=120 WHERE id IN(24051, 24063);

-- 
-- Sorlof's Booty - [A][H] - http://de.wowhead.com/quest=11529/sorlofs-beute
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=24992;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(24992, 45008, 0, 0);

UPDATE `creature_template` SET `npcflag`=16777216 WHERE  `entry`=24992;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45008;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 45008, 0, 0, 31, 0, 3, 24914, 0, 0, 0, 0, '', 'Spell Cannon Assault targets Sorlof');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=24992;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 24992, 45008, 0, 0, 9, 0, 11529, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

-- Quest Let's Go Surfing Now - [A] - http://www.wowhead.com/quest=11436/lets-go-surfing-now
DELETE FROM `gameobject_template` WHERE `entry`=186894;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(186894, 22, 295, 'Large Harpoon Lever', '', '', '', 0, 0, 2, 50007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=107391;

-- Dragonflayer Harpoon SAI
SET @ENTRY := 27924;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,27924,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,5,27924,0,0,15,11436,0,0,0,0,0,17,0,10,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 5 Reached - Quest Credit 'Let's Go Surfing Now'"),
(@ENTRY,0,2,0,61,0,100,0,5,27924,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 5 Reached - Despawn Instant"),
(@ENTRY,0,3,0,40,0,100,0,4,27924,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 4 Reached - Despawn In 5000 ms");

DELETE FROM `waypoints` WHERE `entry`=27924;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27924, 1, 803.085, -5333.39, 191.903, 'Dragonflayer Harpoon'),
(27924, 2, 761.183, -5268.77, 152.492, 'Dragonflayer Harpoon'),
(27924, 3, 695.561, -5155.04, 81.2906, 'Dragonflayer Harpoon'),
(27924, 4, 647.533, -5073.72, 29.9669, 'Dragonflayer Harpoon'),
(27924, 5, 621.608, -5027.49, 2.03123, 'Dragonflayer Harpoon');

DELETE FROM `creature_template_addon` WHERE `entry`=27924;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27924,0,0,0x1000000|0x2000000,0x1,0, '43775');
UPDATE `creature_template` SET `InhabitType`=4, `speed_walk`=6, `speed_run`=6 WHERE  `entry`=27924;

-- Vrykul Scroll of Ascension drop condition
UPDATE `conditions` SET `ConditionValue1`=11248, `Comment`='Winterskorn mobs drop item 33314 only if Quest 11248 has been rewarded' WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=33314;
UPDATE `conditions` SET `ConditionValue1`=11256, `Comment`='Winterskorn mobs drop item 33345 only if Quest 11256 has been rewarded' WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=33345;

--  DB/Quest: There Exists No Honor Among Birds -- http://www.wowhead.com/quest=11470
DELETE FROM `creature_template_addon` WHERE `entry`=24783;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(24783, 0, 0, 0, 1, 0, 43775);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=44422;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,44422,0,0,30,0,186946,5,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'"),
(13,1,44422,0,0,31,0,5,186946,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'");

-- Fjord Hawk Matriarch
UPDATE `creature_template` SET `InhabitType`='5' WHERE  `entry`=24787;
-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115835;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=491.5974,`position_y`=-6158.39,`position_z`=144.1042 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,491.5974,-6158.39,144.1042,0,0,1,0,100,0),
(@PATH,2,509.5939,-6162.629,111.2709,0,0,1,0,100,0),
(@PATH,3,526.574,-6162.785,95.60418,0,0,1,0,100,0),
(@PATH,4,574.4791,-6163.997,95.60418,0,0,1,0,100,0),
(@PATH,5,603.0228,-6169.135,135.1598,0,0,1,0,100,0),
(@PATH,6,621.6965,-6158.342,152.5963,0,0,1,0,100,0),
(@PATH,7,637.6,-6155.499,154.6354,0,0,1,0,100,0),
(@PATH,8,663.0421,-6125.693,179.4132,0,0,1,0,100,0),
(@PATH,9,656.72,-6138.115,215.4652,0,0,1,0,100,0),
(@PATH,10,639.1322,-6143.215,215.4652,0,0,1,0,100,0),
(@PATH,11,618.7733,-6150.35,208.0208,0,0,1,0,100,0),
(@PATH,12,588.9388,-6145.327,208.0208,0,0,1,0,100,0),
(@PATH,13,554.6487,-6152.367,187.5208,0,0,1,0,100,0),
(@PATH,14,528.2413,-6138.124,166.6597,0,0,1,0,100,0),
(@PATH,15,497.937,-6157.058,187.5208,0,0,1,0,100,0),
(@PATH,16,482.7061,-6146.376,174.6875,0,0,1,0,100,0),
(@PATH,17,491.5974,-6158.39,144.1042,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115836;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=520.6224,`position_y`=-6137.84,`position_z`=169.3022 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,520.6224,-6137.84,169.3022,0,0,1,0,100,0),
(@PATH,2,539.8384,-6131.232,149.1912,0,0,1,0,100,0),
(@PATH,3,520.709,-6158.917,160.4134,0,0,1,0,100,0),
(@PATH,4,485.8767,-6155.685,160.4134,0,0,1,0,100,0),
(@PATH,5,438.8145,-6158.287,160.4134,0,0,1,0,100,0),
(@PATH,6,419.3206,-6156.742,160.4134,0,0,1,0,100,0),
(@PATH,7,390.6546,-6143.165,160.4134,0,0,1,0,100,0),
(@PATH,8,377.2733,-6114.98,160.4134,0,0,1,0,100,0),
(@PATH,9,383.0898,-6128.999,185.83,0,0,0,1,100,0),
(@PATH,10,417.4906,-6154.904,185.83,0,0,1,0,100,0),
(@PATH,11,452.2428,-6147.803,185.83,0,0,1,0,100,0),
(@PATH,12,497.4655,-6150.674,185.83,0,0,1,0,100,0),
(@PATH,13,520.6224,-6137.84,169.3022,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115837;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=596.8774,`position_y`=-6114.975,`position_z`=271.1343 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,596.8774,-6114.975,271.1343,0,0,1,0,100,0),
(@PATH,2,595.4591,-6109.405,278.3748,0,0,1,0,100,0),
(@PATH,3,571.2776,-6109.743,290.4025,0,0,1,0,100,0),
(@PATH,4,556.7193,-6108.814,297.3566,0,0,1,0,100,0),
(@PATH,5,517.0029,-6104.844,297.3566,0,0,1,0,100,0),
(@PATH,6,503.9214,-6117.692,297.3566,0,0,1,0,100,0),
(@PATH,7,466.3313,-6107.801,271.1343,0,0,1,0,100,0),
(@PATH,8,475.6375,-6120.523,271.1343,0,0,1,0,100,0),
(@PATH,9,500.4033,-6130.543,271.1343,0,0,1,0,100,0),
(@PATH,10,542.1522,-6114.92,271.1343,0,0,1,0,100,0),
(@PATH,11,567.1166,-6129.524,271.1343,0,0,1,0,100,0),
(@PATH,12,596.8774,-6114.975,271.1343,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115843;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=290.8945,`position_y`=-6070.151,`position_z`=84.36917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,290.8945,-6070.151,84.36917,0,0,1,0,100,0),
(@PATH,2,273.076,-6034.628,84.36917,0,0,1,0,100,0),
(@PATH,3,268.3575,-6009.71,121.8221,0,0,1,0,100,0),
(@PATH,4,282.7736,-6034.701,150.6469,0,0,1,0,100,0),
(@PATH,5,297.921,-6060.3,111.1191,0,0,1,0,100,0),
(@PATH,6,324.4433,-6101.173,115.008,0,0,1,0,100,0),
(@PATH,7,351.7174,-6115.625,115.008,0,0,1,0,100,0),
(@PATH,8,380.059,-6146.51,102.4525,0,0,1,0,100,0),
(@PATH,9,381.592,-6162.233,80.36916,0,0,1,0,100,0),
(@PATH,10,363.2276,-6145.913,80.36916,0,0,1,0,100,0),
(@PATH,11,338.3981,-6105.44,80.36916,0,0,1,0,100,0),
(@PATH,12,319.2164,-6096.714,84.36917,0,0,1,0,100,0),
(@PATH,13,290.8945,-6070.151,84.36917,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115845;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=360.9156,`position_y`=-6061.682,`position_z`=302.8403 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,360.9156,-6061.682,302.8403,0,0,1,0,100,0),
(@PATH,2,389.247,-6078.495,302.8403,0,0,1,0,100,0),
(@PATH,3,392.2037,-6094.839,296.007,0,0,1,0,100,0),
(@PATH,4,374.589,-6096.534,288.5903,0,0,1,0,100,0),
(@PATH,5,358.6935,-6082.393,274.9237,0,0,1,0,100,0),
(@PATH,6,338.8949,-6049.761,274.9237,0,0,1,0,100,0),
(@PATH,7,320.3495,-6021.407,274.9237,0,0,1,0,100,0),
(@PATH,8,306.0276,-5998.132,285.257,0,0,1,0,100,0),
(@PATH,9,313.4884,-5983.751,285.2291,0,0,1,0,100,0),
(@PATH,10,320.7385,-5972.151,286.1277,0,0,1,0,100,0),
(@PATH,11,330.6828,-6007.996,302.8403,0,0,1,0,100,0),
(@PATH,12,349.4529,-6033.62,302.8403,0,0,1,0,100,0),
(@PATH,13,360.9156,-6061.682,302.8403,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115844;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=389.949,`position_y`=-6113.926,`position_z`=217.1557 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,389.949,-6113.926,217.1557,0,0,1,0,100,0),
(@PATH,2,365.9727,-6083.048,249.1279,0,0,1,0,100,0),
(@PATH,3,348.9503,-6058.797,249.1279,0,0,1,0,100,0),
(@PATH,4,334.4755,-6041.239,249.1279,0,0,1,0,100,0),
(@PATH,5,306.4679,-6010.077,240.8223,0,0,1,0,100,0),
(@PATH,6,305.4742,-6011.148,217.1557,0,0,1,0,100,0),
(@PATH,7,308.0244,-6019.713,217.1557,0,0,1,0,100,0),
(@PATH,8,331.7084,-6052.974,217.1557,0,0,1,0,100,0),
(@PATH,9,350.9348,-6071.563,217.1557,0,0,1,0,100,0),
(@PATH,10,371.7133,-6102.678,217.1557,0,0,1,0,100,0),
(@PATH,11,389.949,-6113.926,217.1557,0,0,1,0,100,0);


-- The Shining Light - [A] - http://www.wowhead.com/quest=11288/the-shining-light
DELETE FROM `conditions` WHERE `SourceEntry`=43203;
INSERT INTO `conditions` VALUES (17, 0, 43203, 0, 0, 28, 0, 11288, 0, 0, 0, 0, 0, '', 'Shinning Light can only hit targets on the quest');
INSERT INTO `conditions` VALUES (13, 1, 43203, 0, 0, 31, 0, 3, 24177, 0, 0, 0, 0, '', 'Shinning Light can only hit Decomposing Ghouls');
INSERT INTO `conditions` VALUES (17, 0, 43203, 0, 1, 9, 0, 11288, 0, 0, 0, 0, 0, '', 'Shinning Light can also hit targets with the quest completed and not rewarded.');
 
 
/* 
*/ 
-- -------------------------------------------
-- ICECROWN
-- -------------------------------------------

-- Quest Army of the Damned - [H] -- http://www.wowhead.com/quest=13236/army-of-the-damned
SET @DEATHSTORM := 58912;
SET @SOULCLEAVE := 58913;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SOULCLEAVE;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, @SOULCLEAVE, 0, 0, 32, 0, 8, 0, 0, 0, 0, 0, '', 'Soul Cleave can target units');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=58912;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(17,0,58912,0,0,31,1,3,31254,0,0,0,0,'','Deathstorm requires target Lordaeron Footsoldier'),
(17,0,58912,0,1,31,1,3,32414,0,0,0,0,'','Deathstorm requires target Lordaeron Captain'),
(13,1,58912,0,0,31,0,3,31254,0,0,0,0,'','Deathstorm can hit Lordaeron Footsoldier'),
(13,1,58912,0,1,31,0,3,32414,0,0,0,0,'','Deathstorm can hit Lordaeron Captain');

-- Quest It's All Fun and Games [A][H] - www.wowhead.com/quest=12892/its-all-fun-and-games - http://www.wowhead.com/quest=12887/its-all-fun-and-games
-- The Ocular SAI
SET @ENTRY := 29747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,75,55162,1,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Reset - Add Aura 'The Ocular: Transform'"),
(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,85,55289,0,0,0,0,0,18,200,0,0,0,0,0,0,"The Ocular - Out of Combat - Invoker Cast 'It's All Fun and Games: The Ocular Kill Credit'"),
(@ENTRY,0,2,0,0,0,100,0,1500,1500,4000,4000,11,55269,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Ocular - In Combat - Cast 'Deathly Stare'"),
(@ENTRY,0,3,4,6,0,100,0,0,0,0,0,33,29803,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Ocular - On Just Died - Quest Credit 'It's All Fun and Games'"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,70,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - Respawn Self");

DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (29747, 0, 0, 50331648, 1, 0, '43775');
UPDATE `creature_model_info` SET `CombatReach`=60 WHERE  `DisplayID`=6533;

-- Quest The Air Stands Still [A][H] - wowhead.com/quest=13125
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 0x40000000 WHERE `entry` IN (30839, 30840, 30838);

-- [Q] You'll Need a Gryphon - http://www.wowhead.com/quest=12814/youll-need-a-gryphon
UPDATE `creature_loot_template` SET `Chance`=100 WHERE  `Entry`=29333 AND `Item`=40970;
DELETE FROM `creature_template_addon` WHERE `entry`=29403;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(29403, 0, 0, 33554432, 0, 0, '47433');

-- [Q] The Fleshworks - http://www.wowhead.com/quest=13119/destroying-the-altars
UPDATE `creature_loot_template` SET `Chance`=100 WHERE  `Entry`=30746 AND `Item`=43159;

-- BEGIN INFRA-GREEN QUESTS ----------------------------------------------
-- Leading the Charge -- (A) http://www.wowhead.com/quest=13380/leading-the-charge (ALLIANCE SHORT)
-- Watts My Target -- (A) http://www.wowhead.com/quest=13381/watts-my-target (ALLIANCE LONG)
-- Static Shock Troops: the Bombardment -- (A) http://www.wowhead.com/quest=13404/static-shock-troops-the-bombardment (ALLIANCE SHORT DAILY)
-- Putting the Hertz: The Valley of Lost Hope -- (A) http://www.wowhead.com/quest=13382/putting-the-hertz-the-valley-of-lost-hope (ALLIANCE LONG DAILY)
-- Fringe Science Benefits -- (H) http://www.wowhead.com/quest=13373/fringe-science-benefits (HORDE SHORT)
-- Amped for Revolt! -- (H) http://www.wowhead.com/quest=13374/amped-for-revolt (HORDE LONG)
-- Riding the Wavelength: The Bombardment -- (H) http://www.wowhead.com/quest=13406/riding-the-wavelength-the-bombardment (HORDE SHORT DAILY)
-- Total Ohmage: The Valley of Lost Hope! -- (H) http://www.wowhead.com/quest=13376/total-ohmage-the-valley-of-lost-hope (HORDE LONG DAILY)
-- -----------------------------------------------------------------------

-- Fix Missing NPCs
-- Rizzy Ratchwiggle (H)
DELETE FROM creature WHERE id=31839 and guid=6509;
INSERT INTO creature VALUES(6509, 31839, 571, 0, 0, 1, 1, 0, 0, 7884.2, 2057.69, 600.26, 3.1196, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);

-- Kibli Killohertz (A)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id=32444 );
DELETE FROM creature WHERE id=32444 and guid=6511;
INSERT INTO creature VALUES(6511, 32444, 571, 0, 0, 1, 1, 0, 0, 7623.05, 2060.18, 600.258, 0.010155, 300, 0, 0, 12600, 3994, 0, 0, 0, 0, 0);

-- Fringe Engineer Tezzla (H)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=32430);
DELETE FROM creature WHERE id=32430 and guid=7369;
INSERT INTO creature VALUES(7369, 32430, 571, 0, 0, 1, 1, 0, 0, 7897.96, 2057.59, 600.259, 3.10624, 300, 0, 0, 12600, 3994, 0, 0, 0, 0, 0);

-- Fix Bomber Givers
UPDATE creature_template SET npcflag=npcflag|1, exp=2, minlevel=80, maxlevel=80, gossip_menu_id=10119, AIName='SmartAI', ScriptName='' WHERE entry=31648;
UPDATE creature_template SET npcflag=npcflag|1, exp=2, minlevel=80, maxlevel=80, gossip_menu_id=10120, AIName='SmartAI', ScriptName='' WHERE entry=31839;

-- Fix Quests
DELETE from quest_template_addon WHERE ID=13404;
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`)
VALUES
    (13404, 0, 0, 0, 13381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

DELETE FROM smart_scripts WHERE entryorguid IN(31648, 31839) AND source_type=0;
INSERT INTO smart_scripts VALUES(31648, 0, 0, 2, 62, 0, 100, 0, 10119, 0, 0, 0, 85, 59552, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31648, 0, 1, 2, 62, 0, 100, 0, 10119, 1, 0, 0, 85, 61151, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31648, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close gossip');
INSERT INTO smart_scripts VALUES(31839, 0, 0, 2, 62, 0, 100, 0, 10120, 0, 0, 0, 85, 59780, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31839, 0, 1, 2, 62, 0, 100, 0, 10120, 1, 0, 0, 85, 61152, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31839, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close gossip');

DELETE FROM conditions WHERE SourceTypeOrReferenceID=15 AND SourceGroup IN(10119, 10120);
INSERT INTO conditions VALUES (15, 10120, 0, 0, 0, 9, 0, 13373, 0, 0, 0, 0, 0, '', 'show gossip on quest 13373 taken');
INSERT INTO conditions VALUES (15, 10120, 0, 0, 1, 9, 0, 13406, 0, 0, 0, 0, 0, '', 'show gossip on quest 13406 taken');
INSERT INTO conditions VALUES (15, 10120, 1, 0, 0, 9, 0, 13374, 0, 0, 0, 0, 0, '', 'show gossip on quest 13374 taken');
INSERT INTO conditions VALUES (15, 10120, 1, 0, 1, 9, 0, 13376, 0, 0, 0, 0, 0, '', 'show gossip on quest 13376 taken');
INSERT INTO conditions VALUES (15, 10119, 0, 0, 0, 9, 0, 13404, 0, 0, 0, 0, 0, '', 'show gossip on quest 13404 taken');
INSERT INTO conditions VALUES (15, 10119, 0, 0, 1, 9, 0, 13380, 0, 0, 0, 0, 0, '', 'show gossip on quest 13380 taken');
INSERT INTO conditions VALUES (15, 10119, 1, 0, 0, 9, 0, 13381, 0, 0, 0, 0, 0, '', 'show gossip on quest 13381 taken');
INSERT INTO conditions VALUES (15, 10119, 1, 0, 1, 9, 0, 13382, 0, 0, 0, 0, 0, '', 'show gossip on quest 13382 taken');

DELETE FROM gossip_menu_option WHERE menu_id IN(10120, 10119);
INSERT INTO gossip_menu_option VALUES (10119, 0, 0, 'Give me a bomber for a short ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10119, 1, 0, 'Give me a bomber for a long ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10120, 0, 0, 'Give me a bomber for a short ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10120, 1, 0, 'Give me a bomber for a long ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);

-- Correct spawn trigger positions
UPDATE creature_template SET InhabitType=4, flags_extra=130 WHERE entry=31690;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=31690 AND position_z < 610);
DELETE FROM creature WHERE id=31690 AND position_z < 610;
UPDATE creature SET position_z=620, spawndist=0, MovementType=0 WHERE id=31690;

-- Summoning spells target conditions
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(59552, 59780, 61151, 61152);
INSERT INTO conditions VALUES (13, 1, 59552, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 59780, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 61151, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 61152, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');

-- Fix switching spells
DELETE FROM spell_script_names WHERE spell_id IN(59196, 59194, 59193);
INSERT INTO spell_script_names VALUES(59196, 'spell_switch_infragreen_bomber_station');
INSERT INTO spell_script_names VALUES(59194, 'spell_switch_infragreen_bomber_station');
INSERT INTO spell_script_names VALUES(59193, 'spell_switch_infragreen_bomber_station');
DELETE FROM spell_script_names WHERE spell_id IN(59061, 59288);
INSERT INTO spell_script_names VALUES(59061, 'spell_charge_shield_bomber');
INSERT INTO spell_script_names VALUES(59288, 'spell_charge_shield_bomber');
DELETE FROM spell_script_names WHERE spell_id IN(61093);
INSERT INTO spell_script_names VALUES(61093, 'spell_fight_fire_bomber');
DELETE FROM spell_script_names WHERE spell_id IN(59622);
INSERT INTO spell_script_names VALUES(59622, 'spell_anti_air_rocket_bomber');

-- Fix Quest creatures
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=32769);
DELETE FROM creature_formations WHERE leaderGUID IN(SELECT guid FROM creature WHERE id=32769);
DELETE FROM creature WHERE id=32769 AND guid IN(78842,78843,78844,78845,78846,78847,78848,78849,78850,78851,78852,78853,78854,78855,78856,78857,78858,78859,78860,78861,78862,78863,78864);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES 
    (78842, 32769, 571, 0, 0, 1, 1, 25753, 0, 7523.09, 1852.78, 491.641, 1.16008, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78843, 32769, 571, 0, 0, 1, 1, 25753, 0, 7523.09, 1852.78, 491.641, 3.23212, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78844, 32769, 571, 0, 0, 1, 1, 25753, 0, 7703.2, 1822.89, 469.378, 3.47223, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78845, 32769, 571, 0, 0, 1, 1, 25753, 0, 7703.2, 1822.89, 469.378, 3.94286, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78846, 32769, 571, 0, 0, 1, 1, 25753, 0, 7770.85, 1626.59, 469.378, 4.35007, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78847, 32769, 571, 0, 0, 1, 1, 25753, 0, 7770.85, 1626.59, 469.378, 0.010103, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78848, 32769, 571, 0, 0, 1, 1, 25753, 0, 7733.55, 1578.02, 469.378, 3.23125, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78849, 32769, 571, 0, 0, 1, 1, 25753, 0, 7733.55, 1578.02, 469.378, 2.51066, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78850, 32769, 571, 0, 0, 1, 1, 25753, 0, 7700.71, 1866.03, 464.062, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78851, 32769, 571, 0, 0, 1, 1, 25753, 0, 7634.01, 1863.8, 453.321, 0.100306, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78852, 32769, 571, 0, 0, 1, 1, 25753, 0, 7735.12, 1823.7, 464.062, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78853, 32769, 571, 0, 0, 1, 1, 25753, 0, 7783.46, 1783.04, 469.012, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78854, 32769, 571, 0, 0, 1, 1, 25753, 0, 7838.73, 1761.25, 466.425, 4.96978, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78855, 32769, 571, 0, 0, 1, 1, 25753, 0, 7763.36, 1704.4, 459.294, 3.89379, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78856, 32769, 571, 0, 0, 1, 1, 25753, 0, 7685.98, 1708.66, 460.417, 3.89379, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78857, 32769, 571, 0, 0, 1, 1, 25753, 0, 7711.54, 1636.03, 447.492, 4.85589, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78858, 32769, 571, 0, 0, 1, 1, 25753, 0, 7630.44, 1601.94, 445.692, 2.12271, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78859, 32769, 571, 0, 0, 1, 1, 25753, 0, 7559.02, 1547.51, 435.682, 1.52973, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78860, 32769, 571, 0, 0, 1, 1, 25753, 0, 7695.42, 1557.94, 483.848, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78861, 32769, 571, 0, 0, 1, 1, 25753, 0, 7681.77, 1636.37, 491.285, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78862, 32769, 571, 0, 0, 1, 1, 25753, 0, 7651.87, 1722.94, 495.997, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78863, 32769, 571, 0, 0, 1, 1, 25753, 0, 7725.34, 1767.48, 510.085, 6.28139, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78864, 32769, 571, 0, 0, 1, 1, 25753, 0, 7791.85, 1708.06, 518.138, 6.28139, 300, 60, 0, 12600, 3994, 1, 0, 0, 0, 0);

UPDATE creature SET MovementType=1 WHERE id=32769;

UPDATE creature_template SET KillCredit2=32188, AIName='SmartAI', ScriptName='' WHERE entry=32769; -- Gargoyle Ambusher
DELETE FROM smart_scripts WHERE entryorguid=32769 AND source_type=0;
INSERT INTO smart_scripts VALUES(32769, 0, 0, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 31406, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32769, 0, 1, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 32512, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32769, 0, 2, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 31838, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32769, 0, 3, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 32513, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32769, 0, 4, 0, 9, 0, 100, 0, 0, 40, 1500, 1500, 11, 60239, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'In Range - Cast Spell Gargoyle Ambusher Strike');
INSERT INTO smart_scripts VALUES(32769, 0, 5, 0, 37, 0, 100, 1, 0, 0, 0, 0, 203, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On AI Init - Set Combat Distance');


DELETE FROM creature_template_addon WHERE entry=32767;
INSERT INTO creature_template_addon VALUES (32767, 0, 0, 50331648, 0, 0, '');
DELETE FROM creature WHERE id=32767 AND guid IN(43100,43101,43102,43103,43104,43105,43106,43107);
INSERT INTO creature VALUES
    (43100, 32767, 571, 0, 0, 1, 1, 27064, 0, 7244.55, 1285.52, 416.07, 2.71176, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43101, 32767, 571, 0, 0, 1, 1, 27064, 0, 7134.18, 1373.87, 408.537, 5.90048, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43102, 32767, 571, 0, 0, 1, 1, 27064, 0, 7155.42, 1211.4, 386.189, 5.49993, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43103, 32767, 571, 0, 0, 1, 1, 27064, 0, 7302.18, 1240.95, 390.122, 0.418399, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43104, 32767, 571, 0, 0, 1, 1, 27064, 0, 7333.87, 1348.77, 393.362, 0.418399, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43105, 32767, 571, 0, 0, 1, 1, 27064, 0, 7239.56, 1441.97, 384.094, 4.94622, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43106, 32767, 571, 0, 0, 1, 1, 27064, 0, 7407.94, 1436.64, 390.421, 0.300584, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (43107, 32767, 571, 0, 0, 1, 1, 27064, 0, 7526.03, 1354.32, 401.356, 0.300584, 300, 60, 0, 25200, 0, 1, 0, 0, 0, 0);

UPDATE creature_template SET KillCredit1=31721, AIName='SmartAI', ScriptName='' WHERE entry=32767; -- Frostbrood Sentry
DELETE FROM smart_scripts WHERE entryorguid=32767 AND source_type=0;
INSERT INTO smart_scripts VALUES(32767, 0, 0, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 31406, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32767, 0, 1, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 32512, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32767, 0, 2, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 31838, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32767, 0, 3, 0, 1, 0, 100, 0, 5000, 10000, 3000, 6000, 49, 0, 0, 0, 0, 0, 0, 19, 32513, 80, 0, 0, 0, 0, 0, 'Out of Combat - Attack Start');
INSERT INTO smart_scripts VALUES(32767, 0, 4, 0, 9, 0, 100, 0, 0, 40, 2000, 3000, 11, 60542, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'In Range - Cast Spell Bitter Blast');
INSERT INTO smart_scripts VALUES(32767, 0, 5, 0, 37, 0, 100, 1, 0, 0, 0, 0, 203, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On AI Init - Set Combat Distance');

UPDATE creature_template SET KillCredit1=32410 WHERE entry=32771; -- Bombardment Captain
UPDATE creature_template SET minlevel=80, maxlevel=80, faction=21, AIName='SmartAI', ScriptName='' WHERE entry=32154;
DELETE FROM smart_scripts WHERE entryorguid=32154 AND source_type=0;
INSERT INTO smart_scripts VALUES(32154, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 52324, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Death - Cast Spell Scourgewagon Explosion');
UPDATE creature_template SET modelid1=15958, modelid2=12818, modelid3=15962, minlevel=80, maxlevel=80, faction=21, mechanic_immune_mask=8388624 WHERE entry=32410;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(32154, 32410));
DELETE FROM creature WHERE id IN(32154, 32410) and guid IN(134849,134850,134851,134852,134853,134854,134855,134856,134857,134858,134859,134860,134861,134862,134863,134864,134865,134866,134867,134868,134869,134870,134871,134872,134873,134874,134875,134876,134877,134878,134879,134880,134881,134882,134883,134884,134885,134886,134887,134888,134889);
INSERT INTO creature VALUES
    (134849, 32154, 571, 0, 0, 1, 1, 0, 0, 7707.46, 1695.11, 341.05, 4.43793, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134850, 32154, 571, 0, 0, 1, 1, 0, 0, 7724.26, 1771.43, 348.847, 1.70868, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134851, 32154, 571, 0, 0, 1, 1, 0, 0, 7826.99, 1768.44, 358.238, 2.96924, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134852, 32154, 571, 0, 0, 1, 1, 0, 0, 7851.09, 1955.81, 367.002, 1.97571, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134853, 32154, 571, 0, 0, 1, 1, 0, 0, 7842.81, 1840.36, 365.721, 4.29656, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134854, 32154, 571, 0, 0, 1, 1, 0, 0, 7795.76, 1835.98, 362.766, 4.24158, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134855, 32154, 571, 0, 0, 1, 1, 0, 0, 7813.27, 1662.84, 356.26, 6.26398, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134856, 32154, 571, 0, 0, 1, 1, 0, 0, 7202.76, 1316.63, 305.442, 3.29517, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134857, 32154, 571, 0, 0, 1, 1, 0, 0, 7220.64, 1216.06, 307.663, 1.15889, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134858, 32154, 571, 0, 0, 1, 1, 0, 0, 7129.91, 1155.77, 305.815, 1.17067, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134859, 32154, 571, 0, 0, 1, 1, 0, 0, 7144.89, 1115.43, 314.937, 5.51785, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134860, 32154, 571, 0, 0, 1, 1, 0, 0, 7172.32, 1152.7, 309.25, 6.03229, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134861, 32154, 571, 0, 0, 1, 1, 0, 0, 7173.22, 1185.4, 308.278, 6.03229, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134862, 32154, 571, 0, 0, 1, 1, 0, 0, 7153.32, 1234.99, 301.82, 4.89346, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134863, 32154, 571, 0, 0, 1, 1, 0, 0, 7737.62, 1637.87, 346.603, 4.43793, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134864, 32154, 571, 0, 0, 1, 1, 0, 0, 7611.61, 1651.27, 342.069, 1.94822, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134865, 32154, 571, 0, 0, 1, 1, 0, 0, 7616.57, 1716.3, 344.036, 1.94822, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134866, 32154, 571, 0, 0, 1, 1, 0, 0, 7232.34, 1365.87, 309.911, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134867, 32154, 571, 0, 0, 1, 1, 0, 0, 7179.8, 1368.87, 310.435, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134868, 32154, 571, 0, 0, 1, 1, 0, 0, 7163.97, 1335.66, 307.248, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134869, 32154, 571, 0, 0, 1, 1, 0, 0, 7142.1, 1313.45, 303.877, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134870, 32154, 571, 0, 0, 1, 1, 0, 0, 7124.12, 1286.83, 299.649, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134871, 32154, 571, 0, 0, 1, 1, 0, 0, 7119.05, 1254.62, 297.911, 4.89346, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134872, 32154, 571, 0, 0, 1, 1, 0, 0, 7553.98, 2091.65, 500.312, 3.96984, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134873, 32154, 571, 0, 0, 1, 1, 0, 0, 7540, 2101.52, 500.312, 4.12692, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134874, 32154, 571, 0, 0, 1, 1, 0, 0, 7534.32, 2014.59, 500.312, 1.81785, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134875, 32154, 571, 0, 0, 1, 1, 0, 0, 7515.71, 2002.49, 500.273, 2.21054, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134876, 32154, 571, 0, 0, 1, 1, 0, 0, 7494.5, 2011.03, 500.273, 0.561207, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134877, 32154, 571, 0, 0, 1, 1, 0, 0, 7512.02, 2044.56, 499.729, 2.22232, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134878, 32154, 571, 0, 0, 1, 1, 0, 0, 7488.65, 2092.86, 499.729, 1.20523, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134879, 32154, 571, 0, 0, 1, 1, 0, 0, 7471.24, 2101.12, 499.729, 1.03637, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134880, 32154, 571, 0, 0, 1, 1, 0, 0, 7513.48, 2121.57, 500.311, 3.50645, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134881, 32154, 571, 0, 0, 1, 1, 0, 0, 7471.66, 2146.02, 500.311, 4.16618, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134882, 32154, 571, 0, 0, 1, 1, 0, 0, 7459.63, 2151.93, 500.311, 4.22509, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134883, 32154, 571, 0, 0, 1, 1, 0, 0, 7446.16, 2156.28, 500.311, 4.29577, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134884, 32154, 571, 0, 0, 1, 1, 0, 0, 7457.32, 2110.68, 499.729, 1.0992, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134885, 32154, 571, 0, 0, 1, 1, 0, 0, 7426.65, 2167.64, 500.312, 4.42536, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134886, 32154, 571, 0, 0, 1, 1, 0, 0, 7421.56, 2149.44, 500.312, 6.19643, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134887, 32154, 571, 0, 0, 1, 1, 0, 0, 7530.32, 2108.52, 500.312, 4.19759, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134888, 32154, 571, 0, 0, 1, 1, 0, 0, 7600.73, 2060.82, 500.068, 3.10982, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134889, 32154, 571, 0, 0, 1, 1, 0, 0, 7741.72, 1968.48, 367.425, 0.935059, 300, 0, 0, 31500, 0, 0, 0, 0, 0, 0);

-- Alliance Infra-green Bomber (31406), short
-- Alliance Infra-green Bomber (32512), long
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=273, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=31406;
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=273, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=32512;
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31406, 32512);
INSERT INTO npc_spellclick_spells VALUES (31406, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32512, 46598, 1, 0);
DELETE FROM vehicle_template_accessory WHERE entry IN(31406, 32512);
INSERT INTO vehicle_template_accessory VALUES (31406, 31408, 0, 1, 'Alliance Bomber Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 31407, 1, 1, 'Alliance Turret Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 31409, 2, 1, 'Alliance Engineering Seat on rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32217, 3, 1, 'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32221, 4, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32221, 5, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32256, 6, 1, 'Shield Visual Loc Bunny on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32274, 7, 1, 'Alliance Bomber Pilot rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31408, 0, 1, 'Alliance Bomber Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31407, 1, 1, 'Alliance Turret Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31409, 2, 1, 'Alliance Engineering Seat on rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32217, 3, 1, 'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32221, 4, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32221, 5, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32256, 6, 1, 'Shield Visual Loc Bunny on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32274, 7, 1, 'Alliance Bomber Pilot rides Alliance Infra-green Bomber', 8, 0);
DELETE FROM waypoints WHERE entry=31406;
INSERT INTO waypoints VALUES (31406, 1, 7753.45, 2044.47, 592.04, 'Alliance Infra-green Bomber - Short'),(31406, 2, 7766.17, 2004.16, 575.364, 'Alliance Infra-green Bomber - Short'),(31406, 3, 7804.4, 1951.74, 549.136, 'Alliance Infra-green Bomber - Short'),(31406, 4, 7825.09, 1928.68, 532.879, 'Alliance Infra-green Bomber - Short'),(31406, 5, 7866.31, 1885.58, 496.232, 'Alliance Infra-green Bomber - Short'),(31406, 6, 7895.59, 1845.43, 466.525, 'Alliance Infra-green Bomber - Short'),(31406, 7, 7883.56, 1804.89, 449.938, 'Alliance Infra-green Bomber - Short'),(31406, 8, 7837, 1801.84, 435.217, 'Alliance Infra-green Bomber - Short'),(31406, 9, 7815.85, 1813.61, 431.672, 'Alliance Infra-green Bomber - Short'),(31406, 10, 7772.53, 1841.07, 431.172, 'Alliance Infra-green Bomber - Short'),(31406, 11, 7739.59, 1852.73, 430.873, 'Alliance Infra-green Bomber - Short'),(31406, 12, 7701.6, 1856.26, 428.418, 'Alliance Infra-green Bomber - Short'),
(31406, 13, 7658.51, 1855.49, 430.772, 'Alliance Infra-green Bomber - Short'),(31406, 14, 7634.45, 1847.34, 432.35, 'Alliance Infra-green Bomber - Short'),(31406, 15, 7587.81, 1815.65, 431.884, 'Alliance Infra-green Bomber - Short'),(31406, 16, 7577.23, 1780.84, 425.398, 'Alliance Infra-green Bomber - Short'),(31406, 17, 7588.97, 1748.31, 416.64, 'Alliance Infra-green Bomber - Short'),(31406, 18, 7606.15, 1728.53, 411.093, 'Alliance Infra-green Bomber - Short'),(31406, 19, 7635.87, 1700.63, 410.406, 'Alliance Infra-green Bomber - Short'),(31406, 20, 7661.84, 1677.63, 415.037, 'Alliance Infra-green Bomber - Short'),(31406, 21, 7683.93, 1657.1, 418.071, 'Alliance Infra-green Bomber - Short'),(31406, 22, 7730.4, 1647.6, 420.767, 'Alliance Infra-green Bomber - Short'),(31406, 23, 7760.93, 1663.64, 426.739, 'Alliance Infra-green Bomber - Short'),(31406, 24, 7817.86, 1688.59, 436.1, 'Alliance Infra-green Bomber - Short'),(31406, 25, 7857.05, 1734.45, 413.059, 'Alliance Infra-green Bomber - Short'),
(31406, 26, 7865.85, 1752.09, 411.13, 'Alliance Infra-green Bomber - Short'),(31406, 27, 7873.44, 1803.01, 416.629, 'Alliance Infra-green Bomber - Short'),(31406, 28, 7853.76, 1838.35, 425.217, 'Alliance Infra-green Bomber - Short'),(31406, 29, 7816.59, 1856.3, 430.695, 'Alliance Infra-green Bomber - Short'),(31406, 30, 7778.95, 1853.29, 432.243, 'Alliance Infra-green Bomber - Short'),(31406, 31, 7750.59, 1828.18, 431.892, 'Alliance Infra-green Bomber - Short'),(31406, 32, 7735.12, 1799.6, 429.134, 'Alliance Infra-green Bomber - Short'),(31406, 33, 7720.96, 1767.72, 426.263, 'Alliance Infra-green Bomber - Short'),(31406, 34, 7709.29, 1745.03, 423.882, 'Alliance Infra-green Bomber - Short'),(31406, 35, 7687.72, 1717.87, 419.22, 'Alliance Infra-green Bomber - Short'),(31406, 36, 7663.97, 1692.6, 414.53, 'Alliance Infra-green Bomber - Short'),(31406, 37, 7639.08, 1668.44, 409.85, 'Alliance Infra-green Bomber - Short'),(31406, 38, 7606.57, 1637.13, 404.108, 'Alliance Infra-green Bomber - Short'),(31406, 39, 7614.29, 1603.57, 397.91, 'Alliance Infra-green Bomber - Short'),
(31406, 40, 7624.51, 1570.93, 390.542, 'Alliance Infra-green Bomber - Short'),(31406, 41, 7634.43, 1530.19, 382.105, 'Alliance Infra-green Bomber - Short'),(31406, 42, 7613.33, 1494.48, 381.294, 'Alliance Infra-green Bomber - Short'),(31406, 43, 7584.1, 1491.31, 387.931, 'Alliance Infra-green Bomber - Short'),(31406, 44, 7555.27, 1497.66, 401.862, 'Alliance Infra-green Bomber - Short'),(31406, 45, 7523.53, 1511.46, 421.102, 'Alliance Infra-green Bomber - Short'),(31406, 46, 7489.08, 1510.24, 431.514, 'Alliance Infra-green Bomber - Short'),(31406, 47, 7477.76, 1486.37, 435.962, 'Alliance Infra-green Bomber - Short'),(31406, 48, 7498.74, 1445.82, 440.44, 'Alliance Infra-green Bomber - Short'),(31406, 49, 7532.11, 1412.9, 448.849, 'Alliance Infra-green Bomber - Short'),(31406, 50, 7563.08, 1404.79, 453.795, 'Alliance Infra-green Bomber - Short'),(31406, 51, 7601.4, 1415.79, 458.653, 'Alliance Infra-green Bomber - Short'),(31406, 52, 7626.93, 1435.78, 461.89, 'Alliance Infra-green Bomber - Short'),(31406, 53, 7641.68, 1453.63, 464.418, 'Alliance Infra-green Bomber - Short'),(31406, 54, 7660.38, 1501.85, 472.969, 'Alliance Infra-green Bomber - Short'),
(31406, 55, 7668.88, 1535.63, 476.438, 'Alliance Infra-green Bomber - Short'),(31406, 56, 7676.59, 1569.65, 479.256, 'Alliance Infra-green Bomber - Short'),(31406, 57, 7685.44, 1599.73, 482.085, 'Alliance Infra-green Bomber - Short'),(31406, 58, 7698.4, 1631.93, 486.528, 'Alliance Infra-green Bomber - Short'),(31406, 59, 7713.19, 1663.23, 491.681, 'Alliance Infra-green Bomber - Short'),(31406, 60, 7743.51, 1725.39, 502.409, 'Alliance Infra-green Bomber - Short'),(31406, 61, 7760.73, 1755.16, 508.887, 'Alliance Infra-green Bomber - Short'),(31406, 62, 7777.56, 1785.01, 515.946, 'Alliance Infra-green Bomber - Short'),(31406, 63, 7787.84, 1815.11, 522.388, 'Alliance Infra-green Bomber - Short'),(31406, 64, 7788.78, 1851.14, 531.797, 'Alliance Infra-green Bomber - Short'),(31406, 65, 7785.71, 1884.7, 541.23, 'Alliance Infra-green Bomber - Short'),(31406, 66, 7783.92, 1918.17, 551.305, 'Alliance Infra-green Bomber - Short'),(31406, 67, 7782.55, 1974.89, 569.197, 'Alliance Infra-green Bomber - Short'),
(31406, 68, 7779.93, 2000.37, 585.416, 'Alliance Infra-green Bomber - Short'),(31406, 69, 7633.95, 2061.49, 618.75, 'Alliance Infra-green Bomber - Short');
DELETE FROM waypoints WHERE entry=32512;
INSERT INTO waypoints VALUES (32512, 1, 7740.12, 2037.47, 594.088, 'Alliance Infra-green Bomber - Long'),(32512, 2, 7742.67, 2023.95, 583.412, 'Alliance Infra-green Bomber - Long'),(32512, 3, 7740.06, 1991.28, 559.206, 'Alliance Infra-green Bomber - Long'),(32512, 4, 7728.47, 1976.46, 540.522, 'Alliance Infra-green Bomber - Long'),(32512, 5, 7710.74, 1968.24, 523.864, 'Alliance Infra-green Bomber - Long'),(32512, 6, 7684.83, 1956.37, 503.568, 'Alliance Infra-green Bomber - Long'),(32512, 7, 7633.76, 1925.8, 466.762, 'Alliance Infra-green Bomber - Long'),(32512, 8, 7608.49, 1909.46, 448.915, 'Alliance Infra-green Bomber - Long'),(32512, 9, 7583.64, 1878.65, 428.868, 'Alliance Infra-green Bomber - Long'),(32512, 10, 7594.58, 1848.98, 417.143, 'Alliance Infra-green Bomber - Long'),(32512, 11, 7623.07, 1838.43, 407.831, 'Alliance Infra-green Bomber - Long'),(32512, 12, 7660.62, 1844.98, 397.19, 'Alliance Infra-green Bomber - Long'),(32512, 13, 7678.44, 1849.78, 394.788, 'Alliance Infra-green Bomber - Long'),(32512, 14, 7709.07, 1857.01, 393.746, 'Alliance Infra-green Bomber - Long'),(32512, 15, 7736.76, 1861.04, 395.752, 'Alliance Infra-green Bomber - Long'),(32512, 16, 7787.22, 1866.39, 403.213, 'Alliance Infra-green Bomber - Long'),(32512, 17, 7837.2, 1851.71, 409.706, 'Alliance Infra-green Bomber - Long'),(32512, 18, 7852.85, 1828.93, 411.219, 'Alliance Infra-green Bomber - Long'),(32512, 19, 7853.23, 1800.17, 412.38, 'Alliance Infra-green Bomber - Long'),
(32512, 20, 7829.07, 1770.52, 406.956, 'Alliance Infra-green Bomber - Long'),(32512, 21, 7811.85, 1768.51, 404.165, 'Alliance Infra-green Bomber - Long'),(32512, 22, 7799.06, 1768.1, 403.979, 'Alliance Infra-green Bomber - Long'),(32512, 23, 7766.45, 1769.32, 405.503, 'Alliance Infra-green Bomber - Long'),(32512, 24, 7731.83, 1774.18, 407.213, 'Alliance Infra-green Bomber - Long'),(32512, 25, 7672.1, 1781.93, 409.652, 'Alliance Infra-green Bomber - Long'),(32512, 26, 7636.9, 1764.66, 408.927, 'Alliance Infra-green Bomber - Long'),(32512, 27, 7622.94, 1733.91, 407.852, 'Alliance Infra-green Bomber - Long'),(32512, 28, 7637.13, 1701.48, 401.798, 'Alliance Infra-green Bomber - Long'),(32512, 29, 7656.35, 1687.47, 392.133, 'Alliance Infra-green Bomber - Long'),(32512, 30, 7683.72, 1664.33, 389.155, 'Alliance Infra-green Bomber - Long'),(32512, 31, 7704.89, 1644.36, 391.315, 'Alliance Infra-green Bomber - Long'),(32512, 32, 7723.43, 1616.93, 396.226, 'Alliance Infra-green Bomber - Long'),(32512, 33, 7725.81, 1591.86, 400.687, 'Alliance Infra-green Bomber - Long'),(32512, 34, 7715.29, 1556.66, 405.374, 'Alliance Infra-green Bomber - Long'),(32512, 35, 7700.13, 1537.58, 406.834, 'Alliance Infra-green Bomber - Long'),(32512, 36, 7669.18, 1514.83, 407.87, 'Alliance Infra-green Bomber - Long'),(32512, 37, 7645.32, 1502.62, 408.244, 'Alliance Infra-green Bomber - Long'),(32512, 38, 7597.58, 1487.31, 407.425, 'Alliance Infra-green Bomber - Long'),
(32512, 39, 7563.26, 1480.56, 406.112, 'Alliance Infra-green Bomber - Long'),(32512, 40, 7530.64, 1468.65, 404.426, 'Alliance Infra-green Bomber - Long'),(32512, 41, 7509.13, 1449.03, 402.95, 'Alliance Infra-green Bomber - Long'),(32512, 42, 7486.21, 1414.11, 401.32, 'Alliance Infra-green Bomber - Long'),(32512, 43, 7477.96, 1391.06, 401.176, 'Alliance Infra-green Bomber - Long'),(32512, 44, 7468.21, 1357.44, 401.054, 'Alliance Infra-green Bomber - Long'),(32512, 45, 7454.79, 1315.26, 400.386, 'Alliance Infra-green Bomber - Long'),(32512, 46, 7441.42, 1292.08, 399.426, 'Alliance Infra-green Bomber - Long'),(32512, 47, 7413.4, 1266.08, 397.33, 'Alliance Infra-green Bomber - Long'),(32512, 48, 7384.47, 1254.93, 393.811, 'Alliance Infra-green Bomber - Long'),(32512, 49, 7352.79, 1259.18, 387.868, 'Alliance Infra-green Bomber - Long'),(32512, 50, 7330.17, 1269.94, 382.371, 'Alliance Infra-green Bomber - Long'),(32512, 51, 7313.91, 1280.48, 377.967, 'Alliance Infra-green Bomber - Long'),(32512, 52, 7287.94, 1302.62, 370.212, 'Alliance Infra-green Bomber - Long'),(32512, 53, 7247.12, 1334.65, 357.074, 'Alliance Infra-green Bomber - Long'),(32512, 54, 7222.75, 1346.71, 350.44, 'Alliance Infra-green Bomber - Long'),(32512, 55, 7191.05, 1359.21, 342.487, 'Alliance Infra-green Bomber - Long'),(32512, 56, 7146.12, 1365.7, 334.615, 'Alliance Infra-green Bomber - Long'),(32512, 57, 7118.05, 1354.57, 333.155, 'Alliance Infra-green Bomber - Long'),
(32512, 58, 7095.1, 1336.85, 333.92, 'Alliance Infra-green Bomber - Long'),(32512, 59, 7082.05, 1313.63, 335.456, 'Alliance Infra-green Bomber - Long'),(32512, 60, 7081.52, 1280.37, 338.251, 'Alliance Infra-green Bomber - Long'),(32512, 61, 7098.09, 1251.42, 340.588, 'Alliance Infra-green Bomber - Long'),(32512, 62, 7115.06, 1235.56, 342.192, 'Alliance Infra-green Bomber - Long'),(32512, 63, 7140.75, 1236.72, 344.987, 'Alliance Infra-green Bomber - Long'),(32512, 64, 7147.52, 1246.17, 345.62, 'Alliance Infra-green Bomber - Long'),(32512, 65, 7161.72, 1280.15, 359.42, 'Alliance Infra-green Bomber - Long'),(32512, 66, 7182.57, 1286.26, 358.761, 'Alliance Infra-green Bomber - Long'),(32512, 67, 7190.92, 1275.2, 359.311, 'Alliance Infra-green Bomber - Long'),(32512, 68, 7202, 1246.16, 364.335, 'Alliance Infra-green Bomber - Long'),(32512, 69, 7228.05, 1205.15, 374.81, 'Alliance Infra-green Bomber - Long'),(32512, 70, 7257.44, 1201, 379.775, 'Alliance Infra-green Bomber - Long'),(32512, 71, 7283.25, 1207.12, 383.432, 'Alliance Infra-green Bomber - Long'),(32512, 72, 7313.53, 1231.6, 386.708, 'Alliance Infra-green Bomber - Long'),(32512, 73, 7320.05, 1252.78, 386.454, 'Alliance Infra-green Bomber - Long'),(32512, 74, 7325.5, 1287.34, 385.663, 'Alliance Infra-green Bomber - Long'),(32512, 75, 7336.36, 1325.32, 386.77, 'Alliance Infra-green Bomber - Long'),
(32512, 76, 7358.37, 1348.92, 389.222, 'Alliance Infra-green Bomber - Long'),(32512, 77, 7377.21, 1357.82, 390.506, 'Alliance Infra-green Bomber - Long'),(32512, 78, 7411, 1366.82, 391.944, 'Alliance Infra-green Bomber - Long'),(32512, 79, 7478.71, 1383.7, 396.844, 'Alliance Infra-green Bomber - Long'),(32512, 80, 7508.38, 1396.75, 399.75, 'Alliance Infra-green Bomber - Long'),(32512, 81, 7549.64, 1435.9, 402.703, 'Alliance Infra-green Bomber - Long'),(32512, 82, 7579.53, 1488.62, 405.454, 'Alliance Infra-green Bomber - Long'),(32512, 83, 7594.04, 1530.21, 405.995, 'Alliance Infra-green Bomber - Long'),(32512, 84, 7597.78, 1580.15, 406.863, 'Alliance Infra-green Bomber - Long'),(32512, 85, 7599.84, 1629.51, 398.177, 'Alliance Infra-green Bomber - Long'),(32512, 86, 7600.09, 1641.16, 397.327, 'Alliance Infra-green Bomber - Long'),(32512, 87, 7601.76, 1706.16, 392.187, 'Alliance Infra-green Bomber - Long'),(32512, 88, 7609.87, 1734.02, 391.214, 'Alliance Infra-green Bomber - Long'),(32512, 89, 7629.48, 1766.95, 392.821, 'Alliance Infra-green Bomber - Long'),(32512, 90, 7654.89, 1787.01, 394.78, 'Alliance Infra-green Bomber - Long'),(32512, 91, 7687.36, 1798.35, 400.772, 'Alliance Infra-green Bomber - Long'),(32512, 92, 7723.2, 1803.61, 409.558, 'Alliance Infra-green Bomber - Long'),(32512, 93, 7739.02, 1803.96, 413.524, 'Alliance Infra-green Bomber - Long'),(32512, 94, 7772.81, 1801.73, 422.254, 'Alliance Infra-green Bomber - Long'),
(32512, 95, 7806.51, 1798.3, 431.083, 'Alliance Infra-green Bomber - Long'),(32512, 96, 7839.75, 1795.2, 441.564, 'Alliance Infra-green Bomber - Long'),(32512, 97, 7880.53, 1792.37, 458.585, 'Alliance Infra-green Bomber - Long'),(32512, 98, 7915.31, 1795.76, 477.234, 'Alliance Infra-green Bomber - Long'),(32512, 99, 7948.23, 1808.57, 499.45, 'Alliance Infra-green Bomber - Long'),(32512, 100, 7966.47, 1831.04, 518.671, 'Alliance Infra-green Bomber - Long'),(32512, 101, 7971.64, 1849.81, 531.481, 'Alliance Infra-green Bomber - Long'),(32512, 102, 7972.72, 1865.6, 541.284, 'Alliance Infra-green Bomber - Long'),(32512, 103, 7960.29, 1916.23, 549.119, 'Alliance Infra-green Bomber - Long'),(32512, 104, 7938.55, 1934.97, 553.812, 'Alliance Infra-green Bomber - Long'),(32512, 105, 7889.36, 1953.47, 563.336, 'Alliance Infra-green Bomber - Long'),(32512, 106, 7855.36, 1959.24, 569.281, 'Alliance Infra-green Bomber - Long'),(32512, 107, 7821.29, 1965.55, 574.228, 'Alliance Infra-green Bomber - Long'),(32512, 108, 7812.15, 1967.28, 575.42, 'Alliance Infra-green Bomber - Long'),
(32512, 109, 7774.67, 1986.76, 580.059, 'Alliance Infra-green Bomber - Long'),(32512, 110, 7633.95, 2061.49, 618.75, 'Alliance Infra-green Bomber - Long');
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31407, 31408, 31409);
INSERT INTO npc_spellclick_spells VALUES (31407, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31408, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31409, 59060, 1, 0);
-- Alliance Turret Seat (31407)
REPLACE INTO creature_template_addon VALUES (31407, 0, 0, 0, 0, 0, '59458');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=60287,spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31407;
-- Alliance Bomber Seat (31408)
REPLACE INTO creature_template_addon VALUES (31408, 0, 0, 0, 0, 0, '59443');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=60523, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=274, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31408;
-- Alliance Engineering Seat (31409)
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=61093, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31409;
-- Banner Bunny, Hanging, Alliance (32217)
REPLACE INTO creature_template_addon VALUES (32217, 0, 0, 0, 0, 0, '60161');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32217;
-- Banner Bunny, Side, Alliance (32221)
REPLACE INTO creature_template_addon VALUES (32221, 0, 0, 0, 0, 0, '60189');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32221;
-- Alliance Bomber Pilot (32274)
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, AIName='NullCreatureAI' WHERE entry=32274;

-- Horde Infra-green Bomber (31838), short
-- Horde Infra-green Bomber (32513), long
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=287, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=31838;
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=287, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=32513;
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31838, 32513);
INSERT INTO npc_spellclick_spells VALUES (31838, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32513, 46598, 1, 0);
DELETE FROM vehicle_template_accessory WHERE entry IN(31838, 32513);
INSERT INTO vehicle_template_accessory VALUES (31838, 31856, 0, 1, 'Horde Bomber Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 31840, 1, 1, 'Horde Turret Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32152, 2, 1, 'Horde Engineering Seat on rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32214, 3, 1, 'Banner Bunny, Hanging, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32215, 4, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32215, 5, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32256, 6, 1, 'Shield Visual Loc Bunny on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32317, 7, 1, 'Horde Bomber Pilot rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 31856, 0, 1, 'Horde Bomber Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 31840, 1, 1, 'Horde Turret Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32152, 2, 1, 'Horde Engineering Seat on rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32214, 3, 1, 'Banner Bunny, Hanging, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32215, 4, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32215, 5, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32256, 6, 1, 'Shield Visual Loc Bunny on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32317, 7, 1, 'Horde Bomber Pilot rides Horde Infra-green Bomber', 8, 0);
DELETE FROM waypoints WHERE entry=31838;
INSERT INTO waypoints VALUES (31838, 1, 7753.45, 2044.47, 592.04, 'Horde Infra-green Bomber - Short'),(31838, 2, 7766.17, 2004.16, 575.364, 'Horde Infra-green Bomber - Short'),(31838, 3, 7804.4, 1951.74, 549.136, 'Horde Infra-green Bomber - Short'),(31838, 4, 7825.09, 1928.68, 532.879, 'Horde Infra-green Bomber - Short'),(31838, 5, 7866.31, 1885.58, 496.232, 'Horde Infra-green Bomber - Short'),(31838, 6, 7895.59, 1845.43, 466.525, 'Horde Infra-green Bomber - Short'),(31838, 7, 7883.56, 1804.89, 449.938, 'Horde Infra-green Bomber - Short'),(31838, 8, 7837, 1801.84, 435.217, 'Horde Infra-green Bomber - Short'),(31838, 9, 7815.85, 1813.61, 431.672, 'Horde Infra-green Bomber - Short'),(31838, 10, 7772.53, 1841.07, 431.172, 'Horde Infra-green Bomber - Short'),(31838, 11, 7739.59, 1852.73, 430.873, 'Horde Infra-green Bomber - Short'),(31838, 12, 7701.6, 1856.26, 428.418, 'Horde Infra-green Bomber - Short'),(31838, 13, 7658.51, 1855.49, 430.772, 'Horde Infra-green Bomber - Short'),(31838, 14, 7634.45, 1847.34, 432.35, 'Horde Infra-green Bomber - Short'),
(31838, 15, 7587.81, 1815.65, 431.884, 'Horde Infra-green Bomber - Short'),(31838, 16, 7577.23, 1780.84, 425.398, 'Horde Infra-green Bomber - Short'),(31838, 17, 7588.97, 1748.31, 416.64, 'Horde Infra-green Bomber - Short'),(31838, 18, 7606.15, 1728.53, 411.093, 'Horde Infra-green Bomber - Short'),(31838, 19, 7635.87, 1700.63, 410.406, 'Horde Infra-green Bomber - Short'),(31838, 20, 7661.84, 1677.63, 415.037, 'Horde Infra-green Bomber - Short'),(31838, 21, 7683.93, 1657.1, 418.071, 'Horde Infra-green Bomber - Short'),(31838, 22, 7730.4, 1647.6, 420.767, 'Horde Infra-green Bomber - Short'),(31838, 23, 7760.93, 1663.64, 426.739, 'Horde Infra-green Bomber - Short'),(31838, 24, 7817.86, 1688.59, 436.1, 'Horde Infra-green Bomber - Short'),(31838, 25, 7857.05, 1734.45, 413.059, 'Horde Infra-green Bomber - Short'),(31838, 26, 7865.85, 1752.09, 411.13, 'Horde Infra-green Bomber - Short'),(31838, 27, 7873.44, 1803.01, 416.629, 'Horde Infra-green Bomber - Short'),(31838, 28, 7853.76, 1838.35, 425.217, 'Horde Infra-green Bomber - Short'),
(31838, 29, 7816.59, 1856.3, 430.695, 'Horde Infra-green Bomber - Short'),(31838, 30, 7778.95, 1853.29, 432.243, 'Horde Infra-green Bomber - Short'),(31838, 31, 7750.59, 1828.18, 431.892, 'Horde Infra-green Bomber - Short'),(31838, 32, 7735.12, 1799.6, 429.134, 'Horde Infra-green Bomber - Short'),(31838, 33, 7720.96, 1767.72, 426.263, 'Horde Infra-green Bomber - Short'),(31838, 34, 7709.29, 1745.03, 423.882, 'Horde Infra-green Bomber - Short'),(31838, 35, 7687.72, 1717.87, 419.22, 'Horde Infra-green Bomber - Short'),(31838, 36, 7663.97, 1692.6, 414.53, 'Horde Infra-green Bomber - Short'),(31838, 37, 7639.08, 1668.44, 409.85, 'Horde Infra-green Bomber - Short'),(31838, 38, 7606.57, 1637.13, 404.108, 'Horde Infra-green Bomber - Short'),(31838, 39, 7614.29, 1603.57, 397.91, 'Horde Infra-green Bomber - Short'),(31838, 40, 7624.51, 1570.93, 390.542, 'Horde Infra-green Bomber - Short'),(31838, 41, 7634.43, 1530.19, 382.105, 'Horde Infra-green Bomber - Short'),
(31838, 42, 7613.33, 1494.48, 381.294, 'Horde Infra-green Bomber - Short'),(31838, 43, 7584.1, 1491.31, 387.931, 'Horde Infra-green Bomber - Short'),(31838, 44, 7555.27, 1497.66, 401.862, 'Horde Infra-green Bomber - Short'),(31838, 45, 7523.53, 1511.46, 421.102, 'Horde Infra-green Bomber - Short'),(31838, 46, 7489.08, 1510.24, 431.514, 'Horde Infra-green Bomber - Short'),(31838, 47, 7477.76, 1486.37, 435.962, 'Horde Infra-green Bomber - Short'),(31838, 48, 7498.74, 1445.82, 440.44, 'Horde Infra-green Bomber - Short'),(31838, 49, 7532.11, 1412.9, 448.849, 'Horde Infra-green Bomber - Short'),(31838, 50, 7563.08, 1404.79, 453.795, 'Horde Infra-green Bomber - Short'),(31838, 51, 7601.4, 1415.79, 458.653, 'Horde Infra-green Bomber - Short'),(31838, 52, 7626.93, 1435.78, 461.89, 'Horde Infra-green Bomber - Short'),(31838, 53, 7641.68, 1453.63, 464.418, 'Horde Infra-green Bomber - Short'),(31838, 54, 7660.38, 1501.85, 472.969, 'Horde Infra-green Bomber - Short'),(31838, 55, 7668.88, 1535.63, 476.438, 'Horde Infra-green Bomber - Short'),(31838, 56, 7676.59, 1569.65, 479.256, 'Horde Infra-green Bomber - Short'),(31838, 57, 7685.44, 1599.73, 482.085, 'Horde Infra-green Bomber - Short'),
(31838, 58, 7698.4, 1631.93, 486.528, 'Horde Infra-green Bomber - Short'),(31838, 59, 7713.19, 1663.23, 491.681, 'Horde Infra-green Bomber - Short'),(31838, 60, 7743.51, 1725.39, 502.409, 'Horde Infra-green Bomber - Short'),(31838, 61, 7760.73, 1755.16, 508.887, 'Horde Infra-green Bomber - Short'),(31838, 62, 7777.56, 1785.01, 515.946, 'Horde Infra-green Bomber - Short'),(31838, 63, 7787.84, 1815.11, 522.388, 'Horde Infra-green Bomber - Short'),(31838, 64, 7788.78, 1851.14, 531.797, 'Horde Infra-green Bomber - Short'),(31838, 65, 7785.71, 1884.7, 541.23, 'Horde Infra-green Bomber - Short'),(31838, 66, 7783.92, 1918.17, 551.305, 'Horde Infra-green Bomber - Short'),(31838, 67, 7782.55, 1974.89, 569.197, 'Horde Infra-green Bomber - Short'),
(31838, 68, 7779.93, 2000.37, 585.416, 'Horde Infra-green Bomber - Short'),(31838, 69, 7887.33, 2057.64, 618.75, 'Horde Infra-green Bomber - Short');
DELETE FROM waypoints WHERE entry=32513;
INSERT INTO waypoints VALUES (32513, 1, 7740.12, 2037.47, 594.088, 'Horde Infra-green Bomber - Long'),(32513, 2, 7742.67, 2023.95, 583.412, 'Horde Infra-green Bomber - Long'),(32513, 3, 7740.06, 1991.28, 559.206, 'Horde Infra-green Bomber - Long'),(32513, 4, 7728.47, 1976.46, 540.522, 'Horde Infra-green Bomber - Long'),(32513, 5, 7710.74, 1968.24, 523.864, 'Horde Infra-green Bomber - Long'),(32513, 6, 7684.83, 1956.37, 503.568, 'Horde Infra-green Bomber - Long'),(32513, 7, 7633.76, 1925.8, 466.762, 'Horde Infra-green Bomber - Long'),(32513, 8, 7608.49, 1909.46, 448.915, 'Horde Infra-green Bomber - Long'),(32513, 9, 7583.64, 1878.65, 428.868, 'Horde Infra-green Bomber - Long'),(32513, 10, 7594.58, 1848.98, 417.143, 'Horde Infra-green Bomber - Long'),(32513, 11, 7623.07, 1838.43, 407.831, 'Horde Infra-green Bomber - Long'),(32513, 12, 7660.62, 1844.98, 397.19, 'Horde Infra-green Bomber - Long'),(32513, 13, 7678.44, 1849.78, 394.788, 'Horde Infra-green Bomber - Long'),(32513, 14, 7709.07, 1857.01, 393.746, 'Horde Infra-green Bomber - Long'),(32513, 15, 7736.76, 1861.04, 395.752, 'Horde Infra-green Bomber - Long'),(32513, 16, 7787.22, 1866.39, 403.213, 'Horde Infra-green Bomber - Long'),(32513, 17, 7837.2, 1851.71, 409.706, 'Horde Infra-green Bomber - Long'),(32513, 18, 7852.85, 1828.93, 411.219, 'Horde Infra-green Bomber - Long'),(32513, 19, 7853.23, 1800.17, 412.38, 'Horde Infra-green Bomber - Long'),
(32513, 20, 7829.07, 1770.52, 406.956, 'Horde Infra-green Bomber - Long'),(32513, 21, 7811.85, 1768.51, 404.165, 'Horde Infra-green Bomber - Long'),(32513, 22, 7799.06, 1768.1, 403.979, 'Horde Infra-green Bomber - Long'),(32513, 23, 7766.45, 1769.32, 405.503, 'Horde Infra-green Bomber - Long'),(32513, 24, 7731.83, 1774.18, 407.213, 'Horde Infra-green Bomber - Long'),(32513, 25, 7672.1, 1781.93, 409.652, 'Horde Infra-green Bomber - Long'),(32513, 26, 7636.9, 1764.66, 408.927, 'Horde Infra-green Bomber - Long'),(32513, 27, 7622.94, 1733.91, 407.852, 'Horde Infra-green Bomber - Long'),(32513, 28, 7637.13, 1701.48, 401.798, 'Horde Infra-green Bomber - Long'),(32513, 29, 7656.35, 1687.47, 392.133, 'Horde Infra-green Bomber - Long'),(32513, 30, 7683.72, 1664.33, 389.155, 'Horde Infra-green Bomber - Long'),(32513, 31, 7704.89, 1644.36, 391.315, 'Horde Infra-green Bomber - Long'),(32513, 32, 7723.43, 1616.93, 396.226, 'Horde Infra-green Bomber - Long'),(32513, 33, 7725.81, 1591.86, 400.687, 'Horde Infra-green Bomber - Long'),(32513, 34, 7715.29, 1556.66, 405.374, 'Horde Infra-green Bomber - Long'),(32513, 35, 7700.13, 1537.58, 406.834, 'Horde Infra-green Bomber - Long'),(32513, 36, 7669.18, 1514.83, 407.87, 'Horde Infra-green Bomber - Long'),(32513, 37, 7645.32, 1502.62, 408.244, 'Horde Infra-green Bomber - Long'),(32513, 38, 7597.58, 1487.31, 407.425, 'Horde Infra-green Bomber - Long'),
(32513, 39, 7563.26, 1480.56, 406.112, 'Horde Infra-green Bomber - Long'),(32513, 40, 7530.64, 1468.65, 404.426, 'Horde Infra-green Bomber - Long'),(32513, 41, 7509.13, 1449.03, 402.95, 'Horde Infra-green Bomber - Long'),(32513, 42, 7486.21, 1414.11, 401.32, 'Horde Infra-green Bomber - Long'),(32513, 43, 7477.96, 1391.06, 401.176, 'Horde Infra-green Bomber - Long'),(32513, 44, 7468.21, 1357.44, 401.054, 'Horde Infra-green Bomber - Long'),(32513, 45, 7454.79, 1315.26, 400.386, 'Horde Infra-green Bomber - Long'),(32513, 46, 7441.42, 1292.08, 399.426, 'Horde Infra-green Bomber - Long'),(32513, 47, 7413.4, 1266.08, 397.33, 'Horde Infra-green Bomber - Long'),(32513, 48, 7384.47, 1254.93, 393.811, 'Horde Infra-green Bomber - Long'),(32513, 49, 7352.79, 1259.18, 387.868, 'Horde Infra-green Bomber - Long'),(32513, 50, 7330.17, 1269.94, 382.371, 'Horde Infra-green Bomber - Long'),(32513, 51, 7313.91, 1280.48, 377.967, 'Horde Infra-green Bomber - Long'),(32513, 52, 7287.94, 1302.62, 370.212, 'Horde Infra-green Bomber - Long'),(32513, 53, 7247.12, 1334.65, 357.074, 'Horde Infra-green Bomber - Long'),(32513, 54, 7222.75, 1346.71, 350.44, 'Horde Infra-green Bomber - Long'),(32513, 55, 7191.05, 1359.21, 342.487, 'Horde Infra-green Bomber - Long'),(32513, 56, 7146.12, 1365.7, 334.615, 'Horde Infra-green Bomber - Long'),(32513, 57, 7118.05, 1354.57, 333.155, 'Horde Infra-green Bomber - Long'),
(32513, 58, 7095.1, 1336.85, 333.92, 'Horde Infra-green Bomber - Long'),(32513, 59, 7082.05, 1313.63, 335.456, 'Horde Infra-green Bomber - Long'),(32513, 60, 7081.52, 1280.37, 338.251, 'Horde Infra-green Bomber - Long'),(32513, 61, 7098.09, 1251.42, 340.588, 'Horde Infra-green Bomber - Long'),(32513, 62, 7115.06, 1235.56, 342.192, 'Horde Infra-green Bomber - Long'),(32513, 63, 7140.75, 1236.72, 344.987, 'Horde Infra-green Bomber - Long'),(32513, 64, 7147.52, 1246.17, 345.62, 'Horde Infra-green Bomber - Long'),(32513, 65, 7161.72, 1280.15, 359.42, 'Horde Infra-green Bomber - Long'),(32513, 66, 7182.57, 1286.26, 358.761, 'Horde Infra-green Bomber - Long'),(32513, 67, 7190.92, 1275.2, 359.311, 'Horde Infra-green Bomber - Long'),(32513, 68, 7202, 1246.16, 364.335, 'Horde Infra-green Bomber - Long'),(32513, 69, 7228.05, 1205.15, 374.81, 'Horde Infra-green Bomber - Long'),(32513, 70, 7257.44, 1201, 379.775, 'Horde Infra-green Bomber - Long'),(32513, 71, 7283.25, 1207.12, 383.432, 'Horde Infra-green Bomber - Long'),(32513, 72, 7313.53, 1231.6, 386.708, 'Horde Infra-green Bomber - Long'),(32513, 73, 7320.05, 1252.78, 386.454, 'Horde Infra-green Bomber - Long'),(32513, 74, 7325.5, 1287.34, 385.663, 'Horde Infra-green Bomber - Long'),(32513, 75, 7336.36, 1325.32, 386.77, 'Horde Infra-green Bomber - Long'),(32513, 76, 7358.37, 1348.92, 389.222, 'Horde Infra-green Bomber - Long'),
(32513, 77, 7377.21, 1357.82, 390.506, 'Horde Infra-green Bomber - Long'),(32513, 78, 7411, 1366.82, 391.944, 'Horde Infra-green Bomber - Long'),(32513, 79, 7478.71, 1383.7, 396.844, 'Horde Infra-green Bomber - Long'),(32513, 80, 7508.38, 1396.75, 399.75, 'Horde Infra-green Bomber - Long'),(32513, 81, 7549.64, 1435.9, 402.703, 'Horde Infra-green Bomber - Long'),(32513, 82, 7579.53, 1488.62, 405.454, 'Horde Infra-green Bomber - Long'),(32513, 83, 7594.04, 1530.21, 405.995, 'Horde Infra-green Bomber - Long'),(32513, 84, 7597.78, 1580.15, 406.863, 'Horde Infra-green Bomber - Long'),(32513, 85, 7599.84, 1629.51, 398.177, 'Horde Infra-green Bomber - Long'),(32513, 86, 7600.09, 1641.16, 397.327, 'Horde Infra-green Bomber - Long'),(32513, 87, 7601.76, 1706.16, 392.187, 'Horde Infra-green Bomber - Long'),(32513, 88, 7609.87, 1734.02, 391.214, 'Horde Infra-green Bomber - Long'),(32513, 89, 7629.48, 1766.95, 392.821, 'Horde Infra-green Bomber - Long'),(32513, 90, 7654.89, 1787.01, 394.78, 'Horde Infra-green Bomber - Long'),(32513, 91, 7687.36, 1798.35, 400.772, 'Horde Infra-green Bomber - Long'),(32513, 92, 7723.2, 1803.61, 409.558, 'Horde Infra-green Bomber - Long'),(32513, 93, 7739.02, 1803.96, 413.524, 'Horde Infra-green Bomber - Long'),(32513, 94, 7772.81, 1801.73, 422.254, 'Horde Infra-green Bomber - Long'),(32513, 95, 7806.51, 1798.3, 431.083, 'Horde Infra-green Bomber - Long'),
(32513, 96, 7839.75, 1795.2, 441.564, 'Horde Infra-green Bomber - Long'),(32513, 97, 7880.53, 1792.37, 458.585, 'Horde Infra-green Bomber - Long'),(32513, 98, 7915.31, 1795.76, 477.234, 'Horde Infra-green Bomber - Long'),(32513, 99, 7948.23, 1808.57, 499.45, 'Horde Infra-green Bomber - Long'),(32513, 100, 7966.47, 1831.04, 518.671, 'Horde Infra-green Bomber - Long'),(32513, 101, 7971.64, 1849.81, 531.481, 'Horde Infra-green Bomber - Long'),(32513, 102, 7972.72, 1865.6, 541.284, 'Horde Infra-green Bomber - Long'),(32513, 103, 7960.29, 1916.23, 549.119, 'Horde Infra-green Bomber - Long'),(32513, 104, 7938.55, 1934.97, 553.812, 'Horde Infra-green Bomber - Long'),(32513, 105, 7889.36, 1953.47, 563.336, 'Horde Infra-green Bomber - Long'),(32513, 106, 7855.36, 1959.24, 569.281, 'Horde Infra-green Bomber - Long'),(32513, 107, 7821.29, 1965.55, 574.228, 'Horde Infra-green Bomber - Long'),(32513, 108, 7812.15, 1967.28, 575.42, 'Horde Infra-green Bomber - Long'),
(32513, 109, 7774.67, 1986.76, 580.059, 'Horde Infra-green Bomber - Long'),(32513, 110, 7887.33, 2057.64, 618.75, 'Horde Infra-green Bomber - Long');
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31840, 31856, 32152);
INSERT INTO npc_spellclick_spells VALUES (31840, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31856, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32152, 59060, 1, 0);
-- Horde Turret Seat (31840)
REPLACE INTO creature_template_addon VALUES (31840, 0, 0, 0, 0, 0, '59458');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=60287, spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31840;
-- Horde Bomber Seat (31856)
REPLACE INTO creature_template_addon VALUES (31856, 0, 0, 0, 0, 0, '59443');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=60523, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=274, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31856;
-- Horde Engineering Seat (32152)
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=61093, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=32152;
-- Banner Bunny, Hanging, Horde (32214)
REPLACE INTO creature_template_addon VALUES (32214, 0, 0, 0, 0, 0, '60070');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=0, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32214;
-- Banner Bunny, Side, Horde (32215)
REPLACE INTO creature_template_addon VALUES (32215, 0, 0, 0, 0, 0, '60151');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=0, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32215;
-- Horde Bomber Pilot (32317)
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, AIName='NullCreatureAI' WHERE entry=32317;

-- Fix plane abilities
DELETE from spell_scripts WHERE id IN(59622, 60287);
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
    (59622, 1, 0, 15, 59623, 4, 32769, 100, 0, 0, 0),
    (60287, 1, 0, 15, 62362, 4, 32767, 90, 0, 0, 0);


DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(60287, 59622);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 59622, 0, 0, 29, 0, 32769, 100, 0, 0, 0, 0, '', 'Spell 1 only usable near gargoyles'),
    (17, 0, 60287, 0, 0, 29, 0, 32767, 90, 0, 0, 0, 0, '', 'Spell 2 only usable near sentries');

-- END OF INFRA-GREEN QUESTS -----------------

-- The Battle For Crusaders' Pinnacle [A][H] http://www.wowhead.com/quest=13141/the-battle-for-crusaders-pinnacle

UPDATE creature_template SET flags_extra=64 WHERE entry IN(30984, 30986, 30987, 30989);
 
 
/* 
*/ 
-- -------------------------------------------
-- SHOLAZAR BASIN
-- -------------------------------------------
-- [Q] Flown the Coop! -- http://wotlk.openwow.com/quest=12532
-- Chicken Escapee SAI
SET @ENTRY := 28161;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,51959,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,1,0,61,0,100,0,51959,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Despawn In 4000 ms"),
(@ENTRY,0,2,3,64,0,100,0,0,0,0,0,85,51037,2,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Invoker Cast 'Capture Chicken Escapee'"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Close Gossip"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Set Npc Flag "),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Despawn In 500 ms"),
(@ENTRY,0,7,0,1,0,100,0,1000,1000,10000,10000,11,50734,1,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Cast 'Frenzyheart Chicken: Invisibility'"),
(@ENTRY,0,8,0,1,0,100,0,2500,2500,25000,25000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 2816100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,75,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Add Aura 'Scared Chicken'"),
(@ENTRY,9,1,0,0,0,100,0,25000,25000,0,0,24,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Evade");

DELETE FROM `spell_area` WHERE `spell`=50735;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(50735, 3711, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 3711, 12702, 12702, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12702, 12702, 0, 0, 2, 1, 74, 11);
 
 
/* 
*/ 
-- -------------------------------------------
-- STORM PEAKS
-- -------------------------------------------


-- Cave Medicine -- [A][H] http://www.wowhead.com/quest=13055/cave-medicine

UPDATE creature_loot_template SET Chance=35 WHERE Item=42927 AND entry IN(29390, 29605, 30148);

-- The Brothers Bronzebeard -- [A] http://wotlk.openwow.com/quest=12973
-- Brann Bronzebeard SAI
SET @ENTRY := 30382;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,12973,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Quest 'The Brothers Bronzebeard' Taken - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,12973,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Quest 'The Brothers Bronzebeard' Taken - Set Active On");

-- Actionlist SAI
SET @ENTRY := 3038200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,56558,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Script - Cast 'Summon Flying Machine'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,19,30383,20,0,0,0,0,0,"Brann Bronzebeard - On Script - Despawn Instant"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,44,2,0,0,0,0,0,7,0,0,0,0,0,0,0,"Brann Bronzebeard - On Script - Set Phase 2"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Script - Set Visibility Off"),
(@ENTRY,9,4,0,0,0,100,0,60000,60000,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Script - Set Visibility On"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brann Bronzebeard - On Script - Set Active Off");

-- Quest Fervor of the Frostborn [A] - http://www.wowhead.com/quest=12874
UPDATE `creature_template` SET `speed_walk`=4, `speed_run`=4 WHERE  `entry`=30108;

-- 
-- Achievement: Mine Sweeper -- http://wotlk.openwow.com/achievement=1428
-- Enable Landmine Knockback Achievement by removing it from disables
DELETE FROM `disables` WHERE `sourceType`= 4 AND `entry`= 5258;

-- Insert missing Landmine Knockback Achievement criteria data
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`= 5258;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(5258,0,57064,0,'');

-- Update description for the linked spells 54355 and 54402
UPDATE `spell_linked_spell` SET `comment`= 'Trigger Detonation with Land Mine Knockback' WHERE `spell_trigger` = 54355;

-- Insert spell script name for spell 57099
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_landmine_knockback_achievement';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(57099,'spell_gen_landmine_knockback_achievement');
UPDATE `gameobject_template` SET `data2`=8 WHERE  `entry`=191502;

-- Valkyrion Must Burn -- http://www.wowhead.com/quest=12953/valkyrion-must-burn
UPDATE `creature_template` SET `speed_walk`=0.001, `speed_run`=0.001 WHERE  `entry`=30066;

-- Mending Fences -- [A][H] http://www.wowhead.com/quest=12915/mending-fences
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=55818;
INSERT INTO conditions VALUES (17, 0, 55818, 0, 0, 31, 1, 3, 29375, 0, 0, 0, 0, '', 'Requires Stormforged Iron Giant');
DELETE FROM spell_script_names WHERE spell_id=55818;
INSERT INTO spell_script_names VALUES(55818, "spell_q12915_mending_fences");
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=29927;
DELETE FROM smart_scripts WHERE entryorguid=29927 AND source_type=0;
INSERT INTO smart_scripts VALUES (29927, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 29375, 30, 0, 0, 0, 0, 0, 'Earthen Ironbane - Is Summoned - Attack Start');

-- Battling the Elements -- [A][H] http://www.wowhead.com/quest=12967/battling-the-elements
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='56753');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES ('56753', '-56750', 'Remove Gather Snow aura on Throw Snowball cast');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='17') AND (`SourceEntry`='56753');
INSERT INTO conditions VALUES
(17, 0, 56753, 0, 0, 31, 1, 3, 30120, 0, 0, 0, 0, '', 'Throw Snowball requires Seething Revenants'),
(17, 0, 56753, 0, 1, 31, 1, 3, 30121, 0, 0, 0, 0, '', 'Throw Snowball requires Seething Revenants');
 
 
/* 
*/ 
-- -------------------------------------------
-- ZUL'DRAK
-- -------------------------------------------

-- Troll Patrol: Can You Dig It? -- [A][H] http://www.wowhead.com/quest=12588/troll-patrol-can-you-dig-it

UPDATE creature_template SET AIName='SmartAI' WHERE  entry=28330;

DELETE FROM smart_scripts WHERE entryorguid=28330 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(2833000,2833001,2833002) AND source_type=9;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28330, 0, 0, 1, 8, 0, 100, 0, 51333, 0, 120000, 120000, 33, 28330, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Give Quest Credit'),
(28330, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 70, 120, 0, 0, 0, 0, 0, 20, 190550, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Despawn GO'),
(28330, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 2833000, 2833001, 2833002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Run Random Script'),
(2833000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 1 - Cast Summon Ancient Drakkari Chest'),
(2833001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51357, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 2 - Cast Summon Spider'),
(2833002, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51370, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 3 - Cast Summon Drakkari Spectre');

DELETE FROM gameobject_template WHERE entry=190552;
INSERT INTO gameobject_template (entry, type, displayId, name, IconName, castBarCaption, unk1, faction, flags, size, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, AIName, ScriptName, VerifiedBuild) VALUES 
(190552, 3, 2450, 'Ancient Drakkari Chest', '', '', '', 94, 0, 1, 1691, 27240, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 14007);

DELETE FROM gameobject_loot_template WHERE Entry=27240;
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES 
(27240, 46369, 0, 52, 0, 1, 1, 1, 1, NULL),
(27240, 46368, 0, 47, 0, 1, 1, 1, 1, NULL),
(27240, 43851, 0, 15, 0, 1, 2, 1, 1, NULL),
(27240, 43852, 0, 14, 0, 1, 2, 1, 1, NULL),
(27240, 33470, 0, 14, 0, 1, 3, 1, 4, NULL);

-- Troll Patrol: Whatdya Want, a Medal? -- [A][H] http://www.wowhead.com/quest=12519/troll-patrol-whatdya-want-a-medal

UPDATE creature_template SET npcflag=16777216 WHERE  entry=28162;

DELETE FROM npc_spellclick_spells WHERE npc_entry=28162;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type) VALUES 
(28162, 51026, 1, 0);

DELETE FROM smart_scripts WHERE entryorguid=28162 AND source_type=0;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28162, 0, 0, 1, 8, 0, 100, 1, 51026, 0, 0, 0, 11, 61286, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast World Generic Dismount/Cancel Shapeshift'),
(28162, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50737, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast Create Drakkari Medallion'),
(28162, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast Create Drakkari Medallion'),
(28162, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Despawn'),
(28162, 0, 4, 0, 25, 0, 100, 0, 0, 0, 0, 0, 81, 16777216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Respawn - Set NPC Flags');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=28162;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES 
(18, 28162, 51026, 0, 0, 9, 0, 12519, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

-- Troll Patrol: Done to Death -- [A][H] http://www.wowhead.com/quest=12568/troll-patrol-done-to-death

DELETE FROM smart_scripts WHERE entryorguid=28156 AND source_type=0;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28156, 0, 0, 1, 8, 0, 100, 1, 51276, 0, 0, 0, 11, 59216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit \'Incinerate Corpse\' - Cast \'Burning Corpse\''),
(28156, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51279, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit - Cast \'Defeated Argent Footman KC\''),
(28156, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit - Despawn');

-- The Blessing of Zim'Rhuk - [A][H] - http://www.wowhead.com/quest=12655/the-blessing-of-zimrhuk
UPDATE `gameobject_template` SET `flags`=`flags`|0x00001000 WHERE  `entry` IN (190657, 192079, 192080);

-- Foundation for Revenge - [A][H] - http://www.wowhead.com/quest=12668/foundation-for-revenge
-- Quetz'lun Worshipper SAI
SET @ENTRY := 28747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,54594,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quetz'lun Worshipper - On Aggro - Cast 'Serpent Strike'"),
(@ENTRY,0,1,0,2,0,100,0,0,50,30000,40000,11,54601,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-50% Health - Cast 'Serpent Form'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - On Aggro - Set Invincibility Hp 1"),
(@ENTRY,0,4,5,2,0,100,1,0,10,0,0,11,52242,0,0,0,0,0,19,28724,15,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-10% Health - Cast 'Foundation for Revenge: Soul Font Void Channel' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,0,10,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-10% Health - Run Script (No Repeat)"),
(@ENTRY,0,6,0,6,0,100,0,0,0,0,0,33,28713,0,0,0,0,0,21,30,0,0,0,0,0,0,"Quetz'lun Worshipper - On Just Died - Quest Credit 'Foundation for Revenge'");


-- Death to the Necromagi - [A][H] http://www.wowhead.com/quest=12552/death-to-the-necromagi

UPDATE quest_template_addon SET PrevQuestID=12598 WHERE ID=12552;
UPDATE quest_template_addon SET ExclusiveGroup=0 WHERE ID=12598;
 
 
/* 
*/ 
-- -------------------------------------------
-- BLADES_EDGE_MOUNTAINS
-- -------------------------------------------

-- Guardian of the Monument -- [A][H] http://www.wowhead.com/quest=11059/guardian-of-the-monument

UPDATE creature_loot_template SET Chance=100 WHERE Item=32697 AND entry=22275;


-- Stasis Chambers of Bash'ir -- [A][H] http://www.wowhead.com/quest=10974/stasis-chambers-of-bashir

SET @THUK := 22920;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@THUK;
DELETE FROM smart_scripts WHERE entryorguid=@THUK AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (@THUK, 0,0,0,6,0,100,0,0,0,0,0,32,0,0,0,0,0,0,14,47301,185512,0,0,0,0,0,"Thuk the Defiant - On Just Died - Reset Gameobject");

-- Test Flight: Raven\'s Wood -- http://www.wowhead.com/quest=10716/test-flight-ravens-wood-needs-reward
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=10716;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(1, 10716, 0, '', '', 'Deprecated quest: Test Flight: Raven\'s Wood');

-- [Q] Bladespire Kegger - http://www.wowhead.com/quest=10545/bladespire-kegger
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_bloodmaul_brutebane' WHERE  `entry`=21241;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_bloodmaul_brute' WHERE  `entry` IN (19991, 19995, 19998, 20334);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19991, 19995, 19998, 20334, 21241);


-- The Smallest Creatures - [H] http://www.wowhead.com/quest=10720/the-smallest-creatures

UPDATE gameobject_template SET ScriptName='' WHERE entry IN(185206, 185213, 185214);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=38629;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (13, 1, 38629, 0, 0, 31, 0, 3, 22356, 0, 0, 0, 0, '', ''),
    (13, 1, 38629, 0, 1, 31, 0, 3, 22367, 0, 0, 0, 0, '', ''),
    (13, 1, 38629, 0, 2, 31, 0, 3, 22368, 0, 0, 0, 0, '', '');

DELETE FROM spell_script_names WHERE spell_id IN(38629, 38544);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (38629, "spell_q10720_the_smallest_creature");

REPLACE INTO disables VALUES(7, 185206, 0, '', '', '');
REPLACE INTO disables VALUES(7, 185213, 0, '', '', '');
REPLACE INTO disables VALUES(7, 185214, 0, '', '', '');

-- Showdown - [A] http://www.wowhead.com/quest=10806/showdown - [H] http://www.wowhead.com/quest=10742/showdown

SET @GOC := 20555;
SET @SABELLIAN := 22496;
SET @REXXAR := 22448;
SET @SABLEMANE := 22473;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(@SABELLIAN, @GOC));
DELETE FROM creature WHERE id IN(@SABELLIAN, @GOC);
DELETE FROM event_scripts WHERE id IN(14462, 14525);
INSERT INTO event_scripts VALUES (14462, 0, 10, @GOC, 300000, 0, 3703.51, 5387.74, -4.37, 5.9);
INSERT INTO event_scripts VALUES (14462, 0, 10, @REXXAR, 300000, 0, 3688, 5353, 25, 0);
INSERT INTO event_scripts VALUES (14525, 0, 10, @GOC, 300000, 0, 3703.51, 5387.74, -4.37, 5.9);
INSERT INTO event_scripts VALUES (14525, 0, 10, @SABLEMANE, 300000, 0, 3718.36, 5361.27, -8.0, 2.14);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=39224;
INSERT INTO conditions VALUES(17, 0, 39224, 0, 0, 29, 0, 14462, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
INSERT INTO conditions VALUES(17, 0, 39224, 0, 0, 29, 0, @GOC, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=39223;
INSERT INTO conditions VALUES(17, 0, 39223, 0, 0, 29, 0, 14462, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
INSERT INTO conditions VALUES(17, 0, 39223, 0, 0, 29, 0, @GOC, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
DELETE FROM creature_text WHERE entry=@GOC;
INSERT INTO creature_text VALUES (@GOC, 0, 0, 'Who dares place this affront upon the altar of Goc?', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
INSERT INTO creature_text VALUES (@GOC, 1, 0, 'Who dares rouse Goc from his restful slumber?', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
INSERT INTO creature_text VALUES (@GOC, 2, 0, 'Your name is as insignificant to me as the names of the thousands who have died under the might of Goc. I will crush you and $N.', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
UPDATE creature_template SET faction=14, AIName='SmartAI', ScriptName='' WHERE entry=@GOC;
DELETE FROM smart_scripts WHERE entryorguid=@GOC AND source_type=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@GOC, 0, 0, 0, 38, 0, 100, 0, 1, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @REXXAR, 100, 0, 0, 0, 0, 0, 'Goc - On Data Set - Set Orientation'),
    (@GOC, 0, 1, 0, 38, 0, 100, 0, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Goc - On Data Set - Say Line 2'),
    (@GOC, 0, 2, 9, 38, 0, 100, 0, 1, 2, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Goc - On Data Set - Attack Start'),
    (@GOC, 0, 3, 12, 6, 0, 100, 0, 0, 0, 0, 0, 11, 45106, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Death - Cast Showdown: Goc Kill Credit'),
    (@GOC, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Evade - Despawn'),
    (@GOC, 0, 5, 0, 0, 0, 100, 0, 9000, 12000, 11000, 15000, 11, 38784, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - In Combat - Cast Ground Smash'),
    (@GOC, 0, 6, 0, 0, 0, 100, 0, 3000, 6000, 11000, 15000, 11, 38783, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Goc - In Combat - Cast Boulder Volley'),
    (@GOC, 0, 7, 8, 25, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set Unit Flags'),
    (@GOC, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set React Passive'),
    (@GOC, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Remove Unit Flags'),
    (@GOC, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set React Aggressive'),
    (@GOC, 0, 11, 0, 38, 0, 100, 0, 1, 3, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SABLEMANE, 100, 0, 0, 0, 0, 0, 'Goc - On Data Set - Set Orientation'),
    (@GOC, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @SABLEMANE, 0, 100, 0, 0, 0, 0, "Goc - On Just Died - Despawn Instant"),
    (@GOC, 0, 13, 0, 6, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @REXXAR, 0, 100, 0, 0, 0, 0, "Goc - On Just Died - Despawn Instant");

DELETE FROM creature_text WHERE entry=@SABLEMANE;
INSERT INTO creature_text VALUES (@SABLEMANE, 0, 0, 'It''s only right that you know the name of the one who will take your life.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 1, 0, 'Baron Sablemane. It will be on your lips as you gasp your dying breath.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 2, 0, 'Let us begin.', 14, 0, 100, 15, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 3, 0, 'We will speak again, but away from here.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SABLEMANE;
DELETE FROM smart_scripts WHERE entryorguid=@SABLEMANE AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(@SABLEMANE*100, @SABLEMANE*100+1) AND source_type=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@SABLEMANE, 0, 0, 0, 37, 0, 100, 1, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On AI Init - Set Active'),
    (@SABLEMANE, 0, 1, 0, 60, 0, 100, 1, 0, 0, 0, 0, 80, @SABLEMANE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Start Script'),
    (@SABLEMANE, 0, 2, 0, 7, 0, 100, 1, 0, 0, 0, 0, 80, @SABLEMANE*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Evade - Start Script'),
    (@SABLEMANE, 0, 3, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 17290, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - In Combat - Cast Fireball'),
    (@SABLEMANE, 0, 4, 0, 0, 0, 100, 0, 4000, 7000, 11000, 20000, 11, 39268, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - In Combat - Cast Chains of Ice'),
    (@SABLEMANE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Unit Flags'),
    (@SABLEMANE*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 41232, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Cast Teleport Visual Only'),
    (@SABLEMANE*100, 9, 2, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1 Target'),
    (@SABLEMANE*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 0'),
    (@SABLEMANE*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 3, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 5, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1'),
    (@SABLEMANE*100, 9, 6, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 7, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1'),
    (@SABLEMANE*100, 9, 8, 0, 0, 0, 100, 0, 500, 500, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Attack Start'),
    (@SABLEMANE*100, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Remove Unit Flags'),
    (@SABLEMANE*100+1, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 3'),
    (@SABLEMANE*100+1, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, 41232, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Cast Teleport Visual Only'),
    (@SABLEMANE*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Despawn');

DELETE FROM creature_text WHERE entry=@REXXAR;
INSERT INTO creature_text VALUES (@REXXAR, 0, 0, 'I am Rexxar, son of the Mok''Nathal, champion of the Horde.', 14, 0, 100, 397, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 1, 0, 'And their torment at your hands is at an end. By my name, I shall put an end to your life.', 14, 0, 100, 113, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 2, 0, 'Prepare yourself for the end.', 14, 0, 100, 15, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 3, 0, 'I could not have achieved this victory without you. We will speak back at Thunderlord Stronghold.', 14, 0, 100, 397, 0, 0, 0, 0, 'Rexxar');

UPDATE creature_template SET InhabitType=3, AIName='SmartAI', ScriptName='' WHERE entry=@REXXAR;
DELETE FROM creature_template_addon WHERE entry=@REXXAR;
DELETE FROM smart_scripts WHERE entryorguid=@REXXAR AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(@REXXAR*100, @REXXAR*100+1) AND source_type=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES 
    (@REXXAR, 0, 0, 1, 37, 0, 100, 1, 0, 0, 0, 0, 43, 0, 20964, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Mount'),
    (@REXXAR, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Set Active'),
    (@REXXAR, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Set Flying'),
    (@REXXAR, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 148, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - No Environment Update'),
    (@REXXAR, 0, 4, 0, 60, 0, 100, 1, 0, 0, 0, 0, 80, @REXXAR*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Start Script'),
    (@REXXAR, 0, 5, 0, 7, 0, 100, 1, 0, 0, 0, 0, 80, @REXXAR*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Evade - Start Script'),
    (@REXXAR, 0, 6, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 11, 39269, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Misha'),
    (@REXXAR, 0, 7, 0, 0, 0, 100, 1, 16000, 16000, 0, 0, 11, 39251, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Huffer'),
    (@REXXAR, 0, 8, 0, 0, 0, 100, 1, 30000, 30000, 0, 0, 11, 39253, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Spirit'),
    (@REXXAR*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Unit Flags'),
    (@REXXAR*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 27, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Emote State'),
    (@REXXAR*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3718.36, 5361.27, -6.5, 0, 'Rexxar - On Update - Move Point'),
    (@REXXAR*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 0 Target'),
    (@REXXAR*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Dismount'),
    (@REXXAR*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Fly off'),
    (@REXXAR*100, 9, 6, 0, 0, 0, 100, 0, 500, 500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Orientation'),
    (@REXXAR*100, 9, 7, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 0'),
    (@REXXAR*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 9, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 1'),
    (@REXXAR*100, 9, 10, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 2'),
    (@REXXAR*100, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Home Position'),
    (@REXXAR*100, 9, 13, 0, 0, 0, 100, 0, 500, 500, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 14, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Remove Unit Flags'),
    (@REXXAR*100, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Attack Start'),
    (@REXXAR*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22492, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22498, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22490, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 3'),
    (@REXXAR*100+1, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 43, 0, 20964, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Mount'),
    (@REXXAR*100+1, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 60, 1, 300, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Fly'),
    (@REXXAR*100+1, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3625, 5468, 104, 0, 'Rexxar - On Update - Move To Position'),
    (@REXXAR*100+1, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 8000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn');
 
 
/* 
*/ 
-- -------------------------------------------
-- BLOODMYST_ISLE
-- -------------------------------------------


-- [Q[ Razormaw - http://wotlk.openwow.com/quest=9689
UPDATE `creature_template` SET `speed_run` = 2.14286, `InhabitType` = 7, `MovementType` = 0, `AIName` = '', `ScriptName` = 'npc_razormaw' WHERE `entry` = 17592;

DELETE FROM `event_scripts` WHERE `id` = 11087;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(11087, 3, 10, 17592, 150000, 0, -1200.41, -12516, 112.10, 1.7231);

DELETE FROM `waypoints` WHERE `entry` = 17592;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=17592;

-- [Q] Ending their World - http://www.wowhead.com/quest=9759/ending-their-world
-- Exarch Admetius
-- Text
SET @ADMETIUS := 17658;
DELETE FROM `creature_text` WHERE `entry`=@ADMETIUS;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `probability`, `emote`, `comment`) VALUES
(@ADMETIUS, 0, 0, 'All hail $N, savior of Azuremyst and Bloodmyst. Hero of the Hand of Argus, champion of the draenei people!', 14, 100, 22, 'Exarch Admetius q9759 OnRewarded');

-- Exarch Admetius SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ADMETIUS;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ADMETIUS AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ADMETIUS,0,0,1,20,0,100,0,9759,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exarch Admetius - On Quest 'Ending Their World' Finished - Say Line 0"),
(@ADMETIUS,0,1,0,61,0,100,0,9759,0,0,0,80,1765800,2,0,0,0,0,1,0,0,0,0,0,0,0,"Exarch Admetius - On Quest 'Ending Their World' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1765800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1930.463989,-11812.552734,62.630852,2.309952,"On Script - Summon Creature '17659'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1937.486816,-11805.743164,63.798454,5.535975,"On Script - Summon Creature '17659'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1933.494751,-11814.824219,62.108002,2.227484,"On Script - Summon Creature '17659'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1939.963135,-11808.174805,62.675228,5.499846,"On Script - Summon Creature '17659'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1936.870117,-11817.032227,61.134773,2.248988,"On Script - Summon Creature '17659'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1942.610474,-11810.625000,61.824261,5.247342,"On Script - Summon Creature '17659'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1940.207031,-11819.827148,60.307522,2.362086,"On Script - Summon Creature '17659'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1945.478760,-11813.578125,60.911236,5.352979,"On Script - Summon Creature '17659'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1944.12133,-11823.203125,59.074284,2.187334,"On Script - Summon Creature '17659'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1948.833252,-11816.772461,60.053009,5.346693,"On Script - Summon Creature '17659'"),

(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,17116,2,300000,0,0,0,8,0,0,0,-1958.723145,-11821.600586,58.892117,0.461123,"On Script - Summon Creature '17116'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,17214,2,300000,0,0,0,8,0,0,0,-1960.273315,-11819.877930,59.570976,0.295709,"On Script - Summon Creature '17214'"),

(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,17101,2,300000,0,0,0,8,0,0,0,-1959.952393,-11823.844727,57.627731,0.372766,"On Script - Summon Creature '17101'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,17215,2,300000,0,0,0,8,0,0,0,-1961.160522,-11823.409180,57.701954,0.640498,"On Script - Summon Creature '17215'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,17110,2,300000,0,0,0,8,0,0,0,-1961.201050,-11821.857422,58.600365,0.525438,"On Script - Summon Creature '17110'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,17440,2,300000,0,0,0,8,0,0,0,-1964.156616,-11826.984375,56.166782,0.561564,"On Script - Summon Creature '17440'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,17682,2,300000,0,0,0,8,0,0,0,-1966.066650,-11824.650391,57.265072,0.161011,"On Script - Summon Creature '17682'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,17443,2,300000,0,0,0,8,0,0,0,-1966.240601,-11821.984375,58.598003,6.208578,"On Script - Summon Creature '17443'"),
(@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,17445,2,300000,0,0,0,8,0,0,0,-1968.898560,-11829.065430,55.041294,0.386419,"On Script - Summon Creature '17445'"),

(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,17242,2,300000,0,0,0,8,0,0,0,-1948.333862,-11832.594727,57.239986,1.149823,"On Script - Summon Creature '17242'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,17240,2,300000,0,0,0,8,0,0,0,-1950.203369,-11831.666992,56.967094,1.090918,"On Script - Summon Creature '17240'"),
(@ENTRY,9,21,0,0,0,100,0,0,0,0,0,12,17117,2,300000,0,0,0,8,0,0,0,-1952.308716,-11831.344727,56.705555,0.912240,"On Script - Summon Creature '17117'"),
(@ENTRY,9,22,0,0,0,100,0,0,0,0,0,12,17246,2,300000,0,0,0,8,0,0,0,-1949.923462,-11834.007813,56.731907,1.218545,"On Script - Summon Creature '17246'"),
(@ENTRY,9,23,0,0,0,100,0,0,0,0,0,12,17241,2,300000,0,0,0,8,0,0,0,-1952.386230,-11833.522461,56.430508,0.977035,"On Script - Summon Creature '17241'"),

(@ENTRY,9,24,0,0,0,100,0,0,0,0,0,12,17311,2,300000,0,0,0,8,0,0,0,-1954.797119,-11838.625977,55.252689,1.161602,"On Script - Summon Creature '17311'"),
(@ENTRY,9,25,0,0,0,100,0,0,0,0,0,12,17649,2,300000,0,0,0,8,0,0,0,-1955.696411,-11843.051758,54.145817,1.175565,"On Script - Summon Creature '17649'"),

(@ENTRY,9,26,0,0,0,100,0,0,0,0,0,12,17468,2,300000,0,0,0,8,0,0,0,-1965.800659,-11838.660156,53.219593,0.792683,"On Script - Summon Creature '17468'");

-- Blade of Argus SAI
SET @ENTRY := 17659;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blade of Argus - On Just Summoned - Set Flag Standstate Kneel");

-- Diktynna SAI
SET @ENTRY := 17101;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");

-- Exarch Menelaous SAI
SET @ENTRY := 17116;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4"),
(@ENTRY, 0, 2, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 17116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip hello credit for quest 9663');


-- 17215SAI
SET @ENTRY := 17215;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");


-- Acteon SAI
SET @ENTRY := 17110;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");


-- Anchorite Fateema SAI
SET @ENTRY := 17214;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anchorite Fateema - On Just Summoned - Play Emote 10");

-- Admiral Odesyus SAI
SET @ENTRY := 17240;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,17240,0,0,0,0,0,7,0,0,0,0,0,0,0,"Admiral Odesyus - On Gossip Hello - Quest Credit 'The Kessel Run'"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Admiral Odesyus - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,2,0,1,1,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Admiral Odesyus - Out of Combat - Play Emote 10 (Phase 1)");

-- Cowlen SAI
SET @ENTRY := 17311;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,7401,0,0,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - On Gossip Option 0 Selected - Play Emote 18"),
(@ENTRY,0,1,0,61,0,100,0,7401,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cowlen - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - Out of Combat - Play Emote 10 (Phase 1)");

-- Archaeologist Adamant Ironheart SAI
SET @ENTRY := 17242;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Archaeologist Adamant Ironheart - On Just Summoned - Play Emote 10");

-- Injured Night Elf Priestess SAI
SET @ENTRY := 17117;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Night Elf Priestess - On Just Summoned - Remove Flag Standstate Sleep"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Night Elf Priestess - On Just Summoned - Play Emote 10");

-- "Cookie" McWeaksauce SAI
SET @ENTRY := 17246;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cookie McWeaksauce - On Just Summoned - Play Emote 10");

-- Priestess Kyleen Il'dinare SAI
SET @ENTRY := 17241;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Priestess Kyleen Il'dinare - On Just Summoned - Play Emote 10");

-- Kessel SAI
SET @ENTRY := 17649;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kessel - On Just Summoned - Play Emote 10");
 
 
/* 
*/ 
-- -------------------------------------------
-- HELLFIRE PENINSULA
-- -------------------------------------------


-- Digging for Prayer Beads -- [A] http://www.wowhead.com/quest=10916/digging-for-prayer-beads

-- Fei fei SAI 
SET @ENTRY :=20206;
SET @RENTRY :=@ENTRY*100;
UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` =20232;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(@RENTRY+0,@RENTRY+1,@RENTRY+2) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 20, 0, 100, 0, 10919, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On Quest \'Fei Fei\'s Treat\' Finished - Set Active'),
(@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On Quest \'Fei Fei\'s Treat\' Finished - Set NPC Flags'),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On Quest \'Fei Fei\'s Treat\' Finished - Start Waypoints'),
(@ENTRY, 0, 3, 4, 40, 0, 100, 0, 11, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP111 - Pause WP'),
(@ENTRY, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP11 - Say Line 3'),
(@ENTRY, 0, 5, 6, 40, 0, 100, 0, 12, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP12 - Pause WP'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @RENTRY+0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP12 - Run Script 1'),
(@ENTRY, 0, 7, 8, 40, 0, 100, 0, 14, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP14 - Pause WP'),
(@ENTRY, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP14 - Say Line 3'),
(@ENTRY, 0, 9, 10, 40, 0, 100, 0, 15, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP15 - Pause WP'),
(@ENTRY, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 80, @RENTRY+0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP15 - Run Script 1'),
(@ENTRY, 0, 11, 12, 40, 0, 100, 0, 19, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP19 - Pause WP'),
(@ENTRY, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP119 - Say Line 3'),
(@ENTRY, 0, 13, 14, 40, 0, 100, 0, 20, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP20 - Pause WP'),
(@ENTRY, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @RENTRY+0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP20 - Run Script 1'),
(@ENTRY, 0, 15, 16, 40, 0, 100, 0, 21, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP21 - Pause WP'),
(@ENTRY, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP21 - Say Line 3'),
(@ENTRY, 0, 17, 18, 40, 0, 100, 0, 22, @ENTRY, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP22 - Pause WP'),
(@ENTRY, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @RENTRY+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP22 - Run Script 3'),
(@ENTRY, 0, 19, 20, 40, 0, 100, 0, 27, @ENTRY, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP26 - Set NPC Flags'),
(@ENTRY, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 2.22254, 'Fei Fei - On reached WP26 - Set Orientation'),
(@ENTRY, 0, 21, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - On reached WP26 - Set Active Off'),

(@RENTRY, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 1 - Say Line 1'), 
(@RENTRY, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 1 - Play Emote 35'), 
(@RENTRY, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 39216, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 1 - Cast  Create Fei Fei Stash'),
(@RENTRY, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 1 - Say Line 2'), 

(@RENTRY+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 3 - Say Line 1'),
(@RENTRY+1, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 3 - Play Emote 35'),
(@RENTRY+1, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fei Fei - Script 3 - Say Line 4');


-- Fei Fei emotes
DELETE FROM `creature_text` WHERE `entry` = @ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(@ENTRY, 0, 0, '%s digs in the dirt...', 16, 0, 100, 35, 0, 0, 20312, 0, 'Fei Fei to Fei Fei Stash Bunny'),
(@ENTRY, 1, 0, '%s sniffs around, unsatisfied with this hiding spot.', 16, 0, 100, 0, 0, 0, 20315, 0,'Fei Fei to Fei Fei Stash Bunny'),
(@ENTRY, 2, 0, '%s looks for a hiding spot...', 16, 0, 100, 0, 0, 0, 20316, 0,'Fei Fei to Fei Fei Stash Bunny'),
(@ENTRY, 3, 0, '%s buries his treat!', 16, 0, 100, 0, 0, 0, 20313, 0,'Fei Fei to Fei Fei Stash Bunny');


-- Fei Fei Waypoints
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, -684.603027, 2626.439941, 89.099045, 'Fei Fei'),
(@ENTRY, 2, -700.425598, 2625.966797, 90.052612, 'Fei Fei'),
(@ENTRY, 3, -707.514893, 2624.197266, 89.868263, 'Fei Fei'),
(@ENTRY, 4, -711.982483, 2613.048096, 90.970711, 'Fei Fei'),
(@ENTRY, 5, -713.329468, 2592.547607, 90.969841, 'Fei Fei'),
(@ENTRY, 6, -713.661133, 2585.821045, 89.325836, 'Fei Fei'),
(@ENTRY, 7, -712.279602, 2584.229492, 89.470940, 'Fei Fei'),
(@ENTRY, 8, -705.065857, 2585.099365, 89.346779, 'Fei Fei'),
(@ENTRY, 9, -699.770142, 2589.676758, 89.024117, 'Fei Fei'),
(@ENTRY, 10, -694.049866, 2597.703369, 88.652557, 'Fei Fei'),
(@ENTRY, 11, -693.523499, 2619.256836, 89.345879, 'Fei Fei'),
(@ENTRY, 12, -697.735718, 2613.105713, 89.451324, 'Fei Fei'),
(@ENTRY, 13, -689.663574, 2644.310059, 91.245781, 'Fei Fei'),
(@ENTRY, 14, -688.266052, 2667.391846, 91.878723, 'Fei Fei'),
(@ENTRY, 15, -694.138672, 2666.621826, 92.455330, 'Fei Fei'),
(@ENTRY, 16, -666.579041, 2731.219482, 93.909233, 'Fei Fei'),
(@ENTRY, 17, -685.993164, 2735.593506, 93.916939, 'Fei Fei'),
(@ENTRY, 18, -686.434448, 2743.451904, 94.008966, 'Fei Fei'),
(@ENTRY, 19, -695.514465, 2745.844727, 94.009531, 'Fei Fei'),
(@ENTRY, 20, -691.559692, 2744.181885, 94.075731, 'Fei Fei'),
(@ENTRY, 21, -695.871460, 2744.131348, 94.109146, 'Fei Fei'),
(@ENTRY, 22, -698.219360, 2742.897217, 94.109528, 'Fei Fei'),
(@ENTRY, 23, -686.705505, 2744.116699, 94.008417, 'Fei Fei'),
(@ENTRY, 24, -685.225769, 2702.325684, 95.058762, 'Fei Fei'),
(@ENTRY, 25, -691.219177, 2639.470459, 90.667580, 'Fei Fei'),
(@ENTRY, 26, -688.100830, 2629.254395, 89.736145, 'Fei Fei'),
(@ENTRY, 27, -684.457214, 2626.312500, 89.064705, 'Fei Fei');


-- Fei Fei Stashe Bunny spawn ID: 22467
DELETE FROM `creature` WHERE `id`=22467;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(12545, 22467, 530, 0, 0, 1, 1, 0, 0, -690.565, 2743.81, 94.0318, 2.67035, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(12546, 22467, 530, 0, 0, 1, 1, 0, 0, -694.607, 2666.24, 92.5453, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(12547, 22467, 530, 0, 0, 1, 1, 0, 0, -698.913, 2611.4, 89.6674, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);


-- Fei Fei's Chache
DELETE FROM `gameobject` WHERE `id` =185302;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(28524, 185302, 530, 1, 1, -699.4442, 2742.403, 94.18588, -0.5759573, 0, 0, 0, 1, 120, 255, 1);

-- 
-- Earthbinder Galandria Nightbreeze -- www.wowhead.com/quest=10349
-- Earthbinder Galandria Nightbreeze SAI
SET @ENTRY := 19294;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 1 0 - Say Line 0"),
(@ENTRY,0,1,2,20,0,100,0,10349,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Run Script"),
(@ENTRY,0,2,5,61,0,100,0,10349,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Set Active On"),
(@ENTRY,0,3,0,38,0,100,0,2,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 2 0 - Run Script"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Respawn - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,5,0,61,0,100,0,10349,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Set Run Off"),
(@ENTRY,0,6,0,1,0,100,0,30000,30000,30000,30000,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - Out of Combat - Set Npc Flags Gossip & Questgiver");
-- Actionlist SAI
SET @ENTRY := 1929400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Npc Flag "),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Orientation Closest Player"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,53,0,19294,0,0,0,1,8,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Start Waypoint"),
(@ENTRY,9,4,0,0,0,100,0,11000,11000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 16"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 0"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,50,184450,40,0,0,0,0,8,0,0,0,-287.019,4731.63,18.217,2.58308,"Earthbinder Galandria Nightbreeze - On Script - Summon Gameobject 'Crimson Crystal Shard'"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 2"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,20599,3,60000,1,0,0,8,0,0,0,-288.19,4733.63,18.2982,5.044,"Earthbinder Galandria Nightbreeze - On Script - Summon Creature 'Lured Colossus'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Home Position");

-- Actionlist SAI
SET @ENTRY := 1929401;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,53,0,1929401,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,13000,13000,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0.20944,"Earthbinder Galandria Nightbreeze - On Script - Set Orientation Home Position"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,294.7065,4714.872,28.1988,0.2556,"Earthbinder Galandria Nightbreeze - On Script - Set Home Position");

DELETE FROM `waypoints` WHERE `entry` IN (19294, 1929401);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(19294, 1, -294.766, 4715.08, 28.1862, 'Galandria'),
(19294, 2, -296.804, 4722.59, 24.0603, 'Galandria'),
(19294, 3, -290.471, 4730.38, 18.5859, 'Galandria'),
(19294, 4, -290.26, 4732.71, 18.1974, 'Galandria'),
(1929401, 1, -290.26, 4732.71, 18.1974, 'Galandria'),
(1929401, 2, -294.647, 4726.02, 22.1931, 'Galandria'),
(1929401, 3, -297.548, 4724.52, 23.1029, 'Galandria'),
(1929401, 4, -295.713, 4718.61, 27.0766, 'Galandria'),
(1929401, 5, -294.979, 4715.03, 28.2415, 'Galandria');


-- Hotter than Hell - [A] http://www.wowhead.com/quest=10764/hotter-than-hell
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry`=38202;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 38202, 0, 0, 31, 1, 3, 18733, 0, 0, 0, 0, 'Spell Heat Mold requires dead Feal Reaver', NULL),
(17, 0, 38202, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, 'Spell Heat Mold requires dead Feal Reaver', NULL);

-- Void Spawner - Quest - Warp Rifts SAI - http://www.wowhead.com/quest=10278
SET @ENTRY := 20143;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,5000,15000,23000,11,34943,0,0,0,0,0,1,0,0,0,0,0,0,0,"Void Spawner - Quest - Warp Rifts - Out of Combat - Cast 'Summon Unstable Voidwalker'"),
(@ENTRY,0,1,0,63,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Void Spawner - Quest - Warp Rifts - On Just Created - Set Active On"),
(@ENTRY,0,2,0,1,0,100,0,120000,120000,120000,120000,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Void Spawner - Quest - Warp Rifts - Out of Combat - Despawn Instant");
UPDATE `creature_template` SET `modelid1`=18684 WHERE `entry`=20143;
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE  `entry`=20143;


-- Natural Remedies - [A][H] http://www.wowhead.com/quest=10351/natural-remedies

SET @PATHALEON := 21504;
SET @SEEDTRIGGER := 20781;
SET @REDCRYSTAL := 20617;
SET @GOLIATHON := 19305;
DELETE FROM event_scripts WHERE id=13256;

DELETE FROM creature_text WHERE entry=@PATHALEON AND groupid IN(20, 21, 22, 23);
INSERT INTO creature_text VALUES (@PATHALEON, 20, 0, "And just what do you think you are doing? You dare to interfere with my master's experiment? ", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 21, 0, "Do you like what we've done here? Perhaps we will drop these crystals from the sky all over Outland.", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 22, 0, "I grow bored with your attempt to heal the land and quell the energies summoning and driving the colossi mad. Goliathon, King of the Colossi, Prince Kael'thas and I demand that you defend the crystal!", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 23, 0, "We will meet again soon.", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SEEDTRIGGER;
DELETE FROM smart_scripts WHERE entryorguid=@SEEDTRIGGER AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@SEEDTRIGGER*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawned - Set Phase');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 1, 2, 8, 1, 100, 0, 35413, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Phase');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SEEDTRIGGER*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Start Script');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @REDCRYSTAL, 80, 0, 0, 0, 0, 0, 'Script9 - Set Data');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 1, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 86, 35468, 0, 10, 72893, @REDCRYSTAL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast Spell Entangling Roots Visual');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @PATHALEON, 3, 80000, 0, 0, 0, 8, 0, 0, 0, 127.82, 4835.76, 75.92, 6.15, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 86, 34776, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 4, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 20, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 5, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 86, 35471, 2, 10, 72891, @REDCRYSTAL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast Spell Insect Swarm');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 21, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 7, 0, 0, 0, 100, 0, 12000, 12000, 0, 0, 86, 32783, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 22, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 9, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 28, 32783, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Remove Aura 32783');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 10, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 86, 34776, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 23, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Despawn Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @GOLIATHON, 4, 40000, 0, 0, 0, 8, 0, 0, 0, 114.35, 4841.9, 76.2, 5.9, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 14, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 45, 2, 2, 0, 0, 0, 0, 11, @REDCRYSTAL, 80, 0, 0, 0, 0, 0, 'Script9 - Set Data');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 15, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@REDCRYSTAL;
DELETE FROM smart_scripts WHERE entryorguid=@REDCRYSTAL AND source_type=0;
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Set Phase');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 1, 3, 38, 0, 100, 0, 2, 2, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Set Phase');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 2, 0, 60, 1, 100, 0, 0, 0, 2500, 2500, 11, 35487, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Remove all auras');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@GOLIATHON;
DELETE FROM smart_scripts WHERE entryorguid=@GOLIATHON AND source_type=0;
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 2, 0, 0, 0, 50, 0, 9000, 9000, 10000, 10000, 11, 5568, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Trample' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 0, 0, 0, 0, 50, 0, 6000, 6000, 10000, 10000, 11, 32959, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Knock Away' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 1, 0, 0, 0, 50, 0, 8000, 8000, 10000, 10000, 11, 33688, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Crystal Strike' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 3, 0, 2, 0, 100, 1, 0, 90, 0, 0, 11, 33904, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-90% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 4, 0, 2, 0, 100, 1, 0, 60, 0, 0, 11, 33905, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-60% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 5, 0, 2, 0, 100, 1, 0, 30, 0, 0, 11, 33906, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-30% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 6, 7, 60, 0, 100, 1, 200, 200, 0, 0, 11, 34776, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - On Update - Cast 'Teleport' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, "Goliathon - On Update - Attack Start");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=35413;
INSERT INTO conditions VALUES(17, 0, 35413, 0, 0, 29, 0, @GOLIATHON, 150, 0, 1, 22, 0, '', 'Require no Goliathon nearby');
 
 
/* 
*/ 
-- Bring me the Egg - http://wotlk.openwow.com/quest=10111
-- Windroc Matriarch SAI
SET @ENTRY := 19055;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,19055,0,0,0,2,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Respawn - Start Waypoint"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - Out of Combat - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,40,0,100,0,3,19055,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,3,0,0,0,100,0,4000,4000,6000,6000,11,30285,0,0,0,0,0,2,0,0,0,0,0,0,0,"Windroc Matriarch - In Combat - Cast 'Eagle Claw'"),
(@ENTRY,0,4,0,0,0,100,0,7000,8000,11000,14000,11,32914,0,0,0,0,0,2,0,0,0,0,0,0,0,"Windroc Matriarch - In Combat - Cast 'Wing Buffet'");

-- Actionlist SAI
SET @ENTRY := 1905500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,1000000000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,1,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Set Faction 14 (No Repeat)"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,19,320,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Remove Flag Immune To Players"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Windroc Matriarch - On Script - Start Attacking");
 
 
/* 
*/ 
-- -------------------------------------------
-- NETHERSTORM
-- -------------------------------------------


-- Captain Tyralius -- [A][H] http://www.wowhead.com/quest=10422/captain-tyralius


UPDATE gameobject_template SET data2=180000 WHERE entry=184588;


-- Dr. Boom! -- [A][H] http://www.wowhead.com/quest=10221/dr-boom

UPDATE creature_template SET unit_flags=33284 WHERE entry=20284;


-- Troublesome Distractions -- [A][H] http://www.wowhead.com/quest=10273/troublesome-distractions

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8071;
INSERT INTO conditions VALUES (15, 8071, 0, 0, 0, 9, 0, 10273, 0, 0, 0, 0, 0, '', 'Only show gossip menu if player has Troublesome Distractions quest log.');

DELETE FROM gossip_menu_option WHERE menu_id=8071;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES
    (8071, 0, 0, 'Wind Trader Marid, I\'ve returned with more information on the nether drakes. I\'m prepared to be your business partner, and for an extra sum, I\'ll take care of that troublesome elf and her human friend.', 0, 1, 1, 0, 0, 0, 0, '', 0);

SET @ENTRY := 20071;
UPDATE creature_template SET flags_extra=0, speed_walk=1.5 WHERE entry=@ENTRY;

DELETE FROM creature_text WHERE entry=@ENTRY AND groupid IN(0, 1);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@ENTRY, 0, 0, 'Let us hold our discussion in a more... private place. Follow me, $N.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wind Trader Marid'),
    (@ENTRY, 1, 0, 'You didn\'t really think I\'d do business with you again, did you? Sometimes, the best way to return to profitability is to know when to cut your losses.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wind Trader Marid');

DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@ENTRY, 1, 4283.52, 2226.99, 124.217, 'Wind Trader Marid'),
    (@ENTRY, 2, 4289.39, 2217.21, 124.098, 'Wind Trader Marid'),
    (@ENTRY, 3, 4291.87, 2212.83, 121.275, 'Wind Trader Marid'),
    (@ENTRY, 4, 4295.08, 2207.17, 119.304, 'Wind Trader Marid'),
    (@ENTRY, 5, 4302.43, 2205.13, 120.59, 'Wind Trader Marid'),
    (@ENTRY, 6, 4307.42, 2196.81, 119.483, 'Wind Trader Marid'),
    (@ENTRY, 7, 4313.26, 2192.73, 117.658, 'Wind Trader Marid'),
    (@ENTRY, 8, 4316.16, 2187.62, 114.884, 'Wind Trader Marid'),
    (@ENTRY, 9, 4318.19, 2181.1, 116.967, 'Wind Trader Marid'),
    (@ENTRY, 10, 4315.18, 2173.19, 118.304, 'Wind Trader Marid'),
    (@ENTRY, 11, 4313.72, 2167.93, 118.03, 'Wind Trader Marid'),
    (@ENTRY, 12, 4316.97, 2162.18, 120.626, 'Wind Trader Marid'),
    (@ENTRY, 13, 4316.23, 2156.77, 123.907, 'Wind Trader Marid'),
    (@ENTRY, 14, 4310.42, 2147.52, 127.422, 'Wind Trader Marid'),
    (@ENTRY, 15, 4307.3, 2140.1, 129.336, 'Wind Trader Marid');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,25,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Flags Immune To Players & Immune To NPCs"),
    (@ENTRY,0,1,2,25,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Npc Flags Gossip & Questgiver"),
    (@ENTRY,0,2,0,25,0,100,0,0,0,0,0,2,1731,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Faction 1731"),
    (@ENTRY,0,3,4,62,0,100,0,8071,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Say Line 0"),
    (@ENTRY,0,4,5,61,0,100,0,8071,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Close Gossip"),
    (@ENTRY,0,5,6,61,0,100,0,8071,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Store Targetlist"),
    (@ENTRY,0,6,7,61,0,100,0,8071,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Set Npc Flag "),
    (@ENTRY,0,7,8,61,0,100,0,8071,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPCs"),
    (@ENTRY,0,8,0,61,0,100,0,8071,0,0,0,67,1,3000,3000,0,0,100,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Create Timed Event"),
    (@ENTRY,0,9,0,59,0,100,0,1,0,0,0,53,0,20071,0,0,0,1,12,1,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 1 Triggered - Start Waypoint"),
    (@ENTRY,0,10,11,40,0,100,0,15,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Set Orientation 0"),
    (@ENTRY,0,11,12,61,0,100,0,15,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Say Line 1"),
    (@ENTRY,0,12,0,61,0,100,0,15,0,0,0,67,2,4000,4000,0,0,100,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Create Timed Event"),
    (@ENTRY,0,13,14,59,0,100,0,2,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 2 Triggered - Set Faction 14"),
    (@ENTRY,0,14,15,61,0,100,0,2,0,0,0,12,20101,4,10000,0,0,0,8,0,0,0,4327.28,2133.79,126.42,2.88,"Wind Trader Marid - On Timed Event 2 Triggered - Summon Creature 'Nether-Stalker'"),
    (@ENTRY,0,15,16,61,0,100,0,2,0,0,0,12,20101,4,10000,0,0,0,8,0,0,0,4328.97,2140.08,124.66,2.88,"Wind Trader Marid - On Timed Event 2 Triggered - Summon Creature 'Nether-Stalker'"),
    (@ENTRY,0,16,0,61,0,100,0,2,0,0,0,8,2,0,0,0,0,0,1,20,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 2 Triggered - Set Reactstate Aggressive"),
    (@ENTRY,0,17,0,17,0,100,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Summoned Unit - Say Line 0 (No Repeat)");


-- Building a Perimeter -- [A][H] http://www.wowhead.com/quest=10240/building-a-perimeter

SET @ENTRY := 19866;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19866,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");

SET @ENTRY := 19867;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19867,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");

SET @ENTRY := 19868;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19868,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");


-- You, Robot -- [A][H] http://www.wowhead.com/quest=10248/you-robot

DELETE FROM creature_text WHERE entry IN(19832, 19851);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (19832, 0, 0, 'Oh no! What\'s that? Quickly, defend us with the Scrap Reaver X6000!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Doctor Vomisa, Ph.T.'),
    (19851, 0, 0, 'I AM DEATH! PREPARE YOUR TOWN FOR ANNIHILATION!', 14, 0, 100, 0, 0, 0, 0, 0, 'Negatron');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=34630;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorTextId, ScriptName, Comment)
VALUES
    (17,0,34630,0,0,23,0,3873,0,0,0,0,'','Scrap Reaver X6000 can only be active inside the Proving Grounds (Netherstorm)');

UPDATE creature_template SET unit_flags=0 WHERE entry=19849;
UPDATE gameobject_template SET displayId=0 WHERE entry=183982;

SET @ENTRY := 19832;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Doctor Vomisa, Ph.T. - On Data Set 1 1 - Say Line 0");

SET @ENTRY := 19851;
UPDATE creature_template SET unit_flags=256+512 WHERE entry=@ENTRY;
UPDATE creature_template SET speed_run=2.5 WHERE entry=@ENTRY;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@ENTRY, 1, 3131.96, 3274.67, 110.71, 'Negatron'),
    (@ENTRY, 2, 3125.74, 3290.35, 108.03, 'Negatron'),
    (@ENTRY, 3, 3116.73, 3312.99, 110.34, 'Negatron'),
    (@ENTRY, 4, 3108.58, 3340.73, 106.56, 'Negatron'),
    (@ENTRY, 5, 3097.43, 3385.81, 105.35, 'Negatron');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,9,0,100,0,8,25,15000,21000,11,35570,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - Within 8-25 Range - Cast 'Charge'"),
    (@ENTRY,0,1,0,9,0,100,0,0,5,15000,21000,11,34625,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - Within 0-5 Range - Cast 'Demolish'"),
    (@ENTRY,0,2,0,0,0,100,0,15000,19000,21000,25000,11,35565,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - In Combat - Cast 'Earthquake'"),
    (@ENTRY,0,3,0,2,0,100,0,0,50,16000,22000,11,34624,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - Between 0-50% Health - Cast 'Frenzy'"),
    (@ENTRY,0,4,0,6,0,100,0,0,0,0,0,15,10248,0,0,0,0,0,7,0,0,0,0,0,0,0,"Negatron - On Just Died - Quest Credit ''"),
    (@ENTRY,0,5,6,38,0,100,0,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Data Set 1 0 - Set Active On"),
    (@ENTRY,0,6,0,61,0,100,0,1,0,0,0,53,1,19851,0,0,0,1,1,0,0,0,0,0,0,0,"Negatron - On Data Set 1 0 - Start Waypoint"),
    (@ENTRY,0,7,8,40,0,100,0,5,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Waypoint 5 Reached - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,0,8,0,61,0,100,0,5,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Waypoint 5 Reached - Say Line 0"),
    (@ENTRY,0,9,10,25,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Reset - Set Active Off"),
    (@ENTRY,0,10,0,25,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Reset - Set Flags Immune To Players & Immune To NPC's");

SET @ENTRY := 19849;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34630,0,0,0,45,1,0,0,0,0,100,19,19851,200,0,0,0,0,0,"Scrap Reaver X6000 - On Spellhit 'Scrap Reaver X6000' - Set Data 1 0"),
    (@ENTRY,0,1,0,61,0,100,0,34630,0,0,0,45,1,1,0,0,0,0,19,19832,200,0,0,0,0,0,"Scrap Reaver X6000 - On Spellhit 'Scrap Reaver X6000' - Set Data 1 1");


-- Fel Reavers, No Thanks! -- [A][H] http://www.wowhead.com/quest=10855/fel-reavers-no-thanks

DELETE FROM smart_scripts WHERE entryorguid=2229300 AND source_type=9;

SET @ENTRY := 22293;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY, 0, 0, 1, 20, 0, 100, 0, 10850, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest Reward - Store Target'),
    (@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest Reward - Say Line 0'),
    (@ENTRY, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest Reward - Move Random'),
    (@ENTRY, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 67, 1, 8000, 8000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest Reward - Create Timed Event'),
    (@ENTRY, 0, 4, 5, 59, 0, 100, 0, 1, 0, 0, 0, 15, 10855, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Timed Event - Quest Complete'),
    (@ENTRY, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 33, 22293, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Timed Event - Kill Credit'),
    (@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Timed Event - Die');
    

-- Fel Reavers, No Thanks! -- [A][H] http://www.wowhead.com/quest=10855/fel-reavers-no-thanks
-- Quest items required for the repeatable (can't be picked up): Nether Gas In a Fel Fire Engine

UPDATE creature_loot_template SET Chance=60 WHERE Item=31653 AND entry=16949;


-- Dimensius the All-Devouring -- [A][H] http://www.wowhead.com/quest=10439/dimensius-the-all-devouring

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8230, 8228);
INSERT INTO conditions
VALUES 
    (15, 8230, 0, 0, 0, 9, 0, 10439, 0, 0, 0, 0, 0, '', 'Only show gossip menu 0 if player has Dimensius the All-Devouring quest log.'),
    (15, 8228, 0, 0, 0, 9, 0, 10439, 0, 0, 0, 0, 0, '', 'Only show gossip menu 1 if player has Dimensius the All-Devouring quest log.');

DELETE FROM gossip_menu WHERE (entry=8230 AND text_id=10232) OR (entry=8228 AND text_id=10229);
INSERT INTO gossip_menu (entry, text_id) VALUES
(8230, 10232),
(8228, 10229);

DELETE FROM gossip_menu_option WHERE (menu_id=8230 AND OptionBroadcastTextID=18641) OR (menu_id=8228 AND OptionBroadcastTextID=18639);
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES    
    (8230, 0, 0, 'I am ready. Let\'s make history!', 18641, 1, 1, 0, 0, 0, 0, '', 0),
    (8228, 0, 0, 'I am that fleshling, Saeed. Let\'s go!', 18639, 1, 1, 0, 0, 0, 0, '', 0);

SET @SAEED := 20985;
UPDATE creature_template SET AIName='', ScriptName='npc_captain_saeed' WHERE entry=@SAEED;
DELETE FROM script_waypoint WHERE entry=@SAEED;
INSERT INTO script_waypoint (entry, pointid, location_x, location_y, location_z, waittime, point_comment)
VALUES
    (@SAEED, 1, 4254.23, 2108.69, 144.247, 0, ""),
    (@SAEED, 2, 4239.06, 2114.86, 146.952, 0, ""),
    (@SAEED, 3, 4225.45, 2118.14, 152.244, 0, ""),
    (@SAEED, 4, 4211.32, 2107.93, 156.698, 0, ""),
    (@SAEED, 5, 4206.56, 2104.48, 160.319, 0, ""),
    (@SAEED, 6, 4178.02, 2075.21, 163.157, 0, ""),
    (@SAEED, 7, 4175.38, 2061.21, 167.984, 0, ""),
    (@SAEED, 8, 4188.63, 2023.8, 184.663, 0, ""),
    (@SAEED, 9, 4173.8, 1993.33, 204.116, 0, ""),
    (@SAEED, 10, 4142.52, 1973.01, 218.002, 0, ""),
    (@SAEED, 11, 4101.52, 2007.56, 230.967, 0, ""),
    (@SAEED, 12, 4092.63, 2026.51, 236.429, 0, ""),
    (@SAEED, 13, 4059.49, 2060.78, 250.161, 0, ""),
    (@SAEED, 14, 4032.52, 2077.06, 254.449, 0, ""),
    (@SAEED, 15, 4001.34, 2099.2, 254.212, 0, ""),
    (@SAEED, 16, 3993.95, 2090.21, 254.32, 0, ""),
    (@SAEED, 17, 3989.37, 2083.43, 256.391, 0, ""),
    (@SAEED, 18, 3951.24, 2024.99, 257.005, 0, ""),
    (@SAEED, 19, 3936.40, 2003.0, 255.68, 0, "");

SET @DIMENSIUS := 19554;
SET @SPAWN := 21780;
DELETE FROM creature_text WHERE entry IN(@DIMENSIUS, @SAEED, @SPAWN);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@DIMENSIUS, 0, 0, 'You only hasten the inevitable. In time, all will be devoured!', 14, 0, 100, 0, 0, 0, 0, 1, 'Dimensius the All-Devouring'),
    (@DIMENSIUS, 1, 0, 'Time only has meaning to mortals, insect. Dimensius is infinite!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring'),
    (@SAEED, 0, 0, 'You heard the fleshling! MOVE OUT!', 12, 0, 100, 15, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 1, 0, 'Tell me when you are ready. We will attack on your command.', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 2, 0, 'It\'s now or never, soldiers! Let\'s do this! For K\'aresh! For the Protectorate!', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 3, 0, 'The time for your destruction has finally come, Dimensius!', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SPAWN, 0, 0, '%s begins channeling power into Dimensius.', 16, 0, 100, 0, 0, 0, 0, 0, 'Spawn of Dimensius');

DELETE FROM spell_script_names WHERE spell_id=36500;
INSERT INTO spell_script_names (spell_id, ScriptName)
VALUES
    (36500, 'spell_gen_throw_back');

UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@SPAWN;
DELETE FROM smart_scripts WHERE entryorguid =@SPAWN AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SPAWN, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On AI Init - Set React Passive'),
    (@SPAWN, 0, 1, 2, 60, 0, 100, 257, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Attack Start'),
    (@SPAWN, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37450, 2, 0, 0, 0, 0, 19, @DIMENSIUS, 50, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Cast Dimensius Feeding'),
    (@SPAWN, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Say Line 0');

SET @AVENGER := 21805;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@AVENGER;
DELETE FROM smart_scripts WHERE entryorguid=@AVENGER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@AVENGER, 0, 0, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 36500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Avenger - In Combat - Cast Glaive');

SET @DEFENDER := 20984;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@DEFENDER;
DELETE FROM smart_scripts WHERE entryorguid=@DEFENDER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@DEFENDER, 0, 0, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 36500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Defender - In Combat - Cast Glaive'),
    (@DEFENDER, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 10000, 20000, 11, 31553, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Defender - In Combat - Cast Hamstring');

SET @REGENERATOR := 21783;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@REGENERATOR;
DELETE FROM smart_scripts WHERE entryorguid=@REGENERATOR AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@REGENERATOR,0,0,0,0,0,100,0,0,1000,3000,4000,11,34232,0,0,0,0,0,2,0,0,0,0,0,0,0,"Protectorate Regenerator - In Combat - Cast 'Holy Bolt'");

UPDATE creature_model_info SET CombatReach=7 WHERE DisplayID=18988;
UPDATE creature SET id=@DIMENSIUS WHERE id=21035;
UPDATE creature_template SET unit_flags=unit_flags|4, AIName='NullCreatureAI', ScriptName='' WHERE entry=21035;
UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@DIMENSIUS;
DELETE FROM smart_scripts WHERE entryorguid IN(@DIMENSIUS, 21035) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@DIMENSIUS, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 35939, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - On Reset - Cast Dimensius Transform'),
    (@DIMENSIUS, 0, 1, 0, 0, 0, 100, 0, 3000, 4000, 7000, 10000, 11, 37500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - In Combat - Cast Shadow Spiral'),
    (@DIMENSIUS, 0, 2, 0, 0, 0, 100, 0, 5000, 7000, 10000, 16000, 11, 37412, 0, 0, 0, 0, 0, 5, 50, 1, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - In Combat - Cast Shadow Vault'),
    (@DIMENSIUS, 0, 3, 4, 2, 0, 100, 1, 0, 75, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 28, 0, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, -28, 0, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 28, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, -28, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature');

UPDATE creature SET spawntimesecs=120 WHERE id IN(@AVENGER, @DEFENDER, @REGENERATOR, @SAEED, @DIMENSIUS);


-- Electro-Shock Goodness! -- [A][H] http://www.wowhead.com/quest=10411/electro-shock-goodness

DELETE FROM spell_dbc WHERE Id IN(35687, 35688);
INSERT INTO spell_dbc (Id, Dispel, Mechanic, Attributes, AttributesEx, AttributesEx2, AttributesEx3, AttributesEx4, AttributesEx5, AttributesEx6, AttributesEx7, Stances, StancesNot, Targets, CastingTimeIndex, AuraInterruptFlags, ProcFlags, ProcChance, ProcCharges, MaxLevel, BaseLevel, SpellLevel, DurationIndex, RangeIndex, StackAmount, EquippedItemClass, EquippedItemSubClassMask, EquippedItemInventoryTypeMask, Effect1, Effect2, Effect3, EffectDieSides1, EffectDieSides2, EffectDieSides3, EffectRealPointsPerLevel1, EffectRealPointsPerLevel2, EffectRealPointsPerLevel3, EffectBasePoints1, EffectBasePoints2, EffectBasePoints3, EffectMechanic1, EffectMechanic2, EffectMechanic3, EffectImplicitTargetA1, EffectImplicitTargetA2, EffectImplicitTargetA3, EffectImplicitTargetB1, EffectImplicitTargetB2, EffectImplicitTargetB3, EffectRadiusIndex1, EffectRadiusIndex2, EffectRadiusIndex3, EffectApplyAuraName1, EffectApplyAuraName2, EffectApplyAuraName3, EffectAmplitude1, EffectAmplitude2, EffectAmplitude3, EffectMultipleValue1, EffectMultipleValue2, EffectMultipleValue3, EffectItemType1, EffectItemType2, EffectItemType3, EffectMiscValue1, EffectMiscValue2, EffectMiscValue3, EffectMiscValueB1, EffectMiscValueB2, EffectMiscValueB3, EffectTriggerSpell1, EffectTriggerSpell2, EffectTriggerSpell3, EffectSpellClassMaskA1, EffectSpellClassMaskA2, EffectSpellClassMaskA3, EffectSpellClassMaskB1, EffectSpellClassMaskB2, EffectSpellClassMaskB3, EffectSpellClassMaskC1, EffectSpellClassMaskC2, EffectSpellClassMaskC3, MaxTargetLevel, SpellFamilyName, SpellFamilyFlags1, SpellFamilyFlags2, SpellFamilyFlags3, MaxAffectedTargets, DmgClass, PreventionType, DmgMultiplier1, DmgMultiplier2, DmgMultiplier3, AreaGroupId, SchoolMask, Comment)
VALUES
    (35687, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 25, 1, 0, -1, 0, 0, 28, 0, 0, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20806, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Summon Seeping Sludge Globule'),
    (35688, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 25, 1, 0, -1, 0, 0, 28, 0, 0, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20805, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Summon Void Waste Globule');

SET @VOIDWASTE := 20778;
SET @SEEPINGSLUDGE := 20501;
SET @VWGLOBULE := 20805;
SET @SSGLOBULE := 20806;
SET @SEEPINGOOZE := 21264;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=35686;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES 
    (17, 0, 35686, 0, 0, 31, 1, 3, @VOIDWASTE, 0, 0, 0, 0, '', 'Requires Void Waste'),
    (17, 0, 35686, 0, 1, 31, 1, 3, @SEEPINGSLUDGE, 0, 0, 0, 0, '', 'Requires Seeping Sludge');

DELETE FROM creature_text WHERE entry IN(@VOIDWASTE, @SEEPINGSLUDGE);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@VOIDWASTE, 0, 0, '%s breaks down into globules!', 16, 0, 100, 0, 0, 0, 0, 0, 'Void Waste'),
    (@SEEPINGSLUDGE, 0, 0, '%s breaks down into globules!', 16, 0, 100, 0, 0, 0, 0, 0, 'Seeping Sludge'),
    (@SEEPINGSLUDGE, 1, 0, '%s attempts to split in two!', 16, 0, 100, 0, 0, 0, 0, 0, 'Seeping Sludge');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(@VOIDWASTE, @SEEPINGSLUDGE, @VWGLOBULE, @SSGLOBULE, @SEEPINGOOZE);
DELETE FROM smart_scripts WHERE entryorguid IN(@VOIDWASTE, @SEEPINGSLUDGE, @VWGLOBULE, @SSGLOBULE, @SEEPINGOOZE) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@VOIDWASTE, 0, 0, 0, 0, 0, 100, 0, 3000, 10000, 19000, 30000, 11, 36519, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - In Combat - Cast Toxic Burst'),
    (@VOIDWASTE, 0, 1, 2, 8, 0, 100, 0, 35686, 0, 0, 0, 11, 35688, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Cast Summon Void Waste Globule'),
    (@VOIDWASTE, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Say Line 0'),
    (@VOIDWASTE, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Die'),
    (@SEEPINGSLUDGE, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 35242, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Respawn - Cast Darkstalker Birth'),
    (@SEEPINGSLUDGE, 0, 1, 2, 2, 0, 50, 1, 0, 30, 0, 0, 11, 36465, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Between Health 0-30% - Cast Seeping Split'),
    (@SEEPINGSLUDGE, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Between Health 0-30% - Say Line 1'),
    (@SEEPINGSLUDGE, 0, 3, 0, 17, 0, 100, 1, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Just Summoned - Despawn'),
    (@SEEPINGSLUDGE, 0, 4, 5, 8, 0, 100, 0, 35686, 0, 0, 0, 11, 35687, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Cast Summon Seeping Sludge Globule'),
    (@SEEPINGSLUDGE, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Say Line 0'),
    (@SEEPINGSLUDGE, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Die'),
    (@SEEPINGOOZE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Seeping Ooze - Out of Combat - Attack Start'),
    (@SEEPINGOOZE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Ooze - Out of Combat - Despawn'),
    (@VWGLOBULE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Void Waste Globule - Out of Combat - Attack Start'),
    (@VWGLOBULE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste Globule - Out of Combat - Despawn'),
    (@SSGLOBULE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Seeping Sludge Globule - Out of Combat - Attack Start'),
    (@SSGLOBULE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge Globule - Out of Combat - Despawn');


-- On Nethery Wings - [A][H] http://www.wowhead.com/quest=10438/on-nethery-wings

SET @VOIDCONDUIT := 20899;
UPDATE creature_template SET RegenHealth=0 WHERE entry=@VOIDCONDUIT;
UPDATE gameobject_template SET data1=90 WHERE entry=184643;

UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@VOIDCONDUIT;
DELETE FROM smart_scripts WHERE entryorguid=@VOIDCONDUIT AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@VOIDCONDUIT, 0, 0, 1, 8, 0, 100, 0, 35734, 0, 0, 0, 33, @VOIDCONDUIT, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Kill Credit'),
    (@VOIDCONDUIT, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 10, 69964, 19554, 1, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Say Line 0 Target'),
    (@VOIDCONDUIT, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Die');

-- Sabotage the Warp-Gate! - http://www.wowhead.com/quest=10310
UPDATE `creature_template` SET `ScriptName`='npc_drijya' WHERE  `entry`=20281;
DELETE FROM `script_waypoint` WHERE entry=20281;
INSERT INTO `script_waypoint` VALUES
(20281, 0, 3096.416, 2801.408, 118.149, 7000, 'SAY_DRIJYA_START'),
(20281, 1, 3096.516, 2801.065, 118.128, 0, 'SAY_DRIJYA_1'),
(20281, 2, 3099.995, 2796.665, 118.118, 0, ''),
(20281, 3, 3098.759, 2786.174, 117.125, 0, ''),
(20281, 4, 3087.792, 2754.602, 115.441, 0, ''),
(20281, 5, 3080.718, 2730.793, 115.930, 9000, 'SAY_DRIJYA_2'),
(20281, 6, 3060.235, 2731.306, 115.122, 0, ''),
(20281, 7, 3050.863, 2727.388, 114.054, 0, ''),
(20281, 8, 3050.863, 2727.388, 114.054, 8000, 'SAY_DRIJYA_4'),
(20281, 9, 3055.008, 2724.972, 113.687, 0, ''),
(20281, 10, 3053.777, 2718.427, 113.684, 0, ''),
(20281, 11, 3028.622, 2693.375, 114.670, 0, ''),
(20281, 12, 3022.430, 2695.297, 113.406, 0, ''),
(20281, 13, 3022.430, 2695.297, 113.406, 8000, 'SAY_DRIJYA_5'),
(20281, 14, 3025.463, 2700.755, 113.514, 0, ''),
(20281, 15, 3011.336, 2716.782, 113.691, 0, ''),
(20281, 16, 3010.882, 2726.991, 114.239, 0, ''),
(20281, 17, 3009.178, 2729.083, 114.324, 0, ''),
(20281, 18, 3009.178, 2729.083, 114.324, 15000, 'SAY_DRIJYA_6'),
(20281, 19, 3009.178, 2729.083, 114.324, 6000, 'SPELL_EXPLOSION_VISUAL'),
(20281, 20, 3009.178, 2729.083, 114.324, 8000, 'SAY_DRIJYA_7'),
(20281, 21, 3033.888, 2736.437, 114.369, 0, ''),
(20281, 22, 3071.492, 2741.502, 116.462, 0, ''),
(20281, 23, 3087.792, 2754.602, 115.441, 0, ''),
(20281, 24, 3094.505, 2770.198, 115.744, 0, ''),
(20281, 25, 3103.510, 2784.362, 116.857, 0, ''),
(20281, 26, 3099.995, 2796.665, 118.118, 0, ''),
(20281, 27, 3096.290, 2801.027, 118.096, 0, 'SAY_DRIJYA_COMPLETE');

DELETE FROM `creature_text` WHERE `entry`=20281;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(20281, 0, 0, 'Very well.  Before we head down there, take a moment to prepare yourself.', 12, 0, 100, 1, 0, 0, 17940, 'Drijya'),
(20281, 1, 0, 'Let\'s proceed at a brisk pace.', 12, 0, 100, 0, 0, 0, 17941, 'Drijya'),
(20281, 2, 0, 'We\'ll start at that first energy pylon, straight ahead.  Remember, try to keep them off of me.', 12, 0, 100, 1, 0, 0, 17942, 'Drijya'),
(20281, 3, 0, 'Keep them off me!', 12, 0, 100, 0, 0, 0, 17950, 'Drijya'),
(20281, 4, 0, 'I\'m done with this pylon.  On to the next.', 12, 0, 100, 1, 0, 0, 17943, 'Drijya'),
(20281, 5, 0, 'Alright, pylon two down.  Now for the heat manifold.', 12, 0, 100, 1, 0, 0, 17944, 'Drijya'),
(20281, 6, 0, 'That should do it.  The teleporter should blow any second now!', 12, 0, 100, 5, 0, 0, 17945, 'Drijya'),
(20281, 7, 0, 'Ok, now let\'s get out of here!', 12, 0, 100, 1, 0, 0, 1617, 'Drijya'),
(20281, 8, 0, 'Thank you, $n!  I couldn''t have done it without you.  You''ll let Gahruj know?', 12, 0, 100, 1, 0, 0, 17949, 'Drijya');


-- Escape from the Staging Grounds - [A][H] http://www.wowhead.com/quest=10425/escape-from-the-staging-grounds

SET @ENTRY := 20763;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
UPDATE creature SET spawntimesecs=300 WHERE id=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,19,0,100,0,10425,0,0,0,1,0,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Say Line 0"),
    (@ENTRY,0,1,2,61,0,100,0,10425,0,0,0,53,0,20763,0,0,0,2,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Start Waypoint"),
    (@ENTRY,0,2,14,61,0,100,0,10425,0,0,0,64,1,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Store Targetlist"),
    (@ENTRY,0,7,0,40,0,100,0,16,20763,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 16 Reached - Pause Waypoint"),
    (@ENTRY,0,8,10,40,0,100,0,17,20763,0,0,15,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Quest Credit ''"),
    (@ENTRY,0,9,0,6,0,100,0,0,0,0,0,6,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Just Died - Fail Quest ''"),
    (@ENTRY,0,10,0,61,0,100,0,17,20763,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Say Line 1"),
    (@ENTRY,0,11,12,40,0,100,0,18,20763,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Say Line 2"),
    (@ENTRY,0,12,13,61,0,100,0,18,20763,0,0,11,35517,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Cast 'Teleport'"),
    (@ENTRY,0,13,0,61,0,100,0,18,20763,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Despawn In 3000 ms"),
    (@ENTRY,0,14,0,61,0,100,0,10425,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Set Npc Flag "),
    (@ENTRY,0,15,0,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Respawn - Set Npc Flag Questgiver"),
    (@ENTRY,0,16,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - In Combat - Remove Npc Flag Questgiver"),
    (@ENTRY,0,17,0,1,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - Out of Combat - Add Npc Flag Questgiver");


-- Delivering the Message - [A][H] http://www.wowhead.com/quest=10406/delivering-the-message

SET @DEMOLITIONIST := 20802;
SET @COMMANDER := 20482;
SET @ENERGYCELL := 20755;
UPDATE creature_template_addon SET bytes2=0, auras=35681 WHERE entry=@ENERGYCELL;
DELETE FROM creature_text WHERE entry IN(@DEMOLITIONIST, 20474);
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 0, 0, 'Let''s do this... Just keep me covered and I''ll deliver the package.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 1, 0, 'I''m under attack! I repeat, I am under attack!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 2, 0, 'By the second sun of K''aresh, look at this place! I can only imagine what Salhadaar is planning. Come on, let''s keep going.', 12, 0, 100, 5, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 3, 0, 'Look there, fleshling! Salhadaar''s conduits! He''s keeping well fed...', 12, 0, 100, 25, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 4, 0, 'Alright, keep me protected while I plant this disruptor. This shouldn''t take very long...', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 5, 0, 'Done! Back up! Back up!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 6, 0, 'Looks like my work here is done. Report to the holo-image of Ameer over at the transporter.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (20474, 0, 0, 'Protect the conduit! Stop the intruders!', 12, 0, 100, 0, 0, 0, 0, 0, 'Ethereum Nexus-Stalker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL);
UPDATE creature_template SET speed_walk=1.5, speed_run=1, RegenHealth=0 WHERE entry=@DEMOLITIONIST;
UPDATE creature_template SET scale=2 WHERE entry=@ENERGYCELL;
DELETE FROM smart_scripts WHERE entryorguid IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@DEMOLITIONIST*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (@COMMANDER, 0, 0, 0, 19, 0, 100, 0, 10406, 0, 0, 0, 85, 35679, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Quest Accept - Invoker Cast'),
    (@DEMOLITIONIST, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 53, 0, @DEMOLITIONIST, 0, 10406, 5000, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Start WP'),
    (@DEMOLITIONIST, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Talk'),
    (@DEMOLITIONIST, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Aggro - Talk'),
    (@DEMOLITIONIST, 0, 3, 0, 40, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reach - Set Home Pos'),
    (@DEMOLITIONIST, 0, 4, 5, 40, 0, 100, 0, 6, 0, 0, 0, 54, 6000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 6, 7, 40, 0, 100, 0, 11, 0, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 8, 9, 40, 0, 100, 0, 14, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @DEMOLITIONIST*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Script9'),
    (@DEMOLITIONIST, 0, 10, 11, 56, 0, 100, 0, 14, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Talk'),
    (@DEMOLITIONIST, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Remove Emote State'),
    (@DEMOLITIONIST, 0, 12, 13, 40, 0, 100, 0, 15, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @ENERGYCELL, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Set Data'),
    (@DEMOLITIONIST, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 11, 35682, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Cast Spell'),
    (@DEMOLITIONIST, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 15, 10406, 0, 0, 0, 0, 0, 17, 0, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Complete quest'),
    (@DEMOLITIONIST*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 469, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Set Emote State'),
    (@DEMOLITIONIST*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3864, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3867, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 20474, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 5, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3870, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@ENERGYCELL, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 40799, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Spell Hit - Cast Spell');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@COMMANDER;
INSERT INTO conditions VALUES (22, 1, @COMMANDER, 0, 0, 1, 0, 35679, 1, 0, 1, 0, 0, '', 'Requires Player without aura');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=35682;
INSERT INTO conditions VALUES (13, 1, 35682, 0, 0, 31, 0, 3, @ENERGYCELL, 0, 0, 0, 0, '', 'Target Ethereum Energy Cell');
INSERT INTO conditions VALUES (13, 1, 35682, 0, 1, 31, 0, 3, 20769, 0, 0, 0, 0, '', 'Target Salaadin Energy Ball');

DELETE FROM waypoints WHERE entry=@DEMOLITIONIST;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@DEMOLITIONIST, 1, 4015.68, 2322.49, 113.825, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 2, 4007.63, 2323.53, 111.428, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 3, 3998.41, 2324.73, 113.084, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 4, 3973, 2328.02, 114.082, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 5, 3951.87, 2328.36, 113.983, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 6, 3939.16, 2330.01, 112.224, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 7, 3931.58, 2332.9, 110.878, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 8, 3922.88, 2336.22, 112.603, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 9, 3910.8, 2345.43, 114.132, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 10, 3885.74, 2364.52, 114.827, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 11, 3874.4, 2383.68, 113.784, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 12, 3871.9, 2360.65, 114.97, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 13, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 14, 3872.97, 2321.61, 114.52, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 15, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist');


 
 
/* 
*/ 
-- -------------------------------------------
-- OUTLANDS
-- -------------------------------------------


-- Becoming a Shadoweave Tailor - [A][H] http://www.wowhead.com/quest=10833/becoming-a-shadoweave-tailor

UPDATE creature_template SET flags_extra=130, AIName='SmartAI' WHERE entry=22395;
DELETE FROM smart_scripts WHERE entryorguid =22395 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (22395, 0, 0, 0, 8, 0, 100, 0, 39094, 0, 0, 0, 33, 22395, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[PH]Altar of Shadows target - On Spell Hit - Kill Credit');
 
 
/* 
*/ 
-- -------------------------------------------
-- SHADOWMOON VALLEY
-- -------------------------------------------


-- Thwart the Dark Conclave -- [A][H] http://www.wowhead.com/quest=10808/thwart-the-dark-conclave
-- To Do: Increase Disrupt Dark Conclave Ritual Spell ID:38469 range from 60 to 80 yards
--        Despwan Unguarded Summoning Site GO ID: 184750 after the quest credit was given
--        Respawn Dark Conclave Ritualists on Summoned Old God Reset

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=22139;
UPDATE `smart_scripts` SET `target_param1`=22139, `target_param2`=100, `action_param2`=64 WHERE `entryorguid`=22138 AND `source_type`=0 AND `id`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=38469 AND `ElseGroup`=0;
DELETE FROM `gameobject` WHERE `id`=184750;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (22137);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22137) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22138) AND `source_type`=0 AND id IN(1,2);

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(22137, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 75, 38457, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Summoned Old God - On reset - Add Transparency'),
(22137, 0, 1, 0, 1, 8, 100, 0, 0, 0, 240000, 240000, 50, 184750, 240, 0, 0, 0, 0, 8, 0, 0, 0, -4161.259277, 1985.773804, 59.094448, 6.210211,'Summoned Old God - OOC (Phase 4) - spawn spell focus'),
(22137, 0, 2, 0, 38, 0, 100, 0, 1, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Data Set 1 1 - Increment Phase'),
(22137, 0, 3, 0, 38, 0, 100, 0, 2, 2, 0, 0, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Data Set 2 2 - Set Phase 0'),
(22137, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spawn Set Active'),
(22137, 0, 5, 6, 8, 0, 100, 0, 38482, 0, 0, 0, 33, 22137, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Give Kill Credit'),
(22137, 0, 6, 7, 61, 0, 0, 0, 0, 0, 0, 0, 11, 37281, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Cast Infernal Oversouls Wrath'),
(22137, 0, 7, 8, 61, 0, 0, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 19, 22146, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Despawn Summoning Voidstorm'),
(22138, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 22137, 100, 0, 0, 0, 0,0,'Dark Conclave Ritualist - On Death - Set Data'),
(22138, 0, 2, 0, 11, 0, 100, 0, 0, 0, 0, 0, 45, 2, 2, 0, 0, 0, 0, 19, 22137, 100, 0, 0, 0, 0,0,'Dark Conclave Ritualist - On Respawn - Set Data');

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=37281 AND `SourceId`=0 AND `ElseGroup`IN(2,3);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 37281, 0, 2, 31, 0, 3, 22137, 0, 0, 0, 0, '', 'Infernal Oversouls Wrath targets Summoned Old God'),
(13, 1, 37281, 0, 3, 31, 0, 3, 22146, 0, 0, 0, 0, '', 'Infernal Oversouls Wrath targets Summoning Voidstorm');


-- Subdue the Subduer - [A][H] http://www.wowhead.com/quest=11090/subdue-the-subduer

SET @SUBDUER := 22357;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=@SUBDUER;
DELETE FROM smart_scripts WHERE `entryorguid`=@SUBDUER AND `source_type`=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SUBDUER,0,0,0,0,0,100,0,7000,8000,30000,30000,11,41281,0,0,0,0,0,2,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Cast 'Cripple'"),
(@SUBDUER,0,1,0,0,0,100,0,1000,2000,7000,8000,11,41280,0,0,0,0,0,2,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Cast 'Shadow Bolt'"),
(@SUBDUER,0,2,0,6,0,100,0,0,0,0,0,15,11090,0,0,0,0,0,7,0,0,0,0,0,0,0,"Reth'hedron the Subduer - On Just Died - Quest Credit ''"),
(@SUBDUER,0,3,0,0,0,100,1,0,0,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 0 (No Repeat)"),
(@SUBDUER,0,4,0,0,0,100,1,5000,10000,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 1 (No Repeat)"),
(@SUBDUER,0,5,0,0,0,100,1,15000,20000,0,0,1,2,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 2 (No Repeat)"),
(@SUBDUER,0,6,0,2,0,100,1,0,3,0,0,1,3,4000,0,0,0,0,0,0,0,0,0,0,0,0,"Reth'hedron the Subduer - Between 0-3% Health - Say Line 3 (No Repeat)");

DELETE FROM creature_text WHERE entry=@SUBDUER;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES 
    (@SUBDUER, 0, 0, 'I WILL CRUSH YOU LIKE A GNAT!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 1, 0, 'What do you hope to accomplish from this, insect?', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 2, 0, 'You are making me angry, mortal!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 3, 0, 'You will regret this, mortal! Reth\'hedron will return... I will have my vengeance!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer");


-- The Soul Cannon of Reth'hedron - [A][H] http://www.wowhead.com/quest=11089/the-soul-cannon-of-rethhedron

SET @ELEMENTAL := 23100;
SET @SARTHIS := 23093;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8725);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (15, 8725, 1, 0, 0, 9, 0, 11089, 0, 0, 0, 0, 0, '', 'Only show gossip if quest taken.'),
    (15, 8725, 1, 0, 0, 29, 0, @ELEMENTAL, 100, 0, 1, 0, 0, '', 'Only show gossip if Flawless Arcane Elemental isn\'t summoned.');

DELETE FROM gossip_menu_option WHERE menu_id=8725;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES
    (8725, 1, 0, 'I am an envoy of Balthas. He has sent me to collect a flawless arcane essence.', 21627, 1, 1, 0, 0, 0, 0, '', 0);

UPDATE creature_template SET gossip_menu_id=8725, AIName="SmartAI" WHERE entry=@SARTHIS;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@SARTHIS;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SARTHIS, 0, 0, 1, 62, 0, 100, 0, 8725, 1, 0, 0, 11, 40134, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sarthis Gossip select Cast Summon Arcane Elemental'),
    (@SARTHIS, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sarthis On Gossip Select - Close Gossip');

DELETE FROM npc_text WHERE ID=11030;
INSERT INTO npc_text (ID, text0_0, text0_1, BroadcastTextID0, lang0, Probability0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, text1_0, text1_1, BroadcastTextID1, lang1, Probability1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, text2_0, text2_1, BroadcastTextID2, lang2, Probability2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, text3_0, text3_1, BroadcastTextID3, lang3, Probability3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, text4_0, text4_1, BroadcastTextID4, lang4, Probability4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, text5_0, text5_1, BroadcastTextID5, lang5, Probability5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, text6_0, text6_1, BroadcastTextID6, lang6, Probability6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, text7_0, text7_1, BroadcastTextID7, lang7, Probability7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5, VerifiedBuild)
VALUES
    (11030, 'What is it that you want?', '', 21626, 0, 1, 0, 6, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

DELETE FROM gossip_menu WHERE entry=8725 AND text_id=11030;
INSERT INTO gossip_menu (entry, text_id)
VALUES
    (8725, 11030);

DELETE FROM event_scripts WHERE id=14860;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, dataint, x, y, z, o)
VALUES
    (14860, 0, 10, @ELEMENTAL, 300000, 1, -2468.7, 4700.5, 155.82, 3.0);

UPDATE creature_template SET faction=14 WHERE entry=@ELEMENTAL;


-- What Illidan Wants, Illidan Gets... - [A][H] http://www.wowhead.com/quest=10577/what-illidan-wants-illidan-gets

DELETE FROM creature WHERE id=22102 AND guid IN(86101, 86102);

-- Quest The Fel and the Furious - 10612/10613
DELETE FROM `gameobject` WHERE `id` IN (185061, 185060, 185059);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(2134307, 185061, 530, 0, 0, 1, 1, -2672.43, 2691.78, 102.398, 2.5635, 0, 0, 0.958516, 0.285037, 300, 0, 1),
(2134308, 185060, 530, 0, 0, 1, 1, -2671, 2694.73, 102.581, 2.57921, 0, 0, 0.960726, 0.2775, 300, 0, 1),
(2134309, 185059, 530, 0, 0, 1, 1, -2668.99, 2698.53, 102.662, 2.69388, 0, 0, 0.975048, 0.221992, 300, 0, 1);

DELETE FROM `spell_scripts` WHERE `id` IN (38002, 38120, 38122, 38125, 38127, 38129);
INSERT INTO `spell_scripts` (`id`,`effindex`,`delay`,`command`,`datalong`,`datalong2`) VALUES
(38002,0,0,15,38003,2),
(38120,0,0,15,38121,2),
(38122,0,0,15,38123,2),
(38125,0,0,15,38126,2),
(38127,0,0,15,38128,2),
(38129,0,0,15,38130,2);

UPDATE `creature_template` SET `AIName`='PetAI',`unit_flags`=0, `ScriptName`='npc_fel_reaver', `spell1`=38488 WHERE `entry`=21949;

-- spellconditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (38003, 38121, 38123, 38126, 38128, 38130);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,38003,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38121,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38123,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38126,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38128,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38130,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller');

-- assign scriptname
DELETE FROM `spell_script_names` WHERE `spell_id`=38054;
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(38054, 'spell_random_rocket_missile');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=38054;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 38054, 0, 0, 31, 0, 5, 184979, 0, 0, 0, 0, '', 'Rdm Rocket - only targets Deathforged Infernal');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=38055;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(38055, 38054, 0, 'Destroy Deathforged Infernal - Random Rocket Missile');

UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=184979;
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=184979;

-- Hordequestaccept Text
-- Nakansi SAI
SET @ENTRY := 21789;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,10613,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nakansi - On Quest 'The Fel and the Furious' Taken - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=21789;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(21789, 0, 0, 'I''ve rigged a few control consoles down the slope. Get to one quickly and take control of the fel reaver! You''ll only have a limited amount of time.', 12, 0, 100, 0, 0, 0, 19666, 'Nakansi');

-- Factionupdate
UPDATE `creature_template` SET `faction`=84 WHERE  `entry`=19353;
UPDATE `creature_template` SET `faction`=14 WHERE  `entry` IN (21949, 21753);
UPDATE `creature_template` SET `faction`=90 WHERE  `entry` IN (21960, 21961, 21754);

-- DB/Quest: The summoning Chamber http://www.wowhead.com/quest=10602 (H) http://www.wowhead.com/quest=10585 (A)
UPDATE `event_scripts` SET `x`=-3367.8251, `y`=2143.94848, `z`=-8.2855, `o`=0.1641 WHERE  `id`=13980;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=37285;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(17,0,37285,0,0,29,0,21735,100,0,0,"","Do not cast 'Disrupt Summoning Ritual' near Infernal Oversoul", 1),
(17,0,37285,0,0,29,0,21210,50,0,0,"","Cast 'Disrupt Summoning Ritual' only near Invis Deathforge Caster", 0);
 
 
/* 
*/ 
-- -------------------------------------------
-- TEROKKAR FOREST
-- -------------------------------------------


-- Skywing -- http://wotlk.openwow.com/quest=10898
DELETE FROM `script_waypoint` WHERE `entry`=22424;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(22424, 1, -3620.54, 4164.57, 1.81, 0, 'SKYWING_START'),
(22424, 2, -3624.78, 4149.65, 7.44, 0, ''),
(22424, 3, -3630.3, 4124.84, 21.28, 0, ''),
(22424, 4, -3629.14, 4093.65, 44.35, 0, ''),
(22424, 5, -3626.34, 4080.29, 52.39, 0, ''),
(22424, 6, -3619.35, 4063.86, 60.86, 3000, 'SAY_SKYWING_TREE_DOWN'),
(22424, 7, -3615.09, 4054.17, 62.46, 0, ''),
(22424, 8, -3611.39, 4046.6, 65.07, 0, ''),
(22424, 9, -3606.68, 4040.5, 66, 0, ''),
(22424, 10, -3600.88, 4038.69, 67.14, 0, ''),
(22424, 11, -3597.88, 4033.84, 68.53, 0, ''),
(22424, 12, -3602.19, 4027.89, 69.36, 0, ''),
(22424, 13, -3609.85, 4028.37, 70.78, 0, ''),
(22424, 14, -3613.01, 4031.1, 72.14, 0, ''),
(22424, 15, -3613.18, 4035.63, 73.52, 0, ''),
(22424, 16, -3609.84, 4039.73, 75.25, 0, ''),
(22424, 17, -3604.55, 4040.12, 77.01, 0, ''),
(22424, 18, -3600.61, 4036.03, 78.84, 0, ''),
(22424, 19, -3602.63, 4029.99, 81.01, 0, ''),
(22424, 20, -3608.87, 4028.64, 83.27, 0, ''),
(22424, 21, -3612.53, 4032.74, 85.24, 0, ''),
(22424, 22, -3611.08, 4038.13, 87.31, 0, ''),
(22424, 23, -3605.09, 4039.35, 89.55, 0, ''),
(22424, 24, -3601.87, 4035.44, 91.64, 0, ''),
(22424, 25, -3603.08, 4030.58, 93.66, 0, ''),
(22424, 26, -3608.47, 4029.23, 95.91, 0, ''),
(22424, 27, -3611.68, 4033.35, 98.09, 0, ''),
(22424, 28, -3609.51, 4038.25, 100.45, 0, ''),
(22424, 29, -3604.54, 4038.01, 102.72, 0, ''),
(22424, 30, -3602.4, 4033.48, 105.12, 0, ''),
(22424, 31, -3606.17, 4029.69, 107.63, 0, ''),
(22424, 32, -3609.93, 4031.26, 109.53, 0, ''),
(22424, 33, -3609.38, 4035.86, 110.67, 0, ''),
(22424, 34, -3603.58, 4043.03, 112.89, 0, ''),
(22424, 35, -3600.99, 4046.49, 111.81, 0, ''),
(22424, 36, -3602.32, 4051.77, 111.81, 3000, 'SAY_SKYWING_TREE_UP'),
(22424, 37, -3609.55, 4055.95, 112, 0, ''),
(22424, 38, -3620.93, 4043.77, 111.99, 0, ''),
(22424, 39, -3622.44, 4038.95, 111.99, 0, ''),
(22424, 40, -3621.64, 4025.39, 111.99, 0, ''),
(22424, 41, -3609.62, 4015.2, 111.99, 0, ''),
(22424, 42, -3598.37, 4017.72, 111.99, 0, ''),
(22424, 43, -3590.21, 4026.62, 111.99, 0, ''),
(22424, 44, -3586.55, 4034.13, 112, 0, ''),
(22424, 45, -3580.39, 4033.46, 112, 0, ''),
(22424, 46, -3568.83, 4032.53, 107.16, 0, ''),
(22424, 47, -3554.81, 4031.23, 105.31, 0, ''),
(22424, 48, -3544.39, 4030.1, 106.58, 0, ''),
(22424, 49, -3531.91, 4029.25, 111.7, 0, ''),
(22424, 50, -3523.5, 4030.24, 112.47, 0, ''),
(22424, 51, -3517.48, 4037.42, 112.66, 0, ''),
(22424, 52, -3510.4, 4040.77, 112.92, 0, ''),
(22424, 53, -3503.83, 4041.35, 113.17, 0, ''),
(22424, 54, -3498.31, 4040.65, 113.11, 0, ''),
(22424, 55, -3494.05, 4031.67, 113.11, 0, ''),
(22424, 56, -3487.71, 4025.58, 113.12, 0, ''),
(22424, 57, -3500.42, 4012.93, 113.11, 0, ''),
(22424, 58, -3510.86, 4010.15, 113.1, 0, ''),
(22424, 59, -3518.07, 4008.62, 112.97, 0, ''),
(22424, 60, -3524.74, 4014.55, 112.41, 2000, 'SAY_SKYWING_JUMP'),
(22424, 61, -3537.81, 4008.59, 92.53, 0, ''),
(22424, 62, -3546.25, 4008.81, 92.79, 0, ''),
(22424, 63, -3552.07, 4006.48, 92.84, 0, ''),
(22424, 64, -3556.29, 4000.14, 92.92, 0, ''),
(22424, 65, -3556.16, 3991.24, 92.92, 0, ''),
(22424, 66, -3551.48, 3984.28, 92.91, 0, ''),
(22424, 67, -3542.9, 3981.64, 92.91, 0, ''),
(22424, 68, -3534.82, 3983.98, 92.92, 0, ''),
(22424, 69, -3530.58, 3989.91, 92.85, 0, ''),
(22424, 70, -3529.85, 3998.77, 92.59, 0, ''),
(22424, 71, -3534.15, 4008.45, 92.34, 0, ''),
(22424, 72, -3532.87, 4012.97, 91.64, 0, ''),
(22424, 73, -3530.57, 4023.42, 86.82, 0, ''),
(22424, 74, -3528.24, 4033.91, 85.69, 0, ''),
(22424, 75, -3526.22, 4043.75, 87.26, 0, ''),
(22424, 76, -3523.84, 4054.29, 92.42, 0, ''),
(22424, 77, -3522.44, 4059.06, 92.92, 0, ''),
(22424, 78, -3514.26, 4060.72, 92.92, 0, ''),
(22424, 79, -3507.76, 4065.21, 92.92, 0, ''),
(22424, 80, -3503.24, 4076.63, 92.92, 0, 'SAY_SKYWING_SUMMON'),
(22424, 81, -3504.23, 4080.47, 92.92, 7000, 'SPELL_TRANSFORM'),
(22424, 82, -3504.23, 4080.47, 92.92, 20000, 'SAY_SKYWING_END');

DELETE FROM `creature_text` WHERE `entry`=22424;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(22424, 0, 0, '%s squawks and heads toward Veil Shalas. Hurry and follow!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 1, 0, '%s pauses briefly before the tree and then heads inside.', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 2, 0, '%s seems to be looking for something. He wants you to follow.', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 3, 0, '%s flies to the platform below! You\'d better jump if you want to keep up. Hurry!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 4, 0, '%s bellows a loud squawk!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 5, 0, 'Free at last from that horrible curse! Thank you! Please send word to Rilak the Redeemed that I am okay. My mission lies in Skettis. Terokk must be defeated!', 12, 0, 100, 0, 0, 0, 'SKYWING');

UPDATE `creature_template` SET `ScriptName`='npc_bird_skywing' WHERE  `entry`=22424;

-- Luanga the Imprisoner
SET @ENTRY := 18533;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32924,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Power of Kran\'aish on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,1000,3000,40000,45000,11,6535,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Lightning Cloud'),
(@ENTRY,0,2,0,0,0,100,0,9000,11000,9000,12000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shock'),
(@ENTRY,0,3,0,0,0,100,0,4000,9000,9000,14000,11,12058,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Chain Lightning');

-- The Stones of Vekh'nir - http://wotlk.openwow.com/quest=10565
DELETE FROM `spell_script_names` WHERE `spell_id`=37172;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(37172, 'spell_q10565_imbue_crystal');


-- Someone Else's Hard Work Pays Off - [A][H] http://www.wowhead.com/quest=10218/someone-elses-hard-work-pays-off

SET @SHAHEEN := 19671;
SET @XIRAXIS := 19666;
SET @LABORER := 19672;
SET @CONTROLPANEL := 183877;

DELETE FROM creature_text WHERE entry IN(@SHAHEEN, @XIRAXIS);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES    
    (@SHAHEEN, 0, 0, 'This should\'t take very long. Just watch my back as I empty these nether collectors.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 1, 0, 'Fantastic! Let\'s move on, shall we?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 2, 0, 'Looking at these energy levels, Shaffar was set to make a killing!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 3, 0, 'That should do it...', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 4, 0, 'Hrm, now where is the next collector?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 5, 0, 'Ah, there it is. Follow me, fleshling.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 6, 0, 'There can\'t be too many more of these collectors. Just keep me safe as I do my job.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 7, 0, 'What do we have here? I thought you said the area was secure? This is now the third attack? If we make it out of here, I will definitely be deducting this from your reward. Now don\'t just stand there, destroy them so I can get to that collector.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 8, 0, 'We\'re close to the exit. I\'ll let you rest for about thirty seconds, but then we\'re out of here.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 9, 0, 'Are you ready to go?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 10, 0, 'Ok break time is OVER. Let\'s go!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 11, 0, 'Oh really? And what might that be?', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 12, 0, 'He was right, you know. I\'ll have to take that tag-line for my own... It\'s not like he\'ll have a use for it anymore!', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 13, 0, 'Thanks and good luck!', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 20, 0, '%s checks to make sure his body is intact.', 16, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 21, 0, 'You made it! Well done, $r. Now if you\'ll excuse me, I have to get the rest of our crew inside.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 22, 0, '%s expertly manipulates the control panel.', 16, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 23, 0, 'Let\'s not waste any time! Take anything that isn\'t nailed down to the floor and teleport directly to Stormspire! Chop chop!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@XIRAXIS, 0, 0, 'Bravo! Bravo! Good show… I couldn\'t convince you to work for me, could I? No, I suppose the needless slaughter of my employees might negatively impact your employment application.', 14, 0, 100, 0, 0, 0, 0, 0, 'Shadow Lord Xiraxis'),
    (@XIRAXIS, 1, 0, 'Your plan was a good one, Sha\'heen, and you would have gotten away with it if not for one thing...', 12, 0, 100, 1, 0, 0, 0, 0, 'Shadow Lord Xiraxis'),
    (@XIRAXIS, 2, 0, 'Never underestimate the other ethereal\'s greed!', 12, 0, 100, 15, 0, 0, 0, 0, 'Shadow Lord Xiraxis');

UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=@CONTROLPANEL;
DELETE FROM smart_scripts WHERE entryorguid=@CONTROLPANEL AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@CONTROLPANEL, 1, 0, 0, 62, 0, 100, 1, 8023, 0, 0, 0, 12, @SHAHEEN, 8, 0, 0, 0, 0, 8, 0, 0, 0, -351.345, -69.7118, -0.875432, 4.34587, 'Ethereal Transporter Control Panel - On Gossip Option 0 Selected - Summon Cryo-Engineer Sha heen'),
    (@CONTROLPANEL, 1, 1, 0, 62, 0, 100, 0, 8023, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ethereal Transporter Control Panel - On Gossip Option 0 Selected - Close Gossip');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SHAHEEN;
UPDATE creature_template SET speed_walk=2, speed_run=3 WHERE entry=@SHAHEEN;
DELETE FROM smart_scripts WHERE entryorguid=@SHAHEEN AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN (@SHAHEEN*100+00,@SHAHEEN*100+01,@SHAHEEN*100+02,@SHAHEEN*100+03,@SHAHEEN*100+04,@SHAHEEN*100+05,@SHAHEEN*100+06,@SHAHEEN*100+07) AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SHAHEEN,0,0,0,37,0,100,0,0,0,0,0,80,@SHAHEEN*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Initialize - Run Script"),
    (@SHAHEEN,0,1,0,17,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Summoned Unit - Store Targetlist"),
    (@SHAHEEN,0,2,0,19,0,100,0,10218,0,0,0,53,0,19671,0,0,0,1,7,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Quest '' Taken - Start Waypoint"),
    (@SHAHEEN,0,3,4,40,0,100,0,1,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 1 Reached - Pause Waypoint"),
    (@SHAHEEN,0,4,0,61,0,100,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 1 Reached - Say Line 0"),
    (@SHAHEEN,0,5,6,40,0,100,0,3,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 3 Reached - Pause Waypoint"),
    (@SHAHEEN,0,6,0,61,0,100,0,3,0,0,0,80,@SHAHEEN*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 3 Reached - Run Script"),
    (@SHAHEEN,0,7,8,40,0,100,0,15,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 15 Reached - Pause Waypoint"),
    (@SHAHEEN,0,8,0,61,0,100,0,15,0,0,0,80,@SHAHEEN*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 15 Reached - Run Script"),
    (@SHAHEEN,0,9,10,40,0,100,0,28,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 28 Reached - Pause Waypoint"),
    (@SHAHEEN,0,10,0,61,0,100,0,28,0,0,0,80,@SHAHEEN*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 28 Reached - Run Script"),
    (@SHAHEEN,0,11,12,40,0,100,0,37,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 37 Reached - Pause Waypoint"),
    (@SHAHEEN,0,12,0,61,0,100,0,37,0,0,0,80,@SHAHEEN*100+04,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 37 Reached - Run Script"),
    (@SHAHEEN,0,13,14,40,0,100,0,52,0,0,0,12,19307,4,120000,0,0,0,8,0,0,0,-20.72,-227.29,0.532,3.14,"Cryo-Engineer Sha'heen - On Waypoint 52 Reached - Summon Creature 'Nexus Terror'"),
    (@SHAHEEN,0,14,0,61,0,100,0,52,0,0,0,12,19307,4,120000,0,0,0,8,0,0,0,-15.28,-218.56,0.4,3.17,"Cryo-Engineer Sha'heen - On Waypoint 52 Reached - Summon Creature 'Nexus Terror'"),
    (@SHAHEEN,0,15,16,40,0,100,0,66,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 66 Reached - Pause Waypoint"),
    (@SHAHEEN,0,16,0,61,0,100,0,66,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 66 Reached - Say Line 7"),
    (@SHAHEEN,0,17,18,40,0,100,0,73,0,0,0,54,40000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 73 Reached - Pause Waypoint"),
    (@SHAHEEN,0,18,0,61,0,100,0,73,0,0,0,80,@SHAHEEN*100+05,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 73 Reached - Run Script"),
    (@SHAHEEN,0,19,0,40,0,100,0,93,0,0,0,80,@SHAHEEN*100+06,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 93 Reached - Run Script"),
    (@SHAHEEN,0,20,0,0,0,100,0,0,1000,3500,4500,11,13901,64,0,0,0,0,2,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - In Combat - Cast 'Arcane Bolt'"),
    (@SHAHEEN,0,21,0,0,0,100,0,7000,10000,13500,24500,11,22938,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - In Combat - Cast 'Arcane Explosion'"),
    (@SHAHEEN,0,22,23,38,0,100,0,2,2,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Say Line 12"),
    (@SHAHEEN,0,23,24,61,0,100,0,2,2,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Say Line 13"),
    (@SHAHEEN,0,24,25,61,0,100,0,2,2,0,0,15,10218,0,0,0,0,0,17,0,100,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Quest Credit ''"),
    (@SHAHEEN,0,25,26,61,0,100,0,2,2,0,0,69,0,0,0,0,0,0,8,0,0,0,-67.82,-21.77,-0.954,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Move To Position"),
    (@SHAHEEN,0,26,0,61,0,100,0,2,2,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Despawn In 6000 ms"),
    (@SHAHEEN*100+00,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Npc Flag "),
    (@SHAHEEN*100+00,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Run Off"),
    (@SHAHEEN*100+00,9,2,0,0,0,100,0,0,0,0,0,1,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 20"),
    (@SHAHEEN*100+00,9,3,0,0,0,100,0,3000,3000,0,0,1,21,0,0,0,0,0,21,40,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 21"),
    (@SHAHEEN*100+00,9,4,0,0,0,100,0,1000,1000,0,0,69,1,0,0,0,0,0,8,0,0,0,-354.75,-65.6,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,5,0,0,0,100,0,3000,3000,0,0,1,22,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 22"),
    (@SHAHEEN*100+00,9,6,0,0,0,100,0,3000,3000,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,7,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-378.07,-48,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,8,0,0,0,100,0,0,0,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,9,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-378.56,-97.69,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,10,0,0,0,100,0,0,0,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,11,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-386.85,-76.48,-0.958,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,12,0,0,0,100,0,500,500,0,0,1,23,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 23"),
    (@SHAHEEN*100+00,9,13,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Npc Flag Questgiver"),
    (@SHAHEEN*100+01,9,0,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+01,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+01,9,2,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+01,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+01,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 1"),
    (@SHAHEEN*100+02,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 2"),
    (@SHAHEEN*100+02,9,1,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+02,9,2,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+02,9,3,0,0,0,100,0,0,0,0,0,12,18315,4,30000,0,1,0,8,0,0,0,-369.96,-137.83,-0.957,4.7,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Theurgist'"),
    (@SHAHEEN*100+02,9,4,0,0,0,100,0,0,0,0,0,12,18312,4,30000,0,1,0,8,0,0,0,-374.96,-137.83,-0.957,4.7,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Spellbinder'"),
    (@SHAHEEN*100+02,9,5,0,0,0,100,0,0,0,0,0,12,18315,4,30000,0,1,0,8,0,0,0,-369.96,-193.83,-0.957,1.57,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Theurgist'"),
    (@SHAHEEN*100+02,9,6,0,0,0,100,0,0,0,0,0,12,18312,4,30000,0,1,0,8,0,0,0,-374.96,-193.83,-0.957,1.57,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Spellbinder'"),
    (@SHAHEEN*100+02,9,7,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+02,9,8,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+02,9,9,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 3"),
    (@SHAHEEN*100+03,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 4"),
    (@SHAHEEN*100+03,9,1,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 5"),
    (@SHAHEEN*100+03,9,2,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8,"Cryo-Engineer Sha'heen - On Script - Set Orientation 0,8"),
    (@SHAHEEN*100+04,9,0,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 6"),
    (@SHAHEEN*100+04,9,1,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+04,9,2,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+04,9,3,0,0,0,100,0,0,0,0,0,12,18311,4,30000,0,1,0,8,0,0,0,-288.02,-184.01,-1.28,0,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Crypt Raider'"),
    (@SHAHEEN*100+04,9,4,0,0,0,100,0,0,0,0,0,12,18313,4,30000,0,1,0,8,0,0,0,-287.41,-187.46,-0.93,0,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Sorcerer'"),
    (@SHAHEEN*100+04,9,5,0,0,0,100,0,0,0,0,0,12,18311,4,30000,0,1,0,8,0,0,0,-234.94,-199.88,-0.95,2,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Crypt Raider'"),
    (@SHAHEEN*100+04,9,6,0,0,0,100,0,0,0,0,0,12,18313,4,30000,0,1,0,8,0,0,0,-232.64,-194.52,-0.95,1.94,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Sorcerer'"),
    (@SHAHEEN*100+04,9,7,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+04,9,8,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+05,9,0,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+05,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+05,9,2,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+05,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+05,9,4,0,0,0,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 8"),
    (@SHAHEEN*100+05,9,5,0,0,0,100,0,0,0,0,0,66,8,0,0,0,0,0,21,40,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Orientation Closest Player"),
    (@SHAHEEN*100+05,9,6,0,0,0,100,0,20000,20000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 9"),
    (@SHAHEEN*100+05,9,7,0,0,0,100,0,9000,9000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 10"),
    (@SHAHEEN*100+06,9,0,0,0,0,100,0,0,0,0,0,12,19666,4,30000,0,1,0,8,0,0,0,-67.82,-21.77,-0.954,4.67,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Shadow Lord Xiraxis'"),
    (@SHAHEEN*100+06,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 0"),
    (@SHAHEEN*100+06,9,2,0,0,0,100,0,5000,5000,0,0,69,1,0,0,0,0,0,8,1,0,0,-67.05,-74.83,-0.81,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+06,9,3,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 1"),
    (@SHAHEEN*100+06,9,4,0,0,0,100,0,7000,7000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 11"),
    (@SHAHEEN*100+06,9,5,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 2"),
    (@SHAHEEN*100+06,9,6,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Data 1 1"),
    (@SHAHEEN*100+06,9,7,0,0,0,100,0,0,0,0,0,2,14,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Faction 14"),
    (@SHAHEEN*100+06,9,8,0,0,0,100,0,500,500,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Start Attacking");

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@LABORER;
DELETE FROM smart_scripts WHERE entryorguid=@LABORER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@LABORER, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - Set Event Phase'),
    (@LABORER, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - No Event Phase Reset'),
    (@LABORER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - Set Emote State'),
    (@LABORER, 0, 3, 4, 60, 1, 100, 257, 13000, 25000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - On Update - Set Emote State'),
    (@LABORER, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - On Update - Evade'),
    (@LABORER, 0, 5, 6, 21, 1, 100, 0, 0, 0, 0, 0, 11, 34442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Just Reached Home - Cast Despawn Consortium Laborer'),
    (@LABORER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Just Reached Home - Despawn');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@XIRAXIS;
DELETE FROM smart_scripts WHERE entryorguid=@XIRAXIS AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@XIRAXIS,0,0,0,54,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Summoned - Set Flags Immune To Players & Immune To NPC's"),
    (@XIRAXIS,0,1,2,38,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Remove Flags Immune To Players & Immune To NPC's"),
    (@XIRAXIS,0,2,3,61,0,100,0,1,1,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Set Faction 14"),
    (@XIRAXIS,0,3,0,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Start Attacking"),
    (@XIRAXIS,0,4,5,6,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,19671,100,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Died - Set Data 2 2"),
    (@XIRAXIS,0,5,0,61,0,100,0,0,0,0,0,15,10218,0,0,0,0,0,17,0,100,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Died - Quest Credit ''");

DELETE FROM waypoints WHERE entry=@SHAHEEN;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@SHAHEEN, 1, -351.789, -69.8332, -0.960246, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 2, -366.06, -71.81, -0.958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 3, -370.07, -72.54, 0.55, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 4, -362.02, -71.05, -0.958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 5, -372.478, -93.9698, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 6, -372.956, -102.076, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 7, -373.017, -113.626, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 8, -372.988, -125.175, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 9, -372.931, -139.675, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 10, -373.605, -151.226, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 11, -377.447, -154.805, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 12, -380.818, -159.285, -0.954232, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 13, -381.165, -164.186, -0.957979, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 14, -379.066, -164.216, -0.113683, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 15, -375.111, -164.235, 0.715806, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 16, -379.775, -164.71, -0.165154, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 17, -382.273, -165.565, -0.958753, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 18, -379.523, -174.58, -0.958753, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 19, -375.329, -184.594, -0.97348, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 20, -373.631, -193.17, -0.962749, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 21, -373.4, -200.517, -0.959759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 22, -373.059, -211.368, -0.959759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 23, -372.674, -223.626, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 24, -362.175, -223.75, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 25, -346.425, -223.679, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 26, -334.183, -223.583, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 27, -322.276, -223.677, -0.958344, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 28, -312.918, -220.998, -0.94947, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 29, -307.607, -213.182, -0.933042, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 30, -301.831, -202.365, -0.97953, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 31, -294.812, -194.082, -0.94909, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 32, -291.029, -189.044, -1.00723, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 33, -284.51, -180.362, -1.33409, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 34, -280.377, -173.049, -1.8534, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 35, -273.836, -161.477, -2.48206, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 36, -267.396, -159.877, -1.79642, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 37, -260.544, -158.374, -1.17304, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 38, -260.4, -160.827, -1.15989, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 39, -254.832, -161.486, -0.953236, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 40, -246.845, -162.432, -0.953236, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 41, -242.399, -164.477, -0.867038, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 42, -240.562, -169.012, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 43, -238.44, -173.021, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 44, -234.175, -181.075, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 45, -228.82, -190.903, -0.953759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 46, -222.477, -197.448, -0.398852, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 47, -217.363, -202.727, 0.287965, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 48, -212.248, -208.005, 0.713021, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 49, -205.189, -215.289, 0.20156, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 50, -198.861, -221.819, -0.729239, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 51, -191.275, -223.174, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 52, -179.389, -223.268, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 53, -174.475, -223.287, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 54, -166.411, -223.319, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 55, -155.911, -223.271, -0.947958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 56, -147.87, -223.209, -0.756992, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 57, -138.064, -223.132, 0.0706656, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 58, -132.457, -223.066, 0.889542, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 59, -125.465, -222.984, 1.3118, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 60, -120.551, -222.945, 0.271436, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 61, -111.458, -222.903, 0.22694, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 62, -101.672, -222.865, -0.578372, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 63, -94.6789, -222.838, -0.67855, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 64, -85.2324, -222.578, -0.392579, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 65, -74.0211, -222.339, -0.169972, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 66, -69.8212, -222.307, -0.225875, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 67, -59.7134, -222.863, 0.121823, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 68, -48.1808, -223.498, -0.118748, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 69, -37.6942, -224.026, -0.370049, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 70, -26.4821, -224.059, 0.183233, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 71, -17.0706, -223.207, 0.688721, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 72, -14.0612, -222.818, 1.01445, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 73, -17.9018, -222.954, 0.620031, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 74, -28.0595, -223.313, 0.0938897, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 75, -38.0775, -221.726, -0.303824, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 76, -48.0824, -220.058, -0.0237211, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 77, -59.6136, -217.254, 0.17109, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 78, -68.7573, -211.4, -0.272352, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 79, -67.9993, -203.035, -0.507698, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 80, -67.8879, -199.887, -0.644729, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 81, -67.7765, -196.739, -1.96199, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 82, -67.5291, -189.75, -1.91727, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 83, -67.2564, -182.048, -1.49876, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 84, -67.2302, -173.313, -0.975207, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 85, -67.2919, -168.063, -0.955841, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 86, -67.4233, -156.871, -0.955752, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 87, -67.5877, -142.865, -0.955752, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 88, -67.476, -131.316, -1.1366, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 89, -67.4755, -120.102, -1.32219, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 90, -67.5068, -112.059, -0.653647, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 91, -67.2435, -105.785, -1.65685, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 92, -66.9464, -97.3905, -1.20982, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 93, -66.5686, -88.659, -1.2151, 'Cryo-Engineer Sha\'heen');


-- The Big Bone Worm - [A][H] http://www.wowhead.com/quest=10930/the-big-bone-worm

DELETE FROM spell_script_names WHERE spell_id=39238;
INSERT INTO spell_script_names VALUES (39238, 'spell_q10929_fumping');

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(13, 17) AND SourceEntry=39246;
INSERT INTO conditions VALUES (17, 0, 39246, 0, 0, 29, 0, 22105, 5, 1, 0, 0, 0, '', 'Requires Dead Clefthoof');
INSERT INTO conditions VALUES (13, 4, 39246, 0, 0, 31, 0, 3, 22105, 0, 0, 0, 0, '', 'Target Dead Clefthoof');
DELETE FROM spell_script_names WHERE spell_id=39246;
INSERT INTO spell_script_names VALUES (39246, 'spell_q10930_big_bone_worm');
DELETE FROM creature_template_addon WHERE entry IN(22038, 22482);
INSERT INTO creature_template_addon
VALUES
    (22038, 0, 0, 9, 0, 0, ''),
    (22482, 0, 0, 9, 0, 0, '');

UPDATE creature_template SET modelid1=11686, mechanic_immune_mask=mechanic_immune_mask|0x20, flags_extra=0x200000, AIName='SmartAI', ScriptName='' WHERE entry IN(22038, 22482);
DELETE FROM smart_scripts WHERE entryorguid IN(22038, 22482) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22038, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Set Unit Flag'),
    (22038, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Remove Unit Flag'),
    (22038, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Cast Tunnel Bore Passive'),
    (22038, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Unit Flag'),
    (22038, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Set Unit Flag'),
    (22038, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22038, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Stop Motion'),
    (22038, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20746, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Change Model'),
    (22038, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Remove Bytes0'),
    (22038, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Cast Bore'),
    (22038, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - Within Range 5-50yd - Cast Poison'),
    (22038, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Evade - Despawn'),
    (22482, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Set Unit Flag'),
    (22482, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Remove Unit Flag'),
    (22482, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Cast Tunnel Bore Passive'),
    (22482, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Unit Flag'),
    (22482, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Set Unit Flag'),
    (22482, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22482, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Stop Motion'),
    (22482, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20617, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Change Model'),
    (22482, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Remove Bytes0'),
    (22482, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Cast Bore'),
    (22482, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - Within Range 5-50yd - Cast Poison'),
    (22482, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Evade - Despawn');

DELETE FROM creature_text WHERE entry=22483;
INSERT INTO creature_text VALUES (22483, 0, 0, 'AHHHHHH-YAAA-YAAA-YAAA!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 1, 'AYYAYAAYAA!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 2, 'AAAAAAAAEEEEEEEEEE!!!!!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=22483;
DELETE FROM smart_scripts WHERE entryorguid=22483 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22483, 0, 0, 1, 25, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Say Line 0'),
    (22483, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Attack Start');


-- Terokk's Downfall - [A][H] http://www.wowhead.com/quest=11073/terokks-downfall

SET @TEROKK := 21838;
SET @SKYGUARD := 23377;
SET @TARGET := 23277;
SET @SKULLPIE := 185928;

UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@SKULLPIE;
DELETE FROM gossip_menu_option WHERE menu_id=8687;
INSERT INTO gossip_menu_option VALUES(8687, 1, 0, "<Call forth Terokk.>", 0, 1, 1, 0, 0, 0, 0, "", 0);

DELETE FROM event_scripts WHERE id=15014;
INSERT INTO event_scripts VALUES(15014, 4, 10, @TEROKK, 600000, 1, -3788, 3509, 287, 5.7);

DELETE FROM smart_scripts WHERE entryorguid=@SKULLPIE AND source_type=1;
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 0, 1, 62, 0, 100, 0, 8687, 1, 0, 0, 85, 41004, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon');
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon - linked close gossip');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8687);

DELETE FROM creature_text WHERE entry=@TEROKK;
INSERT INTO creature_text VALUES (@TEROKK, 0, 0, "Who calls me to this world? The stars are not yet aligned... my powers fail me! You will pay for this!", 12, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 1, 0, "You cannot kill me, I am immortal!", 14, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 2, 0, "%s becomes enraged as his shield shatters.", 41, 0, 100, 0, 0, 0, 0, 0, 'Terokk');

DELETE FROM smart_scripts WHERE entryorguid=@TEROKK AND source_type=0;
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 0, 0, 0, 0, 100, 0, 4000, 7000, 10000, 15000, 11, 40721, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Shadow Bolt Volley'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 1, 0, 0, 0, 100, 0, 6000, 9000, 7000, 9000, 11, 15284, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Cleave'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 2, 3, 2, 0, 100, 1, 0, 30, 120000, 120000, 11, 40733, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Cast 'Divine Shield' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Say Line 0 (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Set Data");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 5, 6, 23, 0, 100, 0, 40657, 1, 600000, 600000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Talk 2");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 28747, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Cast Frenzy");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 40733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Remove Aura Divine Shield");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 8, 0, 6, 0, 100, 1, 0, 0, 0, 0, 11, 40722, 7, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Just Died - Cast 'Will of the Arakkoa God' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 9, 10, 4, 0, 100, 1, 0, 0, 0, 0, 12, @SKYGUARD, 3, 240000, 0, 0, 0, 8, 0, 0, 0, -3771.60, 3499.32, 317.88, 2.5, "Terokk - On Aggro - Summon Creature");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Aggro - Talk Target 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 11, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Respawn - Talk 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 12, 13, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Evade - Remove All Auras");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Evade - Despawn Target");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 14, 0, 60, 0, 100, 1, 0, 0, 0, 0, 11, 39579, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Update - Cast Shadowform");

DELETE FROM creature_text WHERE entry=@SKYGUARD;
INSERT INTO creature_text VALUES (@SKYGUARD, 0, 0, "Enemy sighted! Fall into formation and prepare for bombing maneuvers!", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');
INSERT INTO creature_text VALUES (@SKYGUARD, 1, 0, "Quickly! Use the flames and support ground troops. Its ancient magic should cleanse Terokk's shield.", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40657;
INSERT INTO conditions VALUES(13, 6, 40657, 0, 0, 31, 0, 3, @TARGET, 0, 0, 0, 0, '', 'Requires Skyguard Target');

DELETE FROM creature_template_addon WHERE entry IN(@SKYGUARD,@TARGET);
INSERT INTO creature_template_addon VALUES (@SKYGUARD, 0, 21152, 0, 1, 0, '');
INSERT INTO creature_template_addon VALUES (@TARGET, 0, 0, 0, 1, 0, '40656');

UPDATE creature_template SET InhabitType=4, AIName='NullCreatureAI', ScriptName='', flags_extra=128 WHERE entry=@TARGET;
UPDATE creature_template SET faction=1856, InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=@SKYGUARD;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Update - Despawn");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 1, 2, 38, 0, 100, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Talk 1");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SKYGUARD*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Start Script");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 1, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 3, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 5, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 6, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 7, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 9, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 10, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 11, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@SKYGUARD;
INSERT INTO conditions VALUES(22, 1, @SKYGUARD, 0, 0, 29, 1, @TEROKK, 100, 0, 1, 0, 0, '', 'Run action if no npc nearby');


-- Discovering Your Roots - [A][H] http://www.wowhead.com/quest=11520/discovering-your-roots
-- Rediscovering Your Roots - [A][H] http://www.wowhead.com/quest=11521/rediscovering-your-roots

DELETE FROM spell_script_names WHERE spell_id=44935;
INSERT INTO spell_script_names (spell_id, ScriptName)
VALUES
    (44935, 'spell_q11520_discovering_your_roots');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=44941;
INSERT INTO conditions VALUES (13, 1, 44941, 0, 0, 31, 0, 5, 187073, 0, 0, 0, 0, '', 'Target Razorthorn Dirt Mound');


-- Escape from Skettis - [A][H] http://www.wowhead.com/quest=11085/escape-from-skettis

SET @PRISONER := 23383;
UPDATE quest_template_addon SET SpecialFlags=3 WHERE Id=11085;

DELETE FROM creature WHERE id=@PRISONER;
DELETE FROM creature WHERE id=@PRISONER and guid=12548;
INSERT INTO creature VALUES (12548, @PRISONER, 530, 0, 0, 1, 1, 0, 0, -4106.62, 3029.94, 344.877, 0.827394, 300, 0, 0, 6986, 0, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=@PRISONER;
INSERT INTO creature_text VALUES(@PRISONER, 0, 0, "Thanks for your help. Let's get out of here!", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 1, 0, "Let's keep moving. I don't like this place.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 2, 0, "Thanks again. Sergeant Doryn will be glad to hear he has one less scout to replace this week.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');

UPDATE creature_template SET speed_run=1, AIName='SmartAI' WHERE entry=@PRISONER;
DELETE FROM smart_scripts WHERE entryorguid=@PRISONER AND source_type=0;
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 0, 1, 19, 0, 100, 0, 11085, 0, 0, 0, 53, 0, @PRISONER, 0, 11085, 5000, 2, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Start WP');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 15, 185952, 10, 0, 0, 0, 0, 0, 'On Quest Accept - Activate GO');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 2, 3, 40, 0, 100, 0, 1, 0, 0, 0, 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Pause Path');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 4, 0, 25, 0, 30, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 5, 6, 40, 0, 100, 0, 22, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Despawn');

DELETE FROM waypoints WHERE entry=@PRISONER;
INSERT INTO waypoints 
VALUES 
    (@PRISONER, 1, -4108.06, 3031.46, 344.879, 'Skyguard Prisoner'),
    (@PRISONER, 2, -4110.58, 3034.34, 344.121, 'Skyguard Prisoner'),
    (@PRISONER, 3, -4116.37, 3033.79, 344.083, 'Skyguard Prisoner'),
    (@PRISONER, 4, -4122.83, 3027.09, 344.149, 'Skyguard Prisoner'),
    (@PRISONER, 5, -4126.33, 3027.21, 344.158, 'Skyguard Prisoner'),
    (@PRISONER, 6, -4128.94, 3026.88, 344.021, 'Skyguard Prisoner'),
    (@PRISONER, 7, -4135.6, 3028.52, 339.992, 'Skyguard Prisoner'),
    (@PRISONER, 8, -4144.75, 3030.27, 337.474, 'Skyguard Prisoner'),
    (@PRISONER, 9, -4157.26, 3032.66, 337.446, 'Skyguard Prisoner'),
    (@PRISONER, 10, -4171.01, 3035.29, 342.801, 'Skyguard Prisoner'),
    (@PRISONER, 11, -4172.98, 3035.67, 343.267, 'Skyguard Prisoner'),
    (@PRISONER, 12, -4175.09, 3039.7, 343.64, 'Skyguard Prisoner'),
    (@PRISONER, 13, -4176.68, 3049.94, 344.072, 'Skyguard Prisoner'),
    (@PRISONER, 14, -4182.15, 3056.03, 344.146, 'Skyguard Prisoner'),
    (@PRISONER, 15, -4185.25, 3060.86, 344.157, 'Skyguard Prisoner'),
    (@PRISONER, 16, -4184.97, 3062.4, 344.152, 'Skyguard Prisoner'),
    (@PRISONER, 17, -4183.71, 3065.44, 342.625, 'Skyguard Prisoner'),
    (@PRISONER, 18, -4181.35, 3071.13, 336.977, 'Skyguard Prisoner'),
    (@PRISONER, 19, -4179.91, 3079.19, 329.741, 'Skyguard Prisoner'),
    (@PRISONER, 20, -4178.71, 3085.91, 325.563, 'Skyguard Prisoner'),
    (@PRISONER, 21, -4178.18, 3088.9, 324.177, 'Skyguard Prisoner'),
    (@PRISONER, 22, -4175.07, 3094.67, 323.426, 'Skyguard Prisoner');
 
 
/* 
*/ 
-- -------------------------------------------
-- ZANGARMARSH
-- -------------------------------------------


-- Fhwoor Smash! - [A][H] http://www.wowhead.com/quest=9729/fhwoor-smash

SET @FHWOOR := 17877;
DELETE FROM creature_text WHERE entry=@FHWOOR;

INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES 
    (@FHWOOR, 0, 0, 'Fhwoor go now, $N. Get ark, come back.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 1, 0, 'Take moment... Get ready.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 2, 0, 'Uh oh...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 3, 0, 'Fhwoor do good!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor');

DELETE FROM waypoints WHERE entry=@FHWOOR;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@FHWOOR, 1, 231.403, 8479.94, 17.9319, 'Fhwoor'),
    (@FHWOOR, 2, 215.654, 8469.71, 22.7522, 'Fhwoor'),
    (@FHWOOR, 3, 207.395, 8459.58, 25.083, 'Fhwoor'),
    (@FHWOOR, 4, 197.541, 8444.16, 24.9263, 'Fhwoor'),
    (@FHWOOR, 5, 188.792, 8428.69, 22.4734, 'Fhwoor'),
    (@FHWOOR, 6, 183.095, 8419.25, 23.4617, 'Fhwoor'),
    (@FHWOOR, 7, 170.883, 8406.63, 21.95, 'Fhwoor'),
    (@FHWOOR, 8, 167.028, 8394.64, 23.6626, 'Fhwoor'),
    (@FHWOOR, 9, 168.177, 8383.75, 20.5654, 'Fhwoor'),
    (@FHWOOR, 10, 171.686, 8359.03, 19.8141, 'Fhwoor'),
    (@FHWOOR, 11, 177.082, 8326.46, 20.7596, 'Fhwoor'),
    (@FHWOOR, 12, 170.066, 8301.61, 20.8413, 'Fhwoor'),
    (@FHWOOR, 13, 174.167, 8290.19, 18.5382, 'Fhwoor'),
    (@FHWOOR, 14, 192.921, 8262.22, 18.615, 'Fhwoor'),
    (@FHWOOR, 15, 211.22, 8245.58, 22.2009, 'Fhwoor'),
    (@FHWOOR, 16, 226.538, 8231.74, 20.0313, 'Fhwoor'),
    (@FHWOOR, 17, 239.977, 8219.84, 20.8419, 'Fhwoor'),
    (@FHWOOR, 18, 252.502, 8210.68, 18.7755, 'Fhwoor'),
    (@FHWOOR, 19, 271.605, 8205.75, 19.6679, 'Fhwoor'),
    (@FHWOOR, 20, 283.234, 8202.8, 22.1166, 'Fhwoor'),
    (@FHWOOR, 21, 318.232, 8180.02, 18.1585, 'Fhwoor'),
    (@FHWOOR, 22, 335.458, 8177.15, 18.1603, 'Fhwoor'),
    (@FHWOOR, 23, 352.245, 8180.53, 18.4126, 'Fhwoor'),
    (@FHWOOR, 24, 367.487, 8185.88, 22.213, 'Fhwoor'),
    (@FHWOOR, 25, 376.03, 8188.09, 23.8872, 'Fhwoor'),
    (@FHWOOR, 26, 387.559, 8188.89, 21.8357, 'Fhwoor'),
    (@FHWOOR, 27, 399.78, 8183.96, 18.2193, 'Fhwoor'),
    (@FHWOOR, 28, 413.746, 8171.34, 18.2933, 'Fhwoor'),
    (@FHWOOR, 29, 426.026, 8158.55, 19.1386, 'Fhwoor'),
    (@FHWOOR, 30, 444.048, 8152.09, 23.3402, 'Fhwoor'),
    (@FHWOOR, 31, 465.283, 8151.99, 22.213, 'Fhwoor'),
    (@FHWOOR, 32, 482.497, 8150.01, 20.1239, 'Fhwoor'),
    (@FHWOOR, 33, 521.832, 8154.16, 22.3108, 'Fhwoor'),
    (@FHWOOR, 34, 558.243, 8158.7, 23.6964, 'Fhwoor'),
    (@FHWOOR, 35, 550.27, 8161.78, 22.9976, 'Fhwoor'),
    (@FHWOOR, 36, 533.254, 8141.06, 22.2215, 'Fhwoor'),
    (@FHWOOR, 37, 505.911, 8135.08, 19.9296, 'Fhwoor'),
    (@FHWOOR, 38, 473.615, 8128.02, 22.5122, 'Fhwoor'),
    (@FHWOOR, 39, 445.697, 8128.57, 20.4449, 'Fhwoor'),
    (@FHWOOR, 40, 399.292, 8123.93, 18.1522, 'Fhwoor'),
    (@FHWOOR, 41, 363.179, 8107.19, 18.4227, 'Fhwoor'),
    (@FHWOOR, 42, 343.39, 8108.69, 17.3774, 'Fhwoor'),
    (@FHWOOR, 43, 327.772, 8134.22, 18.3628, 'Fhwoor'),
    (@FHWOOR, 44, 313.609, 8144.49, 21.2908, 'Fhwoor'),
    (@FHWOOR, 45, 295.733, 8153.19, 18.3259, 'Fhwoor'),
    (@FHWOOR, 46, 255.729, 8172.25, 17.3989, 'Fhwoor'),
    (@FHWOOR, 47, 242.091, 8178.74, 17.9129, 'Fhwoor'),
    (@FHWOOR, 48, 220.303, 8182.56, 19.5001, 'Fhwoor'),
    (@FHWOOR, 49, 206, 8202.45, 22.1064, 'Fhwoor'),
    (@FHWOOR, 50, 203.072, 8224.38, 25.2776, 'Fhwoor'),
    (@FHWOOR, 51, 200.892, 8237.23, 24.2757, 'Fhwoor'),
    (@FHWOOR, 52, 198.027, 8254.11, 19.9855, 'Fhwoor'),
    (@FHWOOR, 53, 176.841, 8285.87, 18.7444, 'Fhwoor'),
    (@FHWOOR, 54, 178.973, 8300.77, 18.6603, 'Fhwoor'),
    (@FHWOOR, 55, 181.472, 8318.23, 21.679, 'Fhwoor'),
    (@FHWOOR, 56, 184.381, 8335.63, 18.9092, 'Fhwoor'),
    (@FHWOOR, 57, 176.647, 8349.99, 18.6098, 'Fhwoor'),
    (@FHWOOR, 58, 173.367, 8370.8, 18.0483, 'Fhwoor'),
    (@FHWOOR, 59, 185.332, 8389.98, 18.5659, 'Fhwoor'),
    (@FHWOOR, 60, 200.3, 8408.49, 18.8142, 'Fhwoor'),
    (@FHWOOR, 61, 219.306, 8431.98, 20.4219, 'Fhwoor'),
    (@FHWOOR, 62, 227.407, 8442, 22.7788, 'Fhwoor'),
    (@FHWOOR, 63, 229.474, 8466.41, 18.564, 'Fhwoor'),
    (@FHWOOR, 64, 236.484, 8479.62, 18.1411, 'Fhwoor'),
    (@FHWOOR, 65, 246.831, 8482.4, 22.1621, 'Fhwoor'),
    (@FHWOOR, 66, 231.403, 8479.94, 17.9319, 'Fhwoor');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@FHWOOR;
DELETE FROM smart_scripts WHERE entryorguid=@FHWOOR AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@FHWOOR*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@FHWOOR,0,0,1,19,0,100,0,9729,0,0,0,53,1,17877,0,9729,5000,2,7,0,0,0,0,0,0,0,"Fhwoor - On Quest '' Taken - Start Waypoint"),
    (@FHWOOR,0,1,0,61,0,100,0,9729,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fhwoor - On Quest '' Taken - Say Line 0"),
    (@FHWOOR,0,2,0,40,0,100,0,1,0,0,0,54,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 1 Reached - Pause Waypoint"),
    (@FHWOOR,0,3,4,40,0,100,0,20,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Pause Waypoint"),
    (@FHWOOR,0,4,5,61,0,100,0,20,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Say Line 1"),
    (@FHWOOR,0,5,0,61,0,100,0,20,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Set Run Off"),
    (@FHWOOR,0,6,0,40,0,100,0,34,0,0,0,54,13000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 34 Reached - Pause Waypoint"),
    (@FHWOOR,0,7,8,40,0,100,0,48,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Pause Waypoint"),
    (@FHWOOR,0,8,9,61,0,100,0,48,0,0,0,66,2,0,0,0,0,0,8,0,0,0,0,0,0,3.07,"Fhwoor - On Waypoint 48 Reached - Set Orientation 3,07"),
    (@FHWOOR,0,9,10,61,0,100,0,48,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Say Line 2"),
    (@FHWOOR,0,10,11,61,0,100,0,48,0,0,0,12,18154,1,240000,1,0,0,8,0,0,0,198.25,8184.2,22.68,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Ssslith'"),
    (@FHWOOR,0,11,12,61,0,100,0,48,0,0,0,12,18088,1,240000,1,0,0,8,0,0,0,198.18,8180.06,22.92,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Bloodscale Enchantress'"),
    (@FHWOOR,0,12,13,61,0,100,0,48,0,0,0,12,18089,1,240000,1,0,0,8,0,0,0,198.37,8190.78,22.28,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Bloodscale Slavedriver'"),
    (@FHWOOR,0,13,0,61,0,100,0,48,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Set Run On"),
    (@FHWOOR,0,14,15,40,0,100,0,65,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 65 Reached - Pause Waypoint"),
    (@FHWOOR,0,15,0,61,0,100,0,65,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 65 Reached - Set Run Off"),
    (@FHWOOR,0,16,17,40,0,100,0,66,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Set Orientation Home Position"),
    (@FHWOOR,0,17,18,61,0,100,0,66,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Set Run On"),
    (@FHWOOR,0,18,0,61,0,100,0,66,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Say Line 3"),
    (@FHWOOR,0,19,0,56,0,100,0,34,0,0,0,99,3,0,0,0,0,0,20,182082,20,0,0,0,0,0,"Fhwoor - On Waypoint Resumed - Set Lootstate Deactivated"),
    (@FHWOOR,0,20,0,56,0,100,0,65,0,0,0,50,182082,60,0,0,0,0,8,0,0,0,252.56,8479.38,22.975,0,"Fhwoor - On Waypoint Resumed - Summon Gameobject 'The Ark of Ssslith'"),
    (@FHWOOR,0,21,0,0,0,100,0,4000,7000,10000,20000,11,31277,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - In Combat - Cast 'Stomp'"),
    (@FHWOOR,0,22,0,0,0,100,0,11000,12000,15000,25000,11,31964,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - In Combat - Cast 'Thundershock'");


-- Lost in Action - [A][H] http://www.wowhead.com/quest=9738/lost-in-action

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(7520, 7540);
UPDATE creature_template SET AIName='', ScriptName='npc_natrualist_bite' WHERE entry=17893;
DELETE FROM smart_scripts WHERE entryorguid=17893 AND source_type=0;

-- Quest: WANTED: Boss Grog'ak -- http://wotlk.openwow.com/quest=9820
UPDATE `quest_template` SET `AllowableRaces`=690 WHERE  `ID`=9820;

 
 
/* 
*/ 
-- -------------------------------------------
-- CRYSTALSONG FOREST
-- -------------------------------------------

-- Wild Mustard
UPDATE `world`.`gameobject` SET `position_z`='640.996' WHERE  `guid`=57480 AND `id`=192827; 
 
/* 
*/ 
-- Achievement
-- Achiemement - Giggy Up - http://wotlk.openwow.com/achievement=891
-- spell_apprentice_riding
DELETE FROM `spell_script_names` WHERE `spell_id`=33388;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(33388, 'spell_gen_apprentice_riding');
 
 
/* 
*/ 
-- Anti-Magic Shell - Cyclone Immunity
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='48707') AND (`spell_effect`='-33786') AND (`type`='2');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES ('48707', '-33786', '2', 'Anti-Magic Shell (Self) - Cyclone Immunity');#

-- Dancing Rune Weapon - Spell proc flags and pet script
DELETE FROM `spell_proc_event` WHERE `entry`=49028 AND `procFlags`=86096;
INSERT INTO `spell_proc_event` (`entry`, `procFlags`, `procEx`) VALUES
('49028','86096','65536');
UPDATE `creature_template` SET `ScriptName`='npc_pet_dk_dancing_rune_weapon' WHERE  `entry`=27893; 
 
/* 
*/ 

DELETE FROM `spell_script_names` WHERE `spell_id` = 17770;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('17770', 'spell_gen_wolfshead_energy');

-- Nature's Grasp internal cooldown
DELETE FROM `spell_proc_event` WHERE `entry` = -16689;
INSERT INTO `spell_proc_event` (`entry`, `Cooldown`) VALUES ('-16689', '2');

-- Enrage armor reduce
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dru_bear_form_passive';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(1178,'spell_dru_bear_form_passive'),
(9635,'spell_dru_bear_form_passive');

-- Primal Fury
DELETE FROM `spell_custom_attr` WHERE `entry` IN ('16954', '16961');
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('16954', '1048576'),
('16961', '1048576');

-- Force of Nature
DELETE FROM `creature_template_addon` WHERE (`entry`='1964');
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `bytes2`, `auras`) VALUES ('1964', '0', '4097', '50419');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dru_brambles_treant';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('50419', 'spell_dru_brambles_treant');
 
 
/* 
*/ 
-- spell_hun_savagery
DELETE FROM `spell_script_names` WHERE `spell_id`=50871;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(50871, 'spell_hun_savagery');
 
 
/* 
*/ 
 
 
/* 
*/ 
-- Hand of Sacrifice can't be casted on targets with Divine Sacrifice
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=17 AND `SourceEntry`=6940; 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `NegativeCondition`, `ErrorType`, `Comment`) VALUES ('17', '6940', '1', '1', '64205', '1', '173', 'Cant use Hand of Sacrifice while Divine Sacrifice is active');

-- Pursuit of Justice linked mount speed
DELETE FROM spell_linked_spell WHERE spell_trigger IN(26022, 26023, -26022, -26023);
INSERT INTO spell_linked_spell VALUES (26022, 61417, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (26023, 61418, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (-26022, -61417, 0, 'Pursuit of Justice remove');
INSERT INTO spell_linked_spell VALUES (-26023, -61418, 0, 'Pursuit of Justice remove');

-- Judgement of Wisdom
DELETE FROM `spell_proc_event` WHERE (`entry`='20186');
INSERT INTO `spell_proc_event` (`entry`, `ppmRate`) VALUES ('20186', '15');

-- Judgement of Light
DELETE FROM `spell_proc_event` WHERE (`entry`='20185');
INSERT INTO `spell_proc_event` (`entry`, `ppmRate`) VALUES ('20185', '15');

-- Seal of Command
DELETE FROM `spell_proc_event` WHERE (`entry`='20375');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `Cooldown`) VALUES ('20375', '3', '1');

-- Remove bugged spell_scripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (31821, 64364, -20254, -20138, 31869, -53379, 63510, 63514, 63531);

-- Hand of Protection
DELETE FROM `spell_custom_attr` WHERE `entry` IN (1022, 5599, 10278);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('1022', '524288'),
('5599', '524288'),
('10278', '524288');

-- Seal of Command
DELETE FROM `spell_proc_event` WHERE (`entry`='20375');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`) VALUES ('20375', '3');
DELETE FROM spell_script_names WHERE spell_id IN (20375, 20424);
INSERT INTO spell_script_names VALUES (20375, 'spell_pal_seal_of_command');
INSERT INTO spell_script_names VALUES (20424, 'spell_pal_seal_of_command');
 
 
/* 
*/ 
-- Penance (Add Attr SPELL_ATTR0_CU_FORCE_REFLECT)
DELETE FROM `spell_custom_attr` WHERE `entry` IN ('47666', '52998', '52999', '53000');
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('47666', '4194304'),
('52998', '4194304'),
('52999', '4194304'),
('53000', '4194304');
 
 
/* 
*/ 
 
 
/* 
*/ 
 
 
/* 
*/ 
-- Group of Food (Well Fed) and similar buffs
INSERT IGNORE INTO `spell_group` VALUES ('1001', '18125');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '18141');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19705');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19706');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19708');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19709');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19710');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '19711');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '23697');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '24799');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '24870');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '25694');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '25941');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33254');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33256');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33257');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33259');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33261');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33263');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33265');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33268');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '33272');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '35272');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '40323');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '42293');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '43764');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '43771');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44097');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44098');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44099');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44100');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44101');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44102');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44104');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44105');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '44106');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '45245');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '45619');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '46682');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '46687');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '46899');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '53284');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57079');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57097');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57100');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57102');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57107');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57111');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57139');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57286');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57288');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57291');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57294');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57325');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57327');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57329');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57332');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57334');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57356');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57358');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57360');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57363');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57365');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57367');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57371');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57373');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '57399');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '58468');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '58479');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '59230');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '62349');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '64057');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65247');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65365');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65410');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65412');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65414');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65415');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '65416');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '66623');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '69559');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '43722'); -- Enlightened
INSERT IGNORE INTO `spell_group` VALUES ('1001', '43730'); -- Stormchops
-- Rums, falling into Well Fed group
INSERT IGNORE INTO `spell_group` VALUES ('1001', '20875');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '25804');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '25722');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '25037');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '37058');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '22789');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '6114');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '5020');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '5021');
INSERT IGNORE INTO `spell_group` VALUES ('1001', '5257');

-- Group of blessings, warrior shouts (with HP increasing buffs), stack for different casters, effect exclusive COMBINED GROUP
INSERT IGNORE INTO `spell_group` VALUES ('1002', '19740');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '25782');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '6673');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '19742');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '25894');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '20217');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '25898');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '20911');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '25899');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '32770');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '469');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '6307');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '5677');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '56525');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '58054');
INSERT IGNORE INTO `spell_group` VALUES ('1002', '26393');

-- Group of major Armor reducing debuffs
INSERT IGNORE INTO `spell_group` VALUES ('1003', '55749');
INSERT IGNORE INTO `spell_group` VALUES ('1003', '8647');
INSERT IGNORE INTO `spell_group` VALUES ('1003', '58567');

-- Group of minor Armor reducing debuffs (with hit reduce), can stack for different casters, effect exclusive with exclusive flags COMBINED GROUP
INSERT IGNORE INTO `spell_group` VALUES ('1004', '770');
INSERT IGNORE INTO `spell_group` VALUES ('1004', '16857');

-- Group of haste, contains forced stronger buff (use flagged, only 2 spells)
INSERT IGNORE INTO `spell_group` VALUES ('1005', '55610');
INSERT IGNORE INTO `spell_group` VALUES ('1005', '8515');

-- Group of Melee Crit chance increase, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1006', '24932');
INSERT IGNORE INTO `spell_group` VALUES ('1006', '29801');

-- Group of Percent AP increase, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1007', '53137');
INSERT IGNORE INTO `spell_group` VALUES ('1007', '19506');
INSERT IGNORE INTO `spell_group` VALUES ('1007', '30802');

-- Group of Bleed damage increasing auras
INSERT IGNORE INTO `spell_group` VALUES ('1008', '33878');
INSERT IGNORE INTO `spell_group` VALUES ('1008', '33876');
INSERT IGNORE INTO `spell_group` VALUES ('1008', '46856');

-- Group of Spell crit chance buffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1009', '24907');
INSERT IGNORE INTO `spell_group` VALUES ('1009', '51466');

-- Group of Spell crit taken increase debuffs
INSERT IGNORE INTO `spell_group` VALUES ('1010', '22959');
INSERT IGNORE INTO `spell_group` VALUES ('1010', '12579');

-- Group of Spell power increasing buffs
INSERT IGNORE INTO `spell_group` VALUES ('1011', '52109');
INSERT IGNORE INTO `spell_group` VALUES ('1011', '57658');

-- Group of Melee, Range, spell haste buffs (with raid damage done), effect exclusive COMBINED GROUP
INSERT IGNORE INTO `spell_group` VALUES ('1012', '50170');
INSERT IGNORE INTO `spell_group` VALUES ('1012', '63531');
INSERT IGNORE INTO `spell_group` VALUES ('1012', '75593');
INSERT IGNORE INTO `spell_group` VALUES ('1012', '31579');

-- Group of Critical chance taken debuff (all types)
INSERT IGNORE INTO `spell_group` VALUES ('1013', '21183');
INSERT IGNORE INTO `spell_group` VALUES ('1013', '30708');

-- Group of Melee attack time increse debufs, can stack for different casters, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1014', '55095');

-- Group of chance to hit reduce debuffs, can stack for different casters, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1015', '5570');

-- Group of healing taken reduce debuffs
INSERT IGNORE INTO `spell_group` VALUES ('1016', '56112');

-- Group of STR + AGI increasing buffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1018', '8076');
INSERT IGNORE INTO `spell_group` VALUES ('1018', '8115'); -- Agility scroll
INSERT IGNORE INTO `spell_group` VALUES ('1018', '8118'); -- Strength scroll
INSERT IGNORE INTO `spell_group` VALUES ('1018', '57330');

-- Group of INT and/or SPIRIT increasing buffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1019', '1459');
INSERT IGNORE INTO `spell_group` VALUES ('1019', '8096'); -- Intellect scroll
INSERT IGNORE INTO `spell_group` VALUES ('1019', '8112'); -- Spirit scroll
INSERT IGNORE INTO `spell_group` VALUES ('1019', '54424');
INSERT IGNORE INTO `spell_group` VALUES ('1019', '23028');
INSERT IGNORE INTO `spell_group` VALUES ('1019', '14752');
INSERT IGNORE INTO `spell_group` VALUES ('1019', '27681');
INSERT IGNORE INTO `spell_group` VALUES ('1019', '61024'); -- Dalaran Intellect
INSERT IGNORE INTO `spell_group` VALUES ('1019', '61316'); -- Dalaran Brilliance

-- Group of healing recived increasing buffs
INSERT IGNORE INTO `spell_group` VALUES ('1020', '34123');
INSERT IGNORE INTO `spell_group` VALUES ('1020', '63514');

-- Group of physical damage taken reducing buffs
INSERT IGNORE INTO `spell_group` VALUES ('1021', '14893');
INSERT IGNORE INTO `spell_group` VALUES ('1021', '16177');

-- Group of casting speed decreasing debuffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1022', '1714');
INSERT IGNORE INTO `spell_group` VALUES ('1022', '31589');
INSERT IGNORE INTO `spell_group` VALUES ('1022', '5760');

-- Group of Armor + attributes + resistance increasing buffs
INSERT IGNORE INTO `spell_group` VALUES ('1023', '1126');
INSERT IGNORE INTO `spell_group` VALUES ('1023', '21849');
INSERT IGNORE INTO `spell_group` VALUES ('1023', '72588');

-- Group of STA increasing buffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1024', '1243');
INSERT IGNORE INTO `spell_group` VALUES ('1024', '8099'); -- Stamina scroll
INSERT IGNORE INTO `spell_group` VALUES ('1024', '21562');
INSERT IGNORE INTO `spell_group` VALUES ('1024', '72590');

-- Group of shadow resistance increasing buffs
INSERT IGNORE INTO `spell_group` VALUES ('1025', '976');
INSERT IGNORE INTO `spell_group` VALUES ('1025', '27683');

-- Group of Immolate / Unstable Affliction - never stack for same caster
INSERT IGNORE INTO `spell_group` VALUES ('1026', '348');
INSERT IGNORE INTO `spell_group` VALUES ('1026', '30108');

-- Group of amplify / dampen magic - never stack
INSERT IGNORE INTO `spell_group` VALUES ('1027', '604');
INSERT IGNORE INTO `spell_group` VALUES ('1027', '1008');

-- Group of Magic damage taken increasing debuffs, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1028', '1490');
INSERT IGNORE INTO `spell_group` VALUES ('1028', '60431');

-- Group of Apexis buffs, never stack
INSERT IGNORE INTO `spell_group` VALUES ('1029', '40623');
INSERT IGNORE INTO `spell_group` VALUES ('1029', '40625');
INSERT IGNORE INTO `spell_group` VALUES ('1029', '40626');

-- Group of Draenei heroic presence (2 different auras)
INSERT IGNORE INTO `spell_group` VALUES ('1030', '6562');
INSERT IGNORE INTO `spell_group` VALUES ('1030', '28878');

-- Group of Death Wish (Warrior enrages) and DK Hysteria, effect exclusive
INSERT IGNORE INTO `spell_group` VALUES ('1031', '12292');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '49016');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '12880');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '57518');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '57933');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '31884');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '34471');
INSERT IGNORE INTO `spell_group` VALUES ('1031', '48391');

-- Group of Spell Haste Auras
INSERT IGNORE INTO `spell_group` VALUES ('1032', '2825');
INSERT IGNORE INTO `spell_group` VALUES ('1032', '32182');

-- Group of Howling Rage
INSERT IGNORE INTO `spell_group` VALUES ('1033', '7481');
INSERT IGNORE INTO `spell_group` VALUES ('1033', '7483');
INSERT IGNORE INTO `spell_group` VALUES ('1033', '7484');
 
 
/* 
*/ 
-- Health Funnel
DELETE FROM `spell_bonus_data` WHERE `entry` IN (755, 3698, 3699, 3700, 11693, 11694, 11695, 27259, 47856);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
(755, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3698, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3699, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3700, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11693, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11694, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11695, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(27259, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(47856, 0, 0.548, 0, 0, 'Warlock - Health Funnel');
 
 
/* 
*/ 
-- spell_warr_intervene
DELETE FROM `spell_script_names` WHERE  `spell_id` IN (3411);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(3411, 'spell_warr_intervene');

-- Warrior Enrage
DELETE FROM `spell_script_names` WHERE (`ScriptName`='spell_warr_enrage');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-12317, 'spell_warr_enrage'),
(-46867, 'spell_warr_enrage'),
(-29593, 'spell_warr_enrage');

-- Warrior Revenge
DELETE FROM `spell_script_names` WHERE (`ScriptName`='spell_warr_revenge');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (-6572, 'spell_warr_revenge');

 
 
/* 
*/ 
-- 'Carrot on a stick' 
SET @SPELL := 48402; -- new spell which actually do not have those dummy effects mentioned in the ticket
DELETE FROM spell_script_names WHERE spell_id = @SPELL;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(@SPELL, 'spell_item_carrot_on_a_stick');
UPDATE item_template SET spellid_1 = @SPELL WHERE entry = 11122; -- Item spell needs to be updated
 
 
