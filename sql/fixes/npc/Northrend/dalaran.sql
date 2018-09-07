-- -------------------------------------------
-- Dalaran
-- -------------------------------------------
-- Civilian flag for guards in Dalaran
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|768, `flags_extra`=`flags_extra`|2 WHERE `entry` IN (32724,32722,29636,28989,29476,29493,32690,32725,32723,32653,34244,29547,29715,32680,29548,32337,32688,32679,32216,28951,32675,32691,29496,28991,29499,29497,30659,29156,28958,28956,28774,28776,30726,29528,32527,29529,28994,29494,28692,28691,35500,35497,29523,28992,28742,32683,32686,30607,30608,30605,30606,30604,29528,29527,29529,32681,32685,32287,28995,35496,29491,29702,29495,29702,36856,28693,32514,28714,29628,28706,29640,32651,32652,32650,38699,28726,29512,29511,28701,28721,32172,28699,28726,28696,28700,28718,29507,29508,29509,32515,32677,32684,28697,28722,29514,29513,28728,28698,28703,28725,28701,28721,32172,28716,29506,29505,28694,34252,28997,35498,28990,28704,28727,32693,32678,28702,28723,33027,29641,29716,29478,29491,35496,28995,28687,32411,32680,32676,29548,28708,32451,29282,28675,28677,28676,32337,32688,32679,32216,28951,28690,32687,32692,28160,32732,32730,36776,32727,32726,32516,32731,32729,32451,9636,28715,32733,32728);
-- Christi Stockton SAI
SET @ENTRY := 32337;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,22,0,100,0,35,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Christi Stockton - Received Emote 35 - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,0,35,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Christi Stockton - Received Emote 35 - Play Emote 11");

DELETE FROM `creature_text` WHERE `entry`=32337;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(32337, 0, 0, 'One more bottle? I don\'t see any reason why not!', 12, 0, 100, 0, 0, 0, 33056, 'Christi Stockton');

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


-- Charles Worth
DELETE FROM `conditions` WHERE `sourcegroup`=10118 AND `sourceentry`=3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 10118, 3, 0, 0, 7, 0, 197, 420, 0, 0, 0, 0, '', 'Only show gossip option if player has Tailoring with skill level 420'),
(15, 10118, 3, 0, 0, 17, 0, 1288, 0, 0, 0, 0, 0, '', 'Only show gossip option if player has achievement Northrend Dungeonmaster'),
(15, 10118, 3, 0, 0, 25, 0, 56016, 0, 0, 1, 0, 0, '', 'Only show gossip option if player has not learned spell 56016');

DELETE FROM `conditions` WHERE `sourcegroup`=10118 AND `sourceentry`=5;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 10118, 5, 0, 0, 7, 0, 197, 420, 0, 0, 0, 0, '', 'Only show gossip option if player has Tailoring with skill level 420'),
(15, 10118, 5, 0, 0, 17, 0, 1360, 0, 0, 0, 0, 0, '', 'Only show gossip option if player has achievement Loremaster Horde'),
(15, 10118, 5, 0, 0, 25, 0, 56017, 0, 0, 1, 0, 0, '', 'Only show gossip option if player has not learned spell 56017'),
(15, 10118, 5, 0, 1, 17, 0, 41, 0, 0, 0, 0, 0, '', 'Only show gossip option if player has achievement Loremaster Alliance');