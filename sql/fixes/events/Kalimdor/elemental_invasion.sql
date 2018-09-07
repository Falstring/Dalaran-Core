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
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@BARON,@BARON*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BARON, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - On Respawn - Say Line 0'),
(@BARON, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - OOC - Say Line 1'),
(@BARON, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0,  1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - On Death - Say Line 2'),
(@BARON, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 15, @GOFER, 1000, 0, 0, 0, 0, 0, 'Baron Charr - On Death - Remove All Fire Elemental Rifts'),
(@BARON, 0, 4, 0, 0, 0, 100, 0, 3000, 6000, 8000, 11000, 11, 15285, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - IC - Cast Fireball Volley'),
(@BARON, 0, 5, 0, 0, 0, 100, 0, 0, 0, 10000, 16000, 11, 9574, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - IC - Cast Flame Buffet'),
(@BARON, 0, 6, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @BARON*10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Charr - On Death - Run Script'),
(@BARON, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),
(@BARON, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @BLAZINV, 1, 0, 0, 0, 0, 'Baron Charr - On Respawn - Respawn Blazing Invader'),

(@BARON*10, 9, 0, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7115.23, -1303.52, -186.023, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 1, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7159.79, -1340.77, -184.387, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 2, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7172.53, -1282.03, -184.389, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 3, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7271.34, -1205.2, -241.216, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 4, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7305.77, -1314.89, -240.622, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 5, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7239.31, -1408.76, -232.555, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 6, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7207.49, -1452.04, -231.648, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 7, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7170.79, -1478.02, -265.446, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 8, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7132.25, -1435.83, -265.447, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 9, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7030.19, -1449.66, -262.58, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 10, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7019.3, -1269.13, -269.652, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 11, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7045.36, -1199.41, -267.884, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 12, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7106.72, -1120.15, -266.057, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 13, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7202.57, -1124.08, -266.719, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 14, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7074.14, -1420.95, -234.381, 0, 'Baron Charr - Script - Summon Fire Elemental Rift'),
(@BARON*10, 9, 15, 0, 0, 0, 100, 1, 290000, 300000, 0, 0, 50, @GOFER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -7109.12, -1481.67, -247.611, 0, 'Baron Charr - Script - Summon Fire Elemental Rift');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `ConditionTypeOrReference`=36 AND `SourceEntry`=@BARON;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 4, @BARON, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'If Baron Charr Dead - GOs dont spawn');

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
(@GUID, @AVALA, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 250000, 0, 0, 14335, 0, 2, 0, 0, 0, 0),
(@GUID+1, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+2, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+3, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0),
(@GUID+4, @THUINV, 1, 0, 0, 1, 1, 0, 0, 4534.96, -7400.33, 88.4305, 1.06, 1000000, 0, 0, 2784, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=@AVALA;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@AVALA, 0, 0, 'Tiny mortals - me HERE! Doom you meet!', 14, 0, 100, 0, 0, 0, 9658, 2, 'Avalanchion Spawn'),
(@AVALA, 1, 0, 'You be too scared!  Me find you!', 14, 0, 100, 0, 0, 0, 9673, 2, 'Avalanchion OOC'),
(@AVALA, 2, 0, 'What?!  You no can beat me!  Me will return!', 14, 0, 100, 0, 0, 0, 9660, 2, 'Avalanchion Death');

UPDATE `creature_template` SET `unit_class`=1, `AIName`='SmartAI', `ScriptName`='', `speed_run`='1.14286', `speed_walk`='1', `InhabitType`='3' WHERE `entry`=@AVALA;

-- Avalanchion SAI
DELETE FROM `smart_scripts` WHERE entryorguid IN(@AVALA,@AVALA*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@AVALA, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - On Respawn - Say Line 0'),
(@AVALA, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - OOC - Say Line 1'),
(@AVALA, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - On Death - Say Line 2'),
(@AVALA, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0,  41, 0, 0, 0, 0, 0, 0, 15, @GOTER, 1000, 0, 0, 0, 0, 0, 'Avalanchion - On Death - Remove All Earth Elemental Rifts'),
(@AVALA, 0, 4, 0, 0, 0, 100, 0, 0, 1000, 3000, 3000, 11, 23392, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - Within Range 5-30 - Cast Boulder'),
(@AVALA, 0, 5, 0, 0, 0, 100, 0, 0, 8000, 10000, 16000, 11, 5568, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - IC - Cast Trample'),
(@AVALA, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 6524, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - IC - Cast Ground Tremor'),
(@AVALA, 0, 7, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @AVALA*10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Avalanchion - On Death - Run Script'),
(@AVALA, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),
(@AVALA, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @THUINV, 1, 0, 0, 0, 0, 'Avalanchion - On Respawn - Respawn Thundering Invade'),

(@AVALA*10, 9, 0, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4748.31, -7160.86, 82.3083, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 1, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4786.63, -7135.98, 90.4752, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 2, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4756.69, -704.65, 89.7484, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 3, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4707.82, -7088.9, 92.0439, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 4, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4669.64, -7128.59, 95.5044, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 5, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4622.24, -7125.71, 103.437, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 6, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4583.15, -7101.45, 95.9793, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 7, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4532.45, -7069.51, 105.254, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 8, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4520.24, -7134.03, 101.638, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 9, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4538.76, -7181.96, 108.442, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 10, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4470.76, -7193.62, 98.87, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 11, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4438.13, -7236.33, 97.9613, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 12, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4464.92, -7272.94, 98.3938, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 13, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4523.81, -7287.35, 100.579, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 14, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4466.47, -7344.25, 88.6556, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 15, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4485.29, -7405.54, 81.6972, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 16, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4539.42, -7376.79, 90.9745, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 17, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4566.54, -7434.58, 89.2819, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 18, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4538.07, -7503.54, 70.4429, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 19, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4610.4, -7478.49, 80.3099, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 20, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4632.75, -7447.73, 81.7821, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 21, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4687.43, -7438.17, 76.1585, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 22, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4705.93, -7528.15, 79.8415, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 23, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4766.07, -7446.41, 88.081, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 24, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4716.25, -7358.45, 69.2486, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 25, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4714.05, -7295.35, 69.2923, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 26, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4756.13, -7252.54, 73.7236, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 27, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4746, -7197.88, 82.9989, 0, 'Avalanchion - Script - Summon Earth Elemental Rift'),
(@AVALA*10, 9, 28, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOTER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4798.16, -7183.17, 89.342, 0, 'Avalanchion - Script - Summon Earth Elemental Rift');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `ConditionTypeOrReference`=36 AND `SourceEntry`=@AVALA;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 4, @AVALA, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'If Avalanchion Dead - GOs dont spawn');

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
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@TEMPES,@TEMPES*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TEMPES, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Say Line 0'),
(@TEMPES, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - OOC - Say Line 1'),
(@TEMPES, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - On Death - Say Line 2'),
(@TEMPES, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 15, @GOWER, 1000, 0, 0, 0, 0, 0, 'Princess Tempestria - On Death - Remove All Water Elemental Rifts'),
(@TEMPES, 0, 4, 0, 0, 0, 100, 0, 0, 1000, 3000, 4500, 11, 23102, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Frostbolt'),
(@TEMPES, 0, 5, 0, 0, 0, 100, 0, 0, 14000, 10000, 16000, 11, 10987, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Geyser'),
(@TEMPES, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 14907, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Frost Nova'),
(@TEMPES, 0, 7, 0, 0, 0, 100, 0, 3000, 10000, 11000, 17000, 11, 22746, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - IC - Cast Cone of Cold'),
(@TEMPES, 0, 8, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @TEMPES*10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Tempestria - On Death - Run Script'),
(@TEMPES, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),
(@TEMPES, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @WATINV, 1, 0, 0, 0, 0, 'Princess Tempestria - On Respawn - Respawn Watery Invader'),

(@TEMPES*10, 9, 0, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6552.74, -4240.22, 658.296, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 1, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6551.11, -4189.69, 658.464, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 2, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6523.7, -4157.58, 658.34, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 3, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6501.46, -4225.49, 658.688, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 4, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6484.71, -4184.13, 658.819, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 5, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6493.89, -4129.62, 658.518, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 6, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6459.01, -4024.87, 658.297, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 7, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6512.79, -4044.29, 658.327, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 8, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6523.37, -3984.89, 658.372, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 9, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6491.97, -3952.45, 658.993, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 10, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6462.44, -3984.73, 658.286, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 11, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6551.45, -4029.24, 658.576, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 12, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6578.54, -4092.35, 658.371, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 13, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6612.45, -4111.76, 658.332, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 14, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6626.92, -4156.29, 658.411, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 15, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6588.69, -4160.86, 658.566, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 16, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6599.22, -4214.35, 658.342, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift'),
(@TEMPES*10, 9, 17, 0, 0, 0, 100, 1, 220000, 230000, 0, 0, 50, @GOWER, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6559.97, -3943.21, 658.356, 0, 'Princess Tempestria - Script - Summon Water Elemental Rift');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `ConditionTypeOrReference`=36 AND `SourceEntry`=@TEMPES;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 4, @TEMPES, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'If Elemental Leader Dead - GOs dont spawn');

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
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@WINDR,@WINDR*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WINDR, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - On Respawn - Say Line 0'),
(@WINDR, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 180000, 300000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - OOC - Say Line 1'),
(@WINDR, 0, 2, 3, 6, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - On Death - Say Line 2'),
(@WINDR, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 15, @GOAER, 1000, 0, 0, 0, 0, 0, 'The Windreaver - On Death - Remove All Air Elemental Rifts'),
(@WINDR, 0, 4, 0, 0, 0, 100, 0, 3000, 6000, 8000, 11000, 11, 23106, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Chain Lightning'),
(@WINDR, 0, 5, 0, 0, 0, 100, 0, 0, 14000, 10000, 16000, 11, 23105, 0, 0, 0, 0, 0, 5, 20, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Lightning Cloud'),
(@WINDR, 0, 6, 0, 0, 0, 100, 0, 3000, 11000, 15000, 26000, 11, 23103, 0, 0, 0, 0, 0, 6, 20, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Enveloping Winds'),
(@WINDR, 0, 7, 0, 0, 0, 100, 0, 3000, 6000, 8000, 14000, 11, 23104, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - IC - Cast Shock'),
(@WINDR, 0, 8, 0, 6, 0, 100, 0, 0, 0, 0, 0, 80, @WINDR*10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Windreaver - On Death - Run Script'),
(@WINDR, 0, 10, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+1, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 11, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+2, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 12, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+3, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),
(@WINDR, 0, 13, 0, 11, 0, 100, 1, 0, 0, 0, 0, 70, 1, 0, 0, 0, 0, 0, 10, @GUID+4, @WHIRLINV, 1, 0, 0, 0, 0, 'The Windreaver - On Respawn - Respawn Whirling Invader'),

(@WINDR*10, 9, 0, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6324.1, 1349.34, 4.39246, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 1, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6265.87, 1332.98, 14.2791, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 2, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6287.71, 1390.8, 9.90502, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 3, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6286.39, 1440.51, 10.2443, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 4, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6308.11, 1497.98, 4.06939, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 5, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6263, 1517.72, 9.75825, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 6, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6309.46, 1535.09, 3.51532, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 7, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6353.25, 1512.41, 4.66918, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 8, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6389.05, 1462.01, 2.95468, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 9, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6405.61, 1415.61, -1.48166, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 10, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6438.17, 1511.42, 6.13047, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 11, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6501.51, 1505.89, 4.09383, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 12, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6556.16, 1444.78, 2.96919, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 13, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6601.16, 1474.43, 4.0009, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 14, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6573.24, 1530.22, 3.10244, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 15, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6636.07, 1504.24, 3.69889, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt'),
(@WINDR*10, 9, 16, 0, 0, 0, 100, 1, 240000, 250000, 0, 0, 50, @GOAER, 0, 0, 0, 0, 0, 8, 0, 0, 0, -6483.56, 1453.19, 2.10941, 0, 'The WINDR*10eaver - script - Summon Air Elemental Riftt');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `ConditionTypeOrReference`=36 AND `SourceEntry`=@WINDR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 4, @WINDR, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'If Elemental Leader Dead - GOs dont spawn');

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
