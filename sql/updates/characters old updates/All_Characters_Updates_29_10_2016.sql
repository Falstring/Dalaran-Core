/* 
* sql\updates\characters\2015_09_28_00_characters_335.sql 
*/ 
UPDATE `auctionhouse`
SET `time` = 0, `auctioneerguid` = 7;

ALTER TABLE `auctionhouse`
  CHANGE COLUMN `auctioneerguid`    `houseid`   TINYINT(3)  UNSIGNED NOT NULL DEFAULT '7' AFTER `id`;
 
 
/* 
* sql\updates\characters\2015_10_06_00_characters.sql 
*/ 
ALTER TABLE `gm_ticket`
  ADD COLUMN `resolvedBy` INT(10) NOT NULL DEFAULT '0' COMMENT 'GUID of GM who resolved the ticket' AFTER `needMoreHelp`;
 
 
/* 
* sql\updates\characters\2015_10_07_00_characters.sql 
*/ 
ALTER TABLE `pet_aura`
DROP PRIMARY KEY,
ADD PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`);
 
 
/* 
* sql\updates\characters\2015_10_12_00_characters.sql 
*/ 
-- Add new winner field, bound to player
ALTER TABLE `pvpstats_players`
  ADD COLUMN `winner` BIT(1) NOT NULL AFTER `character_guid`;

-- Resolve horde players victories
UPDATE `pvpstats_players` SET `winner` = 1 WHERE `battleground_id` IN (
    SELECT `id` FROM `pvpstats_battlegrounds` WHERE `winner_faction` = 0
) AND `character_guid` IN (
    SELECT `guid` FROM `characters` WHERE `race` IN (2, 5, 6, 8, 9, 10)
);

-- Resolve alliance players victories
UPDATE `pvpstats_players` SET `winner` = 1 WHERE `battleground_id` IN (
    SELECT `id` FROM `pvpstats_battlegrounds` WHERE `winner_faction` = 1
) AND `character_guid` IN (
    SELECT `guid` FROM `characters` WHERE `race` IN (1, 3, 4, 7, 11, 22)
);
 
 
/* 
* sql\updates\characters\2015_10_28_00_characters.sql 
*/ 
DROP TABLE IF EXISTS `battleground_deserters`;
CREATE TABLE `battleground_deserters` (
	`guid` INT(10) UNSIGNED NOT NULL COMMENT 'characters.guid',
	`type` TINYINT(3) UNSIGNED NOT NULL COMMENT 'type of the desertion',
	`datetime` DATETIME NOT NULL COMMENT 'datetime of the desertion'
);
 
 
/* 
* sql\updates\characters\2015_10_29_00_characters_335.sql 
*/ 
ALTER TABLE `character_spell_cooldown`
  ADD `categoryId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id' AFTER `time`,
  ADD `categoryEnd` int(10) unsigned NOT NULL DEFAULT '0' AFTER `categoryId`;

ALTER TABLE `pet_spell_cooldown`
  ADD `categoryId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id' AFTER `time`,
  ADD `categoryEnd` int(10) unsigned NOT NULL DEFAULT '0' AFTER `categoryId`;
 
 
