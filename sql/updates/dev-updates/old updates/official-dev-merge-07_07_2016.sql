-- Infra Green.
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=59061, spell2=61093, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31409;
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=59061, spell2=61093, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=32152;


-- Spell generic
DELETE FROM `spell_script_names` WHERE `spell_id` = 35201 AND `ScriptName` = 'spell_gen_paralytic_poison';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (35201,'spell_gen_paralytic_poison');

-- [Rogue] Savage Combat
DELETE FROM `spell_proc_event` WHERE `entry` IN (51682, 58413);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(51682, 0, 8, 0, 524288, 0, 0, 0, 0, 0, 0),
(58413, 0, 8, 0, 524288, 0, 0, 0, 0, 0, 0);
DELETE FROM spell_script_names WHERE spell_id IN(-58683, -58684, 58683, 58684);
INSERT INTO spell_script_names VALUES (58683, 'spell_rog_savage_combat');
INSERT INTO spell_script_names VALUES (58684, 'spell_rog_savage_combat');

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


-- Wildlord Antelarion (22127) 
SET @ENTRY:=22127;
UPDATE `creature_template` SET `gossip_menu_id`=8523, `AIName`='SmartAI' WHERE `entry`=@ENTRY;

-- Gossip insert
DELETE FROM `gossip_menu` WHERE `entry`=8523;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES 
(8523,10657),
(8523,10655);

-- Gossip option 
DELETE FROM `gossip_menu_option` WHERE `menu_id`=8523;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(8523, 0, 0, 'The Felsworn Gas Mask was destroyed, do you have another one?', 0, 1, 1, 0, 0, 0, 0, '',0),
(8523, 1, 0, 'Wildlord, I seem to have lost my druid signal.', 20299, 1, 1, 0, 0, 0, 0, '', 0);

-- Gossip option conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8523;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Felsworn Gas Mask quest taken
(15, 8523, 0, 0, 0, 2, 0, 31366, 1, 0, 1, 0, 0, '', 'Show gossip only if player doesnt have Felsworn Gas Mask'), 
(15, 8523, 0, 0, 0, 9, 0, 10819, 0, 0, 0, 0, 0, '', 'Show gossip if Felsworn Gas Mask quest taken'), 
-- Felsworn Gas Mask quest rewarded and You're Fired! quest not rewarded
(15, 8523, 0, 0, 1, 2, 0, 31366, 1, 0, 1, 0, 0, '', 'Show gossip only if player doesnt have Felsworn Gas Mask'), 
(15, 8523, 0, 0, 1, 8, 0, 10819, 0, 0, 0, 0, 0,'', 'Show gossip if Felsworn Gas Mask quest rewarded'), 
(15, 8523, 0, 0, 1, 8, 0, 10821, 0, 0, 1, 0, 0,'', 'Hide gossip when You\'re Fired! quest rewarded'), 
-- Deaths Door quest  Rewarded and The Hound-Master quest  not Rewarded
(15, 8523, 1, 0, 2, 8, 0, 10910, 0, 0, 0, 0, 0, '', 'Gossip Option requires Deaths Door Rewarded'),
(15, 8523, 1, 0, 2, 8, 0, 10912, 0, 0, 1, 0, 0, '', 'Gossip Option requires The Hound-Master not Rewarded'),
(15, 8523, 1, 0, 2, 2, 0, 31763, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Druid Signal');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=38448;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17, 0, 38448, 0, 0, 3, 0, 31366, 0, 0, 0, 0, '', 'Felsworn Gas Mask spell only if the mask is equiped');

-- SAI for Wildlord Antelarion
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, 8523, 0, 0, 0, 11, 39101, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Cast Create Felsword Gas Mask'), 
(@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Close Gossip'), 
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Say 0'),
(@ENTRY, 0, 3, 4, 62, 0, 100, 0, 8523, 1, 0, 0, 11, 39203, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Cast \'Create Druid Signal\''),
(@ENTRY, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 72, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Close Gossip'),
(@ENTRY, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Say Line 1');

--  Wildlord Antelarion text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(@ENTRY, 0, 0, 'It\'s a good thing I was able to make duplicates of the Felsworn Gas Mask.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wildlord Antelarion'),
(@ENTRY, 1, 0, 'Very well, here is your replacement.', 12, 0, 100, 0, 0, 0, 20300, 0, 'Wildlord Antelarion ');


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


-- Ruthless Cunning - [A][H] http://www.wowhead.com/quest=9927/ruthless-cunning

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=32307;

INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (13, 3, 32307, 0, 0, 31, 0, 3, 17148, 0, 0, 0, 0, '', "Target for Kil'sorrow Banner has to be Kil'sorrow Deathsworn OR"),
    (13, 3, 32307, 0, 1, 31, 0, 3, 18658, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Ritualist OR"),
    (13, 3, 32307, 0, 2, 31, 0, 3, 17147, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Cultist OR"),
    (13, 3, 32307, 0, 3, 31, 0, 3, 17146, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Spellbinder OR"),
    (13, 3, 32307, 0, 4, 31, 0, 3, 18391, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Giselda the Crone.");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=32307;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (17, 0, 32307, 0, 0, 29, 0, 17148, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Deathsworn AND"),
    (17, 0, 32307, 0, 0, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 0, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 1, 29, 0, 18658, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Ritualist AND"),
    (17, 0, 32307, 0, 1, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 1, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 2, 29, 0, 17147, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Cultist AND"),
    (17, 0, 32307, 0, 2, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 2, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 3, 29, 0, 17146, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Spellbinder AND"),
    (17, 0, 32307, 0, 3, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 3, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 4, 29, 0, 18391, 5, 1, 0, 12, 0, '', "Banner can only be cast on Giselda the Crone AND"),
    (17, 0, 32307, 0, 4, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 4, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present.");


-- Ulduar, Ignis hitbox.

UPDATE creature_model_info SET CombatReach=8 WHERE displayid=29185;



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



-- Vent Horizon - [A] http://www.wowhead.com/quest=25212/vent-horizon

SET @THUNDERFLASH := 39396;
SET @PROBE_TARGET_BUNNY := 39420;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=11211;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (15, 11211, 0, 0, 0, 9, 0, 25212, 0, 0, 0, 0, 0, '', 'Show gossip on quest active');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=73082;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (13, 1, 73082, 0, 0, 31, 0, 3, @PROBE_TARGET_BUNNY, 0, 0, 0, 0, '', 'Radiageigatron target Probe Credit');

UPDATE creature_template SET minlevel=40, maxlevel=40, AIName='SmartAI' WHERE entry=@THUNDERFLASH;

DELETE FROM smart_scripts WHERE entryorguid=@THUNDERFLASH AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@THUNDERFLASH, 0, 0, 0, 62, 0, 100, 0, 11211, 0, 0, 0, 11, 73896, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Cast Spell');

UPDATE creature_template SET scale=3, unit_flags=33554432, flags_extra=130, InhabitType=4, AIName='SmartAI' WHERE entry=@PROBE_TARGET_BUNNY;

DELETE FROM smart_scripts WHERE entryorguid=@PROBE_TARGET_BUNNY AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@PROBE_TARGET_BUNNY, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 75779, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Cast Spell'),
    (@PROBE_TARGET_BUNNY, 0, 1, 0, 8, 0, 100, 0, 73082, 0, 0, 0, 33, @PROBE_TARGET_BUNNY, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Cast Spell');

SET @GUID := 1976206;
DELETE FROM creature WHERE id=@PROBE_TARGET_BUNNY AND guid IN(@GUID, @GUID+1, @GUID+2, @GUID+3, @GUID+4, @GUID+5);
INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (@GUID, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5019.37, 544.06, 472.711, 4.05297, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+1, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5125.03, 595.187, 459.885, 0.83284, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+2, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5158.07, 629.349, 466.213, 1.76354, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+3, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5223.95, 624.789, 455.977, 1.55938, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+4, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5347.67, 647.579, 444.626, 3.16551, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+5, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5303.11, 663.793, 448.898, 1.65362, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);



-- Adding Injury to Insult - [H] http://www.wowhead.com/quest=12481/adding-injury-to-insult

SET @BJORN := 24238;
UPDATE creature_template SET speed_run=1.3, InhabitType=3, HoverHeight=7.5 WHERE entry=@BJORN;
DELETE FROM creature_template_addon WHERE entry=@BJORN;
DELETE FROM smart_scripts WHERE entryorguid=@BJORN AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@BJORN, 0, 0, 0, 1, 0, 100, 0, 10000, 15000, 45000, 60000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update OOC - Say text 2'),
    (@BJORN, 0, 1, 2, 8, 0, 100, 0, 43315, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Invoker say text 0'),
    (@BJORN, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Say text 1'),
    (@BJORN, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Unmount'),
    (@BJORN, 0, 4, 6, 61, 0, 100, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Remove Hover'),
    (@BJORN, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Set Aggressive'),
    (@BJORN, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 19, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Remove Unit Flags'),
    (@BJORN, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Attack Start'),
    (@BJORN, 0, 10, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 43371, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On death - Spellcast Bjorn Kill Credit'),
    (@BJORN, 0, 11, 0, 0, 0, 100, 0, 5000, 10000, 10000, 15000, 11, 32736, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update IC - Spellcast Mortal Strike'),
    (@BJORN, 0, 12, 0, 0, 0, 100, 0, 0, 5000, 10000, 15000, 11, 33661, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update IC - Spellcast Crush Armor'),
    (@BJORN, 0, 13, 15, 11, 0, 100, 0, 0, 0, 0, 0, 43, 0, 22657, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spawn - Mount'),
    (@BJORN, 0, 14, 15, 7, 0, 100, 0, 0, 0, 0, 0, 43, 0, 22657, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Mount'),
    (@BJORN, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 141, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Hover'),
    (@BJORN, 0, 16, 18, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Passive'),
    (@BJORN, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Unit Flags');



-- Dr. Whitherlimb (22062)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(22062));
DELETE FROM creature WHERE id IN(22062);
INSERT INTO `creature` VALUES (1528, 22062, 530, 0, 0, 1, 1, 0, 0, 7188.17, -6417.2, 59.1657, 3.23113, 28800, 5, 0, 626, 0, 1, 0, 0, 0, 0);

-- Permafrost trigger's must not be visible.
UPDATE creature_template SET modelid1=0 WHERE entry=24648;

-- [Generic] Argent Pony Bridle
UPDATE creature_template SET npcflag=1+128, ScriptName='npc_pet_gen_argent_pony_bridle' WHERE entry IN(33238, 33239);

-- Rocket Chicken (34492)
REPLACE INTO creature_template_addon VALUES(25109, 0, 0, 0, 0, 0, '45202');
DELETE FROM spell_script_names WHERE spell_id=45202;
INSERT INTO spell_script_names VALUES(45202, "spell_item_rocket_chicken");

-- Acidmaw hitbox.

UPDATE creature_model_info SET combatreach=12 WHERE DisplayID IN(29815);

-- Savage Rend
DELETE FROM `spell_proc_event` WHERE (`entry`='50871');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask1`, `procEx`, `CustomChance`) VALUES ('50871', '9', '1342177280', '2', '0');


-- Hunter Pet Scaling
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('34902', '34903', '34904', '61017');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('34902', 'spell_hun_pet_scaling'),
('34903', 'spell_hun_pet_scaling'),
('34904', 'spell_hun_pet_scaling'),
('61017', 'spell_hun_pet_scaling');


-- -------------------------------------------
-- CRYSTALSONG FOREST
-- -------------------------------------------


-- Preparations for War - [A] http://www.wowhead.com/quest=13418/preparations-for-war - [H] http://www.wowhead.com/quest=13419/preparations-for-war

UPDATE creature_template SET speed_run=3, npcflag=16777216, minlevel=79, maxlevel=79, InhabitType=4, AIName='', ScriptName='npc_preparations_for_war_vehicle' WHERE entry IN (30585, 30470);
UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (31085, 31081);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30585, 30470);
INSERT INTO npc_spellclick_spells VALUES (30585, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (30470, 46598, 1, 0);
DELETE FROM gossip_menu_option WHERE menu_id IN (10026, 10025);

INSERT INTO gossip_menu_option VALUES (10026, 1, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10026, 0, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10025, 1, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10025, 0, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM creature_template_addon WHERE entry=30585;
INSERT INTO creature_template_addon VALUES (30585, 0, 0, 33554432, 0, 0, '55971');
DELETE FROM creature_template_addon WHERE entry=30470;
INSERT INTO creature_template_addon VALUES (30470, 0, 0, 33554432, 0, 0, '55971');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN (10026, 10025);
INSERT INTO conditions VALUES (15, 10025, 0, 0, 0, 8, 0, 13418, 0, 0, 0, 0, 0, '', 'Officer Van Rossem - Show gossip option only if quest Preparations for War is finished');
INSERT INTO conditions VALUES (15, 10025, 1, 0, 0, 28, 0, 13418, 0, 0, 0, 0, 0, '', 'Officer Van Rossem - Show gossip option only if player has taken quest Preparations for War');
INSERT INTO conditions VALUES (15, 10026, 0, 0, 0, 8, 0, 13419, 0, 0, 0, 0, 0, '', 'Sky-Reaver Klum - Show gossip option only if quest Preparations for War is finished');
INSERT INTO conditions VALUES (15, 10026, 1, 0, 0, 28, 0, 13419, 0, 0, 0, 0, 0, '', 'Sky-Reaver Klum - Show gossip option only if player has taken quest Preparations for War');

DELETE FROM smart_scripts WHERE entryorguid IN(31085, 31081) AND source_type=0;
INSERT INTO smart_scripts VALUES (31085, 0, 0, 2, 62, 0, 100, 0, 10026, 0, 0, 0, 11, 58352, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Cast Flight - To Icecrown Airship (H) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31085, 0, 1, 2, 62, 0, 100, 0, 10026, 1, 0, 0, 11, 58352, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Cast Flight - To Icecrown Airship (H) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31085, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Close Gossip');
INSERT INTO smart_scripts VALUES (31081, 0, 0, 2, 62, 0, 100, 0, 10025, 0, 0, 0, 11, 58349, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Cast Flight - To Icecrown Airship (A) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31081, 0, 1, 2, 62, 0, 100, 0, 10025, 1, 0, 0, 11, 58349, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Cast Flight - To Icecrown Airship (A) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31081, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Close Gossip');

DELETE FROM waypoints WHERE entry IN(30585, 30470);
INSERT INTO waypoints
VALUES
    (30585, 1, 5818.54, 483.97, 660, 'ship'),
    (30585, 2, 5835.361, 490.0929, 669.2502, 'ship'),
    (30585, 3, 5845.597, 505.7655, 677.8998, 'ship'),
    (30585, 4, 5865.832, 544.756, 689.6674, 'ship'),
    (30585, 5, 5897.429, 586.1177, 689.6674, 'ship'),
    (30585, 6, 5936.385, 642.625, 682.4179, 'ship'),
    (30585, 7, 5954.68, 688.5653, 678.1407, 'ship'), 
    (30585, 8, 5987.017, 725.1281, 673.5298, 'ship'),
    (30585, 9, 6055.089, 766.5753, 663.0575, 'ship'),
    (30585, 10, 6077.21, 796.1387, 663.0575, 'ship'),
    (30585, 11, 6089.871, 824.1841, 663.0575, 'ship'),
    (30585, 12, 6133.36, 911.2333, 642.3085, 'ship'),
    (30585, 13, 6187.39, 959.5966, 625.03, 'ship'),
    (30585, 14, 6346.116, 1060.051, 631.3358, 'ship'),
    (30585, 15, 6466.611, 1107.176, 644.8912, 'ship'),
    (30585, 16, 6626.671, 1136.814, 649.6691, 'ship'),
    (30585, 17, 6733.844, 1153.338, 658.0303, 'ship');

INSERT INTO waypoints 
VALUES 
    (30470, 1, 5818.54, 483.97, 660, 'ship'),
    (30470, 2, 5808.515, 501.6592, 682.5045, 'ship'),
    (30470, 3, 5791.556, 542.5968, 705.0191, 'ship'),
    (30470, 4, 5805.223, 614.855, 711.2216, 'ship'),
    (30470, 5, 5915.215, 665.7966, 702.0617, 'ship'),
    (30470, 6, 5954.68, 688.5653, 678.1407, 'ship'),
    (30470, 7, 5987.017, 725.1281, 673.5298, 'ship'), 
    (30470, 8, 6055.089, 766.5753, 663.0575, 'ship'),
    (30470, 9, 6077.21, 796.1387, 663.0575, 'ship'),
    (30470, 10, 6089.871, 824.1841, 663.0575, 'ship'),
    (30470, 11, 6133.36, 911.2333, 642.3085, 'ship'),
    (30470, 12, 6187.39, 959.5966, 625.03, 'ship'),
    (30470, 13, 6346.116, 1060.051, 631.3358, 'ship'),
    (30470, 14, 6466.611, 1107.176, 644.8912, 'ship'),
    (30470, 15, 6626.671, 1136.814, 649.6691, 'ship'),
    (30470, 16, 6733.844, 1153.338, 658.0303, 'ship');


-- Pet Scaling
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('54566', '51996', '61697');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('54566', 'spell_dk_pet_scaling'),
('51996', 'spell_dk_pet_scaling'),
('61697', 'spell_dk_pet_scaling');


-- Earth Shield
UPDATE `spell_bonus_data` SET `direct_bonus`='0.5371' WHERE (`entry`='974');