-- --------------------------
-- Icecrown
-- --------------------------


-- Retest Now NPCs

DELETE FROM creature_loot_template WHERE Entry=32349 AND Item=44301;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (32349, 44301, 0, 100, 1, 1, 0, 1, 1, NULL);

UPDATE creature_loot_template SET Chance=100 WHERE Item=44301 AND Entry IN(32236, 32259, 32262, 32268, 32276, 32279, 32289, 32290, 32297, 32349);
