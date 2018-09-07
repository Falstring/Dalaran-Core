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
DELETE FROM `creature` WHERE `guid`=213755;
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

-- Deepmoss Creeper SAI
SET @ENTRY := 4005;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5500,12000,18000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Deepmoss Creeper - In Combat - Cast 'Poison'");
-- Deepmoss Venomspitter SAI
SET @ENTRY := 4007;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,12000,11,7951,32,0,0,0,0,2,0,0,0,0,0,0,0,"Deepmoss Venomspitter - In Combat - Cast 'Toxic Spit'");

-- Jangdor Swiftstrider
UPDATE `creature_template` SET `gossip_menu_id`=1964 WHERE  `entry`=7854;
DELETE FROM `gossip_menu` WHERE `entry` = 1964;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1964, 2638);

- Treant Ally SAI
SET @ENTRY := 5806;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,89,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Treant Ally - On Just Created - Start Random Movement"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,39,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Treant Ally - On Aggro - Call For Help");

-- Son of Cenarius SAI
SET @ENTRY := 4057;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,12,5806,6,60000,0,0,0,1,0,0,0,0,0,0,0,"Son of Cenarius - On Reset - Summon Creature 'Treant Ally'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,39,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Son of Cenarius - On Aggro - Call For Help");


-- Winterfall Shaman SAI
SET @ENTRY := 7439;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Winterfall Shaman - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Out of Combat - Cast 'Winterfall Firewater'"),
(@ENTRY,0,2,0,1,0,100,0,0,0,60000,60000,11,13585,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,3,0,16,0,100,0,13585,1,15000,30000,11,13585,33,0,0,0,0,11,0,15,0,0,0,0,0,"Winterfall Shaman - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield'"),
(@ENTRY,0,4,0,2,0,100,0,0,40,14000,21000,11,11431,1,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Between 0-40% Health - Cast 'Healing Touch'"),
(@ENTRY,0,5,0,74,0,100,0,0,40,15000,18000,11,11431,1,0,0,0,0,11,0,15,0,0,0,0,0,"Winterfall Shaman - On Friendly Between 0-40% Health - Cast 'Healing Touch'");


-- Grizzle Snowpaw SAI
SET @ENTRY := 10199;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,6000,8000,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - Within 0-5 Range - Cast 'Maul'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,10000,12000,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - Within 0-20 Range - Cast 'Frost Shock'"),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,24000,25000,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - In Combat - Cast 'Blizzard'"),
(@ENTRY,0,3,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Grizzle Snowpaw - Out of Combat - Cast 'Winterfall Firewater'");

-- Winterfall Ursa SAI
SET @ENTRY := 7438;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Ursa - Out of Combat - Cast 'Winterfall Firewater'");

-- Winterfall Den Watcher SAI
SET @ENTRY := 7440;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Den Watcher - Out of Combat - Cast 'Winterfall Firewater'");

-- High Chief Winterfall SAI
SET @ENTRY := 10738;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,6000,8000,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - Within 0-5 Range - Cast 'Maul'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,10000,12000,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - Within 0-20 Range - Cast 'Frost Shock'"),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,24000,25000,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - In Combat - Cast 'Blizzard'"),
(@ENTRY,0,3,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"High Chief Winterfall - Out of Combat - Cast 'Winterfall Firewater'");

-- Grimtotem Shaman SAI
SET @ENTRY := 7727;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,8500,9000,11,930,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Shaman - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,27623,1,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Shaman - Between 0-50% Health - Cast 'Fire Nova' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,0,0,40,8000,10000,11,8005,1,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Shaman - Between 0-40% Health - Cast 'Healing Wave'"),
(@ENTRY,0,3,0,74,0,100,0,0,40,8000,10000,11,8005,1,0,0,0,0,15,0,15,0,0,0,0,0,"Grimtotem Shaman - On Friendly Between 0-40% Health - Cast 'Healing Wave'");


-- Grimtotem Naturalist SAI
SET @ENTRY := 7726;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Aggro - Cast 'Wrath' (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,9,1,100,0,0,40,2000,4000,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - Within 0-40 Range - Cast 'Wrath' (Phase 1)"),
(@ENTRY,0,3,0,3,1,100,1,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,4,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,5,0,7,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Set Event Phase 0 (Phase 1) (No Repeat)"),
(@ENTRY,0,6,7,2,0,100,1,0,50,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-50% Health - Set Event Phase 3 (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,61,0,100,1,0,50,0,0,11,19030,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-50% Health - Cast 'Bear Form' (Phase 1) (No Repeat)"),
(@ENTRY,0,8,0,0,4,100,0,3000,4500,12000,13000,11,12161,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - In Combat - Cast 'Maul' (Phase 4)"),
(@ENTRY,0,9,0,0,4,100,0,8000,9000,25000,26000,11,15727,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - In Combat - Cast 'Demoralizing Roar' (Phase 4)"),
(@ENTRY,0,10,0,7,4,100,1,0,0,0,0,28,19030,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Remove Aura (Phase 4) (No Repeat)"),
(@ENTRY,0,11,0,7,4,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Set Event Phase 0 (Phase 4) (No Repeat)"),
(@ENTRY,0,12,0,2,0,100,1,0,25,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-25% Health - Run In Fear (No Repeat)");

-- Grimtotem Raider SAI
SET @ENTRY := 7725;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Raider - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,5000,6000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Raider - Within 0-20 Range - Cast 'Net'");