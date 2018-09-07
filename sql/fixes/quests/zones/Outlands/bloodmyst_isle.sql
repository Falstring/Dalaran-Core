-- -------------------------------------------
-- BLOODMYST_ISLE
-- -------------------------------------------


-- [Q[ Razormaw - http://wotlk.openwow.com/quest=9689
UPDATE `creature_template` SET `speed_run` = 2.14286, `InhabitType` = 7, `MovementType` = 0, `AIName` = '', `ScriptName` = 'npc_razormaw' WHERE `entry` = 17592;

DELETE FROM `event_scripts` WHERE `id` = 11087;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(11087, 3, 10, 17592, 150000, 0, -1200.41, -12516, 112.10, 1.7231);

DELETE FROM `waypoints` WHERE `entry` = 17592;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=17592;

-- [Q] Ending their World - http://www.wowhead.com/quest=9759/ending-their-world
-- Exarch Admetius
-- Text
SET @ADMETIUS := 17658;
DELETE FROM `creature_text` WHERE `entry`=@ADMETIUS;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `probability`, `emote`, `comment`) VALUES
(@ADMETIUS, 0, 0, 'All hail $N, savior of Azuremyst and Bloodmyst. Hero of the Hand of Argus, champion of the draenei people!', 14, 100, 22, 'Exarch Admetius q9759 OnRewarded');

-- Exarch Admetius SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ADMETIUS;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ADMETIUS AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ADMETIUS,0,0,1,20,0,100,0,9759,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exarch Admetius - On Quest 'Ending Their World' Finished - Say Line 0"),
(@ADMETIUS,0,1,0,61,0,100,0,9759,0,0,0,80,1765800,2,0,0,0,0,1,0,0,0,0,0,0,0,"Exarch Admetius - On Quest 'Ending Their World' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1765800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1930.463989,-11812.552734,62.630852,2.309952,"On Script - Summon Creature '17659'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1937.486816,-11805.743164,63.798454,5.535975,"On Script - Summon Creature '17659'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1933.494751,-11814.824219,62.108002,2.227484,"On Script - Summon Creature '17659'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1939.963135,-11808.174805,62.675228,5.499846,"On Script - Summon Creature '17659'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1936.870117,-11817.032227,61.134773,2.248988,"On Script - Summon Creature '17659'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1942.610474,-11810.625000,61.824261,5.247342,"On Script - Summon Creature '17659'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1940.207031,-11819.827148,60.307522,2.362086,"On Script - Summon Creature '17659'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1945.478760,-11813.578125,60.911236,5.352979,"On Script - Summon Creature '17659'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1944.12133,-11823.203125,59.074284,2.187334,"On Script - Summon Creature '17659'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,17659,2,300000,0,0,0,8,0,0,0,-1948.833252,-11816.772461,60.053009,5.346693,"On Script - Summon Creature '17659'"),

(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,17116,2,300000,0,0,0,8,0,0,0,-1958.723145,-11821.600586,58.892117,0.461123,"On Script - Summon Creature '17116'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,17214,2,300000,0,0,0,8,0,0,0,-1960.273315,-11819.877930,59.570976,0.295709,"On Script - Summon Creature '17214'"),

(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,17101,2,300000,0,0,0,8,0,0,0,-1959.952393,-11823.844727,57.627731,0.372766,"On Script - Summon Creature '17101'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,17215,2,300000,0,0,0,8,0,0,0,-1961.160522,-11823.409180,57.701954,0.640498,"On Script - Summon Creature '17215'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,17110,2,300000,0,0,0,8,0,0,0,-1961.201050,-11821.857422,58.600365,0.525438,"On Script - Summon Creature '17110'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,17440,2,300000,0,0,0,8,0,0,0,-1964.156616,-11826.984375,56.166782,0.561564,"On Script - Summon Creature '17440'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,17682,2,300000,0,0,0,8,0,0,0,-1966.066650,-11824.650391,57.265072,0.161011,"On Script - Summon Creature '17682'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,17443,2,300000,0,0,0,8,0,0,0,-1966.240601,-11821.984375,58.598003,6.208578,"On Script - Summon Creature '17443'"),
(@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,17445,2,300000,0,0,0,8,0,0,0,-1968.898560,-11829.065430,55.041294,0.386419,"On Script - Summon Creature '17445'"),

(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,17242,2,300000,0,0,0,8,0,0,0,-1948.333862,-11832.594727,57.239986,1.149823,"On Script - Summon Creature '17242'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,17240,2,300000,0,0,0,8,0,0,0,-1950.203369,-11831.666992,56.967094,1.090918,"On Script - Summon Creature '17240'"),
(@ENTRY,9,21,0,0,0,100,0,0,0,0,0,12,17117,2,300000,0,0,0,8,0,0,0,-1952.308716,-11831.344727,56.705555,0.912240,"On Script - Summon Creature '17117'"),
(@ENTRY,9,22,0,0,0,100,0,0,0,0,0,12,17246,2,300000,0,0,0,8,0,0,0,-1949.923462,-11834.007813,56.731907,1.218545,"On Script - Summon Creature '17246'"),
(@ENTRY,9,23,0,0,0,100,0,0,0,0,0,12,17241,2,300000,0,0,0,8,0,0,0,-1952.386230,-11833.522461,56.430508,0.977035,"On Script - Summon Creature '17241'"),

(@ENTRY,9,24,0,0,0,100,0,0,0,0,0,12,17311,2,300000,0,0,0,8,0,0,0,-1954.797119,-11838.625977,55.252689,1.161602,"On Script - Summon Creature '17311'"),
(@ENTRY,9,25,0,0,0,100,0,0,0,0,0,12,17649,2,300000,0,0,0,8,0,0,0,-1955.696411,-11843.051758,54.145817,1.175565,"On Script - Summon Creature '17649'"),

(@ENTRY,9,26,0,0,0,100,0,0,0,0,0,12,17468,2,300000,0,0,0,8,0,0,0,-1965.800659,-11838.660156,53.219593,0.792683,"On Script - Summon Creature '17468'");

-- Blade of Argus SAI
SET @ENTRY := 17659;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Blade of Argus - On Just Summoned - Set Flag Standstate Kneel");

-- Diktynna SAI
SET @ENTRY := 17101;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");

-- Exarch Menelaous SAI
SET @ENTRY := 17116;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4"),
(@ENTRY, 0, 2, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 17116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip hello credit for quest 9663');


-- 17215SAI
SET @ENTRY := 17215;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");


-- Acteon SAI
SET @ENTRY := 17110;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,3000,3000,5000,8000,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Acteon - Out of Combat - Play Emote 4");


-- Anchorite Fateema SAI
SET @ENTRY := 17214;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anchorite Fateema - On Just Summoned - Play Emote 10");

-- Admiral Odesyus SAI
SET @ENTRY := 17240;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,17240,0,0,0,0,0,7,0,0,0,0,0,0,0,"Admiral Odesyus - On Gossip Hello - Quest Credit 'The Kessel Run'"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Admiral Odesyus - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,2,0,1,1,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Admiral Odesyus - Out of Combat - Play Emote 10 (Phase 1)");

-- Cowlen SAI
SET @ENTRY := 17311;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,7401,0,0,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - On Gossip Option 0 Selected - Play Emote 18"),
(@ENTRY,0,1,0,61,0,100,0,7401,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cowlen - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - On Just Summoned - Set Event Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cowlen - Out of Combat - Play Emote 10 (Phase 1)");

-- Archaeologist Adamant Ironheart SAI
SET @ENTRY := 17242;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Archaeologist Adamant Ironheart - On Just Summoned - Play Emote 10");

-- Injured Night Elf Priestess SAI
SET @ENTRY := 17117;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Night Elf Priestess - On Just Summoned - Remove Flag Standstate Sleep"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Night Elf Priestess - On Just Summoned - Play Emote 10");

-- "Cookie" McWeaksauce SAI
SET @ENTRY := 17246;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cookie McWeaksauce - On Just Summoned - Play Emote 10");

-- Priestess Kyleen Il'dinare SAI
SET @ENTRY := 17241;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Priestess Kyleen Il'dinare - On Just Summoned - Play Emote 10");

-- Kessel SAI
SET @ENTRY := 17649;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,5,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kessel - On Just Summoned - Play Emote 10");
