-- Northrend Dungeons, normal and heroic bosses.

UPDATE creature_loot_template SET item=40752 WHERE item=47241 and entry IN(
30810, 
30774, 
30807, 
30788, 
30748, 
31656, 
31679, 
31673, 
30510, 
30529, 
30532,
30540,
30398,
26798,
31612,
31611,
31610,
31456,
31469,
31465,
31463,  
30258,
31464,
31362,
31350,
31349,
31360,
31507,
31510,
31508,
31511,
31509,
31512,
31506,
31370,
31365, 
31367,
30530,
31368,
29932,
31384,
31381,
28234,
31386,
31211,
31212,
31215,
31217,
32313,
31533,
31536,
31537,
31538,
31558,
31559,
31560,
31561,
28860,

31311, -- Sartharion, 10 and 25 Man.

26731, -- The Nexus / Grand Magus Telestra. 
26763, -- The Nexus / Anomalus.
26794, -- The Nexus / Ormorok the Tree-Shaper.
26723, -- The Nexus / Keristrasza.
26796, -- The Nexus / Commander Stoutbeard.
26798, -- The Nexus / Commander Kolurg.

28923, -- Halls of Lightning / Loken.
28586, -- Halls of Lightning / General Bjarngrim.
28587, -- Halls of Lightning / Volkhan.
28546, -- Halls of Lightning / Ionar.

36502, -- The Forge of Souls / Devourer of Souls.
36497, -- The Forge of Souls / Bronjahm.

36658, -- The Pit of Saron / Scourgelord Tyrannus.
36494, -- The Pit of Saron / Forgemaster Garfrost.
36476, -- The Pit of Saron / Ick.

27975, -- Halls of Stone / Maiden of Grief.
27977, -- Halls of Stone / Krystallus.
27978, -- Halls of Stone / Sjonnir The Ironshaper.

26529, -- The Culling of Stratholme / Meathook.
26530, -- The Culling of Stratholme / Salramm the Fleshcrafter.
26532, -- The Culling of Stratholme / Chrono-Lord Epoch.
26533, -- The Culling of Stratholme / Mal'Ganis.

27654, -- The Oculus / Drakos the Interrogator
27447, -- The Oculus / Varos Cloudstrider.
27655, -- The Oculus / Mage-Lord Urom.
27656, -- The Oculus / Ley-Guardian Eregos.

29315, -- The Violet Hold / Erekem.
29316, -- The Violet Hold / Moragg
29313, -- The Violet Hold / Ichoron.
29266, -- The Violet Hold / Xevozz.
29312, -- The Violet Hold / Lavanthor.
29314, -- The Violet Hold / Zuramat the Obliterator.
31134, -- The Violet Hold / Cyanigosa.

29304, -- Gundrak / Slad'Ran.
29932, -- Gundrak / Eck the Ferocious.
29307, -- Gundrak / Drakkari Colossus.
29573, -- Gundrak / Drakkari Elemental.
29306, -- Gundrak / Gal'darah.

26630, -- Drak'Tharon / Trollgore.
27483, -- Drak'Tharon / King Dred.
26632, -- Drak'Tharon / The Prophet Tharon'ja.

29311, -- Ahn'kahet / Heralz Volazj. 
30258, -- Ahn'kahet / Amanitar.
29309, -- Ahn'kahet / Elder Nadox. 
29308, -- Ahn'kahet / Prince Taldaram
29310, -- Ahn'kahet / Jedoga Shadowseeker

23953, -- Utgarde Keep / Prince Keleseth.
24200, -- Utgarde Keep / Skarvald The Constructor.
24201, -- Utgarde Keep / Dalronn the Controller.
23954, -- Utgarde Keep / Ingvar the Plunderer.

26668, -- Utgarde Pinnacle / Svala Sorrowgrave.
26687, -- Utgarde Pinnacle / Gortok Palehoof.
26693, -- Utgarde Pinnacle / Skadi the Ruthless.
26861  -- Utgarde Pinnacle / King Ymiron.
);


-- Valor Ulduar 10

UPDATE creature_loot_template SET item=40753 WHERE item=47241 and entry  IN (
33113, 
33118, 
33186, 
33293, 
32867, 
32927, 
33271, 
33288
);


-- Conquest Ulduar 25
UPDATE creature_loot_template SET item=45624 WHERE item=47241 and entry  IN (
34003, -- Flame Leviathan
33190, -- Ignis the Furnace Master
33724, -- Razorscale
33885, -- XT002
33693, -- Steelbreaker
33692, -- Runemaster Molgeim
33449, -- General Vezax
33955 -- Yogg-Saron
);

-- Valor Ulduar 10 chests.

UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry  IN(
27068, 27069, -- Hodir 10
27073, 27074, -- Thorim 10
27085, 27086, -- Mimiron 10
27080, 27081 -- Freya 10
);


UPDATE gameobject_loot_template SET item=45624 WHERE item=47241 and entry  IN(
27061, 26929, -- Kologarn

26946, 26950, -- Hodir 25

26956, 26955, -- Thorim 25 

26963, 26967, -- Mimiron 255

27079, 26962, -- Freya 25 
27030, 26974 -- Algalon 10/25
);



-- Heroism Naxx 10 - OS (Drakes + Sartharion)

UPDATE creature_loot_template SET item=40752 WHERE item=47241 and entry IN(16028,15931,15932,15928,15956,15953,15952,15954,15936,16011,16061,16060,15989,15990, 28860, 30452, 30449, 30451);

-- Valor Naxx 25 - OS (Drakes + Sartharion)

UPDATE creature_loot_template SET item=40753 WHERE item=47241 and entry IN(29448,29373,29417,29701,29278,29268,29615,29249,29991,30061,29718,29324,29955,29940, 31311, 31535, 31520, 31534);


-- Cambiar el Phase Mask a 2 del gameobject 202278

-- UPDATE gameobject SET phaseMask=2 WHERE id=202278;


-- FH 10 Man.

UPDATE gameobject_loot_template SET item=40752 WHERE item=47241 AND entry=25192; 


-- FH 25 MAN.

UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry=25193; 


-- Malygos 10

UPDATE gameobject_loot_template SET item=40752 WHERE item=47241 AND entry=26094;



-- Malygos 25
UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry=26097;


--
DELETE FROM creature_loot_template where entry=31311 AND item=43346; -- Large satchel of Spoils

-- Disables, AGREGAR ISLE OF CONQUEST.
DELETE FROM disables WHERE sourcetype=2 AND entry IN(249, 649, 631, 724, 632, 658, 668, 628, 615);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 615, 3, '', '', 'TEMPORAL - Obsidian Sanctum');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 249, 3, '', '', 'Onyxia');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 649, 15, '', '', 'Trial of the Crusader');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 631, 15, '', '', '10/25HC Icecrown Citadel Modes');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 724, 15, '', '', 'Ruby Sanctum, 10/25 man normal and heroic modes.');

INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (3, 628, 0, '', '', 'Disable Isle of Conquest Battleground.');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 632, 3, '', '', 'The Forge of Souls');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 658, 3, '', '', 'The Pit of Saron');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 668, 3, '', '', 'Halls of Reflection');




-- Dalaran daily quests for the instances

-- Achievement: http://www.wowhead.com/achievement=2018/timear-foresees

-- http://www.wowhead.com/npc=31439/archmage-timear + quest http://www.wowhead.com/quest=13241/timear-foresees-ymirjar-berserkers-in-your-future

-- Change triumph for heroism

UPDATE quest_template SET RewardItemId1=40752 WHERE id IN(13244, 13241, 13240, 13243);
-- UPDATE quest_template SET RewardItemId1=40752 WHERE id=13241;

DELETE FROM creature_queststarter WHERE id=31439 AND quest IN(13244, 13241, 13240, 13243);
DELETE FROM creature_questender WHERE id=31439 AND quest IN(13244, 13241, 13240, 13243);

INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
(31439, 13244),
(31439, 13241),
(31439, 13240),
(31439, 13243);


INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(31439, 13244),
(31439, 13241),
(31439, 13240),
(31439, 13243);


-- Pool Quest for Timear foresees achievement.

DELETE FROM pool_quest WHERE pool_entry=5800 AND entry IN(13244, 13241, 13240, 13243);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(13244, 5800, "Timear Foresees Titanium Vanguards in your Future!"),
(13241, 5800, "Timear Foresees Ymirjar Berserkers in your Future!"),
(13240, 5800, "Timear Foresees Centrifuge Constructs in your Future!"),
(13243, 5800, "Timear Foresees Infinite Agents in your Future!");


DELETE FROM pool_template WHERE entry=5800;
INSERT INTO pool_template(entry, max_limit) VALUES
(5800, 1);




-- Daily heroic dungeons quests.

DELETE FROM pool_quest WHERE pool_entry=5801 AND entry IN(13245, 13247, 13249, 13251, 13253, 13255, 13246, 13248, 13250, 13252, 13254, 13256);
INSERT INTO pool_quest (entry, pool_entry, description) VALUES
(13245, 5801, ""),
(13247, 5801, ""),
(13249, 5801, ""),
(13251, 5801, ""),
(13253, 5801, ""),
(13255, 5801, ""),
(13246, 5801, ""),
(13248, 5801, ""),
(13250, 5801, ""),
(13252, 5801, ""),
(13254, 5801, ""),
(13256, 5801, "");


DELETE FROM pool_template WHERE entry=5801;
INSERT INTO pool_template(entry, max_limit) VALUES
(5801, 1);


-- Archmages script.

UPDATE creature_template SET ScriptName="npc_archmage_timear" WHERE entry=31439;
UPDATE creature_template SET ScriptName="npc_archmage_landalock" WHERE entry=20735;

-- Delete Dalaran's weekly quests and add the others.
DELETE FROM creature_queststarter WHERE id=20735;
DELETE FROM creature_questender WHERE id=20735;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
(20735,13245),
(20735,13247),
(20735,13249),
(20735,13251),
(20735,13253),
(20735,13255),
(20735,13246),
(20735,13248),
(20735,13250),
(20735,13252),
(20735,13254),
(20735,13256)
;


INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(20735,13245),
(20735,13247),
(20735,13249),
(20735,13251),
(20735,13253),
(20735,13255),
(20735,13246),
(20735,13248),
(20735,13250),
(20735,13252),
(20735,13254),
(20735,13256)
;



UPDATE creature_template SET InhabitType=4 WHERE entry IN(31619, 31625);
UPDATE creature_template SET Scale=1.4 WHERE entry IN(31623, 31627, 31622, 31624, 31626, 31633); -- Malganis

UPDATE creature_template SET scale=1.7 WHERE entry IN(31619,31618); -- Eregos, Keris

-- Correct Emblems from the daily questes.

UPDATE quest_template SET RewardItemId1=40752 WHERE id IN(13245, 13247, 13249, 13251, 13253, 13255, 13246, 13248, 13250, 13252, 13254, 13256);



-- Archmage Lan'dalock, Images and quests.

-- Auras for some images.  Levitate
DELETE FROM creature_template_addon WHERE entry IN(31620, 31619, 31584, 31618, 31622, 31624, 31629, 31634);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31620, 0, 0, 0, 0, 0, 52970);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31619, 0, 0, 0, 0, 0, 27986);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31618, 0, 0, 0, 0, 0, 27986);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31584, 0, 0, 0, 0, 0, 52970);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31622, 0, 0, 0, 0, 0, 52970);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31624, 0, 0, 0, 0, 0, 52970);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31629, 0, 0, 0, 0, 0, 52970);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31634, 0, 0, 0, 0, 0, 52970);



-- Conditions for the questes.


-- Malganis/Eregos chache already in db.

-- Ingvar

SET @QUEST := 13245;
SET @ITEM := 43662;
SET @REFERENCE_ENTRY := 31674;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);




-- Prophet Tharonja

SET @QUEST := 13249;
SET @ITEM := 43670;
SET @REFERENCE_ENTRY := 31360;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);



-- Loken

SET @QUEST := 13253;
SET @ITEM := 43724;
SET @REFERENCE_ENTRY := 31538;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);



-- Herald Volazj

SET @QUEST := 13255;
SET @ITEM := 43821;
SET @REFERENCE_ENTRY := 31464;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);




-- Keristrasza

SET @QUEST := 13246;
SET @ITEM := 43665;
SET @REFERENCE_ENTRY := 30540;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);




-- Ymiron

SET @QUEST := 13248;
SET @ITEM := 43669;
SET @REFERENCE_ENTRY := 30788;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);


-- Galdarah

SET @QUEST := 13250;
SET @ITEM := 43693;
SET @REFERENCE_ENTRY := 31368;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);



-- Sjonnir

SET @QUEST := 13252;
SET @ITEM := 43699;
SET @REFERENCE_ENTRY := 31386;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);




-- Anubarak

SET @QUEST := 13254;
SET @ITEM := 43726;
SET @REFERENCE_ENTRY := 31610;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);


-- Cyanigosa

SET @QUEST := 13256;
SET @ITEM := 43823;
SET @REFERENCE_ENTRY := 31506;

DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);

DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);










-- Access requirements

-- Access Requirement for Ulduar, for player not leader.

DELETE FROM access_requirement WHERE mapId IN(603);

INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
(603, 0, 80, 0, 0, 0, 0, 0, 0, 576, "You must complete The Fall of Naxxramas 10 players first.", 'Ulduar 10 players - The Fall of Naxxramas 10 requirement.');

INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
(603, 1, 80, 0, 0, 0, 0, 0, 0, 577, "You must complete The Fall of Naxxramas 25 players first.", 'Ulduar 10 players - The Fall of Naxxramas 25 requirement.');



-- Inside the Frozen Citadel quest.

DELETE FROM creature_queststarter WHERE quest IN(24510, 24506);




UPDATE quest_template SET rewardItemid1=0 WHERE id IN(24788, 24789, 24790, 24791);





-- Release every Kirin Tor's Ring.
DELETE FROM `npc_vendor` WHERE entry=32172;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36919, 0, 0, 2706, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36922, 0, 0, 2706, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36925, 0, 0, 2706, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36928, 0, 0, 2484, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36931, 0, 0, 2484, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 36934, 0, 0, 2484, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40585, 0, 0, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40586, 0, 0, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40678, 0, 0, 2523, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40679, 0, 0, 2523, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40680, 0, 0, 2523, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40681, 0, 0, 2523, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40717, 0, 0, 2534, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40718, 0, 0, 2534, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40719, 0, 0, 2534, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 40720, 0, 0, 2534, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 44934, 0, 0, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 44935, 0, 0, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45688, 0, 0, 2592, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45689, 0, 0, 2593, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45690, 0, 0, 2594, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45691, 0, 0, 2595, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45819, 0, 0, 2606, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45820, 0, 0, 2606, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45821, 0, 0, 2606, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45822, 0, 0, 2606, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 45823, 0, 0, 2606, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 47729, 0, 0, 2685, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 47730, 0, 0, 2685, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 47731, 0, 0, 2685, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 47732, 0, 0, 2685, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 47733, 0, 0, 2685, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 48954, 0, 0, 2702, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 48955, 0, 0, 2703, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 48956, 0, 0, 2704, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 48957, 0, 0, 2705, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 51557, 0, 0, 2735, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 51558, 0, 0, 2737, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 51559, 0, 0, 2736, 0);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES (32172, 0, 51560, 0, 0, 2738, 0);

