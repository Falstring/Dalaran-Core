-- Ursoc SAI
SET @ENTRY := 26633;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ursoc - On Just Summoned - Play Emote 53"),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,20000,20000,11,52560,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ursoc - In Combat - Cast 'Summon Blood of the Old God'"),
(@ENTRY,0,2,0,0,0,100,0,10000,13000,21000,25000,11,52583,0,0,0,0,0,18,50,0,0,0,0,0,0,"Ursoc - In Combat - Cast 'Old God's Influence'"),
(@ENTRY,0,3,0,9,0,100,0,0,5,9000,12000,11,52581,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ursoc - Within 0-5 Range - Cast 'Crunch Armor'"),
(@ENTRY,0,4,0,8,0,100,0,48549,0,0,0,11,48550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ursoc - On Spellhit 'Ashes of Vordrassil' - Cast 'Summon Ursoc's Spirit'"),
(@ENTRY,0,5,0,6,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,114077,27328,0,0,0,0,0,"Ursoc - On Just Died - Set Data 0 1"),
(@ENTRY,0,6,0,1,0,100,0,60000,60000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ursoc - Out of Combat - Despawn Instant");
