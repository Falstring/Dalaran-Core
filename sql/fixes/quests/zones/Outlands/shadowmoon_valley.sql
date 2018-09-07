-- -------------------------------------------
-- SHADOWMOON VALLEY
-- -------------------------------------------


-- Thwart the Dark Conclave -- [A][H] http://www.wowhead.com/quest=10808/thwart-the-dark-conclave
-- To Do: Increase Disrupt Dark Conclave Ritual Spell ID:38469 range from 60 to 80 yards
--        Despwan Unguarded Summoning Site GO ID: 184750 after the quest credit was given
--        Respawn Dark Conclave Ritualists on Summoned Old God Reset

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=22139;
UPDATE `smart_scripts` SET `target_param1`=22139, `target_param2`=100, `action_param2`=64 WHERE `entryorguid`=22138 AND `source_type`=0 AND `id`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=38469 AND `ElseGroup`=0;
DELETE FROM `gameobject` WHERE `id`=184750;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (22137);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22137) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22138) AND `source_type`=0 AND id IN(1,2);

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(22137, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 75, 38457, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Summoned Old God - On reset - Add Transparency'),
(22137, 0, 1, 0, 1, 8, 100, 0, 0, 0, 240000, 240000, 50, 184750, 240, 0, 0, 0, 0, 8, 0, 0, 0, -4161.259277, 1985.773804, 59.094448, 6.210211,'Summoned Old God - OOC (Phase 4) - spawn spell focus'),
(22137, 0, 2, 0, 38, 0, 100, 0, 1, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Data Set 1 1 - Increment Phase'),
(22137, 0, 3, 0, 38, 0, 100, 0, 2, 2, 0, 0, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Data Set 2 2 - Set Phase 0'),
(22137, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spawn Set Active'),
(22137, 0, 5, 6, 8, 0, 100, 0, 38482, 0, 0, 0, 33, 22137, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Give Kill Credit'),
(22137, 0, 6, 7, 61, 0, 0, 0, 0, 0, 0, 0, 11, 37281, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Cast Infernal Oversouls Wrath'),
(22137, 0, 7, 8, 61, 0, 0, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 19, 22146, 0, 0, 0, 0, 0, 0,'Summoned Old God - On Spellhit - Despawn Summoning Voidstorm'),
(22138, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 22137, 100, 0, 0, 0, 0,0,'Dark Conclave Ritualist - On Death - Set Data'),
(22138, 0, 2, 0, 11, 0, 100, 0, 0, 0, 0, 0, 45, 2, 2, 0, 0, 0, 0, 19, 22137, 100, 0, 0, 0, 0,0,'Dark Conclave Ritualist - On Respawn - Set Data');

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=37281 AND `SourceId`=0 AND `ElseGroup`IN(2,3);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 37281, 0, 2, 31, 0, 3, 22137, 0, 0, 0, 0, '', 'Infernal Oversouls Wrath targets Summoned Old God'),
(13, 1, 37281, 0, 3, 31, 0, 3, 22146, 0, 0, 0, 0, '', 'Infernal Oversouls Wrath targets Summoning Voidstorm');


-- Subdue the Subduer - [A][H] http://www.wowhead.com/quest=11090/subdue-the-subduer

SET @SUBDUER := 22357;
UPDATE creature_template SET `AIName`="SmartAI" WHERE `entry`=@SUBDUER;
DELETE FROM smart_scripts WHERE `entryorguid`=@SUBDUER AND `source_type`=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SUBDUER,0,0,0,0,0,100,0,7000,8000,30000,30000,11,41281,0,0,0,0,0,2,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Cast 'Cripple'"),
(@SUBDUER,0,1,0,0,0,100,0,1000,2000,7000,8000,11,41280,0,0,0,0,0,2,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Cast 'Shadow Bolt'"),
(@SUBDUER,0,2,0,6,0,100,0,0,0,0,0,15,11090,0,0,0,0,0,7,0,0,0,0,0,0,0,"Reth'hedron the Subduer - On Just Died - Quest Credit ''"),
(@SUBDUER,0,3,0,0,0,100,1,0,0,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 0 (No Repeat)"),
(@SUBDUER,0,4,0,0,0,100,1,5000,10000,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 1 (No Repeat)"),
(@SUBDUER,0,5,0,0,0,100,1,15000,20000,0,0,1,2,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Reth'hedron the Subduer - In Combat - Say Line 2 (No Repeat)"),
(@SUBDUER,0,6,0,2,0,100,1,0,3,0,0,1,3,4000,0,0,0,0,0,0,0,0,0,0,0,0,"Reth'hedron the Subduer - Between 0-3% Health - Say Line 3 (No Repeat)");

DELETE FROM creature_text WHERE entry=@SUBDUER;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES 
    (@SUBDUER, 0, 0, 'I WILL CRUSH YOU LIKE A GNAT!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 1, 0, 'What do you hope to accomplish from this, insect?', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 2, 0, 'You are making me angry, mortal!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer"),
    (@SUBDUER, 3, 0, 'You will regret this, mortal! Reth\'hedron will return... I will have my vengeance!', 14, 0, 100, 0, 0, 0, 0, 0, "Reth'hedron the Subduer");


-- The Soul Cannon of Reth'hedron - [A][H] http://www.wowhead.com/quest=11089/the-soul-cannon-of-rethhedron

SET @ELEMENTAL := 23100;
SET @SARTHIS := 23093;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8725);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (15, 8725, 1, 0, 0, 9, 0, 11089, 0, 0, 0, 0, 0, '', 'Only show gossip if quest taken.'),
    (15, 8725, 1, 0, 0, 29, 0, @ELEMENTAL, 100, 0, 1, 0, 0, '', 'Only show gossip if Flawless Arcane Elemental isn\'t summoned.');

DELETE FROM gossip_menu_option WHERE menu_id=8725;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES
    (8725, 1, 0, 'I am an envoy of Balthas. He has sent me to collect a flawless arcane essence.', 21627, 1, 1, 0, 0, 0, 0, '', 0);

UPDATE creature_template SET gossip_menu_id=8725, AIName="SmartAI" WHERE entry=@SARTHIS;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@SARTHIS;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SARTHIS, 0, 0, 1, 62, 0, 100, 0, 8725, 1, 0, 0, 11, 40134, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sarthis Gossip select Cast Summon Arcane Elemental'),
    (@SARTHIS, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sarthis On Gossip Select - Close Gossip');

DELETE FROM npc_text WHERE ID=11030;
INSERT INTO npc_text (ID, text0_0, text0_1, BroadcastTextID0, lang0, Probability0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, text1_0, text1_1, BroadcastTextID1, lang1, Probability1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, text2_0, text2_1, BroadcastTextID2, lang2, Probability2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, text3_0, text3_1, BroadcastTextID3, lang3, Probability3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, text4_0, text4_1, BroadcastTextID4, lang4, Probability4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, text5_0, text5_1, BroadcastTextID5, lang5, Probability5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, text6_0, text6_1, BroadcastTextID6, lang6, Probability6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, text7_0, text7_1, BroadcastTextID7, lang7, Probability7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5, VerifiedBuild)
VALUES
    (11030, 'What is it that you want?', '', 21626, 0, 1, 0, 6, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

DELETE FROM gossip_menu WHERE entry=8725 AND text_id=11030;
INSERT INTO gossip_menu (entry, text_id)
VALUES
    (8725, 11030);

DELETE FROM event_scripts WHERE id=14860;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, dataint, x, y, z, o)
VALUES
    (14860, 0, 10, @ELEMENTAL, 300000, 1, -2468.7, 4700.5, 155.82, 3.0);

UPDATE creature_template SET faction=14 WHERE entry=@ELEMENTAL;


-- What Illidan Wants, Illidan Gets... - [A][H] http://www.wowhead.com/quest=10577/what-illidan-wants-illidan-gets

DELETE FROM creature WHERE id=22102 AND guid IN(86101, 86102);

-- Quest The Fel and the Furious - 10612/10613
DELETE FROM `gameobject` WHERE `id` IN (185061, 185060, 185059);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(2134307, 185061, 530, 0, 0, 1, 1, -2672.43, 2691.78, 102.398, 2.5635, 0, 0, 0.958516, 0.285037, 300, 0, 1),
(2134308, 185060, 530, 0, 0, 1, 1, -2671, 2694.73, 102.581, 2.57921, 0, 0, 0.960726, 0.2775, 300, 0, 1),
(2134309, 185059, 530, 0, 0, 1, 1, -2668.99, 2698.53, 102.662, 2.69388, 0, 0, 0.975048, 0.221992, 300, 0, 1);

DELETE FROM `spell_scripts` WHERE `id` IN (38002, 38120, 38122, 38125, 38127, 38129);
INSERT INTO `spell_scripts` (`id`,`effindex`,`delay`,`command`,`datalong`,`datalong2`) VALUES
(38002,0,0,15,38003,2),
(38120,0,0,15,38121,2),
(38122,0,0,15,38123,2),
(38125,0,0,15,38126,2),
(38127,0,0,15,38128,2),
(38129,0,0,15,38130,2);

UPDATE `creature_template` SET `AIName`='PetAI',`unit_flags`=0, `ScriptName`='npc_fel_reaver', `spell1`=38488 WHERE `entry`=21949;

-- spellconditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (38003, 38121, 38123, 38126, 38128, 38130);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,38003,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38121,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38123,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38126,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38128,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38130,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller');

-- assign scriptname
DELETE FROM `spell_script_names` WHERE `spell_id`=38054;
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(38054, 'spell_random_rocket_missile');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=38054;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 38054, 0, 0, 31, 0, 5, 184979, 0, 0, 0, 0, '', 'Rdm Rocket - only targets Deathforged Infernal');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=38055;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(38055, 38054, 0, 'Destroy Deathforged Infernal - Random Rocket Missile');

UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=184979;
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=184979;

-- Hordequestaccept Text
-- Nakansi SAI
SET @ENTRY := 21789;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,10613,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nakansi - On Quest 'The Fel and the Furious' Taken - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=21789;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(21789, 0, 0, 'I''ve rigged a few control consoles down the slope. Get to one quickly and take control of the fel reaver! You''ll only have a limited amount of time.', 12, 0, 100, 0, 0, 0, 19666, 'Nakansi');

-- Factionupdate
UPDATE `creature_template` SET `faction`=84 WHERE  `entry`=19353;
UPDATE `creature_template` SET `faction`=14 WHERE  `entry` IN (21949, 21753);
UPDATE `creature_template` SET `faction`=90 WHERE  `entry` IN (21960, 21961, 21754);

-- DB/Quest: The summoning Chamber http://www.wowhead.com/quest=10602 (H) http://www.wowhead.com/quest=10585 (A)
UPDATE `event_scripts` SET `x`=-3367.8251, `y`=2143.94848, `z`=-8.2855, `o`=0.1641 WHERE  `id`=13980;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=37285;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(17,0,37285,0,0,29,0,21735,100,0,0,"","Do not cast 'Disrupt Summoning Ritual' near Infernal Oversoul", 1),
(17,0,37285,0,0,29,0,21210,50,0,0,"","Cast 'Disrupt Summoning Ritual' only near Invis Deathforge Caster", 0);


-- The Deadliest Trap Ever Laid - [A][H] http://www.wowhead.com/quest=11101/the-deadliest-trap-ever-laid

SET @ARCUS := 23452;
SET @SKYBREAKER := 23441;
SET @ALTARDEFENDER := 23453;

DELETE FROM creature_summon_groups WHERE summonerId=@ARCUS;
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3042.54, 832.879, -9.42804, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3048.65, 830.045, -10.5551, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3049.29, 824.519, -10.5041, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3052.54, 823.895, -10.5332, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3052.79, 819.289, -10.477, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3044.22, 836.612, -9.52011, 2.36563, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3057.13, 815.938, -10.112, 2.54627, 4, 30000);

DELETE FROM creature_text WHERE entry IN(@ARCUS, @SKYBREAKER);
INSERT INTO creature_text VALUES(@ARCUS, 0, 0, 'The Dragonmaw must be stopped...', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Arcus');
INSERT INTO creature_text VALUES(@ARCUS, 1, 0, 'Victory to the Aldor! The Dragonmaw have been defeated!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Arcus');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 0, 'BURN IT DOWN!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 1, 'KILL THEM ALL!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 2, 'For the Dragonmaw!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 3, 'Long live the Dragonmaw! Die you worthless $N!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 4, 'Your bones will break under my boot, $N', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@ARCUS;
DELETE FROM smart_scripts WHERE entryorguid=@ARCUS AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@ARCUS*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 0, 1, 19, 0, 100, 0, 11101, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Quest Accept - Remove Flags');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ARCUS*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Quest Accept - Run Script');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Reset - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Reset - Set Flags');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 4, 0, 0, 0, 100, 0, 1000, 1000, 2000, 2000, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 5, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 6, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 7, 0, 4, 0, 100, 0, 0, 0, 0, 0, 39, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Aggro - Call For Help');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Talk');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set Run');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3057, 826, -10.47, 2.5, 'Commander Arcus - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3057, 826, -10.47, 2.5, 'Commander Arcus - On Script - Move Point');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Summon Creature Group');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 828, -4.47, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 7, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3069, 822, -5.13, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 8, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3058, 832, -4.70, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 9, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3052, 843, -4.80, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 840, -4.90, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 11, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 842, -5.05, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 12, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 822, -4.67, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 13, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3067, 828, -4.70, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 14, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 844, -4.80, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 15, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 834, -4.76, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 16, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 825, -4.62, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 17, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 822, -4.49, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 18, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3069, 828, -4.98, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 19, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 834, -4.85, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 20, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3057, 822, -4.93, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 21, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3068, 832, -4.49, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 22, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3065, 834, -4.99, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 23, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3067, 828, -5.11, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 24, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Talk');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 25, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 11101, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - GroupEventHappens');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 26, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3023.1, 793.82, -8.82, 2.639, 'Commander Arcus - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 27, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set flags');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 28, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @SKYBREAKER, 50, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Despawn Target');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 29, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Evade');

UPDATE creature_template SET AIName='SmartAI', ScriptName='', InhabitType=4 WHERE entry=@SKYBREAKER;
REPLACE INTO creature_template_addon VALUES(@SKYBREAKER, 0, 20684, 50331648, 4092, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SKYBREAKER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 1, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 2, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 3, 0, 38, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On AI Init - Disable Auto Attack');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 4, 0, 0, 0, 100, 1, 500, 500, 0, 0, 79, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Set Combat Range');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 5, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On Aggro - Say Line 0');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@ALTARDEFENDER;
REPLACE INTO creature_template_addon VALUES(@ALTARDEFENDER, 0, 0, 0, 4098, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@ALTARDEFENDER AND source_type=0;
INSERT INTO smart_scripts VALUES (@ALTARDEFENDER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Altar Defender - In Combat - Cast Shoot');


-- The Deadliest Trap Ever Laid - [A][H] http://www.wowhead.com/quest=11097/the-deadliest-trap-ever-laid

SET @HOBB := 23434;
SET @SKYBREAKER := 23440;
SET @SANCTUMDEFENDER := 23435;

DELETE FROM creature_summon_groups WHERE summonerId=@HOBB;
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4083.84, 1071.03, 31.9116, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4083.11, 1075.08, 32.5654, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4079.09, 1073.98, 31.8, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4077.84, 1078.41, 32.7097, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4075.08, 1078.48, 32.4796, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4072.8, 1082.43, 33.3564, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4068.49, 1082.18, 33.0106, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4067.44, 1085.14, 33.8085, 5.25591, 4, 30000);

REPLACE INTO creature_model_info VALUES(21505, 0.5362, 2.1, 0, 0);
DELETE FROM creature_text WHERE entry IN(@HOBB, @SKYBREAKER);
INSERT INTO creature_text VALUES(@HOBB, 0, 0, 'Defenders, show these mongrels the fury of a Scryer!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb');
INSERT INTO creature_text VALUES(@HOBB, 1, 0, 'Victory to the Scryers! The Dragonmaw have been defeated!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 0, 'BURN IT DOWN!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 1, 'KILL THEM ALL!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 2, 'For the Dragonmaw!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 3, 'Long live the Dragonmaw! Die you worthless $N!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 4, 'Your bones will break under my boot, $N', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@HOBB;
DELETE FROM smart_scripts WHERE entryorguid=@HOBB AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@HOBB*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@HOBB, 0, 0, 1, 19, 0, 100, 0, 11097, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Quest Accept - Remove Flags');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @HOBB*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Quest Accept - Run Script');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Reset - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Reset - Set Flags');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 4, 0, 0, 0, 100, 0, 1000, 1000, 2000, 2000, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 5, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 6, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 7, 0, 4, 0, 100, 0, 0, 0, 0, 0, 39, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Aggro - Call For Help');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Talk');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set Run');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4077, 1087, 35.17, 5.3, 'Commander Hobb - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4077, 1087, 35.17, 5.3, 'Commander Hobb - On Script - Move Point');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Summon Creature Group');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4084, 1076, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 7, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1077, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 8, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4078, 1083, 41, 1.9, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 9, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1085, 50, 2.2, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4066, 1085, 52, 2.4, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 11, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1079, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 12, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1071, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 13, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4084, 1076, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 14, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1086, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 15, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4066, 1087, 52, 2.4, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 16, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4072, 1085, 50, 2.2, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 17, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1078, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 18, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4083, 1080, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 19, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4067, 1079, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 20, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1076, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 21, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4078, 1083, 41, 1.9, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 22, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4072, 1086, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 23, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4080, 1080, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 24, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Talk');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 25, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 11097, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - GroupEventHappens');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 26, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4106.57, 1126.79, 43.644, 5.65, 'Commander Hobb - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 27, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set flags');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 28, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @SKYBREAKER, 50, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Despawn Target');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 29, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Evade');

UPDATE creature_template SET AIName='SmartAI', ScriptName='', InhabitType=4 WHERE entry=@SKYBREAKER;
REPLACE INTO creature_template_addon VALUES(@SKYBREAKER, 0, 20684, 50331648, 4092, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SKYBREAKER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 1, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 2, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 3, 0, 38, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On AI Init - Disable Auto Attack');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 4, 0, 0, 0, 100, 1, 500, 500, 0, 0, 79, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Set Combat Range');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 5, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On Aggro - Say Line 0');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SANCTUMDEFENDER;
REPLACE INTO creature_template_addon VALUES(@SANCTUMDEFENDER, 0, 0, 0, 4098, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SANCTUMDEFENDER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SANCTUMDEFENDER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Defender - In Combat - Cast Shoot');


-- Ally of the Netherwing - [A][H] http://www.wowhead.com/quest=10870/ally-of-the-netherwing

UPDATE quest_template SET RewardChoiceItemID1=31492, RewardChoiceItemQuantity1=1, RewardChoiceItemID2=31491, RewardChoiceItemQuantity2=1, RewardChoiceItemID3=31490, RewardChoiceItemQuantity3=1, RewardChoiceItemID4=31494, RewardChoiceItemQuantity4=1, RewardChoiceItemID5=31493, RewardChoiceItemQuantity5=1 WHERE ID=10870;

-- Quest The Fel and the Furious - 10612/10613
DELETE FROM `gameobject` WHERE `id` IN (185061, 185060, 185059);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(2134307, 185061, 530, 0, 0, 1, 1, -2672.43, 2691.78, 102.398, 2.5635, 0, 0, 0.958516, 0.285037, 300, 0, 1),
(2134308, 185060, 530, 0, 0, 1, 1, -2671, 2694.73, 102.581, 2.57921, 0, 0, 0.960726, 0.2775, 300, 0, 1),
(2134309, 185059, 530, 0, 0, 1, 1, -2668.99, 2698.53, 102.662, 2.69388, 0, 0, 0.975048, 0.221992, 300, 0, 1);

DELETE FROM `spell_scripts` WHERE `id` IN (38002, 38120, 38122, 38125, 38127, 38129);
INSERT INTO `spell_scripts` (`id`,`effindex`,`delay`,`command`,`datalong`,`datalong2`) VALUES
(38002,0,0,15,38003,2),
(38120,0,0,15,38121,2),
(38122,0,0,15,38123,2),
(38125,0,0,15,38126,2),
(38127,0,0,15,38128,2),
(38129,0,0,15,38130,2);

UPDATE `creature_template` SET `AIName`='PetAI',`unit_flags`=0, `ScriptName`='npc_fel_reaver', `spell1`=38488 WHERE `entry`=21949;

-- spellconditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (38003, 38121, 38123, 38126, 38128, 38130);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,38003,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38121,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38123,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38126,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38128,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller'),
(13,1,38130,0,0,31,0,3,21949,0,0,0,0,'','Only the fel reaver sentinel can be controlled by Fel Reaver Controller');

-- assign scriptname
DELETE FROM `spell_script_names` WHERE `spell_id`=38054;
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(38054, 'spell_random_rocket_missile');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=38054;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 38054, 0, 0, 31, 0, 5, 184979, 0, 0, 0, 0, '', 'Rdm Rocket - only targets Deathforged Infernal');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=38055;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(38055, 38054, 0, 'Destroy Deathforged Infernal - Random Rocket Missile');

UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=184979;
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=184979;

-- Hordequestaccept Text
-- Nakansi SAI
SET @ENTRY := 21789;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,10613,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nakansi - On Quest 'The Fel and the Furious' Taken - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=21789;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(21789, 0, 0, 'I''ve rigged a few control consoles down the slope. Get to one quickly and take control of the fel reaver! You''ll only have a limited amount of time.', 12, 0, 100, 0, 0, 0, 19666, 'Nakansi');

-- Factionupdate
UPDATE `creature_template` SET `faction`=84 WHERE  `entry`=19353;
UPDATE `creature_template` SET `faction`=14 WHERE  `entry` IN (21949, 21753);
UPDATE `creature_template` SET `faction`=90 WHERE  `entry` IN (21960, 21961, 21754);

-- [Q] The Fel and the Furious -- http://wotlk.openwow.com/?quest=10612
-- Plexi SAI
SET @ENTRY := 21790;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,10612,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Plexi - On Quest 'The Fel and the Furious' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 2179000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.797690,"Plexi - On Script - Set Oriebtation 1.797"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"Plexi - On Script - Play Emote 25"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,0,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Plexi - On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=21790;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(21790, 0, 0, 'I''ve rigged a few control consoles down the slope. Get one quickly and take control of the fel reaver! You''ll only have a limited amount of time.', 12, 0, 100, 0, 0, 0, 19666, 'Plexi');

DELETE FROM spell_script_names WHERE spell_id=38055;
INSERT INTO spell_script_names VALUES(38055, "spell_q10612_10613_the_fel_and_the_furious");

DELETE FROM `creature_template` WHERE entry=21949;
INSERT INTO `creature_template` VALUES (21949, 0, 0, 0, 0, 0, 19215, 0, 0, 0, 'Fel Reaver Sentinel', '', NULL, 0, 70, 70, 1, 14, 0, 1.71, 1.14286, 1, 1, 0, 1400, 1900, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38488, 38006, 38055, 37920, 0, 0, 0, 0, 0, 0, 0, 0, 'PetAI', 1, 3, 1, 10, 1, 1, 7.5, 1, 0, 0, 1, 16384, 2, 'npc_fel_reaver', 12340);