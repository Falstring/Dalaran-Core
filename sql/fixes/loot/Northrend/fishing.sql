-- --------------------------
-- Fishing
-- --------------------------


-- Pygmy Suckerfish - http://www.wowhead.com/item=40199/pygmy-suckerfish

DELETE FROM gameobject_loot_template WHERE Entry IN (25665, 25664, 25663, 25662, 25669, 25668, 25671, 25670, 25673, 25674) AND Item=40199;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (25665, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25664, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25663, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25662, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25669, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25668, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25671, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25670, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25673, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25674, 40199, 0, 65, 0, 1, 2, 1, 1, NULL);