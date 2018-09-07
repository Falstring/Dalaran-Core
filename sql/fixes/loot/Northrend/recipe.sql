-- Northrend Cooking Recipe drops
UPDATE `creature_loot_template` SET `Chance`=2 WHERE `Item` IN (43508, 43509, 43510, 43507);

-- Design: Fractured Scarlet Ruby
DELETE FROM `creature_loot_template` WHERE `Entry`=29570 AND `Item`=41817;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(29570, 41817, 0, 3, 0, 1, 0, 1, 1, NULL);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=29570 AND `SourceEntry`=41817;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(1, 29570, 41817, 0, 0, 7, 0, 755, 1, 0, 0, 0, 0, '', 'Fractured Scarlet Ruby - needs skill Jewelcrafting');

-- Design: Purified Twilight Opal for Anub'arak in the Azjol-Nerub Heroic mode
DELETE FROM `creature_loot_template` WHERE `Entry`=31610 AND `Item`=41796;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(31610, 41796, 0, 100, 0, 1, 1, 1, 1, NULL);
