-- Matis the Cruel SAI
SET @ENTRY := 17664;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Set Orientation Closest Creature 'Tracker of the Hand'"),
(@ENTRY,0,1,2,61,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Say Line 0"),
(@ENTRY,0,2,12,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Start Attacking"),
(@ENTRY,0,3,0,9,0,100,0,5,30,25,40,11,6660,2,0,0,0,0,2,0,0,0,0,0,0,0,"Matis the Cruel - Within 5-30 Range - Cast 'Shoot'"),
(@ENTRY,0,4,0,2,0,100,1,25,50,0,0,45,1,1,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - Between 25-50% Health - Set Data 1 1 (No Repeat)"),
(@ENTRY,0,5,6,38,0,100,0,2,2,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Set Flag Standstate Sleep"),
(@ENTRY,0,6,7,61,0,100,0,2,2,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Stop Attacking"),
(@ENTRY,0,7,8,61,0,100,0,2,2,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Disable Combat Movement"),
(@ENTRY,0,8,9,61,0,100,0,2,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Say Line 1"),
(@ENTRY,0,9,10,61,0,100,0,2,2,0,0,45,2,2,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Set Data 2 2"),
(@ENTRY,0,10,11,61,0,100,0,2,2,0,0,11,31336,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Cast 'Matis Captured DND'"),
(@ENTRY,0,11,0,61,0,100,0,2,2,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Despawn In 15000 ms"),
(@ENTRY,0,12,0,61,0,100,0,1,1,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Set Flags Immune To Players & Immune To NPC's");
