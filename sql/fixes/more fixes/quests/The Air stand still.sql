-- 
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30838 AND `source_type` = 0 AND `id`=8;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30839 AND `source_type` = 0 AND `id`=8;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30840 AND `source_type` = 0 AND `id`=10;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30839,0,8,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30831,30,0,0,0,0,0,'Jayde - In Just summoned - Start attack'),
(30840,0,10,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30829,30,0,0,0,0,0,'Munch - In Just summoned - Start attack'),
(30838,0,8,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30830,30,0,0,0,0,0,'Highlord Darion Mograine - In Just summoned - Start attack');




-- High Priest Yath'amon SAI
SET @ENTRY := 30831;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,8,0,100,1,57906,0,0,0,11,57917,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Yath'amon - On Spellhit 'War Horn of Acherus' - Cast 'Death Gate' (Phase 1)"),
(@ENTRY,0,2,0,8,0,100,1,57906,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"High Priest Yath'amon - On Spellhit 'War Horn of Acherus' - Start Attacking (Phase 1)"),
(@ENTRY,0,3,0,0,0,100,0,2000,3000,6000,8000,11,61705,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Priest Yath'amon - In Combat - Cast 'Venomous Bite' (Phase 1)"),
(@ENTRY,0,4,0,0,0,100,0,2000,7000,10000,20000,11,4962,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Priest Yath'amon - In Combat - Cast 'Encasing Webs' (Phase 1)"),
(@ENTRY,0,5,0,0,0,100,0,2000,7000,8000,20000,11,38243,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Priest Yath'amon - In Combat - Cast 'Mind Flay' (Phase 1)"),
(@ENTRY,0,6,0,0,0,100,0,10000,15000,30000,35000,11,34322,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Priest Yath'amon - In Combat - Cast 'Psychic Scream' (Phase 1)"),
(@ENTRY,0,7,0,6,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Priest Yath'amon - On Just Died - Reset All Scripts (Phase 1)");



-- Underking Talonox SAI
SET @ENTRY := 30830;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,8,0,100,1,57906,0,0,0,11,57892,0,0,0,0,0,1,0,0,0,0,0,0,0,"Underking Talonox - On Spellhit 'War Horn of Acherus' - Cast 'Death Gate' (Phase 1)"),
(@ENTRY,0,2,0,8,0,100,1,57906,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Underking Talonox - On Spellhit 'War Horn of Acherus' - Start Attacking (Phase 1)"),
(@ENTRY,0,3,0,0,0,100,0,1000,2000,2000,7000,11,60802,1,0,0,0,0,2,0,0,0,0,0,0,0,"Underking Talonox - In Combat - Cast 'Mandible Crush' (Phase 1)"),
(@ENTRY,0,4,0,0,0,100,0,1500,2000,10000,15000,11,50283,0,0,0,0,0,7,0,2,0,0,0,0,0,"Underking Talonox - In Combat - Cast 'Blinding Swarm' (Phase 1)"),
(@ENTRY,0,5,0,6,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Underking Talonox - On Just Died - Reset All Scripts (Phase 1)");


-- Salranax the Flesh Render SAI
SET @ENTRY := 30829;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,8,0,100,1,57906,0,0,0,11,57911,0,0,0,0,0,1,0,0,0,0,0,0,0,"Salranax the Flesh Render - On Spellhit 'War Horn of Acherus' - Cast 'Death Gate' (Phase 1)"),
(@ENTRY,0,2,0,8,0,100,1,57906,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Salranax the Flesh Render - On Spellhit 'War Horn of Acherus' - Start Attacking (Phase 1)"),
(@ENTRY,0,3,0,4,0,100,1,0,0,0,0,11,18100,1,0,0,0,0,1,0,0,0,0,0,0,0,"Salranax the Flesh Render - On Aggro - Cast 'Frost Armor' (Phase 1)"),
(@ENTRY,0,4,0,0,0,100,0,2000,6000,4000,8000,11,15242,1,0,0,0,0,2,0,0,0,0,0,0,0,"Salranax the Flesh Render - In Combat - Cast 'Fireball' (Phase 1)"),
(@ENTRY,0,5,0,0,0,100,0,15000,20000,15000,20000,11,15244,0,0,0,0,0,7,0,0,0,0,0,0,0,"Salranax the Flesh Render - In Combat - Cast 'Cone of Cold' (Phase 1)"),
(@ENTRY,0,6,0,0,0,100,0,25000,26000,25000,26000,11,15122,1,0,0,0,0,2,0,0,0,0,0,0,0,"Salranax the Flesh Render - In Combat - Cast 'Counterspell' (Phase 1)"),
(@ENTRY,0,7,0,6,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Salranax the Flesh Render - On Just Died - Reset All Scripts (Phase 1)"),
(@ENTRY,0,8,0,25,0,100,0,0,0,0,0,28,18100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Salranax the Flesh Render - On Reset - Remove Aura 'Frost Armor' (Phase 1)");
