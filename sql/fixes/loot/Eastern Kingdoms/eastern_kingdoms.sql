-- Plans: Goblin Rocket Boots - http://www.wowhead.com/item=7192/schematic-goblin-rocket-boots
DELETE FROM `creature_loot_template` WHERE `item` = 7192;

-- Healthy Dragon Scale http://db.vanillagaming.org/?item=13920
DELETE FROM `conditions` WHERE  `SourceGroup`=10678 AND `SourceEntry`=13920;
DELETE FROM `conditions` WHERE  `SourceGroup`=10678 AND `SourceEntry`=5582 AND `ConditionValue1`=5529;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(1, 10678, 13920, 0, 0, 8, 0, 5529, 0, 0, 0, 0, 0, '', 'Healthy Dragon Scale drop if Quest rewarded');

UPDATE `creature_loot_template` SET `Chance`='6' WHERE  `Entry`=10678 AND `Item`=13920;

-- Blue Pearls -- http://wotlk.openwow.com/item=4611
UPDATE `spell_loot_template` SET `Chance`='1' WHERE  `Entry`=58172 AND `Item`=4611;


-- Burning Essence - http://www.wowhead.com/item=11751/burning-essence
DELETE FROM gameobject_loot_template WHERE Entry=11103 AND Item=11751;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (11103, 11751, 0, 42, 0, 1, 0, 1, 2, NULL);
