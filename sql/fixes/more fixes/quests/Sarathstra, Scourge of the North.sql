DELETE FROM `creature_text` WHERE `entry` = 26859;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextID`,`comment`) VALUES
(26859, 0, 0, 'Don''t ya worry, mon. Just leave it to Rokhan. She be comin''.', 12, 1, 100, 1, 0, 0, 0, 'Rokhan to Player');

DELETE FROM `gossip_menu_option` WHERE `menu_id`= 9434;
INSERT INTO `gossip_menu_option` VALUES (9434, 0, 0, 'Get that frostwyrm on the ground and I\'ll finish her.', 26046, 1, 1, 0, 0, 0, 0, '', 0);


DELETE FROM `gossip_menu` WHERE `entry`= 9434 AND `text_id`= 12701;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(9434, 12701); -- 26859

DELETE FROM conditions WHERE SourceGroup=9434;
INSERT INTO `conditions` VALUES (15, 9434, 0, 0, 0, 9, 0, 12097, 0, 0, 0, 0, 0, '', 'Show option 0 from gossip 9434 if player has quest 12097');
INSERT INTO `conditions` VALUES (15, 9434, 0, 0, 0, 29, 0, 26858, 100, 0, 1, 0, 0, '', 'Rokhan show gossip if Sarathstra is NOT near.');



-- Sarathstra SAI
SET @ENTRY := 26858;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4000,5000,8000,11,43562,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sarathstra - In Combat - Cast 'Frost Breath'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,10000,12000,11,39005,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sarathstra - In Combat - Cast 'Shadow Nova'");



-- Rokhan SAI
SET @ENTRY := 26859;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,9434,0,0,0,1,0,0,0,0,0,0,8,0,0,0,0,0,0,0,"Rokhan - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,1,2,61,0,100,0,9434,0,0,0,5,22,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rokhan - On Gossip Option 0 Selected - Play Emote 22"),
(@ENTRY,0,2,0,61,0,100,0,9434,0,0,0,12,26858,1,60000,0,0,0,8,0,0,0,4379.58,959.53,86.94,2.52,"Rokhan - On Gossip Option 0 Selected - Summon Creature 'Sarathstra'");
