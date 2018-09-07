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

-- Quest Bury Those Cockroaches! - wowhead.com/quest=11608
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45502 AND `ConditionTypeOrReference`=31;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 2, 45502, 0, 0, 31, 0, 3, 25402, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (South)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25403, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (East)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25404, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (West)'),
(13, 2, 45502, 0, 0, 31, 0, 3, 25405, 0, 1, 0, 0, '', 'Seaforium Depth Charge Explosion does not knock back Nerub ar Sinkhole (North)');


-- Repurposed Technology -- [A} http://www.wowhead.com/quest=12035/repurposed-technology
-- Harvest Collector SAI
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`IN(25623,25650,26561);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(25623,25650,26561);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25623, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 4000, 6000, 11, 54185, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - IC - Cast Claw Slash'),
(25623, 0, 1, 0, 8, 0, 100, 0, 47166, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - On spell hit - Despawn Instant'),

-- Plagued Scavanger SAI
(25650, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 11, 26561, 100, 0, 0, 0, 0, 0, 'Plagued Scavenger - Just Summoned - Attack Nearby Converted Harvest Collector'),

-- Converted Harvest Collector SAI
(26561, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Converted Harvest Collector - Just Summoned - Despawn in 1 min'),
(26561, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 25650, 1, 60000, 0, 0, 0, 19, 101, 0, 0, 0, 0, 0, 0, 'Converted Harvest Collector - Link - Summon Plagued Scavenger for 1 min');

-- Plagued Scavanger Bunny spawn
DELETE FROM `creature_template` WHERE `entry`=101;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(101, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Plague Scavenger Bunny', NULL, NULL, 0, 1, 1, 0, 35, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 4, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 130, '', 0);

DELETE FROM `creature` WHERE `id`=101;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(52022, 101, 571, 0, 0, 1, 1, 0, 0, 2526.455322, 5246.518066, 35.246830, 0, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(52023, 101, 571, 0, 0, 1, 1, 0, 0, 2544.124268, 5304.271973, 32.552277, 0, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);

-- [Q] Stop the Plague -- http://www.wowhead.com/quest=11677
-- Stop the Plague Kill Credit Bunny SAI
SET @ENTRY := 25654;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,8,0,100,0,45835,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,1,3,8,0,100,0,45834,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,2,0,61,0,100,0,45835,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Set Data 2 2"),
(@ENTRY,0,3,0,61,0,100,0,45834,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Set Data 2 2");

-- ELM General Purpose Bunny SAI
SET @ENTRY := 23837;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,11,52388,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Cast 'You Reap What You Sow: Ritual Bunny Channel'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,28671,30,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Set Data 0 1"),
(@ENTRY,0,2,0,38,0,100,1,32,32,0,0,11,9010,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 32 32 - Cast 'Create Filled Containment Coffer' (No Repeat)"),
(@ENTRY,0,3,0,38,0,100,0,31,31,0,0,87,1636401,1636403,1636404,1636406,1636407,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 31 31 - Run Random Script"),
(@ENTRY,0,4,0,38,0,100,0,30,30,0,0,87,1636401,1636402,1636403,1636405,1636406,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 30 30 - Run Random Script"),
(@ENTRY,0,6,0,11,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,27249,0,0,0,0,0,0,"ELM General Purpose Bunny - On Respawn - Set Data 1 1"),
(@ENTRY,0,7,0,38,0,100,0,2,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 2 2 - Despawn Instant");

-- Plug the Sinkholes -- [A] -- http://www.wowhead.com/quest=11897/plug-the-sinkholes
UPDATE creature_template SET unit_flags=33555200, flags_extra=128 WHERE entry=26249;


-- The Assassination of Harold Lane - [A][H] http://www.wowhead.com/quest=11892/the-assassination-of-harold-lane

SET @HAROLD := 25804;
SET @STAMPEDING_MAMMOTH := 25988;
SET @STAMPEDING_CARIBOU := 25989;
SET @STAMPEDING_RHINO := 25990;

DELETE FROM creature_summon_groups WHERE summonerId=@HAROLD AND summonerType=0 AND entry IN(25988, 25989, 25990);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
    (@HAROLD, 0, 0, 25988, 3286.08, 5655.42, 52.98, 1.25, 1, 20000),
    (@HAROLD, 0, 0, 25988, 3291.20, 5650.54, 53.09, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25989, 3285.02, 5648.22, 51.93, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25989, 3290.59, 5643.01, 51.60, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25989, 3296.20, 5645.08, 52.65, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25990, 3292.17, 5639.34, 51.06, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25990, 3286.03, 5640.44, 50.38, 1.35, 1, 20000),
    (@HAROLD, 0, 0, 25990, 3279.33, 5644.00, 50.23, 1.35, 1, 20000);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@HAROLD;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HAROLD AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
    (@HAROLD,0,0,3,8,0,100,1,46368,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harold Lane - On Spellhit 'Blow Cenarion Horn' - Say Line 0 (No Repeat)"),
    (@HAROLD,0,1,0,0,0,100,0,1100,10100,16400,28300,11,53432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harold Lane - In Combat - Cast 'Bear Trap'"),
    (@HAROLD,0,2,0,9,0,100,0,8,40,9200,12400,11,53425,0,0,0,0,0,2,0,0,0,0,0,0,0,"Harold Lane - Within 8-40 Range - Cast 'Throw Bear Pelt'"),
    (@HAROLD,0,3,0,61,0,100,0,46368,0,0,0,107,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Harold Lane - On Spellhit 'Blow Cenarion Horn' - Summon Creature Group 0 (No Repeat)"),
    (@HAROLD,0,4,0,38,0,100,0,0,1,0,0,11,46385,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harold Lane - On Data Set 0 1 - Cast 'Stampede'");

UPDATE `creature_template` SET `AIName`="SmartAI", unit_flags=256+512 WHERE `entry` IN (@STAMPEDING_MAMMOTH, @STAMPEDING_CARIBOU, @STAMPEDING_RHINO);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@STAMPEDING_MAMMOTH, @STAMPEDING_CARIBOU, @STAMPEDING_RHINO) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@STAMPEDING_MAMMOTH,0,0,0,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stampeding Mammoth - On Just Summoned - Move To Invoker"),
    (@STAMPEDING_MAMMOTH,0,1,2,34,0,100,1,0,0,0,0,45,0,1,0,0,0,0,19,@HAROLD,100,0,0,0,0,0,"Stampeding Mammoth - On Reached Point 0 - Set Data 0 1 (No repeat)"),
    (@STAMPEDING_MAMMOTH,0,2,0,61,0,100,0,0,0,0,0,53,1,@STAMPEDING_MAMMOTH,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Mammoth - On Reached Point 0 - Start Waypoint"),
    (@STAMPEDING_MAMMOTH,0,3,0,34,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Mammoth - On Reached Point 2 - Despawn Instant"),
    (@STAMPEDING_CARIBOU,0,0,0,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stampeding Caribou - On Just Summoned - Move To Invoker"),
    (@STAMPEDING_CARIBOU,0,1,2,34,0,100,1,0,0,0,0,45,0,1,0,0,0,0,19,@HAROLD,100,0,0,0,0,0,"Stampeding Caribou - On Reached Point 0 - Set Data 0 1 (No repeat)"),
    (@STAMPEDING_CARIBOU,0,2,0,61,0,100,0,0,0,0,0,53,1,@STAMPEDING_CARIBOU,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Caribou - On Reached Point 0 - Start Waypoint"),
    (@STAMPEDING_CARIBOU,0,3,0,34,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Caribou - On Reached Point 2 - Despawn Instant"),
    (@STAMPEDING_RHINO,0,0,0,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stampeding Rhino - On Just Summoned - Move To Invoker"),
    (@STAMPEDING_RHINO,0,1,2,34,0,100,1,0,0,0,0,45,0,1,0,0,0,0,19,@HAROLD,100,0,0,0,0,0,"Stampeding Rhino - On Reached Point 0 - Set Data 0 1 (No repeat)"),
    (@STAMPEDING_RHINO,0,2,0,61,0,100,0,0,0,0,0,53,1,@STAMPEDING_RHINO,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Rhino - On Reached Point 0 - Start Waypoint"),
    (@STAMPEDING_RHINO,0,3,0,34,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stampeding Rhino - On Reached Point 2 - Despawn Instant");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceGroup=1 AND SourceEntry=46385;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (13, 1, 46385, 0, 0, 31, 0, 3, @HAROLD, 0, 0, 0, 0, '', 'Stampeding creatures - Stampede targets only Harold Lane');

DELETE FROM waypoints WHERE entry IN(@STAMPEDING_MAMMOTH, @STAMPEDING_CARIBOU, @STAMPEDING_RHINO);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
    (@STAMPEDING_MAMMOTH, 1, 3301.39, 5694.10, 60.00, ''),
    (@STAMPEDING_MAMMOTH, 2, 3304.44, 5757.94, 51.88, ''),
    (@STAMPEDING_CARIBOU, 1, 3301.39, 5694.10, 60.00, ''),
    (@STAMPEDING_CARIBOU, 2, 3304.44, 5757.94, 51.88, ''),
    (@STAMPEDING_RHINO, 1, 3301.39, 5694.10, 60.00, ''),
    (@STAMPEDING_RHINO, 2, 3304.44, 5757.94, 51.88, '');


-- Return My Remains - [H] http://www.wowhead.com/quest=11638/return-my-remains

SET @SNARLFANG := 25339;
SET @GRIMWALKER := 25461;
SET @REMAINS := 187680;
SET @SPELL_ANCESTRAL_SPIRIT = 45608;

DELETE FROM creature_text WHERE entry=@SNARLFANG;
INSERT INTO creature_text VALUES(@SNARLFANG, 0, 0, "Farseer! I''m so glad to see you again!", 12, 0, 100, 0, 0, 0, 24686, 0, 'Snarlfang');
INSERT INTO creature_text VALUES(@SNARLFANG, 1, 0, "I look forward to further training when you are ready.", 12, 0, 100, 0, 0, 0, 24700, 0, 'Snarlfang');

DELETE FROM creature_text WHERE entry=@GRIMWALKER;
INSERT INTO creature_text VALUES(@GRIMWALKER, 0, 0, "I have been returned to the living.", 12, 0, 100, 0, 0, 0, 24687, 0, 'Snarlfang');
INSERT INTO creature_text VALUES(@GRIMWALKER, 1, 0, "And now, I must rest. Thank you for all that you have done.", 12, 0, 100, 0, 0, 0, 24688, 0, 'Snarlfang');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SNARLFANG;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SNARLFANG AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@SNARLFANG, 0, 0, 0, 20, 0, 100, 0, 11638, 0, 0, 0, 80, @SNARLFANG*100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Snarlfang - On quest rewarded - Start event');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@SNARLFANG*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SNARLFANG*100,9,0,0,0,0,100,0,1000,1000,0,0,50,@REMAINS,11,0,0,0,0,8,0,0,0,4521.799805,5669.839844,81.417801,0.767945,"Spirit Talker Snarlfang - On Script - Summon remains"),
(@SNARLFANG*100,9,1,0,0,0,100,0,1000,1000,0,0,11,@SPELL_ANCESTRAL_SPIRIT,0,0,0,0,0,11,23837,20,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Cast Ancestral Spirit"),
(@SNARLFANG*100,9,2,0,0,0,100,0,11000,11000,0,0,12,@GRIMWALKER,3,10000,0,0,0,8,0,0,0,4521.799805,5669.839844,81.417801,0.767945,"Spirit Talker Snarlfang - On Script - Summon Grimwalker"),
(@SNARLFANG*100,9,3,0,0,0,100,0,1000,1000,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Say Line 0"),
(@SNARLFANG*100,9,4,0,0,0,100,0,5000,5000,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Say Line 1");

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GRIMWALKER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GRIMWALKER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@GRIMWALKER, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grimwalker - On Just Summoned - Set walk'),
    (@GRIMWALKER, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grimwalker - On Just Summoned - Say Line 0'),
    (@GRIMWALKER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4516.423340, 5674.288086, 81.796661, 2.448872, "Grimwalker - On Just Summoned - Move to 1"),
    (@GRIMWALKER, 0, 3, 4, 34, 0, 100, 0, 0, 1, 0, 0, 1, 1, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Grimwalker - On point 1 reached - Say Line 1");


-- Breaking Through - [H] http://www.wowhead.com/quest=11898/breaking-through

DELETE FROM gameobject WHERE guid=5747 AND id=194026;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
    (5747, 194026, 571, 0, 0, 1, 1, 3739.84, 3567.09, 341.57, 0.00, 0, 0, 0, 1, 300, 100, 0, 0);

DELETE FROM areatrigger_scripts WHERE entry=5339 AND ScriptName='at_last_rites';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`)
VALUES
    (5339, 'at_last_rites');


-- What the Cold Wind Brings... - [H] http://www.wowhead.com/quest=11632/what-the-cold-wind-brings

DELETE FROM creature_template_addon WHERE entry=25446;
UPDATE creature_addon SET mount=0, bytes2=258 WHERE guid=125432;

SET @ENTRY := 25446; -- Warsong Captain SAI
UPDATE `creature_template` SET `AIName`="SmartAI", type_flags=0 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,2,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Data Set 0 2 - Run Script"),
(@ENTRY,0,1,0,14,0,100,0,2000,40,10000,15000,11,15799,0,0,0,0,0,7,0,0,0,0,0,0,0,'Warsong Captain - Friendly At 2000 Health - Cast \'Chain Heal\''),
(@ENTRY,0,2,0,0,0,100,0,7000,9000,16000,20000,11,45584,1,0,0,0,0,2,0,0,0,0,0,0,0,'Warsong Captain - In Combat - Cast \'Bloodlust\''),
(@ENTRY,0,3,0,0,0,100,0,1000,2000,3000,3000,11,31717,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Warsong Captain - In Combat - Cast Chain Lightning'),
(@ENTRY,0,4,0,38,0,100,0,0,3,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Data Set 0 3 - Run Script");

SET @ENTRY := 25244; -- Warsong Marksman SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@ENTRY, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2300, 3900, 11, 48854, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warsong Marksman - In Combat - Cast \'Shoot\'');

SET @ENTRY := 2544600; -- Actionlist SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,100,100,0,0,45,2,2,0,0,0,0,19,23837,100,0,0,0,0,0,"Warsong Captain - On Script - Set data 2 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,500,500,0,0,53,1,25446,0,0,0,2,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Start Waypoint"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,4,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,5,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,7,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,9,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,10,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,12,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,13,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,14,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,15,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,16,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,17,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,18,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,19,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,20,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,21,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,22,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,23,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,24,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,25,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,26,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,27,0,0,0,100,0,30000,30000,0,0,12,25453,4,20000,1,0,0,8,0,0,0,2705.965576, 6079.490234, 77.662964, 0.467981,"Warsong Captain - On Script - Summon Boss");

SET @ENTRY := 2544601; -- Actionlist SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,500,500,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,50,187674,300,0,0,0,0,8,0,0,0,2719.454102,6085.813965,70.320084,0.541261,"Nerub'ar Sky Darkener - On Death - Summon caparace");

SET @ENTRY := 25446;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@ENTRY, 1, 2713.618, 6082.417, 67.779, 'Warsong Captain');

SET @WARSONG_CAPTAIN := 25446;
DELETE FROM creature_text WHERE entry=@WARSONG_CAPTAIN;
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 0, 0, "Marksmen! Front and center! Scourge attack incoming!", 14, 0, 100, 0, 0, 0, 24657, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 1, 0, "Marksmen, lock and load!", 14, 0, 100, 0, 0, 0, 24659, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 2, 0, "The Nerub'ar have been punished for their transgression!", 14, 0, 100, 0, 0, 0, 24660, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 3, 0, "Let the forces of the Lich King gaze upon the carcass of this wretch and know that the Horde will not relent!", 14, 0, 100, 0, 0, 0, 24673, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 4, 0, "Gather, soldiers! Gather and take your trophies from the carapace of the enemy!", 14, 0, 100, 0, 0, 0, 24674, 0, 'Warsong Captain');

SET @NERUBAR_SKY_DARKENER := 25451; -- Nerub'ar Sky Darkener
DELETE FROM creature_summon_groups WHERE summonerId=@WARSONG_CAPTAIN AND summonerType=0;
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2725.887939, 6056.259277, 79.065804, 1.120098, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2715.777832, 6066.867676, 81.215187, 0.103007, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2707.340088, 6090.684570, 79.129250, 1.292644, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2696.666260, 6068.134766, 70.117683, 4.481363, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2705.701660, 6060.605957, 70.117683, 3.644915, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2722.030518, 6078.456543, 78.617699, 5.254986, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2698.852051, 6074.931641, 71.713753, 4.544197, 4, 20000);

UPDATE `creature_template` SET `AIName`="SmartAI", InhabitType=4, ExperienceModifier=0 WHERE `entry`=@NERUBAR_SKY_DARKENER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NERUBAR_SKY_DARKENER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NERUBAR_SKY_DARKENER,0,0,0,54,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - On Just Summoned - Set Fly Off"),
(@NERUBAR_SKY_DARKENER,0,1,0,0,0,100,0,300,300,2000,3000,11,45577,64,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Venom Spit'"),
(@NERUBAR_SKY_DARKENER,0,2,0,0,0,100,0,3000,5000,30000,40000,11,45587,65,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Web Bolt'");

DELETE FROM creature WHERE guid=3110525 AND id=23837; -- EVENT TRIGGER BUNNY
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
    (3110525, 23837, 571, 0, 0, 1, 1, 0, 0, 2723.07, 6096.58, 74.4098, 5.09263, 1800, 0, 0, 42, 0, 0, 0, 0, 0, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=23837 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (23837, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 52388, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Cast \'You Reap What You Sow: Ritual Bunny Channel\''),
    (23837, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 28671, 30, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Set Data 0 1'),
    (23837, 0, 2, 0, 1, 0, 100, 0, 5000, 5000, 180000, 180000, 45, 0, 2, 0, 0, 0, 0, 19, 25446, 100, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Set Data 0 2'),
    (23837, 0, 3, 0, 38, 0, 100, 1, 32, 32, 0, 0, 11, 9010, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 32 32 - Cast \'Create Filled Containment Coffer\' (No Repeat)'),
    (23837, 0, 4, 0, 38, 0, 100, 0, 31, 31, 0, 0, 87, 1636401, 1636403, 1636404, 1636406, 1636407, 1636408, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 31 31 - Run Random Script'),
    (23837, 0, 5, 0, 38, 0, 100, 0, 30, 30, 0, 0, 87, 1636401, 1636402, 1636403, 1636405, 1636406, 1636408, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 30 30 - Run Random Script'),
    (23837, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 27249, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Respawn - Set Data 1 1'),
    (23837, 0, 7, 0, 38, 0, 100, 0, 2, 2, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 2 2 - Despawn Instant');

SET @ITHRIX := 25453; -- Ith'rix the Harvester
DELETE FROM creature_text WHERE entry=@ITHRIX;
INSERT INTO creature_text VALUES(@ITHRIX, 0, 0, "I will take great pleasure in tearing the forces of the Horde apart... limb from limb and piece by piece...", 14, 0, 100, 0, 0, 0, 24672, 0, 'Ith''rix the Harvester');
UPDATE `creature_template` SET `AIName`="SmartAI", InhabitType=4 WHERE `entry`=@ITHRIX;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ITHRIX AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ITHRIX,0,0,0,54,0,100,0,0,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Ith'rix the Harvester - Just Summoned - Say Line 0"),
(@ITHRIX,0,1,0,0,0,100,0,300,300,2000,3000,11,25748,64,0,0,0,0,2,0,0,0,0,0,0,0,"Ith'rix the Harvester - In Combat - Cast 'Poison Stinger'"),
(@ITHRIX,0,2,0,0,0,100,0,10000,10000,30000,30000,11,34392,65,0,0,0,0,2,0,0,0,0,0,0,0,"Ith'rix the Harvester - In Combat - Cast 'Stinger Rage'"),
(@ITHRIX,0,3,0,0,0,100,0,300,300,2000,3000,11,45592,64,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Venom Spit'"),
(@ITHRIX,0,4,0,6,0,100,0,0,0,0,0,45,0,3,0,0,0,0,19,25446,100,0,0,0,0,0,"Nerub'ar Sky Darkener - On Death - Set Data 0 3");


-- Load'er Up! - [H] http://www.wowhead.com/quest=11881/loader-up

DELETE FROM smart_scripts WHERE entryorguid=25969 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (25969, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 46340, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Just Summoned - Cast Crates Carried'),
    (25969, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Just Summoned - Set Passive'),
    (25969, 0, 2, 0, 32, 0, 100, 0, 50, 20000, 3000, 5000, 11, 46342, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Damage - Cast Drop Crate'),
    (25969, 0, 3, 0, 23, 0, 100, 0, 46340, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Has No Aura (Crates Carried) - Despawn'),
    (25969, 0, 4, 5, 75, 0, 100, 0, 0, 25849, 30, 0, 11, 46358, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Give Kill credit'),
    (25969, 0, 5, 6, 61, 0, 100, 0, 0, 25849, 30, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Die'),
    (25969, 0, 6, 0, 61, 0, 100, 0, 0, 25849, 30, 0, 41, 200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Despawn');


-- Not On Our Watch -- [A][H] http://www.wowhead.com/quest=11871/not-on-our-watch

UPDATE `creature_template` SET `AIName`="SmartAI", lootid=25844, pickpocketloot=25844 WHERE `entry`=25844;
DELETE FROM smart_scripts WHERE entryorguid=25844 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (25844, 0, 0, 0, 2, 0, 100, 1, 0, 30, 0, 0, 11, 5915, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Northsea Thug - Between 0-30% Health - Cast \'Crazed\'');

DELETE FROM creature_loot_template WHERE Entry=25844 AND Item=35222;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (25844, 35222, 0, 100, 1, 1, 0, 1, 1, NULL);


-- Vision of Air - [H] http://www.wowhead.com/quest=11631/vision-of-air

SET @SNARLFANG := 25339;
SET @TOTEM := 25455;
SET @BLUE_AURA := 2903;
SET @VISION_OF_GRIMWALKER := 25424;
SET @VISION_OF_KAGANISHU := 25456;
SET @VISION_OF_GRIMWALKER_SPIRIT := 25458;

UPDATE creature_template SET unit_flags=770 WHERE entry IN(@VISION_OF_GRIMWALKER_SPIRIT, @VISION_OF_GRIMWALKER, @VISION_OF_KAGANISHU);

DELETE FROM creature_text WHERE entry=@SNARLFANG AND groupid=2;
INSERT INTO creature_text VALUES(@SNARLFANG, 2, 0, "Oh no... they''ve shackled his spirit!", 12, 0, 100, 0, 0, 0, 24683, 0, 'Snarlfang');

DELETE FROM creature_text WHERE entry=@VISION_OF_KAGANISHU;
INSERT INTO creature_text VALUES(@VISION_OF_KAGANISHU, 0, 0, "KAGANISHU!", 12, 0, 100, 0, 0, 0, 24658, 0, 'Vision of Kaganishu');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@TOTEM;
DELETE FROM smart_scripts WHERE entryorguid=@TOTEM AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@TOTEM, 0, 0, 0, 8, 0, 100, 0, 45594, 0, 0, 0, 80, @TOTEM*100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Totem - On Spellhit - Start event'),
    (@TOTEM, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Totem - On Despawn - Respawn');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@TOTEM*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@TOTEM*100,9,0,0,0,0,100,0,1000,1000,0,0,50,@BLUE_AURA,15,0,0,0,0,8,0,0,0,4523.73,5681.58,81.9056,5.15615,"Totam - On Script - Summon Blue aura"),
    (@TOTEM*100,9,1,0,0,0,100,0,500,500,0,0,12,@VISION_OF_GRIMWALKER,3,10000,0,0,0,8,0,0,0,4524.47,5682.17,81.9157,3.8092,"Totam - On Script - Summon Vision of Grimwalker"),
    (@TOTEM*100,9,2,0,0,0,100,0,0,0,0,0,12,@VISION_OF_KAGANISHU,3,10000,0,0,0,8,0,0,0,4522.75,5680.81,81.8933,0.73044,"Totam - On Script - Summon Vision of Kaganishu"),
    (@TOTEM*100,9,3,0,0,0,100,0,3000,3000,0,0,51,0,0,0,0,0,0,9,@VISION_OF_GRIMWALKER,0,30,0,0,0,0,"Totam - On Script - Spiritwalker dies"),
    (@TOTEM*100,9,4,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,9,@VISION_OF_KAGANISHU,0,30,0,0,0,0,"Totam - On Script - Kaganishu Say Line 0"),
    (@TOTEM*100,9,5,0,0,0,100,0,2000,2000,0,0,12,@VISION_OF_GRIMWALKER_SPIRIT,3,10000,0,0,0,8,0,0,0,4524.47,5682.17,81.9157,3.8092,"Totam - On Script - Summon Vision of Grimwalker's spirit"),
    (@TOTEM*100,9,6,0,0,0,100,0,5000,5000,0,0,1,2,4000,0,0,0,0,9,@SNARLFANG,0,30,0,0,0,0,"Totam - On Script - Say Line 2");



-- [Q] Gamel the Cruel -- http://wotlk.openwow.com/quest=11619
-- Karuk SAI
SET @ENTRY := 25435;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,11619,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Karuk - On Quest 'Gamel the Cruel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2543500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,26450,1,15000,0,0,0,8,0,0,0,2003.83,5851.17,36.2061,2.75762,"Karuk - On Script - Summon Creature 'Ariut'"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,10000,0,0,0,0,19,26450,20,0,0,0,0,0,"Karuk - On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=26450;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(26450, 0, 0, 'The fallen of Pal\'ea will not rest, son.  Find the naga priestess!', 12, 0, 100, 1, 0, 0, 25684, 'Ariut');

-- Two Hellscream's Vigil quests
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND (`SourceEntry`=11585 OR `SourceEntry`=11586);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19,0,11585,0,0,14,0,10172,0,0,0,0,0,'','Accept quest 11585 - Quest 10172 needs to be incomplete'),
(19,0,11586,0,0,8,0,10172,0,0,0,0,0,'','Accept quest 11586 - Quest 10172 needs to be rewarded');

DELETE FROM `quest_template_addon` WHERE `ID` IN (11585, 11586);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(11585,0,0,0,0,0,11585,0,0,0,0,0,0,0,0,0,0),
(11586,0,0,0,0,0,11585,0,0,0,0,0,0,0,0,0,0);

-- [Q] Saragosa's End - http://www.wowhead.com/quest=11957/saragosas-endSaragosa
-- Keristrasza SAI
SET @ENTRY := 26206;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='', `npcflag`=`npcflag`|1 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,9262,0,0,0,11,46772,0,0,0,0,0,7,0,0,0,0,0,0,0,"Keristrasza - On Gossip Option 0 Selected - Cast 'Teleport'"),
(@ENTRY,0,1,0,61,0,100,0,9262,0,0,0,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Keristrasza - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,62,0,100,0,9262,1,0,0,11,46824,0,0,0,0,0,7,0,0,0,0,0,0,0,"Keristrasza - On Gossip Option 1 Selected - Cast 'Teleport'"),
(@ENTRY,0,3,0,61,0,100,0,9262,1,0,0,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Keristrasza - On Gossip Option 1 Selected - Close Gossip");

-- Saragosa's End Invisman SAI
SET @ENTRY := 26265;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,46793,0,0,0,12,26231,5,0,0,0,0,8,0,0,0,4050.19,7329.25,635.97,3.34,"Saragosa's End Invisman - On Spellhit 'Activate Power Focus' - Summon Creature 'Saragosa'"),
(@ENTRY,0,1,0,61,0,100,0,46793,0,0,0,11,46789,0,0,0,0,0,1,0,0,0,0,0,0,0,"Saragosa's End Invisman - On Spellhit 'Activate Power Focus' - Cast 'Blue Power Focus'");

-- Saragosa SAI
SET @ENTRY := 26231;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='', `unit_flags`=`unit_flags`|768, `flags_extra`=`flags_extra`|2 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,6000,6000,0,0,28,46789,0,0,0,0,0,19,26265,40,0,0,0,0,0,"Saragosa - Out of Combat - Remove Aura 'Blue Power Focus' (No Repeat)"),
(@ENTRY,0,1,2,1,0,100,1,12000,12000,0,0,12,26232,1,120000,0,0,0,1,0,0,0,0,0,0,0,"Saragosa - Out of Combat - Summon Creature 'Saragosa' (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,12000,12000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Saragosa - Out of Combat - Despawn Instant (No Repeat)");

-- Saragosa SAI
SET @ENTRY := 26232;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='', `faction`=16, `flags_extra`=`flags_extra`|2 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,40,3400,6200,11,51779,0,0,0,0,0,2,0,0,0,0,0,0,0,"Saragosa - In Combat - Cast 'Frostfire Bolt'"),
(@ENTRY,0,1,0,0,0,100,0,8500,17500,20100,40100,11,15063,0,0,0,0,0,2,0,0,0,0,0,0,0,"Saragosa - In Combat - Cast 'Frost Nova'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=26265;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 26265, 0, 0, 29, 0, 26231, 40, 0, 1, 0, 0, '', 'Only summon Saragosa if there is not already one in range'),
(22, 1, 26265, 0, 0, 29, 0, 26232, 40, 0, 1, 0, 0, '', 'Only summon Saragosa if there is not already one in range');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=46793;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 46793, 0, 0, 31, 0, 3, 26265, 0, 0, 0, 0, '', 'Target needs to be Saragosa''s End Invisman');

DELETE FROM `creature` WHERE `id`=26265 AND `guid`=45761;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(45761, 26265, 571, 1, 1, 0, 0, 4031.15, 7326.39, 635.972, 4.26247, 300, 0, 0, 1, 0, 0, 0, 0, 0);

DELETE FROM `creature` WHERE `guid`=40270 AND `id`=26231;
DELETE FROM `event_scripts` WHERE `id`=17452;
UPDATE `creature_template` SET `flags_extra`=128 WHERE  `entry`=26265; 

-- High Priest Talet-Kha SAI
SET @ENTRY := 26073;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,0,0,0,0,70,0,0,0,0,0,0,10,85098,25422,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Respawn Closest Creature 'Mystical Webbing' (No Repeat)"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,85098,25422,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Set Data 0 1 (No Repeat)"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,70,0,0,0,0,0,0,10,85118,25422,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Respawn Closest Creature 'Mystical Webbing' (No Repeat)"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,85118,25422,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Set Data 0 1 (No Repeat)"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,85175,23033,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Set Data 0 1 (No Repeat)"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,85176,23033,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Set Data 0 1 (No Repeat)"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - Out of Combat - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,7,0,38,0,100,0,0,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - On Data Set 0 1 - Increment Phase"),
(@ENTRY,0,8,0,23,4,100,1,45497,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - On Has Aura 'Web Beam' - Run Script (Phase 4) (No Repeat)"),
(@ENTRY,0,9,0,2,8,100,1,1,45,0,0,11,11640,1,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - Between 1-45% Health - Cast 'Renew' (Phase 8) (No Repeat)"),
(@ENTRY,0,10,0,0,8,100,0,4000,6000,5000,8000,11,15587,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Priest Talet-Kha - In Combat - Cast 'Mind Blast' (Phase 8)"),
(@ENTRY,0,11,12,25,8,100,0,0,0,0,0,18,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - On Reset - Set Flags Immune To Players & Immune To NPC's & Not Selectable (Phase 8)"),
(@ENTRY,0,12,0,61,8,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Talet-Kha - On Reset - Set Event Phase 0 (Phase 8)");

UPDATE `creature_template` SET `ExperienceModifier` = 0.35 WHERE `entry` = 26676; 

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=47304;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 47304, 0, 0, 40, 0, 0, 0, 0, 1, 0, 0, '', '47304 castable only on ground');

-- Add texts
DELETE FROM `creature_text` WHERE `entry` IN (26678, 26676); 
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(26678,0,0,' Leave this place or I will thrash you soundly!',12,0,100,0,4000,0,0,0,''),
(26676,0,0,' A fine meal you will make...',12,0,100,0,0,0,0,0,''),
(26676,0,1,' The feast has arrived! DIE!',12,0,100,0,0,0,0,0,'');

-- Anub'ar Invader SAI
SET @ENTRY := 26676;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,1,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Anub'ar Invader - On Just Summoned - Start Attacking (No Repeat)"),
(@ENTRY,0,1,0,21,0,100,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Anub'ar Invader - On Reached Home - Start Attacking"),
(@ENTRY,0,2,0,4,0,50,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anub'ar Invader - On Aggro - Say Line 0"),
(@ENTRY,0,3,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anub'ar Invader - On Just Summoned - Set Active On"),
(@ENTRY,0,4,0,38,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anub'ar Invader - On Data Set 0 0 - Despawn Instant"),
(@ENTRY,0,5,0,1,0,100,1,10000,10000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anub'ar Invader - Out of Combat - Despawn Instant (No Repeat)");

-- Warsong Battle Standard SAI
SET @ENTRY := 26678;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Respawn - Set Reactstate Passive (No Repeat)"),
(@ENTRY,0,1,3,6,0,100,0,0,0,0,0,6,12053,0,0,0,0,0,23,0,0,0,0,0,0,0,"Warsong Battle Standard - On Just Died - Fail Quest ''"),
(@ENTRY,0,2,0,54,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Just Summoned - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,45,0,0,0,0,0,0,11,26676,60,0,0,0,0,0,"Warsong Battle Standard - On Just Died - Set Data 0 0");

-- Actionlist SAI
SET @ENTRY := 2667800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,84,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Set Active On"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Set Rooted On"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,57,36738,1,0,0,0,0,23,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Remove Item 'Warsong Battle Standard' 1 Time"),
(@ENTRY,9,4,0,0,0,100,0,3000,5000,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,5,0,0,0,100,0,10000,15000,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,6,0,0,0,100,0,10000,15000,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,8,0,0,0,100,0,15000,15000,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,9,0,0,0,100,0,10000,10000,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,11,47303,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Cast 'Summon Anub'ar Invader'"),
(@ENTRY,9,12,0,0,0,100,0,20000,20000,0,0,15,12053,0,0,0,0,0,23,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Quest Credit ''"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Battle Standard - On Script - Despawn Instant");


DELETE FROM `creature_template_addon` WHERE `entry`= 25596;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(25596,0,0,7,1,0,'45771');

UPDATE `creature_template` SET `spell1` = 45876 , `spell2` = 45877 , `VehicleId` = 29 WHERE `entry` = 25596; 
UPDATE `quest_template` SET `TimeAllowed` = 600 WHERE `ID` = 11690;

DELETE FROM `creature_text` WHERE `CreatureID` IN (25607, 25596);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(25607,0,0,'Here\'s your kodo, Torp!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,0,1,'Door-to-door kodo delivery!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,0,2,'One more beast saved from certain death!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,0,3,'The Scourge are no match for me, Torp!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,0,4,'Delivered as promised, Torp!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,1,0,'YES! It worked!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25607,1,1,'Great job!',12,0,100,0,0,0,0,0,'Farmer Torp'),
(25596,0,0,'%s is cured!',16,0,100,0,0,0,0,0,'Infected Kodo Beast');

-- Farmer Torp SAI
SET @ENTRY := 25607;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,1,3000,3000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Farmer Torp - On Data Set 0 1 - Run Script");

-- Actionlist SAI
SET @ENTRY := 2560700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,84,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"Farmer Torp - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Farmer Torp - On Script - Say Line 1");

-- Infected Kodo Beast SAI
SET @ENTRY := 25596;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,512,6000,8000,10000,12000,11,45876,0,0,0,0,0,2,0,0,0,0,0,0,0,"Infected Kodo Beast - In Combat - Cast 'Stampede'"),
(@ENTRY,0,1,0,4,0,100,512,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Aggro - Remove Flag Standstate Dead"),
(@ENTRY,0,2,3,27,0,100,512,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Passenger Boarded - Remove Flag Standstate Dead"),
(@ENTRY,0,3,4,61,0,100,513,0,0,0,0,28,45771,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Passenger Boarded - Remove Aura 'Scourge Infection'"),
(@ENTRY,0,4,0,61,0,100,512,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Passenger Boarded - Say Line 0"),
(@ENTRY,0,5,6,31,0,100,512,45877,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Target Spellhit 'Deliver Kodo' - Cast 'Eject All Passengers'"),
(@ENTRY,0,6,7,61,0,100,512,45877,0,0,0,45,0,1,0,0,0,0,19,25607,25,0,0,0,0,0,"Infected Kodo Beast - On Target Spellhit 'Deliver Kodo' - Set Data 0 1"),
(@ENTRY,0,7,0,61,0,100,512,45877,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Target Spellhit 'Deliver Kodo' - Despawn Instant"),
(@ENTRY,0,8,0,27,0,100,512,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Passenger Boarded - Remove Flag Immune To NPC's"),
(@ENTRY,0,9,0,28,0,100,512,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Passenger Removed - Set Flag Immune To NPC's"),
(@ENTRY,0,10,0,7,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Evade - Set Visibility Off"),
(@ENTRY,0,11,0,21,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infected Kodo Beast - On Reached Home - Set Visibility On");

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`= 25596;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(25596,45875,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 18 AND `SourceGroup`= 25596 AND `SourceEntry`= 45875;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 17 AND `SourceEntry`= 45875;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18,25596,45875,0,0,8,0,11690,0,0,1,0,0,'','Forbidden rewarded quest for spellclick'),
(18,25596,45875,0,0,9,1,11690,0,0,0,0,0,'','Required quest active for spellclick'),
(17,0,45875,0,0,31,1,3,25596,0,0,0,0,'','Spell `Ride Kodo` must target Infected Kodo Beast');


-- Boiling Point -- http://wotlk.openwow.com/quest=11627
UPDATE `creature` SET `spawntimesecs` = 120 WHERE `guid` IN (200013, 102608); 

-- Add texts
DELETE FROM `creature_text` WHERE `entry` = 25416; 
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(25416,0,0,'Who dares?!',12,0,100,0,4000,0,24675,0,'Simmer'),
(25416,0,1,'I will turn your bones to ash!',12,0,100,0,4000,0,24676,0,'Simmer'),
(25416,0,2,'You will be consumed!',12,0,100,0,4000,0,24677,0,'Simmer'),
(25416,0,3,'There is no escape from my rise!',12,0,100,0,4000,0,24678,0,'Simmer'),
(25416,1,0,'STOP!',12,0,100,0,4000,0,24666,0,'Simmer'),
(25416,2,0,'Tell Imperean that I will consider a cessation of hostilities. But first, Churn must stop his watery intrusions upon my rise!',12,0,100,0,4000,0,24667,0,'Simmer'),
(25416,3,0,'I grow bored with you. Begone!',12,0,100,0,4000,0,24668,0,'Simmer');

-- Add texts
DELETE FROM `creature_text` WHERE `entry` = 25418; 
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(25418,0,0,'You dare come into my pool?!',12,0,100,0,4000,0,24680,0,'Churn'),
(25418,0,1,'I will crush you under the weight of my waves!',12,0,100,0,4000,0,24679,0,'Churn'),
(25418,0,2,'Your death will not be pleasant!',12,0,100,0,4000,0,24681,0,'Churn'),
(25418,0,3,'Your corpse will feed my fish.',12,0,100,0,4000,0,24682,0,'Churn'),
(25418,1,0,'WAIT... NO MORE!',12,0,100,0,4000,0,24669,0,'Churn'),
(25418,2,0,'I... submit. As long as Simmer agrees to stop boiling my pool, I agree to an armistice.',12,0,100,0,4000,0,24670,0,'Churn'),
(25418,3,0,'Now, remove yourself from my presence. You would be wise not to come within sight of me again.',12,0,100,0,4000,0,24671,0,'Churn');

-- Simmer SAI
SET @ENTRY := 25416;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Aggro - Say Line 0"),
(@ENTRY,0,1,6,25,0,100,1,0,0,0,0,42,0,5,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Reset - Set Invincibility Hp 5% (No Repeat)"),
(@ENTRY,0,2,3,2,0,100,0,0,5,0,0,85,45599,1,0,0,0,0,7,0,0,0,0,0,0,0,"Simmer - Between 0-5% Health - Invoker Cast 'Boiling Point: Simmer Kill Credit'"),
(@ENTRY,0,3,4,61,0,100,0,0,5,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Simmer - Between 0-5% Health - Set Orientation Invoker"),
(@ENTRY,0,4,5,61,0,100,0,0,5,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - Between 0-5% Health - Set Home Position"),
(@ENTRY,0,5,0,61,0,100,0,0,5,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - Between 0-5% Health - Run Script"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,102,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Reset - Set Health Regeneration On (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 2541600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Set Health Regeneration Off"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Combat Stop"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Set Faction 35"),
(@ENTRY,9,4,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,7000,7000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Simmer - On Script - Despawn Instant");

-- Churn SAI
SET @ENTRY := 25418;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Aggro - Say Line 0"),
(@ENTRY,0,1,6,25,0,100,1,0,0,0,0,42,0,5,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Reset - Set Invincibility Hp 5% (No Repeat)"),
(@ENTRY,0,2,3,2,0,100,0,0,5,0,0,85,45598,1,0,0,0,0,7,0,0,0,0,0,0,0,"Churn - Between 0-5% Health - Invoker Cast 'Boiling Point: Churn Kill Credit'"),
(@ENTRY,0,3,4,61,0,100,0,0,5,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Churn - Between 0-5% Health - Set Orientation Invoker"),
(@ENTRY,0,4,5,61,0,100,0,0,5,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - Between 0-5% Health - Set Home Position"),
(@ENTRY,0,5,0,61,0,100,0,0,5,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - Between 0-5% Health - Run Script"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,102,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Reset - Set Health Regeneration On (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 2541800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Set Health Regeneration Off"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Combat Stop"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Set Faction 35"),
(@ENTRY,9,4,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,7000,7000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Churn - On Script - Despawn Instant");