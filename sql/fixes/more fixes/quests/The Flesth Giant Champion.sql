-- Morbidus SAI
SET @ENTRY := 30698;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbidus - On Data Set 1 1 - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,1,2,61,0,100,0,1,1,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbidus - On Data Set 1 1 - Set Reactstate Aggressive"),
(@ENTRY,0,2,3,61,0,100,0,1,1,0,0,45,1,1,0,0,0,0,19,31306,0,0,0,0,0,0,"Morbidus - On Data Set 1 1 - Set Data 1 1"),
(@ENTRY,0,3,4,61,0,100,0,1,1,0,0,45,1,1,0,0,0,0,19,31428,0,0,0,0,0,0,"Morbidus - On Data Set 1 1 - Set Data 1 1"),
(@ENTRY,0,4,0,61,0,100,0,1,1,0,0,45,1,1,0,0,0,0,9,31314,0,200,0,0,0,0,"Morbidus - On Data Set 1 1 - Set Data 1 1"),
(@ENTRY,0,5,6,25,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbidus - On Reset - Set Reactstate Passive"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbidus - On Reset - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,7,0,6,0,100,0,0,0,0,0,33,30698,0,0,0,0,0,24,0,0,0,0,0,0,0,"Morbidus - On Just Died - Quest Credit ''"),
(@ENTRY,0,8,0,2,0,100,1,1,9,0,0,33,30698,0,0,0,0,0,17,0,35,0,0,0,0,0,"Morbidus - Between 1-9% Health - Quest Credit '' (No Repeat)");
