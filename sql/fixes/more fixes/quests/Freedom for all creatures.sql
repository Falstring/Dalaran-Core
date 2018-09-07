UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=7956;
UPDATE creature_template SET speed_walk=0.6, speed_run=0.6 WHERE entry=7997;
DELETE FROM `creature_addon` WHERE  `guid`=50005; -- removed because of bad interactionbehaviour while creature follows player
UPDATE `creature` SET `spawntimesecs`=1 WHERE `guid`=50005;
UPDATE `gameobject` SET `state`=1 WHERE `guid`=50029 and `id`=143979;

-- Kindal Moonweaver SAI
SET @ENTRY := 7956;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,2969,0,0,0,29,4,0,0,0,0,0,7,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Start Follow Invoker"),
(@ENTRY,0,1,2,61,0,100,0,2969,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Remove Flag Standstate Kneel"),
(@ENTRY,0,2,7,61,0,100,0,2969,0,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Set Faction 774"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Aggro - Say Line 1"),
(@ENTRY,0,4,0,38,0,100,0,1,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Data Set 1 1 - Increment Phase"),
(@ENTRY,0,5,0,0,32,100,1,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - In Combat - Run Script (Phase 32) (No Repeat)"),
(@ENTRY,0,6,0,1,32,100,1,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - Out of Combat - Run Script (Phase 32) (No Repeat)"),
(@ENTRY,0,7,9,61,0,100,0,2969,0,0,0,41,360000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Despawn In 360000 ms"),
(@ENTRY,0,8,0,11,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Respawn - Set Event Phase 0"),
(@ENTRY,0,9,0,61,0,100,0,2969,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Say Line 0");

-- Actionlist SAI
SET @ENTRY := 795600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,15,2969,0,0,0,0,0,17,0,5000,0,0,0,0,0,"Kindal Moonweaver - On Script - Quest Credit 'Freedom for All Creatures'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Script - Despawn In 3000 ms");

/* Script for the Door, it will start the event for the creatures */
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=143979;
DELETE FROM `smart_scripts` WHERE `entryorguid`=143979;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(143979, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 80, 143979*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'bambus door - On activate - start script');
-- Actionlist SAI
SET @ENTRY := 14397900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,7997,0,50,0,0,0,0,"On Script - Set Data 1 1");

-- Captured Sprite Darter SAI 
SET @ENTRY := 7997;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,88,@ENTRY*100+00,@ENTRY*100+01,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Data Set 1 1 - Run Random Script"),
(@ENTRY,0,1,2,40,0,100,0,13,7997,0,0,45,1,1,0,0,0,0,10,50005,7956,0,0,0,0,0,"Captured Sprite Darter - On Waypoint 13 Reached - Set Data 1 1"),
(@ENTRY,0,2,0,61,0,100,0,13,7997,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Waypoint 13 Reached - Despawn In 100 ms"),
(@ENTRY,0,3,0,11,0,100,0,0,0,0,0,2,534,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Respawn - Set Faction 534");

/* Call two different script for delayed waypoint-start */
-- Actionlist SAI
SET @ENTRY := 799700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,53,1,7997,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Set Faction 774");

-- Actionlist SAI
SET @ENTRY := 799701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,7997,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Set Faction 774");

/* Texts for Kindal Moonweaver */
DELETE FROM `creature_text` WHERE `entry`=7956;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(7956, 0, 0, 'I\'am ready, when you are, $n. Lead the way!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
(7956, 1, 0, 'Die, Grimtotem. Elune will not have you harm her creatures any longer!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
(7956, 1, 1, 'You dare touch me?!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
(7956, 1, 2, 'Death to you, Grimtotem. How dare you come within a bow\'s shot of me!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
(7956, 2, 0, 'We\'ve done it! Meet me back by Jer\'kai above the Grim Totem camp.', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver');

DELETE FROM `locales_creature_text` WHERE `entry`=7956;
INSERT INTO `locales_creature_text` (`entry`, `groupid`, `id`, `text_loc3`) VALUES 
(7956, 0, 0, 'Ich bin bereit, wenn Ihr es seid, $n. Geht vorraus!'),
(7956, 1, 0, 'Sterbt, Grimmtotem. Elune möchte nicht länger, dass ihren Geschöpfen Schaden zugefügt wird!'),
(7956, 1, 1, 'Ihr wagt es mich anzufassen?!'),
(7956, 1, 2, 'Sterbt, Grimmtotem. Wie könnt Ihr es wagen mich anzugreifen!'),
(7956, 2, 0, 'Wir haben es geschafft! Trefft mich bei Jer\'kai über dem Camp wieder.');

/* Waypoints for Captured Sprite Darter */
DELETE FROM `waypoints` WHERE `entry`=7997;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(7997, 1, -4532.19, 807.833, 59.9749, 'Captured Sprite Darter'),
(7997, 2, -4526.04, 799.328, 59.4271, 'Captured Sprite Darter'),
(7997, 3, -4518.87, 786.24, 59.9261, 'Captured Sprite Darter'),
(7997, 4, -4516.6, 766.617, 60.6654, 'Captured Sprite Darter'),
(7997, 5, -4516.79, 749.124, 60.4805, 'Captured Sprite Darter'),
(7997, 6, -4517.52, 731.643, 60.9822, 'Captured Sprite Darter'),
(7997, 7, -4522.3, 710.707, 60.8061, 'Captured Sprite Darter'),
(7997, 8, -4530.08, 695.036, 60.6917, 'Captured Sprite Darter'),
(7997, 9, -4537.26, 679.979, 60.5726, 'Captured Sprite Darter'),
(7997, 10, -4541.54, 655.429, 58.551, 'Captured Sprite Darter'),
(7997, 11, -4539.33, 649.443, 57.9488, 'Captured Sprite Darter'),
(7997, 12, -4526.54, 639.678, 56.2069, 'Captured Sprite Darter'),
(7997, 13, -4507.92, 627.417, 55.6034, 'Captured Sprite Darter');