-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------

-- Masat T'andr <Superior Leatherworker> -- [A][H] http://www.wowhead.com/npc=11874/masat-tandr
UPDATE `creature_template` SET `faction`='35' WHERE  `entry`=11874;

-- Skeletal Executioner http://www.wowhead.com/npc=1787/skeletal-executioner
DELETE FROM `creature` WHERE  `guid`=52542 AND `id`=1787;
-- Jamie Nore - http://www.wowhead.com/npc=2310/jamie-nore
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=31921;
-- Ravenholdt Guard <Assassin's League> -wowhead.com/npc=6766
DELETE FROM `gossip_menu` WHERE  `entry`=4861 AND `text_id`=5935;
-- Crawler - http://wotlk.openwow.com/npc=6250
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry` IN (6250, 1860);
-- Archmage Leryda - http://wotlk.openwow.com/npc=18253
DELETE FROM `npc_text` WHERE `ID` = 10884;
DELETE FROM `gossip_menu` WHERE `entry`=8441 AND `text_id`=10884;
-- Azshir the Sleepless (6490)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6490;
DELETE FROM smart_scripts WHERE entryorguid=6490 AND source_type=0;
INSERT INTO smart_scripts VALUES (6490, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6490, 0, 1, 0, 0, 0, 100, 0, 7000, 11000, 70000, 70000, 11, 5137, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Call of the Grave');
INSERT INTO smart_scripts VALUES (6490, 0, 2, 0, 0, 0, 100, 0, 6000, 8000, 20000, 20000, 11, 7399, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Terrify');
INSERT INTO smart_scripts VALUES (6490, 0, 3, 0, 0, 0, 100, 0, 14000, 14000, 20000, 20000, 11, 9373, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Azshir the Sleepless - In Combat - Cast Soul Siphon');

-- Ironspine (6489)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6489;
DELETE FROM smart_scripts WHERE entryorguid=6489 AND source_type=0;
INSERT INTO smart_scripts VALUES (6489, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ironspine - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6489, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 30000, 30000, 11, 702, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 'Ironspine - In Combat - Cast Curse of Weakness');
INSERT INTO smart_scripts VALUES (6489, 0, 2, 0, 0, 0, 100, 0, 2000, 3000, 25000, 25000, 11, 3815, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ironspine - In Combat - Cast Poison Cloud');

-- Fallen Champion (6488)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6488;
DELETE FROM smart_scripts WHERE entryorguid=6488 AND source_type=0;
INSERT INTO smart_scripts VALUES (6488, 0, 0, 0, 37, 0, 90, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - On AI Init - Despawn');
INSERT INTO smart_scripts VALUES (6488, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 6000, 14000, 11, 19642, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Cleave');
INSERT INTO smart_scripts VALUES (6488, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 19644, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Strike');
INSERT INTO smart_scripts VALUES (6488, 0, 3, 0, 0, 0, 100, 0, 10000, 10000, 30000, 30000, 11, 21949, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fallen Champion - In Combat - Cast Rend');

-- Azshir the Sleepless (6490)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=6490);
DELETE FROM creature WHERE id=6490;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(554, 6490, 189, 1, 1, 0, 0, 1850.97, 1392.82, 20.4821, 3.13054, 300, 0, 0, 2664, 1870, 0, 0, 0, 0);

-- Tethis http://wotlk.openwow.com/npc=730
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=730;

-- King Bangalash http://www.wowhead.com/npc=731/king-bangalash
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=731;

-- Frostwave Lieutenant SAI
SET @ENTRY := 26116;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,122,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frostwave Lieutenant - On Aggro - Cast 'Frost Nova'"),
(@ENTRY,0,1,0,0,0,100,0,2000,2000,15000,16000,11,8056,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frostwave Lieutenant - In Combat - Cast 'Frost Shock'");
-- Hailstone Lieutenant SAI
SET @ENTRY := 26178;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,5276,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailstone Lieutenant - Between 0-50% Health - Cast 'Freeze' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,15000,16000,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailstone Lieutenant - In Combat - Cast 'Knockdown'");
-- Chillwind Lieutenant SAI
SET @ENTRY := 26204;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,16000,20000,11,6982,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chillwind Lieutenant - In Combat - Cast 'Gust of Wind'"),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,9000,10000,11,23115,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chillwind Lieutenant - In Combat - Cast 'Frost Shock'");
-- Frigid Lieutenant SAI
SET @ENTRY := 26214;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,8000,15000,11,3131,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frigid Lieutenant - In Combat - Cast 'Frost Breath'");
-- Glacial Lieutenant SAI
SET @ENTRY := 26215;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,14907,0,0,0,0,0,2,0,0,0,0,0,0,0,"Glacial Lieutenant - On Aggro - Cast 'Frost Nova'"),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,9000,12000,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,"Glacial Lieutenant - In Combat - Cast 'Frost Shock'");
-- Tirisfal Creature Abilities
-- Fellicent's Shade SAI
SET @ENTRY := 10358;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - On Aggro - Cast 'Arcane Bolt' (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,3400,4700,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-40 Range - Cast 'Arcane Bolt' (Phase 1)"),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 40-100 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 10-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-40 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 0-15% Mana - Enable Combat Movement (Phase 2)"),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,10,0,9,1,100,0,0,10,15000,17000,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fellicent's Shade - Within 0-10 Range - Cast 'Arcane Explosion' (Phase 1)"),
(@ENTRY,0,11,0,0,1,100,0,5000,9000,22000,26000,11,7068,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fellicent's Shade - In Combat - Cast 'Veil of Shadow' (Phase 1)");

-- Wandering Spirit SAI
SET @ENTRY := 1532;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,16000,18000,11,7713,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wandering Spirit - Within 0-8 Range - Cast 'Wailing Dead'");

-- Maggot Eye SAI
SET @ENTRY := 1753;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,75,7000,14000,11,3243,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maggot Eye - Between 0-75% Health - Cast 'Life Harvest'"),
(@ENTRY,0,1,0,0,0,100,0,4000,9000,30000,45000,11,3237,0,0,0,0,0,2,0,0,0,0,0,0,0,"Maggot Eye - In Combat - Cast 'Curse of Thule'");

-- Rot Hide Graverobber SAI
SET @ENTRY := 1941;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,9000,30000,45000,11,3237,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rot Hide Graverobber - In Combat - Cast 'Curse of Thule'");

-- Rot Hide Gnoll SAI
SET @ENTRY := 1674;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,4000,12000,0,0,11,3237,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rot Hide Gnoll - In Combat - Cast 'Curse of Thule' (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rot Hide Gnoll - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Scarlet Initiate SAI
SET @ENTRY := 1507;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,7,0,0,0,100,0,0,0,3500,5000,11,20793,64,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Initiate - In Combat - Cast 'Fireball'"),
(@ENTRY,0,10,0,23,0,100,0,12544,0,5000,10000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Initiate - On Has Aura 'Frost Armor' - Cast 'Frost Armor'"),
(@ENTRY,0,11,0,4,0,50,0,0,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Initiate - On Aggro - Say Line 0");

-- Vile Fin Minor Oracle SAI
SET @ENTRY := 1544;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Aggro - Cast 'Lightning Bolt' (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,3400,4700,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 0-40 Range - Cast 'Lightning Bolt' (Phase 1)"),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 40-100 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 10-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Within 0-40 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Mana - Enable Combat Movement (Phase 2)"),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,10,0,2,2,100,1,0,15,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Set Event Phase 3 (Phase 2) (No Repeat)"),
(@ENTRY,0,11,0,2,3,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Flee For Assist (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,12,0,7,3,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Evade - Set Event Phase 0 (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,13,0,2,3,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Say Line 0 (Phases 1 & 2) (No Repeat)"),
(@ENTRY,0,14,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,15,0,16,1,100,0,12550,1,15000,30000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield' (Phase 1)");

-- Vile Fin Muckdweller SAI
SET @ENTRY := 1545;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Muckdweller - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,0,67,0,100,0,9000,12000,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Muckdweller - On Behind Target - Cast 'Backstab'");

-- Sri'skulk SAI
SET @ENTRY := 10359;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,16000,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sri'skulk - In Combat - Cast 'Deadly Poison'");

-- Lost Soul SAI
SET @ENTRY := 1531;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,4000,5000,11,9053,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lost Soul - In Combat - Cast 'Fireball'");

-- Captain Perrine SAI
SET @ENTRY := 1662;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,18000,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Perrine - In Combat - Cast 'Shield Block'"),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captain Perrine - Between 0-30% Health - Cast 'Frenzy' (No Repeat)");

-- Scarlet Zealot SAI
SET @ENTRY := 1537;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,15000,16000,11,8191,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Zealot - In Combat - Cast 'Zeal'");

-- Hungering Dead SAI
SET @ENTRY := 1527;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3500,5000,12000,15000,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hungering Dead - In Combat - Cast 'Disease Touch'");

-- Bhag'thera http://wotlk.openwow.com/npc=728
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=728;

-- Sin'Dall http://wotlk.openwow.com/npc=729
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=729;

-- Scholomance Necromancer http://wotlk.openwow.com/npc=10477
DELETE FROM `smart_scripts` WHERE  `entryorguid`=10477 AND `source_type`=0 AND `id`=0 AND `link`=0;


-- Chicken -- http://wotlk.openwow.com/npc=620
DELETE FROM `creature_text` WHERE `entry`=620;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`, `BroadcastTextId`) VALUES 
(620, 0, 0, '%s looks up at you quizzically. Maybe you should inspect it?', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_A_HELLO', 4714),
(620, 1, 0, '%s looks at you unexpectadly.', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_H_HELLO', 0),
(620, 2, 0, '%s starts pecking at the feed.', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_CLUCK_TEXT2', 0);


-- Zanzil Witch Doctor SAI
SET @ENTRY := 1490;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,0,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Zanzil Witch Doctor - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,0,0,100,0,0,0,10000,11000,11,15038,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zanzil Witch Doctor - In Combat - Cast 'Scorching Totem'");

-- Bloodscalp Witch Doctor SAI
SET @ENTRY := 660;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,11000,11,8376,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bloodscalp Witch Doctor - In Combat - Cast 'Earthgrab Totem'"),
(@ENTRY,0,1,0,2,0,100,513,0,30,0,0,11,8599,2,0,0,0,0,1,0,0,0,0,0,0,0,"Bloodscalp Witch Doctor - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- Venture Co. Strip Miner SAI
SET @ENTRY := 674;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,6000,12000,15000,11,7978,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Strip Miner - In Combat - Cast 'Throw Dynamite'");

-- Mosh'Ogg Shaman SAI
SET @ENTRY := 679;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2500,4000,5500,6500,11,12058,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,2,0,100,0,0,75,32000,33000,11,6742,1,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - Between 0-75% Health - Cast 'Bloodlust'"),
(@ENTRY,0,2,0,0,0,100,0,0,1000,32000,32000,11,11899,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - In Combat - Cast 'Healing Ward'"),
(@ENTRY,0,3,0,4,0,15,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - On Aggro - Say Line 0"),
(@ENTRY,0,4,0,74,0,100,0,0,75,31000,32000,86,6742,33,1,0,0,0,11,0,15,0,0,0,0,0,"Mosh'Ogg Shaman - On Friendly Between 0-75% Health - Cross Cast 'Bloodlust'");

-- Mosh'Ogg Spellcrafter SAI
SET @ENTRY := 710;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,300000,300000,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,5000,6000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - In Combat - Cast 'Fireball'"),
(@ENTRY,0,2,0,0,0,100,0,6000,7000,12000,14000,11,11829,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - In Combat - Cast 'Flamestrike'"),
(@ENTRY,0,3,0,4,0,15,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - On Aggro - Say Line 0");

-- Mosh'Ogg Lord SAI
SET @ENTRY := 680;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,512,3000,4000,30000,40000,11,9128,32,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Lord - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,4,0,15,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Lord - On Aggro - Say Line 0"),
(@ENTRY,0,2,0,9,0,100,0,0,5,4000,5000,11,7093,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Lord - Within 0-5 Range - Cast 'Intimidation'");

-- Mosh'Ogg Warmonger SAI
SET @ENTRY := 709;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,75,512,2000,3000,10000,11000,11,8147,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Warmonger - In Combat - Cast 'Thunderclap'"),
(@ENTRY,0,1,0,4,0,15,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Warmonger - On Aggro - Say Line 0");

-- Mosh'Ogg Mauler SAI
SET @ENTRY := 678;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,50,512,4000,6000,11000,12000,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Mauler - In Combat - Cast 'Knockdown'"),
(@ENTRY,0,1,0,4,0,15,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Mauler - On Aggro - Say Line 0");

-- Mai'Zoth SAI
SET @ENTRY := 818;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,6000,7000,11,8398,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mai'Zoth - In Combat - Cast 'Frostbolt Volley'"),
(@ENTRY,0,1,0,0,0,100,0,0,3000,4000,5000,11,8814,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mai'Zoth - In Combat - Cast 'Flame Spike'");

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (679, 678, 709, 680, 710);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(679,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,1927,0,'Mosh\'Ogg Shaman'),
(679,0,1,'Me smash! You die!',12,0,100,0,4000,0,1926,0,'Mosh\'Ogg Shaman'),
(679,0,2,'I\'ll crush you!',12,0,100,0,4000,0,1925,0,'Mosh\'Ogg Shaman'),
(678,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,1927,0,'Mosh\'Ogg Mauler'),
(678,0,1,'Me smash! You die!',12,0,100,0,4000,0,1926,0,'Mosh\'Ogg Mauler'),
(678,0,2,'I\'ll crush you!',12,0,100,0,4000,0,1925,0,'Mosh\'Ogg Mauler'),
(709,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,1927,0,'Mosh\'Ogg Warmonger'),
(709,0,1,'Me smash! You die!',12,0,100,0,4000,0,1926,0,'Mosh\'Ogg Warmonger'),
(709,0,2,'I\'ll crush you!',12,0,100,0,4000,0,1925,0,'Mosh\'Ogg Warmonger'),
(680,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,1927,0,'Mosh\'Ogg Lord'),
(680,0,1,'Me smash! You die!',12,0,100,0,4000,0,1926,0,'Mosh\'Ogg Lord'),
(680,0,2,'I\'ll crush you!',12,0,100,0,4000,0,1925,0,'Mosh\'Ogg Lord'),
(710,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,1927,0,'Mosh\'Ogg Spellcrafter'),
(710,0,1,'Me smash! You die!',12,0,100,0,4000,0,1926,0,'Mosh\'Ogg Spellcrafter'),
(710,0,2,'I\'ll crush you!',12,0,100,0,4000,0,1925,0,'Mosh\'Ogg Spellcrafter');


-- Paths
SET @NPC := 849;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12378.6, `position_y`=-963.559, `position_z`=15.3825, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12378.6,-963.559,15.3825,0,0,0,0,100,0),
(@PATH,2,-12389.1,-960.663,19.123,0,0,0,0,100,0),
(@PATH,3,-12402,-953.174,24.9704,0,0,0,0,100,0),
(@PATH,4,-12410.9,-950.4,28.0988,0,0,0,0,100,0),
(@PATH,5,-12415.9,-942.535,28.7172,0,0,0,0,100,0),
(@PATH,6,-12422.5,-930.758,30.8608,0,0,0,0,100,0),
(@PATH,7,-12434.3,-915.714,35.5984,0,0,0,0,100,0),
(@PATH,8,-12448.6,-909.005,38.7702,0,0,0,0,100,0),
(@PATH,9,-12434.3,-915.714,35.5984,0,0,0,0,100,0),
(@PATH,10,-12422.5,-930.758,30.8608,0,0,0,0,100,0),
(@PATH,11,-12415.9,-942.535,28.7172,0,0,0,0,100,0),
(@PATH,12,-12410.9,-950.4,28.0988,0,0,0,0,100,0),
(@PATH,13,-12402,-953.174,24.9704,0,0,0,0,100,0),
(@PATH,14,-12389.1,-960.663,19.123,0,0,0,0,100,0),
(@PATH,15,-12378.6,-963.559,15.3825,0,0,0,0,100,0),
(@PATH,16,-12369.5,-963.88,12.9135,0,0,0,0,100,0);

SET @NPC := 856;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12330.2, `position_y`=-933.855, `position_z`=9.33679, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12330.2,-933.855,9.33679,0,0,0,0,100,0),
(@PATH,2,-12309.3,-908.34,8.68362,0,0,0,0,100,0),
(@PATH,3,-12287.8,-885.928,7.72276,0,0,0,0,100,0),
(@PATH,4,-12271.6,-855.56,7.95999,0,0,0,0,100,0),
(@PATH,5,-12256,-815.657,9.87775,0,0,0,0,100,0),
(@PATH,6,-12246.8,-791.101,12.5155,0,0,0,0,100,0),
(@PATH,7,-12256,-815.657,9.87775,0,0,0,0,100,0),
(@PATH,8,-12271.6,-855.56,7.95999,0,0,0,0,100,0),
(@PATH,9,-12287.8,-885.928,7.72276,0,0,0,0,100,0),
(@PATH,10,-12309.3,-908.34,8.68362,0,0,0,0,100,0),
(@PATH,11,-12330.2,-933.855,9.33679,0,0,0,0,100,0),
(@PATH,12,-12351.4,-969,13.033,0,0,0,0,100,0);


SET @NPC := 1306;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12321, `position_y`=-987.277, `position_z`=16.1281, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12321,-987.277,16.1281,0,0,0,0,100,0),
(@PATH,2,-12313.4,-996.214,20.1334,0,0,0,0,100,0),
(@PATH,3,-12306.6,-1001.41,22.9486,0,0,0,0,100,0),
(@PATH,4,-12300.2,-1003.79,25.7924,0,0,0,0,100,0),
(@PATH,5,-12291.5,-1005.99,29.7797,0,0,0,0,100,0),
(@PATH,6,-12280,-1000.79,32.059,0,0,0,0,100,0),
(@PATH,7,-12268.3,-989.618,33.7009,0,0,0,0,100,0),
(@PATH,8,-12240.5,-984.796,34.0938,0,0,0,0,100,0),
(@PATH,9,-12268.3,-989.618,33.7009,0,0,0,0,100,0),
(@PATH,10,-12280,-1000.79,32.059,0,0,0,0,100,0),
(@PATH,11,-12291.5,-1005.99,29.7797,0,0,0,0,100,0),
(@PATH,12,-12300.2,-1003.79,25.7924,0,0,0,0,100,0),
(@PATH,13,-12306.6,-1001.41,22.9486,0,0,0,0,100,0),
(@PATH,14,-12313.4,-996.214,20.1334,0,0,0,0,100,0),
(@PATH,15,-12321,-987.277,16.1281,0,0,0,0,100,0),
(@PATH,16,-12340.8,-974.699,12.554,0,0,0,0,100,0);

-- Jungle Panther SAI
SET @ENTRY := 31636;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,1000,1000,49,0,0,0,0,0,0,25,10,0,0,0,0,0,0,"Jungle Panther - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,1,0,100,0,10000,10000,10000,10000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jungle Panther - Out of Combat - Despawn Instant");

-- Earthgrab Totem should not grant experience
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 6066;

-- Nancy Vishas SAI
SET @ENTRY := 3984;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,60,0,100,0,5000,5000,180000,180000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nancy Vishas - On Update - Run Script");

-- Actionlist SAI
SET @ENTRY := 398400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9 AND `id`=5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,53,0,3984,0,0,0,2,1,0,0,0,0,0,0,0,"Nancy Vishas - On Script - Start Waypoint");

-- Booty Bay Bruiser should yell - reputation towards Steamwheedle Cartel on kill now
DELETE FROM `creature_onkill_reputation` WHERE `creature_id`= 4624;
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
(4624,87,21,5,0,125,5,1,-625,0);

-- Mai'Zoth
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `guid` = 523; 

-- Deathguard Terrence
UPDATE `waypoint_data` SET `action`=0 WHERE  `id`=297790 AND `point`=13;
