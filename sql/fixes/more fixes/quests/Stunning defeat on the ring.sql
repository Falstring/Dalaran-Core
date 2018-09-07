-- Stunning Defeat at the Ring (11300)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24216;
DELETE FROM smart_scripts WHERE entryorguid=24216 AND source_type=0;
REPLACE INTO smart_scripts VALUES (24216, 0, 0, 0, 1, 0, 100, 0, 5000, 15000, 10000, 30000, 11, 43291, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Berserker - On OOC Update - Cast Spell');
DELETE FROM conditions WHERE SourceEntry=43291 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES(13, 1, 43291, 0, 0, 31, 0, 3, 24221, 0, 0, 0, 0, '', 'Target Dragonflyer Berserker Target');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24151;

-- Daegarn SAI
SET @ENTRY := 24151;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Daegarn - On Reset - Set NPC Flag"),
(@ENTRY,0,1,2,19,0,100,0,11300,0,0,0,12,24213,4,60000,0,0,0,8,0,0,0,838.81,-4678.06,-94.182,4.04,"Daegarn - On Quest Accept - Summon Creature"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Daegarn - On Quest Accept - Set Event Phase"),
(@ENTRY,0,3,5,60,0,100,0,600000,600000,600000,600000,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Daegarn - On Update - Set Event Phase"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Daegarn - On Update - Set NPC Flag"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Daegarn - On Data Set - Set NPC Flag");

REPLACE INTO creature_text VALUES(24213, 0, 0, "More souls for the Lich King! Come, little ones! Come!", 14, 0, 100, 0, 0, 0, 0, 0, "Firjus the Soul Crusher");
REPLACE INTO creature_text VALUES(24215, 0, 0, "Firjus was unworthy! Test your battle progress against a true soldier of the Lich King!", 14, 0, 100, 0, 0, 0, 0, 0, "Jlarborn the Strategist");
REPLACE INTO creature_text VALUES(24214, 0, 0, "Good... More flesh for the harvest...", 14, 0, 100, 0, 0, 0, 0, 0, "Yorus the Flesh Harvester");

REPLACE INTO creature_text VALUES(23931, 0, 0, "The ring will overflow with the blood of the interlopers! Oluf has come!", 14, 0, 100, 0, 0, 0, 0, 0, "Oluf the Violent");
REPLACE INTO creature_text VALUES(23931, 1, 0, "The ancient cipher falls to the ground.", 41, 0, 100, 0, 0, 0, 0, 0, "Oluf the Violent");

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(24253, 24254, 24255);
DELETE FROM smart_scripts WHERE entryorguid IN(24253, 24254, 24255) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(24253*100, 24253*100+1, 24253*100+2, 24253*100+3, 24253*100+4, 24253*100+5) AND source_type=9;
INSERT INTO smart_scripts VALUES (24253*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 798.32, -4729.38, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 789.1, -4726.35, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 788.04, -4716.94, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253*100+3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 794.88, -4711.5, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253*100+4, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 805.42, -4717, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253*100+5, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 807.04, -4731.29, -96.23, 0, 'Dragonflyer Prisoner - Script9 - Move To Pos');
INSERT INTO smart_scripts VALUES (24253, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Respawn - Set Unit Flag');
INSERT INTO smart_scripts VALUES (24253, 0, 1, 2, 38, 0, 100, 1, 5, 5, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 186641, 5, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Activate Gameobjec');
INSERT INTO smart_scripts VALUES (24253, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Set Event Phase');
INSERT INTO smart_scripts VALUES (24253, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 88, 24253*100, 24253*100+5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Call Random Range Script');
INSERT INTO smart_scripts VALUES (24253, 0, 4, 5, 60, 1, 100, 1, 4000, 4000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Remove Unit Flag');
INSERT INTO smart_scripts VALUES (24253, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Upate - Move Random');
INSERT INTO smart_scripts VALUES (24253, 0, 6, 0, 61, 1, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Despawn');
INSERT INTO smart_scripts VALUES (24253, 0, 7, 0, 7, 1, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Evade - Despawn');
INSERT INTO smart_scripts VALUES (24254, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Respawn - Set Unit Flag');
INSERT INTO smart_scripts VALUES (24254, 0, 1, 2, 38, 0, 100, 1, 5, 5, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 186641, 5, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Activate Gameobjec');
INSERT INTO smart_scripts VALUES (24254, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Set Event Phase');
INSERT INTO smart_scripts VALUES (24254, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 88, 24253*100, 24253*100+5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Call Random Range Script');
INSERT INTO smart_scripts VALUES (24254, 0, 4, 5, 60, 1, 100, 1, 4000, 4000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Remove Unit Flag');
INSERT INTO smart_scripts VALUES (24254, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Upate - Move Random');
INSERT INTO smart_scripts VALUES (24254, 0, 6, 0, 61, 1, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Despawn');
INSERT INTO smart_scripts VALUES (24254, 0, 7, 0, 7, 1, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Evade - Despawn');
INSERT INTO smart_scripts VALUES (24255, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Respawn - Set Unit Flag');
INSERT INTO smart_scripts VALUES (24255, 0, 1, 2, 38, 0, 100, 1, 5, 5, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 186641, 5, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Activate Gameobjec');
INSERT INTO smart_scripts VALUES (24255, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Set Event Phase');
INSERT INTO smart_scripts VALUES (24255, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 88, 24253*100, 24253*100+5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Data Set - Call Random Range Script');
INSERT INTO smart_scripts VALUES (24255, 0, 4, 5, 60, 1, 100, 1, 4000, 4000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Remove Unit Flag');
INSERT INTO smart_scripts VALUES (24255, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Upate - Move Random');
INSERT INTO smart_scripts VALUES (24255, 0, 6, 0, 61, 1, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Update - Despawn');
INSERT INTO smart_scripts VALUES (24255, 0, 7, 0, 7, 1, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonflyer Prisoner - On Evade - Despawn');
DELETE FROM conditions WHERE SourceEntry IN(24253, 24254, 24255) AND SourceTypeOrReferenceId=22;
INSERT INTO conditions VALUES(22, 2, 24253, 0, 0, 30, 1, 186641, 5, 0, 0, 0, 0, '', 'Target RoJ Cage');
INSERT INTO conditions VALUES(22, 2, 24254, 0, 0, 30, 1, 186641, 5, 0, 0, 0, 0, '', 'Target RoJ Cage');
INSERT INTO conditions VALUES(22, 2, 24255, 0, 0, 30, 1, 186641, 5, 0, 0, 0, 0, '', 'Target RoJ Cage');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24213;
DELETE FROM smart_scripts WHERE entryorguid=24213 AND source_type=0;
INSERT INTO smart_scripts VALUES (24213, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 796.55, -4722.46, -96.145, 0, 'Firjus the Soul Crusher - On Respawn - Move To Point');
INSERT INTO smart_scripts VALUES (24213, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 5, 5, 0, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 'Firjus the Soul Crusher - On Respawn - Set Data For All npcs in range');
INSERT INTO smart_scripts VALUES (24213, 0, 2, 1, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Firjus the Soul Crusher - On Aggro - Talk');
INSERT INTO smart_scripts VALUES (24213, 0, 3, 0, 0, 0, 100, 0, 3000, 6000, 12000, 15000, 11, 15284, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Firjus the Soul Crusher - In Combat - Cast Cleave');
INSERT INTO smart_scripts VALUES (24213, 0, 4, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 43348, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Firjus the Soul Crusher - In Combat - Cast Head Crush');
INSERT INTO smart_scripts VALUES (24213, 0, 5, 0, 6, 0, 100, 1, 0, 0, 0, 0, 12, 24215, 4, 60000, 0, 0, 0, 8, 0, 0, 0, 838.81, -4678.06, -94.182, 4.04, 'Firjus the Soul Crusher - On Just Died - Summon Creature Jlarborn the Strategist');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24215;
DELETE FROM smart_scripts WHERE entryorguid=24215 AND source_type=0;
INSERT INTO smart_scripts VALUES (24215, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 796.55, -4722.46, -96.145, 0, 'Jlarborn the Strategist - On Respawn - Move To Point');
INSERT INTO smart_scripts VALUES (24215, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 5, 5, 0, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 'Jlarborn the Strategist - On Respawn - Set Data For All npcs in range');
INSERT INTO smart_scripts VALUES (24215, 0, 2, 1, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jlarborn the Strategist - On Aggro - Talk');
INSERT INTO smart_scripts VALUES (24215, 0, 3, 0, 0, 0, 100, 0, 4000, 5000, 15000, 16000, 11, 12169, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jlarborn the Strategist - In Combat - Cast Shield Block');
INSERT INTO smart_scripts VALUES (24215, 0, 4, 0, 0, 0, 100, 0, 7000, 8000, 18000, 19000, 11, 38233, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Jlarborn the Strategist - In Combat - Cast Shield Bash');
INSERT INTO smart_scripts VALUES (24215, 0, 5, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 8374, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Jlarborn the Strategist - In Combat - Cast Arcing Smash');
INSERT INTO smart_scripts VALUES (24215, 0, 6, 0, 6, 0, 100, 1, 0, 0, 0, 0, 12, 24214, 4, 60000, 0, 0, 0, 8, 0, 0, 0, 838.81, -4678.06, -94.182, 4.04, 'Jlarborn the Strategist - On Just Died - Summon Creature Yorus the Flesh Harvester');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24214;
DELETE FROM smart_scripts WHERE entryorguid=24214 AND source_type=0;
INSERT INTO smart_scripts VALUES (24214, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 796.55, -4722.46, -96.145, 0, 'Yorus the Flesh Harvester - On Respawn - Move To Point');
INSERT INTO smart_scripts VALUES (24214, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 5, 5, 0, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 'Yorus the Flesh Harvester - On Respawn - Set Data For All npcs in range');
INSERT INTO smart_scripts VALUES (24214, 0, 2, 1, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorus the Flesh Harvester - On Aggro - Talk');
INSERT INTO smart_scripts VALUES (24214, 0, 3, 0, 0, 0, 100, 0, 4000, 5000, 15000, 16000, 11, 12169, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorus the Flesh Harvester - In Combat - Cast Shield Block');
INSERT INTO smart_scripts VALUES (24214, 0, 4, 0, 0, 0, 100, 0, 7000, 8000, 18000, 19000, 11, 38233, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Yorus the Flesh Harvester - In Combat - Cast Shield Bash');
INSERT INTO smart_scripts VALUES (24214, 0, 5, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 8374, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Yorus the Flesh Harvester - In Combat - Cast Arcing Smash');
INSERT INTO smart_scripts VALUES (24214, 0, 6, 0, 6, 0, 100, 1, 0, 0, 0, 0, 12, 23931, 4, 60000, 0, 0, 0, 8, 0, 0, 0, 838.81, -4678.06, -94.182, 4.04, 'Yorus the Flesh Harvester - On Just Died - Summon Creature Oluf the Violent');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=23931;
DELETE FROM smart_scripts WHERE entryorguid=23931 AND source_type=0;
INSERT INTO smart_scripts VALUES (23931, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 796.55, -4722.46, -96.145, 0, 'Oluf the Violent - On Respawn - Move To Point');
INSERT INTO smart_scripts VALUES (23931, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 5, 5, 0, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 'Oluf the Violent - On Respawn - Set Data For All npcs in range');
INSERT INTO smart_scripts VALUES (23931, 0, 2, 1, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - On Aggro - Talk');
INSERT INTO smart_scripts VALUES (23931, 0, 3, 0, 0, 0, 100, 0, 3000, 6000, 12000, 15000, 11, 15284, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - In Combat - Cast Cleave');
INSERT INTO smart_scripts VALUES (23931, 0, 4, 0, 0, 0, 100, 0, 8000, 9000, 28000, 29000, 11, 13730, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - In Combat - Cast Demoralizing Shout');
INSERT INTO smart_scripts VALUES (23931, 0, 5, 0, 0, 0, 100, 0, 7000, 7000, 21000, 21000, 11, 6533, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - In Combat - Cast Net');
INSERT INTO smart_scripts VALUES (23931, 0, 6, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 11, 42870, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - In Combat - Cast Throw Dragonflayer Harpoon');
INSERT INTO smart_scripts VALUES (23931, 0, 7, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 41057, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - In Combat - Cast Whirlwind');
INSERT INTO smart_scripts VALUES (23931, 0, 8, 9, 6, 0, 100, 1, 0, 0, 0, 0, 50, 186640, 90000, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - On Death - Summon Ancient Cipher');
INSERT INTO smart_scripts VALUES (23931, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Oluf the Violent - On Death - Talk');
INSERT INTO smart_scripts VALUES (23931, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 24151, 100, 0, 0, 0, 0, 0, 'Oluf the Violent - On Death - Set Data');


-- Temp, Oluf will drop the Ancient Cipher


DELETE FROM creature_loot_template WHERE entry=23931 AND item=33545;
INSERT INTO `creature_loot_template` VALUES (23931, 33545, 0, 100, 0, 1, 0, 1, 1, NULL);
