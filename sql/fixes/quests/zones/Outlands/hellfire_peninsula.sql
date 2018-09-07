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
DELETE FROM `creature` WHERE `guid` IN (24187, 24188, 24189);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(24187, 22467, 530, 0, 0, 1, 1, 0, 0, -690.565, 2743.81, 94.0318, 2.67035, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(24188, 22467, 530, 0, 0, 1, 1, 0, 0, -694.607, 2666.24, 92.5453, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(24189, 22467, 530, 0, 0, 1, 1, 0, 0, -698.913, 2611.4, 89.6674, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);


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

-- DB/Quest: The Earthbinder -  http://wowwiki.wikia.com/wiki/Quest:The_Earthbinder
-- Earthbinder Galandria Nightbreeze SAI
SET @ENTRY := 19294;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 1 1 - Say Line 0"),
(@ENTRY,0,1,2,20,0,100,0,10349,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest '' Finished - Run Script"),
(@ENTRY,0,2,5,61,0,100,0,10349,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest '' Finished - Set Active On"),
(@ENTRY,0,3,0,38,0,100,0,2,2,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 2 2 - Run Script"),
(@ENTRY,0,4,7,11,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Respawn - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,5,0,61,0,100,0,10349,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest '' Finished - Set Run Off"),
(@ENTRY,0,6,0,6,0,100,0,0,0,0,0,45,3,0,0,0,0,0,19,20599,100,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Just Died - Set Data 3 0"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Respawn - Set Run On"),
(@ENTRY,0,8,0,0,0,100,0,0,0,10000,14000,11,33844,0,0,0,0,0,2,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - In Combat - Cast 'Entangling Roots'"),
(@ENTRY,0,9,0,0,0,100,0,1600,1600,13000,15000,11,31401,0,0,0,0,0,2,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - In Combat - Cast 'Moonfire'"),
(@ENTRY,0,10,0,0,0,100,0,1700,1700,0,0,11,21807,64,0,0,0,0,2,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - In Combat - Cast 'Wrath'"),
(@ENTRY,0,11,0,21,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Reached Home - Set Npc Flags Gossip & Questgiver");

-- Actionlist SAI
SET @ENTRY := 1929400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Npc Flag "),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Orientation Closest Player"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,69,0,0,0,0,0,0,8,0,0,0,-286.767,4729.43,18.4418,1.72788,"Earthbinder Galandria Nightbreeze - On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,11000,11000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 16"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 0"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,50,184450,60,0,0,0,0,8,0,0,0,-287.019,4731.63,18.217,2.58308,"Earthbinder Galandria Nightbreeze - On Script - Summon Gameobject 'Crimson Crystal Shard'"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 2"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,20599,3,60000,1,0,0,8,0,0,0,-288.19,4733.63,18.2982,5.044,"Earthbinder Galandria Nightbreeze - On Script - Summon Creature 'Lured Colossus'");

-- Actionlist SAI
SET @ENTRY := 1929401;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-294.766,4715.08,28.1862,0.20944,"Earthbinder Galandria Nightbreeze - On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,13000,13000,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0.20944,"Earthbinder Galandria Nightbreeze - On Script - Set Orientation Home Position"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Active Off");


-- Lured Colossus SAI
SET @ENTRY := 20599;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,19294,50,0,0,0,0,0,"Lured Colossus - On Just Died - Set Data 2 2"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lured Colossus - On Just Summoned - Set Active On"),
(@ENTRY,0,2,0,38,0,100,0,3,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lured Colossus - On Data Set 3 0 - Despawn Instant");

-- Quest: The Exorcism of Colonel Jules http://www.wowhead.com/quest=10935/the-exorcism-of-colonel-jules

UPDATE `creature_template` SET `unit_flags`=4104 WHERE  `entry`=22431;

-- [Q] Fel Spirits -- http://www.wowhead.com/quest=10909/fel-spirits
UPDATE `smart_scripts` SET `event_type`=75, `event_param1`=0, `event_param2`=16878, `event_param3`=4000, `event_param4`=4000, `action_param2`=1, `target_type`=1, `target_param1`=0, `target_param2`=0, `comment`='Anchorite Relic Bunny - On Shattered Hand Berserker in range  - Cast \'Anchorite Contrition\' (No Repeat)' WHERE  `entryorguid`=22444 AND `source_type`=0 AND `id`=1 AND `link`=0;
UPDATE `gameobject_template` SET `AIName`='' WHERE  `entry`=185298;

UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` IN(22454);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(22454) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=185298 AND `source_type`=1;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(22454, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Fel Spirit - On Just Summoned - Attack'),
(22454, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fel Spirit - On Agro - Attack');

DELETE FROM `creature_text` WHERE `entry`=22454;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(22454, 0, 0, 'Vengeance will not be yours, $n!', 12, 0, 100, 15, 0, 0, 20301, 'Fel Spirit to Player');

UPDATE `gameobject_template` SET `flags` = 16 WHERE `entry` = 185298;
UPDATE `item_template` SET `spellcooldown_1`=60000 WHERE `entry`=31772;