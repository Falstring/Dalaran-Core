-- -------------------------------------------
-- DRAGONBLIGHT
-- -------------------------------------------


-- Heated Battle -- [A] http://www.wowhead.com/quest=12416/heated-battle [H] http://www.wowhead.com/quest=12448/heated-battle

UPDATE creature_template SET ScriptName='npc_heated_battle' WHERE entry IN(27531, 27685, 27686);


-- Fresh Remounts -- [H] http://www.wowhead.com/quest=12214/fresh-remounts

UPDATE creature_loot_template SET Chance=100 WHERE Item=37202 AND entry=27206;

SET @ENTRY := 27213;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM smart_scripts WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM smart_scripts WHERE `entryorguid`=@ENTRY*100+00 AND `source_type`=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@ENTRY,0,0,0,31,0,100,0,48297,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Target Spellhit 'Hand Over Reins' - Run Script"),
    (@ENTRY,0,1,2,28,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Set Faction 35"),
    (@ENTRY,0,2,0,61,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Set Home Position"),
    (@ENTRY,0,3,0,28,0,100,0,0,0,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Removed - Remove Flag Pacified"),
    (@ENTRY,0,4,0,27,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Boarded - Set Flag Pacified"),
    (@ENTRY,0,5,0,27,0,100,0,0,0,0,0,59,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Onslaught Warhorse - On Passenger Boarded - Set Run On"),
    (@ENTRY,0,6,0,11,0,100,0,0,0,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Respawn - Remove Flag Pacified"),
    (@ENTRY*100+00,9,0,0,0,0,100,0,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Cast 'Eject All Passengers'"),
    (@ENTRY*100+00,9,1,0,0,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Flag Not Selectable"),
    (@ENTRY*100+00,9,2,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Run Off"),
    (@ENTRY*100+00,9,3,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,3263.98,-623.401,170.712,1.0592,"Onslaught Warhorse - On Script - Move To Position"),
    (@ENTRY*100+00,9,4,0,0,0,100,0,5000,5000,0,0,45,0,1,0,0,0,0,10,98539,23837,0,0,0,0,0,"Onslaught Warhorse - On Script - Set Data 0 1"),
    (@ENTRY*100+00,9,5,0,0,0,100,0,4000,4000,0,0,11,48304,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Cast 'Fresh Remounts: Skeletal Warhorse Transform'"),
    (@ENTRY*100+00,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,3239.11,-648.268,165.651,3.71414,"Onslaught Warhorse - On Script - Move To Position"),
    (@ENTRY*100+00,9,7,0,0,0,100,0,9000,9000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - On Script - Despawn Instant");

SET @GUID := -98539;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=23837;
DELETE FROM smart_scripts WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@GUID,0,0,0,38,0,100,0,0,1,0,0,11,48298,0,0,0,0,0,19,27213,20,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 0 1 - Cast 'Fresh Remounts: Plague Spigot'");

DELETE FROM `vehicle_template_accessory` WHERE `entry`=27213;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`)
VALUES
    (27213,27206,0,0, 'Onslaught Warhorse - Onslaught Knight', 8);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=48290;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
    (17,0,48290,0,0,31,1,3,27213,0,0,0,0,'','Only Onslaught Warhorse is a target for Onslaught Riding Crop'),
    (17,0,48290,0,0,1,1,43671,0,0,1,0,0,'','Only NOT RIDDEN Onslaught Warhorse is a target for Onslaught Riding Crop');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27213);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)
VALUES
    (27213,43671,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=27213 AND `SourceEntry` IN (43671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
    (18,27213,43671,0,0,31,0,3,0,0,0,0,'','Only npcs can use Onslaught Warhorse spellclick');

-- Temporary remove the SAI from Onslaught Warhorse, at least it will make it completable.
UPDATE creature_template SET `AIName`="" WHERE `entry`=27213;    

-- Quest The Plume of Alystros - [A][H] - http://www.wowhead.com/quest=12456/the-plume-of-alystros
-- increase SpellFocus diameter
UPDATE `gameobject_template` SET `Data1`=50 WHERE  `entry`=190033;

-- assign spell script to spell of quest item
DELETE FROM `spell_script_names` WHERE `spell_id`=49566;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(49566, 'spell_skytalon_molts');

-- 
-- Quest Blightbeasts be Damned! [H] http://www.wowhead.com/quest=12072/blightbeasts-be-damned
DELETE FROM `spell_custom_attr` WHERE `entry`=47257;
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (47257, 2097152);

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(47438, 47441);
INSERT INTO conditions VALUES (13, 1, 47438, 0, 0, 31, 0, 3, 26607, 0, 0, 0, 0, '', 'Target Anub''ar Blightbeast');
INSERT INTO conditions VALUES (13, 1, 47441, 0, 0, 31, 0, 3, 26607, 0, 0, 0, 0, '', 'Target Anub''ar Blightbeast');

-- Quest Xink's Shredder  - [A][H] - http://www.wowhead.com/quest=12052/harp-on-this
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=47938;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(17,0,47938,0,0,31,1,3,26577,0,0,0,0,'','Twisting Blade requires target Coldwind Witch'),
(17,0,47938,0,1,31,1,3,26316,0,0,0,0,'','Twisting Blade requires target Crystalline Ice Elemental'),
(17,0,47938,0,2,31,1,3,26575,0,0,0,0,'','Twisting Blade requires target Coldwind Waste Huntress'),
(17,0,47938,0,3,31,1,3,26578,0,0,0,0,'','Twisting Blade requires target Coldwind Master'),
(13,1,47938,0,0,31,0,3,26577,0,0,0,0,'','Twisting Blade can hit Coldwind Witch'),
(13,1,47938,0,1,31,0,3,26316,0,0,0,0,'','Twisting Blade can hit Crystalline Ice Elemental'),
(13,1,47938,0,2,31,0,3,26575,0,0,0,0,'','Twisting Blade can hit Coldwind Waste Huntress'),
(13,1,47938,0,3,31,0,3,26578,0,0,0,0,'','Twisting Blade can hit Coldwind Master');


-- Spiritual Insight -- [A][H] http://www.wowhead.com/quest=12028/spiritual-insight

UPDATE creature_template SET flags_extra=130, AIName='', ScriptName='npc_spiritual_insight' WHERE entry=26594;
DELETE FROM spell_linked_spell WHERE spell_trigger=47190;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
    (47190, 47189, 1, "Toalu'u's Spiritual Incense");

DELETE FROM event_scripts WHERE id IN(17604, 17605, 17606, 17607, 17608, 17609);

INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
    (17604, 0, 10, 26594, 1, 0, 2686, 934, 18, 0),
    (17605, 0, 10, 26594, 1, 0, 3097, 1037, 128, 0),
    (17606, 0, 10, 26594, 1, 0, 3014, 1321, 168, 0),
    (17607, 0, 10, 26594, 1, 0, 2854, 1514, 167, 0),
    (17608, 0, 10, 26594, 1, 0, 3129, 1556, 178, 0),
    (17609, 0, 10, 26594, 1, 0, 3117, 1288, 173, 0),
    (17609, 0, 7, 12028, 0, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=26594;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
    (26594, 0, 0, "You've successfully freed your spirit! You can serve as my eyes. Together we'll get to the bottom of this.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 1, 0, "You're coming up on the village now. Keep your eyes peeled.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 2, 0, "What's happened to the lake bed? Strange power is pouring out of it.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 3, 0, "No... no! My people are all dead spirits or deranged!", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 4, 0, "Elder Mana'loa, the statue there, sees you. This is a good sign!", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight"),
    (26594, 5, 0, "Come back, $N. If you're out of your body for too long, you run the risk of not being able to return. We have much to discuss.", 15, 0, 100, 0, 0, 0, 0, 0, "Spiritual Insight");


-- Something that doesn't melt. -- [A][H] http://wotlk.openwow.com/quest=12047
-- Splintered Bone Chunk -- http://wotlk.openwow.com/item=36730
SET @OGUID := 66937;
DELETE FROM `gameobject` WHERE `id`=188441;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0 , 188441, 571, 1, 1, 4599.037, 285.0833, 95.23787, 0.4188786, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+1 , 188441, 571, 1, 1, 4556.1, 231.2934, 96.77894, 0.4537851, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+2 , 188441, 571, 1, 1, 4499.447, 108.0523, 89.83501, 3.996807, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+3 , 188441, 571, 1, 1, 4481.178, 127.8052, 88.98753, 5.044002, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+4 , 188441, 571, 1, 1, 4518.543, 226.8698, 90.04359, 4.97419, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+5 , 188441, 571, 1, 1, 4476.379, 92.48655, 88.96384, 2.321287, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+6 , 188441, 571, 1, 1, 4599.19, 760.0677, 93.87521, 5.654869, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+7, 188441, 571, 1, 1, 4593.348, 741.4844, 95.79951, 3.735006, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+8, 188441, 571, 1, 1, 4751.073, 453.6788, 130.7299, 0.6806767, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+9, 188441, 571, 1, 1, 4682.298, 401.2016, 113.0896, 0.9075702, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+10, 188441, 571, 1, 1, 4607.061, 650.2381, 99.33231, 0.3141584, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+11, 188441, 571, 1, 1, 4617.78, 647.2289, 100.198, 6.161013, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+12, 188441, 571, 1, 1, 4603.35, 646.6047, 99.39375, 3.281239, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+13, 188441, 571, 1, 1, 4601.033, 262.5729, 94.59935, 3.595379, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+14, 188441, 571, 1, 1, 4578.877, 274.382, 94.57744, 1.256636, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+15, 188441, 571, 1, 1, 4516.654, 214.9381, 90.17368, 4.76475, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+16, 188441, 571, 1, 1, 4570.082, 246.2316, 90.96891, 4.869471, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+17, 188441, 571, 1, 1, 4553.599, 249.401, 91.1224, 3.857183, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+18, 188441, 571, 1, 1, 4532.682, 221.2274, 92.86555, 5.340709, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+19, 188441, 571, 1, 1, 4505.154, 59.0905, 86.1317, 5.078908, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+20, 188441, 571, 1, 1, 4458.161, 127.8561, 89.45293, 5.881761, 0, 0, 0, 1, 120, 255, 1), 
(@OGUID+21, 188441, 571, 1, 1, 4583.655, 232.1632, 95.92954, 4.729844, 0, 0, 0, 1, 120, 255, 1); 

-- Into Hostile Territory - [A] http://www.wowhead.com/quest=12325/into-hostile-territory

SET @GRYPHON := 27661;

DELETE FROM creature_text WHERE entry=@GRYPHON;
INSERT INTO creature_text VALUES (@GRYPHON, 0, 0, 'Hang on your hat, pal! We\'re in for a bumpy ride', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');
INSERT INTO creature_text VALUES (@GRYPHON, 1, 0, 'This is your stop, pal. Safe landing!', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=27661;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (18, 27661, 48365, 0, 0, 28, 0, 12325, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

DELETE FROM vehicle_template_accessory WHERE entry=@GRYPHON;

UPDATE creature_template SET AIName="SmartAI", InhabitType=5, speed_run=2.5 WHERE entry=@GRYPHON;
DELETE FROM smart_scripts WHERE entryorguid=@GRYPHON AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@GRYPHON,0,0,1,27,0,100,0,0,0,0,0,1,0,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Say Line 0"),
    (@GRYPHON,0,1,0,61,0,100,0,0,0,0,0,53,1,27661,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Start Waypoint"),
    (@GRYPHON,0,2,3,40,0,100,0,10,27661,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Say Line 1"),
    (@GRYPHON,0,3,4,61,0,100,0,10,27661,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Remove Aura"),
    (@GRYPHON,0,4,0,61,0,100,0,10,27661,0,0,75,44795,0,0,0,0,0,17,0,30,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Add Aura 'Parachute'"),
    (@GRYPHON,0,5,0,40,0,100,0,11,27661,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 11 Reached - Despawn In 3000 ms"),
    (@GRYPHON,0,6,0,11,0,100,0,0,0,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Respawn - Set Npc Flag Spellclick");


DELETE FROM waypoints WHERE entry=@GRYPHON;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@GRYPHON, 1, 3706.73, -700.82, 218.26, 'Wintergarde Gryphon'),
    (@GRYPHON, 2, 3697.71, -724.01, 225.27, 'Wintergarde Gryphon'),
    (@GRYPHON, 3, 3717.61, -752.09, 225.80, 'Wintergarde Gryphon'),
    (@GRYPHON, 4, 3716.85, -779.71, 224.46, 'Wintergarde Gryphon'),
    (@GRYPHON, 5, 3739.56, -906.24, 199.36, 'Wintergarde Gryphon'),
    (@GRYPHON, 6, 3749.59, -1011.11, 184.11, 'Wintergarde Gryphon'),
    (@GRYPHON, 7, 3743.17, -1146.54, 175.47, 'Wintergarde Gryphon'),
    (@GRYPHON, 8, 3725.03, -1276.72, 163.01, 'Wintergarde Gryphon'),
    (@GRYPHON, 9, 3738.50, -1345.91, 161.58, 'Wintergarde Gryphon'),
    (@GRYPHON, 10, 3832.16, -1395.51, 178.19, 'Wintergarde Gryphon'),
    (@GRYPHON, 11, 3846.49, -1416.90, 163.93, 'Wintergarde Gryphon');


-- On Ruby Wings - [A][H] http://www.wowhead.com/quest=12498/on-ruby-wings

SET @ANTIOK := 28006;
SET @THIASSI := 28018;

DELETE FROM creature_text WHERE entry=@ANTIOK;
INSERT INTO creature_text VALUES (@ANTIOK, 0, 0, 'You think you''ve won, mortal? Face the unbridled power of Antiok!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell1');
INSERT INTO creature_text VALUES (@ANTIOK, 1, 0, 'Behold! The Scythe of Antiok!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell2');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 0, 'Soon, the bones of Galakrond will rise from their eternal slumber and wreak havoc upon this world!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell3');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 1, 'The Lich King demands more frost wyrms be sent to Angrathar! Meet his demands or face my wrath!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell4');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 2, 'Faster, dogs! We mustn''t relent in our assault against the interlopers!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell5');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 3, 'Attackers are upon us! Let none through to this ancient grave!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell6');
INSERT INTO creature_text VALUES (@ANTIOK, 2, 4, 'Hear me, minions! Hear your lord, Antiok! Double your efforts or pay the consequences of failure!', 14, 0, 100, 0, 0, 0, 0, 0, 'Antiok Yell7');

UPDATE creature_template SET unit_flags=4 WHERE entry=@ANTIOK;
DELETE FROM vehicle_template_accessory WHERE entry=@THIASSI;
INSERT INTO vehicle_template_accessory VALUES (@THIASSI, @ANTIOK, 0, 0, 'Thiassi the Light Bringer', 8, 0);

DELETE FROM smart_scripts WHERE entryorguid IN(@ANTIOK, @THIASSI) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@ANTIOK*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 12000, 14000, 11, 50456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - In Combat - Cast Thiassi''s Stormbolt');
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 1, 0, 0, 0, 100, 0, 9000, 9000, 15000, 19000, 11, 15593, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - In Combat - Cast War Stomp');
INSERT INTO smart_scripts VALUES (@THIASSI, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 0, 0, 0, 0, 0, 19, @ANTIOK, 10, 0, 0, 0, 0, 0, 'Thiassi the Lightning Bringer - On Death - remove unitflag from target');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 18000, 18000, 11, 32863, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - In Combat - Cast Seed of Corruption');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 1, 0, 0, 0, 100, 0, 1100, 1100, 2000, 3000, 11, 50455, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - In Combat - Cast Shadow Bolt');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 2, 0, 1, 0, 100, 0, 10000, 10000, 40000, 40000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Out of Combat - Say Line 2');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 3, 0, 2, 0, 100, 1, 0, 25, 0, 0, 11, 50497, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Between 0-25% Health - Cast Scream of Chaos');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 4, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 50472, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Just Died - Cast Drop Scythe of Antiok');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 5, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 50494, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Reset - Cast Shroud of Lightning');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 6, 0, 38, 0, 100, 0, 1, 0, 0, 0, 80, @ANTIOK*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Data Set - Run Script');
INSERT INTO smart_scripts VALUES (@ANTIOK, 0, 7, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - On Evade - Despawn');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Say Line 0');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Say Line 1');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 11, 50501, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Cast Flesh Harvest');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 50494, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Remove Aura Shroud of Lightning');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Remove Unit Flags');
INSERT INTO smart_scripts VALUES (@ANTIOK*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Grand Necrolord Antiok - Script9 - Attack Start');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=50501;
INSERT INTO conditions VALUES (13, 3, 50501, 0, 0, 31, 0, 3, 27996, 0, 0, 0, 0, '', 'Target Wyrmrest Vanquisher');


-- Harp on This! - [A][H] http://www.wowhead.com/quest=12052/harp-on-this
    
SET @ENTRY := 27061;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,85,47920,0,0,0,0,0,1,0,0,0,0,0,0,0,"Xink's Shredder - On Just Summoned - Invoker Cast 'Xink's Shredder'"),
(@ENTRY,0,1,0,16,0,100,0,47920,10,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Xink's Shredder - On Friendly Unit Missing Buff 'Xink's Shredder' - Despawn In 1000 ms");


DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceGroup=0 AND SourceEntry=47921;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 47921, 0, 0, 29, 0, 26316, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy'),
    (17, 0, 47921, 0, 1, 29, 0, 26577, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Elemental'),
    (17, 0, 47921, 0, 2, 29, 0, 26575, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy'),
    (17, 0, 47921, 0, 3, 29, 0, 26578, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy Boss');


-- All Hail Roanauk! - [H] http://www.wowhead.com/quest=12140/all-hail-roanauk

DELETE FROM smart_scripts WHERE entryorguid=26379 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (26379, 0, 0, 1, 19, 0, 100, 0, 12140, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Set Npc Flags'),
    (26379, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 91, 257, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Set Bytes 1'),
    (26379, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Say Line 1'),
    (26379, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, 26379, 0, 0, 60000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Start WP'),
    (26379, 0, 4, 0, 40, 0, 100, 0, 10, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 26810, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On reached WP10 - Set Orientation'),
    (26379, 0, 5, 0, 38, 0, 100, 0, 1, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Data Set - Despawn instant'),
    (26379, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 70, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Corpse removed - Respawn');


-- High Commander Halford Wyrmbane - [A] http://www.wowhead.com/quest=12174/high-commander-halford-wyrmbane

DELETE FROM smart_scripts WHERE entryorguid=26881 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (26881, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9527, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Palena Silvercloud - On Aggro - Summon Creature \'Enraged Hippogryph\''),
    (26881, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 12, 9527, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Palena Silvercloud - On Aggro - Summon Creature \'Enraged Hippogryph\''),
    (26881, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Palena Silvercloud - On Aggro - Say Line 0'),
    (26881, 0, 3, 0, 19, 0, 100, 0, 12174, 0, 0, 0, 11, 48013, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Palena Silvercloud - On Quest Accepted - Activate Taxi to Wintergarde Keep");

-- From the Depths of Azjol-Nerub - http://www.wowhead.com/quest=12036
DELETE FROM `areatrigger_involvedrelation` WHERE  `id`=4950;
INSERT INTO `areatrigger_involvedrelation` VALUES (4950, 12036);

DELETE FROM `smart_scripts` WHERE `entryorguid`=4950 AND `source_type`=2 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(4950, 2, 1, 0, 46, 0, 100, 0, 4950, 0, 0, 0, 15, 12036, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Trigger - Complete quest');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=4950 AND `SourceId`=2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 2, 4950, 2, 0, 9, 0, 12036, 0, 0, 0, 0, 0, '', 'Trigger - requires From the Depths of Azjol-Nerub');

-- 
-- Overlord Agmar SAI
SET @ENTRY := 26379;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,12140,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Set Npc Flag Gossip"),
(@ENTRY,0,1,2,61,0,100,0,12140,0,0,0,91,257,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Remove Flag <Unknown bytes1 (UnitStandStateType)>"),
(@ENTRY,0,2,3,61,0,100,0,12140,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Say Line 0"),
(@ENTRY,0,3,7,61,0,100,0,12140,0,0,0,53,0,26379,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Start Waypoint"),
(@ENTRY,0,4,0,40,0,100,0,10,0,0,0,66,0,0,0,0,0,0,19,26810,0,0,0,0,0,0,"Overlord Agmar - On Waypoint 10 Reached - Set Orientation Closest Creature 'Roanauk Icemist'"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Data Set 1 1 - Evade"),
(@ENTRY,0,6,9,21,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Reached Home - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,7,8,61,0,100,0,12140,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Set Active On"),
(@ENTRY,0,8,0,61,0,100,0,12140,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Quest 'All Hail Roanauk!' Taken - Run Script"),
(@ENTRY,0,9,0,61,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Reached Home - Reset All Scripts");

-- Actionlist SAI
SET @ENTRY := 2637900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,320000,320000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Agmar - On Script - Evade");

-- npc_forsaken_blight_spreader
UPDATE `creature_template` SET `ScriptName`='npc_forsaken_blight_spreader' WHERE  `entry`=26523;
UPDATE `creature` SET `spawntimesecs`=1 WHERE  `id`=26523;

-- Wastes Scavenger SAI
SET @ENTRY := 28005;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Out of Combat - Enable Combat Movement (No Repeat)"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Out of Combat - Stop Attacking (No Repeat)"),
(@ENTRY,0,2,0,1,0,100,0,2000,2000,0,0,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Out of Combat - Play Emote 35"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - MISSING LINK - Increment Phase"),
(@ENTRY,0,4,5,9,1,100,0,5,30,3000,5000,11,50403,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wastes Scavenger - Within 5-30 Range - Cast 'Bone Toss' (Phase 1)"),
(@ENTRY,0,5,0,61,1,100,0,5,30,3000,5000,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 5-30 Range - Set Sheath Ranged (Phase 1)"),
(@ENTRY,0,6,7,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 25-80 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,7,0,61,1,100,0,25,80,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 25-80 Range - Start Attacking (Phase 1)"),
(@ENTRY,0,8,9,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 0-5 Range - Enable Combat Movement (Phase 1)"),
(@ENTRY,0,9,10,61,1,100,0,0,5,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 0-5 Range - Set Sheath Melee (Phase 1)"),
(@ENTRY,0,10,0,61,1,100,0,0,5,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 0-5 Range - Start Attacking (Phase 1)"),
(@ENTRY,0,11,12,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 5-15 Range - Disable Combat Movement (Phase 1)"),
(@ENTRY,0,12,0,61,1,100,0,5,15,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - Within 5-15 Range - Stop Attacking (Phase 1)"),
(@ENTRY,0,13,0,7,0,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - On Evade - Set Sheath Melee (No Repeat)"),
(@ENTRY,0,14,0,8,0,100,0,50430,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - On Spellhit 'Devour Ghoul' - Run Script");

-- Actionlist SAI
SET @ENTRY := 2800500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,50437,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wastes Scavenger - On Script - Cast 'Devour Ghoul'"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,11,50443,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wastes Scavenger - On Script - Cast 'Nourishment'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wastes Scavenger - On Script - Despawn Instant");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (50430,50443);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,50430,0,0,31,0,3,28005,0,0,0,0,'','Devour Ghoul targets Wastes Scavenger'),
(13,3,50443,0,0,31,0,3,27996,0,0,0,0,'','Nourishment targets Wyrmrest Vanquisher');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=50430 AND `spell_effect`=50443;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(50430, 50443, 0, 'Devour Ghoul -Nourishment');

-- Saurfang the Younger SAI
SET @ENTRY := 25257;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,12500,0,0,0,68,14,0,0,0,0,0,7,0,0,0,0,0,0,0,"Saurfang the Younger - On Quest 'Return To Angrathar' Finished - Play Movie 14");

-- 
-- Thel'zan's Phylactery'
-- "Wyrmbait" SAI
SET @ENTRY := 27843;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Out of Combat - Disable Combat Movement (No Repeat)'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Out of Combat - Stop Attacking (No Repeat)'),
(@ENTRY,0,2,3,4,0,100,1,0,0,0,0,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'"Wyrmbait" - On Aggro - Cast Shoot (No Repeat)'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Aggro - Increment Phase (No Repeat)'),
(@ENTRY,0,4,5,9,1,100,0,5,30,2300,3900,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'"Wyrmbait" - Within 5-30 Range - Cast Shoot (Phase 1)'),
(@ENTRY,0,5,0,61,1,100,0,5,30,2300,3900,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 5-30 Range - Set Sheath Ranged (Phase 1)'),
(@ENTRY,0,6,7,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 25-80 Range - Enable Combat Movement (Phase 1)'),
(@ENTRY,0,7,0,61,1,100,0,25,80,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 25-80 Range - Start Attacking (Phase 1)'),
(@ENTRY,0,8,9,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 0-5 Range - Enable Combat Movement (Phase 1)'),
(@ENTRY,0,9,10,61,1,100,0,0,5,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 0-5 Range - Set Sheath Melee (Phase 1)'),
(@ENTRY,0,10,0,61,1,100,0,0,5,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 0-5 Range - Start Attacking (Phase 1)'),
(@ENTRY,0,11,12,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 5-15 Range - Disable Combat Movement (Phase 1)'),
(@ENTRY,0,12,0,61,1,100,0,5,15,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - Within 5-15 Range - Stop Attacking (Phase 1)'),
(@ENTRY,0,13,0,7,0,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Evade - Set Sheath Melee (No Repeat)'),
(@ENTRY,0,14,22,62,0,100,0,9603,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Gossip Option 0 Selected - Run Script'),
(@ENTRY,0,15,0,0,0,100,1,0,0,0,0,39,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - In Combat - Call For Help (No Repeat)'),
(@ENTRY,0,17,0,7,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Evade - Set Npc Flag Gossip'),
(@ENTRY,0,18,0,40,0,100,0,3,@ENTRY*100+00,0,0,12,26287,6,14000,0,1,0,8,0,0,0,4545.56,72.379,88.5789,1.43238,'"Wyrmbait" - On Waypoint 3 Reached - Summon Creature Icestorm'),
(@ENTRY,0,19,0,40,0,100,0,8,@ENTRY*100+00,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Waypoint 8 Reached - Set Fly Off'),
(@ENTRY,0,20,0,40,0,100,0,9,@ENTRY*100+00,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.67552,'"Wyrmbait" - On Waypoint 9 Reached - Set Orientation 1,67552'),
(@ENTRY,0,21,0,38,0,100,0,0,1,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Data Set 0 1 - Run Script'),
(@ENTRY,0,22,0,61,0,100,0,9603,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Wyrmbait" - On Gossip Option 0 Selected - Set Active On');

-- Icestorm SAI
SET @ENTRY := 26287;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,3,0,24165,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Respawn - Morph To Model 24165"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Respawn - Set Fly On"),
(@ENTRY,0,2,12,61,0,100,0,0,0,0,0,53,1,@ENTRY*100+00,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Respawn - Start Waypoint"),
(@ENTRY,0,3,0,0,0,100,0,1000,3000,3000,5000,11,47425,0,0,0,0,0,5,0,0,0,0,0,0,0,"Icestorm - In Combat - Cast 'Frost Breath'"),
(@ENTRY,0,4,11,6,0,100,0,0,0,0,0,11,49695,3,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Just Died - Cast 'Summon Thel'zan's Phylactery'"),
(@ENTRY,0,5,6,4,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,27843,100,0,0,0,0,0,"Icestorm - On Aggro - Set Data 0 1"),
(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Aggro - Set Fly Off"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Aggro - Run Script"),
(@ENTRY,0,8,0,4,0,100,0,0,0,0,0,91,50331648,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Aggro - Remove Flag <Unknown bytes1 (UnitStandStateType)>"),
(@ENTRY,0,9,0,40,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Waypoint 0 Reached - Set Home Position"),
(@ENTRY,0,10,0,40,0,100,0,5,@ENTRY*100+00,0,0,1,0,0,0,0,0,0,19,27844,0,0,0,0,0,0,"Icestorm - On Waypoint 5 Reached - Say Line 0"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Just Died - Say Line 0"),
(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icestorm - On Respawn - Set Active On");


-- Fresh Remounts
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27206) AND `source_type`=0 AND `id`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-98539, 27213) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (27213*100, 98539*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27213,0,0,0,31,0,100,1,48297,0,0,0,80,27213*100,2,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - spell_hit_target - Action list"),
(27213*100,9,0,0,0,0,100,512,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Action list - Eject All Passengers"),
(27213*100,9,1,0,0,0,100,512,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Action list - Set run off"),
(27213*100,9,2,0,0,0,100,512,0,0,0,0,29,0,0,0,0,0,0,10,98539,23837,0,0,0,0,0,"Onslaught Warhorse - Action list - Follow"),
(27213*100,9,3,0,0,0,100,512,3000,3000,0,0,45,0,1,0,0,0,0,10,98539,23837,0,0,0,0,0,"Onslaught Warhorse - Action list - set data"),
(27213*100,9,4,0,0,0,100,512,3000,3000,0,0,11,48304,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Action list - cast"),
(27213*100,9,5,0,0,0,100,512,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,3231.088135, -659.988831, 166.621277,1.059199,"Onslaught Warhorse - Action list - move to pos"),
(27213*100,9,6,0,0,0,100,512,13000,13000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Action list - Despawn"),
(27213,0,1,2,28,0,100,512,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Passenger removed - Set faction"),
(27213,0,2,0,61,0,100,512,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - Passenger removed - set pacified"),
(-98539,0,0,0,38,0,100,0,0,1,0,0,11,48298,0,0,0,0,0,19,27213,20,0,0,0,0,0,"ELM General Purpose Bunny - On data set - Cast"),
(27213,0,3,0,1,0,100,0,30000,30000,30000,30000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Warhorse - ooc - Despawn");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup` IN (4) AND `SourceEntry`=27213;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`, `ConditionTarget`) VALUES
(22,4,27213,0,1,43671,1,0,0,'','event will not trigger if the aura 43671 is missing', 1, 1),
(22,4,27213,0,1,48290,0,0,0,'','event will not trigger if the aura 48290 is missing', 1, 1);

DELETE FROM `vehicle_template_accessory` WHERE `entry`=27213;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`) VALUES
(27213,27206,0,0, 'Onslaught Warhorse - Onslaught Knight', 8);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=48290;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,48290,0,0,31,1,3,27213,0,0,0,0,'','Only Onslaught Warhorse is a target for Onslaught Riding Crop'),
(17,0,48290,0,0,1,1,43671,0,0,1,0,0,'','Only NOT RIDDEN Onslaught Warhorse is a target for Onslaught Riding Crop'),
(17,0,48290,0,0,23,1,4186,0,0,1,0,0,'','Onslaught Riding Crop cannot be used in area 4186');


DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27213);
INSERT INTO `npc_spellclick_spells` (npc_entry,spell_id,cast_flags,user_type) VALUES
(27213,43671,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=27213 AND `SourceEntry` IN (43671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,27213,43671,0,0,31,0,3,0,0,0,0,'','Only npcs can use Onslaught Warhorse spellclick');

-- Fire Upon the Waters -- http://www.wowhead.com/quest=12243/fire-upon-the-waters
SET @CGUID := 4109129;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+31;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 24110, 571, 1, 2480.52, -405.0309, 31.25292, 1.954769, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+1, 24110, 571, 1, 2485.832, -406.4011, 38.64569, 1.937315, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+2, 24110, 571, 1, 2483.247, -405.9387, 35.05476, 4.991642, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+3, 24110, 571, 1, 2477.307, -404.4191, 27.71297, 2.530727, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+4, 24110, 571, 1, 2490.05, -404.6198, 27.34736, 0, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+5, 24110, 571, 1, 2486.804, -396.4983, 37.61678, 6.248279, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+6, 24110, 571, 1, 2473.764, -403.68, 23.80915, 3.246312, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+7, 24110, 571, 1, 2489.167, -395.6806, 28.83605, 0.01745329, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+8, 24110, 571, 1, 2488.105, -403.3663, 35.30573, 2.80998, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+9, 24110, 571, 1, 2457.642, -389.6918, 23.55255, 6.143559, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+10, 24110, 571, 1, 2469.61, -402.5246, 21.45798, 4.08407, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+11, 24110, 571, 1, 2454.252, -397.5855, 51.25713, 0.03490658, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+12, 24110, 571, 1, 2457.418, -405.3847, 30.72205, 6.213372, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+13, 24110, 571, 1, 2483.101, -393.8391, 43.72463, 2.897247, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+14, 24110, 571, 1, 2455.441, -395.9613, 42.66463, 0.05235988, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+15, 24110, 571, 1, 2454.66, -404.776, 48.54633, 6.143559, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+16, 24110, 571, 1, 2458.783, -404.1076, 23.79817, 6.265732, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+17, 24110, 571, 1, 2458.11, -410.4796, 22.85155, 6.195919, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+18, 24110, 571, 1, 2481.292, -393.944, 40.58387, 4.171337, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+19, 24110, 571, 1, 2457.773, -397.1545, 31.50192, 6.195919, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+20, 24110, 571, 1, 2469.01, -396.4393, 25.475, 0.2792527, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+21, 24110, 571, 1, 2478.411, -394.4479, 36.02073, 4.223697, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+22, 24110, 571, 1, 2456.78, -389.8281, 32.9614, 0, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+23, 24110, 571, 1, 2460.665, -399.6276, 19.7543, 3.089233, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+24, 24110, 571, 1, 2476.166, -394.8342, 31.92243, 1.27409, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+25, 24110, 571, 1, 2455.731, -404.8611, 40.88202, 6.213372, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+26, 24110, 571, 1, 2460.889, -401.5321, 19.4641, 5.131268, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+27, 24110, 571, 1, 2464.679, -397.7112, 21.8534, 5.113815, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+28, 24110, 571, 1, 2464.713, -401.7634, 19.7663, 0.06981317, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+29, 24110, 571, 1, 2456.293, -412.3963, 29.24669, 6.073746, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+30, 24110, 571, 1, 2472.812, -395.45, 28.40558, 3.368485, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+31, 24110, 571, 1, 2458.6, -396.5036, 23.42054, 6.248279, 120, 0, 0); -- 24110 (Area: 4181)

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=28013;
UPDATE `creature_template` SET `AIName`='' WHERE  `entry`=28013;
DELETE FROM `creature` WHERE  `id`=28013;

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` BETWEEN -@CGUID-31 AND -@CGUID-0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-@CGUID-0, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-0, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-1, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-1, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-2, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-2, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-3, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-3, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-4, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-4, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-5, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-5, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-6, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-6, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-7, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-7, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-8, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-8, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-9, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-9, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-10, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-10, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-11, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-11, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-12, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-12, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-13, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-13, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-14, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-14, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-15, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-15, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-16, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-16, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-17, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-17, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-18, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-18, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-19, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-19, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-20, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-20, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-21, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-21, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-22, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-22, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-23, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-23, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-24, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-24, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-25, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-25, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-26, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-26, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-27, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-27, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-28, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-28, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-29, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-29, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-30, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-30, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-31, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-31, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\'');

UPDATE `conditions` SET `ConditionValue2`=24110, `Comment`='Fire Upon the Waters - spell to ELM General Purpose Bunny Large' WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=48455 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=28013 AND `ConditionValue3`=0;

-- Quest The Plume of Alystros - [A][H] - http://www.wowhead.com/quest=12456/the-plume-of-alystros
-- increase SpellFocus diameter
UPDATE `gameobject_template` SET `Data1`=100 WHERE  `entry`=190033;

-- assign spell script to spell of quest item
DELETE FROM `spell_script_names` WHERE `spell_id`=49566;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(49566, 'spell_skytalon_molts');

-- Alystros the Verdant Keeper SAI
SET @ENTRY := 27249;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,7000,6000,9000,11,51937,0,0,0,0,0,2,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - In Combat - Cast 'Talon Strike'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,16000,21000,11,51938,1,0,0,0,0,2,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - Within 0-5 Range - Cast 'Wing Beat'"),
(@ENTRY,0,2,0,0,0,100,0,2500,4000,17000,21000,11,51922,0,0,0,0,0,6,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - In Combat - Cast 'Lapsing Dream'"),
(@ENTRY,0,3,4,38,0,100,0,1,1,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Set Emote State 0"),
(@ENTRY,0,4,5,61,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,5,6,61,0,100,0,1,1,0,0,4,3605,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Play Sound 3605"),
(@ENTRY,0,6,0,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Data Set 1 1 - Start Attacking"),
(@ENTRY,0,7,0,25,0,100,0,1,1,0,0,134,100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alystros the Verdant Keeper - On Reset - Set Combat Distance 100");