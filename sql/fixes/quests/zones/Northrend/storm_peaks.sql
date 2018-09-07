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
INSERT INTO `conditions` VALUES (17, 0, 55818, 0, 0, 31, 1, 3, 29375, 0, 0, 0, 0, '', 'Requires Stormforged Iron Giant');
INSERT INTO `conditions` VALUES (17, 0, 55818, 0, 1, 31, 1, 3, 29503, 0, 0, 0, 0, '', 'Requires Fjorn');
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


-- Changing the Wind's Course - [H] http://www.wowhead.com/quest=13058/changing-the-winds-course

SET @ENTRY := 30388;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,28,56900,0,0,0,0,0,23,0,0,0,0,0,0,0,"Stormhoof - On Just Died - Remove Aura 'Power of the Lorehammer'");


-- Just Around the Corner - [A][H] http://www.wowhead.com/quest=12819/just-around-the-corner

UPDATE creature_template SET AIName='', ScriptName='npc_sparksocket_AA_cannon' WHERE entry=29399;


-- Pushed Too Far -- [A] http://www.wowhead.com/quest=12869/pushed-too-far

SET @STORMPEAK_WYRM := 29753;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@STORMPEAK_WYRM;
DELETE FROM smart_scripts WHERE entryorguid=@STORMPEAK_WYRM AND source_type=0;
INSERT INTO smart_scripts VALUES (@STORMPEAK_WYRM, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 6000, 6000, 11, 57833, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - Cast ''Frost Spit''');


-- Feeding Arngrim - [A][H] http://www.wowhead.com/quest=13046/feeding-arngrim

DELETE FROM smart_scripts WHERE entryorguid=30423 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30423, 0, 0, 1, 2, 0, 100, 1, 0, 30, 0, 0, 11, 56732, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On 30% HP - Summon Arngrim'),
    (30423, 0, 1, 0, 61, 0, 100, 1, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On 30% HP - Set Root'),
    (30423, 0, 2, 3, 38, 0, 100, 0, 1, 1, 0, 0, 11, 56731, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On Data Set 1 1 - Cast Kill Credit'),
    (30423, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - Linked with Previous Event - Despawn');

DELETE FROM smart_scripts WHERE entryorguid=30425 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30425, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 19, 30423, 200, 0, 0, 0, 0, 0, 'Arngrim - On Spawn - Move to closest disembodied jormungar'),
    (30425, 0, 1, 2, 1, 0, 100, 0, 5000, 5000, 10000, 10000, 45, 1, 1, 0, 0, 0, 0, 19, 30423, 20, 0, 0, 0, 0, 0, 'Arngrim - OOC - Cast Ping Jormungar'),
    (30425, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arngrim - OOC - Linked with Previous Event - Despawn After 5 seconds');


-- Into the Pit - http://www.wowhead.com/quest=12997/into-the-pit

DELETE FROM smart_scripts WHERE entryorguid=30174 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30174, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - Out of Combat - Set Unit_flag immune to npc (No Repeat)'),
    (30174, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 7000, 12000, 11, 54458, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Smash\' (No Repeat)'),
    (30174, 0, 2, 0, 0, 0, 100, 0, 1000, 35000, 70000, 95000, 11, 54459, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Maul\' (No Repeat)'),
    (30174, 0, 3, 0, 0, 0, 100, 0, 5000, 9000, 11000, 17000, 11, 54460, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Charge\' (No Repeat)'),
    (30174, 0, 4, 0, 26, 0, 100, 0, 0, 50, 0, 0, 20, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat LOS - Stop attack player');


-- [Quest][WotlK] The Last of Her Kind
-- Harnessed Icemaw Matriarch SAI
SET @ENTRY := 30468;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,28,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harnessed Icemaw Matriarch - On Passenger Removed - Despawn Instant");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=29563 AND `SourceEntry`=56795;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 29563, 56795, 0, 0, 9, 0, 12983, 0, 0, 0, 0, 0, '', 'Required quest \'The Last of Her Kind\' active for spellclick');

-- [Q] Territorial Trespass -- http://www.wowhead.com/quest=13051/territorial-trespass
DELETE FROM `spell_script_names` WHERE `spell_id`=56788;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(56788, 'spell_place_stolen_eggs');

DELETE FROM `event_scripts` WHERE `id`=19714;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (19714, 10, 10, 30461, 600000, 0, 6947.48, -859.518, 1147.6, 5.67487);

DELETE FROM `waypoints` WHERE `entry`=30461;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(30461, 1, 7093.494629, -913.732178, 1067.546265, 'Veranus - WP1');

DELETE FROM `waypoints` WHERE `entry`=3046100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(3046100, 1, 7276.143555, -947.613098, 1290.209961, 'Veranus - WP2');

-- Veranus SAI
SET @ENTRY := 30461;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,8,63,0,100,0,0,0,0,0,53,1,30461,0,13051,0,0,1,0,0,0,0,0,0,0,"Veranus - On Just Created - Start Waypoint"),
(@ENTRY,0,1,2,58,0,100,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Say Line 0"),
(@ENTRY,0,2,3,61,0,100,0,1,0,0,0,33,30461,0,0,0,0,0,7,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Quest Credit 'Territorial Trespass'"),
(@ENTRY,0,3,6,61,0,100,0,1,0,0,0,12,30462,8,0,0,0,0,8,0,0,0,7096.86,-904.658,1119.9,2.33874,"Veranus - On Waypoint Finished - Summon Creature 'Thorim'"),
(@ENTRY,0,4,5,38,0,100,0,1,1,0,0,53,0,@ENTRY*100+00,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Start Waypoint"),
(@ENTRY,0,5,7,61,0,100,0,1,1,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Despawn In 10000 ms"),
(@ENTRY,0,6,0,61,0,100,0,1,0,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Remove Flag Hover"),
(@ENTRY,0,7,0,61,0,100,0,1,1,0,0,90,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Set Flag Hover"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Just Created - Set Active On");

-- Examples to be made -- http://www.wowhead.com/quest=12907/examples-to-be-made
UPDATE `creature_template` SET `faction` = 7 WHERE `entry`IN(29427, 30146, 30147);
UPDATE `creature_template` SET flags_extra = flags_extra | 0x40000000 WHERE entry IN(30147, 29426);

-- Garhal SAI
SET @ENTRY := 30147;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,5000,9000,11,50306,0,0,0,0,0,2,0,0,0,0,0,0,0,"Garhal - Within 0-5 Range - Cast 'Thrash Kick'"),
(@ENTRY,0,1,2,0,0,100,0,0,100,15000,15000,45,0,5,0,0,0,0,9,29426,0,8,0,0,0,0,"Garhal - In Combat - Set Data 0 5"),
(@ENTRY,0,2,3,61,0,100,0,0,100,15000,15000,45,0,5,0,0,0,0,9,29427,0,9,0,0,0,0,"Garhal - In Combat - Set Data 0 5"),
(@ENTRY,0,3,0,61,0,100,0,0,100,15000,15000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Garhal - In Combat - Set Faction 190"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,2,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Garhal - On Respawn - Set Faction 7");
-- Hyldnir Overseer SAI
SET @ENTRY := 29426;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,7000,11000,16000,11,30931,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hyldnir Overseer - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,8,0,100,0,0,5,6000,9000,11,46182,1,0,0,0,0,2,0,0,0,0,0,0,0,"Hyldnir Overseer - On Spellhit - Cast 'Snap Kick'"),
(@ENTRY,0,2,0,38,0,100,0,0,5,0,0,49,0,0,0,0,0,0,19,30147,15,0,0,0,0,0,"Hyldnir Overseer - On Data Set 0 5 - Start Attacking");

-- Captive Vrykul SAI
SET @ENTRY := 29427;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,5,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Vrykul - On Data Set 0 5 - Set Faction 190"),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,2,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Vrykul - On Respawn - Set Faction 7");


UPDATE `creature_template` SET `ScriptName`="npc_hyldsmeet_protodrake", `flags_extra`=`flags_extra`|0x80000000 WHERE  `entry` IN (29625);
-- Hyldsmeet Proto-Drake and "The Drakkensryd", missing paths
UPDATE `creature` SET `MovementType`=2 WHERE  `id`=29625;

DELETE FROM `creature_addon` WHERE `guid` IN (113467, 113466, 113465, 113464, 113463, 113462, 113461, 113459, 113458, 113457, 113452, 113451, 113450, 113449, 113448, 113447, 113446, 113430, 113429, 113428, 113427);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(113427, 1134270, 0, 50331648, 0, 0, NULL),
(113428, 1134280, 0, 50331648, 0, 0, NULL),
(113429, 1134290, 0, 50331648, 0, 0, NULL),
(113430, 1134300, 0, 50331648, 0, 0, NULL),
(113446, 1134460, 0, 50331648, 0, 0, NULL),
(113447, 1134470, 0, 50331648, 0, 0, NULL),
(113448, 1134480, 0, 50331648, 0, 0, NULL),
(113449, 1134490, 0, 50331648, 0, 0, NULL),
(113450, 1134500, 0, 50331648, 0, 0, NULL),
(113451, 1134510, 0, 50331648, 0, 0, NULL),
(113452, 1134520, 0, 50331648, 0, 0, NULL),
(113457, 1134570, 0, 50331648, 0, 0, NULL),
(113458, 1134580, 0, 50331648, 0, 0, NULL),
(113459, 1134590, 0, 50331648, 0, 0, NULL),
(113461, 1134610, 0, 50331648, 0, 0, NULL),
(113462, 1134620, 0, 50331648, 0, 0, NULL),
(113463, 1134630, 0, 50331648, 0, 0, NULL),
(113464, 1134640, 0, 50331648, 0, 0, NULL),
(113465, 1134650, 0, 50331648, 0, 0, NULL),
(113466, 1134660, 0, 50331648, 0, 0, NULL),
(113467, 1134670, 0, 50331648, 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (1134670, 1134660, 1134650, 1134640, 1134630, 1134620, 1134610, 1134590, 1134580, 1134570, 1134520, 1134510, 1134500, 1134490, 1134480, 1134470, 1134460, 1134300, 1134290, 1134280, 1134270);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(1134270, 1, 7364.93, -657.388, 1783.4, 0, 0, 0, 0, 100, 0),
(1134270, 2, 7413.47, -669.072, 1764.12, 0, 0, 0, 0, 100, 0),
(1134270, 3, 7489.13, -669.053, 1739.73, 0, 0, 0, 0, 100, 0),
(1134270, 4, 7618.37, -594.977, 1784.14, 0, 0, 0, 0, 100, 0),
(1134270, 5, 7618.21, -505.373, 1802.28, 0, 0, 0, 0, 100, 0),
(1134270, 6, 7563.7, -439.473, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 7, 7497.24, -397.373, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 8, 7406.44, -360.289, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 9, 7316.13, -381.512, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 10, 7281.74, -517.784, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 11, 7277.45, -601.282, 1829.92, 0, 0, 0, 0, 100, 0),
(1134270, 12, 7324.14, -645.105, 1816.56, 0, 0, 0, 0, 100, 0),
(1134280, 1, 7280.66, -518.542, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 2, 7292.39, -616.781, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 3, 7348.97, -668.309, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 4, 7449.82, -678.424, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 5, 7537.33, -641.553, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 6, 7596.22, -563.956, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 7, 7608.5, -498.708, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 8, 7539.46, -390.214, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 9, 7415.86, -389.267, 1881.61, 0, 0, 0, 0, 100, 0),
(1134280, 10, 7351.81, -408.578, 1881.39, 0, 0, 0, 0, 100, 0),
(1134280, 11, 7306.4, -429.224, 1881.39, 0, 0, 0, 0, 100, 0),
(1134290, 1, 7308.4, -455.557, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 2, 7287.64, -517.706, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 3, 7283.45, -593.736, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 4, 7332.71, -651.052, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 5, 7391.29, -679.072, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 6, 7470.84, -688.263, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 7, 7530.53, -669.864, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 8, 7595.81, -596.429, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 9, 7609.23, -508.104, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 10, 7553.54, -433.055, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 11, 7525.42, -405.001, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 12, 7477.94, -375.422, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 13, 7432.41, -376.505, 1831.26, 0, 0, 0, 0, 100, 0),
(1134290, 14, 7356.54, -399.413, 1831.26, 0, 0, 0, 0, 100, 0),
(1134300, 1, 7341.09, -441.358, 1818.3, 0, 0, 0, 0, 100, 0),
(1134300, 2, 7295.48, -472.829, 1814.74, 0, 0, 0, 0, 100, 0),
(1134300, 3, 7254.58, -542.766, 1814.74, 0, 0, 0, 0, 100, 0),
(1134300, 4, 7249.44, -609.932, 1825.05, 0, 0, 0, 0, 100, 0),
(1134300, 5, 7299.61, -674.552, 1833.33, 0, 0, 0, 0, 100, 0),
(1134300, 6, 7418.85, -673.133, 1833.41, 0, 0, 0, 0, 100, 0),
(1134300, 7, 7569.11, -619.257, 1833.41, 0, 0, 0, 0, 100, 0),
(1134300, 8, 7599.88, -541.157, 1883.24, 0, 0, 0, 0, 100, 0),
(1134300, 9, 7557.37, -458.078, 1867.24, 0, 0, 0, 0, 100, 0),
(1134300, 10, 7471.73, -394.105, 1867.24, 0, 0, 0, 0, 100, 0),
(1134300, 11, 7405.46, -393.094, 1830.16, 0, 0, 0, 0, 100, 0),
(1134460, 1, 7532.04, -410.955, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 2, 7397.41, -358.771, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 3, 7326.62, -386.916, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 4, 7278.53, -521.792, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 5, 7320.67, -645.812, 1850.08, 0, 0, 0, 0, 100, 0),
(1134460, 6, 7417.42, -679.93, 1850.94, 0, 0, 0, 0, 100, 0),
(1134460, 7, 7570.71, -642.495, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 8, 7589.81, -554.144, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 9, 7587.24, -519.277, 1848.3, 0, 0, 0, 0, 100, 0),
(1134460, 10, 7582.98, -477.549, 1848.3, 0, 0, 0, 0, 100, 0),
(1134470, 1, 7570.85, -429.43, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 2, 7537.15, -407.25, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 3, 7505.27, -393.272, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 4, 7423.33, -371.017, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 5, 7335.64, -394.569, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 6, 7234.45, -468.96, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 7, 7295.42, -673.213, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 8, 7407.76, -708.035, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 9, 7561.11, -627.216, 1859.46, 0, 0, 0, 0, 100, 0),
(1134470, 10, 7606.62, -506.74, 1859.46, 0, 0, 0, 0, 100, 0),
(1134480, 1, 7576.19, -521.919, 1887.31, 0, 0, 0, 0, 100, 0),
(1134480, 2, 7553.58, -454.017, 1887.31, 0, 0, 0, 0, 100, 0),
(1134480, 3, 7494.5, -403.844, 1887.31, 0, 0, 0, 0, 100, 0),
(1134480, 4, 7426.2, -397.87, 1887.31, 0, 0, 0, 0, 100, 0),
(1134480, 5, 7368.52, -407.276, 1883.45, 0, 0, 0, 0, 100, 0),
(1134480, 6, 7321.27, -443.677, 1883.45, 0, 0, 0, 0, 100, 0),
(1134480, 7, 7280.34, -519.036, 1883.45, 0, 0, 0, 0, 100, 0),
(1134480, 8, 7291.12, -597.539, 1898.01, 0, 0, 0, 0, 100, 0),
(1134480, 9, 7333.34, -647.529, 1901.9, 0, 0, 0, 0, 100, 0),
(1134480, 10, 7365.04, -666.82, 1900.42, 0, 0, 0, 0, 100, 0),
(1134480, 11, 7420.21, -685.908, 1900.42, 0, 0, 0, 0, 100, 0),
(1134480, 12, 7517.2, -649.578, 1900.42, 0, 0, 0, 0, 100, 0),
(1134480, 13, 7567.98, -594.609, 1900.42, 0, 0, 0, 0, 100, 0),
(1134490, 1, 7485.45, -388.621, 1857.77, 0, 0, 0, 0, 100, 0),
(1134490, 2, 7422.86, -384.888, 1809.04, 0, 0, 0, 0, 100, 0),
(1134490, 3, 7377.13, -391.416, 1809.04, 0, 0, 0, 0, 100, 0),
(1134490, 4, 7322.67, -427.213, 1809.04, 0, 0, 0, 0, 100, 0),
(1134490, 5, 7272.61, -513.997, 1736.32, 0, 0, 0, 0, 100, 0),
(1134490, 6, 7275.3, -609.683, 1777.04, 0, 0, 0, 0, 100, 0),
(1134490, 7, 7344.22, -658.981, 1820.52, 0, 0, 0, 0, 100, 0),
(1134490, 8, 7407.88, -681.95, 1846.35, 0, 0, 0, 0, 100, 0),
(1134490, 9, 7518.29, -652.195, 1846.35, 0, 0, 0, 0, 100, 0),
(1134490, 10, 7572.69, -586.633, 1846.35, 0, 0, 0, 0, 100, 0),
(1134490, 11, 7578.29, -514.104, 1846.35, 0, 0, 0, 0, 100, 0),
(1134490, 12, 7548.59, -454.4, 1857.77, 0, 0, 0, 0, 100, 0),
(1134500, 1, 7583.56, -528.14, 1845.65, 0, 0, 0, 0, 100, 0),
(1134500, 2, 7575.36, -483.701, 1834.48, 0, 0, 0, 0, 100, 0),
(1134500, 3, 7551.09, -424.311, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 4, 7510.74, -379.95, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 5, 7465.94, -364.76, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 6, 7404.96, -360.757, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 7, 7326.49, -405.571, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 8, 7304.22, -444.693, 1819.7, 0, 0, 0, 0, 100, 0),
(1134500, 9, 7273.23, -577.88, 1843.87, 0, 0, 0, 0, 100, 0),
(1134500, 10, 7338.27, -651.961, 1853.43, 0, 0, 0, 0, 100, 0),
(1134500, 11, 7461.79, -686.858, 1869.56, 0, 0, 0, 0, 100, 0),
(1134500, 12, 7562.92, -648.006, 1872.15, 0, 0, 0, 0, 100, 0),
(1134510, 1, 7600.08, -539.936, 1860.74, 0, 0, 0, 0, 100, 0),
(1134510, 2, 7570.92, -462.276, 1860.74, 0, 0, 0, 0, 100, 0),
(1134510, 3, 7459.22, -377.73, 1860.74, 0, 0, 0, 0, 100, 0),
(1134510, 4, 7362.94, -399.103, 1852.57, 0, 0, 0, 0, 100, 0),
(1134510, 5, 7320.38, -429.857, 1852.57, 0, 0, 0, 0, 100, 0),
(1134510, 6, 7289.97, -506.627, 1852.57, 0, 0, 0, 0, 100, 0),
(1134510, 7, 7296.91, -604.203, 1852.57, 0, 0, 0, 0, 100, 0),
(1134510, 8, 7357.31, -651.911, 1864.24, 0, 0, 0, 0, 100, 0),
(1134510, 9, 7389.45, -663.676, 1870.05, 0, 0, 0, 0, 100, 0),
(1134510, 10, 7427.6, -671.146, 1874.74, 0, 0, 0, 0, 100, 0),
(1134510, 11, 7463.83, -668.936, 1874.74, 0, 0, 0, 0, 100, 0),
(1134510, 12, 7543.47, -627.916, 1860.74, 0, 0, 0, 0, 100, 0),
(1134520, 1, 7576.23, -477.132, 1848.55, 0, 0, 0, 0, 100, 0),
(1134520, 2, 7533.34, -420.588, 1848.55, 0, 0, 0, 0, 100, 0),
(1134520, 3, 7449.95, -372.303, 1848.55, 0, 0, 0, 0, 100, 0),
(1134520, 4, 7375.81, -366.946, 1848.55, 0, 0, 0, 0, 100, 0),
(1134520, 5, 7320.98, -406.419, 1848.55, 0, 0, 0, 0, 100, 0),
(1134520, 6, 7288.57, -467.152, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 7, 7275.42, -554.178, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 8, 7316.98, -635.553, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 9, 7413.37, -672.192, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 10, 7491.04, -670.68, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 11, 7584.64, -604.138, 1860.53, 0, 0, 0, 0, 100, 0),
(1134520, 12, 7589.26, -526.222, 1860.53, 0, 0, 0, 0, 100, 0),
(1134570, 1, 7594.64, -571.32, 1835.94, 0, 0, 0, 0, 100, 0),
(1134570, 2, 7556.4, -469.789, 1835.94, 0, 0, 0, 0, 100, 0),
(1134570, 3, 7479.57, -388.896, 1856.05, 0, 0, 0, 0, 100, 0),
(1134570, 4, 7436.48, -392.918, 1856.14, 0, 0, 0, 0, 100, 0),
(1134570, 5, 7413.53, -401.457, 1856.16, 0, 0, 0, 0, 100, 0),
(1134570, 6, 7348.78, -424.168, 1847.83, 0, 0, 0, 0, 100, 0),
(1134570, 7, 7293.34, -477.416, 1850.05, 0, 0, 0, 0, 100, 0),
(1134570, 8, 7284.88, -563.516, 1844.44, 0, 0, 0, 0, 100, 0),
(1134570, 9, 7326.59, -626.79, 1841.16, 0, 0, 0, 0, 100, 0),
(1134570, 10, 7389.16, -658.982, 1835.94, 0, 0, 0, 0, 100, 0),
(1134570, 11, 7479.18, -653.097, 1835.94, 0, 0, 0, 0, 100, 0),
(1134580, 1, 7582.38, -481.98, 1853.88, 0, 0, 0, 0, 100, 0),
(1134580, 2, 7533.48, -409.326, 1853.88, 0, 0, 0, 0, 100, 0),
(1134580, 3, 7424.15, -385.979, 1853.88, 0, 0, 0, 0, 100, 0),
(1134580, 4, 7310.86, -466.896, 1853.88, 0, 0, 0, 0, 100, 0),
(1134580, 5, 7283.28, -538.823, 1836.49, 0, 0, 0, 0, 100, 0),
(1134580, 6, 7286.99, -600.162, 1828.24, 0, 0, 0, 0, 100, 0),
(1134580, 7, 7340.93, -654.092, 1824.18, 0, 0, 0, 0, 100, 0),
(1134580, 8, 7415.19, -682.993, 1817.02, 0, 0, 0, 0, 100, 0),
(1134580, 9, 7514.84, -658.917, 1817.02, 0, 0, 0, 0, 100, 0),
(1134580, 10, 7588.63, -571.884, 1834.71, 0, 0, 0, 0, 100, 0),
(1134590, 1, 7535.64, -420.084, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 2, 7497.35, -396.959, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 3, 7411.31, -377.321, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 4, 7340.88, -386.878, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 5, 7246.18, -474.72, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 6, 7236.88, -594.546, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 7, 7298.26, -666.146, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 8, 7470.16, -652.297, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 9, 7590.5, -569.318, 1860.49, 0, 0, 0, 0, 100, 0),
(1134590, 10, 7567.3, -461.488, 1860.49, 0, 0, 0, 0, 100, 0),
(1134610, 1, 7594.46, -566.308, 1866.6, 0, 0, 0, 0, 100, 0),
(1134610, 2, 7605.57, -559.909, 1868.19, 0, 0, 0, 0, 100, 0),
(1134610, 3, 7569.3, -470.493, 1870.69, 0, 0, 0, 0, 100, 0),
(1134610, 4, 7452.07, -360.672, 1862.91, 0, 0, 0, 0, 100, 0),
(1134610, 5, 7341.96, -389.395, 1870.69, 0, 0, 0, 0, 100, 0),
(1134610, 6, 7266.13, -439.457, 1870.69, 0, 0, 0, 0, 100, 0),
(1134610, 7, 7270.08, -588.673, 1870.69, 0, 0, 0, 0, 100, 0),
(1134610, 8, 7334.35, -650.848, 1867.6, 0, 0, 0, 0, 100, 0),
(1134610, 9, 7423.82, -668.898, 1861.77, 0, 0, 0, 0, 100, 0),
(1134610, 10, 7541.9, -644.38, 1870.69, 0, 0, 0, 0, 100, 0),
(1134620, 1, 7603.29, -524.249, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 2, 7567.54, -463.657, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 3, 7494.99, -407.101, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 4, 7409.17, -405.16, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 5, 7325.44, -438.027, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 6, 7273.8, -519.272, 1867.17, 0, 0, 0, 0, 100, 0),
(1134620, 7, 7279.24, -564.554, 1863.31, 0, 0, 0, 0, 100, 0),
(1134620, 8, 7321.47, -638.47, 1850.94, 0, 0, 0, 0, 100, 0),
(1134620, 9, 7384.29, -677.36, 1850.94, 0, 0, 0, 0, 100, 0),
(1134620, 10, 7493.16, -656.297, 1831.17, 0, 0, 0, 0, 100, 0),
(1134620, 11, 7578.15, -607.217, 1831.17, 0, 0, 0, 0, 100, 0),
(1134630, 1, 7604.58, -507.537, 1873.2, 0, 0, 0, 0, 100, 0),
(1134630, 2, 7548.06, -452.984, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 3, 7435.97, -398.51, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 4, 7344.77, -427.493, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 5, 7300.4, -512.714, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 6, 7309.94, -612.644, 1867.93, 0, 0, 0, 0, 100, 0),
(1134630, 7, 7379.35, -650.969, 1867.15, 0, 0, 0, 0, 100, 0),
(1134630, 8, 7453.5, -653.234, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 9, 7491.27, -650.681, 1860.15, 0, 0, 0, 0, 100, 0),
(1134630, 10, 7581.61, -611.336, 1881.48, 0, 0, 0, 0, 100, 0),
(1134640, 1, 7597.05, -484.658, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 2, 7482, -383.548, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 3, 7412.08, -379.38, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 4, 7356.01, -409.218, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 5, 7270.47, -508.132, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 6, 7303.68, -621.083, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 7, 7405.54, -694.343, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 8, 7499.74, -687.665, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 9, 7538.83, -653.392, 1840.86, 0, 0, 0, 0, 100, 0),
(1134640, 10, 7602.72, -559.726, 1840.86, 0, 0, 0, 0, 100, 0),
(1134650, 1, 7294.83, -572.653, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 2, 7308.68, -625.122, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 3, 7339.93, -658.925, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 4, 7425.49, -677.249, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 5, 7546.12, -669.085, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 6, 7613.48, -537.978, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 7, 7601.76, -400.42, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 8, 7412.72, -356.595, 1843.85, 0, 0, 0, 0, 100, 0),
(1134650, 9, 7338.34, -390.477, 1843.85, 0, 0, 0, 0, 100, 0),
(1134660, 1, 7559.48, -414.805, 1813.72, 0, 0, 0, 0, 100, 0),
(1134660, 2, 7537, -392.813, 1827.28, 0, 0, 0, 0, 100, 0),
(1134660, 3, 7441.29, -362.692, 1815.47, 0, 0, 0, 0, 100, 0),
(1134660, 4, 7376.67, -372.547, 1815.47, 0, 0, 0, 0, 100, 0),
(1134660, 5, 7323.08, -417.563, 1815.47, 0, 0, 0, 0, 100, 0),
(1134660, 6, 7288.89, -484.369, 1815.47, 0, 0, 0, 0, 100, 0),
(1134660, 7, 7277.37, -576.977, 1830.16, 0, 0, 0, 0, 100, 0),
(1134660, 8, 7332.03, -655.919, 1830.16, 0, 0, 0, 0, 100, 0),
(1134660, 9, 7428.4, -683.161, 1830.16, 0, 0, 0, 0, 100, 0),
(1134660, 10, 7538.35, -651.19, 1791.61, 0, 0, 0, 0, 100, 0),
(1134660, 11, 7613.69, -573.6, 1775.27, 0, 0, 0, 0, 100, 0),
(1134660, 12, 7617.09, -483.99, 1786.58, 0, 0, 0, 0, 100, 0),
(1134670, 1, 7611.36, -499.899, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 2, 7563.65, -428.777, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 3, 7497.24, -356.32, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 4, 7439.22, -353.577, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 5, 7337.38, -385.118, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 6, 7270.08, -503.838, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 7, 7270.15, -594.948, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 8, 7305.9, -663.647, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 9, 7361.68, -689.005, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 10, 7479.74, -698.065, 1826.14, 0, 0, 0, 0, 100, 0),
(1134670, 11, 7625.7, -619.773, 1826.14, 0, 0, 0, 0, 100, 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29796;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29796 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29796,0,0,0,19,0,100,0,12886,0,0,0,85,55253,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gretta the Arbiter - On quest accept - cast Spell');

UPDATE `creature_template` SET  `AIName`='SmartAI', `InhabitType`=4, `speed_run`=3.2 WHERE `entry` IN (29679);
DELETE FROM `smart_scripts` WHERE `entryorguid`=29679 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29679, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 53, 1, 29679, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Proto-Drake -  ON PASSENGER_BOARDED - Start waypoint');

DELETE FROM `creature_template_addon` WHERE `entry`=29679;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(29679, 0, 0, 33554432, 0, 0, '55971');

DELETE FROM `waypoints` WHERE `entry`=29679;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(29679,1,6985.165039, -1662.842163, 868.941956, 'Hyldsmeet Proto-Drake'),
(29679,2,6935.585449, -1516.853760, 968.493896, 'Hyldsmeet Proto-Drake'),
(29679,3,6926.762207, -1282.424927, 1127.864380, 'Hyldsmeet Proto-Drake'),
(29679,4,7365.684082, -644.429688, 1928.750610, 'Hyldsmeet Proto-Drake'),
(29679,5,7388.145508, -652.783569, 1909.863647, 'Hyldsmeet Proto-Drake'),
(29679,6,7439.698730, -661.380981, 1887.756714, 'Hyldsmeet Proto-Drake'),
(29679,7,7494.946777, -650.403015, 1883.039795, 'Hyldsmeet Proto-Drake'),
(29679,8,7548.416992, -601.006348, 1882.505737, 'Hyldsmeet Proto-Drake'),
(29679,9,7575.110352, -541.134949, 1881.668701, 'Hyldsmeet Proto-Drake'),
(29679,10,7550.558594, -458.574036, 1877.870972, 'Hyldsmeet Proto-Drake'),
(29679,11,7482.576172, -404.054077, 1878.095581, 'Hyldsmeet Proto-Drake'),
(29679,12,7390.999023, -404.312683, 1882.240234, 'Hyldsmeet Proto-Drake'),
(29679,13,7324.988770, -455.605713, 1874.051270, 'Hyldsmeet Proto-Drake'),
(29679,14,7289.477051, -552.180786, 1879.989258, 'Hyldsmeet Proto-Drake'),
(29679,15,7332.199707, -623.493713, 1887.427734, 'Hyldsmeet Proto-Drake'),
(29679,16,7367.857910, -647.534546, 1895.689453, 'Hyldsmeet Proto-Drake'),
(29679,17,7388.145508, -652.783569, 1909.863647, 'Hyldsmeet Proto-Drake'),
(29679,18,7439.698730, -661.380981, 1887.756714, 'Hyldsmeet Proto-Drake'),
(29679,19,7494.946777, -650.403015, 1883.039795, 'Hyldsmeet Proto-Drake'),
(29679,20,7548.416992, -601.006348, 1882.505737, 'Hyldsmeet Proto-Drake'),
(29679,21,7575.110352, -541.134949, 1881.668701, 'Hyldsmeet Proto-Drake'),
(29679,22,7550.558594, -458.574036, 1877.870972, 'Hyldsmeet Proto-Drake'),
(29679,23,7482.576172, -404.054077, 1878.095581, 'Hyldsmeet Proto-Drake'),
(29679,24,7390.999023, -404.312683, 1882.240234, 'Hyldsmeet Proto-Drake'),
(29679,25,7324.988770, -455.605713, 1874.051270, 'Hyldsmeet Proto-Drake'),
(29679,26,7289.477051, -552.180786, 1879.989258, 'Hyldsmeet Proto-Drake'),
(29679,27,7332.199707, -623.493713, 1887.427734, 'Hyldsmeet Proto-Drake'),
(29679,28,6926.762207, -1282.424927, 1127.864380, 'Hyldsmeet Proto-Drake'),
(29679,29,6935.585449, -1516.853760, 968.493896, 'Hyldsmeet Proto-Drake'),
(29679,30,6985.165039, -1662.842163, 868.941956, 'Hyldsmeet Proto-Drake'),
(29679,31,6998.042969, -1664.234253, 867.953247, 'Hyldsmeet Proto-Drake'),
(29679,32,7037.400879, -1725.409302, 838.695618, 'Hyldsmeet Proto-Drake'),
(29679,33,7076.637695, -1770.263184, 825.775391, 'Hyldsmeet Proto-Drake');


-- Hyldsmeet Drakerider SAI
UPDATE `creature_template` SET `InhabitType`=4, `ScriptName`="" WHERE `entry`=29694;
SET @ENTRY := 29694;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`="" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,33,29800,0,0,0,0,0,21,85,0,0,0,0,0,0,"Hyldsmeet Drakerider - On Death - Kill credit Spell");

-- at_k3_teleporter
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5187, 5190);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES 
(5187, 'at_k3_teleporter'),
(5190, 'at_k3_teleporter');


-- Hyldsmeet Proto-Drake


-- Revert changes, 
-- TODO: need to clean this file from all the previous ones.

DELETE FROM `creature_template` WHERE `entry` IN(29625, 29694);
INSERT INTO `creature_template` VALUES (29625, 0, 0, 0, 0, 0, 26742, 0, 0, 0, 'Hyldsmeet Proto-Drake', '', '', 0, 80, 80, 2, 35, 0, 6, 3.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 183, 0, 0, '', 0, 4, 1, 1, 1, 1, 1, 1, 0, 240, 1, 0, 0, 'npc_hyldsmeet_protodrake', 12340);
INSERT INTO `creature_template` VALUES (29694, 0, 0, 0, 0, 0, 25771, 0, 0, 0, 'Hyldsmeet Drakerider', '', '', 0, 79, 80, 2, 2116, 1, 1, 1.28571, 1, 0, 0, 3000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 0.7, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'npc_hyldsmeet_drakerider', 12340);

DELETE FROM `vehicle_accessory` WHERE `guid`=29625;
DELETE FROM `vehicle_template_accessory` WHERE `entry`=29625;
INSERT INTO `vehicle_template_accessory` VALUES (29625, 29694, 1, 1, 'Hyldsmeet Proto-Drake', 5, 30000);

-- [Q] When all else fail -- https://wowgaming.altervista.org/aowow/?search=When+all+else+fail
UPDATE `creature_template` SET `unit_flags`=512, `VehicleId`=240, `InhabitType`=4 WHERE `entry`=30477;
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=2, `unit_flags`=512, `VehicleId`=240, `InhabitType`=4 WHERE `entry`=30487;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (29428,30477,30487);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29428,30477,30487) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (30477*100,30487*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29428,0,0,2,62,0,100,0,9917,0,0,0,11,58061,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Spellcast Forcecast Summon Rocket (Alliance)'),
(29428,0,1,2,62,0,100,0,9917,1,0,0,11,58062,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Spellcast Forcecast Summon Rocket (Horde)'),
(29428,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Close gossip'),
(30477,0,0,0,54,0,100,0,0,0,0,0,80,30477*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - Just summoned - Run script'),
(30477,0,1,2,40,0,100,0,18,30477,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 18 reached - Spellcast Eject All Passengers'),
(30477,0,2,0,61,0,100,0,0,0,0,0,11,42895,0,0,0,0,0,23,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 18 reached - Spellcast Cosmetic - Combat Knockdown Foe'),
(30477,0,3,0,40,0,100,0,24,30477,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 24 reached - Despawn'),
(30487,0,0,0,54,0,100,0,0,0,0,0,80,30487*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - Just summoned - Run script'),
(30487,0,1,2,40,0,100,0,13,30487,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 13 reached - Spellcast Eject All Passengers'),
(30487,0,2,0,61,0,100,0,0,0,0,0,11,42895,0,0,0,0,0,23,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 13 reached - Spellcast Cosmetic - Combat Knockdown Foe'),
(30487,0,3,0,40,0,100,0,17,30487,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 17 reached - Despawn'),
(30477*100,9,0,0,0,0,100,0,3000,3000,0,0,53,1,30477,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device script - Start WP movement'),
(30487*100,9,0,0,0,0,100,0,3000,3000,0,0,53,1,30487,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device script - Start WP movement');

DELETE FROM `waypoints` WHERE `entry` IN (30477,30487);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(30477,1,6164.999,-1064.512,422.1189,'D16 Propelled Delivery Device'),
(30477,2,6204.096,-998.4872,457.5628,'D16 Propelled Delivery Device'),
(30477,3,6289.573,-952.1809,504.6187,'D16 Propelled Delivery Device'),
(30477,4,6307.788,-872.7999,541.7296,'D16 Propelled Delivery Device'),
(30477,5,6370.582,-821.9507,653.868,'D16 Propelled Delivery Device'),
(30477,6,6413.268,-660.4708,808.3953,'D16 Propelled Delivery Device'),
(30477,7,6554.813,-550.3772,1018.112,'D16 Propelled Delivery Device'),
(30477,8,6633.265,-419.3159,1173.914,'D16 Propelled Delivery Device'),
(30477,9,6760.503,-364.4665,1277.719,'D16 Propelled Delivery Device'),
(30477,10,6807.88,-427.5194,1399.109,'D16 Propelled Delivery Device'),
(30477,11,6808.07,-471.4465,1419.247,'D16 Propelled Delivery Device'),
(30477,12,6775.634,-529.2309,1394.387,'D16 Propelled Delivery Device'),
(30477,13,6720.645,-535.5529,1328.054,'D16 Propelled Delivery Device'),
(30477,14,6660.31,-486.8651,1238.553,'D16 Propelled Delivery Device'),
(30477,15,6658.937,-417.8409,1186.11,'D16 Propelled Delivery Device'),
(30477,16,6680.49,-329.3087,1098.609,'D16 Propelled Delivery Device'),
(30477,17,6683.783,-220.3454,972.7203,'D16 Propelled Delivery Device'),
(30477,18,6663.772,-192.1261,962.2485,'D16 Propelled Delivery Device'),
(30477,19,6654.82,-180.1689,958.1317,'D16 Propelled Delivery Device'),
(30477,20,6631.467,-171.3305,966.4633,'D16 Propelled Delivery Device'),
(30477,21,6598.223,-162.3664,984.2227,'D16 Propelled Delivery Device'),
(30477,22,6566.67,-155.2077,992.0551,'D16 Propelled Delivery Device'),
(30477,23,6529.651,-154.9363,992.0551,'D16 Propelled Delivery Device'),
(30477,24,6454.417,-152.1311,962.305,'D16 Propelled Delivery Device'),
(30487,1,6169.229,-1069.619,420.6945,'D16 Propelled Delivery Device'),
(30487,2,6232.725,-1031.598,505.7779,'D16 Propelled Delivery Device'),
(30487,3,6339.224,-1035.08,575.3331,'D16 Propelled Delivery Device'),
(30487,4,6431.492,-987.6745,694.8887,'D16 Propelled Delivery Device'),
(30487,5,6632.437,-925.9739,896.1384,'D16 Propelled Delivery Device'),
(30487,6,6822.084,-755.521,1171.194,'D16 Propelled Delivery Device'),
(30487,7,7090.693,-619.4874,1455.639,'D16 Propelled Delivery Device'),
(30487,8,7260.75,-282.75,1513.362,'D16 Propelled Delivery Device'),
(30487,9,7552.502,-334.6509,1657.668,'D16 Propelled Delivery Device'),
(30487,10,7692.301,-509.425,1536.5,'D16 Propelled Delivery Device'),
(30487,11,7799.192,-636.3267,1252.278,'D16 Propelled Delivery Device'),
(30487,12,7841.555,-726.5501,1193.916,'D16 Propelled Delivery Device'),
(30487,13,7844.731,-775.3613,1185.833,'D16 Propelled Delivery Device'),
(30487,14,7842.449,-815.5735,1186.396,'D16 Propelled Delivery Device'),
(30487,15,7838.703,-859.9572,1173.173,'D16 Propelled Delivery Device'),
(30487,16,7865.014,-911.2181,1163.979,'D16 Propelled Delivery Device'),
(30487,17,7856.225,-951.6568,1151.563,'D16 Propelled Delivery Device');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9917 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9917,1,0,'I am ready to head further into Storm Peaks.',32890,1,1,0,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9917;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9917,0,0,28,12862,0,0,0,'','Ricket - Show gossip option only if player has completed but not rewarded quest When All Else Fails'),
(15,9917,1,0,28,13060,0,0,0,'','Ricket - Show gossip option only if player has completed but not rewarded quest When All Else Fails');