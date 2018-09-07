-- Nerub'ar Egg Sac -- http://wotlk.openwow.com/object=187655
SET @OGUID := 4000057;
DELETE FROM gameobject WHERE guid BETWEEN @OGUID + 0 AND @OGUID + 18;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
( @OGUID + 0, 187655, 571, 1,1,2619.735,6044.973,62.04182,5.846854, 0, 0, -0.2164392, 0.9762961, 300, 255, 1),
( @OGUID + 1, 187655, 571, 1,1,2611.435,6060.056,53.98623,2.565632, 0, 0, 0.9588194, 0.2840165, 300, 255, 1),
( @OGUID + 2, 187655, 571, 1,1,2575.054,6052.29,88.17222,0.9599299, 0, 0, 0.4617481, 0.8870111, 300, 255, 1),
( @OGUID + 3, 187655, 571, 1,1,2569.778,6080.495,87.36649,3.926996, 0, 0, -0.9238787, 0.3826855, 300, 255, 1),
( @OGUID + 4, 187655, 571, 1,1,2561.835,6101.77,66.08759,2.478367, 0, 0, 0.9455185, 0.3255684, 300, 255, 1),
( @OGUID + 5, 187655, 571, 1,1,2556.646,6089.519,73.43652,2.478367, 0, 0, 0.9455185, 0.3255684, 300, 255, 1),
( @OGUID + 6, 187655, 571, 1,1,2551.704,6052.294,88.13548,3.33359, 0, 0, -0.9953957, 0.09585124, 300, 255, 1),
( @OGUID + 7, 187655, 571, 1,1,2616.687,6207.524,59.38102,6.143561, 0, 0, -0.06975555, 0.9975641, 300, 255, 1),
( @OGUID + 8, 187655, 571, 1,1,2620.03,5998.845,87.13082,2.111848, 0, 0, 0.8703556, 0.4924237, 300, 255, 1),
( @OGUID + 9, 187655, 571, 1,1,2904.279,6306.756,106.1282,3.054327, 0, 0, 0.9990482, 0.04361926, 300, 255, 1),
( @OGUID + 10, 187655, 571, 1,1,2909.719,6310.445,106.0552,0.9075702, 0, 0, 0.4383707, 0.8987942, 300, 255, 1),
( @OGUID + 11, 187655, 571, 1,1,2924.597,6277.471,61.4728,0.4363316, 0, 0, 0.2164392, 0.9762961, 300, 255, 1),
( @OGUID + 12, 187655, 571, 1,1,2954.691,6290.092,92.35532,1.274088, 0, 0, 0.5948219, 0.8038574, 300, 255, 1),
( @OGUID + 13, 187655, 571, 1,1,2933.394,6293.89,93.66654,3.752462, 0, 0, -0.9537163, 0.3007079, 300, 255, 1),
( @OGUID + 14, 187655, 571, 1,1,2936.999,6261.966,80.94783,2.35619, 0, 0, 0.9238787, 0.3826855, 300, 255, 1),
( @OGUID + 15, 187655, 571, 1,1,2925.198,6285.97,69.83652,1.762782, 0, 0, 0.7716246, 0.6360782, 300, 255, 1),
( @OGUID + 16, 187655, 571, 1,1,2957.298,6270.011,93.60268,4.66003, 0, 0, -0.7253742, 0.6883547, 300, 255, 1),
( @OGUID + 17, 187655, 571, 1,1,2931.734,6278.576,69.8568,4.81711, 0, 0, -0.6691303, 0.743145, 300, 255, 1),
( @OGUID + 18, 187655, 571, 1,1,2953.022,6269.587,80.833,5.567601, 0, 0, -0.3502073, 0.9366722, 300, 255, 1);

-- Nerub'ar Swarmer SAI
SET @ENTRY := 25295;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"Nerub'ar Swarmer - On Just Created - Start Attacking");

-- [Q] Blood in the Water QuestID=12810 | What Do You Feed a Yeti, Anyway?
UPDATE `creature_template` SET unit_flags = unit_flags | 32768 WHERE entry IN (35061,35060,35071,35072,29392);

-- Dalaran Visitor
DELETE FROM `creature_template_addon` WHERE `entry` IN (32596, 32601, 32602, 32600, 32598, 32597);
INSERT INTO `creature_template_addon` VALUES
(32596, 0, 0, 0, 257, 0, NULL), -- Alliance
(32601, 0, 0, 0, 257, 0, NULL), -- Horde
(32602, 0, 0, 0, 257, 0, NULL), -- Horde
(32600, 0, 0, 0, 257, 0, NULL), -- Horde
(32598, 0, 0, 0, 257, 0, NULL), -- Alliance
(32597, 0, 0, 0, 257, 0, NULL); -- Alliance

DELETE FROM `creature_addon` WHERE guid IN (SELECT `guid` FROM `creature` WHERE `id` IN (32596,32601,32602,32600,32598,32597));
UPDATE `creature_template` SET ScriptName='npc_dalaran_visitor', InhabitType=4, speed_run=1.14286 WHERE entry IN (32596,32601,32602,32600,32598,32597);

-- Spawning
SET @guid := 5005886; 
DELETE FROM `creature` WHERE `id` IN (32596,32601,32602,32600,32598,32597) OR `guid` BETWEEN @guid+1 AND @guid+18;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(@guid+1, 32596, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),
(@guid+2, 32601, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),
(@guid+3, 32602, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),
(@guid+4, 32600, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),
(@guid+5, 32598, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),
(@guid+6, 32597, 571, 1, 1, 0, 0, 5787.081, 317.019, 686.7331, 1.56895, 0, 0, 0, 9103, 8313, 0, 0, 134250496, 0),

(@guid+7, 32596, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),
(@guid+8, 32601, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),
(@guid+9, 32602, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),
(@guid+10, 32600, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),
(@guid+11, 32598, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),
(@guid+12, 32597, 571, 1, 1, 0, 0, 5726.78, 360.845, 682.252, 0.614687, 0, 0, 0, 8800, 8139, 0, 0, 134250496, 0),

(@guid+13, 32596, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0),
(@guid+14, 32601, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0),
(@guid+15, 32602, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0),
(@guid+16, 32600, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0),
(@guid+17, 32598, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0),
(@guid+18, 32597, 571, 1, 1, 0, 0, 5875.55, 348.209, 708.734, 2.29544, 0, 0, 0, 9740, 8636, 0, 0, 134250496, 0);

-- Pooling 202486
SET @pool := 202486; 
DELETE FROM `pool_template` WHERE entry=@pool+1;
INSERT INTO `pool_template`  VALUES
(@pool+1, 1, 'Dalaran Visitor');

DELETE FROM `pool_creature` WHERE `pool_entry`=@pool+1;
INSERT INTO `pool_creature` VALUES
(@guid+1, @pool+1, 0, 'Dalaran Visitor'),
(@guid+2, @pool+1, 0, 'Dalaran Visitor'),
(@guid+3, @pool+1, 0, 'Dalaran Visitor'),
(@guid+4, @pool+1, 0, 'Dalaran Visitor'),
(@guid+5, @pool+1, 0, 'Dalaran Visitor'),
(@guid+6, @pool+1, 0, 'Dalaran Visitor'),
(@guid+7, @pool+1, 0, 'Dalaran Visitor'),
(@guid+8, @pool+1, 0, 'Dalaran Visitor'),
(@guid+9, @pool+1, 0, 'Dalaran Visitor'),
(@guid+10, @pool+1, 0, 'Dalaran Visitor'),
(@guid+11, @pool+1, 0, 'Dalaran Visitor'),
(@guid+12, @pool+1, 0, 'Dalaran Visitor'),
(@guid+13, @pool+1, 0, 'Dalaran Visitor'),
(@guid+14, @pool+1, 0, 'Dalaran Visitor'),
(@guid+15, @pool+1, 0, 'Dalaran Visitor'),
(@guid+16, @pool+1, 0, 'Dalaran Visitor'),
(@guid+17, @pool+1, 0, 'Dalaran Visitor'),
(@guid+18, @pool+1, 0, 'Dalaran Visitor');

SET @PATH := 325960;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5829.303, 513.5418, 657.7477,0,0,1,0,100,0),
(@PATH,14,5825.803, 514.7918, 657.7477,0,0,1,0,100,0),
(@PATH,15,5813.958, 521.3729, 657.7477,0,0,1,0,100,0),
(@PATH,16,5813.958, 521.3729, 657.7477,0,0,1,0,100,0);

SET @PATH := 325970;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5831.741, 515.0019, 657.7477,0,0,1,0,100,0),
(@PATH,14,5836.491, 525.2519, 657.7477,0,0,1,0,100,0),
(@PATH,15,5840.741, 534.0019, 657.7477,0,0,1,0,100,0),
(@PATH,16,5838.307, 539.0468, 657.7477,0,0,1,0,100,0);

SET @PATH := 325980;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5831.649, 514.8726, 657.7477,0,0,1,0,100,0),
(@PATH,14,5840.401, 533.3419, 657.7477,0,0,1,0,100,0),
(@PATH,15,5840.401, 533.3419, 657.7477,0,0,1,0,100,0),
(@PATH,16,5840.401, 533.3419, 657.7477,0,0,1,0,100,0);

SET @PATH := 326000;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5829.303, 513.5418, 657.7477,0,0,1,0,100,0),
(@PATH,14,5825.803, 514.7918, 657.7477,0,0,1,0,100,0),
(@PATH,15,5813.958, 521.3729, 657.7477,0,0,1,0,100,0),
(@PATH,16,5813.958, 521.3729, 657.7477,0,0,1,0,100,0);

SET @PATH := 326010;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5831.741, 515.0019, 657.7477,0,0,1,0,100,0),
(@PATH,14,5836.491, 525.2519, 657.7477,0,0,1,0,100,0),
(@PATH,15,5840.741, 534.0019, 657.7477,0,0,1,0,100,0),
(@PATH,16,5838.307, 539.0468, 657.7477,0,0,1,0,100,0);

SET @PATH := 326020;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,7,5827.361, 473.3406, 658.784,0,0,1,0,100,0),
(@PATH,8,5828.554, 475.0378, 658.232,0,0,1,0,100,0),
(@PATH,9,5831.051, 483.7378, 658.1597,0,0,1,0,100,0),
(@PATH,10,5831.475, 490.1848, 658.0024,0,0,1,0,100,0),
(@PATH,11,5831.407, 498.2103, 657.3868,0,0,1,0,100,0),
(@PATH,12,5832.053, 506.7918, 657.5515,0,0,1,0,100,0),
(@PATH,13,5831.649, 514.8726, 657.7477,0,0,1,0,100,0),
(@PATH,14,5840.401, 533.3419, 657.7477,0,0,1,0,100,0),
(@PATH,15,5840.401, 533.3419, 657.7477,0,0,1,0,100,0),
(@PATH,16,5840.401, 533.3419, 657.7477,0,0,1,0,100,0);

-- Quest The Plume of Alystros - [A][H] - http://www.wowhead.com/quest=12456/the-plume-of-alystros
-- increase SpellFocus diameter
UPDATE `gameobject_template` SET `Data1`=100 WHERE  `entry`=190033;

-- assign spell script to spell of quest item
DELETE FROM `spell_script_names` WHERE `spell_id`=49566;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(49566, 'spell_skytalon_molts');

-- Alystros the Verdant Keeper SAI
SET @ENTRY := 27249;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,7000,6000,9000,11,51937,0,0,0,0,0,2,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - In Combat - Cast 'Talon Strike'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,16000,21000,11,51938,1,0,0,0,0,2,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - Within 0-5 Range - Cast 'Wing Beat'"),
(@ENTRY,0,2,0,0,0,100,0,2500,4000,17000,21000,11,51922,0,0,0,0,0,6,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - In Combat - Cast 'Lapsing Dream'"),
(@ENTRY,0,3,4,38,0,100,0,1,1,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Set Emote State 0"),
(@ENTRY,0,4,5,61,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,5,6,61,0,100,0,1,1,0,0,4,3605,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Play Sound 3605"),
(@ENTRY,0,6,0,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Start Attacking"),
(@ENTRY,0,7,0,25,0,100,0,1,1,0,0,134,100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Reset - Set Combat Distance 100");

UPDATE `creature_template` SET `AIName`="", `flags_extra`=0, `ScriptName`='npc_piznik' WHERE `entry`=4276;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4276, 427600) AND `source_type` IN (0, 9);

-- Unstable Explosion - Sholazar Basin
SET @FIRSTTRAP    := 2033145;

DELETE FROM `gameobject_template` WHERE `entry`=190590;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`) VALUES 
(190590, 10, 8181, 'Unstable Explosives', '', '', '', 0, 4, 1, 0, 12660, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 194955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE  `entry`=190590;
DELETE FROM `smart_scripts` WHERE `entryorguid`=190590 AND  `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(190590, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 70, 300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Unstable Explosives - On State Changed - Despawn for 60 sec');

DELETE FROM `gameobject` WHERE `guid` BETWEEN @FIRSTTRAP AND @FIRSTTRAP+6 AND `id`=194955;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
(@FIRSTTRAP,194955,571,1,1,5988.04,4473.78,-87.3617,1.74533,0,0,0.766045,0.642787,180,255,1),
(@FIRSTTRAP+1,194955,571,1,1,6073.83,4463.66,-84.9872,-0.820303,0,0,-0.398748,0.91706,180,255,1),
(@FIRSTTRAP+2,194955,571,1,1,6130.8,4462.61,-84.544,2.75761,0,0,0.981626,0.190814,180,255,1),
(@FIRSTTRAP+3,194955,571,1,1,6075.99,4523.62,-81.0092,0.698132,0,0,0.34202,0.939693,180,255,1),
(@FIRSTTRAP+4,194955,571,1,1,6012.03,4517.3,-86.8614,0.872664,0,0,0.422618,0.906308,180,255,1),
(@FIRSTTRAP+5,194955,571,1,1,6092.64,4425.49,-83.9704,-2.72271,0,0,-0.978147,0.207914,180,255,1),
(@FIRSTTRAP+6,194955,571,1,1,6102.15,4497.03,-81.3401,-2.63544,0,0,-0.968147,0.250383,180,255,1);

-- Dalaran Brilliance
DELETE FROM `spell_script_names` WHERE `spell_id`=61316;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (61316, 'spell_dalaran_brilliance');

-- Brain Freeze
UPDATE `spell_proc_event` SET `Cooldown`=3 WHERE  `entry` IN (44546, 44548, 44549);

-- Lar'kowi mate should only drop one item.
UPDATE `creature_loot_template` SET `MinCount`=1, `MaxCount` = 1 WHERE `Entry` = 9683 AND `Item` = 11509;