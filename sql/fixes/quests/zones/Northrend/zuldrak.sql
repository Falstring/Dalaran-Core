-- -------------------------------------------
-- ZUL'DRAK
-- -------------------------------------------

-- Troll Patrol: Can You Dig It? -- [A][H] http://www.wowhead.com/quest=12588/troll-patrol-can-you-dig-it

UPDATE creature_template SET AIName='SmartAI' WHERE  entry=28330;

DELETE FROM smart_scripts WHERE entryorguid=28330 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(2833000,2833001,2833002) AND source_type=9;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28330, 0, 0, 1, 8, 0, 100, 0, 51333, 0, 120000, 120000, 33, 28330, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Give Quest Credit'),
(28330, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 70, 120, 0, 0, 0, 0, 0, 20, 190550, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Despawn GO'),
(28330, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 2833000, 2833001, 2833002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Run Random Script'),
(2833000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 1 - Cast Summon Ancient Drakkari Chest'),
(2833001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51357, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 2 - Cast Summon Spider'),
(2833002, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51370, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 3 - Cast Summon Drakkari Spectre');

DELETE FROM gameobject_template WHERE entry=190552;
INSERT INTO gameobject_template (entry, type, displayId, name, IconName, castBarCaption, unk1, faction, flags, size, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, AIName, ScriptName, VerifiedBuild) VALUES 
(190552, 3, 2450, 'Ancient Drakkari Chest', '', '', '', 94, 0, 1, 1691, 27240, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 14007);

DELETE FROM gameobject_loot_template WHERE Entry=27240;
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES 
(27240, 46369, 0, 52, 0, 1, 1, 1, 1, NULL),
(27240, 46368, 0, 47, 0, 1, 1, 1, 1, NULL),
(27240, 43851, 0, 15, 0, 1, 2, 1, 1, NULL),
(27240, 43852, 0, 14, 0, 1, 2, 1, 1, NULL),
(27240, 33470, 0, 14, 0, 1, 3, 1, 4, NULL);

-- Troll Patrol: Whatdya Want, a Medal? -- [A][H] http://www.wowhead.com/quest=12519/troll-patrol-whatdya-want-a-medal

UPDATE creature_template SET npcflag=16777216 WHERE  entry=28162;

DELETE FROM npc_spellclick_spells WHERE npc_entry=28162;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type) VALUES 
(28162, 51026, 1, 0);

DELETE FROM smart_scripts WHERE entryorguid=28162 AND source_type=0;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28162, 0, 0, 1, 8, 0, 100, 1, 51026, 0, 0, 0, 11, 61286, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast World Generic Dismount/Cancel Shapeshift'),
(28162, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50737, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast Create Drakkari Medallion'),
(28162, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Cast Create Drakkari Medallion'),
(28162, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spellhit Create Drakkari Medallion Cover - Despawn'),
(28162, 0, 4, 0, 25, 0, 100, 0, 0, 0, 0, 0, 81, 16777216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Respawn - Set NPC Flags');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=28162;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES 
(18, 28162, 51026, 0, 0, 9, 0, 12519, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

-- Troll Patrol: Done to Death -- [A][H] http://www.wowhead.com/quest=12568/troll-patrol-done-to-death

DELETE FROM smart_scripts WHERE entryorguid=28156 AND source_type=0;

INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(28156, 0, 0, 1, 8, 0, 100, 1, 51276, 0, 0, 0, 11, 59216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit \'Incinerate Corpse\' - Cast \'Burning Corpse\''),
(28156, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51279, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit - Cast \'Defeated Argent Footman KC\''),
(28156, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Defeated Argent Footman - On Spellhit - Despawn');

-- The Blessing of Zim'Rhuk - [A][H] - http://www.wowhead.com/quest=12655/the-blessing-of-zimrhuk
UPDATE `gameobject_template` SET `flags`=`flags`|0x00001000 WHERE  `entry` IN (190657, 192079, 192080);

-- Foundation for Revenge - [A][H] - http://www.wowhead.com/quest=12668/foundation-for-revenge
-- Quetz'lun Worshipper SAI
SET @ENTRY := 28747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,54594,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quetz'lun Worshipper - On Aggro - Cast 'Serpent Strike'"),
(@ENTRY,0,1,0,2,0,100,0,0,50,30000,40000,11,54601,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-50% Health - Cast 'Serpent Form'"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - On Aggro - Set Invincibility Hp 1"),
(@ENTRY,0,4,5,2,0,100,1,0,10,0,0,11,52242,0,0,0,0,0,19,28724,15,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-10% Health - Cast 'Foundation for Revenge: Soul Font Void Channel' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,0,10,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Quetz'lun Worshipper - Between 0-10% Health - Run Script (No Repeat)"),
(@ENTRY,0,6,0,6,0,100,0,0,0,0,0,33,28713,0,0,0,0,0,21,30,0,0,0,0,0,0,"Quetz'lun Worshipper - On Just Died - Quest Credit 'Foundation for Revenge'");


-- Death to the Necromagi - [A][H] http://www.wowhead.com/quest=12552/death-to-the-necromagi

UPDATE quest_template_addon SET PrevQuestID=12598 WHERE ID=12552;
UPDATE quest_template_addon SET ExclusiveGroup=0 WHERE ID=12598;

-- Scalps! -- http://wotlk.openwow.com/quest=12659
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=52090;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 52090, 0, 1, 31, 1, 3, 28465, 0, 0, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker'),
(17, 0, 52090, 0, 1, 36, 1, 0, 0, 0, 1, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28465 "Heb\'Drakkar Striker'),
(17, 0, 52090, 0, 0, 31, 1, 3, 28600, 0, 0, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28600 "Dead Heb\'Drakkar Headhunter'),
(17, 0, 52090, 0, 0, 36, 1, 0, 0, 0, 1, 173, 0, '', 'Item 38731 "Ahunae\'s Knife" targets 28600 "Dead Heb\'Drakkar Headhunter');


-- Betrayal - [A][H] http://www.wowhead.com/quest=12713/betrayal

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=51966;
INSERT INTO conditions VALUES (17, 0, 51966, 0, 0, 29, 0, 28998, 70, 0, 1, 60, 0, '', 'Requires no npc in range');
DELETE FROM creature WHERE id=28750 AND position_z>570; -- Remove mobs which shouldnt be there

DELETE FROM smart_scripts WHERE entryorguid=2899800 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2899800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, 28931, 0, 100, 0, 0, 0, 0, 'Overlord Drakuru - Script - Deswpan Trolls'),
    (2899800, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 29100, 0, 200, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6184.15, -1970.17, 586.842, 4.59022, 'Overlord Drakuru - Script - Summon Blightblood Troll 1'),
    (2899800, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6222.85, -2026.63, 586.842, 3.00197, 'Overlord Drakuru - Script - Summon Blightblood Troll 2'),
    (2899800, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6127.51, -2008.65, 586.842, 6.16101, 'Overlord Drakuru - Script - Summon Blightblood Troll 3'),
    (2899800, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 28931, 4, 300000, 0, 0, 0, 8, 0, 0, 0, 6166.28, -2065.31, 586.842, 1.44862, 'Overlord Drakuru - Script - Summon Blightblood Troll 4'),
    (2899800, 9, 7, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 8, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say'),
    (2899800, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 54089, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Cast Drop Disguise'),
    (2899800, 9, 10, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Remove Scourge Disguise from Target'),
    (2899800, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Unit Flags'),
    (2899800, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 28931, 0, 200, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Data on Blightblood Troll'),
    (2899800, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 974, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Set Faction'),
    (2899800, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - Script - Say');

DELETE FROM smart_scripts WHERE entryorguid=28503 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28503, 0, 0, 0, 62, 0, 100, 0, 9731, 1, 0, 0, 11, 52224, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 1 Selected - Cast \'Kill Credit\''),
    (28503, 0, 1, 0, 62, 0, 100, 0, 9731, 2, 0, 0, 11, 52253, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 2 Selected - Cast \'Kill Credit\''),
    (28503, 0, 2, 0, 62, 0, 100, 0, 9731, 3, 0, 0, 11, 52355, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 3 Selected - Cast \'Quest Complete Credit Credit\''),
    (28503, 0, 3, 0, 62, 0, 100, 0, 9731, 4, 0, 0, 11, 52680, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 4 Selected - Cast \'Kill Credit\''),
    (28503, 0, 4, 0, 62, 0, 100, 0, 9731, 5, 0, 0, 11, 52675, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 5 Selected - Cast \'Kill Credit\''),
    (28503, 0, 5, 6, 62, 0, 100, 0, 9731, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 0 Selected - Store Target'),
    (28503, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 85, 52863, 2, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - On Gossip Option 0 Selected - Cast Drakuru Betrayal Teleport'),
    (28503, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 28998, 4, 180000, 0, 0, 0, 8, 0, 0, 0, 6175.25, -2017.66, 590.961, 2.98451, 'Overlord Drakuru - On Gossip Option 0 Selected - Summon Drakuru');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=9731 AND SourceEntry=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 9731, 0, 0, 0, 29, 0, 28998, 200, 0, 1, 0, 0, '', 'Show gossip if Drakuru is not already summoned AND'),
    (15, 9731, 0, 0, 0, 9, 0, 12713, 0, 0, 0, 0, 0, '', 'Show gossip option only if player has taken quest 12713');

DELETE FROM gameobject_loot_template WHERE Entry=25108 AND Item=43059;
UPDATE gameobject_loot_template SET Chance=100 WHERE Entry=25108 AND Item=40425;

-- Trolls Is Gone Crazy! -- [A][H] www.wowhead.com/quest=12861/trolls-is-gone-crazy
DELETE FROM `creature` WHERE `id`=29686;


-- Zero Tolerance - [A][H] http://www.wowhead.com/quest=12686/zero-tolerance

SET @ENTRY := 28802;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,0,0,100,0,4000,4800,12000,14000,11,50361,0,0,0,0,0,2,0,0,0,0,0,0,0,"Servant of Drakuru - In Combat - Cast 'Rot Armor'"),
    (@ENTRY,0,1,2,29,0,100,0,0,0,0,0,67,1,180000,180000,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Charmed - Create Timed Event"),
    (@ENTRY,0,2,0,61,0,100,0,0,0,0,0,36,28805,0,0,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Charmed - Update Template To 'Hand of Drakuru'"),
    (@ENTRY,0,3,0,59,0,100,0,1,0,0,0,36,28802,0,0,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Timed Event 1 Triggered - Update Template To 'Servant of Drakuru'");

UPDATE creature_model_info SET BoundingRadius=1.24, CombatReach=4 WHERE DisplayID=26924;
UPDATE creature_template SET faction=42, AIName='' WHERE entry=28805;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=28805;


-- Fuel for the Fire - [A][H] http://www.wowhead.com/quest=12690/fuel-for-the-fire

SET @DRAKKARI_CHIEFTAIN := 28873;
DELETE FROM `creature_text` WHERE `entry`=@DRAKKARI_CHIEFTAIN;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
    (@DRAKKARI_CHIEFTAIN, 0, 0, 'Now you gunna die, mon!', 12, 0, 100, 0, 0, 0, 28993, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 1, 'I come to avenge my bruddas, mon!', 12, 0, 100, 0, 0, 0, 28994, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 2, 'Die, nasty scourge!', 12, 0, 100, 0, 0, 0, 28995, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 3, 'We gunna drive all da scourge outta Zul''Drak, mon - startin'' with you!', 12, 0, 100, 0, 0, 0, 28997, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 0, 'Wha?!...', 12, 0, 100, 0, 0, 0, 28998, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 1, 'Aaah....', 12, 0, 100, 0, 0, 0, 28999, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 2, 'Ooof!', 12, 0, 100, 0, 0, 0, 29000, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 3, 'Owww!', 12, 0, 100, 0, 0, 0, 29001, 0, 'Drakkari Chieftain');

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@DRAKKARI_CHIEFTAIN;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@DRAKKARI_CHIEFTAIN AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@DRAKKARI_CHIEFTAIN,0,0,1,54,0,100,0,0,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Just Summoned - Say Line 0"),
    (@DRAKKARI_CHIEFTAIN,0,1,0,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Drakkari Chieftain - On Just Summoned - Move to Player"),
    (@DRAKKARI_CHIEFTAIN,0,2,3,34,0,100,0,0,0,0,0,12,28875,3,5000,1,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached - Summon Shalewing"),
    (@DRAKKARI_CHIEFTAIN,0,3,4,61,0,100,0,0,0,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached - Say Line 1"),
    (@DRAKKARI_CHIEFTAIN,0,4,0,61,0,100,0,1,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached- Despawn Self in 3s");

UPDATE creature_template SET unit_flags=256 WHERE entry=@DRAKKARI_CHIEFTAIN;
UPDATE creature_template SET VehicleId=0, InhabitType=7, unit_flags=256 WHERE entry=28875;
UPDATE creature SET spawntimesecs=120 WHERE id=28844;
UPDATE creature SET spawntimesecs=120 WHERE id=28843;


-- Parachutes for the Argent Crusade - [A][H] http://www.wowhead.com/quest=12740/parachutes-for-the-argent-crusade

DELETE FROM `smart_scripts` WHERE `entryorguid`=28029 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28029, 0, 0, 0, 9, 0, 100, 0, 0, 5, 5000, 8000, 11, 14517, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - Within 0-5 Range - Cast \'Crusader Strike\''),
    (28029, 0, 1, 0, 0, 0, 100, 0, 7000, 11000, 20000, 24000, 11, 10326, 1, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - In Combat - Cast \'Turn Evil\''),
    (28029, 0, 2, 3, 8, 0, 100, 0, 53031, 0, 0, 0, 11, 53039, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Cast \'Deploy Parachute\''),
    (28029, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 29060, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Quest Credit \'Parachutes for the Argent Crusade\''),
    (28029, 0, 4, 0, 1, 0, 100, 0, 10000, 10000, 30000, 30000, 28, 53031, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Remove aura');


-- Wooly Justice - [A][H] http://www.wowhead.com/quest=12707/wooly-justice

UPDATE creature_template SET AIName='', ScriptName='npc_enraged_mammoth', spell1=52601, spell2=52603, npcflag=16777216 WHERE entry=28851;
UPDATE creature SET MovementType=1, spawndist=5 WHERE id=28851;
DELETE FROM smart_scripts WHERE entryorguid=28851 AND source_type=0;

UPDATE creature_template SET AIName='SmartAI' WHERE entry=28861;

DELETE FROM smart_scripts WHERE entryorguid=28861 AND source_type=0;
INSERT INTO smart_scripts VALUES (28861, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 28876, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,  'Mam''toth desciple - On death - Give credit to invoker,  if Tampered');
INSERT INTO smart_scripts VALUES (28861, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 28, 52607, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,  'Mam''toth desciple - On reset - Remove aura from trample');

DELETE FROM conditions WHERE SourceEntry=52596 AND SourceTypeOrReferenceId=17;
INSERT INTO conditions VALUES (17, 0, 52596, 0, 0, 31, 1, 3, 28851, 0, 0, 0, 0, '',  'Medallion of Mam''toth can hit only Enraged Mammoths');

DELETE FROM conditions WHERE SourceEntry=52603 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES (13, 1, 52603, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'Trample effect 1 can hit only hit Desciple of Mam''toth');
INSERT INTO conditions VALUES (13, 2, 52603, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'Trample effect 2 can hit only hit Desciple of Mam''toth');

DELETE FROM conditions WHERE SourceEntry=28861 AND SourceTypeOrReferenceId=22;
INSERT INTO conditions VALUES (22, 1, 28861, 0, 0, 1, 1, 52607, 0, 0, 0, 0, 0, '',  'Mam''toth desciple 1st event is valid only,  if has Tampered aura credit');

DELETE FROM conditions WHERE SourceEntry=52607 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES (13, 1, 52607, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'TAura effect can hit only Desciple of Mam''toth');


-- Gluttonous Lurkers - [A][H] http://www.wowhead.com/quest=12527/gluttonous-lurkers

UPDATE creature_template SET AIName='SmartAI', npcflag=16777217 WHERE entry=28202;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=28202;
INSERT INTO smart_scripts VALUES(28202, 0, 0, 0, 8, 0, 100, 0, 50926, 0, 1000, 1000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 1, 2, 64, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 85, 50926, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 56, 38380, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Add item Zul''drak Rat');

UPDATE creature_template SET AIName='SmartAI' WHERE entry=28145;
DELETE FROM smart_scripts WHERE entryorguid IN (28145,28203) AND source_type=0;
INSERT INTO smart_scripts VALUES(28145, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 17000, 27000, 11, 54470, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'In Combat - Cast Venemous Bite');
INSERT INTO smart_scripts VALUES(28145, 0, 1, 2, 23, 0, 100, 1, 50894, 5, 100, 200, 41, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On 5 stacks of 50894 - Despawn');
INSERT INTO smart_scripts VALUES(28145, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50928, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Link With Event 1 - Summon Gorged Basilisk');


UPDATE creature_template SET AIName='SmartAI', npcflag=16777217 WHERE entry=28203;
INSERT INTO smart_scripts VALUES(28203, 0, 0, 0, 8, 0, 100, 0, 50918, 0, 1000, 1000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 1, 2, 64, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 85, 50918, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 56, 38382, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Add item Basilisk Crystals');

DELETE FROM spell_script_names WHERE spell_id=50894;


-- Troll Patrol: The Alchemist's Apprentice - [A][H] http://www.wowhead.com/quest=12541/troll-patrol-the-alchemists-apprentice
-- Lab Work - [A][H] http://www.wowhead.com/quest=12557/lab-work

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(14, 15) AND SourceGroup=9668;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (14, 9668, 13097, 0, 0, 9, 0, 12541, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip 13097 if player has NOT taken quest Troll Patrol: The Alchemist\'s Apprentice AND'),
    (14, 9668, 13097, 0, 0, 9, 0, 12557, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip 13097 if player has NOT taken quest Lab Work'),
    (14, 9668, 13098, 0, 0, 9, 0, 12541, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip 13098 if player has taken quest Lab Work'),
    (14, 9668, 13119, 0, 0, 9, 0, 12557, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip 13119 if player has taken quest Troll Patrol: The Alchemist\'s Apprentice'),
    (15, 9668, 0, 0, 0, 9, 0, 12541, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip option only if player has taken quest Troll Patrol: The Alchemist\'s Apprentice AND'),
    (15, 9668, 0, 0, 0, 1, 0, 51216, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip option only if player does NOT have aura 51216');


-- Enchanted Tiki Warriors - [A][H] http://wotlk.openwow.com/quest=12708

DELETE FROM spell_script_names WHERE spell_id=54651;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (54651, 'spell_spirit_burn_aura');


-- Convocation at Zol'Heb - [A][H] http://www.wowhead.com/quest=12730/convocation-at-zolheb

DELETE FROM smart_scripts WHERE entryorguid=29028 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (29028, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Set Flag Immune To Players'),
    (29028, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 34427, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Cast \'Ethereal Teleport\''),
    (29028, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Store Targetlist'),
    (29028, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Run Script'),
    (29028, 0, 4, 0, 0, 1, 100, 0, 10000, 12000, 14000, 16000, 11, 53496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - In Combat - Cast \'Darting Flames\''),
    (29028, 0, 5, 0, 0, 1, 100, 0, 16000, 18000, 12000, 15000, 11, 53493, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - In Combat - Cast \'Incinerate\''),
    (29028, 0, 6, 7, 2, 0, 100, 1, 0, 70, 0, 0, 11, 52989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Cast \'Akali\'s Stun\' (No Repeat)'),
    (29028, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 11, 52982, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Akali\'s Immunity\''),
    (29028, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Stop Attacking (No Repeat)'),
    (29028, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Set pacified flag (No Repeat)'),
    (29028, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Set Event Phase 2 (No Repeat)'),
    (29028, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Run Script (No Repeat)'),
    (29028, 0, 12, 13, 34, 4, 100, 0, 0, 1, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0.802851, 'Prophet of Akali - On Reached Point 1 - Set Orientation 1 (Phase 4)'),
    (29028, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Reached Point 1 - Set Event Phase 0 (Phase 4)'),
    (29028, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 19, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Remove pacified flag (No Repeat)'),
    (29028, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902802, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Reached Point 1 - Run Script (Phase 4)');


DELETE FROM smart_scripts WHERE entryorguid=2902800 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 13, 190594, 0, 20, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 20, 191123, 20, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 13, 191365, 0, 20, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 20, 300221, 20, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Invoker'),
    (2902800, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 0'),
    (2902800, 9, 6, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Invoker'),
    (2902800, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 1'),
    (2902800, 9, 8, 0, 0, 0, 100, 0, 3600, 3600, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Flag Immune To Players'),
    (2902800, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Start Attacking'),
    (2902800, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 1');


DELETE FROM smart_scripts WHERE entryorguid=2902801 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902801, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6448.36, -4475.49, 451.076, 0, 'Prophet of Akali - On Script - Move To Position'),
    (2902801, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 3');


DELETE FROM smart_scripts WHERE entryorguid=2902802 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902802, 9, 0, 0, 0, 0, 100, 0, 800, 800, 0, 0, 1, 2, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 2'),
    (2902802, 9, 1, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 3'),
    (2902802, 9, 2, 0, 0, 0, 100, 0, 2400, 2400, 0, 0, 11, 52993, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Akali\'s Ritual of Annihilation\''),
    (2902802, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 4'),
    (2902802, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 12, 29050, 1, 300000, 0, 0, 0, 8, 0, 0, 0, 6355.08, -4494.31, 458.179, 0, 'Prophet of Akali - On Script - Summon Creature \'Har\'koa\''),
    (2902802, 9, 5, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902802, 9, 6, 0, 0, 0, 100, 0, 4600, 4600, 0, 0, 45, 0, 2, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 2'),
    (2902802, 9, 7, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Closest Creature \'Har\'koa\''),
    (2902802, 9, 8, 0, 0, 0, 100, 0, 1300, 1300, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 5'),
    (2902802, 9, 9, 0, 0, 0, 100, 0, 7100, 7100, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Closest Creature \'Har\'koa\''),
    (2902802, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 6'),
    (2902802, 9, 11, 0, 0, 0, 100, 0, 9500, 9500, 0, 0, 92, 0, 52993, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Interrupt Spell \'Akali\'s Ritual of Annihilation\''),
    (2902802, 9, 12, 0, 0, 0, 100, 0, 300, 300, 0, 0, 11, 53010, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Convocation at Zol\'Heb: Removef Akali\'s Stun\''),
    (2902802, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 52982, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Aura \'Akali\'s Immunity\''),
    (2902802, 9, 14, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 7'),
    (2902802, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Flag Immune To NPC\'s'),
    (2902802, 9, 16, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 1'),
    (2902802, 9, 17, 0, 0, 0, 100, 0, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Enable Combat Movement'),
    (2902802, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Start Attacking');


-- The Storm King's Vengeance - [A][H] http://www.wowhead.com/quest=12919/the-storm-kings-vengeance

SET @GYMER := 29647;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@GYMER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GYMER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GYMER,0,0,1,62,0,100,0,9852,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Close Gossip"),
(@GYMER,0,1,2,61,0,100,0,9852,2,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Say Line 7"),
(@GYMER,0,2,0,61,0,100,0,9852,2,0,0,85,55568,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Invoker Cast 'Summon Gymer (Force)'"),
(@GYMER,0,3,0,1,0,100,0,10000,20000,30000,40000,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - Out of Combat - Say Line 1");

SET @GYMER_MOUNT := 29884;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@GYMER_MOUNT;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GYMER_MOUNT AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GYMER_MOUNT,0,0,1,27,0,100,1,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Boarded - Say Line 8 (No Repeat)"),
(@GYMER_MOUNT,0,1,0,61,0,100,0,0,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Boarded - Say Line 9 (No Repeat)"),
(@GYMER_MOUNT,0,2,0,28,0,100,1,0,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Removed - Say Line 10 (No Repeat)"),
(@GYMER_MOUNT,0,3,4,54,0,100,1,0,0,0,0,11,55461,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Just Summoned - Cast 'Storm's Fury' (No Repeat)"),
(@GYMER_MOUNT,0,4,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Just Summoned - Set Reactstate Passive (No Repeat)");

DELETE FROM smart_scripts WHERE entryorguid=29647*100 AND source_type=9;

DELETE FROM spell_script_names WHERE spell_id=55430;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (55430, 'spell_gen_gymers_buddy');


-- [Quest][WoTLK][Zul'Drak] Troll Patrol (Daily) -- Add Pooling for Daily quests
SET @Pool := 370;

UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE  `ID` IN(12604,12541,12502,12509,12519,12502,12509,12519,12588,12591,12594,12557,12597,12598,12599,12564,12568,12585);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(19,20) AND`SourceEntry` IN(12541,12604,12502,12509,12519,12502,12509,12519,12588,12591,12594,12557,12597,12598,12599,12564,12568,12585);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19, 0, 12604, 0, 0, 1, 0, 51573, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has aura 51573 'On Patrol'."),
(20, 0, 12604, 0, 0, 1, 0, 51573, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has aura 51573 'On Patrol'."),
(19, 0, 12604, 0, 0, 1, 0, 53707, 0, 0, 1, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has no aura 51573 'On Patrol Heartbeat Script'."),
(20, 0, 12604, 0, 0, 1, 0, 53707, 0, 0, 1, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has no aura 51573 'On Patrol Heartbeat Script'."),
(19, 0, 12541, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12541, 0, 1, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 1, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12541, 0, 2, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 2, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12509, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12509 'Troll Patrol: Intestinal Fortitude' if player has quest Troll patrol'."),
(20, 0, 12509, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12509 'Troll Patrol: Intestinal Fortitude' if player has quest Troll patrol'."),
(19, 0, 12519, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: Whatdya Want, a Medal?' if player has quest Troll patrol'."),
(20, 0, 12519, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: Whatdya Want, a Medal?' if player has quest Troll patrol'."),
(19, 0, 12502, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12502 'Troll Patrol: High Standards' if player has quest Troll patrol'."),
(20, 0, 12502, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12502 'Troll Patrol: High Standards' if player has quest Troll patrol'."),
(19, 0, 12564, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12564 'Troll Patrol: Something for the Pain' if player has quest Troll patrol'."),
(20, 0, 12564, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12564 'Troll Patrol: Something for the Pain' if player has quest Troll patrol'."),
(19, 0, 12568, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12568 'Troll Patrol: Done to Death' if player has quest Troll patrol'."),
(20, 0, 12568, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12558 'Troll Patrol: Done to Death' if player has quest Troll patrol'."),
(19, 0, 12585, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12585 'Troll Patrol: Creature Comforts' if player has quest Troll patrol'."),
(20, 0, 12585, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12585 'Troll Patrol: Creature Comforts' if player has quest Troll patrol'."),
(19, 0, 12588, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12588 'Troll Patrol: Can You Dig It?' if player has quest Troll patrol'."),
(20, 0, 12588, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12588 'Troll Patrol: Can You Dig It?' if player has quest Troll patrol'."),
(19, 0, 12591, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12591 'Troll Patrol: Throwing Down' if player has quest Troll patrol'."),
(20, 0, 12591, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12591 'Troll Patrol: Throwing Down' if player has quest Troll patrol'."),
(19, 0, 12594, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12594 'Troll Patrol: Couldn't Care Less' if player has quest Troll patrol'."),
(20, 0, 12594, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12594 'Troll Patrol: Couldn't Care Less' if player has quest Troll patrol'."),
(19, 0, 12557, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12557 'Lab Work' if player has quest Pa'Troll'."),
(20, 0, 12557, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12557 'Lab Work' if player has quest Pa'Troll'."),
(19, 0, 12597, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12597 'Something for the Pain' if player has quest Pa'Troll'."),
(20, 0, 12597, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12597 'Something for the Pain' if player has quest Pa'Troll'."),
(19, 0, 12598, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12598 'Throwing Down' if player has quest Pa'Troll'."),
(20, 0, 12598, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12598 'Throwing Down' if player has quest Pa'Troll'."),
(19, 0, 12599, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12599 'Creature Comforts' if player has quest Pa'Troll'."),
(20, 0, 12599, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12599 'Creature Comforts' if player has quest Pa'Troll'.");
 
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`=''  WHERE `entry` =28039;
DELETE FROM `smart_scripts` WHERE `entryorguid` =28039 AND `source_type`=0;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28039, 0, 0, 1, 19, 0, 100, 0, 12596, 0, 0, 0, 85, 51506, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Pa''Troll - Invoker Cast Clear Patrol Quests'),
(28039, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 51509, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Pa''Troll - Invoker Cast Clear Patrol Quests II'),
(28039, 0, 2, 5, 19, 0, 100, 0, 12587, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 3, 5, 19, 0, 100, 0, 12501, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 4, 5, 19, 0, 100, 0, 12563, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53712, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 00'),
(28039, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53713, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 01'),
(28039, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53715, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 02'),
(28039, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53716, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 03'),
(28039, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53707, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol Heartbeat Script'),
(28039, 0, 10, 0, 20, 0, 100, 0, 12587, 0, 0, 0, 28, 51573, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Congratulations - Remove Aura On Patrol'),
(28039, 0, 11, 0, 20, 0, 100, 0, 12563, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script'),
(28039, 0, 12, 0, 20, 0, 100, 0, 12501, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script'),
(28039, 0, 13, 0, 20, 0, 100, 0, 12604, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script');

UPDATE `quest_template_addon` SET `ExclusiveGroup`=12587 WHERE  `ID`  IN(12501,12563,12587);

DELETE FROM `pool_quest` WHERE `pool_entry` IN (@Pool);

INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12587, @Pool, 'Troll Patrol'),
(12501, @Pool, 'Troll Patrol'),
(12563, @Pool, 'Troll Patrol');
    
DELETE FROM `pool_template` WHERE `entry` IN (@Pool);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@Pool, 1, 'Troll Patrol Daily Quests');

-- DB/Quest: Troll Patrol: High Standards - Add Banner Visual
UPDATE `smart_scripts` SET `link`=1 WHERE  `entryorguid`IN (28064,28304,28305) AND `source_type`=0 AND `id`=0 AND `link`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (28064,28304,28305) AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28064, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 01 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner'),
(28304, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 02 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner'),
(28305, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 02 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner');
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid` IN(109153,109501,110958);

--  DB/Quest: Troll Patrol: Can You Dig it?
SET @CGUID := 3110215;

DELETE FROM `smart_scripts` WHERE `entryorguid`IN(28162,28330,28156) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(2833000,2833001,2833002) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28330, 0, 0, 1, 8, 0, 100, 0, 51333, 0, 120000, 120000, 33, 28330, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Give Quest Credit'),
(28330, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 70, 120, 0, 0, 0, 0, 0, 20, 190550, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Despawn GO'),
(28330, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 2833000, 2833001, 2833002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Run Random Script'),
(2833000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 1 - Cast Summon Ancient Drakkari Chest'),
(2833001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51357, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 2 - Cast Summon Spider'),
(2833002, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51370, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 3 - Cast Summon Drakkari Spectre');

DELETE FROM `gameobject_template` WHERE `entry`=190552;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(190552, 3, 2450, 'Ancient Drakkari Chest', '', '', '', 94, 0, 1, 1691, 27240, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 14007);

DELETE FROM `gameobject_loot_template` WHERE `Entry`=27240;
INSERT INTO `gameobject_loot_template` (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES 
(27240, 46369, 0, 52, 0, 1, 1, 1, 1, NULL),
(27240, 46368, 0, 47, 0, 1, 1, 1, 1, NULL),
(27240, 43851, 0, 15, 0, 1, 2, 1, 1, NULL),
(27240, 43852, 0, 14, 0, 1, 2, 1, 1, NULL),
(27240, 33470, 0, 14, 0, 1, 3, 1, 4, NULL);

UPDATE `creature` SET `modelid`='19595' WHERE  `id`=28330;

DELETE FROM `gameobject` WHERE `id`=190550;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 190550, 571, 1, 1,  4994.237, -2934.52, 289.698, 4.502949,       0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 4278)
(@OGUID+1, 190550, 571, 1, 1,  4928.283, -2954.844, 289.4258, 0.3665192,    0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+2, 190550, 571, 1, 1,  4971.499, -2967.053, 290.4032, 6.021386,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+3, 190550, 571, 1, 1,  4934.217, -2988.888, 290.1517, 3.316126,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+4, 190550, 571, 1, 1,  4901.642, -3020.357, 290.4903, 3.577925,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+5, 190550, 571, 1, 1,  4936.192, -2911.305, 289.9935, 3.804818,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+6, 190550, 571, 1, 1,  4904.635, -2938.013, 290.041, 2.792527,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+7, 190550, 571, 1, 1,  4959.712, -2882.519, 290.1794, 2.495821,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+8, 190550, 571, 1, 1,  4903.988, -2988.983, 289.8607, 6.073746,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+9, 190550, 571, 1, 1,  4884.578, -2949.397, 291.4635, 6.248279,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+10, 190550, 571, 1, 1, 4867.053, -3032.317, 290.2768, 0.01745329,   0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+11, 190550, 571, 1, 1, 4875.137, -2981.573, 289.6624, 3.769911,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+12, 190550, 571, 1, 1, 4948.37, -2845.009, 289.9186, 0.2094395,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+13, 190550, 571, 1, 1, 4900.262, -2870.288, 290.5846, 2.879793,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+14, 190550, 571, 1, 1, 4889.488, -2826.498, 291.2368, 6.213372,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+15, 190550, 571, 1, 1, 4865.896, -2879.65, 291.2252, 3.124139,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+16, 190550, 571, 1, 1, 4847.792, -2933.366, 290.7986, 1.954769,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 4279)
(@OGUID+17, 190550, 571, 1, 1, 4838.494, -2962.302, 290.7893, 5.096361,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+18, 190550, 571, 1, 1, 4834.676, -3024.518, 290.9732, 5.77704,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+19, 190550, 571, 1, 1, 4834.516, -3055.432, 292.7168, 4.223697,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+20, 190550, 571, 1, 1, 4833.344, -3086.806, 290.7325, 5.183628,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+21, 190550, 571, 1, 1, 4811.373, -3122.263, 290.908, 3.787364,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+22, 190550, 571, 1, 1, 4774.604, -3146.782, 293.9535, 4.886922,     0, 0, 0, 1,      120, 255, 1); -- 190550 (Area: 0)


-- [Quest][Zul'Drak] Cocooned! -- http://www.wowhead.com/quest=12606/cocooned
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_nerubian_cocoon', `unit_flags` = 4, `flags_extra` = 66 WHERE `entry` =28413;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 28413 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=2841300 AND `source_type`=9;

-- [Quest][ZulDrak] Throwing Down -- http://wotlk.openwow.com/quest=12598
-- Nethurbian Crater KC Bunny SAI
UPDATE `creature` SET `phaseMask`=65535 WHERE  `id`=28352;
SET @ENTRY := 28352;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,51381,0,180000,180000,33,28352,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Spellhit 'Toss Grenade' - Quest Credit 'Nethurbian Crater'"),
(@ENTRY,0,1,0,61,0,100,0,51381,0,180000,180000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Spellhit 'Toss Grenade' - Run Script");

-- Add Conditions to decrease castrange of Toss Grenade (should be around 9 yards to the dummy)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=51381;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,51381,0,0,29,0,28352,9,0,0,0,0,"","Cast Toss Grenade only in 9 yards range to Nethurbian Crater KC Bunny");

-- Actionlist SAI
SET @ENTRY := 2835200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,11,44762,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Camera Shake - Med'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,75,48456,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Add Aura 'Shredder Smoke'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,7,0,0,0,100,0,9000,9000,0,0,28,48456,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Remove Aura 'Shredder Smoke'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,44,2,0,0,0,0,0,20,190555,2,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Phase 2"),
(@ENTRY,9,9,0,0,0,100,0,167000,167000,0,0,44,1,0,0,0,0,0,20,190555,2,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Phase 1"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Active Off");

-- decrease spellfocus range
UPDATE `gameobject_template` SET `Data1`=10 WHERE  `entry`=190555;

-- Toss Grenade should ignore LOS
DELETE FROM `disables` WHERE `entry`=51381 AND `flags`=64;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(0, 51381, 64, '', '', 'Ignore LOS for Toss Grenade');

-- Remove static spawned Burning Skimmer
DELETE FROM `creature` WHERE `id`=28369;

-- Burning Skimmer SAI
SET @ENTRY := 28369;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,63,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Despawn In 10000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,11,40148,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Cast 'Immolation'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Start Random Movement"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,208,1.5,1.5,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Set Speed Walk & Run 1.5");


-- Troll Patrol: Done to Death (12568)
UPDATE creature SET id=28156 WHERE id=28260;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=51276;
INSERT INTO conditions VALUES (13, 1, 51276, 0, 0, 31, 0, 3, 28156, 0, 0, 0, 0, '', '');
UPDATE creature_template SET AIName="SmartAI" WHERE entry=28156;
DELETE FROM smart_scripts WHERE entryorguid=28156 AND source_type=0;
INSERT INTO smart_scripts VALUES (28156, 0, 0, 1, 8, 0, 100, 0, 51276, 0, 0, 0, 33, 28316, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kill credit on spell hit");
INSERT INTO smart_scripts VALUES (28156, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Forced despawn linked");
INSERT INTO smart_scripts VALUES (28156, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 59216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast spell linked");

-- Troll Patrol: Whatdya Want, a Medal? (12519)
DELETE FROM npc_spellclick_spells WHERE npc_entry=28162;
INSERT INTO npc_spellclick_spells VALUES(28162, 51026, 1, 0);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=28162;
INSERT INTO conditions VALUES (18, 28162, 51026, 0, 0, 8, 0, 12519, 0, 0, 1, 0, 0, '', 'Forbidden rewarded quest for spellclick');
INSERT INTO conditions VALUES (18, 28162, 51026, 0, 0, 9, 0, 12519, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');
DELETE FROM spell_scripts WHERE id=51026;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=28162;
DELETE FROM smart_scripts WHERE entryorguid=28162 AND source_type=0;
INSERT INTO smart_scripts VALUES (28162, 0, 0, 1, 8, 0, 100, 0, 51026, 0, 0, 0, 11, 50737, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spell Hit - Cast Create Drakkari Medallion');
INSERT INTO smart_scripts VALUES (28162, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Corpse - On Spell Hit - Despawn');