-- Gameobjectscripts

-- Higher Learning (1956)
UPDATE gameobject_template SET data11=1, AIName='SmartGameObjectAI', ScriptName='' WHERE entry IN (192708, 192706, 192871, 192905, 192710, 192886, 192869, 192880, 192895, 192713, 192889, 192890, 192894, 192884, 192866, 192891, 192872, 192881, 192709 ,192883 ,192651, 192888, 192711, 192653 ,192887, 192652, 192865, 192874 ,192868, 192870, 192885, 192867, 192882, 192707, 192896);
DELETE FROM smart_scripts WHERE source_type=1 AND entryorguid IN (192708, 192706, 192871, 192905, 192710, 192886, 192869, 192880, 192895, 192713, 192889, 192890, 192894, 192884, 192866, 192891, 192872, 192881, 192709 ,192883 ,192651, 192888, 192711, 192653 ,192887, 192652, 192865, 192874 ,192868, 192870, 192885, 192867, 192882, 192707, 192896);
INSERT INTO smart_scripts VALUES (192708, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192708, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192706, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192706, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192871, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192871, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192905, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192905, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192710, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192710, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192886, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192886, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192869, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192869, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192880, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192880, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192895, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192895, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192713, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192713, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192889, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192889, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192890, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192890, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192894, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192894, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192884, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192884, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192866, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192866, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192891, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192891, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192872, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192872, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192881, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192881, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192709, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192709, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192883, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192883, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192651, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192651, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192888, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192888, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192711, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192711, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192653, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192653, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192887, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192887, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192652, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192652, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192865, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192865, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192874, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192874, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192868, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192868, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192870, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192870, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192885, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192885, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192867, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192867, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192882, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192882, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192707, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192707, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
INSERT INTO smart_scripts VALUES (192896, 1, 0, 0, 64, 0, 100, 1, 0, 0, 0, 0, 67, 1, 240000, 240000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (192896, 1, 1, 0, 59, 0, 100, 1, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Higher Learning - Timed Event Triggered - Set Loot State');
-- DB/Quest: A bear of an Appetite -- quest=12279
UPDATE `gameobject_template` SET `ScriptName`='go_school_of_northern_salmon' WHERE  `entry`=189290;
-- Defias Gunpowder SAI
SET @ENTRY := 17155;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,12,4417,3,120000,1,0,0,8,0,0,0,-123.77,-613.586,14.126,6.035,"Defias Gunpowder - On Gossip Hello - Summon Creature 'Defias Taskmaster' (No Repeat)");
-- Courtyard Door SAI
SET @ENTRY := 18895;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,104,16,0,0,0,0,0,14,32443,101812,0,0,0,0,0,"Courtyard Door - On Gameobject State Changed - Set Gameobject Flag Not Selectable");
-- Ethereum Stasis Chamber - Respawntimer
UPDATE `gameobject_template` SET `data2`=180000 WHERE  `entry` IN (
185465,
185465,
185466,
185467,
184595,
185461,
185462,
185463,
185464,
185468,
185469,
185470);

SET @LSCOFFER := 180690;
SET @SCOFFER  := 180691;
SET @GUIDLSC  := 17800;
SET @GUIDSC   := 20918;

-- Updating maxcount for Scarab Scarab Bag
UPDATE `item_loot_template` SET `maxcount` = 5 WHERE `entry` = 21156;

-- Updating spawn location for Large Scarab Coffers
DELETE FROM `gameobject` WHERE `guid` IN (@GUIDLSC, @GUIDLSC+1, @GUIDLSC+2, @GUIDLSC+3, @GUIDLSC+4, @GUIDLSC+5, @GUIDLSC+6, @GUIDLSC+7, @GUIDLSC+8, @GUIDLSC+9, @GUIDLSC+10, @GUIDLSC+11);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GUIDLSC, @LSCOFFER, 531, 1, 1, -8130.227, 1136.687, -88.93, 0.857524, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+1, @LSCOFFER, 531, 1, 1, -8588.386, 1300.252, -68.730408, 2.097758, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+2, @LSCOFFER, 531, 1, 1, -8685.795, 1598.988, -87.498146, 4.515244, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+3, @LSCOFFER, 531, 1, 1, -8878.372, 1366.834, -98.920456, 1.169440, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+4, @LSCOFFER, 531, 1, 1, -9094.497, 1515.304, -98.369436, 5.289001, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+5, @LSCOFFER, 531, 1, 1, -9205.269, 1489.207, -94.166359, 0.800427, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+6, @LSCOFFER, 531, 1, 1, -9239.013, 1569.972, -77.098450, 5.92124, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+7, @LSCOFFER, 531, 1, 1, -9162.003, 1584.0142, -79.262154, 2.819869, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+8, @LSCOFFER, 531, 1, 1, -9203.490, 1967.797, -51.939789, 1.508256, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+9, @LSCOFFER, 531, 1, 1, -8923.832, 1826.973, -20.905273, 1.040937, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+10, @LSCOFFER, 531, 1, 1, -8561.847, 1988.220, -3.113131, 4.493683, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+11, @LSCOFFER, 531, 1, 1, -8507.548, 2018.031, 104.526520, 3.540616, 0, 0, 0, 0, 10800, 100, 1);

-- Updating spawn location for Scarab Coffers
DELETE FROM `gameobject` WHERE `guid` IN (@GUIDSC, @GUIDSC+1, @GUIDSC+2, @GUIDSC+3, @GUIDSC+4, @GUIDSC+5, @GUIDSC+6, @GUIDSC+7, @GUIDSC+8);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GUIDSC, @SCOFFER, 509, 1, 1, -8698.908, 1560.894, 32.013947, 2.385138, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+1, @SCOFFER, 509, 1, 1, -9117.897, 1511.653, 21.414448, 1.780370, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+2, @SCOFFER, 509, 1, 1, -8775.216, 2003.485, 21.403147, 3.060552, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+3, @SCOFFER, 509, 1, 1, -9009.267, 1989.094, 33.044173, 0.115302, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+4, @SCOFFER, 509, 1, 1, -9130.286, 2188.145, 25.825098, 0.872438, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+5, @SCOFFER, 509, 1, 1, -9544.468, 2010.560, 105.250053, 0.864585, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+6, @SCOFFER, 509, 1, 1, -9701.868, 1619.060, 27.191568, 0.042328, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+7, @SCOFFER, 509, 1, 1, -9552.093, 1567.647, 23.153004, 2.197394, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+8, @SCOFFER, 509, 1, 1, -9335.515, 1214.496, 21.385408, 0.709061, 0, 0, 0, 0, 10800, 100, 1);

-- Pool template for Large Scarab Coffers and Scarab Coffers
DELETE FROM `pool_template` WHERE entry IN (1161, 1162);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(1161, 5, 'Large Scarab Coffers'),
(1162, 7, 'Scarab Coffers');

-- Pool_gameobject pool for Large Scarab Coffers
DELETE FROM `pool_gameobject` WHERE guid IN (@GUIDLSC, @GUIDLSC+1, @GUIDLSC+2, @GUIDLSC+3, @GUIDLSC+4, @GUIDLSC+5, @GUIDLSC+6, @GUIDLSC+7, @GUIDLSC+8, @GUIDLSC+9, @GUIDLSC+10, @GUIDLSC+11);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUIDLSC, 1161, 0, 'Large Scarab Coffers - Spawn 1'),
(@GUIDLSC+1, 1161, 0, 'Large Scarab Coffers - Spawn 2'),
(@GUIDLSC+2, 1161, 0, 'Large Scarab Coffers - Spawn 3'),
(@GUIDLSC+3, 1161, 0, 'Large Scarab Coffers - Spawn 4'),
(@GUIDLSC+4, 1161, 0, 'Large Scarab Coffers - Spawn 5'),
(@GUIDLSC+5, 1161, 0, 'Large Scarab Coffers - Spawn 6'),
(@GUIDLSC+6, 1161, 0, 'Large Scarab Coffers - Spawn 7'),
(@GUIDLSC+7, 1161, 0, 'Large Scarab Coffers - Spawn 8'),
(@GUIDLSC+8, 1161, 0, 'Large Scarab Coffers - Spawn 9'),
(@GUIDLSC+9, 1161, 0, 'Large Scarab Coffers - Spawn 10'),
(@GUIDLSC+10, 1161, 0, 'Large Scarab Coffers - Spawn 11'),
(@GUIDLSC+11, 1161, 0, 'Large Scarab Coffers - Spawn 12');

-- Pool_gameobject pool for Large Scarab Coffers
DELETE FROM `pool_gameobject` WHERE guid IN (@GUIDSC, @GUIDSC+1, @GUIDSC+2, @GUIDSC+3, @GUIDSC+4, @GUIDSC+5, @GUIDSC+6, @GUIDSC+7, @GUIDSC+8, @GUIDSC+9, @GUIDSC+10, @GUIDSC+11);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUIDSC, 1162, 0, 'Scarab Coffers - Spawn 1'),
(@GUIDSC+1, 1162, 0, 'Scarab Coffers - Spawn 2'),
(@GUIDSC+2, 1162, 0, 'Scarab Coffers - Spawn 3'),
(@GUIDSC+3, 1162, 0, 'Scarab Coffers - Spawn 4'),
(@GUIDSC+4, 1162, 0, 'Scarab Coffers - Spawn 5'),
(@GUIDSC+5, 1162, 0, 'Scarab Coffers - Spawn 6'),
(@GUIDSC+6, 1162, 0, 'Scarab Coffers - Spawn 7'),
(@GUIDSC+7, 1162, 0, 'Scarab Coffers - Spawn 8'),
(@GUIDSC+8, 1162, 0, 'Scarab Coffers - Spawn 9');

-- Mana-Tombs Stasis Chamber SAI
SET @ENTRY := 185519;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,64,0,100,0,0,0,0,0,26,10977,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mana-Tombs Stasis Chamber - On Gossip Hello - Quest Credit 'Stasis Chambers of the Mana-Tombs'"),
(@ENTRY,1,1,0,61,0,100,0,0,0,0,0,12,22928,3,30000,0,0,0,1,0,0,0,0,0,0,0,"Mana-Tombs Stasis Chamber - On Gossip Hello - Summon Creature 'Ambassador Pax'ivi'");

-- The Talon King's Coffer
UPDATE `gameobject` SET `spawntimesecs`= 1 WHERE (`guid`= 44719);

-- Patching Up - spawns for spellfocusgo: Geyser Fields Steam Vent
DELETE FROM `gameobject` WHERE `id`=188086;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 2033110 AND 2033122;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES 
(99822, 188086, 571, 3537, 4117, 1, 1, 3813.33, 4471.39, 27.4984, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(99823, 188086, 571, 3537, 4117, 1, 1, 3751.68, 4549.81, 10.8374, 1.13857, 0, 0, 0.539031, 0.842286, 25, 0, 1, 0),
(99824, 188086, 571, 3537, 4117, 1, 1, 3815.53, 4611.2, 11.6697, 0.114409, 0, 0, 0.0571735, 0.998364, 25, 0, 1, 0),
(99825, 188086, 571, 3537, 4035, 1, 1, 3855.69, 4743.49, -5.76928, 1.18255, 0, 0, 0.557422, 0.830229, 25, 0, 1, 0),
(2033110, 188086, 571, 3537, 4035, 1, 1, 3536.2, 4643.73, -9.07687, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033111, 188086, 571, 3537, 4035, 1, 1, 3580.01, 4650.96, -8.47799, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033112, 188086, 571, 3537, 4035, 1, 1, 3563.85, 4708.42, -2.32749, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033113, 188086, 571, 3537, 4035, 1, 1, 3647.38, 4858.2, -6.95287, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033114, 188086, 571, 3537, 4035, 1, 1, 3913.82, 4747.33, -11.5907, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033115, 188086, 571, 3537, 4035, 1, 1, 3913.82, 4747.33, -12.5907, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033116, 188086, 571, 3537, 4035, 1, 1, 3821.51, 4660.28, -8.3201, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033117, 188086, 571, 3537, 4035, 1, 1, 3741.82, 4676.6, -10.0725, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033118, 188086, 571, 3537, 4119, 1, 1, 3971.45, 4629.49, 3.28894, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033119, 188086, 571, 3537, 4035, 1, 1, 3839.74, 4871.17, -12.5761, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033120, 188086, 571, 3537, 4035, 1, 1, 4008, 4991.51, -7.32175, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033121, 188086, 571, 3537, 4035, 1, 1, 4003.03, 5043.33, -0.17, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0),
(2033122, 188086, 571, 3537, 4035, 1, 1, 4172.76, 4804.74, -11.9463, 5.91771, 0, 0, 0.181721, -0.98335, 25, 0, 1, 0);

--  Mok'thardin's Enchantment - Gameobject respawn timer
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `guid` = 10121;

UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` BETWEEN 2891 AND 2893;

SET @OGUID := 2031864;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID + 0 AND @OGUID + 7;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES 
(@OGUID + 0, 192187, 571, 67, 4455, 1, 65535, 7303.5, -2056.25, 761.303, 1.16167, 0, 0, 0.548722, 0.836005,    60, 0, 1, 0),
(@OGUID + 1, 192187, 571, 67, 4455, 1, 65535, 7310.18, -2056.72, 761.332, 0.662946, 0, 0, 0.325436, 0.945564,  60, 0, 1, 0),
(@OGUID + 2, 192187, 571, 67, 4455, 1, 65535, 7319.18, -2050.69, 761.45, 4.81377, 0, 0, 0.670369, -0.742028,   60, 0, 1, 0),
(@OGUID + 3, 192187, 571, 67, 4455, 1, 65535, 7318.3, -2044.77, 761.376, 1.20094, 0, 0, 0.565031, 0.82507,     60, 0, 1, 0),
(@OGUID + 4, 192187, 571, 67, 4455, 1, 65535, 7328.92, -2047.76, 761.564, 0.0149901, 0, 0, 0.007495, 0.999972, 60, 0, 1, 0),
(@OGUID + 5, 192187, 571, 67, 4455, 1, 65535, 7311.64, -2039.96, 761.518, 4.95121, 0, 0, 0.617835, -0.786308,  60, 0, 1, 0),
(@OGUID + 6, 192187, 571, 67, 4455, 1, 65535, 7305.54, -2047.59, 761.476, 3.22727, 0, 0, 0.999083, -0.0428247, 60, 0, 1, 0),
(@OGUID + 7, 192187, 571, 67, 4455, 1, 65535, 7325.97, -2038.3, 761.321, 1.54652, 0, 0, 0.698473, 0.715636,    60, 0, 1, 0);

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE  `entry`=190590;
DELETE FROM `smart_scripts` WHERE `entryorguid`=190590 AND  `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(190590, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 70, 60, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Unstable Explosives - On State Changed - Despawn for 60 sec');

-- Scarlet Onslaught Daily Orders
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id` IN (188676, 188675, 188677);

-- Nerub'ar Egg Sac -- http://wotlk.openwow.com/object=187655
SET @OGUID := 4000057;
DELETE FROM gameobject WHERE guid BETWEEN @OGUID + 0 AND @OGUID + 18;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
( @OGUID + 0, 187655, 571, 1,1,2619.735,6044.973,62.04182,5.846854, 0, 0, -0.2164392, 0.9762961, 300, 255, 1),
( @OGUID + 1, 187655, 571, 1,1,2611.435,6060.056,53.98623,2.565632, 0, 0, 0.9588194, 0.2840165, 300, 255, 1),
( @OGUID + 2, 187655, 571, 1,1,2575.054,6052.29,88.17222,0.9599299, 0, 0, 0.4617481, 0.8870111, 300, 255, 1),
( @OGUID + 3, 187655, 571, 1,1,2569.778,6080.495,87.36649,3.926996, 0, 0, -0.9238787, 0.3826855, 300, 255, 1),
( @OGUID + 4, 187655, 571, 1,1,2561.835,6101.77,66.08759,2.478367, 0, 0, 0.9455185, 0.3255684, 300, 255, 1),
( @OGUID + 5, 187655, 571, 1,1,2556.646,6089.519,73.43652,2.478367, 0, 0, 0.9455185, 0.3255684, 300, 255, 1),
( @OGUID + 6, 187655, 571, 1,1,2551.704,6052.294,88.13548,3.33359, 0, 0, -0.9953957, 0.09585124, 300, 255, 1),
( @OGUID + 7, 187655, 571, 1,1,2616.687,6207.524,59.38102,6.143561, 0, 0, -0.06975555, 0.9975641, 300, 255, 1),
( @OGUID + 8, 187655, 571, 1,1,2620.03,5998.845,87.13082,2.111848, 0, 0, 0.8703556, 0.4924237, 300, 255, 1),
( @OGUID + 9, 187655, 571, 1,1,2904.279,6306.756,106.1282,3.054327, 0, 0, 0.9990482, 0.04361926, 300, 255, 1),
( @OGUID + 10, 187655, 571, 1,1,2909.719,6310.445,106.0552,0.9075702, 0, 0, 0.4383707, 0.8987942, 300, 255, 1),
( @OGUID + 11, 187655, 571, 1,1,2924.597,6277.471,61.4728,0.4363316, 0, 0, 0.2164392, 0.9762961, 300, 255, 1),
( @OGUID + 12, 187655, 571, 1,1,2954.691,6290.092,92.35532,1.274088, 0, 0, 0.5948219, 0.8038574, 300, 255, 1),
( @OGUID + 13, 187655, 571, 1,1,2933.394,6293.89,93.66654,3.752462, 0, 0, -0.9537163, 0.3007079, 300, 255, 1),
( @OGUID + 14, 187655, 571, 1,1,2936.999,6261.966,80.94783,2.35619, 0, 0, 0.9238787, 0.3826855, 300, 255, 1),
( @OGUID + 15, 187655, 571, 1,1,2925.198,6285.97,69.83652,1.762782, 0, 0, 0.7716246, 0.6360782, 300, 255, 1),
( @OGUID + 16, 187655, 571, 1,1,2957.298,6270.011,93.60268,4.66003, 0, 0, -0.7253742, 0.6883547, 300, 255, 1),
( @OGUID + 17, 187655, 571, 1,1,2931.734,6278.576,69.8568,4.81711, 0, 0, -0.6691303, 0.743145, 300, 255, 1),
( @OGUID + 18, 187655, 571, 1,1,2953.022,6269.587,80.833,5.567601, 0, 0, -0.3502073, 0.9366722, 300, 255, 1);

-- Unstable Explosion - Sholazar Basin
SET @FIRSTTRAP    := 2033145;

DELETE FROM `gameobject_template` WHERE `entry`=190590;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`) VALUES 
(190590, 10, 8181, 'Unstable Explosives', '', '', '', 0, 4, 1, 0, 12660, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 194955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE  `entry`=190590;
DELETE FROM `smart_scripts` WHERE `entryorguid`=190590 AND  `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(190590, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 70, 300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Unstable Explosives - On State Changed - Despawn for 60 sec');

DELETE FROM `gameobject` WHERE `guid` BETWEEN @FIRSTTRAP AND @FIRSTTRAP+6 AND `id`=194955;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
(@FIRSTTRAP,194955,571,1,1,5988.04,4473.78,-87.3617,1.74533,0,0,0.766045,0.642787,180,255,1),
(@FIRSTTRAP+1,194955,571,1,1,6073.83,4463.66,-84.9872,-0.820303,0,0,-0.398748,0.91706,180,255,1),
(@FIRSTTRAP+2,194955,571,1,1,6130.8,4462.61,-84.544,2.75761,0,0,0.981626,0.190814,180,255,1),
(@FIRSTTRAP+3,194955,571,1,1,6075.99,4523.62,-81.0092,0.698132,0,0,0.34202,0.939693,180,255,1),
(@FIRSTTRAP+4,194955,571,1,1,6012.03,4517.3,-86.8614,0.872664,0,0,0.422618,0.906308,180,255,1),
(@FIRSTTRAP+5,194955,571,1,1,6092.64,4425.49,-83.9704,-2.72271,0,0,-0.978147,0.207914,180,255,1),
(@FIRSTTRAP+6,194955,571,1,1,6102.15,4497.03,-81.3401,-2.63544,0,0,-0.968147,0.250383,180,255,1);

-- Premium Siabi Tobacco
UPDATE `gameobject_template` SET `flags`=0 WHERE  `entry`=176248;