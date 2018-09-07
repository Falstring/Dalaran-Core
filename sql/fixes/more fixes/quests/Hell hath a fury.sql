-- Actionlist SAI
SET @ENTRY := 2875400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Set Home Position"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Set Health Regeneration Off"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Set Flag Immune To Players"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Evade"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Reset Invincibility Hp"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Say Line 0"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,11,52278,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Cast 'Quetz'lun's Hex of Fire'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priestess Tua-Tua - On Script - Despawn In 10000 ms");
