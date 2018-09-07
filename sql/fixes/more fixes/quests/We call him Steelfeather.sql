-- Steelfeather SAI
SET @ENTRY := 24514;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,43969,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Faction 35"),
(@ENTRY,0,1,2,61,0,100,0,43969,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Reactstate Passive"),
(@ENTRY,0,2,3,61,0,100,0,43969,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Stop Attacking"),
(@ENTRY,0,3,4,61,0,100,0,43969,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2574.59,-5223.03,380.069,3.52568,"Steelfeather - On Spellhit 'Feathered Charm' - Move To Position"),
(@ENTRY,0,4,0,61,0,100,0,43969,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Event Phase 1"),
(@ENTRY,0,5,6,0,1,100,1,8000,8000,0,0,33,24515,0,0,0,0,0,7,0,0,0,0,0,0,0,"Steelfeather - In Combat - Quest Credit 'We Call Him Steelfeather' (Phase 1) (No Repeat)"),
(@ENTRY,0,6,0,61,1,100,1,8000,8000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - In Combat - Despawn Instant (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,0,0,100,0,3400,500,12400,14500,11,49865,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Eye Peck'"),
(@ENTRY,0,8,0,0,0,100,0,2400,4000,8000,11400,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Swoop'");