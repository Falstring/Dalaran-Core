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

-- The Battle For Crusaders' Pinnacle [A][H] http://www.wowhead.com/quest=13141/the-battle-for-crusaders-pinnacle

UPDATE creature_template SET flags_extra=64 WHERE entry IN(30984, 30986, 30987, 30989);


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

UPDATE creature_template SET AIName='', ScriptName='npc_vargul_assailant' WHERE entry=30471; -- Vargul Assailant
DELETE FROM smart_scripts WHERE entryorguid=30471 AND source_type=0;
DELETE FROM waypoints WHERE entry=30471;

UPDATE creature_template SET AIName='', ScriptName='npc_grimmr_hound' WHERE entry=30432; -- Grimmr Hound
DELETE FROM smart_scripts WHERE entryorguid=30432 AND source_type=0;
DELETE FROM waypoints WHERE entry=30432;

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

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=56746;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (17, 0, 56746, 0, 0, 29, 0, 30471, 1, 0, 0, 97, 0, '', 'Spell Punch can be casted only within 1y from Vargul Assailant OR'),
    (17, 0, 56746, 0, 1, 29, 0, 30432, 1, 0, 0, 97, 0, '', 'Spell Punch can be casted only within 1y from Grimmr Hound OR'),
    (17, 0, 56746, 0, 2, 29, 0, 30404, 1, 0, 0, 97, 0, '', 'Spell Punch can be casted only within 1y from Dr. Terrible');


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


-- At the Enemy's Gates - [H] http://www.wowhead.com/quest=13856/at-the-enemys-gates [A] http://www.wowhead.com/quest=13847/at-the-enemys-gates

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=33438;
DELETE FROM smart_scripts WHERE entryorguid=33438 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (33438, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 33438, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 'Boneguard Footman - On Death - Kill Credit'),
    (33438, 0, 1, 0, 9, 0, 100, 0, 0, 1, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boneguard Footman - On Player in 1yd range - Die');



-- [Q] If he canot be turned -- http://wotlk.openwow.com/quest=12897
-- General Lightsbane SAI
SET @ENTRY := 29851;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,7,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29860,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29858,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29859,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Evade - Despawn In 1000 ms"),
(@ENTRY,0,4,5,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Just Summoned - Say Line 0"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"General Lightsbane - On Just Summoned - Start Attacking"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,80,@ENTRY*100+00,1,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Aggro - Run Script"),
(@ENTRY,0,7,0,9,0,100,0,0,5,13000,18000,11,60186,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 0-5 Range - Cast 'Plague Strike'"),
(@ENTRY,0,8,0,9,0,100,0,0,5,8000,11000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 0-5 Range - Cast 'Cleave'"),
(@ENTRY,0,9,0,9,0,100,0,3000,5000,10000,15000,11,60160,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 3000-5000 Range - Cast 'Death and Decay'"),
(@ENTRY,0,10,11,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29860,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29858,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29859,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,13,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Initialize - Despawn In 320000 ms");

UPDATE `gameobject_template` SET `Data3`=320000 WHERE  `entry`=191779;
UPDATE `creature_template` SET `HealthModifier`=20 WHERE  `entry` IN (29860, 29858, 29859);

-- Vile SAI
SET @ENTRY := 29860;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29860,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,8,29860,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,8,29860,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,8,29860,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,8,29860,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,11,37548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - On Aggro - Cast 'Taunt'"),
(@ENTRY,0,7,0,0,0,100,0,8000,15000,10000,15000,11,37548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - In Combat - Cast 'Taunt'"),
(@ENTRY,0,8,0,9,0,100,0,0,5,5000,8000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - Within 0-5 Range - Cast 'Backhand'"),
(@ENTRY,0,9,0,0,0,100,0,10000,15000,15000,23000,11,56646,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - In Combat - Cast 'Enrage'"),
(@ENTRY,0,10,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Initialize - Despawn In 320000 ms");

-- Lady Nightswood SAI
SET @ENTRY := 29858;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29858,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,7,29858,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,7,29858,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,7,29858,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,7,29858,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,0,0,100,0,0,8000,13000,18000,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,"Lady Nightswood - In Combat - Cast 'Banshee Curse'"),
(@ENTRY,0,7,0,9,0,100,0,0,5,4000,7000,11,16838,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - Within 0-5 Range - Cast 'Banshee Shriek'"),
(@ENTRY,0,8,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Initialize - Despawn In 320000 ms");

-- The Leaper SAI
SET @ENTRY := 29859;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29859,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,6,29859,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,6,29859,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,6,29859,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,6,29859,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,9,0,100,0,0,5,4000,7000,11,60195,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Leaper - Within 0-5 Range - Cast 'Sinister Strike'"),
(@ENTRY,0,7,0,0,0,100,0,5000,8000,30000,35000,11,60177,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - In Combat - Cast 'Hunger For Blood'"),
(@ENTRY,0,8,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Initialize - Despawn In 320000 ms");

-- [Q] Generosity Abounds - http://wotlk.openwow.com/quest=13146
-- Scourge Bomb SAI
SET @ENTRY := 31075;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,58203,0,30000,30000,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Scourge Bomb - On Spellhit 'Iron Chain' - Start Follow Invoker"),
(@ENTRY,0,1,0,34,0,100,0,0,0,0,0,11,58206,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Reached Point 0 - Cast 'Scourge Bomb Dragging Aura'"),
(@ENTRY,0,2,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Data Set 1 1 - Run Script"),
(@ENTRY,0,3,0,38,0,100,0,1,1,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Data Set 1 1 - Set Rooted On"),
(@ENTRY,0,4,0,60,0,100,0,1000,1000,1000,1000,3,0,27462,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Update - Morph To Model 27462");

-- [Q] The Sum is Greater than the Parts -- http://wotlk.openwow.com/quest=13043
UPDATE `creature_template` SET `speed_walk`=0.001, `speed_run`=0.001 WHERE  `entry`=30403;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=30403;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x20000000 WHERE  `entry` IN (30403,30404,30432,30471);

-- Vargul Assailant SAI
SET @ENTRY := 30471;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant"),
(@ENTRY,0,2,0,0,0,100,0,4500,5599,13400,15600,11,43410,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Chop'"),
(@ENTRY,0,3,0,0,0,100,0,8000,9000,35000,37000,11,23262,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Demoralize'"),
(@ENTRY,0,4,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - On Just Summoned - Set Active On");

-- Dr. Terrible SAI
SET @ENTRY := 30404;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,15000,19000,11,61143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Crazed Chop'"),
(@ENTRY,0,3,0,0,0,100,0,10000,12000,28000,33000,11,61146,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Slime Stream'"),
(@ENTRY,0,4,5,2,0,100,1,0,45,0,0,11,31730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,0,45,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Say Line 1 (No Repeat)"),
(@ENTRY,0,6,7,6,0,100,1,0,0,0,0,11,32067,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Cast 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' (No Repeat)"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Say Line 2 (No Repeat)"),
(@ENTRY,0,8,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Summoned - Set Active On");

-- Grimmr Hound SAI
SET @ENTRY := 30432;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimmr Hound - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant"),
(@ENTRY,0,2,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimmr Hound - On Just Summoned - Set Active On");

-- Actionlist SAI
SET @ENTRY := 3040300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,5000,5000,0,0,12,30471,2,300000,0,0,0,8,0,0,0,7993.9,3336.91,632.396,0.14577,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8003.72,3323.56,632.396,0.648783,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8026.94,3307.58,632.396,1.48207,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8001.77,3306.38,632.396,0.863447,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8016.52,3318.92,632.396,0.940311,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,6,0,0,0,100,0,30000,30000,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8014.93,3327.38,632.39,0.818,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8011.71,3315.36,632.396,0.901169,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8000.67,3317.23,632.396,0.710591,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8025.24,3313.55,632.396,1.28693,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8007.71,3337.13,632.396,0.407285,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8009.92,3319.81,632.396,0.804842,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,12,0,0,0,100,0,30000,30000,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8021.79,3312.45,632.396,1.13086,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8001.36,3332.71,632.396,0.443351,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8017.730,3334.196,632.395,0.8193,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8000.5,3345.77,632.396,5.82389,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8001.77,3311.95,632.396,0.797157,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8012.21,3325.82,632.396,0.737667,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,18,0,0,0,100,0,31000,31000,0,0,12,30404,2,300000,0,1,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Dr. Terrible'"),
(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8017.730,3334.196,632.39,0.8193,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Grimmr Hound'");

-- [Q] Army of the Damned -- http://www.wowhead.com/quest=13236/army-of-the-damned
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(58912, 58916, 58917);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(58913);
INSERT INTO conditions VALUES (13, 1, 58912, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58917, 0, 0, 31, 0, 3, 31276, 0, 0, 0, 0, '', 'Target Ghoul Minion');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 36, 0, 0, 0, 0, 1, 0, 0, '', 'Target must be dead');
INSERT INTO conditions VALUES (17, 0, 58913, 0, 0, 32, 0, 8, 0, 0, 0, 0, 0, '', 'Soul Cleave can target units');

-- Ghoulish Minion SAI
SET @ENTRY := 31276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,1,58917,0,0,0,85,58919,3,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Spellhit 'Consume Minions' - Invoker Cast 'Consume Minions' (No Repeat)"),
(@ENTRY,0,1,0,60,0,100,1,0,0,0,0,11,50142,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Cast 'Emerge Visual' (No Repeat)"),
(@ENTRY,0,2,0,60,0,100,1,4000,4000,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Start Random Movement (No Repeat)"),
(@ENTRY,0,3,0,60,0,100,1,4000,4000,0,0,49,0,0,0,0,0,0,19,31254,15,0,0,0,0,0,"Ghoulish Minion - On Update - Start Attacking (No Repeat)");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=16 AND SourceEntry=31830;
INSERT INTO conditions VALUES (16, 0, 31830, 0, 0, 23, 0, 4622, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4622');
INSERT INTO conditions VALUES (16, 0, 31830, 0, 1, 23, 0, 4537, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4537');


-- Threat From Above -- http://wotlk.openwow.com/?search=Threat+From+Above
UPDATE vehicle_template_accessory SET minion=1 WHERE entry=33687;
DELETE FROM smart_scripts WHERE entryorguid=33687 AND source_type=0;
INSERT INTO smart_scripts VALUES(33687, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set event phase on reset");
INSERT INTO smart_scripts VALUES(33687, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 8000, 12000, 11, 65248, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "cast frost breath in combat");
INSERT INTO smart_scripts VALUES(33687, 0, 2, 0, 0, 0, 100, 0, 8000, 9000, 10000, 13000, 11, 65260, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "wing buffet in combat");
INSERT INTO smart_scripts VALUES(33687, 0, 3, 4, 2, 1, 100, 0, 0, 80, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 4, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
INSERT INTO smart_scripts VALUES(33687, 0, 5, 6, 2, 2, 100, 0, 0, 50, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 6, 0, 61, 2, 100, 0, 0, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
INSERT INTO smart_scripts VALUES(33687, 0, 7, 8, 2, 4, 100, 0, 0, 30, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 8, 0, 61, 4, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
UPDATE creature_template SET AIName="SmartAI" WHERE entry=33695;
DELETE FROM smart_scripts WHERE entryorguid=33695 AND source_type=0;
INSERT INTO smart_scripts VALUES(33695, 0, 0, 0, 0, 0, 100, 0, 5000, 6000, 8000, 12000, 11, 65128, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "cast throw dynamite in combat");
INSERT INTO smart_scripts VALUES(33695, 0, 1, 0, 0, 0, 100, 0, 8000, 9000, 6000, 13000, 11, 65130, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "time bomb in combat");
UPDATE creature_template SET AIName="SmartAI", faction=14, unit_flags=262144+33554432+131072+4 WHERE entry=34307;
DELETE FROM smart_scripts WHERE entryorguid=34307 AND source_type=0;
INSERT INTO smart_scripts VALUES(34307, 0, 0, 0, 60, 0, 100, 0, 1, 1, 30000, 30000, 11, 59686, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "apply aura on spawn");
INSERT INTO smart_scripts VALUES(34307, 0, 1, 2, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 11, 59687, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "explode!");
INSERT INTO smart_scripts VALUES(34307, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "despawn on explode");

-- DB/Quest: Assault by Air (H) -- http://wotlk.openwow.com/quest=13310
DELETE FROM `creature` WHERE `id`=32225;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(16398, 32225, 571, 1, 1, 0, 0, 7303.23, 1520.81, 323.2961, 1.53589, 300, 0, 0, 63000, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `spell1`=59880 WHERE `entry`=32227;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=32225;
UPDATE `creature_template` SET `speed_run`=3 WHERE  `entry`=32225;
UPDATE `vehicle_template_accessory` SET `minion`=1 WHERE  `entry`=32225 AND `seat_id`=0;

DELETE FROM `waypoints` WHERE `entry`=32225;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(32225, 1, 7224.952, 1493.076, 355.6927, 'Skybreaker Troop Transport'),
(32225, 2, 7158.104, 1468.994, 408.7451, 'Skybreaker Troop Transport'),
(32225, 3, 7091.476, 1447.724, 454.6882, 'Skybreaker Troop Transport'),
(32225, 4, 6959.782, 1423.015, 558.3835, 'Skybreaker Troop Transport'),
(32225, 5, 6779.104, 1463.505, 646.3554, 'Skybreaker Troop Transport'),
(32225, 6, 6655.649, 1608.774, 709.994, 'Skybreaker Troop Transport'),
(32225, 7, 6624.22, 1736.658, 728.0214, 'Skybreaker Troop Transport'),
(32225, 8, 6669.947, 1866.185, 709.688, 'Skybreaker Troop Transport'),
(32225, 9, 6718.041, 1885.129, 690.6326, 'Skybreaker Troop Transport'),
(32225, 10, 6795.828, 1838.745, 659.0216, 'Skybreaker Troop Transport'),
(32225, 11, 6829.202, 1723.054, 616.9384, 'Skybreaker Troop Transport'),
(32225, 12, 6938.554, 1702.879, 585.9383, 'Skybreaker Troop Transport'),
(32225, 13, 7024.898, 1752.804, 565.5496, 'Skybreaker Troop Transport'),
(32225, 14, 7113.707, 1734.315, 556.3559, 'Skybreaker Troop Transport'),
(32225, 15, 7265.8, 1765.196, 556.3559, 'Skybreaker Troop Transport'),
(32225, 16, 7302.899, 1853.759, 575.8558, 'Skybreaker Troop Transport'),
(32225, 17, 7312.44, 1944.328, 581.4116, 'Skybreaker Troop Transport'),
(32225, 18, 7307.329, 2014.243, 581.4116, 'Skybreaker Troop Transport'),
(32225, 19, 7253.363, 2115.422, 583.3, 'Skybreaker Troop Transport'),
(32225, 20, 7193.522, 2155.816, 607.7997, 'Skybreaker Troop Transport'),
(32225, 21, 7128.84, 2168.484, 642.6707, 'Skybreaker Troop Transport'),
(32225, 22, 7069.121, 2157.589, 689.7963, 'Skybreaker Troop Transport'),
(32225, 23, 7024.457, 2135.705, 708.6849, 'Skybreaker Troop Transport'),
(32225, 24, 6934.063, 2183.969, 750.9397, 'Skybreaker Troop Transport'),
(32225, 25, 6941.725, 2249.074, 754.6065, 'Skybreaker Troop Transport'),
(32225, 26, 7072.678, 2295.607, 714.44, 'Skybreaker Troop Transport'),
(32225, 27, 7260.946, 2257.761, 639.7736, 'Skybreaker Troop Transport'),
(32225, 28, 7419.038, 2123.693, 587.7736, 'Skybreaker Troop Transport'),
(32225, 29, 7471.735, 1962.737, 559.6346, 'Skybreaker Troop Transport'),
(32225, 30, 7436.465, 1818.688, 508.0233, 'Skybreaker Troop Transport'),
(32225, 31, 7366.372, 1694.51, 469.3012, 'Skybreaker Troop Transport'),
(32225, 32, 7329.872, 1609.157, 432.2737, 'Skybreaker Troop Transport'),
(32225, 33, 7296.424, 1556.42, 417.7181, 'Skybreaker Troop Transport'),
(32225, 34, 7272.382, 1525.835, 411.4405, 'Skybreaker Troop Transport');

-- Skybreaker Suppression Turret SAI
SET @ENTRY := 32227;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,27,0,100,0,0,0,0,0,45,1,0,0,0,0,0,19,32225,10,0,0,0,0,0,"Skybreaker Suppression Turret - On Passenger Boarded - Set Data 1 0"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Suppression Turret - On Just Died - Despawn Instant");

-- Skybreaker Troop Transport SAI
SET @ENTRY := 32225;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Data Set 1 0 - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,9,32225,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 9 Reached - Cast 'Eject Passenger 3'"),
(@ENTRY,0,2,0,40,0,100,0,13,32225,0,0,11,64614,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 13 Reached - Cast 'Eject Passenger 4'"),
(@ENTRY,0,3,0,40,0,100,0,17,32225,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 17 Reached - Cast 'Eject Passenger 5'"),
(@ENTRY,0,4,0,40,0,100,0,22,32225,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 22 Reached - Cast 'Eject Passenger 6'"),
(@ENTRY,0,5,6,40,0,100,0,34,32225,0,0,200,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant"),
(@ENTRY,0,6,7,61,0,100,0,34,32225,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant"),
(@ENTRY,0,7,0,61,0,100,0,34,32225,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant");
UPDATE `creature_template` SET `HealthModifier`=5000 WHERE  `entry`=32225;

-- Actionlist SAI
SET @ENTRY := 3222500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,32225,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Reactstate Passive"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Flag Pacified"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Health Regeneration Off");

-- Skybreaker Infiltrator SAI
SET @ENTRY := 32222;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,1,46598,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Has Aura 'Ride Vehicle Hardcoded' - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 3222200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,60208,0,0,0,0,0,21,20,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Cast 'Ally Air Dropoff Kill Credit'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,100,100,0,0,11,45472,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Cast 'Parachute'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=32222;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(32222, 0, 0, 'I''ll kill one just for you.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32532),
(32222, 0, 1, 'Dropping. Good luck, boys!', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32526),
(32222, 0, 2, 'Thanks for the cover!', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32527),
(32222, 0, 3, 'Destination reached - engaging in scouting mission.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32528),
(32222, 0, 4, 'Infiltration commencing.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32529);

-- Ymirheim Spear Gun SAI
SET @ENTRY := 31280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,32225,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,1,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,32225,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,2,3,8,0,100,0,59880,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Set Event Phase 2"),
(@ENTRY,0,3,0,61,0,100,0,59880,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Run Script"),
(@ENTRY,0,4,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Reset - Set Event Phase 1");

-- Actionlist SAI
SET @ENTRY := 3128000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,15000,15000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Event Phase 1");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=32227 AND `SourceEntry`=46598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 32227, 46598, 0, 0, 9, 0, 13309, 0, 0, 0, 0, 0, '', 'Required quest ''Assault by Ait'' active for spellclick');


-- DB/Quest: Assault by Air (A)
UPDATE `creature_template` SET `spell1`=59880 WHERE `entry`=31884;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=125330;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=31881;
UPDATE `creature_template` SET `speed_run`=3 WHERE  `entry`=31881;
UPDATE `vehicle_template_accessory` SET `minion`=1 WHERE  `entry`=31881 AND `seat_id`=0;

DELETE FROM `waypoints` WHERE `entry`=31881;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(31881, 1, 7513.354, 1781.131, 381.561, 'Kor\'kron Troop Transport'),
(31881, 2, 7508.576, 1843.856, 445.5052, 'Kor\'kron Troop Transport'),
(31881, 3, 7496.634, 1890.942, 496.6479, 'Kor\'kron Troop Transport'),
(31881, 4, 7451.161, 1990.051, 581.2389, 'Kor\'kron Troop Transport'),
(31881, 5, 7372.757, 2143.088, 590.3499, 'Kor\'kron Troop Transport'),
(31881, 6, 7293.971, 2233.48, 602.4611, 'Kor\'kron Troop Transport'),
(31881, 7, 7117.833, 2278.535, 605.0721, 'Kor\'kron Troop Transport'),
(31881, 8, 7017.111, 2263.003, 647.082, 'Kor\'kron Troop Transport'),
(31881, 9, 6996.222, 2205.772, 679.2115, 'Kor\'kron Troop Transport'),
(31881, 10, 7061.963, 2173.603, 675.7964, 'Kor\'kron Troop Transport'),
(31881, 11, 7121.235, 2156.643, 656.629, 'Kor\'kron Troop Transport'),
(31881, 12, 7217.851, 2134.94, 612.4905, 'Kor\'kron Troop Transport'),
(31881, 13, 7288.108, 2086.021, 596.8795, 'Kor\'kron Troop Transport'),
(31881, 14, 7327.417, 1958.794, 585.9348, 'Kor\'kron Troop Transport'),
(31881, 15, 7298.545, 1875.991, 585.4906, 'Kor\'kron Troop Transport'),
(31881, 16, 7249.319, 1800.969, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 17, 7157.543, 1745.975, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 18, 7067.531, 1718.656, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 19, 6988.929, 1710.539, 589.5177, 'Kor\'kron Troop Transport'),
(31881, 20, 6858.088, 1715.7, 617.0735, 'Kor\'kron Troop Transport'),
(31881, 21, 6789.24, 1811.618, 658.2943, 'Kor\'kron Troop Transport'),
(31881, 22, 6741.477, 1881.004, 687.6509, 'Kor\'kron Troop Transport'),
(31881, 23, 6687.517, 1859.595, 701.3486, 'Kor\'kron Troop Transport'),
(31881, 24, 6683.648, 1766.575, 692.5154, 'Kor\'kron Troop Transport'),
(31881, 25, 6738.948, 1709.63, 686.7657, 'Kor\'kron Troop Transport'),
(31881, 26, 6906.804, 1642.973, 664.1547, 'Kor\'kron Troop Transport'),
(31881, 27, 7009.317, 1640.16, 631.8771, 'Kor\'kron Troop Transport'),
(31881, 28, 7174.014, 1608.189, 554.7385, 'Kor\'kron Troop Transport'),
(31881, 29, 7328.232, 1587.251,  465.3495, 'Kor\'kron Troop Transport'),
(31881, 30, 7449.845, 1582.211, 415.2385, 'Kor\'kron Troop Transport'),
(31881, 31, 7493.209, 1659.839, 383.9886, 'Kor\'kron Troop Transport'),
(31881, 32, 7508.813, 1745.664, 371.2109, 'Kor\'kron Troop Transport');

-- Kor'kron Suppression Turret SAI
SET @ENTRY := 31884;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,27,0,100,0,0,0,0,0,45,1,0,0,0,0,0,19,31881,10,0,0,0,0,0,"Kor'kron Suppression Turret - On Passenger Boarded - Set Data 1 0"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Suppression Turret - On Just Died - Despawn Instant");

-- Kor'kron Troop Transport SAI
SET @ENTRY := 31881;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Data Set 1 0 - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,11,31881,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 11 Reached - Cast 'Eject Passenger 3'"),
(@ENTRY,0,2,0,40,0,100,0,16,31881,0,0,11,64614,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 16 Reached - Cast 'Eject Passenger 4'"),
(@ENTRY,0,3,0,40,0,100,0,19,31881,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 19 Reached - Cast 'Eject Passenger 5'"),
(@ENTRY,0,4,0,40,0,100,0,22,31881,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 22 Reached - Cast 'Eject Passenger 6'"),
(@ENTRY,0,5,6,40,0,100,0,32,31881,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant"),
(@ENTRY,0,6,7,61,0,100,0,32,31881,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant"),
(@ENTRY,0,7,0,61,0,100,0,32,31881,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant");
UPDATE `creature_template` SET `HealthModifier`=5000 WHERE  `entry`=31881;

-- Actionlist SAI
SET @ENTRY := 3188100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,31881,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Reactstate Passive"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Flag Pacified"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Health Regeneration Off");

-- Kor'kron Infiltrator SAI
SET @ENTRY := 31882;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,1,46598,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Has Aura 'Ride Vehicle Hardcoded' - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 3188200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,59977,0,0,0,0,0,21,20,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Cast 'Horde Air Dropoff Kill Credit'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,100,100,0,0,11,45472,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Cast 'Parachute'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=31882;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(31882, 0, 0, 'I''ll kill one just for you.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32532),
(31882, 0, 1, 'Dropping. Good luck, boys!', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32526),
(31882, 0, 2, 'Thanks for the cover!', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32527),
(31882, 0, 3, 'Destination reached - engaging in scouting mission.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32528),
(31882, 0, 4, 'Infiltration commencing.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32529);

-- Ymirheim Spear Gun SAI
SET @ENTRY := 31280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,31881,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,1,2,8,0,100,0,59880,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Set Event Phase 2"),
(@ENTRY,0,2,0,61,0,100,0,59880,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Run Script"),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Reset - Set Event Phase 1");

-- Actionlist SAI
SET @ENTRY := 3128000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,15000,15000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Event Phase 1");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=31884 AND `SourceEntry`=46598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 31884, 46598, 0, 0, 9, 0, 13310, 0, 0, 0, 0, 0, '', 'Required quest ''Assault by Ait'' active for spellclick');

-- No Rest For The Wicked -- http://wotlk.openwow.com/quest=13367
-- Cult Researcher SAI
SET @ENTRY := 32297;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,4000,5000,11,15587,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cult Researcher - In Combat - Cast 'Mind Blast'"),
(@ENTRY,0,1,0,0,0,100,0,5000,9000,13000,18000,11,62129,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cult Researcher - In Combat - Cast 'Wail of Souls'");

UPDATE `item_template` SET `duration`=120 WHERE  `entry` IN (44479, 44476, 44478, 44477);

-- Quest It's All Fun and Games [A][H] - www.wowhead.com/quest=12892/its-all-fun-and-games - http://www.wowhead.com/quest=12887/its-all-fun-and-games
-- The Ocular SAI
SET @ENTRY := 29747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,75,55162,1,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Reset - Add Aura 'The Ocular: Transform'"),
(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,85,55289,0,0,0,0,0,18,200,0,0,0,0,0,0,"The Ocular - Out of Combat - Invoker Cast 'It's All Fun and Games: The Ocular Kill Credit'"),
(@ENTRY,0,2,0,0,0,100,0,1500,1500,4000,4000,11,55269,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Ocular - In Combat - Cast 'Deathly Stare'"),
(@ENTRY,0,3,0,6,0,100,0,0,0,0,0,33,29803,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Ocular - On Just Died - Quest Credit ''"),
(@ENTRY,0,4,5,6,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - set respawntimer"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - set respawntimer"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - Despawn Instant"),
(@ENTRY,0,7,0,11,0,100,0,0,0,0,0,75,43775,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Respawn - Add Aura 'Flight'"),
(@ENTRY,0,8,0,1,0,100,0,1000,1000,1000,1000,201,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - Out of Combat - Move Homeposition"),
(@ENTRY,0,9,0,37,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Init - set active");
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=29789;

DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (29747, 0, 0, 50331648, 1, 0, '43775');
UPDATE `creature_model_info` SET `CombatReach`=60 WHERE  `DisplayID`=6533;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=29747;


-- [Q] Blood in the Water QuestID=12810 | What Do You Feed a Yeti, Anyway?
UPDATE `creature_template` SET unit_flags = unit_flags | 32768 WHERE entry IN (35061,35060,35071,35072,29392);
-- Assault by Ground -- http://www.wowhead.com/quest=13284/assault-by-ground, http://www.wowhead.com/quest=13301/assault-by-ground
-- Alliance Version

-- Skybreaker Squad Leader SAI
SET @ENTRY := 31737;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13284,0,0,0,53,1,31737,0,0,5000,2,7,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Quest 'Assault by Ground' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,124407,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,124408,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,10,124409,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,45,1,4,0,0,0,0,10,124410,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 4"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,45,1,5,0,0,0,0,10,124411,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 5"),
(@ENTRY,0,6,7,40,0,100,0,42,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 42 Reached - Say Line 1"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,45,1,20,0,0,0,0,11,31701,150,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 20"),
(@ENTRY,0,8,9,40,0,100,0,14,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7214,1591.2,380.7,6.1,"Skybreaker Squad Leader - On Waypoint 14 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,9,10,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7225.5,1603,379.47,3.8,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7228.9,1597.9,380.28,3.7,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7235.4,1599.8,380.97,3.4,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,12,13,40,0,100,0,26,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7352,1654.8,432.78,4.6,"Skybreaker Squad Leader - On Waypoint 26 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,13,14,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7343.97,1656.06,433.3,4.5,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,14,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7335.12,1648.5,431.61,5.57,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,15,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,16,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,17,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Aggro - Say Line 0"),
(@ENTRY,0,20,0,40,0,100,0,3,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 3 Reached - Say Line 2");

-- Skybreaker Infantry SAI
SET @ENTRY := 31701;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,29,0,1,0,0,0,0,19,31737,30,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 1 - Start Follow Closest Creature 'Skybreaker Squad Leader'"),
(@ENTRY,0,1,0,38,0,100,0,1,2,0,0,29,1,0,0,0,0,0,19,31737,30,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 2 - Start Follow Closest Creature 'Skybreaker Squad Leader'"),
(@ENTRY,0,2,0,38,0,100,0,1,3,0,0,29,0,5,0,0,0,0,19,31737,30,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 3 - Start Follow Closest Creature 'Skybreaker Squad Leader'"),
(@ENTRY,0,3,0,38,0,100,0,1,4,0,0,29,2,0,0,0,0,0,19,31737,30,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 4 - Start Follow Closest Creature 'Skybreaker Squad Leader'"),
(@ENTRY,0,4,0,38,0,100,0,1,5,0,0,29,1,5,0,0,0,0,19,31737,30,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 5 - Start Follow Closest Creature 'Skybreaker Squad Leader'"),
(@ENTRY,0,5,0,38,0,100,0,1,10,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 10 - Set Home Position"),
(@ENTRY,0,6,7,38,0,100,0,1,20,0,0,33,31794,0,0,0,0,0,17,0,80,0,0,0,0,0,"Skybreaker Infantry - On Data Set 1 20 - Quest Credit 'Assault by Ground'"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infantry - On Data Set 0 0 - Despawn In 5000 ms"),
(@ENTRY,0,8,0,0,0,100,0,3000,3000,6000,6000,11,29426,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skybreaker Infantry - In Combat - Cast 'Heroic Strike'");

DELETE FROM `creature_text` WHERE `entry`=31737;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(31737, 0, 0, 'Ambush!', 14, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 0, 1, 'Group up!', 14, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 0, 2, 'Incoming!', 14, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 0, 3, 'On your feet, boys!', 14, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 0, 4, 'Vrykul attack!', 14, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 1, 0, 'Thanks for keeping us covered back there! We\'ll hold the gate while we wait for reinforcements.', 12, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader'),
(31737, 2, 0, 'Alright boys, let\'s do this!', 12, 0, 100, 0, 0, 0, 0, 'Skybreaker Squad Leader');

DELETE FROM `waypoints` WHERE `entry`=31737;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(31737, 1, 7267.47, 1513.11, 321.101, 'Skybreaker Squad Leader'),
(31737, 2, 7262.08, 1522.13, 322.781, 'Skybreaker Squad Leader'),
(31737, 3, 7258.2, 1528.03, 324.766, 'Skybreaker Squad Leader'),
(31737, 4, 7258.9, 1536.19, 327.97, 'Skybreaker Squad Leader'),
(31737, 5, 7259.69, 1545.47, 332.991, 'Skybreaker Squad Leader'),
(31737, 6, 7261.28, 1552.23, 336.939, 'Skybreaker Squad Leader'),
(31737, 7, 7262.56, 1560.25, 340.868, 'Skybreaker Squad Leader'),
(31737, 8, 7261.44, 1569.5, 344.573, 'Skybreaker Squad Leader'),
(31737, 9, 7256.04, 1577.16, 350.38, 'Skybreaker Squad Leader'),
(31737, 10, 7245.87, 1583.33, 358.627, 'Skybreaker Squad Leader'),
(31737, 11, 7235.4, 1582.46, 365.785, 'Skybreaker Squad Leader'),
(31737, 12, 7227.5, 1580.62, 370.843, 'Skybreaker Squad Leader'),
(31737, 13, 7223.12, 1584.65, 374.247, 'Skybreaker Squad Leader'),
(31737, 14, 7220.19, 1589.6, 377.672, 'Skybreaker Squad Leader'),
(31737, 15, 7221.28, 1597.79, 379.132, 'Skybreaker Squad Leader'),
(31737, 16, 7231.53, 1599.71, 380.835, 'Skybreaker Squad Leader'),
(31737, 17, 7244.61, 1604.73, 382.654, 'Skybreaker Squad Leader'),
(31737, 18, 7254.52, 1610.92, 383.888, 'Skybreaker Squad Leader'),
(31737, 19, 7263.68, 1612.56, 382.778, 'Skybreaker Squad Leader'),
(31737, 20, 7276.39, 1611.02, 383.531, 'Skybreaker Squad Leader'),
(31737, 21, 7288.75, 1607.65, 389.084, 'Skybreaker Squad Leader'),
(31737, 22, 7301.3, 1610.83, 396.176, 'Skybreaker Squad Leader'),
(31737, 23, 7312.62, 1613.75, 401.043, 'Skybreaker Squad Leader'),
(31737, 24, 7325.46, 1619.44, 408.955, 'Skybreaker Squad Leader'),
(31737, 25, 7336.22, 1624.36, 416.786, 'Skybreaker Squad Leader'),
(31737, 26, 7344.82, 1632.38, 425.037, 'Skybreaker Squad Leader'),
(31737, 27, 7344.28, 1642.79, 429.96, 'Skybreaker Squad Leader'),
(31737, 28, 7344.28, 1642.79, 429.96, 'Skybreaker Squad Leader'),
(31737, 29, 7332.73, 1644.65, 431.505, 'Skybreaker Squad Leader'),
(31737, 30, 7320.07, 1646.6, 432.943, 'Skybreaker Squad Leader'),
(31737, 31, 7308.4, 1648.01, 433.642, 'Skybreaker Squad Leader'),
(31737, 32, 7297.06, 1650.87, 434.887, 'Skybreaker Squad Leader'),
(31737, 33, 7286.66, 1655.95, 435.096, 'Skybreaker Squad Leader'),
(31737, 34, 7276.17, 1655.57, 434.651, 'Skybreaker Squad Leader'),
(31737, 35, 7263.66, 1652.5, 434.152, 'Skybreaker Squad Leader'),
(31737, 36, 7250.86, 1653.05, 434.345, 'Skybreaker Squad Leader'),
(31737, 37, 7239.87, 1661.84, 439.529, 'Skybreaker Squad Leader'),
(31737, 38, 7227.71, 1668.63, 447.967, 'Skybreaker Squad Leader'),
(31737, 39, 7215.83, 1677.98, 458.037, 'Skybreaker Squad Leader'),
(31737, 40, 7207.03, 1685.58, 464.554, 'Skybreaker Squad Leader'),
(31737, 41, 7198.43, 1693.49, 469.207, 'Skybreaker Squad Leader'),
(31737, 42, 7189.35, 1702.63, 473.235, 'Skybreaker Squad Leader');

-- Horde Version

-- Kor'kron Squad Leader SAI
SET @ENTRY := 31833;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13301,0,0,0,53,1,31833,0,0,5000,2,7,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Quest 'Assault by Ground' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,122301,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,122302,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,10,122303,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,45,1,4,0,0,0,0,10,122304,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest Taken - Set Data 1 4"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,45,1,5,0,0,0,0,10,122305,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest Taken - Set Data 1 5"),
(@ENTRY,0,6,7,40,0,100,0,30,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 30 Reached - Say Line 1"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,45,1,20,0,0,0,0,11,31832,150,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 0 Reached - Set Data 1 20"),
(@ENTRY,0,8,9,40,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.68,1857.33,412.63,5.9,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,9,10,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7416.69,1851.82,417.24,5.89,"Kor'kron Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.9,1844.2,415.36,0.33,"Kor'kron Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7426.77,1847.52,410.5,0,"Kor'kron Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,12,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,13,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,14,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Aggro - Say Line 0");

-- Kor'kron Infantry SAI
SET @ENTRY := 31832;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,29,0,1,0,0,0,0,19,31833,30,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 1 - Start Follow Closest Creature 'Kor'kron Squad Leader'"),
(@ENTRY,0,1,0,38,0,100,0,1,2,0,0,29,1,0,0,0,0,0,19,31833,30,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 2 - Start Follow Closest Creature 'Kor'kron Squad Leader'"),
(@ENTRY,0,2,0,38,0,100,0,1,3,0,0,29,0,5,0,0,0,0,19,31833,30,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 3 - Start Follow Closest Creature 'Kor'kron Squad Leader'"),
(@ENTRY,0,3,0,38,0,100,0,1,4,0,0,29,2,0,0,0,0,0,19,31833,30,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 4 - Start Follow Closest Creature 'Kor'kron Squad Leader'"),
(@ENTRY,0,4,0,38,0,100,0,1,5,0,0,29,1,5,0,0,0,0,19,31833,30,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 5 - Start Follow Closest Creature 'Kor'kron Squad Leader'"),
(@ENTRY,0,5,0,38,0,100,0,1,10,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 10 - Set Home Position"),
(@ENTRY,0,6,7,38,0,100,0,1,20,0,0,33,31845,0,0,0,0,0,17,0,80,0,0,0,0,0,"Kor'kron Infantry - On Data Set 1 20 - Quest Credit 'Assault by Ground'"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infantry - On Data Set 0 0 - Despawn In 5000 ms"),
(@ENTRY,0,8,0,0,0,100,0,3000,3000,6000,6000,11,29426,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kor'kron Infantry - In Combat - Cast 'Heroic Strike'");

DELETE FROM `creature_text` WHERE `entry`=31833;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(31833, 0, 0, 'Ambush!', 14, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader'),
(31833, 0, 1, 'Group up!', 14, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader'),
(31833, 0, 2, 'Incoming!', 14, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader'),
(31833, 0, 3, 'On your feet, boys!', 14, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader'),
(31833, 0, 4, 'Vrykul attack!', 14, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader'),
(31833, 1, 0, 'You\'ve got some fight in you! Blood and honor, friend!', 12, 0, 100, 0, 0, 0, 0, 'Korkron Squad Leader');

DELETE FROM `waypoints` WHERE `entry`=31833;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(31833, 1, 7503.93, 1790.99, 357.285, 'Korkron Squad Leader'),
(31833, 2, 7502.61, 1800.28, 356.863, 'Korkron Squad Leader'),
(31833, 3, 7500.47, 1817.72, 355.487, 'Korkron Squad Leader'),
(31833, 4, 7491.7, 1825.33, 360.781, 'Korkron Squad Leader'),
(31833, 5, 7482.51, 1834.36, 369.439, 'Korkron Squad Leader'),
(31833, 6, 7472.07, 1839.38, 377.258, 'Korkron Squad Leader'),
(31833, 7, 7459.39, 1840.83, 387.083, 'Korkron Squad Leader'),
(31833, 8, 7445.41, 1839.45, 397.161, 'Korkron Squad Leader'),
(31833, 9, 7435.62, 1845.03, 403.664, 'Korkron Squad Leader'),
(31833, 10, 7425.28, 1845.93, 411.936, 'Korkron Squad Leader'),
(31833, 11, 7414.68, 1845.89, 419.947, 'Korkron Squad Leader'),
(31833, 12, 7408.84, 1838.55, 424.703, 'Korkron Squad Leader'),
(31833, 13, 7404.26, 1825.32, 428.076, 'Korkron Squad Leader'),
(31833, 14, 7396.14, 1817, 430.819, 'Korkron Squad Leader'),
(31833, 15, 7383.08, 1803.63, 435.749, 'Korkron Squad Leader'),
(31833, 16, 7371.49, 1791.86, 440.379, 'Korkron Squad Leader'),
(31833, 17, 7358.52, 1781.96, 445.676, 'Korkron Squad Leader'),
(31833, 18, 7345.37, 1772.43, 451.143, 'Korkron Squad Leader'),
(31833, 19, 7341.18, 1759.16, 452.72, 'Korkron Squad Leader'),
(31833, 20, 7335.7, 1748.92, 454.544, 'Korkron Squad Leader'),
(31833, 21, 7326.92, 1732.49, 456.744, 'Korkron Squad Leader'),
(31833, 22, 7317.86, 1725.23, 460.711, 'Korkron Squad Leader'),
(31833, 23, 7305.95, 1720.51, 466.371, 'Korkron Squad Leader'),
(31833, 24, 7284.95, 1720.43, 471.162, 'Korkron Squad Leader'),
(31833, 25, 7268.57, 1720.36, 474.854, 'Korkron Squad Leader'),
(31833, 26, 7250, 1718.9, 475.005, 'Korkron Squad Leader'),
(31833, 27, 7233.69, 1717.44, 472.978, 'Korkron Squad Leader'),
(31833, 28, 7216.94, 1709.8, 473.315, 'Korkron Squad Leader'),
(31833, 29, 7201.11, 1705.87, 472.483, 'Korkron Squad Leader'),
(31833, 30, 7193.72, 1711.64, 474.572, 'Korkron Squad Leader');

-- If he can not be turned. 
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x40000000 WHERE  `entry` IN (29860, 29858, 29859);

-- [A][H]Assault by Ground.
UPDATE `creature_template` SET `ScriptName`='npc_assault_by_ground_squad_leader' WHERE  `entry` IN(31833, 31737);

-- Kor'kron Squad Leader SAI
SET @ENTRY := 31833;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13301,0,0,0,53,1,31833,0,0,5000,2,7,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,13301,0,0,0,45,1,1,0,0,0,0,10,122301,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,13301,0,0,0,45,1,2,0,0,0,0,10,122302,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,13301,0,0,0,45,1,3,0,0,0,0,10,122303,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,13301,0,0,0,45,1,4,0,0,0,0,10,122304,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 4"),
(@ENTRY,0,5,6,61,0,100,0,13301,0,0,0,45,1,5,0,0,0,0,10,122305,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 5"),
(@ENTRY,0,6,0,61,0,100,0,13301,0,0,0,45,1,6,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 6 on self."),
(@ENTRY,0,7,8,40,0,100,0,30,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 30 Reached - Say Line 1"),
(@ENTRY,0,8,0,61,0,100,0,30,0,0,0,45,1,20,0,0,0,0,11,31832,150,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 30 Reached - Set Data 1 20"),
(@ENTRY,0,9,10,40,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.68,1857.33,412.63,5.9,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7416.69,1851.82,417.24,5.89,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,12,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.9,1844.2,415.36,0.33,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,12,0,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7426.77,1847.52,410.5,0,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,13,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,14,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,15,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Aggro - Say Line 0");


-- Skybreaker Squad Leader SAI
SET @ENTRY := 31737;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13284,0,0,0,53,1,31737,0,0,5000,2,7,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Quest 'Assault by Ground' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,124407,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,124408,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,10,124409,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,45,1,4,0,0,0,0,10,124410,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 4"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,45,1,5,0,0,0,0,10,124411,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 5"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,45,1,6,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Quest '' Taken - Set Data 1 6 on self."),

(@ENTRY,0,7,8,40,0,100,0,42,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 42 Reached - Say Line 1"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,45,1,20,0,0,0,0,11,31701,150,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 20"),
(@ENTRY,0,9,10,40,0,100,0,14,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7214,1591.2,380.7,6.1,"Skybreaker Squad Leader - On Waypoint 14 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7225.5,1603,379.47,3.8,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7228.9,1597.9,380.28,3.7,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),

(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7235.4,1599.8,380.97,3.4,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,13,14,40,0,100,0,26,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7352,1654.8,432.78,4.6,"Skybreaker Squad Leader - On Waypoint 26 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,14,15,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7343.97,1656.06,433.3,4.5,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,15,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7335.12,1648.5,431.61,5.57,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,16,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,17,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,18,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Aggro - Say Line 0"),
(@ENTRY,0,19,0,40,0,100,0,3,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 3 Reached - Say Line 2");


-- Ymirheim Defender SAI
SET @ENTRY := 31746;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,14000,15000,11,60988,2,0,0,0,0,2,0,0,0,0,0,0,0,"Ymirheim Defender - In Combat - Cast 'Poisoned Spear'");

-- Remove one spawn from a defender.
DELETE FROM `creature` WHERE `guid`=120899 AND `id`=31746;

-- Correct Spell Area for Mathias Lehner quest chain
DELETE FROM `spell_area` WHERE `spell` = 49416;
INSERT INTO `spell_area` VALUES (49416, 4206, 0, 12431, 0, 0, 2, 1, 64, 11);
INSERT INTO `spell_area` VALUES (49416, 4519, 13360, 13362, 0, 690, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4519, 13399, 13401, 0, 1101, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4521, 13364, 13364, 0, 0, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4521, 13403, 13403, 0, 0, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4533, 13348, 13360, 0, 690, 2, 1, 64, 11);
INSERT INTO `spell_area` VALUES (49416, 4533, 13396, 13399, 0, 1101, 2, 1, 64, 11);
INSERT INTO `spell_area` VALUES (49416, 4537, 13304, 13305, 0, 690, 2, 1, 64, 11);
INSERT INTO `spell_area` VALUES (49416, 4537, 13393, 13394, 0, 1101, 2, 1, 64, 11);
INSERT INTO `spell_area` VALUES (49416, 4615, 13271, 13282, 0, 690, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4615, 13390, 13282, 0, 1101, 2, 1, 74, 11);
INSERT INTO `spell_area` VALUES (49416, 4622, 13305, 13348, 0, 690, 2, 1, 66, 11);
INSERT INTO `spell_area` VALUES (49416, 4622, 13394, 13396, 0, 1101, 2, 1, 66, 11);

-- [Q] Army of the Damned -- http://www.wowhead.com/quest=13236/army-of-the-damned
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(58912, 58916, 58917);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(58913);
INSERT INTO conditions VALUES (13, 1, 58912, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58917, 0, 0, 31, 0, 3, 31276, 0, 0, 0, 0, '', 'Target Ghoul Minion');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 36, 0, 0, 0, 0, 1, 0, 0, '', 'Target must be dead');
INSERT INTO conditions VALUES (17, 0, 58913, 0, 0, 32, 0, 8, 0, 0, 0, 0, 0, '', 'Soul Cleave can target units');

-- Ghoulish Minion SAI
SET @ENTRY := 31276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,1,58917,0,0,0,85,58919,3,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Spellhit 'Consume Minions' - Invoker Cast 'Consume Minions' (No Repeat)"),
(@ENTRY,0,1,0,60,0,100,1,0,0,0,0,11,50142,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Cast 'Emerge Visual' (No Repeat)"),
(@ENTRY,0,2,0,60,0,100,1,4000,4000,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Start Random Movement (No Repeat)"),
(@ENTRY,0,3,0,60,0,100,1,4000,4000,0,0,49,0,0,0,0,0,0,19,31254,15,0,0,0,0,0,"Ghoulish Minion - On Update - Start Attacking (No Repeat)");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=16 AND SourceEntry=31830;
INSERT INTO conditions VALUES (16, 0, 31830, 0, 0, 23, 0, 4622, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4622');
INSERT INTO conditions VALUES (16, 0, 31830, 0, 1, 23, 0, 4537, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4537');

DELETE FROM smart_scripts WHERE entryorguid IN(32404, 31254, 32414, 31276) AND source_type=0;
INSERT INTO smart_scripts VALUES (32404, 0, 0, 4, 19, 0, 100, 0, 13236, 0, 0, 0, 11, 58989, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Cast Spell Prodigal Leader Force Cast');
INSERT INTO smart_scripts VALUES (32404, 0, 1, 4, 19, 0, 100, 0, 13395, 0, 0, 0, 11, 58989, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Cast Spell Prodigal Leader Force Cast');
INSERT INTO smart_scripts VALUES (32404, 0, 2, 3, 62, 0, 100, 0, 10226, 0, 0, 0, 11, 58989, 3, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Matthias Lehner - on gossip select - cast spell Prodigal Leader Force Cast');
INSERT INTO smart_scripts VALUES (32404, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Matthias Lehner - on gossip select - close gossip');
INSERT INTO smart_scripts VALUES (32404, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Linked - Set Ingame phase');
INSERT INTO smart_scripts VALUES (32404, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 32414, 50, 0, 0, 0, 0, 0, 'Linked - Set Data');
INSERT INTO smart_scripts VALUES (32404, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 44, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Linked - Set Ingame phase');
INSERT INTO smart_scripts VALUES (32414, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Set Phase');
INSERT INTO smart_scripts VALUES (32414, 0, 1, 2, 60, 1, 100, 0, 2500, 2500, 2500, 2500, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Talk');
INSERT INTO smart_scripts VALUES (32414, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Set Phase');
INSERT INTO smart_scripts VALUES (31254, 0, 0, 0, 4, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Aggro - Talk');
INSERT INTO smart_scripts VALUES (31254, 0, 1, 0, 8, 0, 100, 1, 58916, 0, 0, 0, 85, 58915, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on spellhit Gift of the Lich King - invoker cast Gift of the Lich King');
INSERT INTO smart_scripts VALUES (31254, 0, 2, 3, 8, 0, 100, 1, 58915, 0, 0, 0, 33, 31329, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on spellhit Gift of the Lich King - give killcredit');
INSERT INTO smart_scripts VALUES (31254, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on spellhit Gift of the Lich King - force despawn');
INSERT INTO smart_scripts VALUES (31254, 0, 4, 0, 4, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, 31254, 10, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on aggro - set data');
INSERT INTO smart_scripts VALUES (31254, 0, 5, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, 31254, 10, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on aggro - set data');
INSERT INTO smart_scripts VALUES (31254, 0, 6, 0, 38, 0, 100, 0, 1, 1, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 31268, 20, 0, 0, 0, 0, 0, 'Lordaeron Footsoldier - on data set - attack start');
INSERT INTO smart_scripts VALUES (31276, 0, 0, 0, 8, 0, 100, 1, 58917, 0, 0, 0, 85, 58919, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ghoulish Minion - on spellhit Consume Minions - cast Consume Minions');
INSERT INTO smart_scripts VALUES (31276, 0, 1, 0, 60, 0, 100, 1, 0, 0, 0, 0, 11, 50142, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ghoulish Minion - On AI Init - Cast Spell');
INSERT INTO smart_scripts VALUES (31276, 0, 2, 0, 60, 0, 100, 1, 4000, 4000, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ghoulish Minion - on Update - move random');
INSERT INTO smart_scripts VALUES (31276, 0, 3, 0, 60, 0, 100, 1, 4000, 4000, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 31254, 15, 0, 0, 0, 0, 0, 'Ghoulish Minion - on Update - attack start');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=10226;
INSERT INTO conditions VALUES (15, 10226, 0, 0, 0, 9, 0, 13236, 0, 0, 0, 0, 0, '', 'Show gossip only if on quest');
INSERT INTO conditions VALUES (15, 10226, 0, 0, 1, 9, 0, 13395, 0, 0, 0, 0, 0, '', 'Show gossip only if on quest');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(58912, 58916, 58917);
INSERT INTO conditions VALUES (13, 1, 58912, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58917, 0, 0, 31, 0, 3, 31276, 0, 0, 0, 0, '', 'Target Ghoul Minion');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 36, 0, 0, 0, 0, 1, 0, 0, '', 'Target must be dead');
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(31254, 32414));

-- The Hunter and the Prince (13400)
-- The Hunter and the Prince (13361)
DELETE FROM event_scripts WHERE id=20723;
REPLACE INTO creature_text VALUES (31395, 0, 0, "Prepare to die!", 12, 0, 100, 0, 0, 0, 0, 0, 'Illidan Stormrage');
UPDATE creature_template SET minlevel=80, maxlevel=80, AIName='SmartAI' WHERE entry=32497;
UPDATE creature_template SET minlevel=80, maxlevel=80, exp=2, spell1=60617, spell2=60644, spell3=60672, spell4=60642, VehicleId=269, AIName='' WHERE entry=32326;
UPDATE creature_template SET faction=14, type_flags=0, minlevel=82, maxlevel=82, exp=0, baseattacktime=1000, rank=0, AIName='SmartAI' WHERE entry=31395;
DELETE FROM smart_scripts WHERE entryorguid IN(32497, 31395) AND source_type=0;
INSERT INTO smart_scripts VALUES (32497, 0, 0, 2, 19, 0, 100, 0, 13361, 0, 0, 0, 50, 194023, 50, 0, 0, 0, 0, 8, 0, 0, 0, 6335.5, 2347.8, 477.23, 3.4, 'On Quest Accept - Summon GO');
INSERT INTO smart_scripts VALUES (32497, 0, 1, 2, 19, 0, 100, 0, 13400, 0, 0, 0, 50, 194023, 50, 0, 0, 0, 0, 8, 0, 0, 0, 6335.5, 2347.8, 477.23, 3.4, 'On Quest Accept - Summon GO');
INSERT INTO smart_scripts VALUES (32497, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 31395, 4, 60000, 0, 0, 0, 8, 0, 0, 0, 6314.5, 2342.8, 479.4, 0.22, 'On Quest Accept - Summon Creature');
INSERT INTO smart_scripts VALUES (31395, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 44, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'AI Init - Set Phase Mask');
INSERT INTO smart_scripts VALUES (31395, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Aggro - Talk');
INSERT INTO smart_scripts VALUES (31395, 0, 2, 0, 0, 0, 100, 0, 7000, 7000, 25000, 25000, 11, 60744, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'IC Update - Cast Spell Immolation Aura');
INSERT INTO smart_scripts VALUES (31395, 0, 3, 0, 0, 0, 100, 1, 25000, 25000, 0, 0, 11, 61101, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - Cast Spell Pierced Heart');
INSERT INTO smart_scripts VALUES (31395, 0, 4, 0, 0, 0, 100, 1, 15000, 15000, 25000, 25000, 11, 60742, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - Cast Spell Shear');
INSERT INTO smart_scripts VALUES (31395, 0, 5, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 32797, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Death - Kill Credit');
-- TC
DELETE FROM spell_script_names WHERE ScriptName='spell_q13400_illidan_kill_master' AND spell_id=61752;


-- Finish Me! / Avenge Me!

UPDATE creature_template SET ExperienceModifier=0, flags_extra= 64 WHERE entry=31304;

UPDATE creature SET curhealth=126 WHERE id=31304;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10040 AND `SourceEntry`=3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,10040,3,0,0,28,0,13231,0,0,0,0,0,'','Only show gossip option 3 if player has quest 13231 Complete'),
(15,10040,3,0,0,14,0,13232,0,0,0,0,0,'','Only show gossip option 3 if player has quest 13232 Not Taken'),
(15,10040,3,0,1,8,0,13231,0,0,0,0,0,'','Only show gossip option 3 if player has quest 13231 Rewarded'),
(15,10040,3,0,1,14,0,13232,0,0,0,0,0,'','Only show gossip option 3 if player has quest 13232 Not Taken');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry`=13232;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19,0,13232,0,0,28,0,13231,0,0,0,0,0,'','Quest 13232 Finish Me! Requires Quest 13231 The Broken Front to be complete'),
(19,0,13232,0,1,8,0,13231,0,0,0,0,0,'','Quest 13232 Finish Me! Requires Quest 13231 The Broken Front to be rewarded');

-- Where Dragons Fell (13359)
-- Where Dragons Fell (13398)
DELETE FROM creature_text WHERE entry=32443;
INSERT INTO creature_text VALUES (32443, 0, 0, "Rise, Sindragosa! Rise and lead the Frostbrood into war!", 12, 0, 100, 0, 0, 0, 0, 0, 'The Lich King, Where Dragons Fell');
REPLACE INTO creature_template_addon VALUES (32446, 0, 0, 50331648, 0, 0, '');
UPDATE creature_template SET minlevel=80, maxlevel=80, exp=2, AIName='SmartAI' WHERE entry=32423;
REPLACE INTO creature_equip_template VALUES(32443, 1, 0, 0, 2551, 0);
UPDATE creature_template SET unit_flags=768, flags_extra=2, AIName='SmartAI', ScriptName='' WHERE entry=32443;
UPDATE creature_template SET unit_flags=768, flags_extra=2, InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=32446;
DELETE FROM smart_scripts WHERE entryorguid IN(32423, 32443, 32446) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=32443*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (32423, 0, 0, 0, 20, 0, 100, 0, 13359, 0, 0, 0, 12, 32443, 4, 26000, 0, 0, 0, 8, 0, 0, 0, 7868.56, 941.67, 451.76, 1.78, 'On Quest Complete - Summon Creature');
INSERT INTO smart_scripts VALUES (32423, 0, 1, 0, 20, 0, 100, 0, 13398, 0, 0, 0, 12, 32443, 4, 26000, 0, 0, 0, 8, 0, 0, 0, 7868.56, 941.67, 451.76, 1.78, 'On Quest Complete - Summon Creature');
INSERT INTO smart_scripts VALUES (32443, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Walk');
INSERT INTO smart_scripts VALUES (32443, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32443*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Script9');
INSERT INTO smart_scripts VALUES (32443*100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 7862.13, 962.6, 450.4, 1.52, 'Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (32443*100, 9, 1, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (32443*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Bytes 0');
INSERT INTO smart_scripts VALUES (32443*100, 9, 3, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 12, 32446, 3, 30000, 0, 0, 0, 8, 0, 0, 0, 7840.35, 1030, 425, 5.26, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES (32443*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 130, 0, 0, 0, 0, 0, 0, 19, 32446, 150, 0, 7840.35, 1030, 510, 0, 'Script9 - Move To Pos Target');
INSERT INTO smart_scripts VALUES (32443*100, 9, 5, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 130, 0, 0, 0, 0, 0, 0, 19, 32446, 150, 0, 8029.14, 753.7, 545.3, 0, 'Script9 - Move To Pos Target');
INSERT INTO smart_scripts VALUES (32446, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Fly');
INSERT INTO smart_scripts VALUES (32446, 0, 1, 0, 60, 0, 100, 0, 5000, 5000, 0, 0, 60, 1, 550, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Update - Set Fly');