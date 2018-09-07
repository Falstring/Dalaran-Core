-- Pet Script Misc

-- Tyrael's Hilt (39656)
DELETE FROM `creature_text` WHERE `entry`=29089;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(29089, 0, 0, '%s falls asleep.', 16, 0, 100, 0, 0, 0, 6542, 'Mini-Tyrael'),
(29089, 1, 0, '%s becomes enraged.', 16, 0, 100, 0, 0, 0, 7798, 'Mini-Tyrael');
DELETE FROM `creature_template_addon` WHERE `entry`=29089;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(29089,0,0,0,0,0, '69205');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=29089;
DELETE FROM smart_scripts WHERE entryorguid=29089 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(29089, 29089*100, 29089*100+1, 29089*100+2) AND source_type=9;
-- Mini Tyrael SAI
SET @ENTRY := 29089;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,34,5000,5000,0,5,94,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mini Tyrael - Received Emote 34 - Play Emote 94"),
(@ENTRY,0,1,2,8,0,100,0,69204,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mini Tyrael - On Spellhit 'Sleepy Pet' - Say Line 0"),
(@ENTRY,0,2,0,61,0,100,0,69204,0,0,0,87,@ENTRY*100+00,@ENTRY*100+00,@ENTRY*100+01,@ENTRY*100+02,0,0,1,0,0,0,0,0,0,0,"Mini Tyrael - On Spellhit 'Sleepy Pet' - Run Random Script"),
(@ENTRY,0,3,0,60,0,100,0,1000,1000,1000,1000,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mini Tyrael - On Update - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,4,0,60,0,100,0,1000,1000,1000,1000,19,2056,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mini Tyrael - On Update - Remove Flags Pvp Attackable & Pet In Combat");
INSERT INTO smart_scripts VALUES (29089*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 69204, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove aura');
INSERT INTO smart_scripts VALUES (29089*100+1, 9, 0, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 28, 69204, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove aura');
INSERT INTO smart_scripts VALUES (29089*100+2, 9, 0, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 28, 69204, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove aura');
INSERT INTO smart_scripts VALUES (29089*100+2, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');

-- [Pet] Phoenix Hatchling (26119), Emerald Whelpling (7545), Spirit Darter Hatchling (9662);
DELETE FROM `creature_template_addon` WHERE `entry` IN(26119, 7545, 9662);
INSERT INTO `creature_template_addon` VALUES(26119, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template_addon` VALUES(7545, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template_addon` VALUES(9662, 0, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `InhabitType`=5, `AIName`='', `ScriptName`='npc_pet_gen_wind_rider_cub_gryphon_hatch' WHERE `entry` IN(26119, 7545, 9662);

