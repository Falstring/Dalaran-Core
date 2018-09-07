-- 
-- ZUL'FARRAK
-- 

-- Chief Ukorz Sandscalp SAI
SET @ENTRY := 7267;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,2,0,0,0,0,11,7366,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Aggro - Cast 'Berserker Stance' (Normal Dungeon)"),
(@ENTRY,0,1,0,61,0,100,2,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Aggro - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,100,2,3500,3500,12000,13000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - In Combat - Cast 'Cleave' (Normal Dungeon)"),
(@ENTRY,0,3,0,0,0,100,2,3000,4000,15000,18000,11,11837,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - In Combat - Cast 'Wide Slash' (Normal Dungeon)"),
(@ENTRY,0,4,5,2,0,100,3,0,30,80000,80000,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 0-30% Health - Cast 'Frenzy' (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,5,0,61,0,100,2,0,30,80000,80000,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 0-30% Health - Say Line 1 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,6,0,2,0,100,3,34,70,120000,120000,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - Between 34-70% Health - Say Line 2 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,7,0,5,0,100,0,5000,5000,1,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Ukorz Sandscalp - On Killed Unit - Say Line 3");

DELETE FROM `creature_text` WHERE `entry`=7267;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(7267, 0, 0, 'This desert be mine!', 14, 0, 0, 0, 0, 5876, 'Chief Ukorz Sandscalp - Say on Aggro', 6225),
(7267, 1, 0, 'Feel the fury of the sands', 14, 0, 0, 0, 0, 5879, 'Chief Ukorz Sandscalp - Say on 30% Enrage', 6227),
(7267, 2, 0, 'The Sandfury regin supreme', 14, 0, 0, 0, 0, 5878, 'Chief Ukorz Sandscalp - Yell on 70%', 6228),
(7267, 3, 0, 'Die, outlander!', 14, 0, 0, 0, 0, 5878, 'Chief Ukorz Sandscalp - Yell on 70%', 0);

-- Theka the Martyr SAI
SET @ENTRY := 7272;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,180000,180000,11,8600,0,0,0,0,0,2,0,0,0,0,0,0,0,"Theka the Martyr - In Combat - Cast 'Fevered Plague'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,11089,0,0,0,0,0,1,0,0,0,0,0,0,0,"Theka the Martyr - Between 0-30% Health - Cast 'Theka Transform' (No Repeat)");