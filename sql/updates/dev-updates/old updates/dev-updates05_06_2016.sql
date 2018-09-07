/* 
* C:\server\official\sql\fixes\npc\Eastern Kingdoms\eastern_kingdom.sql 
*/ 
-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------

-- Masat T'andr <Superior Leatherworker> -- [A][H] http://www.wowhead.com/npc=11874/masat-tandr
UPDATE `creature_template` SET `faction`='35' WHERE  `entry`=11874;

-- Skeletal Executioner http://www.wowhead.com/npc=1787/skeletal-executioner
DELETE FROM `creature` WHERE  `guid`=52542 AND `id`=1787; 
 
/* 
* C:\server\official\sql\fixes\npc\Kalimdor\kalimdor.sql 
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
(@ENTRY,0,2,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.40329,"Captured Hakkari Zealot - On Data Set 2 2 - Set Orientation 4,40329"),
(@ENTRY,0,3,0,38,0,100,0,3,3,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Data Set 3 3 - Set Flag Standstate Kneel"),
(@ENTRY,0,4,0,25,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Hakkari Zealot - On Respawn - Set Flag Standstate Stand Up");

UPDATE `creature_template` SET `ScriptName`='npc_generic_despawn' WHERE  `entry`=14912;
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
 
 
/* 
* C:\server\official\sql\fixes\npc\Northrend\borean_tundra.sql 
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
(@GUID,   @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3956.90, 6367.73, 11.2895, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+1, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3957.40, 6368.23, 11.2895, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+2, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3957.40, 6367.23, 11.2895, -1.29154, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+3, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3956.40, 6368.23, 11.2895, -2.28638, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+4, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3956.40, 6367.23, 11.2895, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+5, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4176.06, 6243.41, 8.2004, -1.29154, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+6, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4176.56, 6243.91, 8.2004, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+7, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4176.56, 6242.91, 8.2004, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+8, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4175.56, 6243.91, 8.2004, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+9, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4298.07, 6206.28, 0.487122, -2.28638, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+10, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4298.57, 6206.78, 0.487122, 0.767944, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+11, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4298.57, 6205.78, 0.487122, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+12, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3932.65, 6394.14, 11.2002, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+13, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3933.15, 6394.64, 11.2002, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+14, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3933.15, 6393.64, 11.2002, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+15, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3932.15, 6394.64, 11.2002, -1.309, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+16, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3932.15, 6393.64, 11.2002, 1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+17, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4031.30, 6332.22, 8.90955, 1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+18, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4031.80, 6332.72, 8.90955, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+19, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4031.80, 6331.72, 8.90955, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+20, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4030.80, 6332.72, 8.90955, -1.72787, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+21, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4283.26, 6297.99, 0.404293, -0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+22, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4283.76, 6298.49, 0.404293, 0.122173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+23, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4283.76, 6297.49, 0.404293, 1.8325, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+24, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4231.63, 6183.1, 1.05165, 1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+25, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4232.13, 6183.6, 1.05165, -1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+26, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4232.13, 6182.6, 1.05165, -1.83259, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+27, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4231.13, 6183.6, 1.05165, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+28, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4231.13, 6182.6, 1.05165, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+29, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4161.53, 6188.07, 9.17654, -1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+30, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4162.03, 6188.57, 9.17654,  1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+31, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4162.03, 6187.57, 9.17654, 0.366518, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+32, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4161.03, 6188.57, 9.17654, 1.58825, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+33, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4062.06, 6253.62, 21.8839, 0.366518, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+34, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4061.06, 6254.62, 21.8839, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+35, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4061.06, 6253.62, 21.8839, -1.22173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+36, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4296.52, 6250.31, 0.182616, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+37, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4297.02, 6250.81, 0.182616, -1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+38, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4297.02, 6249.81, 0.182616, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+39, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4296.02, 6250.81, 0.182616, 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+40, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4296.02, 6249.81, 0.182616, -2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+41, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3984.93, 6343.08, 7.85525, -1.22173, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+42, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3985.43, 6343.58, 7.85525, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+43, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3985.43, 6342.58, 7.85525, - 1.0472, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+44, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3984.43, 6342.58, 7.85525, 2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+45, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3986.92, 6481.15, 21.8128, -2.84488, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+46, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3987.42, 6481.65, 21.8128, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+47, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3986.42, 6480.65, 21.8128, 0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+48, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4180.65, 6308.74, 13.0965, -2.1293, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+49, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4181.15, 6309.24, 13.0965, 2.1293, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+50, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4181.15, 6308.24, 13.0965, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+51, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4180.15, 6309.24, 13.0965, 0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+52, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4180.15, 6308.24, 13.0965, 1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+53, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4225.75, 6230.07, 0.987369, -2.87979, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+54, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4226.25, 6230.57, 0.987369, 1.87979, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+55, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4226.25, 6239.57, 0.987369, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+56, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4225.25, 6239.57, 0.987369, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+57, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3997.79, 6282.02, 7.97459, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+58, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3997.29, 6282.52, 7.97459, -0.663223, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+59, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3997.29, 6281.52, 7.97459, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+60, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4104.50, 6300.65, 23.2685, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+61, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4105.00, 6301.15, 23.2685, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+62, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4105.00, 6300.15, 23.2685, -2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+63, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4104.00, 6301.15, 23.2685, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+64, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4104.00, 6300.15, 23.2685, 2.47837, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+65, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4052.17, 6298.94, 2.58589, 1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+66, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4052.17, 6297.94, 2.58589, 1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+67, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4051.17, 6298.94, 2.58589, -1.76278, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+68, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4051.17, 6297.94, 2.58589, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+69, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3830.89, 6424.93, 21.8597, -2.11185, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+70, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3831.39, 6425.43, 21.8597, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+71, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3831.39, 6424.43, 21.8597, 0, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+72, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4038.38, 6468.67, 22.2306, 1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+73, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4038.88, 6469.17, 22.2306, -1.5708, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+74, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4038.88, 6468.17, 22.2306, 1, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+75, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4037.88, 6469.17, 22.2306, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+76, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4037.88, 6468.17, 22.2306, 2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+77, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3973.45, 6313.41, 7.9676, -1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+78, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3973.95, 6313.91, 7.9676, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+79, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3973.95, 6312.91, 7.9676, 1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+80, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 3972.95, 6312.91, 7.9676, -1.6057, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),

(@GUID+81, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4271.32, 6400.22, 0.4071, -2.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+82, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4270.32, 6401.22, 0.4071, -1.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0),
(@GUID+83, @ENTRY, 571, 0, 0, 1, 1, 22987, 1, 4270.32, 6400.22, 0.4071, -1.35619, 300, 0, 0, 48, 0, 0, 0, 0, 0, 0); 
 
/* 
* C:\server\official\sql\fixes\npc\Northrend\Dragonblight.sql 
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


 
 
/* 
* C:\server\official\sql\fixes\npc\Outlands\Hellfire Peninstula.sql 
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
 
 
/* 
* C:\server\official\sql\fixes\npc\Outlands\Terokkar Forest.sql 
*/ 
-- -------------------------------------------
-- TEROKKAR FOREST
-- -------------------------------------------

-- Formula: Runed Adamantite Rod -- http://wotlk.openwow.com/item=25848  [H] Rungor http://wotlk.openwow.com/npc=18960
-- Respawn time corrected

UPDATE `world`.`npc_vendor` SET `incrtime`='180' WHERE  `entry`=18960 AND `item`=25848 AND `ExtendedCost`=0; 
 
/* 
* C:\server\official\sql\fixes\quests\template.sql 
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
* C:\server\official\sql\fixes\quests\zones\Eastern Kingdom\eastern_kingdom.sql 
*/ 
-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------


-- Spawn creature ID 16399 Bloodsail Traitor

/*DELETE FROM `creature` WHERE `id` = 16399;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
(12459, 16399, 0, 0, 0, 1, 1, 2557, 1, -14184.4, 192.764, 20.6905, 3.735, 300, 0, 0, 2059, 0, 0, 0, 0, 0, 0);

-- Traitor to the Bloodsail -- [A/H] http://wotlk.openwow.com/quest=9259
DELETE FROM `quest_template` WHERE `ID`=9259;
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES 
(9259, 0, -1, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 7, 0, 87, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Traitor to the Bloodsail', '', 'That mangy dog, Revilgaz, has offered to pardon any former Bloodsails willing to turn on their cap\'n! That bilge sucker asked me to go an\' off me ole\' mates and to bring back their bandannas as proof.', NULL, 'Return to Bloodsail Traitor in Stranglethorn Vale.', 0, 0, 0, 0, 0, 0, 0, 0, 4306, 2604, 0, 0, 0, 0, 40, 4, 0, 0, 0, 0, 0, '', '', '', '', 12340);*/

-- 
-- Quest Urok Doomhowl [A] - http://www.wowhead.com/quest=4867/urok-doomhowl
SET @MAGUS    = 10602;
SET @ENFORCER = 10601;
SET @UROK     = 10584;

UPDATE `gameobject` SET `position_y`=-395.729 WHERE  `guid`=99791;

DELETE FROM `event_scripts` WHERE `id`=4845;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
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
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, '%s attempts to run away in fear!',16,0,100,0,0,0, 'combat Flee');

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
 
/* 
* C:\server\official\sql\fixes\quests\zones\Kalimdor\kalimdor.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\borean_tundra.sql 
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
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\dragonblight.sql 
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

 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\grizzly_hills.sql 
*/ 
-- -------------------------------------------
-- GRIZZLY_HILLS
-- -------------------------------------------


-- Shredder Repair -- [A] http://www.wowhead.com/quest=12244/shredder-repair 
-- Shred the Alliance -- [H] http://www.wowhead.com/quest=12270/shred-the-alliance


UPDATE creature_template SET npcflag=16777216 WHERE entry=27354;


-- Deciphering the Journal-- [H] http://www.wowhead.com/quest=12054/deciphering-the-journal

UPDATE creature_loot_template SET Chance=100 WHERE Item=36740 AND entry=26681; 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\howling_fjord.sql 
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
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\icecrown.sql 
*/ 
-- Quest Army of the Damned - [H] -- http://www.wowhead.com/quest=13236/army-of-the-damned
-- spell_icecrown_deathstorm
DELETE FROM `spell_script_names` WHERE `spell_id`=58912;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(58912, 'spell_icecrown_deathstorm');
SET @DEATHSTORM := 58912;
SET @SOULCLEAVE := 58913;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = @DEATHSTORM;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SOULCLEAVE;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, @DEATHSTORM, 0, 0, 33, 0, 1, 1, 0, 1, 0, 0, '', 'Deathstorm cannot hit self'),
(17, 0, @SOULCLEAVE, 0, 0, 32, 0, 8, 0, 0, 0, 0, 0, '', 'Soul Cleave can target units');
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\sholazar_basin.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\storm_peaks.sql 
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
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Northrend\zuldrak.sql 
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
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\blades_edge_mountains.sql 
*/ 
-- -------------------------------------------
-- BLADES_EDGE_MOUNTAINS
-- -------------------------------------------

-- Guardian of the Monument -- [A][H] http://www.wowhead.com/quest=11059/guardian-of-the-monument

UPDATE creature_loot_template SET Chance=100 WHERE Item=32697 AND entry=22275;
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\bloodmyst_isle.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\hellfire_peninsula.sql 
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
(48245, 22467, 530, 0, 0, 1, 1, 0, 0, -690.565, 2743.81, 94.0318, 2.67035, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(48246, 22467, 530, 0, 0, 1, 1, 0, 0, -694.607, 2666.24, 92.5453, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(48247, 22467, 530, 0, 0, 1, 1, 0, 0, -698.913, 2611.4, 89.6674, 4.27606, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);


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
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\nagrand.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\netherstorm.sql 
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

 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\shadowmoon_valley.sql 
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


 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\terokkar_forest.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\quests\zones\Outlands\zangarmarsh.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\death_knight.sql 
*/ 
-- Anti-Magic Shell - Cyclone Immunity
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='48707') AND (`spell_effect`='-33786') AND (`type`='2');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES ('48707', '-33786', '2', 'Anti-Magic Shell (Self) - Cyclone Immunity');#
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\druid.sql 
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
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\hunter.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\mage.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\paladin.sql 
*/ 
-- Hand of Sacrifice can't be casted on targets with Divine Sacrifice 
DELETE FROM conditions WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=6940;
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
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\priest.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\rogue.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\shaman.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\warlock.sql 
*/ 
 
 
/* 
* C:\server\official\sql\fixes\spells\classes\warrior.sql 
*/ 
 
 
