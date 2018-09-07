-- Classic SAIs
-- 1.
-- Skullsplitter Hunter SAI
SET @ENTRY := 669;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,2000,20000,25000,11,3148,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skullsplitter Hunter - In Combat - Cast 'Head Crack'");

-- 2.
-- Venture Co. Foreman SAI
SET @ENTRY := 675;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,"Venture Co. Foreman - On Aggro - Cast 'Devotion Aura'");

-- 3.
-- Mosh'Ogg Shaman SAI
SET @ENTRY := 679;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,12058,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,2,0,100,1,0,20,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - Between 0-20% Health - Cast 'Bloodlust' (No Repeat)");

-- 4.
-- Wyrmkin Dreamwalker SAI
SET @ENTRY := 743;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7966,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wyrmkin Dreamwalker - On Aggro - Cast 'Thorns Aura'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,20664,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wyrmkin Dreamwalker - Between 0-50% Health - Cast 'Rejuvenation' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,15000,20000,11,15970,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wyrmkin Dreamwalker - In Combat - Cast 'Sleep'");

-- 5.
-- Marsh Inkspewer SAI
SET @ENTRY := 750;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,12000,15000,11,9612,0,0,0,0,0,2,0,0,0,0,0,0,0,"Marsh Inkspewer - In Combat - Cast 'Ink Spray'");

-- 6.
-- Marsh Flesheater SAI
SET @ENTRY := 751;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marsh Flesheater - Between 0-50% Health - Cast 'Enrage' (No Repeat)");

-- 7.
-- Skullsplitter Headhunter SAI
SET @ENTRY := 781;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skullsplitter Headhunter - On Aggro - Cast 'Net'"),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,12000,25000,11,3148,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skullsplitter Headhunter - In Combat - Cast 'Head Crack'"),
(@ENTRY,0,2,0,0,0,100,0,4000,8000,4000,8000,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skullsplitter Headhunter - In Combat - Cast 'Throw'");

-- 8.
-- Colonel Kurzen SAI
SET @ENTRY := 813;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,4000,8000,11,8818,0,0,0,0,0,2,0,0,0,0,0,0,0,"Colonel Kurzen - In Combat - Cast 'Garrote'");

-- 9.
-- Sorrow Spinner SAI
SET @ENTRY := 858;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sorrow Spinner - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,20000,30000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Sorrow Spinner - In Combat - Cast 'Poison'");

-- 10.
-- Saltscale Oracle SAI
SET @ENTRY := 873;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9532,64,0,0,0,0,1,0,0,0,0,0,0,0,"Saltscale Oracle - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,"Saltscale Oracle - Between 0-30% Health - Cast 'Healing Wave' (No Repeat)");

-- 11.
-- Saltscale Tide Lord SAI
SET @ENTRY := 875;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,120000,120000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Saltscale Tide Lord - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,2,0,100,1,0,20,0,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,"Saltscale Tide Lord - Between 0-20% Health - Cast 'Frost Nova' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,3000,4000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Saltscale Tide Lord - In Combat - Cast 'Frostbolt'");

-- 12.
-- Saltscale Forager SAI
SET @ENTRY := 877;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Saltscale Forager - In Combat - Cast 'Poison'"),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,12000,16000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Saltscale Forager - In Combat - Cast 'Rend'");

-- 13.
-- Saltscale Hunter SAI
SET @ENTRY := 879;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Saltscale Hunter - On Aggro - Cast 'Throw'");

-- 14.
-- Kurzen Subchief SAI
SET @ENTRY := 978;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,18000,21000,11,8053,32,0,0,0,0,2,0,0,0,0,0,0,0,"Kurzen Subchief - In Combat - Cast 'Flame Shock'");

-- 15.
-- Kurzen Shadow Hunter SAI
SET @ENTRY := 979;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kurzen Shadow Hunter - On Aggro - Cast 'Shoot'"),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,30000,35000,11,8806,32,0,0,0,0,2,0,0,0,0,0,0,0,"Kurzen Shadow Hunter - In Combat - Cast 'Poisoned Shot'");

-- 16.
-- Mogh the Undying SAI
SET @ENTRY := 1060;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,120000,120000,11,20798,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mogh the Undying - Out of Combat - Cast 'Demon Skin'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,12471,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mogh the Undying - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,29067,1,0,0,0,0,2,0,0,0,0,0,0,0,"Mogh the Undying - Between 0-50% Health - Cast 'Slave Drain' (No Repeat)");

-- 17.
-- Sawtooth Snapper SAI
SET @ENTRY := 1087;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,8000,10000,11,3604,32,0,0,0,0,2,0,0,0,0,0,0,0,"Sawtooth Snapper - In Combat - Cast 'Tendon Rip'");

-- 18.
-- Venture Co. Miner SAI
SET @ENTRY := 1094;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,6016,32,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Miner - In Combat - Cast 'Pierce Armor'");

-- 19.
UPDATE `creature_template_addon` SET `auras`='3417' WHERE  `entry`=1224;

-- 20.
-- Archbishop Benedictus SAI
SET @ENTRY := 1284;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,120000,120000,11,2791,0,0,0,0,0,1,0,0,0,0,0,0,0,"Archbishop Benedictus - Out of Combat - Cast 'Power Word: Fortitude'");

-- 21.
-- Sranda SAI
SET @ENTRY := 1407;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,3000,5000,11,7372,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sranda - In Combat - Cast 'Hamstring'"),
(@ENTRY,0,1,0,0,0,100,0,4000,8000,4000,8000,11,31864,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sranda - In Combat - Cast 'Shield Charge Stun'");

-- 22.
-- Scarlet Initiate SAI
SET @ENTRY := 1507;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,7,0,0,0,100,0,0,0,3500,5000,11,20793,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Initiate - In Combat - Cast 'Fireball'"),
(@ENTRY,0,10,0,23,0,100,0,12544,0,5000,10000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Initiate - On Has Aura 'Frost Armor' - Cast 'Frost Armor'");

-- 23.
-- Cracked Skull Soldier SAI
SET @ENTRY := 1523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,18000,22000,11,589,32,0,0,0,0,2,0,0,0,0,0,0,0,"Cracked Skull Soldier - In Combat - Cast 'Shadow Word: Pain'");

-- 24.
-- Scarlet Vanguard SAI
SET @ENTRY := 1540;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,2000,120000,120000,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Vanguard - Out of Combat - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,13,0,100,0,1000,12000,0,0,11,72,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Vanguard - On Victim Casting - Cast 'Shield Bash'");

-- 25.
-- Scarlet Bodyguard SAI
SET @ENTRY := 1660;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Bodyguard - Between 0-50% Health - Cast 'Shield Block' (No Repeat)");

-- 26.
-- Captain Melrache SAI
SET @ENTRY := 1665;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,2000,120000,120000,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Melrache - Out of Combat - Cast 'Devotion Aura'"),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,6000,8000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Captain Melrache - In Combat - Cast 'Strike'");

-- 27.
-- Night Web Matriarch SAI
SET @ENTRY := 1688;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Night Web Matriarch - In Combat - Cast 'Poison'");

-- 28.
-- Moonrage Whitescalp SAI
SET @ENTRY := 1769;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,2000,120000,120000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Moonrage Whitescalp - Out of Combat - Cast 'Frost Armor'");

-- 29.
-- Moonrage Glutton SAI
SET @ENTRY := 1779;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6958,0,0,0,0,0,2,0,0,0,0,0,0,0,"Moonrage Glutton - Between 0-50% Health - Cast 'Blood Leech' (No Repeat)");

-- 30.
-- Moss Stalker SAI
SET @ENTRY := 1780;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Moss Stalker - In Combat - Cast 'Poison'");

-- 31.
-- Moonrage Darksoul SAI
SET @ENTRY := 1782;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Moonrage Darksoul - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 32.
-- Skeletal Terror SAI
SET @ENTRY := 1785;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,17650,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skeletal Terror - On Aggro - Cast 'Altered Cauldron Toxin'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skeletal Terror - Between 0-50% Health - Cast 'Fear' (No Repeat)");

-- 33.
-- Decaying Horror SAI
SET @ENTRY := 1813;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,18000,32000,11,17052,32,0,0,0,0,2,0,0,0,0,0,0,0,"Decaying Horror - In Combat - Cast 'Decay'");

-- 34.
-- Plague Lurker SAI
SET @ENTRY := 1824;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,250000,250000,11,3436,32,0,0,0,0,2,0,0,0,0,0,0,0,"Plague Lurker - In Combat - Cast 'Wandering Plague'");

-- 35.
-- Scarlet Cavalier SAI
SET @ENTRY := 1836;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Cavalier - Between 0-50% Health - Cast 'Backhand'"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Cavalier - In Combat - Cast 'Cleave'"),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,13000,16000,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Cavalier - In Combat - Cast 'Mortal Strike'");

-- 36.
-- Scarlet Judge SAI
SET @ENTRY := 1837;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13953,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Judge - Between 0-50% Health - Cast 'Holy Strike' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,5000,10000,8000,10000,11,13953,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Judge - In Combat - Cast 'Holy Strike'"),
(@ENTRY,0,2,0,2,0,100,1,0,20,0,0,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Judge - Between 0-20% Health - Cast 'Hammer of Justice' (No Repeat)");

-- 37.
-- Scarlet Executioner SAI
SET @ENTRY := 1841;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,20,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Executioner - Between 0-20% Health - Cast 'Enrage' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,18000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Executioner - In Combat - Cast 'Cleave'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Executioner - Between 0-50% Health - Cast 'Execute' (No Repeat)"),
(@ENTRY,0,3,0,0,0,100,0,3000,9000,15000,21000,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Executioner - In Combat - Cast 'Mortal Strike'");

-- 38.
-- Foreman Marcrid SAI
SET @ENTRY := 1844;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,12000,18000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"Foreman Marcrid - In Combat - Cast 'Cleave'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,3000,6000,11,19730,0,0,0,0,0,2,0,0,0,0,0,0,0,"Foreman Marcrid - In Combat - Cast 'Strike'");

-- 39.
-- High Protector Tarsen SAI
SET @ENTRY := 1845;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Protector Tarsen - On Aggro - Cast 'Devotion Aura'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,8242,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Protector Tarsen - Between 0-50% Health - Cast 'Shield Slam' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,3000,6000,6000,12000,11,13953,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Protector Tarsen - In Combat - Cast 'Holy Strike'"),
(@ENTRY,0,3,0,2,0,100,1,0,20,0,0,11,10833,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Protector Tarsen - Between 0-20% Health - Cast 'Arcane Blast' (No Repeat)");

-- 40.
-- Foulmane SAI
SET @ENTRY := 1847;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,3427,32,0,0,0,0,2,0,0,0,0,0,0,0,"Foulmane - On Aggro - Cast 'Infected Wound'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,15000,18000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,"Foulmane - In Combat - Cast 'Rend'");

-- 41.
-- Putridius SAI
SET @ENTRY := 1850;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,4,0,100,0,0,0,0,0,11,12946,0,0,0,0,0,1,0,0,0,0,0,0,0,"Putridius - On Aggro - Cast 'Putrid Stench'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,"Putridius - Between 0-50% Health - Cast 'Knock Away' (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,17650,0,0,0,0,0,1,0,0,0,0,0,0,0,"Putridius - On Aggro - Cast 'Altered Cauldron Toxin'"),
(@ENTRY,0,3,0,0,0,100,0,3000,6000,12000,15000,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,"Putridius - In Combat - Cast 'Uppercut'");

-- 42.
-- Scarlet Lumberjack SAI
SET @ENTRY := 1884;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Lumberjack - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,15000,18000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Lumberjack - In Combat - Cast 'Cleave'");

-- 43.
-- Scarlet Smith SAI
SET @ENTRY := 1885;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Smith - Between 0-50% Health - Cast 'Knockdown' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,6000,10000,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Smith - In Combat - Cast 'Strike'");

-- 44.
-- Pyrewood Watcher SAI
SET @ENTRY := 1891;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pyrewood Watcher - In Combat - Cast 'Shoot'");

-- 45.
-- Moonrage Sentry SAI
SET @ENTRY := 1893;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Moonrage Sentry - On Aggro - Cast 'Demoralizing Shout'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,60000,60000,11,6507,0,0,0,0,0,1,0,0,0,0,0,0,0,"Moonrage Sentry - In Combat - Cast 'Battle Roar'");

-- 46.
-- Pyrewood Sentry SAI
SET @ENTRY := 1894;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pyrewood Sentry - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,13,0,100,0,2000,18000,0,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pyrewood Sentry - On Victim Casting - Cast 'Shield Bash'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pyrewood Sentry - Between 0-50% Health - Cast 'Shield Block' (No Repeat)");

-- 47.
-- Pyrewood Elder SAI
SET @ENTRY := 1895;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,2053,0,0,0,0,0,0,0,0,0,0,0,0,0,"Pyrewood Elder - Between 0-50% Health - Cast 'Lesser Heal' (No Repeat)");

-- 48.
-- Moonrage Elder SAI
SET @ENTRY := 1896;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,18000,21000,11,594,0,0,0,0,0,2,0,0,0,0,0,0,0,"Moonrage Elder - In Combat - Cast 'Shadow Word: Pain'");

-- 49.
-- Muad SAI
SET @ENTRY := 1910;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,2607,0,0,0,0,0,2,0,0,0,0,0,0,0,"Muad - In Combat - Cast 'Shock'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,332,0,0,0,0,0,1,0,0,0,0,0,0,0,"Muad - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)");

-- 50.
-- Moonrage Bloodhowler SAI
SET @ENTRY := 1924;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,15000,18000,11,3264,32,0,0,0,0,2,0,0,0,0,0,0,0,"Moonrage Bloodhowler - In Combat - Cast 'Blood Howl'");

-- 1.
-- Farmer Solliden SAI
SET @ENTRY := 1936;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Farmer Solliden - In Combat - Cast 'Strike'");

-- 2.
-- Stone Behemoth SAI
SET @ENTRY := 2157;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5810,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stone Behemoth - Between 0-50% Health - Cast 'Stone Skin' (No Repeat)");

-- 3.
-- Grizzled Thistle Bear SAI
SET @ENTRY := 2165;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,9000,12000,11,3242,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzled Thistle Bear - In Combat - Cast 'Ravage'");

-- 4.
-- Blackwood Pathfinder SAI
SET @ENTRY := 2167;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6950,32,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Pathfinder - On Aggro - Cast 'Faerie Fire'"),
(@ENTRY,0,1,0,9,0,100,0,0,1,2000,12000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackwood Pathfinder - Within 0-1 Range - Cast 'Thrash'");

-- 5.
-- Blackwood Warrior SAI
SET @ENTRY := 2168;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackwood Warrior - On Aggro - Cast 'Battle Stance'"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,10000,12000,11,13532,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackwood Warrior - In Combat - Cast 'Thunder Clap'");

-- 6.
-- Blackwood Ursa SAI
SET @ENTRY := 2170;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,1058,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackwood Ursa - Between 0-50% Health - Cast 'Rejuvenation' (No Repeat)");

-- 7.
-- Blackwood Shaman SAI
SET @ENTRY := 2171;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,913,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackwood Shaman - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Shaman - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,14000,21000,11,2606,0,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Shaman - In Combat - Cast 'Shock'");

-- 8.
-- Strider Clutchmother SAI
SET @ENTRY := 2172;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,5000,10000,11,6607,0,0,0,0,0,2,0,0,0,0,0,0,0,"Strider Clutchmother - In Combat - Cast 'Lash'"),
(@ENTRY,0,1,0,0,0,100,0,4000,6000,12000,18000,11,7272,0,0,0,0,0,2,0,0,0,0,0,0,0,"Strider Clutchmother - In Combat - Cast 'Dust Cloud'");

-- 9.
-- Shadowclaw SAI
SET @ENTRY := 2175;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8552,0,0,0,0,0,2,0,0,0,0,0,0,0,"Shadowclaw - On Aggro - Cast 'Curse of Weakness'");

-- 10.
-- Stormscale Wave Rider SAI
SET @ENTRY := 2179;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13586,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormscale Wave Rider - Between 0-50% Health - Cast 'Aqua Jet' (No Repeat)");

-- 11.
-- Stormscale Siren SAI
SET @ENTRY := 2180;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,11642,0,0,0,0,0,10,0,0,0,0,0,0,0,"Stormscale Siren - Between 0-50% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormscale Siren - In Combat - Cast 'Holy Smite'");

-- 12.
-- Stormscale Myrmidon SAI
SET @ENTRY := 2181;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormscale Myrmidon - Between 0-50% Health - Cast 'Knockdown' (No Repeat)");

-- 13.
-- Stormscale Warrior SAI
SET @ENTRY := 2183;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,3248,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormscale Warrior - Between 0-50% Health - Cast 'Improved Blocking' (No Repeat)");

-- 14.
-- Darkshore Thresher SAI
SET @ENTRY := 2185;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,20000,25000,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darkshore Thresher - In Combat - Cast 'Pierce Armor'");

-- 15.
-- Carnivous the Breaker SAI
SET @ENTRY := 2186;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,"Carnivous the Breaker - In Combat - Cast 'Pierce Armor'"),
(@ENTRY,0,1,0,9,0,100,0,0,1,2000,12000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,"Carnivous the Breaker - Within 0-1 Range - Cast 'Thrash'");

-- 16.
-- Firecaller Radison SAI
SET @ENTRY := 2192;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5915,0,0,0,0,0,1,0,0,0,0,0,0,0,"Firecaller Radison - Between 0-50% Health - Cast 'Crazed' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,20793,0,0,0,0,0,2,0,0,0,0,0,0,0,"Firecaller Radison - In Combat - Cast 'Fireball'"),
(@ENTRY,0,2,0,0,0,100,0,6000,8000,12000,16000,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,"Firecaller Radison - In Combat - Cast 'Fire Nova'");

-- 17.
-- Deth'ryll Satyr SAI
SET @ENTRY := 2212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Deth'ryll Satyr - In Combat - Cast 'Shoot'");

-- 18.
-- Encrusted Tide Crawler SAI
SET @ENTRY := 2233;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,3427,32,0,0,0,0,2,0,0,0,0,0,0,0,"Encrusted Tide Crawler - In Combat - Cast 'Infected Wound'");

-- 19.
-- Reef Crawler SAI
SET @ENTRY := 2235;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,8000,11,12166,0,0,0,0,0,2,0,0,0,0,0,0,0,"Reef Crawler - In Combat - Cast 'Muscle Tear'");

-- 20.
-- Moonstalker Sire SAI
SET @ENTRY := 2237;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,4000,6000,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,"Moonstalker Sire - In Combat - Cast 'Exploit Weakness'");

-- 21.
-- Blackwood Windtalker SAI
SET @ENTRY := 2324;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6982,0,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Windtalker - Between 0-50% Health - Cast 'Gust of Wind' (No Repeat)");

-- 22.
-- Valdred Moray SAI
SET @ENTRY := 2332;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,6000,11,14873,0,0,0,0,0,0,0,0,0,0,0,0,0,"Valdred Moray - In Combat - Cast 'Sinister Strike'");

-- 23.
-- Twilight Disciple SAI
SET @ENTRY := 2338;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,2054,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Disciple - Between 0-50% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,6074,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Disciple - On Aggro - Cast 'Renew'");

-- 24.
-- Twilight Thug SAI
SET @ENTRY := 2339;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Thug - On Aggro - Cast 'Battle Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,60000,60000,11,5242,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Thug - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,12000,16000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Thug - In Combat - Cast 'Disarm'");

-- 25.
-- Witherbark Scalper SAI
SET @ENTRY := 2649;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,14000,21000,11,38959,0,0,0,0,0,2,0,0,0,0,0,0,0,"Witherbark Scalper - In Combat - Cast 'Execute'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Witherbark Scalper - On Aggro - Cast 'Throw'");

-- 26.
-- Siege Golem SAI
SET @ENTRY := 2749;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,2000,5000,11,24611,0,0,0,0,0,2,0,0,0,0,0,0,0,"Siege Golem - In Combat - Cast 'Fireball'");

-- 27.
-- War Golem SAI
SET @ENTRY := 2751;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,9576,0,0,0,0,0,1,0,0,0,0,0,0,0,"War Golem - Between 0-50% Health - Cast 'Lock Down' (No Repeat)");

-- 28.
-- Anathemus SAI
SET @ENTRY := 2754;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,18000,21000,11,11671,2,0,0,0,0,2,0,0,0,0,0,0,0,"Anathemus - In Combat - Cast 'Corruption'");

-- 29.
-- Elder Plainstrider SAI
SET @ENTRY := 2957;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,12000,17000,11,7272,0,0,0,0,0,2,0,0,0,0,0,0,0,"Elder Plainstrider - In Combat - Cast 'Dust Cloud'");

-- 30.
-- Prairie Wolf SAI
SET @ENTRY := 2958;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,5781,32,0,0,0,0,2,0,0,0,0,0,0,0,"Prairie Wolf - In Combat - Cast 'Threatening Growl'");

-- 31.
-- Wiry Swoop SAI
SET @ENTRY := 2969;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,8000,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wiry Swoop - In Combat - Cast 'Swoop'");

-- 32.
-- Swoop SAI
SET @ENTRY := 2970;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,8000,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Swoop - In Combat - Cast 'Swoop'");

-- 33.
-- Kodo Bull SAI
SET @ENTRY := 2973;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,6000,9000,11,5568,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kodo Bull - In Combat - Cast 'Trample'");

-- 40.
-- Archmage Shymm SAI
SET @ENTRY := 3047;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Archmage Shymm - In Combat - Cast 'Fireball'");

-- 41.
-- Mazzranache SAI
SET @ENTRY := 3068;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mazzranache - On Aggro - Cast 'Rushing Charge'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,32000,33000,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mazzranache - In Combat - Cast 'Deadly Poison'");

-- 42.
-- Witchwing Harpy SAI
SET @ENTRY := 3276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,6000,120000,120000,11,7098,32,0,0,0,0,2,0,0,0,0,0,0,0,"Witchwing Harpy - In Combat - Cast 'Curse of Mending'");

-- 43.
-- Witchwing Slayer SAI
SET @ENTRY := 3278;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Witchwing Slayer - On Aggro - Cast 'Demoralizing Shout'"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,12000,16000,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,"Witchwing Slayer - In Combat - Cast 'Execute'");

-- 44.
-- Witchwing Ambusher SAI
SET @ENTRY := 3279;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,8000,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,"Witchwing Ambusher - In Combat - Cast 'Exploit Weakness'");

-- 45.
-- Witchwing Windcaller SAI
SET @ENTRY := 3280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,50,1,0,50,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,"Witchwing Windcaller - Between 0-50% Health - Cast 'Enveloping Winds' (No Repeat)");

-- 46.
-- Venture Co. Mercenary SAI
SET @ENTRY := 3282;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Mercenary - In Combat - Cast 'Shoot'");

-- 47.
-- Venture Co. Enforcer SAI
SET @ENTRY := 3283;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Venture Co. Enforcer - On Aggro - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,6000,15000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Enforcer - In Combat - Cast 'Disarm'");

-- 48.
-- Venture Co. Overseer SAI
SET @ENTRY := 3286;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,6000,60000,65000,11,6531,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Overseer - In Combat - Cast 'Overseer's Poison'");

-- 49.
-- Magenius SAI
SET @ENTRY := 3351;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Magenius - In Combat - Cast 'Fireball'");

-- 50.
-- Southsea Cannoneer SAI
SET @ENTRY := 3382;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Southsea Cannoneer - In Combat - Cast 'Shoot'");

-- 51.
-- Southsea Cutthroat SAI
SET @ENTRY := 3383;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Southsea Cutthroat - In Combat - Cast 'Poison'");

-- 1.
-- Southsea Privateer SAI
SET @ENTRY := 3384;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Southsea Privateer - In Combat - Cast 'Shoot'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,3011,0,0,0,0,0,2,0,0,0,0,0,0,0,"Southsea Privateer - On Aggro - Cast 'Fire Shot'");

-- 2.
-- Pyrewood Tailor SAI
SET @ENTRY := 3530;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,8000,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pyrewood Tailor - In Combat - Cast 'Backstab'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pyrewood Tailor - Between 0-50% Health - Cast 'Disarm' (No Repeat)");

-- 3.
-- Moonrage Tailor SAI
SET @ENTRY := 3531;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,9000,11,7140,0,0,0,0,0,2,0,0,0,0,0,0,0,"Moonrage Tailor - In Combat - Cast 'Expose Weakness'");

-- 4.
-- Keina SAI
SET @ENTRY := 3589;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,3589,0,0,0,0,0,2,0,0,0,0,0,0,0,"Keina - On Aggro - Cast 'Deafening Screech'"),
(@ENTRY,0,1,0,0,0,100,0,2000,4000,5000,6000,11,16868,0,0,0,0,0,2,0,0,0,0,0,0,0,"Keina - In Combat - Cast 'Banshee Wail'");

-- 5.
-- Venture Co. Engineer SAI
SET @ENTRY := 3992;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,6000,8000,11,7978,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Engineer - In Combat - Cast 'Throw Dynamite'");

-- 6.
-- Windshear Geomancer SAI
SET @ENTRY := 4003;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,60000,60000,11,8139,32,0,0,0,0,2,0,0,0,0,0,0,0,"Windshear Geomancer - In Combat - Cast 'Fevered Fatigue'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,"Windshear Geomancer - In Combat - Cast 'Frostbolt'");

-- 7.
-- Deepmoss Webspinner SAI
SET @ENTRY := 4006;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Deepmoss Webspinner - On Aggro - Cast 'Web'");

-- 8.
-- Deepmoss Venomspitter SAI
SET @ENTRY := 4007;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,6000,8000,11,7951,0,0,0,0,0,2,0,0,0,0,0,0,0,"Deepmoss Venomspitter - In Combat - Cast 'Toxic Spit'");

-- 9.
-- Cliff Stormer SAI
SET @ENTRY := 4008;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,5401,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cliff Stormer - In Combat - Cast 'Lizard Bolt'");

-- 10.
-- Raging Cliff Stormer SAI
SET @ENTRY := 4009;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,"Raging Cliff Stormer - On Aggro - Cast 'Rushing Charge'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,10000,13000,11,8078,0,0,0,0,0,2,0,0,0,0,0,0,0,"Raging Cliff Stormer - In Combat - Cast 'Thunderclap'");

-- 11.
-- Young Pridewing SAI
SET @ENTRY := 4011;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Young Pridewing - In Combat - Cast 'Poison'");

-- 15.
-- Pridewing Wyvern SAI
SET @ENTRY := 4012;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Pridewing Wyvern - In Combat - Cast 'Poison'");

-- 16.
-- Pridewing Skyhunter SAI
SET @ENTRY := 4013;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Pridewing Skyhunter - In Combat - Cast 'Poison'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pridewing Skyhunter - On Aggro - Cast 'Swoop'");

-- 17.
-- Pridewing Patriarch SAI
SET @ENTRY := 4015;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Pridewing Patriarch - In Combat - Cast 'Poison'");

-- 18.
-- Fey Dragon SAI
SET @ENTRY := 4016;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,7994,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fey Dragon - In Combat - Cast 'Nullify Mana'");

-- 19.
-- Wily Fey Dragon SAI
SET @ENTRY := 4017;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,8000,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wily Fey Dragon - In Combat - Cast 'Mana Burn'");

-- 20.
-- Charred Ancient SAI
SET @ENTRY := 4028;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,12747,0,0,0,0,0,2,0,0,0,0,0,0,0,"Charred Ancient - Between 0-50% Health - Cast 'Entangling Roots' (No Repeat)");

-- 21.
-- Fledgling Chimaera SAI
SET @ENTRY := 4031;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,60000,11,3396,32,0,0,0,0,2,0,0,0,0,0,0,0,"Fledgling Chimaera - In Combat - Cast 'Corrosive Poison'");

-- 22.
-- Young Chimaera SAI
SET @ENTRY := 4032;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Young Chimaera - In Combat - Cast 'Lightning Bolt'");

-- 23.
-- Rogue Flame Spirit SAI
SET @ENTRY := 4036;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,1094,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rogue Flame Spirit - In Combat - Cast 'Immolate'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,12741,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rogue Flame Spirit - On Aggro - Cast 'Curse of Weakness'");

-- 24.
-- Burning Ravager SAI
SET @ENTRY := 4037;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Ravager - On Aggro - Cast 'Fire Shield II'");

-- 25.
-- Burning Destroyer SAI
SET @ENTRY := 4038;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,8000,0,0,0,0,0,2,0,0,0,0,0,0,0,"Burning Destroyer - Between 0-50% Health - Cast 'Area Burn' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Burning Destroyer - In Combat - Cast 'Fireball'");

-- 26.
-- Mirkfallon Dryad SAI
SET @ENTRY := 4061;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mirkfallon Dryad - On Aggro - Cast 'Throw'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,25000,28000,11,7992,32,0,0,0,0,2,0,0,0,0,0,0,0,"Mirkfallon Dryad - In Combat - Cast 'Slowing Poison'");

-- 27.
-- Venture Co. Builder SAI
SET @ENTRY := 4070;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Builder - In Combat - Cast 'Shoot'");

-- 28.
-- Salt Flats Scavenger SAI
SET @ENTRY := 4154;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,12000,18000,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,"Salt Flats Scavenger - In Combat - Cast 'Execute'");

-- 29.
-- Pesterhide Snarler SAI
SET @ENTRY := 4249;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6576,0,0,0,0,0,2,0,0,0,0,0,0,0,"Pesterhide Snarler - Between 0-50% Health - Cast 'Intimidating Growl' (No Repeat)");

-- 30.
-- Bengus Deepforge SAI
SET @ENTRY := 4258;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bengus Deepforge - In Combat - Cast 'Execute'");

-- 31.
-- Scarlet Augur SAI
SET @ENTRY := 4284;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Augur - In Combat - Cast 'Shadow Bolt'");

-- 32.
-- Scarlet Gallant SAI
SET @ENTRY := 4287;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5589,32,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Gallant - Between 0-50% Health - Cast 'Hammer of Justice' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,12000,26000,11,14517,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Gallant - In Combat - Cast 'Crusader Strike'");

-- 33.
-- Scarlet Beastmaster SAI
SET @ENTRY := 4288;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Beastmaster - In Combat - Cast 'Shoot'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,7896,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Beastmaster - On Aggro - Cast 'Exploding Shot'");

-- 34.
-- Brimgore SAI
SET @ENTRY := 4339;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,6000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,"Brimgore - In Combat - Cast 'Flame Breath'");

-- 35.
-- Drywallow Snapper SAI
SET @ENTRY := 4343;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,12000,11,19319,0,0,0,0,0,2,0,0,0,0,0,0,0,"Drywallow Snapper - In Combat - Cast 'Vicious Bite'");

-- 36.
-- Noxious Flayer SAI
SET @ENTRY := 4346;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,43132,0,0,0,0,0,2,0,0,0,0,0,0,0,"Noxious Flayer - In Combat - Cast 'Poison Burst'");

-- 37.
-- Noxious Reaver SAI
SET @ENTRY := 4347;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,"Noxious Reaver - In Combat - Cast 'Poison'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Noxious Reaver - On Aggro - Cast 'Swoop'");

-- 38.
-- Noxious Shredder SAI
SET @ENTRY := 4348;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Noxious Shredder - In Combat - Cast 'Poison'");

-- 39.
-- Bloodfen Razormaw SAI
SET @ENTRY := 4356;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,3427,32,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodfen Razormaw - In Combat - Cast 'Infected Wound'");

-- 40.
-- Bloodfen Lashtail SAI
SET @ENTRY := 4357;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6607,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodfen Lashtail - Between 0-50% Health - Cast 'Lash' (No Repeat)");

-- 41.
-- Mirefin Muckdweller SAI
SET @ENTRY := 4361;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,65000,11,6278,32,0,0,0,0,2,0,0,0,0,0,0,0,"Mirefin Muckdweller - In Combat - Cast 'Creeping Mold'");

-- 42.
-- Mirefin Oracle SAI
SET @ENTRY := 4363;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,959,1,0,0,0,0,1,0,0,0,0,0,0,0,"Mirefin Oracle - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mirefin Oracle - In Combat - Cast 'Lightning Bolt'");

-- 43.
-- Strashaz Warrior SAI
SET @ENTRY := 4364;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,"Strashaz Warrior - Between 0-50% Health - Cast 'Hamstring' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,30000,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,"Strashaz Warrior - In Combat - Cast 'Mortal Strike'");

-- 44.
-- Strashaz Siren SAI
SET @ENTRY := 4371;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4000,3000,5000,11,15587,64,0,0,0,0,2,0,0,0,0,0,0,0,"Strashaz Siren - In Combat - Cast 'Mind Blast'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,30898,32,0,0,0,0,2,0,0,0,0,0,0,0,"Strashaz Siren - On Aggro - Cast 'Shadow Word: Pain'");

-- 45.
-- Darkmist Recluse SAI
SET @ENTRY := 4378;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,43133,32,0,0,0,0,2,0,0,0,0,0,0,0,"Darkmist Recluse - In Combat - Cast 'Debilitating Poison'");

-- 46.
-- Darkmist Silkspinner SAI
SET @ENTRY := 4379;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darkmist Silkspinner - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Darkmist Silkspinner - In Combat - Cast 'Poison'");

-- 47.
-- Withervine Rager SAI
SET @ENTRY := 4385;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Withervine Rager - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 48.
-- Withervine Mire Beast SAI
SET @ENTRY := 4387;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,5000,8000,11,5337,32,0,0,0,0,2,0,0,0,0,0,0,0,"Withervine Mire Beast - In Combat - Cast 'Wither Strike'");

-- 49.
-- Mudrock Spikeshell SAI
SET @ENTRY := 4397;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,8393,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mudrock Spikeshell - On Aggro - Cast 'Barbs' (No Repeat)");

-- 50.
-- Muckshell Clacker SAI
SET @ENTRY := 4401;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,"Muckshell Clacker - Between 0-50% Health - Cast 'Tendon Rip' (No Repeat)");

-- 1.
-- Darkfang Venomspitter SAI
SET @ENTRY := 4414;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,7951,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darkfang Venomspitter - In Combat - Cast 'Toxic Spit'");

-- 2.
-- Charlga Razorflank SAI
SET @ENTRY := 4421;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6077,0,0,0,0,0,1,0,0,0,0,0,0,0,"Charlga Razorflank - Between 0-50% Health - Cast 'Renew' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,8292,64,0,0,0,0,2,0,0,0,0,0,0,0,"Charlga Razorflank - In Combat - Cast 'Chain Bolt'"),
(@ENTRY,0,2,0,3,0,100,1,0,50,0,0,11,8358,0,0,0,0,0,1,0,0,0,0,0,0,0,"Charlga Razorflank - Between 0-50% Mana - Cast 'Mana Spike' (No Repeat)"),
(@ENTRY,0,3,0,2,0,100,1,0,20,0,0,11,8361,0,0,0,0,0,1,0,0,0,0,0,0,0,"Charlga Razorflank - Between 0-20% Health - Cast 'Purity' (No Repeat)");

-- 3.
-- Ward Guardian SAI
SET @ENTRY := 4427;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,959,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ward Guardian - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)");

-- 4.
-- Razorfen Warden SAI
SET @ENTRY := 4437;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Warden - On Aggro - Cast 'Net'");

-- 5.
-- Razorfen Spearhide SAI
SET @ENTRY := 4438;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8259,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Spearhide - On Aggro - Cast 'Whirling Barrage'");

-- 6.
-- Razorfen Defender SAI
SET @ENTRY := 4442;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razorfen Defender - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,3248,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razorfen Defender - Between 0-50% Health - Cast 'Improved Blocking' (No Repeat)"),
(@ENTRY,0,2,0,13,0,100,0,2000,10000,0,0,11,3248,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Defender - On Victim Casting - Cast 'Improved Blocking'");

-- 7.
-- Fizzle Brassbolts SAI
SET @ENTRY := 4454;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,2941,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fizzle Brassbolts - In Combat - Cast 'Immolate'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,1714,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fizzle Brassbolts - On Aggro - Cast 'Curse of Tongues'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,8056,1,0,0,0,0,2,0,0,0,0,0,0,0,"Fizzle Brassbolts - Between 0-50% Health - Cast 'Frost Shock' (No Repeat)");

-- 8.
-- Haunting Vision SAI
SET @ENTRY := 4472;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,13860,64,0,0,0,0,2,0,0,0,0,0,0,0,"Haunting Vision - In Combat - Cast 'Mind Blast'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,6000,8000,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,"Haunting Vision - In Combat - Cast 'Mana Burn'"),
(@ENTRY,0,2,0,0,0,100,0,15000,30000,15000,30000,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Haunting Vision - In Combat - Cast 'Cripple'");

-- 9.
-- Agam'ar SAI
SET @ENTRY := 4511;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,"Agam'ar - On Aggro - Cast 'Rushing Charge'");

-- 10.
-- Rotting Agam'ar SAI
SET @ENTRY := 4512;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,60000,60000,11,8267,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rotting Agam'ar - In Combat - Cast 'Cursed Blood'");

-- 11.
-- Raging Agam'ar SAI
SET @ENTRY := 4514;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Raging Agam'ar - Between 0-30% Health - Cast 'Frenzy' (No Repeat)");

-- 12.
-- Razorfen Geomancer SAI
SET @ENTRY := 4520;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Geomancer - In Combat - Cast 'Lightning Bolt'");

-- 13.
-- Razorfen Dustweaver SAI
SET @ENTRY := 4522;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Dustweaver - Between 0-50% Health - Cast 'Enveloping Winds' (No Repeat)");

-- 14.
-- Razorfen Groundshaker SAI
SET @ENTRY := 4523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,6000,8000,11,6524,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razorfen Groundshaker - In Combat - Cast 'Ground Tremor'"),
(@ENTRY,0,1,0,0,0,100,0,1000,2000,8000,10000,11,8046,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Groundshaker - In Combat - Cast 'Earth Shock'");

-- 15.
-- Razorfen Handler SAI
SET @ENTRY := 4530;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Handler - In Combat - Cast 'Shoot'");

-- 16.
-- Razorfen Beastmaster SAI
SET @ENTRY := 4532;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Beastmaster - In Combat - Cast 'Shoot'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,8275,32,0,0,0,0,2,0,0,0,0,0,0,0,"Razorfen Beastmaster - On Aggro - Cast 'Poisoned Shot'");

-- 17.
-- Tamed Battleboar SAI
SET @ENTRY := 4535;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tamed Battleboar - On Aggro - Cast 'Rushing Charge'");

-- 18.
-- Blood of Agamaggan SAI
SET @ENTRY := 4541;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4000,60000,60000,11,8282,32,0,0,0,0,2,0,0,0,0,0,0,0,"Blood of Agamaggan - In Combat - Cast 'Curse of Blood'");

-- 19.
-- Quilguard Champion SAI
SET @ENTRY := 4623;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quilguard Champion - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0,"Quilguard Champion - In Combat - Cast 'Sunder Armor'"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quilguard Champion - On Aggro - Cast 'Devotion Aura'");

-- 20.
-- Kolkar Windchaser SAI
SET @ENTRY := 4635;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Kolkar Windchaser - In Combat - Cast 'Lightning Bolt'");

-- 21.
-- Magram Scout SAI
SET @ENTRY := 4638;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,4000,5000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Magram Scout - In Combat - Cast 'Shoot'");

-- 22.
-- Maraudine Stormer SAI
SET @ENTRY := 4658;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,8788,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maraudine Stormer - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,25000,30000,11,8293,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maraudine Stormer - In Combat - Cast 'Lightning Cloud'"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,4000,5000,11,9654,64,0,0,0,0,2,0,0,0,0,0,0,0,"Maraudine Stormer - In Combat - Cast 'Jumping Lightning'");

-- 23.
-- Maraudine Marauder SAI
SET @ENTRY := 4659;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maraudine Marauder - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maraudine Marauder - In Combat - Cast 'Cleave'");

-- 24.
-- Doomwarder Captain SAI
SET @ENTRY := 4680;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6192,2,0,0,0,0,1,0,0,0,0,0,0,0,"Doomwarder Captain - On Aggro - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,20000,25000,11,3261,0,0,0,0,0,2,0,0,0,0,0,0,0,"Doomwarder Captain - In Combat - Cast 'Ignite'");

-- 25.
-- Nether Sorceress SAI
SET @ENTRY := 4684;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,4000,5000,11,20297,64,0,0,0,0,2,0,0,0,0,0,0,0,"Nether Sorceress - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11831,1,0,0,0,0,1,0,0,0,0,0,0,0,"Nether Sorceress - Between 0-50% Health - Cast 'Frost Nova' (No Repeat)");

-- 26.
-- Rabid Bonepaw SAI
SET @ENTRY := 4690;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,60000,11,3150,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rabid Bonepaw - In Combat - Cast 'Rabies'");

-- 27.
-- Dread Flyer SAI
SET @ENTRY := 4693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,25000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dread Flyer - In Combat - Cast 'Disarm'");

-- 28.
-- Scorpashi Venomlash SAI
SET @ENTRY := 4699;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,45000,50000,11,5416,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scorpashi Venomlash - In Combat - Cast 'Venom Sting'");

-- 29.
-- Slitherblade Razortail SAI
SET @ENTRY := 4715;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,8393,0,0,0,0,0,1,0,0,0,0,0,0,0,"Slitherblade Razortail - On Reset - Cast 'Barbs'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,60000,65000,11,7947,0,0,0,0,0,2,0,0,0,0,0,0,0,"Slitherblade Razortail - In Combat - Cast 'Localized Toxin'");

-- 30.
-- Slitherblade Tidehunter SAI
SET @ENTRY := 4716;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Slitherblade Tidehunter - On Aggro - Cast 'Throw'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,865,0,0,0,0,0,1,0,0,0,0,0,0,0,"Slitherblade Tidehunter - Between 0-50% Health - Cast 'Frost Nova' (No Repeat)");

-- 31.
-- Slitherblade Oracle SAI
SET @ENTRY := 4718;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,10000,15000,11,11436,32,0,0,0,0,2,0,0,0,0,0,0,0,"Slitherblade Oracle - In Combat - Cast 'Slow'");

-- 32.
-- Slitherblade Sea Witch SAI
SET @ENTRY := 4719;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,180000,180000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Slitherblade Sea Witch - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,15000,20000,11,27618,0,0,0,0,0,2,0,0,0,0,0,0,0,"Slitherblade Sea Witch - In Combat - Cast 'Blizzard'");

-- 33.
-- Foreman Cozzle SAI
SET @ENTRY := 4723;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foreman Cozzle - Between 0-50% Health - Cast 'Fire Shield II' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,4000,5000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Foreman Cozzle - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,4979,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foreman Cozzle - On Aggro - Cast 'Quick Flame Ward'");

-- 34.
-- Fallenroot Satyr SAI
SET @ENTRY := 4788;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fallenroot Satyr - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,6000,28000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fallenroot Satyr - In Combat - Cast 'Disarm'");

-- 35.
-- Fallenroot Rogue SAI
SET @ENTRY := 4789;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,9000,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fallenroot Rogue - In Combat - Cast 'Exploit Weakness'");

-- 36.
-- Blackfathom Oracle SAI
SET @ENTRY := 4803;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,25000,30000,11,8363,32,0,0,0,0,2,0,0,0,0,0,0,0,"Blackfathom Oracle - In Combat - Cast 'Parasite'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blackfathom Oracle - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)");

-- 37.
-- Murk Slitherer SAI
SET @ENTRY := 5224;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,15000,20000,11,13518,32,0,0,0,0,2,0,0,0,0,0,0,0,"Murk Slitherer - In Combat - Cast 'Poison'");

-- 38.
-- Zukk'ash Wasp SAI
SET @ENTRY := 5245;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Zukk'ash Wasp - In Combat - Cast 'Poison'");

-- 39.
-- Zukk'ash Tunneler SAI
SET @ENTRY := 5247;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,20000,25000,11,6016,32,0,0,0,0,2,0,0,0,0,0,0,0,"Zukk'ash Tunneler - In Combat - Cast 'Pierce Armor'");

-- 40.
-- Woodpaw Mongrel SAI
SET @ENTRY := 5249;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,180000,180000,11,7102,32,0,0,0,0,2,0,0,0,0,0,0,0,"Woodpaw Mongrel - In Combat - Cast 'Contagion of Rot'");

-- 41.
-- Woodpaw Trapper SAI
SET @ENTRY := 5251;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Woodpaw Trapper - On Aggro - Cast 'Net'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Woodpaw Trapper - In Combat - Cast 'Shoot'");

-- 42.
-- Woodpaw Reaver SAI
SET @ENTRY := 5255;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Woodpaw Reaver - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,8000,12000,11,20605,0,0,0,0,0,2,0,0,0,0,0,0,0,"Woodpaw Reaver - In Combat - Cast 'Cleave'");

-- 43.
-- Woodpaw Alpha SAI
SET @ENTRY := 5258;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Woodpaw Alpha - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 44.
-- Sprite Dragon SAI
SET @ENTRY := 5276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,11981,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sprite Dragon - In Combat - Cast 'Mana Burn'");

-- 45.
-- Sprite Darter SAI
SET @ENTRY := 5278;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,11981,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sprite Darter - In Combat - Cast 'Mana Burn'");

-- 46.
-- Rabid Longtooth SAI
SET @ENTRY := 5288;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,60000,11,3150,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rabid Longtooth - In Combat - Cast 'Rabies'");

-- 47.
-- Rage Scar Yeti SAI
SET @ENTRY := 5296;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rage Scar Yeti - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 48.
-- Vale Screecher SAI
SET @ENTRY := 5307;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,12000,13000,25000,30000,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vale Screecher - In Combat - Cast 'Sonic Burst'");

-- 49.
-- Rogue Vale Screecher SAI
SET @ENTRY := 5308;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,12000,13000,25000,30000,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rogue Vale Screecher - In Combat - Cast 'Sonic Burst'");

-- 50.
-- Snarler SAI
SET @ENTRY := 5356;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5543,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snarler - Between 0-50% Health - Cast 'Fade Out' (No Repeat)");

-- 1.
-- High Explorer Magellas SAI
SET @ENTRY := 5387;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,4000,5000,11,8401,64,0,0,0,0,2,0,0,0,0,0,0,0,"High Explorer Magellas - In Combat - Cast 'Fireball'");

-- 2.
-- Kazkaz the Unholy SAI
SET @ENTRY := 5401;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kazkaz the Unholy - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,14887,64,0,0,0,0,2,0,0,0,0,0,0,0,"Kazkaz the Unholy - In Combat - Cast 'Shadow Bolt Volley'");

-- 3.
-- Scorpid Hunter SAI
SET @ENTRY := 5422;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7992,32,0,0,0,0,2,0,0,0,0,0,0,0,"Scorpid Hunter - On Aggro - Cast 'Slowing Poison'");

-- 4.
-- Searing Roc SAI
SET @ENTRY := 5430;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,180000,180000,11,8139,32,0,0,0,0,2,0,0,0,0,0,0,0,"Searing Roc - In Combat - Cast 'Fevered Fatigue'");

-- 5.
-- Sea Spray SAI
SET @ENTRY := 5462;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,10987,1,0,0,0,0,2,0,0,0,0,0,0,0,"Sea Spray - Between 0-50% Health - Cast 'Geyser' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,11538,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sea Spray - In Combat - Cast 'Frostbolt'");

-- 6.
-- Khan Dez'hepah SAI
SET @ENTRY := 5600;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,"Khan Dez'hepah - On Aggro - Cast 'Battle Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,8000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Khan Dez'hepah - In Combat - Cast 'Heroic Strike'");

-- 7.
-- Khan Jehn SAI
SET @ENTRY := 5601;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Khan Jehn - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,13,0,100,0,2000,10000,0,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,"Khan Jehn - On Victim Casting - Cast 'Shield Bash'"),
(@ENTRY,0,2,0,0,0,100,0,2000,4000,5000,6000,11,8380,0,0,0,0,0,2,0,0,0,0,0,0,0,"Khan Jehn - In Combat - Cast 'Sunder Armor'");

-- 8.
-- Tyranis Malem SAI
SET @ENTRY := 5643;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tyranis Malem - On Aggro - Cast 'Moonfire'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,9739,64,0,0,0,0,2,0,0,0,0,0,0,0,"Tyranis Malem - In Combat - Cast 'Wrath'");

-- 9.
-- Comar Villard SAI
SET @ENTRY := 5683;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,12000,15000,11,12540,0,0,0,0,0,2,0,0,0,0,0,0,0,"Comar Villard - In Combat - Cast 'Gouge'");

-- 10.
-- Sister Hatelash SAI
SET @ENTRY := 5785;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6960,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sister Hatelash - On Aggro - Cast 'Lightning Barrier'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sister Hatelash - In Combat - Cast 'Lightning Bolt'");

-- 11.
-- Snagglespear SAI
SET @ENTRY := 5786;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,"Snagglespear - On Aggro - Cast 'Net'");

-- 12.
-- Margol the Rager SAI
SET @ENTRY := 5833;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,8147,0,0,0,0,0,1,0,0,0,0,0,0,0,"Margol the Rager - In Combat - Cast 'Thunderclap'");

-- 13.
-- Captain Gerogg Hammertoe SAI
SET @ENTRY := 5851;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,71,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Gerogg Hammertoe - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,3419,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Gerogg Hammertoe - Between 0-50% Health - Cast 'Improved Blocking' (No Repeat)"),
(@ENTRY,0,2,0,13,0,100,0,2000,20000,0,0,11,1672,0,0,0,0,0,2,0,0,0,0,0,0,0,"Captain Gerogg Hammertoe - On Victim Casting - Cast 'Shield Bash'"),
(@ENTRY,0,3,0,0,0,100,0,4000,6000,12000,18000,11,15062,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Gerogg Hammertoe - In Combat - Cast 'Shield Wall'");

-- 14.
-- Inferno Elemental SAI
SET @ENTRY := 5852;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,8000,11,10733,0,0,0,0,0,2,0,0,0,0,0,0,0,"Inferno Elemental - In Combat - Cast 'Flame Spray'");

-- 15.
-- Heavy War Golem SAI
SET @ENTRY := 5854;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,"Heavy War Golem - On Reset - Cast 'Trample'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,"Heavy War Golem - Between 0-50% Health - Cast 'Stomp' (No Repeat)");

-- 16.
-- Magma Elemental SAI
SET @ENTRY := 5855;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,11970,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magma Elemental - Between 0-50% Health - Cast 'Fire Nova' (No Repeat)");

-- 17.
-- Glassweb Spider SAI
SET @ENTRY := 5856;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Glassweb Spider - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Glassweb Spider - In Combat - Cast 'Poison'");

-- 18.
-- Greater Lava Spider SAI
SET @ENTRY := 5858;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,11985,64,0,0,0,0,2,0,0,0,0,0,0,0,"Greater Lava Spider - In Combat - Cast 'Fireball'");

-- 19.
-- Twilight Dark Shaman SAI
SET @ENTRY := 5860;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Dark Shaman - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,8000,12000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Dark Shaman - In Combat - Cast 'Shock'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,7289,32,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Dark Shaman - On Aggro - Cast 'Shrink'");

-- 20.
-- Twilight Fire Guard SAI
SET @ENTRY := 5861;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,11988,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Fire Guard - In Combat - Cast 'Fireball Volley'");

-- 21.
-- Twilight Geomancer SAI
SET @ENTRY := 5862;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Geomancer - In Combat - Cast 'Fireball'"),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,20000,24000,11,11990,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Geomancer - In Combat - Cast 'Rain of Fire'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,18972,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Geomancer - On Aggro - Cast 'Slow'");

-- 22.
-- Minor Manifestation of Fire SAI
SET @ENTRY := 5893;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,134,0,0,0,0,0,1,0,0,0,0,0,0,0,"Minor Manifestation of Fire - On Aggro - Cast 'Fire Shield'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,18000,22000,11,8050,0,0,0,0,0,2,0,0,0,0,0,0,0,"Minor Manifestation of Fire - In Combat - Cast 'Flame Shock'");

-- 23.
-- Corrupt Minor Manifestation of Water SAI
SET @ENTRY := 5894;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,122,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corrupt Minor Manifestation of Water - Between 0-50% Health - Cast 'Frost Nova' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,8000,12000,11,8056,0,0,0,0,0,2,0,0,0,0,0,0,0,"Corrupt Minor Manifestation of Water - In Combat - Cast 'Frost Shock'");

-- 24.
-- Brother Ravenoak SAI
SET @ENTRY := 5915;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brother Ravenoak - On Aggro - Cast 'Bear Form'"),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,28,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brother Ravenoak - On Reset - Remove Aura 'Bear Form'"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,5000,6000,11,12161,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brother Ravenoak - In Combat - Cast 'Maul'"),
(@ENTRY,0,3,0,2,0,100,1,0,50,0,0,11,12160,2,0,0,0,0,1,0,0,0,0,0,0,0,"Brother Ravenoak - Between 0-50% Health - Cast 'Rejuvenation' (No Repeat)");

-- 25.
-- Sorrow Wing SAI
SET @ENTRY := 5928;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,60000,60000,11,3388,32,0,0,0,0,2,0,0,0,0,0,0,0,"Sorrow Wing - In Combat - Cast 'Deadly Leech Poison'"),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,12000,16000,11,3405,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sorrow Wing - In Combat - Cast 'Soul Rend'");

-- 26.
-- Sister Riven SAI
SET @ENTRY := 5930;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sister Riven - On Aggro - Cast 'Fire Shield II'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,45000,48000,11,3356,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sister Riven - In Combat - Cast 'Flame Lash'"),
(@ENTRY,0,2,0,0,0,100,0,6000,8000,15000,18000,11,6725,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sister Riven - In Combat - Cast 'Flame Spike'");

-- 27.
-- Foreman Rigger SAI
SET @ENTRY := 5931;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Foreman Rigger - On Aggro - Cast 'Net'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,20000,25000,11,6016,32,0,0,0,0,2,0,0,0,0,0,0,0,"Foreman Rigger - In Combat - Cast 'Pierce Armor'");

-- 28.
-- Taskmaster Whipfang SAI
SET @ENTRY := 5932;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,16508,0,0,0,0,0,1,0,0,0,0,0,0,0,"Taskmaster Whipfang - Between 0-50% Health - Cast 'Intimidating Roar' (No Repeat)");

-- 29.
-- Heartrazor SAI
SET @ENTRY := 5934;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,60000,11,8256,32,0,0,0,0,2,0,0,0,0,0,0,0,"Heartrazor - In Combat - Cast 'Lethal Toxin'");

-- 30.
-- Vile Sting SAI
SET @ENTRY := 5937;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8257,32,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Sting - On Aggro - Cast 'Venom Sting'");

-- 31.
-- Dreadmaul Ogre SAI
SET @ENTRY := 5974;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadmaul Ogre - Between 0-30% Health - Cast 'Bloodlust' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,20793,64,0,0,0,0,2,0,0,0,0,0,0,0,"Dreadmaul Ogre - In Combat - Cast 'Fireball'");

-- 32.
-- Razorfen Stalker SAI
SET @ENTRY := 6035;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7259,2,0,0,0,0,1,0,0,0,0,0,0,0,"Razorfen Stalker - On Aggro - Cast 'Nature Protection Potion'");

-- 33.
-- Diathorus the Seeker SAI
SET @ENTRY := 6072;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,"Diathorus the Seeker - Between 0-50% Health - Cast 'Fear' (No Repeat)");

-- 34.
-- Varo'then's Ghost SAI
SET @ENTRY := 6118;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,21007,32,0,0,0,0,2,0,0,0,0,0,0,0,"Varo'then's Ghost - On Aggro - Cast 'Curse of Weakness'");

-- 35.
-- Haldarr Trickster SAI
SET @ENTRY := 6126;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,180000,180000,11,7098,32,0,0,0,0,2,0,0,0,0,0,0,0,"Haldarr Trickster - In Combat - Cast 'Curse of Mending'");

-- 36.
-- Draconic Magelord SAI
SET @ENTRY := 6129;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Draconic Magelord - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,20000,25000,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,"Draconic Magelord - In Combat - Cast 'Blizzard'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Draconic Magelord - On Aggro - Cast 'Frost Shock'");

-- 37.
-- Draconic Mageweaver SAI
SET @ENTRY := 6131;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Draconic Mageweaver - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12557,0,0,0,0,0,2,0,0,0,0,0,0,0,"Draconic Mageweaver - Between 0-50% Health - Cast 'Cone of Cold' (No Repeat)");

-- 38.
-- Arkkoran Pincer SAI
SET @ENTRY := 6137;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,15000,18000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arkkoran Pincer - In Combat - Cast 'Rend'");

-- 39.
-- Arkkoran Oracle SAI
SET @ENTRY := 6138;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Arkkoran Oracle - On Aggro - Cast 'Lightning Shield'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,"Arkkoran Oracle - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,3000,6000,12000,18000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arkkoran Oracle - In Combat - Cast 'Shock'");

-- 40.
-- Hetaera SAI
SET @ENTRY := 6140;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,7367,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hetaera - In Combat - Cast 'Infected Bite'");

-- 41.
-- Servant of Arkkoroc SAI
SET @ENTRY := 6143;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,"Servant of Arkkoroc - On Reset - Cast 'Trample'");

-- 42.
-- Son of Arkkoroc SAI
SET @ENTRY := 6144;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,"Son of Arkkoroc - Between 0-50% Health - Cast 'Knock Away' (No Repeat)");

-- 43.
-- Cliff Thunderer SAI
SET @ENTRY := 6147;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,8147,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cliff Thunderer - In Combat - Cast 'Thunderclap'");

-- 44.
-- Cliff Walker SAI
SET @ENTRY := 6148;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,65000,11,16498,32,0,0,0,0,2,0,0,0,0,0,0,0,"Cliff Walker - In Combat - Cast 'Faerie Fire'");

-- 45.
-- Roogug SAI
SET @ENTRY := 6168;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Roogug - In Combat - Cast 'Lightning Bolt'");

-- 46.
-- Timbermaw Warrior SAI
SET @ENTRY := 6185;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,"Timbermaw Warrior - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,3000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Timbermaw Warrior - In Combat - Cast 'Strike'");

-- 47.
-- Timbermaw Den Watcher SAI
SET @ENTRY := 6187;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Timbermaw Den Watcher - On Aggro - Cast 'Battle Shout'");

-- 48.
-- Timbermaw Shaman SAI
SET @ENTRY := 6188;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,20295,0,0,0,0,0,2,0,0,0,0,0,0,0,"Timbermaw Shaman - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,15000,20000,11,37665,0,0,0,0,0,2,0,0,0,0,0,0,0,"Timbermaw Shaman - In Combat - Cast 'Lightning Cloud'");

-- 49.
-- Timbermaw Ursa SAI
SET @ENTRY := 6189;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,"Timbermaw Ursa - In Combat - Cast 'Thunderclap'");

-- 50.
-- Caverndeep Invader SAI
SET @ENTRY := 6208;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,8000,15000,11,12540,0,0,0,0,0,2,0,0,0,0,0,0,0,"Caverndeep Invader - In Combat - Cast 'Gouge'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,1604,0,0,0,0,0,2,0,0,0,0,0,0,0,"Caverndeep Invader - On Aggro - Cast 'Dazed'"),
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,11,9770,0,0,0,0,0,1,0,0,0,0,0,0,0,"Caverndeep Invader - On Reset - Cast 'Radiation'");

-- 1.
-- Irradiated Invader SAI
SET @ENTRY := 6213;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,9769,0,0,0,0,0,0,0,0,0,0,0,0,0,"Irradiated Invader - On Reset - Cast 'Radiation'");

-- 2.
-- Irradiated Burrower SAI
SET @ENTRY := 6214;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,24000,25000,11,9791,0,0,0,0,0,2,0,0,0,0,0,0,0,"Irradiated Burrower - In Combat - Cast 'Head Crack'"),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,11,9769,0,0,0,0,0,1,0,0,0,0,0,0,0,"Irradiated Burrower - On Reset - Cast 'Radiation'");

-- 3.
-- Makrinni Razorclaw SAI
SET @ENTRY := 6350;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,13444,0,0,0,0,0,2,0,0,0,0,0,0,0,"Makrinni Razorclaw - In Combat - Cast 'Sunder Armor'");

-- 4.
-- Kurzen Mindslave SAI
SET @ENTRY := 6366;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kurzen Mindslave - Between 0-50% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,20,0,0,11,7964,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kurzen Mindslave - Between 0-20% Health - Cast 'Smoke Bomb' (No Repeat)");

-- 5.
-- Makrinni Scrabbler SAI
SET @ENTRY := 6370;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,"Makrinni Scrabbler - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11642,1,0,0,0,0,1,0,0,0,0,0,0,0,"Makrinni Scrabbler - Between 0-50% Health - Cast 'Heal' (No Repeat)");

-- 6.
-- Makrinni Snapclaw SAI
SET @ENTRY := 6372;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,"Makrinni Snapclaw - Between 0-50% Health - Cast 'Tendon Rip' (No Repeat)");

-- 7.
-- Thunderhead Hippogryph SAI
SET @ENTRY := 6375;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Hippogryph - In Combat - Cast 'Shock'");

-- 8.
-- Thunderhead Stagwing SAI
SET @ENTRY := 6377;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Stagwing - In Combat - Cast 'Shock'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11019,1,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Stagwing - Between 0-50% Health - Cast 'Wing Flap' (No Repeat)");

-- 9.
-- Thunderhead Skystormer SAI
SET @ENTRY := 6378;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,3000,6000,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Skystormer - In Combat - Cast 'Shock'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,12000,25000,11,6535,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Skystormer - In Combat - Cast 'Lightning Cloud'");

-- 10.
-- Thunderhead Patriarch SAI
SET @ENTRY := 6379;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderhead Patriarch - On Aggro - Cast 'Rushing Charge'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,3000,6000,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Patriarch - In Combat - Cast 'Shock'");

-- 11.
-- Thunderhead Consort SAI
SET @ENTRY := 6380;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,36594,64,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Consort - In Combat - Cast 'Lightning Breath'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,12000,25000,11,12553,1,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderhead Consort - In Combat - Cast 'Shock'");

-- 12. Dahell??
-- Tazan SAI
SET @ENTRY := 6494;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tazan - Between 0-50% Health - Cast 'Backhand' (No Repeat)");

-- 13.
-- Monnos the Elder SAI
SET @ENTRY := 6646;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,"Monnos the Elder - On Reset - Cast 'Trample'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,"Monnos the Elder - Between 0-50% Health - Cast 'Knock Away' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,1,0,20,0,0,11,11876,0,0,0,0,0,2,0,0,0,0,0,0,0,"Monnos the Elder - Between 0-20% Health - Cast 'War Stomp' (No Repeat)");

-- 14.
-- Magister Hawkhelm SAI
SET @ENTRY := 6647;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,34974,0,0,0,0,0,2,0,0,0,0,0,0,0,"Magister Hawkhelm - On Aggro - Cast 'Multi-Shot'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Magister Hawkhelm - In Combat - Cast 'Shoot'");

-- 15.
-- Master Feardred SAI
SET @ENTRY := 6652;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,22271,0,0,0,0,0,1,0,0,0,0,0,0,0,"Master Feardred - Between 0-50% Health - Cast 'Arcane Explosion' (No Repeat)");

-- 16.
-- Flagglemurk the Cruel SAI
SET @ENTRY := 7015;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,18812,0,0,0,0,0,2,0,0,0,0,0,0,0,"Flagglemurk the Cruel - Between 0-50% Health - Cast 'Knockdown' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,4000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Flagglemurk the Cruel - In Combat - Cast 'Strike'");

-- 17.
-- Digmaster Shovelphlange SAI
SET @ENTRY := 7057;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,"Digmaster Shovelphlange - On Aggro - Cast 'Defensive Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,4000,6000,11,8380,0,0,0,0,0,2,0,0,0,0,0,0,0,"Digmaster Shovelphlange - In Combat - Cast 'Sunder Armor'");

-- 18.
-- Tainted Ooze SAI
SET @ENTRY := 7092;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,60000,75,3335,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tainted Ooze - In Combat - Add Aura 'Dark Sludge'");

-- 19.
-- Ironbeak Screecher SAI
SET @ENTRY := 7098;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,12000,11,3589,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ironbeak Screecher - In Combat - Cast 'Deafening Screech'");

-- 20.
-- Ironbeak Hunter SAI
SET @ENTRY := 7099;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,13738,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ironbeak Hunter - In Combat - Cast 'Rend'");

-- 21.
-- Warpwood Moss Flayer SAI
SET @ENTRY := 7100;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,11922,32,0,0,0,0,2,0,0,0,0,0,0,0,"Warpwood Moss Flayer - In Combat - Cast 'Entangling Roots'");

-- 22.
-- Dessecus SAI
SET @ENTRY := 7104;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,16033,64,0,0,0,0,2,0,0,0,0,0,0,0,"Dessecus - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,0,0,100,0,8000,10000,20000,25000,11,6535,1,0,0,0,0,2,0,0,0,0,0,0,0,"Dessecus - In Combat - Cast 'Lightning Cloud'");

-- 23.
-- Jadefire Satyr SAI
SET @ENTRY := 7105;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Satyr - Between 0-50% Health - Cast 'Jadefire' (No Repeat)");

-- 24.
-- Jadefire Rogue SAI
SET @ENTRY := 7106;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Rogue - Between 0-50% Health - Cast 'Jadefire' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,10000,15000,11,13579,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Rogue - In Combat - Cast 'Gouge'");

-- 25.
-- Jadefire Trickster SAI
SET @ENTRY := 7107;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8552,32,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Trickster - On Aggro - Cast 'Curse of Weakness'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Trickster - Between 0-50% Health - Cast 'Jadefire' (No Repeat)");

-- 26.
-- Jadefire Betrayer SAI
SET @ENTRY := 7108;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Betrayer - Between 0-50% Health - Cast 'Jadefire' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,8000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Betrayer - In Combat - Cast 'Cleave'"),
(@ENTRY,0,2,0,0,0,100,0,4000,8000,15000,18000,11,13738,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Betrayer - In Combat - Cast 'Rend'");

-- 27.
-- Jadefire Felsworn SAI
SET @ENTRY := 7109;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Felsworn - Between 0-50% Health - Cast 'Jadefire' (No Repeat)"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,11443,32,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Felsworn - On Aggro - Cast 'Cripple'"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Felsworn - In Combat - Cast 'Shadow Bolt'");

-- 28.
-- Jadefire Shadowstalker SAI
SET @ENTRY := 7110;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Shadowstalker - Between 0-50% Health - Cast 'Jadefire' (No Repeat)"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,14897,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Shadowstalker - On Aggro - Cast 'Slowing Poison'"),
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,11,11013,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Shadowstalker - On Reset - Cast 'Sneak'");

-- 29.
-- Jadefire Hellcaller SAI
SET @ENTRY := 7111;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13578,1,0,0,0,0,1,0,0,0,0,0,0,0,"Jadefire Hellcaller - Between 0-50% Health - Cast 'Jadefire' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Hellcaller - In Combat - Cast 'Fireball'"),
(@ENTRY,0,2,0,0,0,100,0,8000,12000,12000,18000,11,11990,1,0,0,0,0,2,0,0,0,0,0,0,0,"Jadefire Hellcaller - In Combat - Cast 'Rain of Fire'");

-- 30.
-- Jaedenar Cultist SAI
SET @ENTRY := 7112;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11980,32,0,0,0,0,2,0,0,0,0,0,0,0,"Jaedenar Cultist - On Aggro - Cast 'Curse of Weakness'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,"Jaedenar Cultist - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,0,0,100,0,6000,8000,15000,30000,11,11639,1,0,0,0,0,2,0,0,0,0,0,0,0,"Jaedenar Cultist - In Combat - Cast 'Shadow Word: Pain'");

-- 31.
-- Jaedenar Guardian SAI
SET @ENTRY := 7113;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,3639,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jaedenar Guardian - Between 0-50% Health - Cast 'Improved Blocking' (No Repeat)");

-- 32.
-- Jaedenar Adept SAI
SET @ENTRY := 7115;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,"Jaedenar Adept - In Combat - Cast 'Fireball'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,15000,20000,11,20832,1,0,0,0,0,2,0,0,0,0,0,0,0,"Jaedenar Adept - In Combat - Cast 'Fire Blast'");

-- 33.
-- Toxic Horror SAI
SET @ENTRY := 7132;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7947,32,0,0,0,0,2,0,0,0,0,0,0,0,"Toxic Horror - On Aggro - Cast 'Localized Toxin'");

-- 34.
-- Infernal Sentry SAI
SET @ENTRY := 7136;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,2602,0,0,0,0,0,1,0,0,0,0,0,0,0,"Infernal Sentry - On Aggro - Cast 'Fire Shield IV'");

-- 35.
-- Irontree Stomper SAI
SET @ENTRY := 7139;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,45,0,0,0,0,0,2,0,0,0,0,0,0,0,"Irontree Stomper - Between 0-50% Health - Cast 'War Stomp' (No Repeat)");

-- 36.
-- Withered Protector SAI
SET @ENTRY := 7149;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,8000,12000,11,5337,32,0,0,0,0,2,0,0,0,0,0,0,0,"Withered Protector - In Combat - Cast 'Wither Strike'");

-- 37.
-- Gnarlpine Mystic SAI
SET @ENTRY := 7235;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,5177,64,0,0,0,0,2,0,0,0,0,0,0,0,"Gnarlpine Mystic - In Combat - Cast 'Wrath'");

-- 38.
-- Theka the Martyr SAI
SET @ENTRY := 7272;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,180000,180000,11,8600,0,0,0,0,0,2,0,0,0,0,0,0,0,"Theka the Martyr - In Combat - Cast 'Fevered Plague'");

-- 39.
-- Sandfury Executioner SAI
SET @ENTRY := 7274;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sandfury Executioner - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,8000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sandfury Executioner - In Combat - Cast 'Cleave'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sandfury Executioner - Between 0-50% Health - Cast 'Execute' (No Repeat)");

-- 40.
-- Galak Flame Guard SAI
SET @ENTRY := 7404;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Galak Flame Guard - On Aggro - Cast 'Demoralizing Shout'");

-- 41.
-- Frostsaber Pride Watcher SAI
SET @ENTRY := 7434;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frostsaber Pride Watcher - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 42.
-- Cobalt Wyrmkin SAI
SET @ENTRY := 7435;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Wyrmkin - Between 0-50% Health - Cast 'Hamstring' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,8000,11,15580,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Wyrmkin - In Combat - Cast 'Strike'");

-- 43.
-- Cobalt Scalebane SAI
SET @ENTRY := 7436;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,25000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Scalebane - In Combat - Cast 'Disarm'"),
(@ENTRY,0,1,0,13,0,100,0,2000,12000,0,0,11,15655,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Scalebane - On Victim Casting - Cast 'Shield Slam'");

-- 44.
-- Cobalt Mageweaver SAI
SET @ENTRY := 7437;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,15784,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cobalt Mageweaver - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,15043,64,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Mageweaver - In Combat - Cast 'Frostbolt'");

-- 45.
-- Fledgling Chillwind SAI
SET @ENTRY := 7447;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,16552,32,0,0,0,0,2,0,0,0,0,0,0,0,"Fledgling Chillwind - On Aggro - Cast 'Venom Spit'");

-- 46.
-- Chillwind Ravager SAI
SET @ENTRY := 7449;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,28547,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chillwind Ravager - In Combat - Cast 'Chill'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,"Chillwind Ravager - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 47.
-- Rogue Ice Thistle SAI
SET @ENTRY := 7457;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,15878,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rogue Ice Thistle - Between 0-50% Health - Cast 'Ice Blast' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,8000,12000,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rogue Ice Thistle - In Combat - Cast 'Tendon Rip'");

-- 48.
-- Hederine Initiate SAI
SET @ENTRY := 7461;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,37668,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hederine Initiate - On Aggro - Cast 'Immolate'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,24668,64,0,0,0,0,2,0,0,0,0,0,0,0,"Hederine Initiate - In Combat - Cast 'Shadow Bolt'");

-- 49.
-- Hederine Slayer SAI
SET @ENTRY := 7463;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,12000,18000,11,17547,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hederine Slayer - In Combat - Cast 'Mortal Strike'");

-- 50.
-- Bloodmage Drazial SAI
SET @ENTRY := 7505;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,10149,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodmage Drazial - In Combat - Cast 'Fireball'");

-- 1.
-- Bloodmage Lynnore SAI
SET @ENTRY := 7506;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,10149,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodmage Lynnore - In Combat - Cast 'Fireball'");

-- 2.
-- World Leatherworking Dragonscale Trainer SAI
SET @ENTRY := 7525;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,12000,11,8046,0,0,0,0,0,2,0,0,0,0,0,0,0,"World Leatherworking Dragonscale Trainer - In Combat - Cast 'Earth Shock'");

-- 3.
-- Hydromancer Velratha SAI
SET @ENTRY := 7795;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,3000,4000,11,12739,64,0,0,0,0,2,0,0,0,0,0,0,0,"Hydromancer Velratha - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12491,1,0,0,0,0,1,0,0,0,0,0,0,0,"Hydromancer Velratha - Between 0-50% Health - Cast 'Healing Wave' (No Repeat)");

-- 4.
-- Ruuzlu SAI
SET @ENTRY := 7797;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ruuzlu - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ruuzlu - In Combat - Cast 'Cleave'");

-- 5.
-- Master Mechanic Castpipe SAI
SET @ENTRY := 7950;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15607,0,0,0,0,0,2,0,0,0,0,0,0,0,"Master Mechanic Castpipe - On Aggro - Cast 'Throw'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,5000,9000,11,7978,0,0,0,0,0,2,0,0,0,0,0,0,0,"Master Mechanic Castpipe - In Combat - Cast 'Throw Dynamite'");

-- 6.
-- Qiaga the Keeper SAI
SET @ENTRY := 7996;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10893,0,0,0,0,0,2,0,0,0,0,0,0,0,"Qiaga the Keeper - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,11660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Qiaga the Keeper - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,10928,1,0,0,0,0,1,0,0,0,0,0,0,0,"Qiaga the Keeper - Between 0-50% Health - Cast 'Renew' (No Repeat)");

-- 7.
-- Tick SAI
SET @ENTRY := 8198;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,12000,15000,11,20717,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tick - In Combat - Cast 'Sand Breath'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,21073,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tick - On Aggro - Cast 'Arcane Explosion'");

-- 8.
-- Warleader Krazzilak SAI
SET @ENTRY := 8199;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,17230,32,0,0,0,0,2,0,0,0,0,0,0,0,"Warleader Krazzilak - On Aggro - Cast 'Infected Wound'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,35000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warleader Krazzilak - In Combat - Cast 'Disarm'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,9080,1,0,0,0,0,2,0,0,0,0,0,0,0,"Warleader Krazzilak - Between 0-50% Health - Cast 'Hamstring' (No Repeat)"),
(@ENTRY,0,3,0,2,0,100,1,0,20,0,0,11,18103,1,0,0,0,0,2,0,0,0,0,0,0,0,"Warleader Krazzilak - Between 0-20% Health - Cast 'Backhand' (No Repeat)");

-- 9.
-- Kregg Keelhaul SAI
SET @ENTRY := 8203;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,8000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kregg Keelhaul - In Combat - Cast 'Strike'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,15000,20000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kregg Keelhaul - In Combat - Cast 'Cleave'");

-- 10.
-- Haarka the Ravenous SAI
SET @ENTRY := 8205;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,21081,0,0,0,0,0,2,0,0,0,0,0,0,0,"Haarka the Ravenous - In Combat - Cast 'Sunder Armor'");

-- 11.
-- Greater Firebird SAI
SET @ENTRY := 8207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,16079,0,0,0,0,0,2,0,0,0,0,0,0,0,"Greater Firebird - In Combat - Cast 'Fire Nova'");

-- 12.
-- Murderous Blisterpaw SAI
SET @ENTRY := 8208;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,16000,19000,11,36991,0,0,0,0,0,2,0,0,0,0,0,0,0,"Murderous Blisterpaw - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,7938,1,0,0,0,0,2,0,0,0,0,0,0,0,"Murderous Blisterpaw - Between 0-50% Health - Cast 'Fatal Bite' (No Repeat)");

-- 13.
-- Razortalon SAI
SET @ENTRY := 8210;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razortalon - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,5000,6000,11,13584,0,0,0,0,0,2,0,0,0,0,0,0,0,"Razortalon - In Combat - Cast 'Strike'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,3604,1,0,0,0,0,2,0,0,0,0,0,0,0,"Razortalon - Between 0-50% Health - Cast 'Tendon Rip' (No Repeat)");

-- 14.
-- The Reak SAI
SET @ENTRY := 8212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,33000,11,7279,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Reak - In Combat - Cast 'Black Sludge'");

-- 15.
-- Retherokk the Berserker SAI
SET @ENTRY := 8216;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Retherokk the Berserker - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 16.
-- Mith'rethis the Enchanter SAI
SET @ENTRY := 8217;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15654,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mith'rethis the Enchanter - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11436,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mith'rethis the Enchanter - Between 0-50% Health - Cast 'Slow' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,3443,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mith'rethis the Enchanter - Between 0-30% Health - Cast 'Enchanted Quickness' (No Repeat)");

-- 17.
-- Smoldar SAI
SET @ENTRY := 8278;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,5213,0,0,0,0,0,2,0,0,0,0,0,0,0,"Smoldar - In Combat - Cast 'Molten Metal'");

-- 18.
-- Shleipnarr SAI
SET @ENTRY := 8280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,7399,1,0,0,0,0,2,0,0,0,0,0,0,0,"Shleipnarr - Between 0-50% Health - Cast 'Terrify' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,13321,64,0,0,0,0,2,0,0,0,0,0,0,0,"Shleipnarr - In Combat - Cast 'Mana Burn'");

-- 19.
-- Highlord Mastrogonde SAI
SET @ENTRY := 8282;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,"Highlord Mastrogonde - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11974,1,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Mastrogonde - Between 0-50% Health - Cast 'Power Word: Shield' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Highlord Mastrogonde - In Combat - Cast 'Shadow Bolt'");

-- 20.
-- Slave Master Blackheart SAI
SET @ENTRY := 8283;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Slave Master Blackheart - On Aggro - Cast 'Net'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Slave Master Blackheart - In Combat - Cast 'Shoot'");

-- 21.
-- Nightmare Whelp SAI
SET @ENTRY := 8319;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,8000,11,15653,0,0,0,0,0,2,0,0,0,0,0,0,0,"Nightmare Whelp - In Combat - Cast 'Acid Spit'");

-- 22.
-- Archmage Xylem SAI
SET @ENTRY := 8379;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,10179,64,0,0,0,0,2,0,0,0,0,0,0,0,"Archmage Xylem - In Combat - Cast 'Frostbolt'");

-- 23.
-- Warlord Krellian SAI
SET @ENTRY := 8408;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10968,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krellian - On Aggro - Cast 'Demoralizing Roar'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,5000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warlord Krellian - In Combat - Cast 'Strike'");

-- 24.
-- Caravan Master Tset SAI
SET @ENTRY := 8409;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,2000,10000,11000,11,31256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Caravan Master Tset - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,21369,64,0,0,0,0,2,0,0,0,0,0,0,0,"Caravan Master Tset - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,11831,1,0,0,0,0,1,0,0,0,0,0,0,0,"Caravan Master Tset - Between 0-50% Health - Cast 'Frost Nova' (No Repeat)");

-- 25.
-- Trade Master Kovic SAI
SET @ENTRY := 8444;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Trade Master Kovic - In Combat - Cast 'Fireball'");

-- 26.
-- Rynthariel the Keymaster SAI
SET @ENTRY := 8518;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,25000,28000,11,7992,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rynthariel the Keymaster - In Combat - Cast 'Slowing Poison'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rynthariel the Keymaster - On Aggro - Cast 'Throw'");

-- 27.
-- Morta'gya the Keeper SAI
SET @ENTRY := 8636;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Morta'gya the Keeper - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,11640,1,0,0,0,0,1,0,0,0,0,0,0,0,"Morta'gya the Keeper - Between 0-50% Health - Cast 'Renew' (No Repeat)"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,11639,32,0,0,0,0,2,0,0,0,0,0,0,0,"Morta'gya the Keeper - On Aggro - Cast 'Shadow Word: Pain'");

-- 28.
-- The Evalcharr SAI
SET @ENTRY := 8660;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,15797,64,0,0,0,0,2,0,0,0,0,0,0,0,"The Evalcharr - In Combat - Cast 'Lightning Breath'");

-- 29.
-- Timberweb Recluse SAI
SET @ENTRY := 8762;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Timberweb Recluse - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Timberweb Recluse - In Combat - Cast 'Poison'");

-- 30.
-- Mistwing Rogue SAI
SET @ENTRY := 8763;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mistwing Rogue - In Combat - Cast 'Lightning Bolt'");

-- 31.
-- Mistwing Ravager SAI
SET @ENTRY := 8764;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8806,32,0,0,0,0,2,0,0,0,0,0,0,0,"Mistwing Ravager - On Aggro - Cast 'Poisoned Shot'");

-- 32.
-- Wrath Hammer Construct SAI
SET @ENTRY := 8907;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,15575,64,0,0,0,0,2,0,0,0,0,0,0,0,"Wrath Hammer Construct - In Combat - Cast 'Flame Cannon'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,10966,1,0,0,0,0,2,0,0,0,0,0,0,0,"Wrath Hammer Construct - Between 0-50% Health - Cast 'Uppercut' (No Repeat)");

-- 33.
-- Bloodhound Mastiff SAI
SET @ENTRY := 8922;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,12000,11,7140,32,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodhound Mastiff - In Combat - Cast 'Expose Weakness'");

-- 34.
-- Felpaw Wolf SAI
SET @ENTRY := 8959;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,32000,11,3427,32,0,0,0,0,2,0,0,0,0,0,0,0,"Felpaw Wolf - In Combat - Cast 'Infected Wound'");

-- 35.
-- Felpaw Scavenger SAI
SET @ENTRY := 8960;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,60000,65000,11,17230,32,0,0,0,0,2,0,0,0,0,0,0,0,"Felpaw Scavenger - In Combat - Cast 'Infected Wound'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,"Felpaw Scavenger - Between 0-50% Health - Cast 'Tendon Rip' (No Repeat)");

-- 36.
-- Felpaw Wolf SAI
SET @ENTRY := 8961;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,32000,11,3427,32,0,0,0,0,2,0,0,0,0,0,0,0,"Felpaw Wolf - In Combat - Cast 'Infected Wound'");

-- 37.
-- Scarshield Sentry SAI
SET @ENTRY := 9044;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,14897,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarshield Sentry - On Aggro - Cast 'Slowing Poison'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarshield Sentry - In Combat - Cast 'Shoot'"),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,14443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarshield Sentry - In Combat - Cast 'Multi-Shot'");

-- 38.
-- Shadowmage Vivian Lagrave SAI
SET @ENTRY := 9078;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,10149,64,0,0,0,0,2,0,0,0,0,0,0,0,"Shadowmage Vivian Lagrave - In Combat - Cast 'Fireball'");

-- 39.
-- Hierophant Theodora Mulvadania SAI
SET @ENTRY := 9079;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,15000,18000,11,24976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hierophant Theodora Mulvadania - In Combat - Cast 'Insect Swarm'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,9835,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hierophant Theodora Mulvadania - On Aggro - Cast 'Moonfire'");

-- 40.
-- Thunderheart SAI
SET @ENTRY := 9084;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,12867,32,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderheart - In Combat - Cast 'Deep Wounds'"),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,30000,35000,11,21949,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderheart - In Combat - Cast 'Rend'");

-- 41.
-- Incendosaur SAI
SET @ENTRY := 9318;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,9275,32,0,0,0,0,2,0,0,0,0,0,0,0,"Incendosaur - On Aggro - Cast 'Immolate'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,4000,5000,11,11985,64,0,0,0,0,2,0,0,0,0,0,0,0,"Incendosaur - In Combat - Cast 'Fireball'");

-- 42.
-- Houndmaster Grebmar SAI
SET @ENTRY := 9319;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Houndmaster Grebmar - On Aggro - Cast 'Demoralizing Shout'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,21049,0,0,0,0,0,1,0,0,0,0,0,0,0,"Houndmaster Grebmar - Between 0-30% Health - Cast 'Bloodlust' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,6000,8000,12000,15000,11,15615,0,0,0,0,0,2,0,0,0,0,0,0,0,"Houndmaster Grebmar - In Combat - Cast 'Pummel'");

-- 43.
-- Xavathras SAI
SET @ENTRY := 9454;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Xavathras - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Xavathras - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 44.
-- Chieftain Bloodmaw SAI
SET @ENTRY := 9462;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13583,32,0,0,0,0,2,0,0,0,0,0,0,0,"Chieftain Bloodmaw - On Aggro - Cast 'Curse of the Deadwood'");

-- 45.
-- Overlord Ror SAI
SET @ENTRY := 9464;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,36629,0,0,0,0,0,2,0,0,0,0,0,0,0,"Overlord Ror - Between 0-50% Health - Cast 'Terrifying Roar' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,34298,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Ror - In Combat - Cast 'Maul'");

-- 46.
-- Shadow Lord Fel'dan SAI
SET @ENTRY := 9517;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,"Shadow Lord Fel'dan - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,"Shadow Lord Fel'dan - On Aggro - Cast 'Shadow Shock'");

-- 47.
-- Rakaiah SAI
SET @ENTRY := 9518;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,17227,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rakaiah - On Aggro - Cast 'Curse of Weakness'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,8000,11,15968,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rakaiah - In Combat - Cast 'Lash of Pain'");

-- 48.
-- Shill Dinger SAI
SET @ENTRY := 9678;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11980,32,0,0,0,0,2,0,0,0,0,0,0,0,"Shill Dinger - On Aggro - Cast 'Curse of Weakness'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,4000,5000,11,15472,64,0,0,0,0,2,0,0,0,0,0,0,0,"Shill Dinger - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,22417,1,0,0,0,0,1,0,0,0,0,0,0,0,"Shill Dinger - Between 0-50% Health - Cast 'Shadow Shield' (No Repeat)");

-- 49.
-- Moora SAI
SET @ENTRY := 9861;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,"Moora - On Aggro - Cast 'Shadow Word: Pain'");

-- 50.
-- Prince Xavalis SAI
SET @ENTRY := 9877;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,"Prince Xavalis - On Aggro - Cast 'Immolate'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,"Prince Xavalis - Between 0-50% Health - Cast 'Jadefire' (No Repeat)");

-- 1.
-- Entropic Beast SAI
SET @ENTRY := 9878;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15661,0,0,0,0,0,2,0,0,0,0,0,0,0,"Entropic Beast - On Aggro - Cast 'Immolate'");

-- 2.
-- Entropic Horror SAI
SET @ENTRY := 9879;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,2602,0,0,0,0,0,1,0,0,0,0,0,0,0,"Entropic Horror - On Aggro - Cast 'Fire Shield IV'");

-- 3.
-- Shadowforge Flame Keeper SAI
SET @ENTRY := 9956;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Shadowforge Flame Keeper - In Combat - Cast 'Shoot'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowforge Flame Keeper - On Aggro - Cast 'Battle Shout'"),
(@ENTRY,0,2,0,0,0,100,0,4000,6000,8000,10000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Shadowforge Flame Keeper - In Combat - Cast 'Strike'"),
(@ENTRY,0,3,0,2,0,100,1,0,50,0,0,11,9080,1,0,0,0,0,2,0,0,0,0,0,0,0,"Shadowforge Flame Keeper - Between 0-50% Health - Cast 'Hamstring' (No Repeat)");

-- 4.
-- Greth SAI
SET @ENTRY := 10058;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,8629,0,0,0,0,0,2,0,0,0,0,0,0,0,"Greth - In Combat - Cast 'Gouge'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,3408,0,0,0,0,0,2,0,0,0,0,0,0,0,"Greth - On Aggro - Cast 'Crippling Poison'");

-- 5.
-- Rak'shiri SAI
SET @ENTRY := 10200;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,15000,18000,11,7399,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rak'shiri - In Combat - Cast 'Terrify'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,15716,1,0,0,0,0,1,0,0,0,0,0,0,0,"Rak'shiri - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 6.
-- Murkdeep SAI
SET @ENTRY := 10323;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Murkdeep - On Aggro - Cast 'Net'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,4000,5000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,"Murkdeep - In Combat - Cast 'Sunder Armor'");

-- 7.
-- Fetid Zombie SAI
SET @ENTRY := 10580;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,8713,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fetid Zombie - On Reset - Cast 'Overwhelming Musk'");

-- 8.
-- Scarlet Medic SAI
SET @ENTRY := 10605;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,17175,32,0,0,0,0,26,20,0,0,0,0,0,0,"Scarlet Medic - Out of Combat - Cast 'Resist Arcane'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,17137,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Medic - Between 0-50% Health - Cast 'Flash Heal' (No Repeat)"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Medic - On Aggro - Cast 'Renew'");

-- 9.
-- Scarlet Priest SAI
SET @ENTRY := 10608;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8362,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Priest - On Aggro - Cast 'Renew'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,15586,1,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Priest - Between 0-50% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,3000,4000,11,15498,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Priest - In Combat - Cast 'Holy Smite'"),
(@ENTRY,0,3,0,1,0,100,0,1000,1000,60000,60000,11,13864,32,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Priest - Out of Combat - Cast 'Power Word: Fortitude'");

-- 10.
-- Galak Messenger SAI
SET @ENTRY := 10617;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,6190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Galak Messenger - On Aggro - Cast 'Demoralizing Shout'");

-- 11.
-- Cobalt Whelp SAI
SET @ENTRY := 10659;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Whelp - On Aggro - Cast 'Frost Shock'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,18000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Whelp - In Combat - Cast 'Rend'");

-- 12.
-- Cobalt Broodling SAI
SET @ENTRY := 10660;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Broodling - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,6000,8000,11,29881,1,0,0,0,0,2,0,0,0,0,0,0,0,"Cobalt Broodling - In Combat - Cast 'Drain Mana'");

-- 13.
-- Spell Eater SAI
SET @ENTRY := 10661;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,16340,0,0,0,0,0,2,0,0,0,0,0,0,0,"Spell Eater - Between 0-50% Health - Cast 'Frost Breath' (No Repeat)");

-- 14.
-- Scalding Elemental SAI
SET @ENTRY := 10756;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,16000,11,17276,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scalding Elemental - In Combat - Cast 'Scald'");

-- 15.
-- Boiling Elemental SAI
SET @ENTRY := 10757;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11983,0,0,0,0,0,2,0,0,0,0,0,0,0,"Boiling Elemental - On Aggro - Cast 'Steam Jet'");

-- 16.
-- Grimtotem Bandit SAI
SET @ENTRY := 10758;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,13534,32,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Bandit - In Combat - Cast 'Disarm'"),
(@ENTRY,0,1,0,13,0,100,0,2000,25000,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Bandit - On Victim Casting - Cast 'Kick'");

-- 17.
-- Grimtotem Stomper SAI
SET @ENTRY := 10759;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8046,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Stomper - On Aggro - Cast 'Earth Shock'");

-- 18.
-- Grimtotem Geomancer SAI
SET @ENTRY := 10760;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,8400,64,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Geomancer - In Combat - Cast 'Fireball'"),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,14000,1600,11,2121,1,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Geomancer - In Combat - Cast 'Flamestrike'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,30035,1,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Geomancer - Between 0-50% Health - Cast 'Mass Slow' (No Repeat)");

-- 19.
-- Grimtotem Reaver SAI
SET @ENTRY := 10761;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,17281,32,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Reaver - On Aggro - Cast 'Crusader Strike'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,15280,32,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Reaver - In Combat - Cast 'Cleave Armor'");

-- 20.
-- Hitah'ya the Keeper SAI
SET @ENTRY := 10802;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hitah'ya the Keeper - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Hitah'ya the Keeper - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,23895,1,0,0,0,0,1,0,0,0,0,0,0,0,"Hitah'ya the Keeper - Between 0-50% Health - Cast 'Renew' (No Repeat)");

-- 21.
-- Wandering Skeleton SAI
SET @ENTRY := 10816;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,11,17014,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wandering Skeleton - On Aggro - Cast 'Bone Shards'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,11,17650,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wandering Skeleton - On Aggro - Cast 'Altered Cauldron Toxin'");

-- 22.
-- Arnak Grimtotem SAI
SET @ENTRY := 10896;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,18075,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arnak Grimtotem - In Combat - Cast 'Rend'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,34014,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arnak Grimtotem - Between 0-50% Health - Cast 'Uppercut' (No Repeat)");

-- 23.
-- Weldon Barov SAI
SET @ENTRY := 11023;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,29584,0,0,0,0,0,1,0,0,0,0,0,0,0,"Weldon Barov - On Aggro - Cast 'Demoralizing Shout'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,5000,9000,11,19983,0,0,0,0,0,2,0,0,0,0,0,0,0,"Weldon Barov - In Combat - Cast 'Cleave'");

-- 24.
-- Northshire Peasant SAI
SET @ENTRY := 11260;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8260,0,0,0,0,0,1,0,0,0,0,0,0,0,"Northshire Peasant - On Aggro - Cast 'Rushing Charge'");

-- 25.
-- Azshara Sentinel SAI
SET @ENTRY := 11276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,8260,0,0,0,0,0,1,0,0,0,0,0,0,0,"Azshara Sentinel - On Aggro - Cast 'Rushing Charge'");

-- 26.
-- Mushgog SAI
SET @ENTRY := 11447;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,21749,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mushgog - On Aggro - Cast 'Thorn Volley'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,10000,15000,11,24648,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mushgog - In Combat - Cast 'Entangling Roots'");

-- 27.
-- The Razza SAI
SET @ENTRY := 11497;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,16033,64,0,0,0,0,2,0,0,0,0,0,0,0,"The Razza - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,22937,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Razza - On Aggro - Cast 'Poison Bolt'");

-- 28.
-- Skarr the Unbreakable SAI
SET @ENTRY := 11498;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,9000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Skarr the Unbreakable - In Combat - Cast 'Cleave'"),
(@ENTRY,0,1,0,0,0,100,0,6000,9000,15000,20000,11,11428,1,0,0,0,0,2,0,0,0,0,0,0,0,"Skarr the Unbreakable - In Combat - Cast 'Knockdown'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,15708,1,0,0,0,0,2,0,0,0,0,0,0,0,"Skarr the Unbreakable - Between 0-50% Health - Cast 'Mortal Strike' (No Repeat)");

-- 29.
-- Cavalier Durgen SAI
SET @ENTRY := 11611;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13008,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cavalier Durgen - On Aggro - Cast 'Retribution Aura'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,5000,6000,11,13953,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cavalier Durgen - In Combat - Cast 'Holy Strike'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,13005,1,0,0,0,0,1,0,0,0,0,0,0,0,"Cavalier Durgen - Between 0-50% Health - Cast 'Hammer of Justice' (No Repeat)");

-- 30.
-- Bloodshot SAI
SET @ENTRY := 11614;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,13692,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodshot - In Combat - Cast 'Dire Growl'");

-- 31.
-- Spectral Marauder SAI
SET @ENTRY := 11620;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,12000,11,5337,32,0,0,0,0,2,0,0,0,0,0,0,0,"Spectral Marauder - In Combat - Cast 'Wither Strike'");

-- 32.
-- Hive'Ashi Defender SAI
SET @ENTRY := 11722;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,15000,30000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Ashi Defender - In Combat - Cast 'Disarm'");

-- 33.
-- Hive'Zora Wasp SAI
SET @ENTRY := 11727;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,19448,32,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Zora Wasp - On Aggro - Cast 'Poison'");

-- 34.
-- Hive'Zora Reaver SAI
SET @ENTRY := 11728;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,12000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Zora Reaver - In Combat - Cast 'Cleave'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,16790,1,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Zora Reaver - Between 0-50% Health - Cast 'Knockdown' (No Repeat)");

-- 35.
-- Hive'Zora Hive Sister SAI
SET @ENTRY := 11729;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,7951,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Zora Hive Sister - In Combat - Cast 'Toxic Spit'");

-- 36.
-- Hive'Regal Ambusher SAI
SET @ENTRY := 11730;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Regal Ambusher - In Combat - Cast 'Poison'");

-- 37.
-- Hive'Regal Spitfire SAI
SET @ENTRY := 11732;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,16000,11,21047,32,0,0,0,0,2,0,0,0,0,0,0,0,"Hive'Regal Spitfire - In Combat - Cast 'Corrosive Acid Spit'");

-- 38.
-- Stonelash Scorpid SAI
SET @ENTRY := 11735;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,5416,32,0,0,0,0,2,0,0,0,0,0,0,0,"Stonelash Scorpid - On Aggro - Cast 'Venom Sting'");

-- 39.
-- Stonelash Pincer SAI
SET @ENTRY := 11736;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,5416,32,0,0,0,0,2,0,0,0,0,0,0,0,"Stonelash Pincer - On Aggro - Cast 'Venom Sting'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,9000,12000,11,3604,32,0,0,0,0,2,0,0,0,0,0,0,0,"Stonelash Pincer - In Combat - Cast 'Tendon Rip'");

-- 40.
-- Stonelash Flayer SAI
SET @ENTRY := 11737;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,5416,32,0,0,0,0,2,0,0,0,0,0,0,0,"Stonelash Flayer - On Aggro - Cast 'Venom Sting'");

-- 41.
-- Sand Skitterer SAI
SET @ENTRY := 11738;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Sand Skitterer - In Combat - Cast 'Poison'");

-- 42.
-- Rock Stalker SAI
SET @ENTRY := 11739;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rock Stalker - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,35000,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rock Stalker - In Combat - Cast 'Poison'");

-- 43.
-- Dredge Striker SAI
SET @ENTRY := 11740;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,22911,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dredge Striker - On Aggro - Cast 'Charge'");

-- 44.
-- Dredge Crusher SAI
SET @ENTRY := 11741;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,20000,11,6607,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dredge Crusher - In Combat - Cast 'Lash'");

-- 45.
-- Dust Stormer SAI
SET @ENTRY := 11744;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,41151,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dust Stormer - On Aggro - Cast 'Lightning Shield'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,20000,11,19513,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dust Stormer - In Combat - Cast 'Lightning Cloud'");

-- 46.
-- Cyclone Warrior SAI
SET @ENTRY := 11745;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,25189,32,0,0,0,0,2,0,0,0,0,0,0,0,"Cyclone Warrior - Between 0-50% Health - Cast 'Enveloping Winds' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,23104,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cyclone Warrior - In Combat - Cast 'Shock'");

-- 47.
-- Rock Borer SAI
SET @ENTRY := 11787;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,14120,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rock Borer - In Combat - Cast 'Tunneler Acid'");

-- 48.
-- Twilight Keeper Exeter SAI
SET @ENTRY := 11803;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,20000,11,22427,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Keeper Exeter - In Combat - Cast 'Concussion Blow'");

-- 49.
-- Twilight Keeper Havunth SAI
SET @ENTRY := 11804;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,17366,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Keeper Havunth - Between 0-50% Health - Cast 'Fire Nova' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,5000,6000,11,13339,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Keeper Havunth - In Combat - Cast 'Fire Blast'");

-- 50.
-- Spectral Attendant SAI
SET @ENTRY := 11873;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11443,32,0,0,0,0,2,0,0,0,0,0,0,0,"Spectral Attendant - On Aggro - Cast 'Cripple'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,11981,64,0,0,0,0,2,0,0,0,0,0,0,0,"Spectral Attendant - In Combat - Cast 'Mana Burn'");

-- 1.
-- Twilight Avenger SAI
SET @ENTRY := 11880;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Avenger - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 2.
-- Twilight Master SAI
SET @ENTRY := 11883;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Master - On Aggro - Cast 'Frostbolt'"),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,3000,4000,11,12058,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Master - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,12674,1,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Master - on health 50% - cast frostnova");

-- 3.
-- Besseleth SAI
SET @ENTRY := 11921;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Besseleth - On Aggro - Cast 'Web'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,30000,45000,11,5416,32,0,0,0,0,2,0,0,0,0,0,0,0,"Besseleth - In Combat - Cast 'Venom Sting'");

-- 4.
-- Cavern Lurker SAI
SET @ENTRY := 12223;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,16000,30000,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cavern Lurker - In Combat - Cast 'Knockdown'");

-- 5.
-- Large Vile Slime SAI
SET @ENTRY := 12387;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,25055,64,0,0,0,0,2,0,0,0,0,0,0,0,"Large Vile Slime - In Combat - Cast 'Arcane Bolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,33959,1,0,0,0,0,1,0,0,0,0,0,0,0,"Large Vile Slime - Between 0-50% Health - Cast 'Arcane Explosion' (No Repeat)");

-- 6.
-- Flint Shadowmore SAI
SET @ENTRY := 12425;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,38863,0,0,0,0,0,2,0,0,0,0,0,0,0,"Flint Shadowmore - In Combat - Cast 'Gouge'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,30470,0,0,0,0,0,1,0,0,0,0,0,0,0,"Flint Shadowmore - On Aggro - Cast 'Slice and Dice'");

-- 7.
-- Krethis Shadowspinner SAI
SET @ENTRY := 12433;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,12040,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krethis Shadowspinner - Between 0-50% Health - Cast 'Shadow Shield' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,9000,12000,11,17439,0,0,0,0,0,2,0,0,0,0,0,0,0,"Krethis Shadowspinner - In Combat - Cast 'Shadow Shock'");

-- 8.
-- Archmage Gaiman SAI
SET @ENTRY := 12779;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,10149,64,0,0,0,0,2,0,0,0,0,0,0,0,"Archmage Gaiman - In Combat - Cast 'Fireball'");

-- 9.
-- Scalebeard SAI
SET @ENTRY := 13896;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,7938,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scalebeard - In Combat - Cast 'Fatal Bite'");

-- 10.
-- Mongress SAI
SET @ENTRY := 14344;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mongress - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 11.
-- Harb Foulmountain SAI
SET @ENTRY := 14426;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,45,0,0,0,0,0,2,0,0,0,0,0,0,0,"Harb Foulmountain - In Combat - Cast 'War Stomp'");

-- 12.
-- Gibblesnik SAI
SET @ENTRY := 14427;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,7405,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gibblesnik - In Combat - Cast 'Sunder Armor'");

-- 13.
-- Molt Thorn SAI
SET @ENTRY := 14448;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,25000,11,21748,0,0,0,0,0,2,0,0,0,0,0,0,0,"Molt Thorn - In Combat - Cast 'Thorn Volley'");

-- 14.
-- Watery Invader SAI
SET @ENTRY := 14458;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,19133,32,0,0,0,0,2,0,0,0,0,0,0,0,"Watery Invader - On Aggro - Cast 'Frost Shock'");

-- 15.
-- Zora SAI
SET @ENTRY := 14474;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,21067,32,0,0,0,0,2,0,0,0,0,0,0,0,"Zora - On Aggro - Cast 'Poison Bolt'");

-- 16.
-- Rex Ashil SAI
SET @ENTRY := 14475;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,12097,32,0,0,0,0,2,0,0,0,0,0,0,0,"Rex Ashil - In Combat - Cast 'Pierce Armor'");

-- 17.
-- Krellack SAI
SET @ENTRY := 14476;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,17170,32,0,0,0,0,2,0,0,0,0,0,0,0,"Krellack - On Aggro - Cast 'Fatal Sting'");

-- 18.
-- Huricanian SAI
SET @ENTRY := 14478;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,15659,64,0,0,0,0,2,0,0,0,0,0,0,0,"Huricanian - In Combat - Cast 'Chain Lightning'");

-- 19.
-- Twilight Lord Everun SAI
SET @ENTRY := 14479;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,19816,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Lord Everun - In Combat - Cast 'Fireball'");

-- 20.
-- Kurmokk SAI
SET @ENTRY := 14491;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kurmokk - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 21.
-- Verifonix SAI
SET @ENTRY := 14492;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,12097,32,0,0,0,0,2,0,0,0,0,0,0,0,"Verifonix - In Combat - Cast 'Pierce Armor'");

-- 22.
-- Ulathek SAI
SET @ENTRY := 14523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Ulathek - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,8699,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ulathek - Between 0-50% Health - Cast 'Unholy Frenzy' (No Repeat)");

-- 23.
-- Mystic Yayo'jin SAI
SET @ENTRY := 14739;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,10892,32,0,0,0,0,2,0,0,0,0,0,0,0,"Mystic Yayo'jin - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,6060,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mystic Yayo'jin - In Combat - Cast 'Smite'");

-- 24.
-- Captain Shatterskull SAI
SET @ENTRY := 14781;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,20000,11,14781,1,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Shatterskull - In Combat - Cast 'Mental Agility'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Captain Shatterskull - In Combat - Cast 'Cleave'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,5246,1,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Shatterskull - Between 0-50% Health - Cast 'Intimidating Shout' (No Repeat)");

-- 25.
-- Spider SAI
SET @ENTRY := 14881;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Spider - On Aggro - Cast 'Web'");

-- 26.
-- Twilight Keeper Mayna SAI
SET @ENTRY := 15200;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,15654,32,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Keeper Mayna - On Aggro - Cast 'Shadow Word: Pain'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,17165,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Keeper Mayna - In Combat - Cast 'Mind Flay'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,22884,1,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Keeper Mayna - Between 0-50% Health - Cast 'Psychic Scream' (No Repeat)");

-- 27.
-- Twilight Prophet SAI
SET @ENTRY := 15308;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,22884,1,0,0,0,0,1,0,0,0,0,0,0,0,"Twilight Prophet - Between 0-50% Health - Cast 'Psychic Scream' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,15305,64,0,0,0,0,2,0,0,0,0,0,0,0,"Twilight Prophet - In Combat - Cast 'Chain Lightning'");

-- 28.
-- Qiraji Scarab SAI
SET @ENTRY := 15316;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,6016,32,0,0,0,0,2,0,0,0,0,0,0,0,"Qiraji Scarab - In Combat - Cast 'Pierce Armor'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,26050,32,0,0,0,0,2,0,0,0,0,0,0,0,"Qiraji Scarab - On Aggro - Cast 'Acid Spit'");

-- 29.
-- Arcanist Nozzlespring SAI
SET @ENTRY := 15444;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,18105,64,0,0,0,0,2,0,0,0,0,0,0,0,"Arcanist Nozzlespring - In Combat - Cast 'Fireball'");

-- 30.
-- Canal Frenzy SAI
SET @ENTRY := 15505;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,20000,25000,11,12097,32,0,0,0,0,2,0,0,0,0,0,0,0,"Canal Frenzy - In Combat - Cast 'Pierce Armor'");

-- 31.
-- Orgrimmar Legion Axe Thrower SAI
SET @ENTRY := 15617;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,16075,0,0,0,0,0,2,0,0,0,0,0,0,0,"Orgrimmar Legion Axe Thrower - In Combat - Cast 'Throw Axe'");

-- 32.
-- Feral Dragonhawk Hatchling SAI
SET @ENTRY := 15649;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,12000,11,29117,32,0,0,0,0,2,0,0,0,0,0,0,0,"Feral Dragonhawk Hatchling - In Combat - Cast 'Feather Burst'");

-- 33.
-- Feral Dragonhawk Hatchling SAI
SET @ENTRY := 15650;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,12000,11,29117,32,0,0,0,0,2,0,0,0,0,0,0,0,"Feral Dragonhawk Hatchling - In Combat - Cast 'Feather Burst'");

-- 34.
-- Southsea Kidnapper SAI
SET @ENTRY := 15685;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,25000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Southsea Kidnapper - In Combat - Cast 'Disarm'");

-- 35.
-- Archmage Angela Dosantos SAI
SET @ENTRY := 16116;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,10149,64,0,0,0,0,2,0,0,0,0,0,0,0,"Archmage Angela Dosantos - In Combat - Cast 'Fireball'");

-- 36.
-- Starving Helboar SAI
SET @ENTRY := 16879;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,33908,0,0,0,0,0,1,0,0,0,0,0,0,0,"Starving Helboar - On Reset - Cast 'Burning Spikes'");

-- 37.
-- Forsaken Raider SAI
SET @ENTRY := 17108;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7992,32,0,0,0,0,2,0,0,0,0,0,0,0,"Forsaken Raider - On Aggro - Cast 'Slowing Poison'");

-- 38.
-- Hauteur Reborn SAI
SET @ENTRY := 17220;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,18000,21000,11,8050,32,0,0,0,0,2,0,0,0,0,0,0,0,"Hauteur Reborn - In Combat - Cast 'Flame Shock'");

-- 39.
-- Whisper SAI
SET @ENTRY := 17314;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,13704,0,0,0,0,0,1,0,0,0,0,0,0,0,"Whisper - Between 0-50% Health - Cast 'Psychic Scream' (No Repeat)");

-- 40.
-- Hauteur Reborn SAI
SET @ENTRY := 17320;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,18000,21000,11,32967,32,0,0,0,0,2,0,0,0,0,0,0,0,"Hauteur Reborn - In Combat - Cast 'Flame Shock'");

-- 41.
-- Bristlelimb Warrior SAI
SET @ENTRY := 17321;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Bristlelimb Warrior - In Combat - Cast 'Strike'");

-- 42.
-- Blacksilt Tidecaller SAI
SET @ENTRY := 17327;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,12550,0,0,0,0,0,0,0,0,0,0,0,0,0,"Blacksilt Tidecaller - On Aggro - Cast 'Lightning Shield'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blacksilt Tidecaller - Between 0-50% Health - Cast 'Rejuvenation' (No Repeat)");

-- 43.
-- Blacksilt Shorestriker SAI
SET @ENTRY := 17328;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,31290,0,0,0,0,0,2,0,0,0,0,0,0,0,"Blacksilt Shorestriker - On Aggro - Cast 'Net'");

-- 44.
-- Blacksilt Seer SAI
SET @ENTRY := 17330;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,2000,3000,11,9739,64,0,0,0,0,2,0,0,0,0,0,0,0,"Blacksilt Seer - In Combat - Cast 'Wrath'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,12160,1,0,0,0,0,1,0,0,0,0,0,0,0,"Blacksilt Seer - Between 0-50% Health - Cast 'Rejuvenation' (No Repeat)");

-- 45.
-- Wrathscale Shorestalker SAI
SET @ENTRY := 17331;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wrathscale Shorestalker - In Combat - Cast 'Strike'");

-- 46.
-- Wrathscale Screamer SAI
SET @ENTRY := 17333;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,30000,11,31295,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wrathscale Screamer - In Combat - Cast 'Scream'");

-- 47.
-- Wrathscale Marauder SAI
SET @ENTRY := 17334;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,2000,20000,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wrathscale Marauder - On Victim Casting - Cast 'Pummel'");

-- 48.
-- Wrathscale Sorceress SAI
SET @ENTRY := 17336;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Wrathscale Sorceress - In Combat - Cast 'Frostbolt'");

-- 49.
-- Thistle Lasher SAI
SET @ENTRY := 17343;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,9000,11,34644,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thistle Lasher - In Combat - Cast 'Lash'");

-- 50.
-- Mutated Tangler SAI
SET @ENTRY := 17346;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,31287,32,0,0,0,0,2,0,0,0,0,0,0,0,"Mutated Tangler - On Aggro - Cast 'Entangling Roots'");

-- 51.
-- Blue Flutterer SAI
SET @ENTRY := 17349;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,20000,11,36332,32,0,0,0,0,2,0,0,0,0,0,0,0,"Blue Flutterer - In Combat - Cast 'Rake'");

-- 52.
-- Corrupted Stomper SAI
SET @ENTRY := 17353;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,9000,12000,11,31277,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corrupted Stomper - In Combat - Cast 'Stomp'");

-- 53.
-- Magtor the Blind Watcher SAI
SET @ENTRY := 17444;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,9000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Magtor the Blind Watcher - In Combat - Cast 'Heroic Strike'");

-- 54.
-- Magtor the Blind Watcher SAI
SET @ENTRY := 17445;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,6000,9000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Magtor the Blind Watcher - In Combat - Cast 'Heroic Strike'");

-- 55.
-- Zevrax SAI
SET @ENTRY := 17494;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,11980,32,0,0,0,0,2,0,0,0,0,0,0,0,"Zevrax - On Aggro - Cast 'Curse of Weakness'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,24000,25000,11,18376,32,0,0,0,0,2,0,0,0,0,0,0,0,"Zevrax - In Combat - Cast 'Corruption'"),
(@ENTRY,0,2,0,0,0,100,0,4000,5000,3000,4000,11,20791,64,0,0,0,0,2,0,0,0,0,0,0,0,"Zevrax - In Combat - Cast 'Shadow Bolt'");

-- 56.
-- Myst Spinner SAI
SET @ENTRY := 17522;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Myst Spinner - On Aggro - Cast 'Web'");

-- 57.
-- Myst Leecher SAI
SET @ENTRY := 17523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,30000,35000,11,31288,32,0,0,0,0,2,0,0,0,0,0,0,0,"Myst Leecher - In Combat - Cast 'Leech Poison'");

-- 58.
-- Enraged Ravager SAI
SET @ENTRY := 17527;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enraged Ravager - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- 59.
-- Draenei Protector SAI
SET @ENTRY := 17531;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,5000,6000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Draenei Protector - In Combat - Cast 'Heroic Strike'"),
(@ENTRY,0,1,0,0,0,100,0,3000,6000,3000,6000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,"Draenei Protector - In Combat - Cast 'Sunder Armor'");

-- 60.
-- Veridian Broodling SAI
SET @ENTRY := 17589;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,15000,11,21067,32,0,0,0,0,2,0,0,0,0,0,0,0,"Veridian Broodling - In Combat - Cast 'Poison Bolt'");

-- 61.
-- Sunhawk Spy SAI
SET @ENTRY := 17604;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sunhawk Spy - On Aggro - Cast 'Demoralizing Shout'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,9080,1,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Spy - Between 0-50% Health - Cast 'Hamstring' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,6000,9000,11,31827,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Spy - In Combat - Cast 'Heroic Strike'");

-- 62.
-- Sunhawk Reclaimer SAI
SET @ENTRY := 17606;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sunhawk Reclaimer - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,19816,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Reclaimer - In Combat - Cast 'Fireball'");

-- 63.
-- Sunhawk Defender SAI
SET @ENTRY := 17607;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,7000,11000,11,31737,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sunhawk Defender - In Combat - Cast 'Whirlwind'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,9000,12000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Defender - Within 0-5 Range - Cast 'Cleave'"),
(@ENTRY,0,3,0,0,0,100,0,4000,6000,9000,14000,11,31734,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Defender - In Combat - Cast 'Mark of the Sunhawk'"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sunhawk Defender - Between 0-15% Health - Flee For Assist (No Repeat)");

-- 64.
-- Sunhawk Pyromancer SAI
SET @ENTRY := 17608;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Pyromancer - In Combat - Cast 'Fireball'");

-- 65.
-- Sunhawk Saboteur SAI
SET @ENTRY := 17609;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,14443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Saboteur - On Aggro - Cast 'Multi-Shot'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,2000,3000,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Saboteur - In Combat - Cast 'Shoot'");

-- 66.
-- Sunhawk Agent SAI
SET @ENTRY := 17610;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,67,0,100,0,6000,9000,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Agent - On Behind Target - Cast 'Backstab'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,6000,9000,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Agent - Within 0-5 Range - Cast 'Sinister Strike'"),
(@ENTRY,0,2,0,12,0,100,0,0,20,9000,13000,11,15691,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Agent - Target Between 0-20% Health - Cast 'Eviscerate'"),
(@ENTRY,0,3,0,0,0,100,0,4000,6000,9000,14000,11,31734,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sunhawk Agent - In Combat - Cast 'Mark of the Sunhawk'"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sunhawk Agent - Between 0-15% Health - Flee For Assist (No Repeat)");

-- 67.
-- High Chief Bristlelimb SAI
SET @ENTRY := 17702;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,5000,8000,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Bristlelimb - Within 0-5 Range - Cast 'Maul'"),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,11000,15000,11,20753,0,0,0,0,0,1,0,0,0,0,0,0,0,"High Chief Bristlelimb - In Combat - Cast 'Demoralizing Roar'");

-- 68.
-- Bloodcursed Naga SAI
SET @ENTRY := 17713;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,60000,60000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bloodcursed Naga - In Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,3000,4000,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,"Bloodcursed Naga - In Combat - Cast 'Frostbolt'");

-- 69.
-- Felguard Destroyer SAI
SET @ENTRY := 18977;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,33971,0,0,0,0,0,2,0,0,0,0,0,0,0,"Felguard Destroyer - On Aggro - Cast 'Sweeping Charge'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,6000,9000,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,"Felguard Destroyer - In Combat - Cast 'Cleave'");

-- 70.
-- Syndicate Thief SAI
SET @ENTRY := 24477;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,12000,36200,46300,11,6713,1,0,0,0,0,2,0,0,0,0,0,0,0,"Syndicate Thief - In Combat - Cast 'Disarm'"),
(@ENTRY,0,1,0,0,0,100,0,4800,16600,2000,25200,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,"Syndicate Thief - In Combat - Cast 'Poison'"),
(@ENTRY,0,2,0,9,0,100,0,0,5,1800,9800,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,"Syndicate Thief - Within 0-5 Range - Cast 'Backstab'"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Syndicate Thief - Between 0-15% Health - Flee For Assist (No Repeat)");

-- 71.
-- Scarlet Preacher SAI
SET @ENTRY := 28594;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,3000,4000,11,15498,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Preacher - In Combat - Cast 'Holy Smite'");


-- Nerub'ar Swarmer SAI
SET @ENTRY := 25295;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Nerub'ar Swarmer - On Just Created - Start Attacking");

-- Grimclaw SAI
SET @ENTRY := 3695;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - Received Emote 101 - Say Line 0"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Just Summoned - Run Script");