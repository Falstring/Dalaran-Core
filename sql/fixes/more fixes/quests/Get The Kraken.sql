UPDATE creature SET spawntimesecs=60 WHERE id=34925;



-- North Sea Kraken SAI
SET @ENTRY := 34925;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,7000,9000,11,66514,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - In Combat - Cast 'Frost Breath'"),
(@ENTRY,0,2,0,1,0,100,0,30000,30000,30000,30000,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Out of Combat - Set Visibility On"),
(@ENTRY,0,3,4,2,0,100,1,1,6,0,0,11,66994,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Cast 'Kraken Death Tooth Explosion - Create Tooth' (No Repeat)"),
(@ENTRY,0,4,5,61,0,100,0,1,6,0,0,11,66717,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Cast 'Kraken Spear Quest Credit' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,1,6,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Kill Self (No Repeat)"),
(@ENTRY,0,6,0,1,0,100,0,30000,30000,30000,30000,11,68909,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Out of Combat - Cast 'Submerge Visual'"),
(@ENTRY,0,7,0,0,0,100,0,15000,20000,15000,20000,11,66511,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - In Combat - Cast 'Whirl'"),
(@ENTRY,0,8,9,8,0,100,0,66588,0,0,0,33,35009,0,0,0,0,0,7,0,0,0,0,0,0,0,"North Sea Kraken - On Spellhit 'Flaming Spear' - Quest Credit 'Get Kraken!'"),
(@ENTRY,0,9,0,61,0,50,0,66588,0,0,0,11,50142,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - On Spellhit 'Flaming Spear' - Cast 'Emerge Visual'");
