UPDATE creature SET spawndist=0, MovementType=0 WHERE id=24701;
-- DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(27992, 27993));
/*DELETE FROM creature WHERE id IN(27992, 27993);
INSERT INTO creature VALUES(NULL, 27992, 571, 1, 1, 0, 0, 994.286, -5312, 175.674, 1.18682, 300, 0, 0, 26946, 0, 0, 0, 0, 0);
INSERT INTO creature VALUES(NULL, 27992, 571, 1, 1, 0, 0, 925.647, -5299.53, 175.687, 1.90241, 300, 0, 0, 26946, 0, 0, 0, 0, 0);*/
UPDATE creature_template SET spell1=43986, spell2=43997, AIName='SmartAI' WHERE entry IN(27992, 27993);
DELETE FROM smart_scripts WHERE entryorguid=27992 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=27992*100 AND source_type=9;
INSERT INTO smart_scripts VALUES(27992, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Auto Attack');
INSERT INTO smart_scripts VALUES(27992, 0, 1, 5, 38, 0, 100, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Talk');
INSERT INTO smart_scripts VALUES(27992, 0, 2, 5, 38, 0, 100, 0, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Talk');
INSERT INTO smart_scripts VALUES(27992, 0, 3, 5, 38, 0, 100, 0, 1, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Talk');
INSERT INTO smart_scripts VALUES(27992, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 27992*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Script9');
INSERT INTO smart_scripts VALUES(27992, 0, 5, 0, 31, 0, 100, 0, 43997, 0, 0, 0, 11, 43998, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit Target - Cast Spell');
INSERT INTO smart_scripts VALUES(27992*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, 24533, 4, 60000, 0, 1, 0, 8, 0, 0, 0, 970, -5250, 195, 4.5, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES(27992*100, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, 24533, 4, 60000, 0, 1, 0, 8, 0, 0, 0, 978, -5272, 204, 4.5, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES(27992*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, 24533, 4, 60000, 0, 1, 0, 8, 0, 0, 0, 956, -5267, 198, 4.5, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES(27992*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, 24533, 4, 60000, 0, 1, 0, 8, 0, 0, 0, 965, -5241, 189, 4.5, 'Script9 - Summon Creature');
UPDATE creature_template SET InhabitType=5, AIName='SmartAI' WHERE entry=24533;
REPLACE INTO creature_template_addon VALUES(24533, 0, 22657, 50331648, 1, 0, '');
DELETE FROM smart_scripts WHERE entryorguid IN(24533) AND source_type=0;
INSERT INTO smart_scripts VALUES(24533, 0, 0, 0, 0, 0, 100, 0, 500, 500, 1500, 1500, 11, 44188, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC Update - Cast Spell');
INSERT INTO smart_scripts VALUES(24533, 0, 1, 0, 8, 0, 100, 0, 43997, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'IC Spell Hit - Die');
DELETE FROM creature WHERE id=24533;
UPDATE creature_template SET flags_extra=130, AIName='SmartAI' WHERE entry IN(24538, 24646, 24647);
DELETE FROM smart_scripts WHERE entryorguid IN(24538, 24646, 24647) AND source_type=0;
INSERT INTO smart_scripts VALUES(24538, 0, 0, 1, 8, 0, 100, 0, 43990, 0, 0, 0, 33, 24538, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - kill credit');
INSERT INTO smart_scripts VALUES(24646, 0, 0, 1, 8, 0, 100, 0, 43990, 0, 0, 0, 33, 24646, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - kill credit');
INSERT INTO smart_scripts VALUES(24647, 0, 0, 1, 8, 0, 100, 0, 43990, 0, 0, 0, 33, 24647, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - kill credit');
INSERT INTO smart_scripts VALUES(24538, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Data');
INSERT INTO smart_scripts VALUES(24646, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Data');
INSERT INTO smart_scripts VALUES(24647, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 3, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Data');
INSERT INTO smart_scripts VALUES(24538, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 57931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - cast spell (fire)');
INSERT INTO smart_scripts VALUES(24646, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 57931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - cast spell (fire)');
INSERT INTO smart_scripts VALUES(24647, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 57931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - cast spell (fire)');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(43986, 43990);
INSERT INTO conditions VALUES (13, 1, 43986, 0, 0, 31, 0, 3, 24538, 0, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43986, 0, 1, 31, 0, 3, 24646, 0, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43986, 0, 2, 31, 0, 3, 24647, 0, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 0, 31, 0, 3, 24538, 0, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 1, 31, 0, 3, 24646, 0, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 2, 31, 0, 3, 24647, 0, 0, 0, 0, '', 'Target Quest Trigger');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(50331);
INSERT INTO conditions VALUES (13, 1, 50331, 0, 0, 31, 0, 3, 27992, 0, 0, 0, 0, '', 'Target Valkry Harpoon Gun');
INSERT INTO conditions VALUES (13, 1, 50331, 0, 1, 31, 0, 3, 27993, 0, 0, 0, 0, '', 'Target Valkry Harpoon Gun');


/*DELETE FROM creature_template_addon WHERE entry IN(27992, 27993);
INSERT INTO `creature_template_addon` VALUES (27992, 0, 0, 0, 0, 0, 42716);
INSERT INTO `creature_template_addon` VALUES (27993, 0, 0, 0, 0, 0, 42716);*/


-- Vrykul Harpoon Gun SAI
SET @ENTRY := 27992;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,25,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Reset - Stop Attacking"),
(@ENTRY,0,1,5,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 1 - Say Line 0"),
(@ENTRY,0,2,5,38,0,100,0,1,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 2 - Say Line 1"),
(@ENTRY,0,3,5,38,0,100,0,1,3,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 3 - Say Line 2"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - MISSING LINK - Run Script"),
(@ENTRY,0,5,0,31,0,100,0,43997,0,0,0,11,43998,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Target Spellhit 'Fiery Lance' - Cast 'Fiery Lance'"),
(@ENTRY,0,6,0,25,0,100,0,0,0,0,0,11,42716,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Reset - Cast 'Self Root Forever (No Visual)'");
