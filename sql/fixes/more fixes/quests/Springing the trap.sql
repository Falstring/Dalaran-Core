SET @CGUID := 45823; -- need 5
SET @OGUID := 5514; -- need 1

SET @SOLDIER           := 24769;
SET @KERISTRASZA       := 26237;
SET @SARAGOSA          := 26299;
SET @MALYGOS           := 26310;
SET @COLDARRA_INVISMAN := 26373;
SET @MALYGOS2          := 29655;
SET @INVISMAN          := 33087;
SET @SIGNALFIRE        := 194151;

UPDATE `creature_template` SET `inhabitType`=4 WHERE `entry`=@SOLDIER;
UPDATE `creature_template` SET `speed_walk`=3.6, `speed_run`=2.857143, `faction`=1816, `unit_flags`=832, `inhabitType`=5 WHERE `entry`=@KERISTRASZA;
UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=1.714286, `unit_flags`=768 WHERE `entry`=@SARAGOSA;
UPDATE `creature_template` SET `speed_walk`=8, `speed_run`=4.714286, `unit_flags`=832, `inhabitType`=4 WHERE `entry`=@MALYGOS;

DELETE FROM `creature_template_addon` WHERE `entry` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@KERISTRASZA,0,0,50331648,1,0,''),
(@SARAGOSA,0,0,0,1,0,'29266'),
(@MALYGOS,0,0,50331648,1,0,'65137');

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+2;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@CGUID+0,(@CGUID+0)*10,0,50331648,1,0,'65185'),
(@CGUID+1,(@CGUID+1)*10,0,50331648,1,0,'65185'),
(@CGUID+2,(@CGUID+2)*10,0,50331648,1,0,'65185');

UPDATE `creature` SET `spawntimesecs`=60 WHERE `guid`=72773;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+4;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
(@CGUID+0, @SOLDIER, 571, 1, 1, 24737, 0, 3780.585, 6961.891, 615.3891, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
(@CGUID+1, @SOLDIER, 571, 1, 1, 24737, 0, 3694.591, 6905.624, 588.2004, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
(@CGUID+2, @SOLDIER, 571, 1, 1, 24737, 0, 3715.599, 6790.909, 576.1764, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
(@CGUID+3, @MALYGOS, 571, 1, 1, 27176, 0, 3767.673, 6843.96, 544.4875, 4.066617, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CGUID+4, @INVISMAN, 571, 1, 1, 15435, 0, 4062.013, 7108.927, 170.0696, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `gameobject` WHERE `guid`=@OGUID;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID, 194152, 571, 1, 1, 4061.978, 7109.135, 170.0001, 0, 0, 0, 0, 1, -60, 255, 1, 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS,@COLDARRA_INVISMAN,@MALYGOS2,@INVISMAN);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@SIGNALFIRE;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS,@COLDARRA_INVISMAN,@MALYGOS2,@INVISMAN) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIGNALFIRE AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@KERISTRASZA*100+0,@KERISTRASZA*100+1,@KERISTRASZA*100+2,@MALYGOS*100,@MALYGOS2*100,@SIGNALFIRE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@KERISTRASZA,0,0,0,38,0,100,0,0,1,0,0,53,0,@KERISTRASZA,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On data 0 1 set - Start WP movement'),
(@KERISTRASZA,0,1,2,40,0,100,0,4,@KERISTRASZA,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 4 reached - Pause WP movement 16 seconds'),
(@KERISTRASZA,0,2,0,61,0,100,0,0,0,0,0,80,@KERISTRASZA*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 4 reached - Start script 0'),
(@KERISTRASZA,0,3,4,40,0,100,0,6,0,0,0,12,@SARAGOSA,3,40000,0,0,0,8,0,0,0,4032.4,7086.208,166.6852,4.328416, 'Keristrasza - On WP 6 reached - Summon Corpse of Saragosa'),
(@KERISTRASZA,0,4,5,61,0,100,0,0,0,0,0,55,40000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 6 reached - Pause WP movement 40 seconds'),
(@KERISTRASZA,0,5,0,61,0,100,0,0,0,0,0,80,@KERISTRASZA*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 6 reached - Start script 1'),
(@KERISTRASZA,0,6,0,38,0,100,0,0,2,0,0,69,7,0,0,0,0,0,8,0,0,0,3908.273,6578.861,170.5382,0, 'Keristrasza - On data 0 1 set - Move to position'),
(@KERISTRASZA,0,7,0,34,0,100,0,0,7,0,0,80,@KERISTRASZA*100+2,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On movement inform - Run script'),
(@KERISTRASZA,0,8,9,8,0,100,0,46886,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Frost Breath - Say line'),
(@KERISTRASZA,0,9,0,61,0,100,0,0,0,0,0,11,46882,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Frost Breath - Spellcast Ice Block'),
(@KERISTRASZA,0,10,0,8,0,100,0,46902,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Malygos Teleport - Despawn after 1 second'),
-- (@KERISTRASZA,0,10,0,11,0,100,0,0,0,0,0,28,46882,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spawn - Remove aura Ice Block'),

(@SARAGOSA,0,0,0,38,0,100,0,0,1,0,0,11,42726,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Corpse of Saragosa - On data 0 1 set - Spellcast Cosmetic - Immolation (Whole Body)'),
(@SARAGOSA,0,1,0,11,0,100,0,0,0,0,0,28,42726,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Corpse of Saragosa - On spawn - Remove aura Cosmetic - Immolation (Whole Body)'),

(@MALYGOS,0,0,1,10,0,100,1,1,30,0,0,28,65137,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On LOS OOC - Remove aura Malygos Periodic Aura'),
(@MALYGOS,0,1,0,61,0,100,0,0,0,0,0,53,0,@MALYGOS,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On LOS OOC - Start WP movement'),
(@MALYGOS,0,2,0,40,0,100,0,10,@MALYGOS,0,0,80,@MALYGOS*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On WP 10 reached - Run script'),

(@COLDARRA_INVISMAN,0,0,1,10,0,100,1,1,50,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Store targetlist'),
(@COLDARRA_INVISMAN,0,1,2,61,0,100,0,0,0,0,0,12,@KERISTRASZA,8,0,0,0,0,8,0,0,0,3908.273,6578.861,178.8921,0.5235988, 'Coldarra Spell FX InvisMan - On LOS OOC - Summon Keristrasza'),
(@COLDARRA_INVISMAN,0,2,3,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Send targetlist to Keristrasza'),
(@COLDARRA_INVISMAN,0,3,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Send data 0 2 Keristrasza'),

(@MALYGOS2,0,0,0,38,0,100,0,0,1,0,0,80,@MALYGOS2*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On data 0 1 set - Run script'),

(@INVISMAN,0,0,1,8,0,100,0,62272,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Store target'),
(@INVISMAN,0,1,2,61,0,100,0,0,0,0,0,12,@KERISTRASZA,8,60000,0,0,0,8,0,0,0,4098.674,7064.292,198.7698,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Summon Keristrasza'),
(@INVISMAN,0,2,3,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@KERISTRASZA,100,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Send targetlist'),
(@INVISMAN,0,3,4,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,@SIGNALFIRE,5,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Set data 0 1 Signal Fire'),
(@INVISMAN,0,4,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@KERISTRASZA,100,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Set data 0 1 Keristrasza'),

(@SIGNALFIRE,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire - On data 0 1 set - Set phasemask 2'),
(@SIGNALFIRE,1,1,0,61,0,100,0,0,0,0,0,80,@SIGNALFIRE*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire - On data 0 1 set - Run script'),

(@KERISTRASZA*100+0,9,0,0,0,0,100,0,0,0,0,0,90,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Remove unit_field_bytes1 (flying + hovering)'),
(@KERISTRASZA*100+0,9,1,0,0,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Disable fly'),
(@KERISTRASZA*100+0,9,2,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 0 - Turn to'),
(@KERISTRASZA*100+0,9,3,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 0 - Say line'),
(@KERISTRASZA*100+0,9,4,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Say line'),

(@KERISTRASZA*100+1,9,0,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
(@KERISTRASZA*100+1,9,1,0,0,0,100,0,4000,4000,0,0,11,45852,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Cosmetic - Dragon''s Breath'),
(@KERISTRASZA*100+1,9,2,0,0,0,100,0,3500,3500,0,0,45,0,1,0,0,0,0,19,@SARAGOSA,20,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
(@KERISTRASZA*100+1,9,3,0,0,0,100,0,1500,1500,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
(@KERISTRASZA*100+1,9,4,0,0,0,100,0,10000,10000,0,0,11,46853,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Malygos in Coldarra'),
(@KERISTRASZA*100+1,9,5,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Turn to'),
(@KERISTRASZA*100+1,9,6,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
(@KERISTRASZA*100+1,9,7,0,0,0,100,0,4000,4000,0,0,11,46813,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Taxi - Coldarra Ledge to Transitus Shield'),
(@KERISTRASZA*100+1,9,8,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,19,@MALYGOS2,20,0,0,0,0,0, 'Keristrasza script 1 - Set data 0 1 Malygos'),
(@KERISTRASZA*100+1,9,9,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Despawn'),

(@KERISTRASZA*100+2,9,0,0,0,0,100,0,0,0,0,0,91,50331648,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Remove unit_field_bytes1 (flying + hovering)'),
(@KERISTRASZA*100+2,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 2 - Turn to'),
(@KERISTRASZA*100+2,9,2,0,0,0,100,0,500,500,0,0,5,293,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Play emote'),
(@KERISTRASZA*100+2,9,3,0,0,0,100,0,4000,4000,0,0,11,37712,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Spellcast Keristrasza Kill Credit'),
(@KERISTRASZA*100+2,9,4,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 2 - Say line'),

(@MALYGOS*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Say line'),
(@MALYGOS*100,9,1,0,0,0,100,0,7000,7000,0,0,66,0,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Malygos script - Turn to'),
(@MALYGOS*100,9,2,0,0,0,100,0,0,0,0,0,11,46886,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Malygos script - Spellcast Frost Breath'),
(@MALYGOS*100,9,3,0,0,0,100,0,7000,7000,0,0,11,46902,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Spellcast Malygos Teleport'),
(@MALYGOS*100,9,4,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Despawn'),

(@MALYGOS2*100,9,0,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Say line'),

(@SIGNALFIRE*100,9,0,0,0,0,100,0,60000,60000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire script - Set phasemask 1');

DELETE FROM `event_scripts` WHERE `id`=17491;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(17491,0,9,@OGUID,60,0,0,0,0,0); -- Spawn burning Signal Fire

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=-46813;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-46813,46814,0,'On spellfade Taxi - Coldarra Ledge to Transitus Shield - Spellcast Coldarra to Transitus');

DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=62272;
INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES
(0,62272,64,0,0,'Disable LOS for spell Raelorasz'' Spark');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (46886,46900,46902,62272);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,46886,0,0,31,0,3,@SOLDIER,0,0,0,0,'','Spell Frost Breath targets Red Dragon Soldier'),
(13,1,46886,0,1,31,0,3,@KERISTRASZA,0,0,0,0,'','Spell Frost Breath targets Keristrasza'),
(13,1,46900,0,0,31,0,3,@MALYGOS,0,0,0,0,'','Spell Dragon Fireball targets Malygos'),
(13,1,46902,0,0,31,0,3,@KERISTRASZA,0,0,0,0,'','Spell Malygos Teleport effect0 targets Keristrasza'),
(13,1,62272,0,0,31,0,3,@INVISMAN,0,0,0,0,'','Spell Raelorasz'' Spark targets Signal Fire Invisman');

DELETE FROM `creature_text` WHERE `entry` IN (@KERISTRASZA,@MALYGOS,@MALYGOS2,@INVISMAN);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@KERISTRASZA,0,0,'Stay close to me, $n. I could not bear for any harm to come to you.',12,0,100,1,0,0,0,0,'Keristrasza'),
(@KERISTRASZA,1,0,'MALYGOS!!',14,0,100,15,0,7274,0,0,'Keristrasza'),
(@KERISTRASZA,2,0,'Come, Lord of Magic, and recover your precious consort....',14,0,100,1,0,0,0,0,'Keristrasza'),
(@KERISTRASZA,3,0,'...what remains of her!',14,0,100,0,0,0,0,0,'Keristrasza'),
(@KERISTRASZA,4,0,'Come, $n. Let us see the fruits of our efforts.',12,0,100,0,0,0,0,0,'Keristrasza'),
(@KERISTRASZA,5,0,'Hurry, $n! Flee! Live to finish what we''ve begun here....',12,0,100,0,0,0,0,0,'Keristrasza'),
(@KERISTRASZA,6,0,'Never!',14,0,100,0,0,0,0,0,'Keristrasza'),
(@MALYGOS,0,0,'Keristrasza! You''ve bested my consort... and now YOU shall take her place!',14,0,100,0,0,0,0,0,'Malygos'),
(@MALYGOS2,0,0,'Saragosa! What has become of you?',14,0,100,0,0,0,0,0,'Malygos');

DELETE FROM `waypoints` WHERE `entry` IN (@KERISTRASZA,@MALYGOS);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@KERISTRASZA, 1, 4098.674, 7064.292, 198.7698, 'Keristrasza'),
(@KERISTRASZA, 2, 4092.762, 7067.315, 193.3262, 'Keristrasza'),
(@KERISTRASZA, 3, 4079.077, 7074.162, 176.2149, 'Keristrasza'),
(@KERISTRASZA, 4, 4063.685, 7083.67, 167.8817, 'Keristrasza'),
(@KERISTRASZA, 5, 4045.307, 7083.389, 168.241, 'Keristrasza'),
(@KERISTRASZA, 6, 4040.892, 7083.875, 168.116, 'Keristrasza'),

(@MALYGOS, 1, 3736.729, 6813.358, 533.4736, 'Malygos'),
(@MALYGOS, 2, 3732.188, 6794.312, 487.0847, 'Malygos'),
(@MALYGOS, 3, 3730.688, 6769.336, 444.0849, 'Malygos'),
(@MALYGOS, 4, 3726.533, 6750.502, 398.3348, 'Malygos'),
(@MALYGOS, 5, 3725.144, 6735.662, 351.0848, 'Malygos'),
(@MALYGOS, 6, 3733.896, 6705.199, 312.0294, 'Malygos'),
(@MALYGOS, 7, 3735.563, 6692.039, 264.474, 'Malygos'),
(@MALYGOS, 8, 3739.076, 6675.249, 218.3628, 'Malygos'),
(@MALYGOS, 9, 3746.836, 6657.269, 186.8073, 'Malygos'),
(@MALYGOS,10, 3751.5, 6635.882, 186.8073, 'Malygos'),
(@MALYGOS,11, 3766.236, 6622.118, 186.8073, 'Malygos'),
(@MALYGOS,12, 3794.761, 6612.983, 186.8073, 'Malygos'),
(@MALYGOS,13, 3826.566, 6605.694, 195.7795, 'Malygos'),
(@MALYGOS,14, 3838.386, 6601.479, 199.7516, 'Malygos');

DELETE FROM `waypoint_data` WHERE `id` IN ((@CGUID+0)*10,(@CGUID+1)*10,(@CGUID+2)*10,(@CGUID+3)*10,(@CGUID+4)*10);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
((@CGUID+0)*10, 1,3780.585,6961.891,615.3891,0,0,0,0,100,0),
((@CGUID+0)*10, 2,3781.443,6961.375,615.3891,0,0,0,0,100,0),
((@CGUID+0)*10, 3,3788.726,6952.882,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10, 4,3809.698,6939.206,609.7292,0,0,0,0,100,0),
((@CGUID+0)*10, 5,3829.648,6917.982,597.0071,0,0,0,0,100,0),
((@CGUID+0)*10, 6,3845.798,6899.093,586.6738,0,0,0,0,100,0),
((@CGUID+0)*10, 7,3864.757,6857.222,572.757,0,0,0,0,100,0),
((@CGUID+0)*10, 8,3862.349,6824.601,561.4517,0,0,0,0,100,0),
((@CGUID+0)*10, 9,3850.486,6797.143,559.7294,0,0,0,0,100,0),
((@CGUID+0)*10,10,3828.732,6772.135,562.8682,0,0,0,0,100,0),
((@CGUID+0)*10,11,3795.058,6761.407,568.9792,0,0,0,0,100,0),
((@CGUID+0)*10,12,3760.513,6774.492,581.5349,0,0,0,0,100,0),
((@CGUID+0)*10,13,3720.332,6799.233,597.9792,0,0,0,0,100,0),
((@CGUID+0)*10,14,3697.16,6835.938,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,15,3681.756,6872.03,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,16,3672.802,6901.496,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,17,3672.081,6921.473,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,18,3675.869,6947.217,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,19,3696.144,6973.719,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,20,3723.596,6980.155,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,21,3761.115,6971.517,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,22,3788.726,6952.882,619.7848,0,0,0,0,100,0),
((@CGUID+0)*10,23,3809.698,6939.206,609.7292,0,0,0,0,100,0),

((@CGUID+1)*10, 1,3694.591,6905.624,588.2004,0,0,0,0,100,0),
((@CGUID+1)*10, 2,3694.486,6904.629,588.2004,0,0,0,0,100,0),
((@CGUID+1)*10, 3,3687.71,6887.773,599.449,0,0,0,0,100,0),
((@CGUID+1)*10, 4,3681.292,6860.081,599.449,0,0,0,0,100,0),
((@CGUID+1)*10, 5,3684.588,6828.854,601.2267,0,0,0,0,100,0),
((@CGUID+1)*10, 6,3702.324,6800.028,602.0601,0,0,0,0,100,0),
((@CGUID+1)*10, 7,3742.879,6774.088,612.5878,0,0,0,0,100,0),
((@CGUID+1)*10, 8,3786.845,6777.308,626.338,0,0,0,0,100,0),
((@CGUID+1)*10, 9,3803.426,6793.12,641.338,0,0,0,0,100,0),
((@CGUID+1)*10,10,3818.26,6820.016,651.0602,0,0,0,0,100,0),
((@CGUID+1)*10,11,3824.966,6848.016,656.3936,0,0,0,0,100,0),
((@CGUID+1)*10,12,3813.837,6884.006,649.3936,0,0,0,0,100,0),
((@CGUID+1)*10,13,3787.394,6910.689,636.1436,0,0,0,0,100,0),
((@CGUID+1)*10,14,3762.704,6925.763,628.9214,0,0,0,0,100,0),
((@CGUID+1)*10,15,3741.792,6934.354,621.9214,0,0,0,0,100,0),
((@CGUID+1)*10,16,3720.52,6935.709,615.1437,0,0,0,0,100,0),
((@CGUID+1)*10,17,3702.77,6929.314,607.838,0,0,0,0,100,0),
((@CGUID+1)*10,18,3692.661,6917.933,604.2271,0,0,0,0,100,0),
((@CGUID+1)*10,19,3689.077,6901.22,601.1439,0,0,0,0,100,0),
((@CGUID+1)*10,20,3687.71,6887.773,599.449,0,0,0,0,100,0),
((@CGUID+1)*10,21,3681.292,6860.081,599.449,0,0,0,0,100,0),

((@CGUID+2)*10, 1,3715.599,6790.909,576.1764,0,0,0,0,100,0),
((@CGUID+2)*10, 2,3733.311,6795.495,575.6484,0,0,0,0,100,0),
((@CGUID+2)*10, 3,3746.552,6797.681,571.1484,0,0,0,0,100,0),
((@CGUID+2)*10, 4,3758.14,6796.333,567.8428,0,0,0,0,100,0),
((@CGUID+2)*10, 5,3769.744,6788.941,566.5097,0,0,0,0,100,0),
((@CGUID+2)*10, 6,3774.698,6775.426,565.4541,0,0,0,0,100,0),
((@CGUID+2)*10, 7,3772.478,6758.345,564.0373,0,0,0,0,100,0),
((@CGUID+2)*10, 8,3761.064,6744.284,561.3151,0,0,0,0,100,0),
((@CGUID+2)*10, 9,3742.062,6734.352,558.0375,0,0,0,0,100,0),
((@CGUID+2)*10,10,3722.155,6732.545,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,11,3710.604,6738.485,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,12,3702.351,6755.943,553.5372,0,0,0,0,100,0),
((@CGUID+2)*10,13,3702.623,6781.31,558.315,0,0,0,0,100,0),
((@CGUID+2)*10,14,3710.322,6803.959,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,15,3707.133,6828.621,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,16,3694.577,6842.447,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,17,3677.345,6846.772,558.4818,0,0,0,0,100,0),
((@CGUID+2)*10,18,3658.489,6838.999,562.2039,0,0,0,0,100,0),
((@CGUID+2)*10,19,3643.681,6818.719,570.5095,0,0,0,0,100,0),
((@CGUID+2)*10,20,3640.345,6800.429,574.6765,0,0,0,0,100,0),
((@CGUID+2)*10,21,3649.234,6780.53,576.1764,0,0,0,0,100,0),
((@CGUID+2)*10,22,3662.512,6771.815,576.1764,0,0,0,0,100,0),
((@CGUID+2)*10,23,3689.853,6776.469,576.1764,0,0,0,0,100,0),
((@CGUID+2)*10,24,3715.599,6790.909,576.1764,0,0,0,0,100,0),
((@CGUID+2)*10,25,3733.311,6795.495,575.6484,0,0,0,0,100,0),
((@CGUID+2)*10,26,3746.552,6797.681,571.1484,0,0,0,0,100,0);














-- Signal Fire Invisman SAI
SET @ENTRY := 33087;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,62272,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Store Targetlist"),
(@ENTRY,0,1,2,61,0,100,0,62272,0,0,0,12,26237,8,60000,0,0,0,8,0,0,0,4098.67,7064.29,198.77,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Summon Creature 'Keristrasza'"),
(@ENTRY,0,2,3,61,0,100,0,62272,0,0,0,100,1,0,0,0,0,0,19,26237,100,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Send Target 1"),
(@ENTRY,0,3,4,61,0,100,0,62272,0,0,0,45,0,1,0,0,0,0,20,194151,5,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Set Data 0 1"),
(@ENTRY,0,4,5,61,0,100,0,62272,0,0,0,45,0,1,0,0,0,0,19,26237,100,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Set Data 0 1"),
(@ENTRY,0,5,0,61,0,100,0,62272,0,0,0,33,26237,0,0,0,0,0,7,0,0,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Quest Credit 'Springing the Trap'");
