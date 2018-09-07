-- Issue 8401: Anatoly will talk
SET @SASHA := 26935;
SET @ANATOLY := 26971;
SET @HORSE := 27626;
SET @TATJANA := 27627;
SET @SPELL_SHOOT := 48815;
SET @SPELL_DART := 49134;
SET @SPELL_PING := 49135;
SET @SPELL_MOUNT_HORSE := 49138;
DELETE FROM `creature` WHERE `guid` IN (118152,118160);
DELETE FROM `creature_text` WHERE `entry` IN (@SASHA,@ANATOLY);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@SASHA,0,0,'I''m old enough to shoot beasts like you right between the eyes... at twice this distance.',12,0,100,0,0,0,'Sasha'),
(@SASHA,1,0,'Don''t you dare talk about my father, monster. He was twice the man you''ll ever be.',12,0,100,0,0,0,'Sasha'),
(@SASHA,2,0,'I''d rather be dead than be one of you! You think you''re still human? You''re... animals!',12,0,100,0,0,0,'Sasha'),
(@SASHA,3,0,'Surprise, you scum!  You''re going to tell me where my sister is or I''ll put a bucketful of truesilver bullets through your wife''s heart.',12,0,100,0,0,0,'Sasha'),
(@SASHA,4,0,'Where is Anya?',12,0,100,0,0,0,'Sasha'),
(@SASHA,5,0,'There is one last thing.  I need to know where Arugal is.',12,0,100,0,0,0,'Sasha'),
(@ANATOLY,0,0,'How old are you, lass?',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,1,0,'You won''t get away with this, you know? You''re just a kid.',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,2,0,'Your father was weak, Sasha... he didn''t have the guts to do what had to be done.',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,3,0,'We''ll all end up serving the Lich King, kid. Better this way than becoming a rotten corpse.',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,4,0,'Stop!  Do not shoot!  Do not hurt Tatjana!',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,5,0,'The brat''s held prisoner in the wolf den on the other side of the mountain.  She was to be taken to Arugal.  Are we free to go now?',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,6,0,'Forgive me, Tatjana... ',12,0,100,0,0,0,'Anatoly'),
(@ANATOLY,7,0,'Nothing you can do can compare to what Arugal can do to us!  I will tear you apart myself!',12,0,100,0,0,0,'Anatoly');
DELETE FROM `vehicle_template_accessory` WHERE `entry`=@HORSE;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(@HORSE,@TATJANA,0,0,'Tatjana''s Horse',8,30000);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@HORSE;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@HORSE,@SPELL_MOUNT_HORSE,1,0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_DART,@SPELL_PING);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_SHOOT;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_SHOOT,0,0,31,0,3,@ANATOLY,0,0,0,'','Spell Shoot targets Anatoly'),
(13,1,@SPELL_DART,0,0,31,0,3,@TATJANA,0,0,0,'','Spell Tranquilizer Dart targets Tatjana'),
(13,1,@SPELL_PING,0,0,31,0,3,@HORSE,0,0,0,'','Spell Tatjana Ping effect0 targets Tatjana''s Horse');
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=@ANATOLY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@SASHA,@ANATOLY,@TATJANA);

UPDATE `creature_template` SET `speed_run`=1.28571, `AIName`='SmartAI' WHERE `entry`=@HORSE;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA,@ANATOLY,@HORSE,@TATJANA) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA*100,@ANATOLY*100,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,@HORSE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SASHA,0,0,3,38,1,100,0,0,1,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 1 (phase 1) - Say line'),
(@SASHA,0,1,3,38,1,100,0,0,2,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 2 (phase 1) - Say line'),
(@SASHA,0,2,3,38,1,100,0,0,3,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 3 (phase 1) - Say line'),
(@SASHA,0,3,0,61,1,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - Linked with events 0,1,2 (phase 1) - Set data 0 0'),
(@SASHA,0,4,5,38,0,100,0,0,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Set event phase 0'),
(@SASHA,0,5,0,61,0,100,0,0,0,0,0,80,@SASHA*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Run script'),
(@SASHA,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On reset - Set event phase 1'),
(@ANATOLY,0,0,0,1,1,100,0,10000,20000,45000,60000,87,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,0,0,1,0,0,0,0,0,0,0,'Anatoly - On update OOC (phase 1) - Run random script'),
(@ANATOLY,0,1,2,38,0,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set event phase 0'),
(@ANATOLY,0,2,3,61,0,100,0,0,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set run'),
(@ANATOLY,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4057.442,-4140.824,211.1911,0,'Anatoly - On data set 0 1 - Move to position'),
(@ANATOLY,0,4,5,34,0,100,0,0,1,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Set unit_field_bytes1 (kneel)'),
(@ANATOLY,0,5,0,61,0,100,0,0,0,0,0,80,@ANATOLY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Run script'),
(@ANATOLY,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On reset - Set event phase 1'),
(@HORSE,0,0,0,11,0,100,0,0,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spawn - Remove aura Mount Tatjana''s Horse'),
(@HORSE,0,1,2,8,0,100,0,@SPELL_PING,0,0,0,2,1812,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set faction'),
(@HORSE,0,2,3,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Stop autoattack'),
(@HORSE,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set eventphase 1'),
(@HORSE,0,4,0,8,1,100,0,@SPELL_MOUNT_HORSE,0,0,0,80,@HORSE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Mount Tatjana''s Horse (phase 1) - Run script'),
(@HORSE,0,5,6,40,0,100,0,19,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Remove aura Mount Tatjana''s Horse'),
(@HORSE,0,6,7,61,0,100,0,0,0,0,0,15,12330,0,0,0,0,0,21,2,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Quest credit'),
(@HORSE,0,7,8,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
(@HORSE,0,8,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Despawn'),
(@TATJANA,0,0,0,11,0,100,0,0,0,0,0,11,43671,0,0,0,0,0,9,@HORSE,0,5,0,0,0,0,'Tatjana - On respawn - Spellcast Ride Vehicle'),
(@TATJANA,0,1,2,8,0,100,0,@SPELL_DART,0,0,0,11,@SPELL_PING,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Spellcast Tatjana Ping'),
(@TATJANA,0,2,3,61,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set faction'),
(@TATJANA,0,3,0,61,0,100,0,0,0,0,0,18,33024,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set unit_flags'),
(@TATJANA,0,4,0,0,0,100,0,2000,6000,9000,12000,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tatjana - On update IC - Spellcast Cutdown'),
(@TATJANA,0,5,0,38,0,100,0,0,1,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On data set 0 1 - Despawn after 15 seconds'),
(@SASHA*100,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,1,0,0,0,100,0,17000,17000,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,2,0,0,0,100,0,16700,16700,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,3,0,0,0,100,0,10700,10700,0,0,11,@SPELL_SHOOT,0,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,4,0,0,0,100,0,60000,60000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set event phase 1'),
(@SASHA*100,9,5,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set data 0 0'),
(@ANATOLY*100,9,0,0,0,0,100,0,2400,2400,0,0,45,0,4,0,0,0,0,9,@SASHA,0,30,0,0,0,0,'Anatoly script 0 - Set data 0 4'),
(@ANATOLY*100,9,1,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,2,0,0,0,100,0,16800,16800,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,3,0,0,0,100,0,16800,16800,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,4,0,0,0,100,0,5000,5000,0,0,11,47457,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Spellcast Worgen Transform - Male'),
(@ANATOLY*100,9,5,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Reset unit_field_bytes1'),
(@ANATOLY*100,9,6,0,0,0,100,0,500,500,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Play emote'),
(@ANATOLY*100,9,7,0,0,0,100,0,150,150,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,8,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@TATJANA,0,10,0,0,0,0,'Anatoly script 0 - Set data 0 1'),
(@ANATOLY*100,9,9,0,0,0,100,0,1200,1200,0,0,69,0,0,0,0,0,0,8,0,0,0,4069.991,-4130.805,211.464,0,'Anatoly script 0 - Move to position'),
(@ANATOLY*100,9,10,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Despawn'),
(@ANATOLY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 1 - Say line'),
(@ANATOLY*100+1,9,1,0,0,0,100,0,2000,2000,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 1 - Set data 0 1'),
(@ANATOLY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 2 - Say line'),
(@ANATOLY*100+2,9,1,0,0,0,100,0,3500,3500,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 2 - Set data 0 1'),
(@ANATOLY*100+3,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 3 - Say line'),
(@ANATOLY*100+3,9,1,0,0,0,100,0,5000,5000,0,0,45,0,2,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 3 - Set data 0 1'),
(@ANATOLY*100+4,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 4 - Say line'),
(@ANATOLY*100+4,9,1,0,0,0,100,0,5000,5000,0,0,45,0,3,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 4 - Set data 0 1'),
(@HORSE*100,9,0,0,0,0,100,0,500,500,0,0,53,1,@HORSE,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse script - Start WP movement');


-- Tatjana SAI
SET @ENTRY := 27627;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,43671,0,0,0,0,0,9,27626,0,5,0,0,0,0,"Tatjana - On Respawn - Cast 'Ride Vehicle'"),
(@ENTRY,0,1,2,8,0,100,0,49134,0,0,0,11,49135,2,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Cast 'Tatjana Ping'"),
(@ENTRY,0,2,3,61,0,100,0,49134,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Set Faction 35"),
(@ENTRY,0,3,5,61,0,100,0,49134,0,0,0,18,33024,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Set Flag Immune To Players"),
(@ENTRY,0,4,0,0,0,100,0,2000,6000,9000,12000,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tatjana - In Combat - Cast 'Cutdown'"),
(@ENTRY,0,5,0,61,0,100,0,49134,0,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Despawn In 15000 ms");


UPDATE creature_template SET npcflag=16777216 WHERE entry=27626;


UPDATE creature_template SET faction=188, flags_extra=2 WHERE entry IN (27626, 27627);









-- Anatoly SAI
SET @ENTRY := 26971;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,1,100,0,10000,20000,45000,60000,87,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,@ENTRY*100+04,0,0,1,0,0,0,0,0,0,0,"Anatoly - Out of Combat - Run Random Script (Phase 1) (No Repeat)"),
(@ENTRY,0,1,2,38,0,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Data Set 0 1 - Set Event Phase 0"),
(@ENTRY,0,2,3,61,0,100,0,0,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Data Set 0 1 - Set Run On"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4057.44,-4140.82,211.191,0,"Anatoly - On Data Set 0 1 - Move To Position"),
(@ENTRY,0,4,5,34,0,100,0,0,1,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Reached Point 1 - Set Flag Standstate Kneel"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Reached Point 1 - Run Script"),
(@ENTRY,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Reset - Set Event Phase 1");


-- Actionlist SAI
SET @ENTRY := 2697100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2400,2400,0,0,45,0,4,0,0,0,0,9,26935,0,30,0,0,0,0,"Anatoly - On Script - Set Data 0 4"),
(@ENTRY,9,1,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Say Line 4"),
(@ENTRY,9,2,0,0,0,100,0,16800,16800,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Say Line 5"),
(@ENTRY,9,3,0,0,0,100,0,16800,16800,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Say Line 6"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,11,47457,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Cast 'Worgen Transform - Male'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Remove Flag Standstate Kneel"),
(@ENTRY,9,6,0,0,0,100,0,500,500,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Play Emote 53"),
(@ENTRY,9,7,0,0,0,100,0,150,150,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Say Line 7"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,27627,0,10,0,0,0,0,"Anatoly - On Script - Set Data 0 1"),
(@ENTRY,9,9,0,0,0,100,0,1200,1200,0,0,69,0,0,0,0,0,0,8,0,0,0,4069.99,-4130.81,211.464,0,"Anatoly - On Script - Move To Position"),
(@ENTRY,9,10,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anatoly - On Script - Despawn Instant");
