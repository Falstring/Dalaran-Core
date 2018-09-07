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

-- Scalps! -- http://wotlk.openwow.com/quest=12659
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=52090;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 52090, 0, 1, 31, 1, 3, 28465, 0, 0, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker'),
(17, 0, 52090, 0, 1, 36, 1, 0, 0, 0, 1, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker'),
(17, 0, 52090, 0, 0, 31, 1, 3, 28600, 0, 0, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28600 "Dead Heb\'Drakkar Headhunter'),
(17, 0, 52090, 0, 0, 36, 1, 0, 0, 0, 1, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28600 "Dead Heb\'Drakkar Headhunter');

-- DB/Quest: A bear of an Appetite -- quest=12279
UPDATE `gameobject_template` SET `ScriptName`='go_school_of_northern_salmon' WHERE  `entry`=189290;

-- The Sum is Greater than the Parts - [A][H] http://www.wowhead.com/quest=13043/the-sum-is-greater-than-the-parts

DELETE FROM conditions WHERE SourceTypeOrReferenceId=1 AND SourceGroup=30409 AND SourceEntry=42772;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (1, 30409, 42772, 0, 0, 28, 0, 13042, 0, 0, 0, 0, 0, '', 'Dr. Terribles \"Building a Better Flesh Giant\" only drops if player has completed Deep in the Bowels of The Underhalls objectives OR'),
    (1, 30409, 42772, 0, 1, 8, 0, 13042, 0, 0, 0, 0, 0, '', 'Dr. Terribles \"Building a Better Flesh Giant\" only drops if player has rewarded Deep in the Bowels of The Underhalls');

UPDATE creature_template SET flags_extra=536870912, InhabitType=3 WHERE entry IN(30471, 30432, 30404);

UPDATE creature SET spawntimesecs=30, spawndist=0, MovementType=0 WHERE id=30403;
UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='', InhabitType=3, faction=190 WHERE entry=30403;
DELETE FROM smart_scripts WHERE entryorguid=30403 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=3040300 AND source_type=9;
INSERT INTO smart_scripts VALUES (30403, 0, 0, 9, 11, 0, 100, 0, 0, 0, 0, 0, 75, 59037, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawn add root aura');
INSERT INTO smart_scripts VALUES (30403, 0, 1, 0, 28, 0, 100, 0, 0, 0, 0, 0, 75, 59037, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Removed add root aura');
INSERT INTO smart_scripts VALUES (30403, 0, 2, 3, 27, 0, 100, 0, 0, 0, 0, 0, 28, 59037, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Boarded remove root aura');
INSERT INTO smart_scripts VALUES (30403, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Boarded Talk');
INSERT INTO smart_scripts VALUES (30403, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Boarded Set State Passive');
INSERT INTO smart_scripts VALUES (30403, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 3040300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Boarded Run SCript');
INSERT INTO smart_scripts VALUES (30403, 0, 6, 7, 8, 0, 100, 0, 32067, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit Say');
INSERT INTO smart_scripts VALUES (30403, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit Die');
INSERT INTO smart_scripts VALUES (30403, 0, 8, 0, 28, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Passenger Removed Die');
INSERT INTO smart_scripts VALUES (30403, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Respawn - Set Npc Flag Spellclick");
INSERT INTO smart_scripts VALUES (3040300, 9, 0, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7993.9, 3336.91, 632.396, 0.14577, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8003.72, 3323.56, 632.396, 0.648783, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8026.94, 3307.58, 632.396, 1.48207, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8001.77, 3306.38, 632.396, 0.863447, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7987.9, 3308.9, 632.396, 0.68058, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8016.52, 3318.92, 632.396, 0.940311, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 6, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7996.66, 3308.78, 632.396, 0.773231, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8011.71, 3315.36, 632.396, 0.901169, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8000.67, 3317.23, 632.396, 0.710591, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8025.24, 3313.55, 632.396, 1.28693, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8007.71, 3337.13, 632.396, 0.407285, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8009.92, 3319.81, 632.396, 0.804842, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 12, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8021.79, 3312.45, 632.396, 1.13086, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8001.36, 3332.71, 632.396, 0.443351, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7999.22, 3302.52, 632.396, 0.872342, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8000.5, 3345.77, 632.396, 5.82389, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 16, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8001.77, 3311.95, 632.396, 0.797157, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 17, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30471, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8012.21, 3325.82, 632.396, 0.737667, 'On Script - Spawn Vargul');
INSERT INTO smart_scripts VALUES (3040300, 9, 18, 0, 0, 0, 100, 0, 31000, 31000, 0, 0, 12, 30404, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7999.93, 3309.21, 632.40, 0.85, 'On Script - Spawn Dr. Terrible');
INSERT INTO smart_scripts VALUES (3040300, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 7994.21, 3310.94, 632.40, 0.798, 'On Script - Spawn Grimmr Hound');
INSERT INTO smart_scripts VALUES (3040300, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 30432, 4, 20000, 1, 0, 0, 8, 0, 0, 0, 8001.71, 3303.59, 632.40, 0.794, 'On Script - Spawn Grimmr Hound');

SET @ENTRY := 30471; -- Vargul Assailant SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,"Vargul Assailant - On Spawn - Start Waypoint"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant"),
(@ENTRY,0,2,0,0,0,100,0,4500,5599,13400,15600,11,43410,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Chop'"),
(@ENTRY,0,3,0,0,0,100,0,8000,9000,35000,37000,11,23262,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Demoralize'");

SET @ENTRY := 30471;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@ENTRY, 1, 8032.39, 3343.51, 632.39, 'Vargul Assailant');

SET @ENTRY := 30432; -- Grimmr Hound SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,"Grimmr Hound - On Spawn - Start Waypoint"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimmr Hound - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant");

SET @ENTRY := 30432;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@ENTRY, 1, 8032.39, 3343.51, 632.39, 'Grimmr Hound');

SET @ENTRY := 30404; -- Dr. Terrible SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,"Dr. Terrible - On Spawn - Start Waypoint"),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,15000,19000,11,61143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Crazed Chop'"),
(@ENTRY,0,3,0,0,0,100,0,10000,12000,28000,33000,11,61146,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Slime Stream'"),
(@ENTRY,0,4,5,2,0,100,1,0,45,0,0,11,31730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,0,45,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Say Line 1 (No Repeat)"),
(@ENTRY,0,6,7,6,0,100,1,0,0,0,0,11,32067,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Cast 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' (No Repeat)"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Say Line 2 (No Repeat)");

SET @ENTRY := 30404;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@ENTRY, 1, 8032.39, 3343.51, 632.39, 'Dr. Terrible');


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


-- Tirisfal Creature Abilities
-- Fellicent's Shade SAI
SET @ENTRY := 10358;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Cast 'Arcane Bolt' (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,3400,4700,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-40 Range - Cast 'Arcane Bolt' (Phase 1)"),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 40-100 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 10-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-40 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 0-15% Mana - Enable Combat Movement (Phase 2)"),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,10,0,9,1,100,0,0,10,15000,17000,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-10 Range - Cast 'Arcane Explosion' (Phase 1)"),
(@ENTRY,0,11,0,0,1,100,0,5000,9000,22000,26000,11,7068,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - In Combat - Cast 'Veil of Shadow' (Phase 1)");

-- Wandering Spirit SAI
SET @ENTRY := 1532;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,16000,18000,11,7713,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wandering Spirit - Within 0-8 Range - Cast 'Wailing Dead'");

-- Maggot Eye SAI
SET @ENTRY := 1753;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,75,7000,14000,11,3243,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maggot Eye - Between 0-75% Health - Cast 'Life Harvest'"),
(@ENTRY,0,1,0,0,0,100,0,4000,9000,30000,45000,11,3237,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maggot Eye - In Combat - Cast 'Curse of Thule'");

-- Rot Hide Graverobber SAI
SET @ENTRY := 1941;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,9000,30000,45000,11,3237,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rot Hide Graverobber - In Combat - Cast 'Curse of Thule'");

-- Rot Hide Gnoll SAI
SET @ENTRY := 1674;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,4000,12000,0,0,11,3237,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rot Hide Gnoll - In Combat - Cast 'Curse of Thule' (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rot Hide Gnoll - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Scarlet Initiate SAI
SET @ENTRY := 1507;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,7,0,0,0,100,0,0,0,3500,5000,11,20793,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Initiate - In Combat - Cast 'Fireball'"),
(@ENTRY,0,10,0,23,0,100,0,12544,0,5000,10000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Initiate - On Has Aura 'Frost Armor' - Cast 'Frost Armor'"),
(@ENTRY,0,11,0,4,0,50,0,0,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Initiate - On Aggro - Say Line 0");

-- Vile Fin Minor Oracle SAI
SET @ENTRY := 1544;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Cast 'Lightning Bolt' (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,3400,4700,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 0-40 Range - Cast 'Lightning Bolt' (Phase 1)"),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 40-100 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 10-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 0-40 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Mana - Enable Combat Movement (Phase 2)"),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,10,0,2,2,100,1,0,15,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Set Event Phase 3 (Phase 2) (No Repeat)"),
(@ENTRY,0,11,0,2,3,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Flee For Assist (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,12,0,7,3,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Evade - Set Event Phase 0 (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,13,0,2,3,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Say Line 0 (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,14,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,15,0,16,1,100,0,12550,1,15000,30000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield' (Phase 1)");

-- Vile Fin Muckdweller SAI
SET @ENTRY := 1545;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Muckdweller - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,0,67,0,100,0,9000,12000,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Muckdweller - On Behind Target - Cast 'Backstab'");

-- Sri'skulk SAI
SET @ENTRY := 10359;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,16000,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sri'skulk - In Combat - Cast 'Deadly Poison'");

-- Lost Soul SAI
SET @ENTRY := 1531;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,9053,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lost Soul - In Combat - Cast 'Fireball'");

-- Captain Perrine SAI
SET @ENTRY := 1662;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Perrine - In Combat - Cast 'Shield Block'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Perrine - Between 0-30% Health - Cast 'Frenzy' (No Repeat)");

-- Scarlet Zealot SAI
SET @ENTRY := 1537;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,16000,11,8191,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Zealot - In Combat - Cast 'Zeal'");

-- Hungering Dead SAI
SET @ENTRY := 1527;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3500,5000,12000,15000,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hungering Dead - In Combat - Cast 'Disease Touch'");


-- Alchemist's Stone
DELETE FROM `spell_proc_event` WHERE `entry`=17619;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(17619, 0, 13, 0, 0, 0, 34816, 3, 0, 0, 0);


-- Serendipity
DELETE FROM `spell_proc_event` WHERE (`entry`='-63730');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `Cooldown`) VALUES ('-63730', '6', '2048', '4', '1');


-- Bhag'thera http://wotlk.openwow.com/npc=728
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=728;


-- Sin'Dall http://wotlk.openwow.com/npc=729
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=729;

-- Seaforium Depth Charge SAI
SET @ENTRY := 25401;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Seaforium Depth Charge - On Respawn - Store Targetlist"),
(@ENTRY,0,1,6,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Seaforium Depth Charge - On Respawn - Run Script"),
(@ENTRY,0,2,0,1,2,100,1,100,100,0,0,11,45506,0,0,0,0,0,23,0,0,0,0,0,0,0,"Seaforium Depth Charge - Out of Combat - Cast 'Nerub'ar Sinkhole Credit (SW)' (Phase 2) (No Repeat)"),
(@ENTRY,0,3,0,1,2,100,1,100,100,0,0,11,45508,0,0,0,0,0,23,0,0,0,0,0,0,0,"Seaforium Depth Charge - Out of Combat - Cast 'Nerub'ar Sinkhole Credit (SE)' (Phase 2) (No Repeat)"),
(@ENTRY,0,4,0,1,2,100,1,100,100,0,0,11,45510,2,0,0,0,0,23,0,0,0,0,0,0,0,"Seaforium Depth Charge - Out of Combat - Cast 'Nerub'ar Sinkhole Credit (NW)' (Phase 2) (No Repeat)"),
(@ENTRY,0,5,0,1,2,100,1,100,100,0,0,11,45512,0,0,0,0,0,23,0,0,0,0,0,0,0,"Seaforium Depth Charge - Out of Combat - Cast 'Nerub'ar Sinkhole Credit (NE)' (Phase 2) (No Repeat)"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Seaforium Depth Charge - On Respawn - Set Rooted On");



-- Betrayal - [A][H] http://www.wowhead.com/quest=12713/betrayal

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=51966;
INSERT INTO conditions VALUES (17, 0, 51966, 0, 0, 29, 0, 28998, 70, 0, 1, 60, 0, '', 'Requires no npc in range');
DELETE FROM creature WHERE id=28750 AND position_z>570; -- Remove mobs which shouldnt be there

DELETE FROM smart_scripts WHERE entryorguid=2899800 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2899800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, 28931, 0, 100, 0, 0, 0, 0, 'Overlord Drakuru - Script - Deswpan Trolls'),
    (2899800, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 29100, 0, 200, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6184.15, -1970.17, 586.842, 4.59022, 'Overlord Drakuru - Script - Summon Blightblood Troll 1'),
    (2899800, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6222.85, -2026.63, 586.842, 3.00197, 'Overlord Drakuru - Script - Summon Blightblood Troll 2'),
    (2899800, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6127.51, -2008.65, 586.842, 6.16101, 'Overlord Drakuru - Script - Summon Blightblood Troll 3'),
    (2899800, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6166.28, -2065.31, 586.842, 1.44862, 'Overlord Drakuru - Script - Summon Blightblood Troll 4'),
    (2899800, 9, 7, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 8, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 54089, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Cast Drop Disguise'),
    (2899800, 9, 10, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Remove Scourge Disguise from Target'),
    (2899800, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Unit Flags'),
    (2899800, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 28931, 0, 200, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Data on Blightblood Troll'),
    (2899800, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 974, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Faction'),
    (2899800, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say');

DELETE FROM smart_scripts WHERE entryorguid=28503 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28503, 0, 0, 0, 62, 0, 100, 0, 9731, 1, 0, 0, 11, 52224, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 1 Selected - Cast \'Kill Credit\''),
    (28503, 0, 1, 0, 62, 0, 100, 0, 9731, 2, 0, 0, 11, 52253, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 2 Selected - Cast \'Kill Credit\''),
    (28503, 0, 2, 0, 62, 0, 100, 0, 9731, 3, 0, 0, 11, 52355, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 3 Selected - Cast \'Quest Complete Credit Credit\''),
    (28503, 0, 3, 0, 62, 0, 100, 0, 9731, 4, 0, 0, 11, 52680, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 4 Selected - Cast \'Kill Credit\''),
    (28503, 0, 4, 0, 62, 0, 100, 0, 9731, 5, 0, 0, 11, 52675, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 5 Selected - Cast \'Kill Credit\''),
    (28503, 0, 5, 6, 62, 0, 100, 0, 9731, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 0 Selected - Store Target'),
    (28503, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 85, 52863, 2, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 0 Selected - Cast Drakuru Betrayal Teleport'),
    (28503, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 28998, 4, 180000, 0, 0, 0, 8, 0, 0, 0, 6175.25, -2017.66, 590.961, 2.98451, 'Overlord Drakuru - On Gossip Option 0 Selected - Summon Drakuru');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=9731 AND SourceEntry=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 9731, 0, 0, 0, 29, 0, 28998, 200, 0, 1, 0, 0, '', 'Show gossip if Drakuru is not already summoned AND'),
    (15, 9731, 0, 0, 0, 9, 0, 12713, 0, 0, 0, 0, 0, '', 'Show gossip option only if player has taken quest 12713');

DELETE FROM gameobject_loot_template WHERE Entry=25108 AND Item=43059;
UPDATE gameobject_loot_template SET Chance=100 WHERE Entry=25108 AND Item=40425;


-- Mending Fences -- [A][H] http://www.wowhead.com/quest=12915/mending-fences
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=55818;
INSERT INTO `conditions` VALUES (17, 0, 55818, 0, 0, 31, 1, 3, 29375, 0, 0, 0, 0, '', 'Requires Stormforged Iron Giant');
INSERT INTO `conditions` VALUES (17, 0, 55818, 0, 1, 31, 1, 3, 29503, 0, 0, 0, 0, '', 'Requires Fjorn');
DELETE FROM spell_script_names WHERE spell_id=55818;
INSERT INTO spell_script_names VALUES(55818, "spell_q12915_mending_fences");
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=29927;
DELETE FROM smart_scripts WHERE entryorguid=29927 AND source_type=0;
INSERT INTO smart_scripts VALUES (29927, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 29375, 30, 0, 0, 0, 0, 0, 'Earthen Ironbane - Is Summoned - Attack Start');


-- Fel Reavers, No Thanks! -- [A][H] http://www.wowhead.com/quest=10855/fel-reavers-no-thanks

UPDATE quest_template_addon SET PrevQuestID=-10855 WHERE id=10850;

DELETE FROM `creature_text` WHERE `entry` = 22293;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`, `BroadcastTextId`) VALUES
(22293, 0, 0, "%s begins to sputter as its engine malfunctions.", 16, 0, 100, 0, 0, 0, 0, "Inactive Fel Reaver", 20103);

-- Creature Script - Inactive Fel Reaver
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 22293);
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 2229300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(22293, 0, 0, 0, 20, 0, 100, 0, 10850, 0, 0, 0, 80, 2229300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest complete - Action list'),
(2229300, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Say text'),
(2229300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list  - Remove npc flag'),
(2229300, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Random Move'),
(2229300, 9, 3, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 33, 22293, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Give Credit'),
(2229300, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Kill Itself');


-- Tirion's Gambit - [A] http://www.wowhead.com/quest=13403/tirions-gambit - [H] http://www.wowhead.com/quest=13364/tirions-gambit

SET @TIRION := 32239;
SET @LICHKING := 32184;
SET @DISGUISED := 32241;
SET @THASSARIAN := 32310;
SET @DARION := 32312;
SET @CHOSENZEALOT := 32175;
SET @EBONKNIGHT := 32309;
SET @KOLTIRA := 32311;

UPDATE creature SET spawntimesecs=10 WHERE id=@DISGUISED;
UPDATE creature_template SET npcflag=1, AIName='', ScriptName='npc_tirions_gambit_tirion' WHERE entry=@TIRION;

DELETE FROM spell_script_names WHERE spell_id=60532;
INSERT INTO spell_script_names VALUES (60532, 'spell_gen_default_count_pct_from_max_hp');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=60532;
INSERT INTO conditions VALUES(13, 3, 60532, 0, 0, 31, 0, 3, @LICHKING, 0, 0, 0, 0, '', 'Target Lich King');
INSERT INTO conditions VALUES(13, 4, 60532, 0, 0, 31, 0, 3, 32272, 0, 0, 0, 0, '', 'Target Invoker Basaleph');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=60456;
INSERT INTO conditions VALUES(13, 1, 60456, 0, 0, 31, 0, 3, 24042, 0, 0, 0, 0, '', 'Target Generic Trigger LAB');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=61487;
INSERT INTO conditions VALUES(13, 1, 61487, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Target All Players');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=60536;
INSERT INTO conditions VALUES(13, 1, 60536, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Target All Players');

DELETE FROM spell_target_position WHERE id=60585;
INSERT INTO spell_target_position VALUES (60585, 0, 571, 6488.94, 413.64, 481.22, 3.14, 0);

DELETE FROM creature_text WHERE entry IN(@TIRION, @LICHKING, @DISGUISED , @THASSARIAN, @DARION);
INSERT INTO creature_text VALUES (@TIRION, 0, 0, "It is time. May the Light give us strength.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 1, 0, "Keep your heads down and follow my lead.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 2, 0, "Here it comes. Stand ready.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 3, 0, "Something's wrong... I sense a dark presence.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 4, 0, "The Lich King is here. May the Light guide our blades.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 5, 0, "You sound a little too confident. Especially considering the way our last encounter ended.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 6, 0, "That might be, but I don't need to stand on holy ground to run that disembodied heart of yours with the Ashbringer.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 7, 0, "The heart... the last remaining vestige of your humanity. I had to stop it from being destroyed. I had to see for myself. And at last I'm sure...", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@TIRION, 8, 0, "Only shadows from the past remain. There's nothing left to redeem!", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Tirion Fordring');
INSERT INTO creature_text VALUES (@LICHKING, 0, 0, "Uninvited guests! Did you think you'd go unnoticed inside my dominion?", 12, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 1, 0, "I must confess... you were not altogether unexpected. I hope you find your final resting place... to your liking.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 2, 0, "Last time we met, you had the advantage of fighting on holy ground. You'll find that our situation has been... reversed.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 3, 0, "I call your bluff. You're a paladin after all. Your obsession with redemption goes beyond the inane.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 4, 0, "You surely wouldn't destroy humanity's only chance to redeem its most wayward son. You'd sooner die!", 12, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 5, 0, "Arrrrggggggggggh!!!!", 14, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@LICHKING, 6, 0, "You... will pay for that, old man. Slay them all!", 14, 0, 100, 0, 0, 0, 0, 0, 'Lich King');
INSERT INTO creature_text VALUES (@DISGUISED , 0, 0, "Tirion's Down! Defend him with your lives!", 14, 0, 100, 0, 0, 0, 0, 0, 'Disguised Crusader');
INSERT INTO creature_text VALUES (@THASSARIAN, 0, 0, "I hope you fellows don't mind if we crash this party. I brought some old friends with me!", 14, 0, 100, 0, 0, 0, 0, 0, 'Thassarian');
INSERT INTO creature_text VALUES (@THASSARIAN, 1, 0, "Looks like whatever Tirion did put some hurt on the Lich King. It's too bad we cant' finish him off...", 12, 0, 100, 0, 0, 0, 0, 0, 'Thassarian');
INSERT INTO creature_text VALUES (@DARION, 0, 0, "Quick, through the portal! He won't stay down for long.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Darion Mograine');
INSERT INTO creature_text VALUES (@DARION, 1, 0, "Patience... we will get our chance soon enough. Be content that for once, it is Tirion who is in our debt.", 12, 0, 100, 0, 0, 0, 0, 0, 'Highlord Darion Mograine');

UPDATE creature_template SET faction=35, AIName='' WHERE entry=@LICHKING;

DELETE FROM creature_equip_template WHERE CreatureID=@TIRION;
INSERT INTO creature_equip_template VALUES (@TIRION, 2, 13262, 0, 0, 0);

UPDATE creature_template SET faction=2144, AIName='SmartAI' WHERE entry IN(@EBONKNIGHT, @THASSARIAN, @KOLTIRA, @DARION);
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@CHOSENZEALOT;
DELETE FROM smart_scripts WHERE entryorguid IN (@EBONKNIGHT, @THASSARIAN, @KOLTIRA, @DARION, @CHOSENZEALOT) AND source_type=0;
INSERT INTO smart_scripts VALUES (@CHOSENZEALOT, 0, 0, 0, 0, 0, 30, 0, 3000, 20000, 60000, 100000, 11, 12530, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Frailty');
INSERT INTO smart_scripts VALUES (@CHOSENZEALOT, 0, 1, 0, 0, 0, 30, 0, 3000, 6000, 10000, 15000, 11, 13445, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Rend');
INSERT INTO smart_scripts VALUES (@EBONKNIGHT, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 10000, 10000, 11, 58843, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Icy Touch');
INSERT INTO smart_scripts VALUES (@EBONKNIGHT, 0, 1, 0, 0, 0, 100, 0, 7000, 8000, 10000, 10000, 11, 59011, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Plague Strike');
INSERT INTO smart_scripts VALUES (@THASSARIAN, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 10000, 10000, 11, 58843, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Icy Touch');
INSERT INTO smart_scripts VALUES (@THASSARIAN, 0, 1, 0, 0, 0, 100, 0, 7000, 8000, 10000, 10000, 11, 59011, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Plague Strike');
INSERT INTO smart_scripts VALUES (@KOLTIRA, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 10000, 10000, 11, 58843, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Icy Touch');
INSERT INTO smart_scripts VALUES (@KOLTIRA, 0, 1, 0, 0, 0, 100, 0, 7000, 8000, 10000, 10000, 11, 59011, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Plague Strike');
INSERT INTO smart_scripts VALUES (@DARION, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 10000, 10000, 11, 58843, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Icy Touch');
INSERT INTO smart_scripts VALUES (@DARION, 0, 1, 0, 0, 0, 100, 0, 7000, 8000, 10000, 10000, 11, 59011, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - cast Plague Strike');
INSERT INTO smart_scripts VALUES (@DARION, 0, 2, 0, 21, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @TIRION, 100, 0, 0, 0, 0, 0, 'On Reached Home - Set Data');

DELETE FROM creature_summon_groups WHERE summonerId=@TIRION AND summonerType=0;
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @EBONKNIGHT, 6160.74, 2695.90, 573.92, 2.04, 3, 200000);
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @EBONKNIGHT, 6164.98, 2697.90, 573.92, 2.04, 3, 200000);
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @EBONKNIGHT, 6161.26, 2700.05, 573.92, 2.04, 3, 200000);
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @THASSARIAN, 6159.74, 2697.90, 573.92, 2.04, 3, 200000);
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @KOLTIRA, 6163.98, 2699.90, 573.92, 2.04, 3, 200000);
INSERT INTO creature_summon_groups VALUES (@TIRION, 0, 1, @DARION, 6160.26, 2702.05, 573.92, 2.04, 3, 200000);

DELETE FROM script_waypoint WHERE entry=@TIRION;
INSERT INTO script_waypoint VALUES (@TIRION, 1, 6241.8, 2653.47, 570.25, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 2, 6241.43, 2641.81, 570.25, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 3, 6230.28, 2631.59, 570.25, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 4, 6214.25, 2621.85, 570.25, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 5, 6199.11, 2627.92, 570.25, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 6, 6190.45, 2637.36, 570.25, 7000, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 7, 6183.45, 2652.09, 572.712, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 8, 6177.65, 2664.32, 574.714, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 9, 6171.07, 2678.02, 573.946, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 10, 6161.03, 2699.21, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 11, 6151.67, 2719.33, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 12, 6146.26, 2730.94, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 13, 6157.07, 2739.95, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 14, 6163.31, 2745.15, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 15, 6167.47, 2750.77, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 16, 6168.12, 2754.28, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 17, 6165.3, 2759.85, 573.914, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 18, 6167.28, 2756.97, 573.92, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 19, 6143.07, 2756.57, 573.92, 0, 'Highlord Tirion Fordring');
INSERT INTO script_waypoint VALUES (@TIRION, 20, 6137.06, 2756.0, 573.92, 0, 'Highlord Tirion Fordring');


-- Updates for the Icecrwon Infra green bomber quests.

UPDATE creature_template SET KillCredit2=32188, AIName='', ScriptName='npc_gargoyle_ambusher' WHERE entry=32769; -- Gargoyle Ambusher

UPDATE creature_template SET KillCredit1=31721, AIName='', ScriptName='npc_frostbrood_sentry' WHERE entry=32767; -- Frostbrood Sentry

UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=0,spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31407;
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31840;

DELETE from spell_scripts WHERE id IN(59622, 60287);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(60287, 59622);

UPDATE creature_template SET KillCredit1=32399 WHERE entry=31812; -- Decomposed Ghoul
UPDATE creature_template SET KillCredit1=32410 WHERE entry=31815; -- Bone Giant

DELETE FROM smart_scripts WHERE entryorguid=32769 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=32767 AND source_type=0;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(47438, 47441);
INSERT INTO conditions VALUES (13, 1, 47438, 0, 0, 31, 0, 3, 26607, 0, 0, 0, 0, '', 'Target Anub''ar Blightbeast');
INSERT INTO conditions VALUES (13, 1, 47441, 0, 0, 31, 0, 3, 26607, 0, 0, 0, 0, '', 'Target Anub''ar Blightbeast');

-- http://wowwiki.wikia.com/wiki/Torch_Juggler 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6937 AND `type`=6 AND `value1`=4395;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(6937, 6, 4395, 0, '');


DELETE FROM `gameobject` WHERE id IN(193763,
193582,
193757,
193982,
193758,
193756,
193579,
193762,
193764,
193754,
193759,
193761,
193760,
193748,
193755,
193753,
193752,
193750,
193751,
193747,
193749,
193744,
193746,
193736,
193745,
193796,
193731,
193742,
193741,
193730,
193738,
193743,
193765,
193732,
193735,
193733,
193722,
193734,
193984,
193723,
193721,
193720,
193737,
193739,
193984,
193740,
193718,
193715,
193717,
193714,
193716,
193713,
193707,
193705,
193712,
193766,
193698,
193719,
193708,
193706,
193729,
193728,
193699,
193727,
193704,
193724,
193703,
193701,
193697,
193726,
193725,
193696,
193702, 
193700,
193710, 
193709, 
193711, 
193984, 
193984);

INSERT INTO `gameobject` VALUES (268839, 193697, 571, 0, 0, 1, 1, 7895.76, 2072.58, 600.27, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268838, 193698, 571, 0, 0, 1, 1, 7896.03, 2071.15, 600.233, -1.92896, 0, 0, -0.821753, 0.569844, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268837, 193699, 571, 0, 0, 1, 1, 7897.21, 2071.01, 601.419, -1.93571, 0, 0, -0.823671, 0.567068, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268836, 193700, 571, 0, 0, 1, 1, 7898.75, 2071.19, 600.251, 1.24791, 0, 0, 0.584249, 0.811574, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268835, 193701, 571, 0, 0, 1, 1, 7902.83, 2065.02, 600.257, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268834, 193702, 571, 0, 0, 1, 1, 7903.08, 2065.35, 601.462, -2.97579, 0, 0, -0.996566, 0.0828064, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268833, 193703, 571, 0, 0, 1, 1, 7902.85, 2064.88, 601.479, 2.18166, 0, 0, 0.88701, 0.461749, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268832, 193704, 571, 0, 0, 1, 1, 7902.36, 2065.16, 601.459, -2.8873, 0, 0, -0.991928, 0.126804, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268831, 193705, 571, 0, 0, 1, 1, 7901.54, 2064.54, 601.473, 0.401427, 0, 0, 0.199369, 0.979925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268830, 193706, 571, 0, 0, 1, 1, 7902.22, 2064.3, 601.473, -0.56723, 0, 0, -0.279828, 0.96005, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268829, 193707, 571, 0, 0, 1, 1, 7899.48, 2067.53, 600.657, 2.34747, 0, 0, 0.922201, 0.38671, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268828, 193708, 571, 0, 0, 1, 1, 7896.18, 2071.19, 601.443, -2.86232, 0, 0, -0.990267, 0.139183, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268827, 193709, 571, 0, 0, 1, 1, 7905.86, 2057.76, 601.122, -1.64058, 0, 0, -0.731344, 0.682009, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268826, 193710, 571, 0, 0, 1, 1, 7905.79, 2056.77, 600.253, -1.03847, 0, 0, -0.496216, 0.868199, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268825, 193711, 571, 0, 0, 1, 1, 7905.84, 2058.81, 600.253, -2.43473, 0, 0, -0.938191, 0.346119, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268824, 193712, 571, 0, 0, 1, 1, 7902.72, 2049.29, 600.261, 1.71042, 0, 0, 0.754709, 0.65606, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268823, 193713, 571, 0, 0, 1, 1, 7902.54, 2049.58, 600.25, 1.84476, 0, 0, 0.797041, 0.603925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268822, 193714, 571, 0, 0, 1, 1, 7902.29, 2049.42, 600.264, -1.42244, 0, 0, -0.652758, 0.757566, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268821, 193715, 571, 0, 0, 1, 1, 7902.14, 2049.52, 600.262, -0.93375, 0, 0, -0.450098, 0.892979, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268820, 193716, 571, 0, 0, 1, 1, 7902.39, 2049.29, 600.24, -2.64417, 0, 0, -0.96923, 0.246155, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268819, 193717, 571, 0, 0, 1, 1, 7902.18, 2049.3, 600.461, -1.10828, 0, 0, -0.526212, 0.850353, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268818, 193718, 571, 0, 0, 1, 1, 7901.95, 2049.21, 600.24, 2.92342, 0, 0, 0.994056, 0.10887, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268817, 193719, 571, 0, 0, 1, 1, 7902.19, 2063.95, 601.511, -1.96349, 0, 0, -0.831468, 0.555572, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268816, 193720, 571, 0, 0, 1, 1, 7899.41, 2047.68, 600.681, 0.750491, 0, 0, 0.366501, 0.930418, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268815, 193721, 571, 0, 0, 1, 1, 7896.48, 2044.01, 600.13, 2.09439, 0, 0, 0.866024, 0.500002, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268814, 193722, 571, 0, 0, 1, 1, 7894.41, 2047.29, 601.309, 3.01067, 0, 0, 0.997858, 0.0654146, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268813, 193723, 571, 0, 0, 1, 1, 7896.35, 2044, 601.35, 0.575958, 0, 0, 0.284015, 0.95882, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268812, 193724, 571, 0, 0, 1, 1, 7904.04, 2050.09, 600.233, 0.706858, 0, 0, 0.346117, 0.938191, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268811, 193725, 571, 0, 0, 1, 1, 7904.38, 2050.16, 600.238, -1.68424, 0, 0, -0.746056, 0.665883, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268810, 193726, 571, 0, 0, 1, 1, 7904.18, 2049.76, 600.239, 2.08567, 0, 0, 0.863836, 0.503773, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268809, 193727, 571, 0, 0, 1, 1, 7889.88, 2074.63, 600.247, 0.584686, 0, 0, 0.288197, 0.957571, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268808, 193728, 571, 0, 0, 1, 1, 7888.88, 2074.65, 601.116, -0.017419, 0, 0, -0.00870939, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268807, 193729, 571, 0, 0, 1, 1, 7887.84, 2074.57, 600.247, -0.811576, 0, 0, -0.394743, 0.918792, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268806, 193730, 571, 0, 0, 1, 1, 7873.63, 2065.22, 600.23, 2.80997, 0, 0, 0.986285, 0.165053, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268805, 193731, 571, 0, 0, 1, 1, 7873.7, 2064.57, 600.339, -0.549681, 0, 0, -0.271393, 0.962469, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268804, 193732, 571, 0, 0, 1, 1, 7873.58, 2065.55, 600.361, 0.759044, 0, 0, 0.370477, 0.928842, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268803, 193733, 571, 0, 0, 1, 1, 7874.12, 2066.33, 600.244, 2.86233, 0, 0, 0.990267, 0.139178, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268802, 193734, 571, 0, 0, 1, 1, 7874.18, 2066.85, 600.269, 2.27762, 0, 0, 0.908136, 0.418675, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268801, 193735, 571, 0, 0, 1, 1, 7873.96, 2066.1, 600.263, -0.872663, 0, 0, -0.422618, 0.906308, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268800, 193736, 571, 0, 0, 1, 1, 7878.23, 2068.07, 600.557, -2.3911, 0, 0, -0.930417, 0.366502, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268799, 193737, 571, 0, 0, 1, 1, 7880.95, 2071.65, 600.217, -1.02974, 0, 0, -0.492422, 0.870357, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268798, 193738, 571, 0, 0, 1, 1, 7881.41, 2070.34, 601.433, 1.95477, 0, 0, 0.829038, 0.559192, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268797, 193739, 571, 0, 0, 1, 1, 7881.29, 2071.99, 601.419, 0.157079, 0, 0, 0.0784588, 0.996917, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268796, 193740, 571, 0, 0, 1, 1, 7880.1, 2072.08, 601.421, -0.270523, 0, 0, -0.134849, 0.990866, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268795, 193741, 571, 0, 0, 1, 1, 7888.47, 2041.05, 601.082, 3.09799, 0, 0, 0.999762, 0.0217996, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268794, 193742, 571, 0, 0, 1, 1, 7887.47, 2041.1, 600.216, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268793, 193743, 571, 0, 0, 1, 1, 7889.51, 2041.1, 600.216, 2.30383, 0, 0, 0.913544, 0.406739, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268792, 193744, 571, 0, 0, 1, 1, 7871.47, 2057.94, 601.099, 1.47483, 0, 0, 0.672377, 0.740209, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268791, 193745, 571, 0, 0, 1, 1, 7871.44, 2059.16, 600.23, 2.07694, 0, 0, 0.861629, 0.507539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268790, 193746, 571, 0, 0, 1, 1, 7871.34, 2057.12, 600.23, 0.680679, 0, 0, 0.333807, 0.942641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268789, 193747, 571, 0, 0, 1, 1, 7879.74, 2044.7, 600.14, -2.15548, 0, 0, -0.88089, 0.47332, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268788, 193748, 571, 0, 0, 1, 1, 7881.17, 2045.81, 600.035, -3.08918, 0, 0, -0.999657, 0.0262033, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268787, 193749, 571, 0, 0, 1, 1, 7881.34, 2043.52, 600.008, -0.418879, 0, 0, -0.207912, 0.978148, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268786, 193750, 571, 0, 0, 1, 1, 7874.78, 2050.18, 600.129, 0.759219, 0, 0, 0.370558, 0.928809, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268785, 193751, 571, 0, 0, 1, 1, 7874.74, 2050.31, 601.349, -0.759215, 0, 0, -0.370556, 0.92881, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268784, 193752, 571, 0, 0, 1, 1, 7874.64, 2050.93, 601.321, -2.1293, 0, 0, -0.874619, 0.48481, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268783, 193753, 571, 0, 0, 1, 1, 7875, 2050.97, 601.319, -1.44862, 0, 0, -0.662619, 0.748957, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268782, 193754, 571, 0, 0, 1, 1, 7890.59, 2057.9, 600.165, 0.017454, 0, 0, 0.00872689, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268781, 193755, 571, 0, 0, 1, 1, 7877.74, 2047.84, 600.669, -0.802851, 0, 0, -0.390731, 0.920505, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268780, 193756, 571, 0, 0, 1, 1, 7888.6, 2057.9, 598.534, -0.139624, 0, 0, -0.0697553, 0.997564, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268779, 193758, 571, 0, 0, 1, 1, 7888.88, 2057.81, 600.495, -1.56207, 0, 0, -0.704015, 0.710185, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268778, 193759, 571, 0, 0, 1, 1, 7889.98, 2059.47, 600.244, -2.93214, 0, 0, -0.994521, 0.104535, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268777, 193760, 571, 0, 0, 1, 1, 7890.54, 2060.25, 600.248, -2.0333, 0, 0, -0.85035, 0.526218, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268776, 193761, 571, 0, 0, 1, 1, 7889.73, 2060.41, 600.258, 2.95833, 0, 0, 0.995805, 0.0915032, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268774, 193763, 571, 0, 0, 1, 1, 7885.77, 2057.76, 600.887, 0.063894, 0, 0, 0.0319416, 0.99949, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268770, 193796, 571, 0, 0, 1, 1, 7888.96, 2058.19, 586.427, -2.57972, 0, 0, -0.960796, 0.277255, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268768, 193982, 571, 0, 0, 1, 1, 7888.73, 2057.92, 599.815, 0, 0, 0, 0, 1, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268767, 193579, 571, 0, 0, 1, 1, 7889.04, 2057.88, 599.815, -0.698131, 0, 0, -0.34202, 0.939693, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268766, 193696, 571, 0, 0, 1, 1, 7637.64, 2074.04, 600.272, 2.60926, 0, 0, 0.964786, 0.263035, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268765, 193697, 571, 0, 0, 1, 1, 7635.76, 2074.88, 600.27, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268764, 193698, 571, 0, 0, 1, 1, 7636.03, 2073.45, 600.233, -1.92896, 0, 0, -0.821753, 0.569844, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268763, 193699, 571, 0, 0, 1, 1, 7637.21, 2073.31, 601.419, -1.93571, 0, 0, -0.823671, 0.567068, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268762, 193700, 571, 0, 0, 1, 1, 7638.75, 2073.49, 600.251, 1.24791, 0, 0, 0.584249, 0.811574, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268761, 193701, 571, 0, 0, 1, 1, 7642.83, 2067.32, 600.257, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268760, 193702, 571, 0, 0, 1, 1, 7643.08, 2067.65, 601.462, -2.97579, 0, 0, -0.996566, 0.0828064, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268759, 193703, 571, 0, 0, 1, 1, 7642.85, 2067.18, 601.479, 2.18166, 0, 0, 0.88701, 0.461749, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268758, 193704, 571, 0, 0, 1, 1, 7642.36, 2067.46, 601.459, -2.8873, 0, 0, -0.991928, 0.126804, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268757, 193705, 571, 0, 0, 1, 1, 7641.54, 2066.84, 601.473, 0.401427, 0, 0, 0.199369, 0.979925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268756, 193706, 571, 0, 0, 1, 1, 7642.22, 2066.7, 601.473, -0.56723, 0, 0, -0.279828, 0.96005, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268755, 193707, 571, 0, 0, 1, 1, 7639.48, 2069.83, 600.657, 2.34747, 0, 0, 0.922201, 0.38671, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268754, 193708, 571, 0, 0, 1, 1, 7636.18, 2073.49, 601.443, -2.86232, 0, 0, -0.990267, 0.139183, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268753, 193709, 571, 0, 0, 1, 1, 7645.86, 2060.06, 601.122, -1.64058, 0, 0, -0.731344, 0.682009, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268752, 193710, 571, 0, 0, 1, 1, 7645.79, 2059.07, 600.253, -1.03847, 0, 0, -0.496216, 0.868199, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268751, 193711, 571, 0, 0, 1, 1, 7645.84, 2061.11, 600.253, -2.43473, 0, 0, -0.938191, 0.346119, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268750, 193712, 571, 0, 0, 1, 1, 7642.72, 2051.59, 600.261, 1.71042, 0, 0, 0.754709, 0.65606, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268749, 193713, 571, 0, 0, 1, 1, 7642.54, 2051.88, 600.25, 1.84476, 0, 0, 0.797041, 0.603925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268748, 193714, 571, 0, 0, 1, 1, 7642.29, 2051.72, 600.264, -1.42244, 0, 0, -0.652758, 0.757566, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268747, 193715, 571, 0, 0, 1, 1, 7642.14, 2051.82, 600.262, -0.93375, 0, 0, -0.450098, 0.892979, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268746, 193716, 571, 0, 0, 1, 1, 7642.39, 2051.59, 600.24, -2.64417, 0, 0, -0.96923, 0.246155, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268745, 193717, 571, 0, 0, 1, 1, 7642.18, 2051.6, 600.461, -1.10828, 0, 0, -0.526212, 0.850353, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268744, 193718, 571, 0, 0, 1, 1, 7641.95, 2051.51, 600.24, 2.92342, 0, 0, 0.994056, 0.10887, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268743, 193719, 571, 0, 0, 1, 1, 7642.19, 2066.25, 601.511, -1.96349, 0, 0, -0.831468, 0.555572, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268742, 193720, 571, 0, 0, 1, 1, 7639.41, 2049.98, 600.681, 0.750491, 0, 0, 0.366501, 0.930418, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268741, 193721, 571, 0, 0, 1, 1, 7636.48, 2046.31, 600.13, 2.09439, 0, 0, 0.866024, 0.500002, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268740, 193722, 571, 0, 0, 1, 1, 7636.71, 2047.29, 601.309, 3.01067, 0, 0, 0.997858, 0.0654146, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268739, 193723, 571, 0, 0, 1, 1, 7636.35, 2046.3, 601.35, 0.575958, 0, 0, 0.284015, 0.95882, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268738, 193724, 571, 0, 0, 1, 1, 7644.04, 2052.39, 600.233, 0.706858, 0, 0, 0.346117, 0.938191, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268737, 193725, 571, 0, 0, 1, 1, 7644.38, 2052.46, 600.238, -1.68424, 0, 0, -0.746056, 0.665883, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268736, 193726, 571, 0, 0, 1, 1, 7644.18, 2052.06, 600.239, 2.08567, 0, 0, 0.863836, 0.503773, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268735, 193727, 571, 0, 0, 1, 1, 7629.88, 2076.93, 600.247, 0.584686, 0, 0, 0.288197, 0.957571, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268734, 193728, 571, 0, 0, 1, 1, 7628.88, 2076.95, 601.116, -0.017419, 0, 0, -0.00870939, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268733, 193729, 571, 0, 0, 1, 1, 7627.84, 2076.87, 600.247, -0.811576, 0, 0, -0.394743, 0.918792, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268732, 193730, 571, 0, 0, 1, 1, 7613.63, 2067.52, 600.23, 2.80997, 0, 0, 0.986285, 0.165053, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268731, 193731, 571, 0, 0, 1, 1, 7613.7, 2066.87, 600.339, -0.549681, 0, 0, -0.271393, 0.962469, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268730, 193732, 571, 0, 0, 1, 1, 7613.58, 2067.85, 600.361, 0.759044, 0, 0, 0.370477, 0.928842, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268729, 193733, 571, 0, 0, 1, 1, 7614.12, 2068.63, 600.244, 2.86233, 0, 0, 0.990267, 0.139178, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268728, 193734, 571, 0, 0, 1, 1, 7614.18, 2069.15, 600.269, 2.27762, 0, 0, 0.908136, 0.418675, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268727, 193735, 571, 0, 0, 1, 1, 7613.96, 2068.4, 600.263, -0.872663, 0, 0, -0.422618, 0.906308, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268726, 193736, 571, 0, 0, 1, 1, 7618.23, 2070.37, 600.557, -2.3911, 0, 0, -0.930417, 0.366502, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268725, 193737, 571, 0, 0, 1, 1, 7620.95, 2073.95, 600.217, -1.02974, 0, 0, -0.492422, 0.870357, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268724, 193738, 571, 0, 0, 1, 1, 7621.41, 2072.64, 601.433, 1.95477, 0, 0, 0.829038, 0.559192, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268723, 193739, 571, 0, 0, 1, 1, 7621.29, 2074.29, 601.419, 0.157079, 0, 0, 0.0784588, 0.996917, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268722, 193740, 571, 0, 0, 1, 1, 7620.1, 2074.38, 601.421, -0.270523, 0, 0, -0.134849, 0.990866, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268721, 193741, 571, 0, 0, 1, 1, 7628.47, 2043.35, 601.082, 3.09799, 0, 0, 0.999762, 0.0217996, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268720, 193742, 571, 0, 0, 1, 1, 7627.47, 2043.4, 600.216, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268719, 193743, 571, 0, 0, 1, 1, 7629.51, 2043.4, 600.216, 2.30383, 0, 0, 0.913544, 0.406739, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268718, 193744, 571, 0, 0, 1, 1, 7611.47, 2060.24, 601.099, 1.47483, 0, 0, 0.672377, 0.740209, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268717, 193745, 571, 0, 0, 1, 1, 7611.44, 2061.46, 600.23, 2.07694, 0, 0, 0.861629, 0.507539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268716, 193746, 571, 0, 0, 1, 1, 7611.34, 2059.42, 600.23, 0.680679, 0, 0, 0.333807, 0.942641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268715, 193747, 571, 0, 0, 1, 1, 7619.74, 2047, 600.14, -2.15548, 0, 0, -0.88089, 0.47332, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268714, 193748, 571, 0, 0, 1, 1, 7621.17, 2048.11, 600.035, -3.08918, 0, 0, -0.999657, 0.0262033, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268713, 193749, 571, 0, 0, 1, 1, 7621.34, 2045.82, 600.008, -0.418879, 0, 0, -0.207912, 0.978148, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268712, 193750, 571, 0, 0, 1, 1, 7614.78, 2052.48, 600.129, 0.759219, 0, 0, 0.370558, 0.928809, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268711, 193751, 571, 0, 0, 1, 1, 7614.74, 2052.61, 601.349, -0.759215, 0, 0, -0.370556, 0.92881, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268710, 193752, 571, 0, 0, 1, 1, 7614.64, 2053.23, 601.321, -2.1293, 0, 0, -0.874619, 0.48481, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268709, 193753, 571, 0, 0, 1, 1, 7615, 2053.27, 601.319, -1.44862, 0, 0, -0.662619, 0.748957, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268708, 193754, 571, 0, 0, 1, 1, 7630.59, 2060.2, 600.165, 0.017454, 0, 0, 0.00872689, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268707, 193755, 571, 0, 0, 1, 1, 7617.74, 2050.14, 600.669, -0.802851, 0, 0, -0.390731, 0.920505, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268706, 193756, 571, 0, 0, 1, 1, 7628.6, 2060.2, 598.534, -0.139624, 0, 0, -0.0697553, 0.997564, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268705, 193757, 571, 0, 0, 1, 1, 7628.6, 2060.2, 599.632, -1.66679, 0, 0, -0.740218, 0.672367, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268704, 193758, 571, 0, 0, 1, 1, 7628.88, 2060.11, 600.495, -1.56207, 0, 0, -0.704015, 0.710185, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268703, 193759, 571, 0, 0, 1, 1, 7629.98, 2061.77, 600.244, -2.93214, 0, 0, -0.994521, 0.104535, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268702, 193760, 571, 0, 0, 1, 1, 7630.54, 2062.55, 600.248, -2.0333, 0, 0, -0.85035, 0.526218, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268701, 193761, 571, 0, 0, 1, 1, 7629.73, 2062.71, 600.258, 2.95833, 0, 0, 0.995805, 0.0915032, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268700, 193762, 571, 0, 0, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, -0.999047, 0.0436424, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268699, 193763, 571, 0, 0, 1, 1, 7625.77, 2060.06, 600.887, 0.063894, 0, 0, 0.0319416, 0.99949, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268698, 193764, 571, 0, 0, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.0392599, 0.999229, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268697, 193765, 571, 0, 0, 1, 1, 7635.56, 2046.72, 601.668, 1.26947, 0, 0, 0.592964, 0.805229, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268692, 193579, 571, 0, 0, 1, 1, 7629.04, 2060.18, 599.815, -0.698131, 0, 0, -0.34202, 0.939693, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268695, 193796, 571, 0, 0, 1, 1, 7628.96, 2060.49, 586.427, -2.57972, 0, 0, -0.960796, 0.277255, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268694, 193582, 571, 0, 0, 1, 1, 7628.51, 2059.91, 600.259, -1.41372, 0, 0, -0.649449, 0.760405, 300, 100, 1, 0);
INSERT INTO `gameobject` VALUES (268693, 193982, 571, 0, 0, 1, 1, 7628.73, 2060.22, 599.815, 0, 0, 0, 0, 1, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268696, 193766, 571, 0, 0, 1, 1, 7637.41, 2072.36, 600.272, 1.24824, 0, 0, 0.584383, 0.811478, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268691, 193984, 571, 0, 0, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0.991445, 0.130528, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268690, 193984, 571, 0, 0, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, -0.990268, 0.139173, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268689, 193984, 571, 0, 0, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0.139173, 0.990268, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268688, 193984, 571, 0, 0, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, -0.139173, 0.990268, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268840, 193696, 571, 0, 0, 1, 1, 7897.64, 2071.74, 600.272, 2.60926, 0, 0, 0.964786, 0.263035, 180, 255, 1, 0);


-- Trolls Is Gone Crazy! -- [A][H] www.wowhead.com/quest=12861/trolls-is-gone-crazy
DELETE FROM `creature` WHERE `id`=29686;

-- Plug the Sinkholes -- [A] -- http://www.wowhead.com/quest=11897/plug-the-sinkholes
UPDATE creature_template SET unit_flags=33555200, flags_extra=128 WHERE entry=26249;