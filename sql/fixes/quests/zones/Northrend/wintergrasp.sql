-- -------------------------------------------
-- WINTERGRASP
-- -------------------------------------------
-- [Q] Slay them all! / No Mercy for the Merciless
UPDATE `quest_template` SET `RequiredPlayerKills`='-1' WHERE `ID` IN ('13178', '13180', '13177', '13179');


-- Fueling the Demolishers
-- [H] - Attack - http://www.wowhead.com/quest=13200/fueling-the-demolishers
-- [H] - Defend - http://www.wowhead.com/quest=13191/fueling-the-demolishers
-- [A] - Attack - http://www.wowhead.com/quest=13197/fueling-the-demolishers
-- [A] - Defend - http://www.wowhead.com/quest=236/fueling-the-demolishers

DELETE FROM creature_questender WHERE quest=13191; -- HORDE
DELETE FROM creature_queststarter WHERE quest=13191;
DELETE FROM creature_queststarter WHERE id=31106 AND quest=13200;
INSERT INTO `creature_queststarter` (`id`, `quest`)
VALUES
    (31106, 13191),
    (31106, 13200);

DELETE FROM creature_questender WHERE id=31091 AND quest=13200;
DELETE FROM creature_questender WHERE id=31106 AND quest=13200;
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
    (31106, 13191),
    (31106, 13200),
    (31091, 13191),
    (31091, 13200);

DELETE FROM creature_questender WHERE quest=236; -- ALLIANCE
DELETE FROM creature_queststarter WHERE quest=236;
DELETE FROM creature_queststarter WHERE id=31108 AND quest=13197;
INSERT INTO `creature_queststarter` (`id`, `quest`)
VALUES
    (31108, 236),
    (31108, 13197);

DELETE FROM creature_questender WHERE id IN(31036, 31108) AND quest=13197;
DELETE FROM creature_questender WHERE id IN(31036, 31108) AND quest=236;
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
    (31108, 236),
    (31108, 13197),
    (31036, 236),
    (31036, 13197);

UPDATE quest_template_addon SET ExclusiveGroup=13197 WHERE ID IN(13197, 236);

UPDATE quest_template SET LogDescription='Siege Master Stouthandle in Wintergrasp wants you to retrieve 10 Eternal Embers from Horde players at the Cauldron of Flames.' WHERE ID=13197;
UPDATE quest_template SET AllowableRaces=1101 WHERE ID=236;

UPDATE creature_template SET ScriptName="npc_wg_quest_giver" WHERE entry=31108;

--
DELETE FROM `pool_template` WHERE `entry` BETWEEN 5707 AND 5710;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(5707, 1, "Wintergrasp weekly quests (Alliance, attackers)"),
(5708, 1, "Wintergrasp weekly quests (Alliance, defenders)"),
(5709, 1, "Wintergrasp weekly quests (Horde, attackers)"),
(5710, 1, "Wintergrasp weekly quests (Horde, defenders)");

-- Quest pooling
DELETE FROM `pool_quest` WHERE `pool_entry` BETWEEN 5707 AND 5710;
INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(13195, 5707, "A Rare Herb (Alliance, attackers)"),
(13196, 5707, "Bones and Arrows (Alliance, attackers)"),
(13197, 5707, "Fueling the Demolishers (Alliance, attackers)"),
(13198, 5707, "Warding the Warriors (Alliance, attackers)"),

(13156, 5708, "A Rare Herb (Alliance, defenders)"),
(13154, 5708, "Bones and Arrows (Alliance, defenders)"),
(236, 5708, "Fueling the Demolishers (Alliance, defenders)"),
(13153, 5708, "Warding the Warriors (Alliance, defenders)"),

(13201, 5709, "A Rare Herb (Horde, attackers)"),
(13199, 5709, "Bones and Arrows (Horde, attackers)"),
(13200, 5709, "Fueling the Demolishers (Horde, attackers)"),
(13202, 5709, "Jinxing the Walls (Horde, attackers)"),

(13194, 5710, "Healing with Roses (Horde, defenders)"),
(13193, 5710, "Bones and Arrows (Horde, defenders)"),
(13191, 5710, "Fueling the Demolishers (Horde, defenders)"),
(13192, 5710, "Warding the Walls (Horde, defenders)");
