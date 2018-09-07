-- -------------------------------------------
-- TEROKKAR FOREST
-- -------------------------------------------

-- Formula: Runed Adamantite Rod -- http://wotlk.openwow.com/item=25848  [H] Rungor http://wotlk.openwow.com/npc=18960
-- Respawn time corrected

UPDATE `world`.`npc_vendor` SET `incrtime`='180' WHERE  `entry`=18960 AND `item`=25848 AND `ExtendedCost`=0;