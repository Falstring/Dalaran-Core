/* 
* sql\updates\world\2016_01_08_00_world.sql 
*/ 
UPDATE `creature_template` SET
`spell1` = 62225, -- Claw
`spell2` = 47480, -- Thrash
`spell3` = 47481, -- Gnaw
`spell4` = 47482, -- Leap
`spell5` = 47484, -- Huddle
`spell6` = 47496 -- Explode
WHERE `entry` = 30230;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_dk_raise_ally_initial', 'spell_dk_raise_ally', 'spell_dk_ghoul_thrash');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(61999, 'spell_dk_raise_ally_initial'),  
(46619, 'spell_dk_raise_ally'),
(47480, 'spell_dk_ghoul_thrash');

DELETE FROM `spell_dbc` WHERE `Id`=62214;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`Comment`) VALUES
(62214,0xA9800100,0x10000420,0x10084005,0x00130000,0x00800080,0x00060008,0x00001404,21,13,6,25,279,'Mirror Name');
 
 
/* 
* sql\updates\world\2016_01_08_01_world.sql 
*/ 
-- 
SET @Oguid :=6008;
DELETE FROM `gameobject` WHERE `id`=186487;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@Oguid, 186487, 571, 1, 1, 2821.75, -3603.67, 245.555, 3.49556, 0, 0, 0.984379, -0.176061, -300, 0, 1);

SET @CGUID := 76053;
DELETE FROM `creature_template_addon` WHERE `entry` IN (24029);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(24029, 0, 0x0, 0x1, 12544); -- Wyrmcaller Vile - Frost Armor

DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID+5);
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@CGUID+5, 0, 0x0, 0x1, 43570); -- Invisible Stalker (Floating) - Frost State

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN(43568,43569);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(43568, 34872, 1, 'Frost Strike'),
(43569, 34872, 1, 'Frost trigger ');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN(43568);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,43568,0,0,31,0,3,15214,0,0,0,0,'',"Spell 'Frost Strike' Effect 0 can hit 'Invisible Stalker'");

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+8;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID, 15214, 571, 1, 1, 2842.762, -3599.551, 247.2563, 1.658063, 120, 0, 0), -- Invisible Stalker (Area: -Unknown-)
(@CGUID+1, 15214, 571, 1, 1, 2807.391, -3586.93, 247.6916, 3.455752, 120, 0, 0), -- Invisible Stalker (Area: -Unknown-)
(@CGUID+2, 15214, 571, 1, 1, 2833.016, -3621.016, 247.373, 1.850049, 120, 0, 0), -- Invisible Stalker (Area: -Unknown-)
(@CGUID+3, 23033, 571, 1, 1, 2831.685, -3611.948, 257.9287, 0.2479207, 120, 0, 0), -- Invisible Stalker (Floating) (Area: -Unknown-) (Auras: 43570 - Frost State)
(@CGUID+4, 23033, 571, 1, 1, 2832.849, -3638.875, 246.9362, 0.5235988, 120, 0, 0), -- Invisible Stalker (Floating) (Area: -Unknown-)
(@CGUID+5, 23033, 571, 1, 1, 2820.243, -3602.598, 261.4395, 6.161012, 120, 0, 0), -- Invisible Stalker (Floating) (Area: -Unknown-)
(@CGUID+6, 23033, 571, 1, 1, 2855.824, -3596.345, 248.4855, 5.131268, 120, 0, 0), -- Invisible Stalker (Floating) (Area: -Unknown-)
(@CGUID+7, 24029, 571, 1, 1, 2820.328, -3602.552, 247.9988, 3.665191, 120, 0, 0), -- Wyrmcaller Vile (Area: -Unknown-) (Auras: 12544 - Frost Armor)
(@CGUID+8, 23033, 571, 1, 1, 2818.341, -3604.437, 252.666, 3.845377, 120, 0, 0); -- Invisible Stalker (Floating) (Area: -Unknown-)

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=24029;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (24029,-106031,-@CGUID,-(@CGUID+1),-(@CGUID+2),-(@CGUID+5),-(@CGUID+8)) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CGUID*100,@CGUID*100+1) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24029,0,0,0,1,0,100,1,0,0,3000,3000,11,43576,2,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmcaller Vile - OOC - Cast \'Frost Power\''),
(24029,0,1,0,0,0,100,0,0,0,4000,4000,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Wyrmcaller Vile - IC - Cast \'Frostbolt\''),  
(24029,0,2,0,0,0,100,0,0,0,6000,10000,11,15532,0,0,0,0,0,2,0,0,0,0,0,0,0,'Wyrmcaller Vile - IC - Cast \'Frost Nova\''),
(24029,0,3,0,1,0,100,0,0,0,3000,3000,45,0,1,0,0,0,0,19,23033,10,0,0,0,0,0,'Wyrmcaller Vile - OOC - Cast \'Set Data\''),
(-106031,0,0,0,8,0,100,0,43568,0,0,0,80,@CGUID*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit \'Frost Strike\' - Call ActionList'),
(-@CGUID,0,0,0,8,0,100,0,43568,0,0,0,80,@CGUID*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit \'Frost Strike\' - Call ActionList'),
(-(@CGUID+1),0,0,0,8,0,100,0,43568,0,0,0,80,@CGUID*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit \'Frost Strike\' - Call ActionList'),
(-(@CGUID+2),0,0,0,8,0,100,0,43568,0,0,0,80,@CGUID*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit \'Frost Strike\' - Call ActionList'),
(@CGUID*100,9,0,0,0,0,100,0,2400,2400,0,0,11,43569,2,0,0,0,0,19,23033,19,0,0,0,0,0,'Invisible Stalker - Action list - Cast \'Frost\''),
(@CGUID*100+1,9,0,0,0,0,100,0,2400,2400,0,0,11,43569,2,0,0,0,0,10,@CGUID+4,23033,0,0,0,0,0,'Invisible Stalker - Action list - Cast \'Frost\''),
(-(@CGUID+5),0,0,0,1,0,100,0,0,0,5000,7000,11,43591,2,0,0,0,0,19,24029,16,0,0,0,0,0,'Invisible Stalker - OOC - Cast \'Soul Siphon\''),
(-(@CGUID+8),0,0,0,38,0,100,0,0,1,0,0,11,43568,2,0,0,0,0,1,0,0,0,0,0,0,0,'Invisible Stalker - On data set - Cast \'Frost Strike\'');  
 
 
/* 
* sql\updates\world\2016_01_08_02_world.sql 
*/ 
-- 
DELETE FROM `creature_formations` WHERE `leaderGUID`=79010;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(79010, 79010, 0, 0, 2, 0, 0),
(79010, 79012, 6, 360, 2, 0, 0);

-- Pathing for  Entry: 22987 'TDB FORMAT' 
SET @NPC := 79010;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3376.641,`position_y`=3642.897,`position_z`=285.1084 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3376.641,3642.897,285.1084,0,0,0,0,100,0), -- 00:15:15
(@PATH,2,-3372.496,3645.907,284.7475,0,0,0,0,100,0), -- 00:15:16
(@PATH,3,-3376.866,3642.62,285.2078,0,0,0,0,100,0), -- 00:15:22
(@PATH,4,-3381.402,3626.403,279.4974,0,0,0,0,100,0), -- 00:15:26
(@PATH,5,-3382.558,3624.162,278.2544,0,0,0,0,100,0), -- 00:15:31
(@PATH,6,-3385.898,3620.779,276.7867,0,0,0,0,100,0), -- 00:15:33
(@PATH,7,-3389.558,3619.429,276.3516,0,0,0,0,100,0), -- 00:15:35
(@PATH,8,-3393.407,3613.085,276.4259,0,0,0,0,100,0), -- 00:15:38
(@PATH,9,-3390.018,3604.891,276.2281,0,0,0,0,100,0), -- 00:15:41
(@PATH,10,-3397.005,3597.193,277.0055,0,0,0,0,100,0), -- 00:15:44
(@PATH,11,-3393.93,3598.741,276.5433,0,0,0,0,100,0), -- 00:15:48
(@PATH,12,-3390.969,3600.254,276.3882,0,0,0,0,100,0), -- 00:15:50
(@PATH,13,-3389.908,3605.303,276.3074,0,0,0,0,100,0), -- 00:15:51
(@PATH,14,-3390.732,3618.796,276.4376,0,0,0,0,100,0), -- 00:15:55
(@PATH,15,-3384.879,3620.886,277.2273,0,0,0,0,100,0), -- 00:15:58
(@PATH,16,-3382.095,3624.67,278.3322,0,0,0,0,100,0), -- 00:16:01
(@PATH,17,-3381.752,3635.601,284.2187,0,0,0,0,100,0), -- 00:16:03
(@PATH,18,-3379.75,3638.496,285.585,0,0,0,0,100,0), -- 00:16:08
(@PATH,19,-3376.617,3642.928,285.1052,0,0,0,0,100,0), -- 00:16:12
(@PATH,20,-3372.458,3645.933,284.7447,0,0,0,0,100,0); -- 00:16:13
-- 0x1C011842401672C000002500008BC617 .go -3376.641 3642.897 285.1084
 
 
/* 
* sql\updates\world\2016_01_08_03_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25968;
DELETE FROM `creature` WHERE `id`=25801;
 
 
/* 
* sql\updates\world\2016_01_09_00_world.sql 
*/ 
--
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
 
 
/* 
* sql\updates\world\2016_01_10_00_world.sql 
*/ 
-- 
UPDATE `creature_text` SET `text`='Windroc Matriarch lets loose a terrifying shriek.', `BroadcastTextId`=16149 WHERE `entry`=19055;
UPDATE `smart_scripts` SET `action_type`=49, `action_param1`=0 WHERE `entryorguid`=1905500 AND `id`=3;
 
 
/* 
* sql\updates\world\2016_01_10_01_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `unit_flags`=32832 WHERE `entry`=  18689;
 
 
/* 
* sql\updates\world\2016_01_10_02_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=25623;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25623 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25623, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 4000, 6000, 11, 54185, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - IC - Cast Claw Slash'),
(25623, 0, 1, 0, 8, 0, 100, 0, 47166, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Harvest Collector - On spell hit - Despawn');
 
 
/* 
* sql\updates\world\2016_01_10_03_world.sql 
*/ 
-- 
UPDATE `smart_scripts` SET `action_param6`=2 WHERE `entryorguid`=-96556 AND `id`=0 AND `source_type`=0;
 
 
/* 
* sql\updates\world\2016_01_10_04_world.sql 
*/ 
-- 
DELETE FROM `instance_template` WHERE `map` = 169;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES
(169, 0, '', 0);

DELETE FROM `game_tele` WHERE `id` IN  (1425, 1426, 1427, 1428);
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES 
(1425, -366.091, 3097.86, 92.317, 0.0487625, 169, 'EmeraldDream'),
(1426, 2781.566406, 3006.763184, 23.221882, 0.5, 169, 'EmeraldStatue'),
(1427, -2128.12, -1005.89, 132.213, 0.5, 169, 'VerdantFields'),
(1428, 2732.93, -3319.63, 101.284, 0.5, 169, 'EmeraldForest');
 
 
/* 
* sql\updates\world\2016_01_10_05_world335.sql 
*/ 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` in(19,20) AND `SourceId` in(5066,5090,5091,5093,5094,5095,10373,10374);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(19, 0, 5066, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5066, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 5090, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5090, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 5091, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5091, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 5093, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5093, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 5094, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5094, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 5095, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 5095, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 10373, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 10373, 0, 0, 14, 0, 5092, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(19, 0, 10374, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)'),
(20, 0, 10374, 0, 0, 14, 0, 5096, 0, 0, 0, 0, 0, '', 'Call to Arms: The Plaguelands (Breadcrumb)');

UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE  `ID` in(5066,5090,5091,5093,5094,5095,10373,10374);
 
 
/* 
* sql\updates\world\2016_01_12_00_world.sql 
*/ 
-- Susurrus
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`  = 7415;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(7415, 0, 0, 'I am ready to be flown down to the Exodar.',14010,1,1,0,0,0,0,'',0);

DELETE FROM `npc_text` WHERE `ID` = 8955;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`) VALUES
(8955, 'Are you ready, $n?', '', 14012, 0, 1, 0, 0, 0, 0, 0, 0);

-- Set second gossip in gossip menu
DELETE FROM `gossip_menu` WHERE `entry` = 7415;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7415, 8954),
(7415, 8955);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 17435;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15) AND `SourceGroup` = 7415;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,7415,8954,0,0,2,0,23843,1,0,1,0,'','Susurrus - Show gossip menu text if player does not have item 23843 in inventory'),
(14,7415,8955,0,0,2,0,23843,1,0,0,0,'','Susurrus - Show gossip menu text if player has item 23843 in inventory'),
(15,7415,0,0,0,2,0,23843,1,0,0,0,'','Susurrus - Show gossip option 0 if player has item 23843 in inventory');

-- Create SmartAI for Susurrus
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 17435);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(17435,0,0,1,62,0,100,0,7415,0,0,0,11,32474,0,0,0,0,0,7,0,0,0,0,0,0,0,'Susurrus - On Gossip Option 0 Selected - Cast Spell 32474'),
(17435,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Susurrus - On Linked Actions - Close Gossip');


-- Protectorate Nether Drake
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`  = 8229;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8229, 0, 0, 'I''m ready to fly! Take me up, dragon!',18637,1,1,0,0,0,0,'',0);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 20903;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8229;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8229,0,0,0,2,0,29778,1,0,0,0,'','Protectorate Nether Drake - Show gossip option 0 if player has item 23843 in inventory'),
(15,8229,0,0,0,9,0,10438,0,0,0,0,'','Protectorate Nether Drake - Show gossip option 0 if player has quest 10438');
-- Create SmartAI for Protectorate Nether Drake
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 20903);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(20903,0,0,1,62,0,100,0,8229,0,0,0,52,627,0,0,0,0,0,7,0,0,0,0,0,0,0,'Protectorate Nether Drake - On Gossip Option 0 Selected - Init Taxi Path 627'),
(20903,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Protectorate Nether Drake - On Linked Actions - Close Gossip');


-- Veronia
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`  = 8082;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8082, 0, 0, 'I''m as ready as I''ll ever be.',17761,1,1,0,0,0,0,'',0);

DELETE FROM `gossip_menu` WHERE `entry` = 8082;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(8082, 9989),
(8082, 9990);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 20162;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 8082;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,8082,9989,0,0,28,0,10652,0,0,1,0,'','Veronia - Show gossip menu text if player does not have quest 10652'),
(14,8082,9990,0,0,28,0,10652,0,0,0,0,'','Veronia - Show gossip menu text if player has quest 10652'),
(15,8082,0,0,0,28,0,10652,0,0,0,0,'','Veronia - Show gossip option 0 if player has quest 10652');
-- Create SmartAI for Veronia
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 20162);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(20162,0,0,1,62,0,100,0,8082,0,0,0,85,34905,0,0,0,0,0,7,0,0,0,0,0,0,0,'Veronia - On Gossip Option 0 Selected - Invoker Cast \'Stealth Flight\''),
(20162,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Veronia - On Linked Actions - Close Gossip');


-- Cassa Crimsonwing
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 8782;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8782, 0, 0, 'Lady Jaina told me to speak to you about using a gryphon to survey Alcaz Island.',22176,1,1,0,0,0,0,'',0);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 23704;

-- Condition: Gossip menu ID 0 needs quest ID 11142 to be incomplete.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` = 8782 AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8782,0,0,0,9,0,11142,0,0,0,0,'','Cassa Crimsonwing - Show gossip option 0 if player has taken quest ID 11142');

-- Create SmartAI for Cassa Crimsonwing
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 23704);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23704,0,0,1,62,0,100,0,8782,0,0,0,11,42295,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cassa Crimsonwing - On Gossip Option 0 Selected - Cast Spell 42295'),
(23704,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cassa Crimsonwing - On Linked Actions - Close Gossip');


-- Brazen
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7959;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(7959, 0, 0, 'I''m ready to go to Durnholde Keep.',16461,1,1,0,0,0,0,'',0);

DELETE FROM `gossip_menu` WHERE `entry` = 7959;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7959, 9779),
(7959, 9780);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 18725;

-- Condition: On gossip menu click, if item exists, perform linked action 
-- Condition: On gossip menu click, if item exists, perform linked action
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`IN (14, 15) AND `SourceGroup` = 7959;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,7959,9779,0,0,2,0,25853,1,0,0,0,'','Brazen - Show gossip menu text if player has item 25853'),
(14,7959,9780,0,0,2,0,25853,1,0,1,0,'','Brazen - Show gossip menu text if player does not have item 25853'),
(15,7959,0,0,0,2,0,25853,1,0,0,0,'','Brazen - Show gossip option 0 if player has item 25853');

-- Create SmartAI for Brazen
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 18725);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(18725,0,0,1,62,0,100,0,7959,0,0,0,52,534,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brazen - On Gossip Option 0 Selected - Activate Taxi Path 534'),
(18725,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brazen - On Linked Actions - Close Gossip');
 
 
/* 
* sql\updates\world\2016_01_12_01_world335.sql 
*/ 
-- Insert missing gossip_menu_option 21213 for Sorcerer Ashcrombe and 21214 for Deathstalker Adamant:
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (21213,21214) AND `OptionBroadcastTextID`= 2802;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(21213,0,0,'Please unlock the courtyard door.',2802,1,1,0,0,0,0,'',0),
(21214,0,0,'Please unlock the courtyard door.',2802,1,1,0,0,0,0,'',0);
 
 
/* 
* sql\updates\world\2016_01_12_02_world335.sql 
*/ 
-- Insert missing gossip_menu_option 3801 for Myranda the Hag:
DELETE FROM `gossip_menu_option` WHERE `menu_id`= 3801 AND `OptionBroadcastTextID`= 7306;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(3801,0,0,'I am ready for the illusion, Myranda.',7306,2,3,0,0,0,0,'',0);
 
 
/* 
* sql\updates\world\2016_01_12_03_world.sql 
*/ 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=32820;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=32820;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32820,0,0,0,6,0,100,0,0,0,0,0,11,62014,2,0,0,0,0,7,0,0,0,0,0,0,0,"Wild Turkey - On Just Died - Cast 'Turkey Tracker'");

DELETE FROM `creature_text` WHERE `entry`=32820;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(32820,0,0,'Turkey Hunter!',42,0,100,0,0,0,33163,0,'Wild Turkey'),
(32820,1,0,'Turkey Domination!',42,0,100,0,0,0,33164,0,'Wild Turkey'),
(32820,2,0,'Turkey Slaughter!',42,0,100,0,0,0,33165,0,'Wild Turkey'),
(32820,3,0,'TURKEY TRIUMPH!',42,0,100,0,0,0,33167,0,'Wild Turkey');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pilgrims_bounty_turkey_tracker';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62014,'spell_pilgrims_bounty_turkey_tracker');
 
 
/* 
* sql\updates\world\2016_01_12_04_world.sql 
*/ 
SET @OGUID:=79521;
SET @CGUID:=52265;
SET @Event:=2;

DELETE FROM `gameobject` WHERE `guid` IN (@OGUID+0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 187567, 530, 1, 1, -690.7932, 2724.943, 100.9289, 6.265733, 0, 0, 0, 1, 120, 255, 1); -- 187567 (Area: 3483)

DELETE FROM `game_event_gameobject` WHERE `guid` IN (@OGUID+0);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(@Event, @OGUID+0);

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+4 AND `eventEntry`=@Event;
INSERT INTO `game_event_creature` SELECT @Event, creature.guid FROM `creature` WHERE creature.guid BETWEEN @CGUID+0 AND @CGUID+4;
 
 
