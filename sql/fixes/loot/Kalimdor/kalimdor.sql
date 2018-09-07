-- AQ20 Idols
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20873);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20873);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15229) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15233) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15246) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15264) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20870);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15233) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15249) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15277) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20868);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20868);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20866);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15505) AND (`Item`=20866);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15229) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15252) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20871);


-- Lar'kowi mate should only drop one item.
UPDATE `creature_loot_template` SET `MinCount`=1, `MaxCount` = 1 WHERE `Entry` = 9683 AND `Item` = 11509;