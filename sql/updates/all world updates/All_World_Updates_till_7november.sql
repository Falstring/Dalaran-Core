/* 
* sql\updates\world\2015_10_31_00_world.sql 
*/ 
UPDATE `creature_text` SET `text`='It is over, your search is done. Let fate choose now, the righteous one.', `sound`=11961,`BroadcastTextId`=22261 WHERE  `entry`=23682 AND `groupid`=0 AND `id`=0;  -- Summon 
UPDATE `creature_text` SET `text`='Here\'s my body, fit and pure!  Now, your blackened souls I\'ll cure!', `sound`=12567,`BroadcastTextId`=22271  WHERE  `entry`=23682 AND `groupid`=1 AND `id`=0; -- Agro
UPDATE `creature_text` SET `text`='Harken, cur! Tis you I spurn! Now feel... the burn!', `type`=12,`BroadcastTextId`=22587 WHERE  `entry`=23682 AND `groupid`=2 AND `id`=0;  -- Conflaguate
UPDATE `creature_text` SET `text`='Soldiers arise, stand and fight! Bring victory at last to this fallen knight!', `sound`=11963,`BroadcastTextId`=23861 WHERE  `entry`=23682 AND `groupid`=3 AND `id`=0; -- Summon Pumkins
UPDATE `creature_text` SET `text`='This end have I reached before.  What new adventure lies in store?', `sound`=11964,`BroadcastTextId`=23455 WHERE  `entry`=23682 AND `groupid`=4 AND `id`=0; -- Death
UPDATE `creature_text` SET `text`='So eager you are, for my blood to spill. Yet to vanquish me, \'tis my head you must kill!', `sound`=11969, `BroadcastTextId`=22757 WHERE  `entry`=23775 AND `groupid`=0 AND `id`=0; -- Loose Head
UPDATE `creature_text` SET `text`='Your body lies beaten, battered and broken! Let my curse be your own, fate has spoken!', `sound`=11962,`BroadcastTextId`=40546 WHERE  `entry`=23775 AND `groupid`=1 AND `id`=0; -- PLayer Death
 
 
/* 
* sql\updates\world\2015_10_31_01_world.sql 
*/ 
    DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=26477;
    INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
    (18, 26477, 47096, 0, 0, 9, 0, 12000, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
    (18, 26477, 47096, 0, 1, 9, 0, 11999, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
    (18, 26477, 61286, 0, 0, 9, 0, 12000, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
    (18, 26477, 61286, 0, 1, 9, 0, 11999, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
    (18, 26477, 61832, 0, 0, 9, 0, 11999, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
(18, 26477, 61832, 0, 1, 9, 0, 12000, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');
 
 
/* 
* sql\updates\world\2015_10_31_02_world.sql 
*/ 
--
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=84011 AND `id`=18672;
 
 
/* 
* sql\updates\world\2015_10_31_03_world_2015_08_01_01.sql 
*/ 
DROP TABLE IF EXISTS `creature_template_locale`;
CREATE TABLE IF NOT EXISTS `creature_template_locale` (
  `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` VARCHAR(4) NOT NULL,
  `Name` TEXT,
  `Title` TEXT,
  `VerifiedBuild` SMALLINT(5) DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

-- koKR
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "koKR", `name_loc1`, `subname_loc1`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc1`) > 0 OR LENGTH(`subname_loc1`) > 0);

-- frFR
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "frFR", `name_loc2`, `subname_loc2`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc2`) > 0 OR LENGTH(`subname_loc2`) > 0);

-- deDE
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "deDE", `name_loc3`, `subname_loc3`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc3`) > 0 OR LENGTH(`subname_loc3`) > 0);

-- zhCN
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "zhCN", `name_loc4`, `subname_loc4`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc4`) > 0 OR LENGTH(`subname_loc4`) > 0);

-- zhTW
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "zhTW", `name_loc5`, `subname_loc5`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc5`) > 0 OR LENGTH(`subname_loc5`) > 0);

-- esES
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "esES", `name_loc6`, `subname_loc6`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc6`) > 0 OR LENGTH(`subname_loc6`) > 0);

-- esMX
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "esMX", `name_loc7`, `subname_loc7`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc7`) > 0 OR LENGTH(`subname_loc7`) > 0);

-- ruRU
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`)
  (SELECT `entry`, "ruRU", `name_loc8`, `subname_loc8`, `VerifiedBuild` FROM `locales_creature` WHERE LENGTH(`name_loc8`) > 0 OR LENGTH(`subname_loc8`) > 0);

DROP TABLE IF EXISTS `locales_creature`;
 
 
/* 
* sql\updates\world\2015_11_01_00_world.sql 
*/ 
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(20102,18927,19177,19169,19175,19171,19172,19176,19178,19173,19148)  AND `source_type`=0 AND  `id` IN(6,11);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19148,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dwarf Commoner - OOC - Say'),
(19171,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dreanei Commoner - OOC - Say'),
(20102,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Goblin Commoner - OOC - Say'),
(19172,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gnome Commoner - OOC - Say'),
(19173,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Night Elf Commoner - OOC - Say'),
(18927,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Human Commoner - OOC - Say'),
(19175,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orc Commoner - OOC - Say'),
(19176,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tauren Commoner - OOC - Say'),
(19177,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Troll Commoner - OOC - Say'),
(19178,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forsaken Commoner - OOC - Say'),
(19169,0,6,0,1,0,100,0,3000,15000,45000,90000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blood Elf Commoner - OOC - Say'),

(19171,0,11,0,64,0,100,0,0,0,0,0,98,8936,11957,0,0,0,0,1,0,0,0,0,0,0,0,'Dreanei Commoner - On Gossip Hello - Send Gossip'),
(20102,0,11,0,64,0,100,0,0,0,0,0,98,8939,11960,0,0,0,0,1,0,0,0,0,0,0,0,'Goblin Commoner - On Gossip Hello - Send Gossip'),
(19172,0,11,0,64,0,100,0,0,0,0,0,98,8938,11959,0,0,0,0,1,0,0,0,0,0,0,0,'Gnome Commoner - On Gossip Hello - Send Gossip'),
(19173,0,11,0,64,0,100,0,0,0,0,0,98,8941,11962,0,0,0,0,1,0,0,0,0,0,0,0,'Night Elf Commoner - On Gossip Hello - Send Gossip'),
(18927,0,11,0,64,0,100,0,0,0,0,0,98,8940,11961,0,0,0,0,1,0,0,0,0,0,0,0,'Human Commoner - On Gossip Hello - Send Gossip'),
(19175,0,11,0,64,0,100,0,0,0,0,0,98,8942,11963,0,0,0,0,1,0,0,0,0,0,0,0,'Orc Commoner - On Gossip Hello - Send Gossip'),
(19176,0,11,0,64,0,100,0,0,0,0,0,98,8943,11964,0,0,0,0,1,0,0,0,0,0,0,0,'Tauren Commoner - On Gossip Hello - Send Gossip'),
(19177,0,11,0,64,0,100,0,0,0,0,0,98,8944,11965,0,0,0,0,1,0,0,0,0,0,0,0,'Troll Commoner - On Gossip Hello - Send Gossip'),
(19178,0,11,0,64,0,100,0,0,0,0,0,98,8945,11966,0,0,0,0,1,0,0,0,0,0,0,0,'Forsaken Commoner - On Gossip Hello - Send Gossip'),
(19169,0,11,0,64,0,100,0,0,0,0,0,98,8935,11956,0,0,0,0,1,0,0,0,0,0,0,0,'Blood Elf Commoner - On Gossip Hello - Send Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` in(20102,18927,19177,19169,19175,19171,19172,19176,19178,19173,19148) AND `SourceGroup`=7;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` in(20102,18927,19177,19169,19175,19171,19172,19176,19178,19173,19148) AND `SourceGroup`=12;

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 7, 19148, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 20102, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 18927, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19171, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19172, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19173, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19175, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19176, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19177, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19178, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 7, 19169, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 20102, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 18927, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19171, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19172, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19173, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19175, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19176, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19177, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19178, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active'),
(22, 12, 19169, 0, 0, 12, 1, 12, 0, 0, 0, 0, 0, '', 'Commoner - Hallows End must be active');

DELETE FROM `gossip_menu` WHERE `entry` IN(8936,8939,8938,8941,8940,8942,8943,8944,8945,8935);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(8936,11957), 
(8939,11960), 
(8938,11959), 
(8941,11962), 
(8940,11961), 
(8942,11963), 
(8943,11964), 
(8944,11965), 
(8945,11966), 
(8935,11956);

DELETE FROM `creature_text` WHERE `entry` IN(20102,18927,19177,19169,19175,19171,19176,19178,19173,19148) AND `groupid`=6;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(19171, 6, 0, 'What do you think of the mask?', 12, 7, 100, 1, 0, 0, 24339, 'Draenei Commoner to Draenei Commoner'),
(19171, 6, 1, 'You know... why DO we celebrate this holiday?', 12, 7, 100, 0, 0, 0, 23287, 'Draenei Commoner to Draenei Commoner'),
(19171, 6, 2, 'For the Horde!', 12, 7, 100, 4, 0, 0, 23357, 'Draenei Commoner to Draenei Commoner'),
(19173, 6, 0, 'Next year, I''m dressing up as either a corsair or an assassin.', 12, 7, 100, 1, 0, 0, 24338, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 1, 'Happy Hallow''s End!', 12, 7, 100, 0, 0, 0, 24346, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 2, 'We should go trick or treating later.', 12, 7, 100, 0, 0, 0, 0, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 3, 'For the Horde!', 12, 7, 100, 4, 0, 0, 23357, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 4, 'Curse this twisting of the night. The candy''s good, though.', 12, 7, 100, 0, 0, 0, 23294, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 5, 'You know... why DO we celebrate this holiday?', 12, 7, 100, 0, 0, 0, 23287, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 6, 'What do you think of the mask?', 12, 7, 100, 1, 0, 0, 24339, 'Night Elf Commoner to Night Elf Commoner'),
(19173, 6, 7, 'Next year, I''m dressing up as either a corsair or an assassin.', 12, 7, 100, 1, 0, 0, 24338, 'Night Elf Commoner to Night Elf Commoner'),
(18927, 6, 0, 'Brains... braaaiiins!', 12, 7, 100, 15, 0, 0, 23358, 'Human Commoner to Human Commoner'),
(18927, 6, 1, 'We should go trick or treating later.', 12, 7, 100, 396, 0, 0, 24348, 'Human Commoner to Human Commoner'),
(18927, 6, 2, 'Are there any more inns we can visit for treats?', 12, 7, 100, 0, 0, 0, 23293, 'Human Commoner to Human Commoner'),
(18927, 6, 3, 'We should go trick or treating later.', 12, 7, 100, 0, 0, 0, 24348, 'Human Commoner to Human Commoner'),
(18927, 6, 4, 'For the Horde!', 12, 7, 100, 274, 0, 0, 23357, 'Human Commoner to Human Commoner'),
(18927, 6, 5, 'What do you think of the mask?', 12, 7, 100, 1, 0, 0, 24339, 'Human Commoner to Human Commoner'),
(18927, 6, 6, 'You know... why DO we celebrate this holiday?', 12, 7, 100, 0, 0, 0,  23287, 'Human Commoner to Human Commoner'),
(19148, 6, 0, 'I think I''ve eaten too much candy...', 12, 7, 100, 0, 0, 0,  24347, 'Dwarf Commoner to Dwarf Commoner'),
(19148, 6, 1, 'Happy Hallow''s End!', 12, 7, 100, 0, 0, 0, 24346, 'Dwarf Commoner to Dwarf Commoner'),
(20102, 6, 0, 'We should go trick or treating later.', 12, 0, 100, 0, 0, 0, 23286, 'Goblin Commoner to Goblin Commoner'),
(20102, 6, 1, 'There MUST be a way to make more money off of this holiday.', 12, 0, 100, 0, 0, 0, 23299, 'Goblin Commoner to Goblin Commoner'),
(20102, 6, 2, 'The innkeepers are mad to be giving away treats for free.', 12, 0, 100, 0, 0, 0, 23300, 'Goblin Commoner to Goblin Commoner'),
(20102, 6, 3, 'For the Alliance! Wait... the Horde! Wait... which was I again?', 12, 0, 100, 4, 0, 149, 23364, 'Goblin Commoner to Goblin Commoner'),
(19176, 6, 0, 'What do you think of the mask?', 12, 1, 100, 1, 0, 0, 24337, 'Tauren Commoner to Tauren Commoner'),
(19176, 6, 1, 'Ishnu-dal-dieb.', 12, 1, 100, 3, 0, 0, 23355, 'Tauren Commoner to Tauren Commoner'),
(19176, 6, 2, 'For the Alliance!', 12, 1, 100, 4, 0, 0, 23351, 'Tauren Commoner to Tauren Commoner'),
(19177, 6, 0, 'Next year, I''m dressing up as either a corsair or an assassin.', 12, 1, 100, 1, 0, 0, 24336, 'Troll Commoner to Troll Commoner'),
(19177, 6, 1, 'Happy Hallow''s End!', 12, 1, 100, 0, 0, 0, 24329, 'Troll Commoner to Troll Commoner'),
(19177, 6, 2, 'What do you think of the mask?', 12, 1, 100, 1, 0, 0, 24337, 'Troll Commoner to Troll Commoner'),
(19177, 6, 3, 'Boo-hoo! I''m a poor little gnome, and I don''t have a capital ci... oh, wait.', 12, 1, 100, 1, 0, 0, 23354, 'Troll Commoner to Troll Commoner'),
(19177, 6, 4, 'Someone should make a candy with a chewy gnome center.', 12, 1, 100, 0, 0, 0, 23297, 'Troll Commoner to Troll Commoner'),
(19177, 6, 5, 'We should go trick or treating later.', 12, 1, 100, 0, 0, 0, 24331, 'Troll Commoner to Troll Commoner'),
(19177, 6, 6, 'I think I''ve eaten too much candy...', 12, 1, 100, 0, 0, 0, 24330, 'Troll Commoner to Troll Commoner'),
(19178, 6, 0, 'We should go trick or treating later.', 12, 1, 100, 0, 0, 0, 24331, 'Forsaken Commoner to Forsaken Commoner'),
(19178, 6, 1, 'We should attend the next burning of the Wickerman.', 12, 1, 100, 0, 0, 0, 23292, 'Forsaken Commoner to Forsaken Commoner'),
(19178, 6, 2, 'For the Alliance!', 12, 1, 100, 4, 0, 0, 23351, 'Forsaken Commoner to Forsaken Commoner'),
(19178, 6, 3, 'Happy Hallow''s End!', 12, 1, 100, 0, 0, 0, 24329, 'Forsaken Commoner to Forsaken Commoner'),
(19178, 6, 4, 'I think I''ve eaten too much candy...', 12, 1, 100, 0, 0, 0, 24330, 'Forsaken Commoner to Forsaken Commoner'),
(19178, 6, 5, 'I think I''ve eaten too much candy...', 12, 1, 100, 274, 0, 0, 24330, 'Forsaken Commoner to Forsaken Commoner'),
(19169, 6, 0, 'Gaze upon my crazy tentacle-face and despair, Azerothian!', 12, 1, 100, 23, 0, 0, 23356, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 1, 'Next year, I''m dressing up as either a corsair or an assassin.', 12, 1, 100, 1, 0, 0, 24336, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 2, 'I think I''ve eaten too much candy...', 12, 1, 100, 0, 0, 0, 24330, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 3, 'What do you think of the mask?', 12, 1, 100, 1, 0, 0, 24337, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 4, 'We should go trick or treating later.', 12, 1, 100, 0, 0, 0, 24331, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 5, 'Happy Hallow''s End!', 12, 1, 100, 0, 0, 0, 24329, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 6, 'This time of year is quite important to our Forsaken allies.', 12, 1, 100, 0, 0, 0, 23288, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 7, 'For the Alliance!', 12, 1, 100, 4, 0, 0, 23351, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 8, 'We should attend the next burning of the Wickerman.', 12, 1, 100, 0, 0, 0, 23292, 'Blood Elf Commoner to Blood Elf Commoner'),
(19169, 6, 9, 'What do you think of the mask?', 12, 1, 100, 273, 0, 0, 24337, 'Blood Elf Commoner to Blood Elf Commoner'),
(19175, 6, 0, 'We should go trick or treating later.', 12, 1, 100, 0, 0, 0, 24331, 'Orc Commoner to Orc Commoner'),
(19175, 6, 1, 'Happy Hallow''s End!', 12, 1, 100, 0, 0, 0, 24329, 'Orc Commoner to Orc Commoner'),
(19175, 6, 2, 'What do you think of the mask?', 12, 1, 100, 1, 0, 0, 24337, 'Orc Commoner to Orc Commoner'),
(19175, 6, 3, 'We should attend the next burning of the Wickerman.', 12, 1, 100, 0, 0, 0, 23292, 'Orc Commoner to Orc Commoner'),
(19175, 6, 4, 'We should go trick or treating later.', 12, 1, 100, 273, 0, 0, 24331, 'Orc Commoner to Orc Commoner'),
(19175, 6, 5, 'Where''s me gold? Where''s me beer? Where''s me feet?', 12, 1, 100, 6, 0, 0, 23352, 'Orc Commoner to Orc Commoner'),
(19175, 6, 6, 'For the Alliance!', 12, 1, 100, 4, 0, 0, 23351, 'Orc Commoner to Orc Commoner'),
(19175, 6, 7, 'Where''s me gold? Where''s me beer? Where''s me feet?', 12, 1, 100, 6, 0, 0, 23352, 'Orc Commoner to Orc Commoner'),
(19175, 6, 8, 'The Forsaken are right to celebrate their freedom.', 12, 1, 100, 0, 0, 0, 23295, 'Orc Commoner to Orc Commoner'),
(19175, 6, 9, 'I think I''ve eaten too much candy...', 12, 1, 100, 396, 0, 0, 24330, 'Orc Commoner to Orc Commoner'),
(19175, 6, 10, 'I think I''ve eaten too much candy...', 12, 1, 100, 0, 0, 0, 24330, 'Orc Commoner to Orc Commoner');
 
 
/* 
* sql\updates\world\2015_11_01_01_world.sql 
*/ 
--
SET @OGUID:=78023;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+385 AND `eventEntry`=12;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+385;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0,180406, 530, 1, 1, 10006.97, -7223.957, 38.252, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+1,180410, 530, 1, 1, 10017.58, -7218.51, 32.9932, 2.303831, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+2,180411, 530, 1, 1, 10001.91, -7204.366, 43.59731, 4.76475, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+3,180410, 530, 1, 1, 9963.57, -7252.031, 33.84737, 2.268925, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+4,180410, 530, 1, 1, 9961.773, -7253.525, 33.84737, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+5,180410, 530, 1, 1, 9965.425, -7250.459, 34.04182, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+6, 180410, 530, 1, 1, 9966.247, -7242.492, 33.60432, 3.874631, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+7, 180410, 530, 1, 1, 10024.43, -7212.82, 32.86126, 2.234018, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+8, 180410, 530, 1, 1, 10020.63, -7200.405, 33.09042, 4.101525, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+9, 180405, 530, 1, 1, 9823.148, -7386.113, 20.45557, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+10,1180407, 530, 1, 1, 9812.965, -7409.957, 13.62506, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+11,1180427, 530, 1, 1, 9682.321, -7432.618, 23.67524, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+12,1180426, 530, 1, 1, 9685.572, -7441.069, 23.97384, 5.026549, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+13,1180426, 530, 1, 1, 9686.853, -7440.715, 20.77245, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+14,1180427, 530, 1, 1, 9686.702, -7436.893, 20.72384, 1.780234, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+15,1180426, 530, 1, 1, 9684.29, -7437.083, 23.16829, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+16,1180427, 530, 1, 1, 9682.661, -7437.406, 19.14746, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+17,1180427, 530, 1, 1, 9682.217, -7440.542, 23.70301, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+18,1180426, 530, 1, 1, 9681.567, -7440.406, 21.67523, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+19,1180427, 530, 1, 1, 9688.92, -7439.088, 24.64051, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+20,1180415, 530, 1, 1, 9726.541, -7459.687, 14.03802, 2.513274, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+21,1180415, 530, 1, 1, 9646.93, -7446.186, 14.02778, 1.274088, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+22,1180415, 530, 1, 1, 9763.853, -7467.264, 13.57424, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+23,1180415, 530, 1, 1, 9721.928, -7473.809, 14.03804, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+24,1180415, 530, 1, 1, 9763.872, -7469.173, 13.57424, 1.954769, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+25,1180415, 530, 1, 1, 9642.902, -7441.372, 14.02778, 4.485497, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+26,1180415, 530, 1, 1, 9706.262, -7464.713, 14.03802, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+27,1180415, 530, 1, 1, 9722.172, -7455.784, 14.03802, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+28,1180415, 530, 1, 1, 9637.544, -7439.558, 14.02778, 2.129301, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+29,1180415, 530, 1, 1, 9708.006, -7469.922, 14.03803, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+30,1180415, 530, 1, 1, 9717.246, -7454.905, 14.03803, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+31,1180415, 530, 1, 1, 9707.984, -7459.522, 14.03802, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+32,1180415, 530, 1, 1, 9726.428, -7470.03, 14.03803, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+33,1180415, 530, 1, 1, 9763.653, -7472.03, 13.57424, 6.19592, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+34,1180415, 530, 1, 1, 9712.377, -7473.811, 14.03804, 5.550147, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+35,1180415, 530, 1, 1, 9728.004, -7464.864, 14.03802, 1.012289, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+36,1180415, 530, 1, 1, 9712.409, -7455.581, 14.03802, 0.3316107, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+37,1180415, 530, 1, 1, 9717.181, -7474.624, 14.03804, 4.293513, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+38,1180415, 530, 1, 1, 9660.289, -7459.098, 14.02777, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+39,1180415, 530, 1, 1, 9661.99, -7464.522, 14.02777, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+40,1180415, 530, 1, 1, 9655.606, -7455.169, 14.02777, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+41,1180415, 530, 1, 1, 9649.94, -7453.708, 14.02778, 1.710422, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+42,1180415, 530, 1, 1, 9641.782, -7259.7, 14.81578, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+43,1180406, 530, 1, 1, 9607.743, -7398.093, 13.61317, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+44,1180415, 530, 1, 1, 9628.13, -7445.979, 14.02779, 0.5235979, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+45,1180415, 530, 1, 1, 9632.113, -7441.426, 14.02779, 1.850049, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+46,1180415, 530, 1, 1, 9660.25, -7470.04, 14.02776, 0.4188786, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+47,1180415, 530, 1, 1, 9638.744, -7460.21, 15.98692, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+48,1180415, 530, 1, 1, 9641.474, -7463.021, 16.38364, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+49,1180415, 530, 1, 1, 9640.314, -7461.316, 17.30185, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+50,1180415, 530, 1, 1, 9638.427, -7461.016, 18.32743, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+51,1180415, 530, 1, 1, 9638.209, -7462.663, 18.66362, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+52,1180415, 530, 1, 1, 9637.09, -7461.913, 18.66316, 1.780234, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+53,1180415, 530, 1, 1, 9640.428, -7464.382, 15.98692, 3.647741, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+54,1180415, 530, 1, 1, 9641.477, -7465.749, 15.98692, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+55,1180415, 530, 1, 1, 9639.198, -7461.872, 15.98692, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+56,1180415, 530, 1, 1, 9624.851, -7453.41, 14.02778, 3.228859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+57,1180415, 530, 1, 1, 9637.354, -7461.244, 15.98692, 3.455756, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+58,1180415, 530, 1, 1, 9639.954, -7462.725, 16.84003, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+59,1180415, 530, 1, 1, 9635.964, -7460.174, 15.97606, 3.804818, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+60,1180415, 530, 1, 1, 9635.571, -7461.838, 15.98692, 1.745327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+61,1180415, 530, 1, 1, 9639.138, -7462.302, 17.97781, 6.161013, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+62,1180415, 530, 1, 1, 9635.984, -7466.34, 18.39254, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+63,1180415, 530, 1, 1, 9633.069, -7464.283, 15.98692, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+64,1180415, 530, 1, 1, 9634.456, -7463.351, 15.98692, 1.06465, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+65,1180415, 530, 1, 1, 9635.389, -7467.68, 17.8932, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+66,1180415, 530, 1, 1, 9637.663, -7466.748, 18.66317, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+67,1180415, 530, 1, 1, 9633.908, -7461.739, 15.98692, 0.9075702, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+68,1180415, 530, 1, 1, 9634.506, -7465.276, 16.39715, 2.740162, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+69,1180415, 530, 1, 1, 9637.328, -7468.691, 15.98692, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+70,1180415, 530, 1, 1, 9638.302, -7467.272, 15.98692, 1.483528, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+71,1180415, 530, 1, 1, 9635.129, -7466.257, 17.33418, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+72,1180415, 530, 1, 1, 9649.725, -7475.164, 14.02777, 4.677484, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+73,1180415, 530, 1, 1, 9634.771, -7467.749, 15.98692, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+74,1180415, 530, 1, 1, 9639.864, -7467.848, 15.98692, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+75,1180415, 530, 1, 1, 9636.4, -7467.287, 15.98692, 1.710422, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+76,1180415, 530, 1, 1, 9639.832, -7466.174, 15.98692, 3.159062, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+77,1180415, 530, 1, 1, 9655.462, -7473.856, 14.02776, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+78,1180415, 530, 1, 1, 9633.779, -7466.766, 16.85439, 0.5410506, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+79,1180415, 530, 1, 1, 9654.685, -7494.923, 20.20687, 4.171338, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+80,1180415, 530, 1, 1, 9642.694, -7487.412, 14.02775, 1.53589, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+81,1180415, 530, 1, 1, 9708.024, -7495.3, 20.21482, 2.268925, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+82,1180405, 530, 1, 1, 9677.399, -7499.985, 15.73777, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+83,1180407, 530, 1, 1, 9687.479, -7494.583, 15.76028, 3.630291, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+84,1180411, 530, 1, 1, 9694.27, -7498.087, 19.95394, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+85,1180415, 530, 1, 1, 9714.893, -7495.471, 20.20084, 0.1745321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+86,1180406, 530, 1, 1, 9689.191, -7499.704, 15.73832, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+87,1180415, 530, 1, 1, 9705.337, -7495.149, 20.22054, 2.408554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+88,1180406, 530, 1, 1, 9679.796, -7494.525, 15.75649, 3.38594, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+89,1180415, 530, 1, 1, 9646.641, -7482.605, 14.02776, 5.98648, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+90,1180411, 530, 1, 1, 9672.331, -7497.908, 19.90336, 5.515242, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+91,1180415, 530, 1, 1, 9619.048, -7454.828, 14.02777, 3.124123, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+92,1180415, 530, 1, 1, 9711.266, -7495.455, 20.2082, 1.692969, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+93,1180415, 530, 1, 1, 9658.174, -7494.944, 20.21395, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+94,1180407, 530, 1, 1, 9697.96, -7500.003, 15.73456, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+95,1180415, 530, 1, 1, 9661.191, -7494.833, 20.22025, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+96,1180415, 530, 1, 1, 9614.421, -7458.695, 14.02777, 0.7504908, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+97,1180411, 530, 1, 1, 9683.252, -7498, 21.73868, 5.253442, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+98,1180415, 530, 1, 1, 9612.596, -7464.159, 14.02776, 2.460913, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+99,1180415, 530, 1, 1, 9624.603, -7474.983, 14.02777, 3.717554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+100,180415, 530, 1, 1, 9718.226, -7495.425, 20.1941, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+101,180415, 530, 1, 1, 9651.492, -7494.754, 20.20044, 5.375615, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+102,180415, 530, 1, 1, 9708.641, -7508.83, 20.19345, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+103,180415, 530, 1, 1, 9614.337, -7469.526, 14.02776, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+104,180415, 530, 1, 1, 9767.092, -7472.754, 13.57029, 0.802851, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+105,180415, 530, 1, 1, 9627.683, -7482.578, 14.02777, 1.361356, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+106,180415, 530, 1, 1, 9618.941, -7473.685, 14.02776, 0.7853968, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+107,180415, 530, 1, 1, 9648.458, -7494.752, 20.19428, 4.34587, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+108,180415, 530, 1, 1, 9631.637, -7487.333, 14.02776, 3.630291, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+109,180415, 530, 1, 1, 9657.274, -7508.259, 20.19345, 0, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+110,180415, 530, 1, 1, 9637.185, -7488.979, 14.02775, 4.590216, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+111,180407, 530, 1, 1, 9668.626, -7499.798, 15.73456, 0.8552105, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+112,180415, 530, 1, 1, 9708.441, -7511.002, 20.19343, 2.094393, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+113,180415, 530, 1, 1, 9658.278, -7510.662, 20.19343, 2.775069, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+114,180415, 530, 1, 1, 9767.192, -7475.003, 13.54758, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+115,180415, 530, 1, 1, 9747.169, -7504.403, 13.82745, 2.565632, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+116,180415, 530, 1, 1, 9708.247, -7520.514, 20.1934, 5.009095, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+117,180411, 530, 1, 1, 9768.593, -7495.143, 22.07407, 4.276057, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+118,180415, 530, 1, 1, 9770.302, -7477.873, 13.54952, 6.178466, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+119,180415, 530, 1, 1, 9708.587, -7514.249, 20.19342, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+120,180405, 530, 1, 1, 9771.71, -7476.252, 13.54952, 1.553341, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+121,180405, 530, 1, 1, 9765.729, -7484.294, 13.51967, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+122,180415, 530, 1, 1, 9745.084, -7507.751, 13.84984, 1.256636, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+123,180415, 530, 1, 1, 9708.395, -7517.227, 20.19341, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+124,180406, 530, 1, 1, 9766.075, -7491.438, 13.51901, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+125,180415, 530, 1, 1, 9767.161, -7488.73, 13.5172, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+126,180415, 530, 1, 1, 9767.326, -7477.913, 13.5208, 2.391098, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+127,180415, 530, 1, 1, 9770.485, -7489.105, 13.54949, 5.777041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+128,180415, 530, 1, 1, 9770.472, -7486.432, 13.54949, 3.42085, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+129,180415, 530, 1, 1, 9766.888, -7486.758, 13.51768, 3.351047, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+130,180411, 530, 1, 1, 9768.688, -7480.606, 22.21311, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+131,180415, 530, 1, 1, 9770.341, -7492.48, 13.5495, 5.078908, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+132,180415, 530, 1, 1, 9770.315, -7483.281, 13.5495, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+133,180407, 530, 1, 1, 9806.146, -7483.15, 13.54675, 5.113817, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+134,180405, 530, 1, 1, 9828.603, -7428.656, 13.619, 3.281239, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+135,180405, 530, 1, 1, 9771.549, -7499.522, 13.54952, 2.268925, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+136,180415, 530, 1, 1, 9770.2, -7497.835, 13.54952, 1.117009, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+137,180415, 530, 1, 1, 9767.045, -7497.897, 13.52364, 2.949595, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+138,180415, 530, 1, 1, 9763.943, -7503.117, 13.57326, 5.393069, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+139,180415, 530, 1, 1, 9760.557, -7504.637, 13.84737, 2.670348, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+140,180407, 530, 1, 1, 9822.736, -7460.87, 14.96318, 4.433136, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+141,180415, 530, 1, 1, 9767.044, -7502.682, 13.56838, 4.904376, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+142,180415, 530, 1, 1, 9828.7, -7444.441, 15.47772, 3.560473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+143,180406, 530, 1, 1, 9806.036, -7492.882, 13.54704, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+144,180472, 530, 1, 1, 9828.494, -7448.282, 18.26859, 5.009095, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+145,180472, 530, 1, 1, 9834.405, -7383.108, 18.10079, 0.383971, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+146,180406, 530, 1, 1, 9850.404, -7388.42, 13.64399, 0.5759573, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+147,180415, 530, 1, 1, 9864.481, -7406.846, 17.2591, 4.537859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+148,180415, 530, 1, 1, 9873.646, -7397.968, 17.17783, 6.073746, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+149,180415, 530, 1, 1, 9871.325, -7404.424, 17.25784, 1.117009, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+150,180407, 530, 1, 1, 9864.585, -7372.301, 20.45062, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+151,180472, 530, 1, 1, 9874.94, -7450.112, 18.36826, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+152,180406, 530, 1, 1, 9876.843, -7387.032, 20.45033, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+153,180407, 530, 1, 1, 9912.188, -7409.072, 13.64037, 1.500983, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+154,180405, 530, 1, 1, 9899.083, -7405.358, 13.6274, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+155,180415, 530, 1, 1, 9841.817, -7508.129, 19.64095, 3.926996, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+156,180415, 530, 1, 1, 9849.061, -7502.075, -4.007756, 1.762782, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+157,180415, 530, 1, 1, 9852.741, -7502.268, -4.003982, 4.380776, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+158,180415, 530, 1, 1, 9847.087, -7501.374, 19.64914, 4.537859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+159,180415, 530, 1, 1, 9855.832, -7499.758, 14.95692, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+160,180415, 530, 1, 1, 9844.303, -7503.149, 19.64698, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+161,180415, 530, 1, 1, 9850.985, -7500.915, 19.68542, 3.822273, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+162,180415, 530, 1, 1, 9850.927, -7498.934, 14.93043, 1.483528, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+163,180415, 530, 1, 1, 9841.513, -7507.542, -4.000395, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+164,180405, 530, 1, 1, 9881.052, -7461.776, 18.23401, 3.211419, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+165,180415, 530, 1, 1, 9855.014, -7501.309, 19.67005, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+166,180415, 530, 1, 1, 9845.86, -7499.851, 14.9349, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+167,180415, 530, 1, 1, 9863.115, -7510.865, -3.999226, 2.146753, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+168,180415, 530, 1, 1, 9836.048, -7510.821, -4.0007, 0.2792516, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+169,180415, 530, 1, 1, 9857.706, -7503.155, 19.66912, 4.34587, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+170,180407, 530, 1, 1, 9911.933, -7454.624, 3.859614, 4.66003, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+171,180415, 530, 1, 1, 9861.13, -7509.801, -3.999039, 1.675514, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+172,180415, 530, 1, 1, 9860.067, -7508.15, 19.66097, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+173,180415, 530, 1, 1, 9838.981, -7510.788, -3.999198, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+174,180415, 530, 1, 1, 9860.134, -7507.262, -3.999874, 1.378809, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+175,180415, 530, 1, 1, 9841.044, -7509.531, -3.99918, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+176,180415, 530, 1, 1, 9866.301, -7510.897, -4.000865, 5.427975, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+177,180415, 530, 1, 1, 9850.412, -7576.229, 20.30321, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+178,180415, 530, 1, 1, 9859.636, -7571.133, 20.36898, 2.775069, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+179,180415, 530, 1, 1, 9840.057, -7565.67, 20.272, 1.396262, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+180,180415, 530, 1, 1, 9855.566, -7556.837, 20.22193, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+181,180415, 530, 1, 1, 9855.622, -7574.95, 20.33961, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+182,180415, 530, 1, 1, 9841.286, -7570.885, 20.31774, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+183,180415, 530, 1, 1, 9850.589, -7555.328, 20.28959, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+184,180415, 530, 1, 1, 9860.757, -7565.826, 20.21995, 1.221729, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+185,180415, 530, 1, 1, 9845.252, -7556.721, 20.27281, 1.029743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+186,180415, 530, 1, 1, 9859.213, -7560.637, 20.16981, 6.03884, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+187,180415, 530, 1, 1, 9845.12, -7574.828, 20.32867, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+188,180415, 530, 1, 1, 9841.471, -7560.367, 20.30399, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+189,180415, 530, 1, 1, 9708.164, -7523.533, 20.19339, 1.797689, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+190,180415, 530, 1, 1, 9708.63, -7525.708, 20.19339, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+191,180415, 530, 1, 1, 9689.424, -7526.101, 18.17952, 0, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+192,180415, 530, 1, 1, 9698.255, -7529.269, 18.1807, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+193,180415, 530, 1, 1, 9699.27, -7531.121, 18.17952, 1.570796, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+194,180415, 530, 1, 1, 9688.258, -7524.131, 18.17952, 1.466076, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+195,180415, 530, 1, 1, 9696.238, -7528.111, 18.18006, 1.518436, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+196,180415, 530, 1, 1, 9699.441, -7533.089, 18.18734, 0.9599299, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+197,180415, 530, 1, 1, 9686.209, -7523.117, 18.17953, 0.4188786, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+198,180415, 530, 1, 1, 9680.044, -7523.145, 18.17953, 1.989672, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+199,180415, 530, 1, 1, 9689.915, -7528.086, 18.18014, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+200,180415, 530, 1, 1, 9677.983, -7524.141, 18.17953, 4.677484, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+201,180415, 530, 1, 1, 9676.573, -7530.896, 18.18807, 3.490667, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+202,180415, 530, 1, 1, 9669.972, -7528.087, 18.18037, 3.194002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+203,180415, 530, 1, 1, 9658.169, -7523.246, 20.19338, 3.38594, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+204,180415, 530, 1, 1, 9666.942, -7531.015, 18.18179, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+205,180415, 530, 1, 1, 9658.161, -7520.05, 20.19339, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+206,180415, 530, 1, 1, 9676.96, -7525.968, 18.17952, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+207,180415, 530, 1, 1, 9690.021, -7531.793, 18.19084, 5.113817, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+208,180415, 530, 1, 1, 9658.127, -7516.909, 20.19341, 0.157079, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+209,180415, 530, 1, 1, 9687.82, -7536.056, 18.20918, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+210,180415, 530, 1, 1, 9677.461, -7536.019, 18.20867, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+211,180415, 530, 1, 1, 9676.623, -7527.953, 18.17995, 5.759588, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+212,180415, 530, 1, 1, 9658.238, -7513.847, 20.19342, 5.724681, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+213,180415, 530, 1, 1, 9668.019, -7529.09, 18.17951, 4.502952, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+214,180415, 530, 1, 1, 9657.903, -7525.752, 20.19338, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+215,180415, 530, 1, 1, 9666.733, -7532.866, 18.1876, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+216,180415, 530, 1, 1, 9555.557, -7451.346, 15.48449, 4.799657, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+217,180415, 530, 1, 1, 9566.941, -7457.089, 15.52037, 6.230826, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+218,180415, 530, 1, 1, 9567.046, -7447.51, 15.51974, 2.513274, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+219,180415, 530, 1, 1, 9566.97, -7453.825, 15.51949, 1.605702, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+220,180415, 530, 1, 1, 9566.997, -7451.406, 15.51957, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+221,180415, 530, 1, 1, 9568.402, -7426.109, 19.47399, 4.101525, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+222,180415, 530, 1, 1, 9567.152, -7445.854, 15.52034, 0.6108634, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+223,180472, 530, 1, 1, 9563.636, -7502.269, 21.49481, 4.607672, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+224,180415, 530, 1, 1, 9566.976, -7449.656, 15.51938, 2.33874, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+225,180415, 530, 1, 1, 9566.942, -7455.471, 15.51938, 2.373644, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+226,180405, 530, 1, 1, 9563.622, -7483.452, 15.5327, 4.276057, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+227,180415, 530, 1, 1, 9567.161, -7443.97, 15.52034, 0.2268925, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+228,180406, 530, 1, 1, 9562.59, -7505.374, 16.25697, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+229,180415, 530, 1, 1, 9567.133, -7442.481, 15.5201, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+230,180415, 530, 1, 1, 9565.785, -7425.961, 19.47643, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+231,180410, 530, 1, 1, 9540.223, -7450.809, 17.51837, 0.01745246, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+232,180415, 530, 1, 1, 9567.209, -7426.12, 19.47489, 6.178466, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+233,180415, 530, 1, 1, 9541.864, -7425.773, 19.47651, 0.5410506, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+234,180415, 530, 1, 1, 9563.859, -7424.643, 19.47689, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+235,180410, 530, 1, 1, 9540.258, -7448.014, 17.50896, 0.05235888, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+236,180472, 530, 1, 1, 9564.246, -7412.431, 27.42245, 4.450591, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+237,180410, 530, 1, 1, 9550.316, -7412.965, 20.95277, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+238,180415, 530, 1, 1, 9544.101, -7423.859, 19.47693, 4.310966, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+239,180415, 530, 1, 1, 9563.4, -7423.909, 19.47697, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+240,180410, 530, 1, 1, 9540.216, -7453.866, 17.47302, 0.03490625, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+241,180415, 530, 1, 1, 9543.036, -7424.986, 19.47662, 3.717554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+242,180415, 530, 1, 1, 9564.668, -7425.304, 19.47664, 0.5061446, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+243,180407, 530, 1, 1, 9567.768, -7397.515, 16.85042, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+244,180406, 530, 1, 1, 9567.915, -7416.937, 19.47392, 5.166176, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+245,180410, 530, 1, 1, 9553.402, -7413.04, 20.98712, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+246,180407, 530, 1, 1, 9543.043, -7483.666, 15.53269, 2.565632, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+247,180415, 530, 1, 1, 9540.23, -7425.866, 19.4752, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+248,180472, 530, 1, 1, 9519.833, -7433.035, 19.3605, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+249,180415, 530, 1, 1, 9539.083, -7425.975, 19.47459, 4.398232, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+250,180407, 530, 1, 1, 9540.185, -7417.852, 19.4752, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+251,180405, 530, 1, 1, 9557.853, -7400.035, 16.83773, 2.670348, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+252,180410, 530, 1, 1, 9543.699, -7412.968, 20.87036, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+253,180406, 530, 1, 1, 9508.441, -7424.596, 14.1965, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+254,180410, 530, 1, 1, 9538.562, -7415.213, 20.94702, 0, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+255,180405, 530, 1, 1, 9523.479, -7423.124, 14.25087, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+256,180410, 530, 1, 1, 9540.664, -7412.908, 20.89148, 4.747296, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: -1)
(@OGUID+257,180406, 530, 1, 1, 9539.319, -7392.822, 16.82288, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+258,180472, 530, 1, 1, 9554.567, -7389.99, 21.68028, 0.6632232, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+259,180415, 530, 1, 1, 9487.291, -7422.018, 14.81501, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+260,180415, 530, 1, 1, 9484.362, -7445.353, 14.90302, 3.996807, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+261,180415, 530, 1, 1, 9480.708, -7432.739, 14.90301, 2.408554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+262,180415, 530, 1, 1, 9476.451, -7449.176, 14.90303, 0.6632232, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+263,180407, 530, 1, 1, 9494.879, -7428.358, 17.09135, 3.281239, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+264,180415, 530, 1, 1, 9492.825, -7419.987, 14.81502, 2.164206, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+265,180415, 530, 1, 1, 9476.508, -7431.844, 14.90302, 1.483528, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+266,180415, 530, 1, 1, 9467.375, -7440.646, 14.90301, 2.932139, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+267,180415, 530, 1, 1, 9472.466, -7432.785, 14.90301, 4.747296, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+268,180415, 530, 1, 1, 9482.682, -7420.492, 14.81501, 2.809975, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+269,180415, 530, 1, 1, 9484.56, -7436.282, 14.90301, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+270,180415, 530, 1, 1, 9468.686, -7445.147, 14.90302, 0.4014249, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+271,180415, 530, 1, 1, 9496.979, -7414.939, 14.81503, 1.413715, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+272,180415, 530, 1, 1, 9472.42, -7448.443, 14.90303, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+273,180415, 530, 1, 1, 9485.846, -7440.649, 14.90301, 0.2967052, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+274,180415, 530, 1, 1, 9497.751, -7409.99, 14.81504, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+275,180415, 530, 1, 1, 9480.601, -7448.55, 14.90303, 4.049168, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+276,180415, 530, 1, 1, 9497.879, -7397.243, 14.81503, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+277,180415, 530, 1, 1, 9468.706, -7436.143, 14.90301, 4.834563, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+278,180415, 530, 1, 1, 9497.823, -7404.051, 14.81503, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+279,180405, 530, 1, 1, 9728.203, -7077.669, 16.74163, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+280,180405, 530, 1, 1, 9731.667, -7093.845, 16.69393, 4.834563, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+281,180406, 530, 1, 1, 9649.085, -7055.952, 18.9854, 6.143561, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+282,180405, 530, 1, 1, 9630.405, -7055.748, 18.99824, 0.6806767, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+283,180407, 530, 1, 1, 9625.018, -7048.128, 16.5235, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+284,180407, 530, 1, 1, 9452.534, -7117.212, 17.60469, 1.239183, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+285, 180415, 530, 1, 1, 9471.1, -6788.781, 18.13373, 0.4014249, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+286, 180415, 530, 1, 1, 9476.353, -6788.941, 18.10409, 0.9424766, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+287, 180405, 530, 1, 1, 9477.764, -6788.119, 16.49356, 2.722713, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+288, 180415, 530, 1, 1, 9478.772, -6793.347, 18.11179, 4.101525, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+289, 180415, 530, 1, 1, 9540.375, -6792.719, 18.12548, 5.305802, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+290, 180406, 530, 1, 1, 9543.698, -6778.754, 15.11356, 5.654869, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+291, 180415, 530, 1, 1, 9543.889, -6783.125, 17.3731, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+292, 180415, 530, 1, 1, 9544.979, -6778.125, 16.53427, 2.042035, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+293, 180415, 530, 1, 1, 9543.481, -6796.776, 18.1165, 3.595379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+294, 180405, 530, 1, 1, 9542.096, -6797.444, 16.47561, 5.794494, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+295, 180415, 530, 1, 1, 9541.747, -6787.827, 17.90674, 5.358162, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+296, 180415, 530, 1, 1, 8744.743, -6707.795, 71.16882, 6.178466, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+297, 180407, 530, 1, 1, 8752.958, -6701.513, 70.30769, 0.8552105, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+298, 180415, 530, 1, 1, 8732.847, -6664.828, 71.75481, 5.759588, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+299, 180415, 530, 1, 1, 8761.782, -6686.872, 71.60171, 2.984498, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+300, 180407, 530, 1, 1, 8727.983, -6662.12, 70.34041, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+301, 180415, 530, 1, 1, 8748.609, -6711.054, 71.06712, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+302, 180415, 530, 1, 1, 8759.109, -6691.253, 71.28538, 2.495818, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+303, 180406, 530, 1, 1, 8749.692, -6699.78, 69.26237, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+304, 180415, 530, 1, 1, 8739.994, -6664.781, 71.07558, 4.276057, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+305, 180415, 530, 1, 1, 8757.932, -6701.396, 71.16756, 1.954769, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+306, 180405, 530, 1, 1, 8723.28, -6666.225, 70.24129, 1.134463, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+307, 180415, 530, 1, 1, 8753.414, -6709.49, 71.1883, 0.5585039, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+308, 180415, 530, 1, 1, 8726.561, -6687.083, 72.62592, 3.228859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+309, 180405, 530, 1, 1, 8753.743, -6699.585, 70.3749, 4.363324, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+310, 180415, 530, 1, 1, 8723.233, -6681.452, 71.84742, 0.6981314, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+311, 180405, 530, 1, 1, 8719.521, -6656.928, 93.42024, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+312, 180415, 530, 1, 1, 8700.916, -6674.799, 72.0319, 1.518436, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3462)
(@OGUID+313, 180415, 530, 1, 1, 8706.488, -6662.007, 71.92754, 5.777041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3462)
(@OGUID+314, 180406, 530, 1, 1, 8705.386, -6687.072, 70.4631, 2.408554, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3462)
(@OGUID+315, 180411, 530, 1, 1, 8717.235, -6634.217, 81.3668, 2.844883, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 3462)
(@OGUID+316, 180415, 530, 1, 1, 8702.579, -6665.299, 71.93767, 1.151916, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3462)
(@OGUID+317, 180415, 530, 1, 1, 8701.252, -6679.795, 72.46958, 0.9773831, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3462)
(@OGUID+318, 180407, 530, 1, 1, 8706.709, -6692.784, 70.40144, 2.146753, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3462)
(@OGUID+319, 180411, 530, 1, 1, 8692.95, -6653.304, 81.65059, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 3462)
(@OGUID+320, 180415, 530, 1, 1, 8698.946, -6684.249, 72.75284, 3.263772, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3462)
(@OGUID+321, 180411, 530, 1, 1, 8690.379, -6624.208, 81.74379, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 3462)
(@OGUID+322, 180407, 530, 1, 1, 8698.128, -6633.019, 82.70164, 4.171338, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3462)
(@OGUID+323, 180406, 530, 1, 1, 8704.135, -6639.711, 82.70164, 1.134463, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3462)
(@OGUID+324, 180411, 530, 1, 1, 8714.333, -6651.519, 81.38808, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 3462)
(@OGUID+325, 180405, 530, 1, 1, 8679.956, -6613.042, 93.42129, 5.759588, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 3462)
(@OGUID+326, 180405, 530, 1, 1, 8683.743, -6621.233, 70.36587, 4.06662, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 3462)
(@OGUID+327, 180406, 530, 1, 1, 8688.724, -6616.967, 70.36587, 3.892087, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3462)
(@OGUID+328, 180415, 530, 1, 1, 7605.088, -6811.049, 84.1159, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+329, 180415, 530, 1, 1, 7612.11, -6804.234, 81.90377, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+330, 180415, 530, 1, 1, 7612.021, -6828.266, 83.9107, 5.550147, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+331, 180415, 530, 1, 1, 7566.673, -6821.13, 88.05801, 4.415683, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+332, 180427, 530, 1, 1, 7573.918, -6803.229, 94.8674, 5.445428, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+333, 180415, 530, 1, 1, 7567.127, -6817.865, 88.0573, 2.076939, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+334, 180427, 530, 1, 1, 7569.024, -6809.578, 94.50038, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+335, 180426, 530, 1, 1, 7569.082, -6825.991, 89.69709, 3.508117, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+336, 180415, 530, 1, 1, 7602.116, -6828.639, 86.01514, 3.735006, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+337, 180427, 530, 1, 1, 7574.768, -6814.038, 95.28167, 1.623156, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+338, 180405, 530, 1, 1, 7577.568, -6858.068, 93.35548, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+339, 180426, 530, 1, 1, 7572.743, -6822.458, 90.08892, 2.007128, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+340, 180407, 530, 1, 1, 7576.379, -6780.385, 87.40021, 2.216565, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+341, 180426, 530, 1, 1, 7572.007, -6815.111, 93.45477, 3.054327, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+342, 180415, 530, 1, 1, 7567.2, -6819.601, 88.05785, 3.717554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+343, 180427, 530, 1, 1, 7589.011, -6833.851, 98.97574, 2.792518, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+344, 180407, 530, 1, 1, 7572.278, -6819.3, 86.66614, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+345, 180426, 530, 1, 1, 7571.846, -6841.222, 98.84716, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+346, 180415, 530, 1, 1, 7562.185, -6823.288, 88.05971, 5.445428, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+347, 180427, 530, 1, 1, 7567.376, -6835.135, 98.69683, 5.777041, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+348, 180415, 530, 1, 1, 7561.724, -6814.664, 88.05759, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+349, 180415, 530, 1, 1, 7565.117, -6815.148, 88.05692, 2.44346, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+350, 180415, 530, 1, 1, 7558.944, -6816.728, 88.05735, 0.802851, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+351, 180405, 530, 1, 1, 7566.199, -6800.06, 87.48344, 1.570796, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+352, 180415, 530, 1, 1, 7563.428, -6814.641, 88.05914, 4.747296, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+353, 180415, 530, 1, 1, 7559.307, -6821.544, 88.05991, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+354, 180415, 530, 1, 1, 7558.512, -6820.009, 88.05814, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+355, 180426, 530, 1, 1, 7560.972, -6804.747, 97.29667, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+356, 180415, 530, 1, 1, 7565.508, -6822.448, 88.05878, 2.879789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+357, 180426, 530, 1, 1, 7567.499, -6812.465, 101.9166, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+358, 180415, 530, 1, 1, 7566.346, -6816.298, 88.0579, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+359, 180407, 530, 1, 1, 7571.595, -6855.143, 93.3475, 2.967041, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+360, 180415, 530, 1, 1, 7564.033, -6823.213, 88.05829, 2.583081, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+361, 180415, 530, 1, 1, 7560.621, -6822.766, 88.05952, 5.777041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+362, 180426, 530, 1, 1, 7564.719, -6828.118, 96.17546, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+363, 180426, 530, 1, 1, 7560.467, -6812.441, 96.04751, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+364, 180415, 530, 1, 1, 7560.125, -6815.4, 88.05717, 5.515242, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+365, 180426, 530, 1, 1, 7547.692, -6814.104, 93.27422, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+366, 180406, 530, 1, 1, 7552.977, -6801.014, 87.09279, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+367, 180426, 530, 1, 1, 7547.643, -6825.288, 94.40193, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+368, 180427, 530, 1, 1, 7558.28, -6809.564, 94.68667, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+369, 180415, 530, 1, 1, 7546.278, -6830.885, 88.81131, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+370, 180426, 530, 1, 1, 7557.047, -6828.95, 95.44633, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: 0)
(@OGUID+371, 180415, 530, 1, 1, 7555.831, -6833.354, 89.27995, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+372, 180415, 530, 1, 1, 7558.429, -6818.413, 88.05863, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+373, 180405, 530, 1, 1, 7552.512, -6816.896, 86.9488, 4.956738, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+374, 180411, 530, 1, 1, 7557.601, -6889.191, 103.978, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+375, 180427, 530, 1, 1, 7542.735, -6808.821, 93.34179, 5.532695, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+376, 180427, 530, 1, 1, 7538.969, -6832.844, 96.30994, 2.932139, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: 0)
(@OGUID+377, 180411, 530, 1, 1, 7552.211, -6766.903, 96.95532, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+378, 180406, 530, 1, 1, 7512.574, -6856.683, 84.62782, 4.206246, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3488)
(@OGUID+379, 180415, 530, 1, 1, 7506.477, -6809.167, 81.56933, 5.881761, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3488)
(@OGUID+380, 180415, 530, 1, 1, 7516.309, -6806.774, 83.16227, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3488)
(@OGUID+381, 186720, 530, 1, 1, 9225.462, -6765.234, 26.05804, 5.794494, 0, 0, 0, 1, 120, 255, 1), -- 186720 (Area: 0)
(@OGUID+382, 186720, 530, 1, 1, 9229.307, -6780.561, 27.05395, 1.082103, 0, 0, 0, 1, 120, 255, 1), -- 186720 (Area: 0)
(@OGUID+383, 186720, 530, 1, 1, 9224.697, -6771.005, 27.25945, 0.06981169, 0, 0, 0, 1, 120, 255, 1), -- 186720 (Area: 0)
(@OGUID+384, 186720, 530, 1, 1, 9224.153, -6777.715, 28.38528, 0.6632232, 0, 0, 0, 1, 120, 255, 1), -- 186720 (Area: 0)
(@OGUID+385, 186234, 530, 1, 1, 9235.062, -6770.263, 24.79453, 2.792518, 0, 0, 0, 1, 120, 255, 1); -- 186234 (Area: 0)

INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9),
(12, @OGUID+10),
(12, @OGUID+11),
(12, @OGUID+12),
(12, @OGUID+13),
(12, @OGUID+14),
(12, @OGUID+15),
(12, @OGUID+16),
(12, @OGUID+17),
(12, @OGUID+18),
(12, @OGUID+19),
(12, @OGUID+20),
(12, @OGUID+21),
(12, @OGUID+22),
(12, @OGUID+23),
(12, @OGUID+24),
(12, @OGUID+25),
(12, @OGUID+26),
(12, @OGUID+27),
(12, @OGUID+28),
(12, @OGUID+29),
(12, @OGUID+30),
(12, @OGUID+31),
(12, @OGUID+32),
(12, @OGUID+33),
(12, @OGUID+34),
(12, @OGUID+35),
(12, @OGUID+36),
(12, @OGUID+37),
(12, @OGUID+38),
(12, @OGUID+39),
(12, @OGUID+40),
(12, @OGUID+41),
(12, @OGUID+42),
(12, @OGUID+43),
(12, @OGUID+44),
(12, @OGUID+45),
(12, @OGUID+46),
(12, @OGUID+47),
(12, @OGUID+48),
(12, @OGUID+49),
(12, @OGUID+50),
(12, @OGUID+51),
(12, @OGUID+52),
(12, @OGUID+53),
(12, @OGUID+54),
(12, @OGUID+55),
(12, @OGUID+56),
(12, @OGUID+57),
(12, @OGUID+58),
(12, @OGUID+59),
(12, @OGUID+60),
(12, @OGUID+61),
(12, @OGUID+62),
(12, @OGUID+63),
(12, @OGUID+64),
(12, @OGUID+65),
(12, @OGUID+66),
(12, @OGUID+67),
(12, @OGUID+68),
(12, @OGUID+69),
(12, @OGUID+70),
(12, @OGUID+71),
(12, @OGUID+72),
(12, @OGUID+73),
(12, @OGUID+74),
(12, @OGUID+75),
(12, @OGUID+76),
(12, @OGUID+77),
(12, @OGUID+78),
(12, @OGUID+79),
(12, @OGUID+80),
(12, @OGUID+81),
(12, @OGUID+82),
(12, @OGUID+83),
(12, @OGUID+84),
(12, @OGUID+85),
(12, @OGUID+86),
(12, @OGUID+87),
(12, @OGUID+88),
(12, @OGUID+89),
(12, @OGUID+90),
(12, @OGUID+91),
(12, @OGUID+92),
(12, @OGUID+93),
(12, @OGUID+94),
(12, @OGUID+95),
(12, @OGUID+96),
(12, @OGUID+97),
(12, @OGUID+98),
(12, @OGUID+99),
(12, @OGUID+100),
(12, @OGUID+101),
(12, @OGUID+102),
(12, @OGUID+103),
(12, @OGUID+104),
(12, @OGUID+105),
(12, @OGUID+106),
(12, @OGUID+107),
(12, @OGUID+108),
(12, @OGUID+109),
(12, @OGUID+110),
(12, @OGUID+111),
(12, @OGUID+112),
(12, @OGUID+113),
(12, @OGUID+114),
(12, @OGUID+115),
(12, @OGUID+116),
(12, @OGUID+117),
(12, @OGUID+118),
(12, @OGUID+119),
(12, @OGUID+120),
(12, @OGUID+121),
(12, @OGUID+122),
(12, @OGUID+123),
(12, @OGUID+124),
(12, @OGUID+125),
(12, @OGUID+126),
(12, @OGUID+127),
(12, @OGUID+128),
(12, @OGUID+129),
(12, @OGUID+130),
(12, @OGUID+131),
(12, @OGUID+132),
(12, @OGUID+133),
(12, @OGUID+134),
(12, @OGUID+135),
(12, @OGUID+136),
(12, @OGUID+137),
(12, @OGUID+138),
(12, @OGUID+139),
(12, @OGUID+140),
(12, @OGUID+141),
(12, @OGUID+142),
(12, @OGUID+143),
(12, @OGUID+144),
(12, @OGUID+145),
(12, @OGUID+146),
(12, @OGUID+147),
(12, @OGUID+148),
(12, @OGUID+149),
(12, @OGUID+150),
(12, @OGUID+151),
(12, @OGUID+152),
(12, @OGUID+153),
(12, @OGUID+154),
(12, @OGUID+155),
(12, @OGUID+156),
(12, @OGUID+157),
(12, @OGUID+158),
(12, @OGUID+159),
(12, @OGUID+160),
(12, @OGUID+161),
(12, @OGUID+162),
(12, @OGUID+163),
(12, @OGUID+164),
(12, @OGUID+165),
(12, @OGUID+166),
(12, @OGUID+167),
(12, @OGUID+168),
(12, @OGUID+169),
(12, @OGUID+170),
(12, @OGUID+171),
(12, @OGUID+172),
(12, @OGUID+173),
(12, @OGUID+174),
(12, @OGUID+175),
(12, @OGUID+176),
(12, @OGUID+177),
(12, @OGUID+178),
(12, @OGUID+179),
(12, @OGUID+180),
(12, @OGUID+181),
(12, @OGUID+182),
(12, @OGUID+183),
(12, @OGUID+184),
(12, @OGUID+185),
(12, @OGUID+186),
(12, @OGUID+187),
(12, @OGUID+188),
(12, @OGUID+189),
(12, @OGUID+190),
(12, @OGUID+191),
(12, @OGUID+192),
(12, @OGUID+193),
(12, @OGUID+194),
(12, @OGUID+195),
(12, @OGUID+196),
(12, @OGUID+197),
(12, @OGUID+198),
(12, @OGUID+199),
(12, @OGUID+200),
(12, @OGUID+201),
(12, @OGUID+202),
(12, @OGUID+203),
(12, @OGUID+204),
(12, @OGUID+205),
(12, @OGUID+206),
(12, @OGUID+207),
(12, @OGUID+208),
(12, @OGUID+209),
(12, @OGUID+210),
(12, @OGUID+211),
(12, @OGUID+212),
(12, @OGUID+213),
(12, @OGUID+214),
(12, @OGUID+215),
(12, @OGUID+216),
(12, @OGUID+217),
(12, @OGUID+218),
(12, @OGUID+219),
(12, @OGUID+220),
(12, @OGUID+221),
(12, @OGUID+222),
(12, @OGUID+223),
(12, @OGUID+224),
(12, @OGUID+225),
(12, @OGUID+226),
(12, @OGUID+227),
(12, @OGUID+228),
(12, @OGUID+229),
(12, @OGUID+230),
(12, @OGUID+231),
(12, @OGUID+232),
(12, @OGUID+233),
(12, @OGUID+234),
(12, @OGUID+235),
(12, @OGUID+236),
(12, @OGUID+237),
(12, @OGUID+238),
(12, @OGUID+239),
(12, @OGUID+240),
(12, @OGUID+241),
(12, @OGUID+242),
(12, @OGUID+243),
(12, @OGUID+244),
(12, @OGUID+245),
(12, @OGUID+246),
(12, @OGUID+247),
(12, @OGUID+248),
(12, @OGUID+249),
(12, @OGUID+250),
(12, @OGUID+251),
(12, @OGUID+252),
(12, @OGUID+253),
(12, @OGUID+254),
(12, @OGUID+255),
(12, @OGUID+256),
(12, @OGUID+257),
(12, @OGUID+258),
(12, @OGUID+259),
(12, @OGUID+260),
(12, @OGUID+261),
(12, @OGUID+262),
(12, @OGUID+263),
(12, @OGUID+264),
(12, @OGUID+265),
(12, @OGUID+266),
(12, @OGUID+267),
(12, @OGUID+268),
(12, @OGUID+269),
(12, @OGUID+270),
(12, @OGUID+271),
(12, @OGUID+272),
(12, @OGUID+273),
(12, @OGUID+274),
(12, @OGUID+275),
(12, @OGUID+276),
(12, @OGUID+277),
(12, @OGUID+278),
(12, @OGUID+279),
(12, @OGUID+280),
(12, @OGUID+281),
(12, @OGUID+282),
(12, @OGUID+283),
(12, @OGUID+284),
(12, @OGUID+285),
(12, @OGUID+286),
(12, @OGUID+287),
(12, @OGUID+288),
(12, @OGUID+289),
(12, @OGUID+290),
(12, @OGUID+291),
(12, @OGUID+292),
(12, @OGUID+293),
(12, @OGUID+294),
(12, @OGUID+295),
(12, @OGUID+296),
(12, @OGUID+297),
(12, @OGUID+298),
(12, @OGUID+299),
(12, @OGUID+300),
(12, @OGUID+301),
(12, @OGUID+302),
(12, @OGUID+303),
(12, @OGUID+304),
(12, @OGUID+305),
(12, @OGUID+306),
(12, @OGUID+307),
(12, @OGUID+308),
(12, @OGUID+309),
(12, @OGUID+310),
(12, @OGUID+311),
(12, @OGUID+312),
(12, @OGUID+313),
(12, @OGUID+314),
(12, @OGUID+315),
(12, @OGUID+316),
(12, @OGUID+317),
(12, @OGUID+318),
(12, @OGUID+319),
(12, @OGUID+320),
(12, @OGUID+321),
(12, @OGUID+322),
(12, @OGUID+323),
(12, @OGUID+324),
(12, @OGUID+325),
(12, @OGUID+326),
(12, @OGUID+327),
(12, @OGUID+328),
(12, @OGUID+329),
(12, @OGUID+330),
(12, @OGUID+331),
(12, @OGUID+332),
(12, @OGUID+333),
(12, @OGUID+334),
(12, @OGUID+335),
(12, @OGUID+336),
(12, @OGUID+337),
(12, @OGUID+338),
(12, @OGUID+339),
(12, @OGUID+340),
(12, @OGUID+341),
(12, @OGUID+342),
(12, @OGUID+343),
(12, @OGUID+344),
(12, @OGUID+345),
(12, @OGUID+346),
(12, @OGUID+347),
(12, @OGUID+348),
(12, @OGUID+349),
(12, @OGUID+350),
(12, @OGUID+351),
(12, @OGUID+352),
(12, @OGUID+353),
(12, @OGUID+354),
(12, @OGUID+355),
(12, @OGUID+356),
(12, @OGUID+357),
(12, @OGUID+358),
(12, @OGUID+359),
(12, @OGUID+360),
(12, @OGUID+361),
(12, @OGUID+362),
(12, @OGUID+363),
(12, @OGUID+364),
(12, @OGUID+365),
(12, @OGUID+366),
(12, @OGUID+367),
(12, @OGUID+368),
(12, @OGUID+369),
(12, @OGUID+370),
(12, @OGUID+371),
(12, @OGUID+372),
(12, @OGUID+373),
(12, @OGUID+374),
(12, @OGUID+375),
(12, @OGUID+376),
(12, @OGUID+377),
(12, @OGUID+378),
(12, @OGUID+379),
(12, @OGUID+380),
(12, @OGUID+381),
(12, @OGUID+382),
(12, @OGUID+383),
(12, @OGUID+384),
(12, @OGUID+385);
 
 
/* 
* sql\updates\world\2015_11_01_02_world.sql 
*/ 
-- 
SET @OGUID:=78023;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+10 AND @OGUID+99;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+10,180407, 530, 1, 1, 9812.965, -7409.957, 13.62506, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+11,180427, 530, 1, 1, 9682.321, -7432.618, 23.67524, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+12,180426, 530, 1, 1, 9685.572, -7441.069, 23.97384, 5.026549, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+13,180426, 530, 1, 1, 9686.853, -7440.715, 20.77245, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+14,180427, 530, 1, 1, 9686.702, -7436.893, 20.72384, 1.780234, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+15,180426, 530, 1, 1, 9684.29, -7437.083, 23.16829, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+16,180427, 530, 1, 1, 9682.661, -7437.406, 19.14746, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+17,180427, 530, 1, 1, 9682.217, -7440.542, 23.70301, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+18,180426, 530, 1, 1, 9681.567, -7440.406, 21.67523, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180426 (Area: -1)
(@OGUID+19,180427, 530, 1, 1, 9688.92, -7439.088, 24.64051, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180427 (Area: -1)
(@OGUID+20,180415, 530, 1, 1, 9726.541, -7459.687, 14.03802, 2.513274, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+21,180415, 530, 1, 1, 9646.93, -7446.186, 14.02778, 1.274088, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+22,180415, 530, 1, 1, 9763.853, -7467.264, 13.57424, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+23,180415, 530, 1, 1, 9721.928, -7473.809, 14.03804, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+24,180415, 530, 1, 1, 9763.872, -7469.173, 13.57424, 1.954769, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+25,180415, 530, 1, 1, 9642.902, -7441.372, 14.02778, 4.485497, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+26,180415, 530, 1, 1, 9706.262, -7464.713, 14.03802, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+27,180415, 530, 1, 1, 9722.172, -7455.784, 14.03802, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+28,180415, 530, 1, 1, 9637.544, -7439.558, 14.02778, 2.129301, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+29,180415, 530, 1, 1, 9708.006, -7469.922, 14.03803, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+30,180415, 530, 1, 1, 9717.246, -7454.905, 14.03803, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+31,180415, 530, 1, 1, 9707.984, -7459.522, 14.03802, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+32,180415, 530, 1, 1, 9726.428, -7470.03, 14.03803, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+33,180415, 530, 1, 1, 9763.653, -7472.03, 13.57424, 6.19592, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+34,180415, 530, 1, 1, 9712.377, -7473.811, 14.03804, 5.550147, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+35,180415, 530, 1, 1, 9728.004, -7464.864, 14.03802, 1.012289, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+36,180415, 530, 1, 1, 9712.409, -7455.581, 14.03802, 0.3316107, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+37,180415, 530, 1, 1, 9717.181, -7474.624, 14.03804, 4.293513, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+38,180415, 530, 1, 1, 9660.289, -7459.098, 14.02777, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+39,180415, 530, 1, 1, 9661.99, -7464.522, 14.02777, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+40,180415, 530, 1, 1, 9655.606, -7455.169, 14.02777, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+41,180415, 530, 1, 1, 9649.94, -7453.708, 14.02778, 1.710422, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+42,180415, 530, 1, 1, 9641.782, -7259.7, 14.81578, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+43,180406, 530, 1, 1, 9607.743, -7398.093, 13.61317, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+44,180415, 530, 1, 1, 9628.13, -7445.979, 14.02779, 0.5235979, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+45,180415, 530, 1, 1, 9632.113, -7441.426, 14.02779, 1.850049, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+46,180415, 530, 1, 1, 9660.25, -7470.04, 14.02776, 0.4188786, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+47,180415, 530, 1, 1, 9638.744, -7460.21, 15.98692, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+48,180415, 530, 1, 1, 9641.474, -7463.021, 16.38364, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+49,180415, 530, 1, 1, 9640.314, -7461.316, 17.30185, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+50,180415, 530, 1, 1, 9638.427, -7461.016, 18.32743, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+51,180415, 530, 1, 1, 9638.209, -7462.663, 18.66362, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+52,180415, 530, 1, 1, 9637.09, -7461.913, 18.66316, 1.780234, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+53,180415, 530, 1, 1, 9640.428, -7464.382, 15.98692, 3.647741, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+54,180415, 530, 1, 1, 9641.477, -7465.749, 15.98692, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+55,180415, 530, 1, 1, 9639.198, -7461.872, 15.98692, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+56,180415, 530, 1, 1, 9624.851, -7453.41, 14.02778, 3.228859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+57,180415, 530, 1, 1, 9637.354, -7461.244, 15.98692, 3.455756, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+58,180415, 530, 1, 1, 9639.954, -7462.725, 16.84003, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+59,180415, 530, 1, 1, 9635.964, -7460.174, 15.97606, 3.804818, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+60,180415, 530, 1, 1, 9635.571, -7461.838, 15.98692, 1.745327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+61,180415, 530, 1, 1, 9639.138, -7462.302, 17.97781, 6.161013, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+62,180415, 530, 1, 1, 9635.984, -7466.34, 18.39254, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+63,180415, 530, 1, 1, 9633.069, -7464.283, 15.98692, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+64,180415, 530, 1, 1, 9634.456, -7463.351, 15.98692, 1.06465, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+65,180415, 530, 1, 1, 9635.389, -7467.68, 17.8932, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+66,180415, 530, 1, 1, 9637.663, -7466.748, 18.66317, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+67,180415, 530, 1, 1, 9633.908, -7461.739, 15.98692, 0.9075702, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+68,180415, 530, 1, 1, 9634.506, -7465.276, 16.39715, 2.740162, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+69,180415, 530, 1, 1, 9637.328, -7468.691, 15.98692, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+70,180415, 530, 1, 1, 9638.302, -7467.272, 15.98692, 1.483528, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+71,180415, 530, 1, 1, 9635.129, -7466.257, 17.33418, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+72,180415, 530, 1, 1, 9649.725, -7475.164, 14.02777, 4.677484, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+73,180415, 530, 1, 1, 9634.771, -7467.749, 15.98692, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+74,180415, 530, 1, 1, 9639.864, -7467.848, 15.98692, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+75,180415, 530, 1, 1, 9636.4, -7467.287, 15.98692, 1.710422, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+76,180415, 530, 1, 1, 9639.832, -7466.174, 15.98692, 3.159062, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+77,180415, 530, 1, 1, 9655.462, -7473.856, 14.02776, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+78,180415, 530, 1, 1, 9633.779, -7466.766, 16.85439, 0.5410506, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+79,180415, 530, 1, 1, 9654.685, -7494.923, 20.20687, 4.171338, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+80,180415, 530, 1, 1, 9642.694, -7487.412, 14.02775, 1.53589, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+81,180415, 530, 1, 1, 9708.024, -7495.3, 20.21482, 2.268925, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+82,180405, 530, 1, 1, 9677.399, -7499.985, 15.73777, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+83,180407, 530, 1, 1, 9687.479, -7494.583, 15.76028, 3.630291, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+84,180411, 530, 1, 1, 9694.27, -7498.087, 19.95394, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+85,180415, 530, 1, 1, 9714.893, -7495.471, 20.20084, 0.1745321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+86,180406, 530, 1, 1, 9689.191, -7499.704, 15.73832, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+87,180415, 530, 1, 1, 9705.337, -7495.149, 20.22054, 2.408554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+88,180406, 530, 1, 1, 9679.796, -7494.525, 15.75649, 3.38594, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+89,180415, 530, 1, 1, 9646.641, -7482.605, 14.02776, 5.98648, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+90,180411, 530, 1, 1, 9672.331, -7497.908, 19.90336, 5.515242, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+91,180415, 530, 1, 1, 9619.048, -7454.828, 14.02777, 3.124123, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+92,180415, 530, 1, 1, 9711.266, -7495.455, 20.2082, 1.692969, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+93,180415, 530, 1, 1, 9658.174, -7494.944, 20.21395, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+94,180407, 530, 1, 1, 9697.96, -7500.003, 15.73456, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+95,180415, 530, 1, 1, 9661.191, -7494.833, 20.22025, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+96,180415, 530, 1, 1, 9614.421, -7458.695, 14.02777, 0.7504908, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+97,180411, 530, 1, 1, 9683.252, -7498, 21.73868, 5.253442, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+98,180415, 530, 1, 1, 9612.596, -7464.159, 14.02776, 2.460913, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+99,180415, 530, 1, 1, 9624.603, -7474.983, 14.02777, 3.717554, 0, 0, 0, 1, 120, 255, 1); -- 180415 (Area: -1)
 
 
/* 
* sql\updates\world\2015_11_01_03_world.sql 
*/ 
-- farlina cleanup
-- areatrigger for greeting
DELETE FROM `areatrigger_scripts` WHERE `entry`=4115;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(4115,"at_faerlina_entrance");

DELETE FROM `creature_text` WHERE `entry`=15953 AND `groupid` IN (4,5);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(15953,4,0,"%s is affected by Widow's Embrace!",41,100,31019,3,"Faerlina EMOTE_WIDOW_EMBRACE"),
(15953,5,0,"%s goes into a frenzy!",41,100,2384,3,"Faerlina EMOTE_FRENZY");

-- remove some random spiders that aren't there on retail
DELETE FROM `creature` WHERE `guid` IN (127961,127962);
-- move followers to summon groups to avoid buggy respawn behavior of minions
DELETE FROM `creature` WHERE `guid` IN (128061,128062,128063,128064);
DELETE FROM `linked_respawn` WHERE `guid` IN (128061,128062,128063,128064);
DELETE FROM `creature_summon_groups` WHERE `summonerId`=15953;
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`) VALUES
(15953,0,1,16506,3362.66 ,-3620.97,261.08,4.57276,8),
(15953,0,1,16506,3356.71 ,-3620.05,261.08,4.57276,8),
(15953,0,2,16505,3359.685,-3620.51,261.08,4.57276,8),
(15953,0,1,16506,3344.3  ,-3618.31,261.08,4.69494,8),
(15953,0,1,16506,3350.26 ,-3619.11,261.08,4.69494,8),
(15953,0,2,16505,3347.28 ,-3618.71,261.08,4.69494,8);

-- adds' fireball spell
DELETE FROM `spelldifficulty_dbc` WHERE `id`=54095;
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`) VALUES
(54095,54095,54096);

-- naxxramas follower SAI changes
DELETE FROM `smart_scripts` WHERE `entryorguid`=16505 AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`event_type`,`event_chance`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`target_type`,`comment`) VALUES
(16505,0,2,4,100,39,75,0,0,0, "Naxxramas Follower - On Aggro - Call For Help (75yd)");
 
 
/* 
* sql\updates\world\2015_11_01_04_world.sql 
*/ 
DELETE FROM `creature_template_addon` WHERE `entry` IN (35254, 35253, 35252, 35251, 35250, 35249, 35248, 35247, 35246, 35256, 34484, 34483, 34482, 34481, 34480, 34479, 34478, 34477, 34476, 34435, 35258, 35244, 35259, 35260, 35261);
INSERT INTO `creature_template_addon` (`entry`, `emote`, `auras`) VALUES
(35254, 10, "33900 30628"),
(35253, 10, "33900 30628"),
(35252, 10, "33900 30628"),
(35251, 10, "33900 30628"),
(35250, 10, "33900 30628"),
(35249, 10, "33900 30628"),
(35248, 10, "33900 30628"),
(35247, 10, "33900 30628"),
(35246, 10, "33900 30628"),
(35256, 0, "33900 30628"),
(34484, 0, "33900 30628"),
(34483, 0, "33900 30628"),
(34482, 0, "33900 30628"),
(34481, 0, "33900 30628"),
(34480, 0, "33900 30628"),
(34479, 0, "33900 30628"),
(34478, 0, "33900 30628"),
(34477, 0, "33900 30628"),
(34476, 0, "33900 30628"),
(34435, 0, "33900 30628"),
(35258, 0, "33900 30628"),
(35244, 0, "33900 30628"),
(35259, 0, "33900 30628"),
(35260, 0, "33900 30628"),
(35261, 0, "33900 30628");
 
 
/* 
* sql\updates\world\2015_11_02_00_world.sql 
*/ 
-- Anub'Rekhan cleanup
-- areatrigger for greeting upon entering room
DELETE FROM `areatrigger_scripts` WHERE `entry`=4119;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(4119,"at_anubrekhan_entrance");

-- make crypt guards aggro anub when pulled
DELETE FROM `smart_scripts` WHERE `entryorguid`=16573 AND `source_type`=0 AND `id` IN (6,7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_chance`,`event_flags`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`target_type`,`comment`) VALUES
(16573,0, 6, 0, 4,100,0, 39,   25,    0, 0, 0, "Crypt Guard - On Aggro - Call For Help (25yd)"),
(16573,0, 7, 5,61,100,0,  1,    0,    0, 0, 0, "Crypt Guard - On Cast Frenzy - Say EMOTE_FRENZY");
UPDATE `smart_scripts` SET `link`=7 WHERE `entryorguid`=16573 AND `source_type`=0 AND `id`=5;

DELETE FROM `creature_text` WHERE `entry`=16573;
DELETE FROM `creature_text` WHERE `entry`=15956 AND `groupid`=3;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(16573,0,0,"%s goes into a frenzy!",16,100,1191,3,"Crypt Guard EMOTE_FRENZY"),
(16573,1,0,"A Crypt Guard joins the fight!",41,100,29887,3,"Crypt Guard EMOTE_SPAWN"),
(16573,2,0,"Corpse Scarabs appear from a Crypt Guard's corpse!",41,100,32796,3,"Crypt Guard EMOTE_SCARAB"),
(15956,3,0,"Anub'Rekhan begins to unleash an insect swarm!",41,100,13443,3,"Anub'Rekhan EMOTE_LOCUST");

DELETE FROM `creature_summon_groups` WHERE `summonerId`=15956;
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`) VALUES
(15956,0,1,16573, 3300.503, -3503.574, 287.1606, 2.321288, 8),
(15956,0,1,16573, 3299.283, -3450.938, 287.1606, 3.839724, 8),
(15956,0,2,16573, 3334.41 , -3476.84 , 287.1553, 0, 8);
 
 
/* 
* sql\updates\world\2015_11_02_01_world.sql 
*/ 
-- Pathing for Phoenix-Hawk Entry: 20039 'TDB FORMAT' 
SET @NPC := 12475;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=404.3267,`position_y`=51.04832,`position_z`=20.42939 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,404.3267,51.04832,20.42939,0,0,1,0,100,0), -- 15:53:14
(@PATH,2,363.3958,82.78564,20.16342,0,0,1,0,100,0), -- 15:53:20
(@PATH,3,351.0526,86.04145,20.2427,0,0,1,0,100,0), -- 15:53:21
(@PATH,4,332.8026,86.04145,20.4927,0,0,1,0,100,0), -- 15:53:21
(@PATH,5,322.5526,86.29145,20.2427,0,0,1,0,100,0), -- 15:53:21
(@PATH,6,309.8975,86.35751,20.44322,0,0,1,0,100,0), -- 15:53:25
(@PATH,7,298.1475,82.35751,20.44322,0,0,1,0,100,0), -- 15:53:25
(@PATH,8,276.9726,72.43015,20.42969,0,0,1,0,100,0), -- 15:53:27
(@PATH,9,256.9967,56.60734,20.43009,0,0,1,0,100,0), -- 15:53:29
(@PATH,10,256.7982,56.72626,20.43009,0,0,1,0,100,0), -- 15:53:33
(@PATH,11,276.9184,72.64089,20.43155,0,0,1,0,100,0), -- 15:53:34
(@PATH,12,297.7713,82.30241,20.42944,0,0,1,0,100,0), -- 15:53:37
(@PATH,13,322.4713,86.09231,20.41415,0,0,1,0,100,0), -- 15:53:39
(@PATH,14,332.4713,86.09231,20.41415,0,0,1,0,100,0), -- 15:53:39
(@PATH,15,351.2139,86.03535,20.23542,0,0,1,0,100,0), -- 15:53:43
(@PATH,16,365.9639,82.28535,20.23542,0,0,1,0,100,0), -- 15:53:43
(@PATH,17,386.9718,70.78688,20.28395,0,0,1,0,100,0), -- 15:53:45
(@PATH,18,404.4698,51.14609,20.42939,0,0,1,0,100,0); -- 15:53:48

-- Pathing for Phoenix-Hawk Entry: 20039 'TDB FORMAT' 
SET @NPC := 12434;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=332.7476,`position_y`=-90.41917,`position_z`=20.51123 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,332.7476,-90.41917,20.51123,0,0,1,0,100,0), -- 15:53:36
(@PATH,2,324.7476,-90.16917,20.26123,0,0,1,0,100,0), -- 15:53:36
(@PATH,3,315.7476,-89.91917,20.26123,0,0,1,0,100,0), -- 15:53:36
(@PATH,4,297.1394,-85.66326,20.4148,0,0,1,0,100,0), -- 15:53:39
(@PATH,5,258.2917,-57.28191,20.42989,0,0,1,0,100,0), -- 15:53:42
(@PATH,6,244.784,-38.03379,20.51284,0,0,1,0,100,0), -- 15:53:45
(@PATH,7,239.784,-13.28379,25.76284,0,0,1,0,100,0), -- 15:53:45
(@PATH,8,238.5742,1.909073,26.95395,0,0,1,0,100,0), -- 15:53:49
(@PATH,9,242.5742,29.15907,20.70395,0,0,1,0,100,0), -- 15:53:49
(@PATH,10,256.9634,56.59798,20.42731,0,0,1,0,100,0), -- 15:53:54
(@PATH,11,297.2964,83.12163,20.43203,0,0,1,0,100,0), -- 15:53:56
(@PATH,12,315.9869,88.49153,20.44473,0,0,1,0,100,0), -- 15:54:00
(@PATH,13,324.2369,88.49153,20.44473,0,0,1,0,100,0), -- 15:54:00
(@PATH,14,332.4869,88.74153,20.44473,0,0,1,0,100,0), -- 15:54:00
(@PATH,15,340.2369,88.99153,20.44473,0,0,1,0,100,0), -- 15:54:00
(@PATH,16,349.4869,89.24153,20.44473,0,0,1,0,100,0), -- 15:54:00
(@PATH,17,362.7359,84.22715,20.25116,0,0,1,0,100,0), -- 15:54:03
(@PATH,18,366.4859,82.72715,20.25116,0,0,1,0,100,0), -- 15:54:03
(@PATH,19,380.7359,76.72715,20.50116,0,0,1,0,100,0), -- 15:54:03
(@PATH,20,388.7359,73.47715,20.25116,0,0,1,0,100,0), -- 15:54:03
(@PATH,21,403.4129,54.84925,20.37498,0,0,1,0,100,0), -- 15:54:07
(@PATH,22,418.7638,27.5905,20.42937,0,0,1,0,100,0), -- 15:54:11
(@PATH,23,423.947,-0.8590612,20.42934,0,0,1,0,100,0), -- 15:54:13
(@PATH,24,423.947,-12.85906,20.42934,0,0,1,0,100,0), -- 15:54:13
(@PATH,25,415.4541,-39.22434,20.42944,0,0,1,0,100,0), -- 15:54:17
(@PATH,26,409.8507,-46.91153,20.42938,0,0,1,0,100,0), -- 15:54:18
(@PATH,27,404.3507,-55.91153,20.42938,0,0,1,0,100,0), -- 15:54:18
(@PATH,28,379.6078,-80.35109,20.36515,0,0,1,0,100,0), -- 15:54:21
(@PATH,29,357.0756,-90.66071,20.3293,0,0,1,0,100,0), -- 15:54:24
(@PATH,30,344.5756,-90.41071,20.3293,0,0,1,0,100,0); -- 15:54:24

-- Add missing Phoenix-Hawk
SET @ENTRY := 20039;
SET @GUID := 554;
DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES 
(@GUID, @ENTRY, 550, 246.4875, -37.49984, 20.42661, 5.58522, 10800, 366765);

-- Pathing for Phoenix-Hawk Entry: 20039 'TDB FORMAT' 
SET @NPC := 554;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=246.4875,`position_y`=-37.49984,`position_z`=20.42661 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,246.4875,-37.49984,20.42661,0,0,1,0,100,0), -- 15:53:34
(@PATH,2,257.6479,-57.38124,20.42661,0,0,1,0,100,0), -- 15:53:37
(@PATH,3,276.6165,-74.59982,20.42977,0,0,1,0,100,0), -- 15:53:40
(@PATH,4,318.1243,-87.4548,20.22828,0,0,1,0,100,0), -- 15:53:43
(@PATH,5,346.6934,-87.65228,20.55079,0,0,1,0,100,0), -- 15:53:46
(@PATH,6,366.6934,-84.40228,20.05079,0,0,1,0,100,0), -- 15:53:46
(@PATH,7,371.813,-83.31676,20.14231,0,0,1,0,100,0), -- 15:53:49
(@PATH,8,381.313,-76.81676,20.39231,0,0,1,0,100,0), -- 15:53:49
(@PATH,9,387.563,-73.06676,20.39231,0,0,1,0,100,0), -- 15:53:49
(@PATH,10,405.1288,-53.81012,20.43003,0,0,1,0,100,0), -- 15:53:52
(@PATH,11,387.8711,-72.59858,20.29767,0,0,1,0,100,0), -- 15:53:56
(@PATH,12,381.6211,-76.84858,20.29767,0,0,1,0,100,0), -- 15:53:56
(@PATH,13,366.4635,-84.1076,20.22797,0,0,1,0,100,0), -- 15:53:58
(@PATH,14,346.7135,-87.6076,20.47797,0,0,1,0,100,0), -- 15:53:58
(@PATH,15,332.7135,-90.1076,20.47797,0,0,1,0,100,0), -- 15:53:58
(@PATH,16,318.1471,-87.49127,20.23125,0,0,1,0,100,0), -- 15:54:02
(@PATH,17,297.8971,-83.99127,20.23125,0,0,1,0,100,0), -- 15:54:02
(@PATH,18,276.5398,-74.81604,20.42981,0,0,1,0,100,0), -- 15:54:05
(@PATH,19,257.961,-57.62645,20.42985,0,0,1,0,100,0); -- 15:54:07

-- Pathing for Phoenix-Hawk Entry: 20039 'TDB FORMAT' 
SET @NPC := 12433;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=332.517,`position_y`=-90.67094,`position_z`=20.45976 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,332.517,-90.67094,20.45976,0,0,1,0,100,0), -- 15:54:00
(@PATH,2,349.2753,-89.96908,20.37492,0,0,1,0,100,0), -- 15:54:03
(@PATH,3,367.7753,-86.46908,20.12492,0,0,1,0,100,0), -- 15:54:03
(@PATH,4,390.4767,-72.33127,20.37196,0,0,1,0,100,0), -- 15:54:07
(@PATH,5,404.9767,-53.58127,20.37196,0,0,1,0,100,0), -- 15:54:07
(@PATH,6,417.079,-29.24579,20.42938,0,0,1,0,100,0), -- 15:54:10
(@PATH,7,423.1954,-0.6701798,20.42934,0,0,1,0,100,0), -- 15:54:13
(@PATH,8,416.2595,27.87078,20.42938,0,0,1,0,100,0), -- 15:54:16
(@PATH,9,405.6095,50.9514,20.42931,0,0,1,0,100,0), -- 15:54:18
(@PATH,10,379.8849,78.87553,20.28936,0,0,1,0,100,0), -- 15:54:20
(@PATH,11,361.7868,87.05472,20.07407,0,0,1,0,100,0), -- 15:54:24
(@PATH,12,347.5368,87.55472,20.32407,0,0,1,0,100,0), -- 15:54:24
(@PATH,13,332.7868,88.05472,20.57407,0,0,1,0,100,0), -- 15:54:24
(@PATH,14,315.7868,88.55472,20.32407,0,0,1,0,100,0), -- 15:54:24
(@PATH,15,297.4316,83.2674,20.46751,0,0,1,0,100,0), -- 15:54:28
(@PATH,16,275.6396,74.44795,20.43051,0,0,1,0,100,0), -- 15:54:30
(@PATH,17,258.8896,55.69796,20.43051,0,0,1,0,100,0), -- 15:54:30
(@PATH,18,243.9132,25.22697,20.67206,0,0,1,0,100,0), -- 15:54:35
(@PATH,19,241.1632,11.72697,25.92206,0,0,1,0,100,0), -- 15:54:35
(@PATH,20,238.8673,-0.7733765,27.23883,0,0,1,0,100,0), -- 15:54:39
(@PATH,21,246.6173,-37.27338,20.48883,0,0,1,0,100,0), -- 15:54:39
(@PATH,22,257.6819,-57.25851,20.4247,0,0,1,0,100,0), -- 15:54:42
(@PATH,23,276.6098,-74.62117,20.42971,0,0,1,0,100,0), -- 15:54:45
(@PATH,24,297.1098,-85.12117,20.42971,0,0,1,0,100,0), -- 15:54:45
(@PATH,25,315.9437,-89.75371,20.45979,0,0,1,0,100,0), -- 15:54:48
(@PATH,26,324.4437,-90.25371,20.45979,0,0,1,0,100,0); -- 15:54:48

-- Pathing for Crystalcore Devastator Entry: 20040 'TDB FORMAT' 
SET @NPC := 12549;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=478.9474,`position_y`=89.4745,`position_z`=20.52121 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,478.9474,89.4745,20.52121,0,0,0,0,100,0), -- 16:07:45
(@PATH,2,479.0185,89.26942,20.52121,0,0,0,0,100,0), -- 16:07:50
(@PATH,3,493.3273,105.7242,20.53989,0,0,0,0,100,0), -- 16:07:54
(@PATH,4,500.1716,115.4319,20.53092,0,0,0,0,100,0), -- 16:07:57
(@PATH,5,501.6716,118.1819,20.53092,0,0,0,0,100,0), -- 16:07:57
(@PATH,6,505.9216,125.6819,20.53092,0,0,0,0,100,0), -- 16:07:57
(@PATH,7,509.7829,136.1951,20.50818,0,0,0,0,100,0), -- 16:08:02
(@PATH,8,511.0329,139.6951,20.50818,0,0,0,0,100,0), -- 16:08:02
(@PATH,9,511.7829,142.6951,20.50818,0,0,0,0,100,0), -- 16:08:02
(@PATH,10,517.5752,164.9698,20.50733,0,0,0,0,100,0), -- 16:08:08
(@PATH,11,520.0752,175.7198,20.50733,0,0,0,0,100,0), -- 16:08:08
(@PATH,12,520.3252,177.2198,20.50733,0,0,0,0,100,0), -- 16:08:08
(@PATH,13,520.882,179.5561,20.53715,0,0,0,0,100,0), -- 16:08:16
(@PATH,14,520.382,184.3061,20.53715,0,0,0,0,100,0), -- 16:08:16
(@PATH,15,519.882,191.8061,20.53715,0,0,0,0,100,0), -- 16:08:16
(@PATH,16,519.132,199.5561,20.53715,0,0,0,0,100,0), -- 16:08:16
(@PATH,17,515.7716,216.1749,20.5457,0,0,0,0,100,0), -- 16:08:23
(@PATH,18,513.7716,222.9249,20.5457,0,0,0,0,100,0), -- 16:08:23
(@PATH,19,517.1009,211.7702,20.5457,0,0,0,0,100,0), -- 16:08:30
(@PATH,20,519.8978,192.0669,20.53427,0,0,0,0,100,0), -- 16:08:35
(@PATH,21,520.3978,184.3169,20.53427,0,0,0,0,100,0), -- 16:08:35
(@PATH,22,520.1716,175.6861,20.51027,0,0,0,0,100,0), -- 16:08:42
(@PATH,23,517.6716,165.6861,20.51027,0,0,0,0,100,0), -- 16:08:42
(@PATH,24,516.1716,158.4361,20.51027,0,0,0,0,100,0), -- 16:08:42
(@PATH,25,511.1044,140.4333,20.50434,0,0,0,0,100,0), -- 16:08:49
(@PATH,26,510.1044,136.1833,20.50434,0,0,0,0,100,0), -- 16:08:49
(@PATH,27,502.2063,118.9294,20.52943,0,0,0,0,100,0), -- 16:08:56
(@PATH,28,500.2063,115.4294,20.52943,0,0,0,0,100,0), -- 16:08:56
(@PATH,29,498.2063,111.9294,20.52943,0,0,0,0,100,0), -- 16:08:56
(@PATH,30,493.3535,105.5967,20.53989,0,0,0,0,100,0), -- 16:09:00
(@PATH,31,488.6035,99.84668,20.53989,0,0,0,0,100,0); -- 16:09:00

DELETE FROM `creature_formations` WHERE `leaderGUID`=12467;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(12467, 12467, 0, 0, 1),
(12467, 12431, 3, 270, 2),
(12467, 12432, 3, 90, 2);

-- Pathing for Astromancer Lord Entry: 20046 'TDB FORMAT' 
SET @NPC := 12467;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=513.6304,`position_y`=-224.7386,`position_z`=20.56552 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,513.6304,-224.7386,20.56552,0,5000,0,0,100,0), -- 16:08:45
(@PATH,2,517.2208,-208.6252,20.56552,0,0,0,0,100,0), -- 16:08:52
(@PATH,3,518.7356,-200.354,20.56796,0,0,0,0,100,0), -- 16:08:57
(@PATH,4,519.4856,-193.354,20.56796,0,0,0,0,100,0), -- 16:08:57
(@PATH,5,519.9856,-190.104,20.56796,0,0,0,0,100,0), -- 16:08:57
(@PATH,6,519.5496,-178.3897,20.51476,0,0,0,0,100,0), -- 16:09:02
(@PATH,7,519.2996,-177.3897,20.51476,0,0,0,0,100,0), -- 16:09:02
(@PATH,8,518.2996,-169.3897,20.51476,0,0,0,0,100,0), -- 16:09:02
(@PATH,9,518.0496,-166.6397,20.51476,0,0,0,0,100,0), -- 16:09:02
(@PATH,10,516.9454,-162.3555,20.49109,0,0,0,0,100,0), -- 16:09:08
(@PATH,11,516.4454,-160.1055,20.49109,0,0,0,0,100,0), -- 16:09:08
(@PATH,12,512.1954,-143.8555,20.49109,0,0,0,0,100,0), -- 16:09:08
(@PATH,13,511.4454,-141.3555,20.49109,0,0,0,0,100,0), -- 16:09:08
(@PATH,14,509.4338,-136.6816,20.51297,0,0,0,0,100,0), -- 16:09:14
(@PATH,15,504.6838,-123.9316,20.51297,0,0,0,0,100,0), -- 16:09:14
(@PATH,16,502.9338,-119.4316,20.51297,0,0,0,0,100,0), -- 16:09:14
(@PATH,17,502.5425,-118.8291,20.53002,0,0,0,0,100,0), -- 16:09:19
(@PATH,18,498.0425,-113.0791,20.53002,0,0,0,0,100,0), -- 16:09:19
(@PATH,19,493.7925,-106.8291,20.53002,0,0,0,0,100,0), -- 16:09:19
(@PATH,20,488.5476,-100.5731,20.50299,0,0,0,0,100,0), -- 16:09:24
(@PATH,21,482.5476,-94.07306,20.50299,0,0,0,0,100,0), -- 16:09:24
(@PATH,22,479.0476,-90.32306,20.50299,0,5000,0,0,100,0), -- 16:09:24
(@PATH,23,488.4339,-100.7364,20.50299,0,0,0,0,100,0), -- 16:09:32
(@PATH,24,493.5073,-106.8633,20.53566,0,0,0,0,100,0), -- 16:09:37
(@PATH,25,498.0073,-112.8633,20.53566,0,0,0,0,100,0), -- 16:09:37
(@PATH,26,509.557,-136.8885,20.51389,0,0,0,0,100,0), -- 16:09:42
(@PATH,27,512.2501,-143.873,20.491,0,0,0,0,100,0), -- 16:09:48
(@PATH,28,516.2501,-159.623,20.491,0,0,0,0,100,0), -- 16:09:48
(@PATH,29,517.0001,-162.373,20.491,0,0,0,0,100,0), -- 16:09:48
(@PATH,30,517.6157,-163.5336,20.51302,0,0,0,0,100,0), -- 16:09:54
(@PATH,31,518.1157,-166.7836,20.51302,0,0,0,0,100,0), -- 16:09:54
(@PATH,32,518.3657,-169.2836,20.51302,0,0,0,0,100,0), -- 16:09:54
(@PATH,33,519.3657,-177.0336,20.51302,0,0,0,0,100,0), -- 16:09:54
(@PATH,34,519.6157,-178.2836,20.51302,0,0,0,0,100,0), -- 16:09:54
(@PATH,35,519.576,-193.4193,20.5364,0,0,0,0,100,0), -- 16:10:00
(@PATH,36,518.826,-200.4193,20.5364,0,0,0,0,100,0), -- 16:10:00
(@PATH,37,517.826,-207.1693,20.5364,0,0,0,0,100,0); -- 16:10:00

UPDATE `creature` SET `id`=20045 WHERE `guid`=12540;
UPDATE `creature` SET `id`=20045 WHERE `guid`=12538;

DELETE FROM `creature_formations` WHERE `leaderGUID`=12540;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(12540, 12540, 0, 0, 1),
(12540, 12542, 3, 270, 2),
(12540, 12541, 3, 90, 2);

-- Pathing for Nether Scryer Entry: 20045 'TDB FORMAT' 
SET @NPC := 12540;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=423.7304,`position_y`=-297.2403,`position_z`=19.25663 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,423.7304,-297.2403,19.25663,0,0,0,0,100,0), -- 16:13:39
(@PATH,2,421.8612,-297.5166,19.29133,0,0,0,0,100,0), -- 16:13:46
(@PATH,3,395.1479,-306.0458,19.47611,0,0,0,0,100,0), -- 16:13:51
(@PATH,4,386.0147,-311.4482,19.33733,0,0,0,0,100,0), -- 16:13:57
(@PATH,5,361.8398,-343.4693,19.29735,0,0,0,0,100,0), -- 16:14:02
(@PATH,6,357.9641,-362.9832,19.28531,0,0,0,0,100,0), -- 16:14:08
(@PATH,7,358.3306,-382.0202,19.17975,0,0,0,0,100,0), -- 16:14:14
(@PATH,8,367.2446,-410.9676,19.20938,0,0,0,0,100,0), -- 16:14:20
(@PATH,9,376.3463,-423.0817,19.22353,0,0,0,0,100,0), -- 16:14:26
(@PATH,10,387.6675,-434.1544,19.24023,0,0,0,0,100,0), -- 16:14:31
(@PATH,11,422.7839,-449.2073,19.28438,0,0,0,0,100,0), -- 16:14:37
(@PATH,12,442.8006,-447.2404,19.22515,0,0,0,0,100,0), -- 16:14:43
(@PATH,13,478.9905,-433.6435,19.3018,0,0,0,0,100,0), -- 16:14:51
(@PATH,14,494.5335,-421.47,19.31859,0,0,0,0,100,0), -- 16:15:01
(@PATH,15,505.3245,-403.0611,19.52428,0,0,0,0,100,0), -- 16:15:07
(@PATH,16,510.3288,-382.475,19.45391,0,0,0,0,100,0), -- 16:15:12
(@PATH,17,509.6892,-362.8328,19.19526,0,0,0,0,100,0), -- 16:15:18
(@PATH,18,504.8862,-343.3768,19.23977,0,0,0,0,100,0), -- 16:15:22
(@PATH,19,505.9844,-344.7854,19.44162,0,0,0,0,100,0), -- 16:15:28
(@PATH,20,509.5838,-363.0805,19.20078,0,0,0,0,100,0), -- 16:15:33
(@PATH,21,505.4904,-403.0814,19.51538,0,0,0,0,100,0), -- 16:15:38
(@PATH,22,494.6033,-421.486,19.34887,0,0,0,0,100,0), -- 16:15:44
(@PATH,23,493.8533,-422.486,19.59887,0,0,0,0,100,0), -- 16:15:44
(@PATH,24,492.6177,-424.3935,19.49897,0,0,0,0,100,0), -- 16:15:49
(@PATH,25,479.1177,-433.3935,19.24897,0,0,0,0,100,0), -- 16:15:49
(@PATH,26,470.3677,-439.3935,19.24897,0,0,0,0,100,0), -- 16:15:49
(@PATH,27,462.8677,-444.3935,19.49897,0,0,0,0,100,0), -- 16:15:49
(@PATH,28,442.9135,-447.4605,19.24915,0,0,0,0,100,0), -- 16:15:58
(@PATH,29,403.749,-444.8676,19.51671,0,0,0,0,100,0), -- 16:16:07
(@PATH,30,387.6254,-434.2364,19.2685,0,0,0,0,100,0), -- 16:16:13
(@PATH,31,376.6454,-423.368,19.23084,0,0,0,0,100,0), -- 16:16:18
(@PATH,32,361.54,-397.0302,19.1883,0,0,0,0,100,0), -- 16:16:24
(@PATH,33,358.272,-382.2332,19.21221,0,0,0,0,100,0), -- 16:16:30
(@PATH,34,358.0092,-362.9816,19.25879,0,0,0,0,100,0), -- 16:16:36
(@PATH,35,372.6,-326.9489,19.52757,0,0,0,0,100,0), -- 16:16:42
(@PATH,36,385.8902,-311.8205,19.52534,0,0,0,0,100,0), -- 16:16:48
(@PATH,37,395.203,-306.4769,19.5721,0,0,0,0,100,0), -- 16:16:53
(@PATH,38,404.203,-300.9769,19.5721,0,0,0,0,100,0); -- 16:16:53

DELETE FROM `creature_formations` WHERE `leaderGUID`=12538;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(12538, 12538, 0, 0, 1),
(12538, 12537, 3, 270, 2),
(12538, 12539, 3, 90, 2);

-- Pathing for Nether Scryer Entry: 20045 'TDB FORMAT' 
SET @NPC := 12538;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=491.6343,`position_y`=-348.8971,`position_z`=17.45782 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,491.6343,-348.8971,17.45782,0,0,0,0,100,0), -- 16:10:09
(@PATH,2,494.4583,-365.0894,17.3224,0,0,0,0,100,0), -- 16:10:11
(@PATH,3,494.3617,-380.7137,17.29877,0,0,0,0,100,0), -- 16:10:17
(@PATH,4,485.7098,-402.4861,17.33348,0,0,0,0,100,0), -- 16:10:22
(@PATH,5,479.9598,-409.9861,17.08348,0,0,0,0,100,0), -- 16:10:22
(@PATH,6,475.9598,-414.7361,17.33348,0,0,0,0,100,0), -- 16:10:22
(@PATH,7,470.2098,-421.7361,17.33348,0,0,0,0,100,0), -- 16:10:22
(@PATH,8,456.0066,-429.1491,17.33844,0,0,0,0,100,0), -- 16:10:32
(@PATH,9,441.2566,-434.6491,17.58844,0,0,0,0,100,0), -- 16:10:32
(@PATH,10,425.0241,-433.6116,17.49777,0,0,0,0,100,0), -- 16:10:39
(@PATH,11,409.0241,-431.8616,17.49777,0,0,0,0,100,0), -- 16:10:39
(@PATH,12,396.0655,-422.4177,17.41465,0,0,0,0,100,0), -- 16:10:47
(@PATH,13,387.3155,-413.9177,17.41465,0,0,0,0,100,0), -- 16:10:47
(@PATH,14,374.3321,-392.9123,17.42148,0,0,0,0,100,0), -- 16:10:56
(@PATH,15,371.2164,-380.3734,17.65318,0,0,0,0,100,0), -- 16:11:02
(@PATH,16,371.1164,-364.8227,17.43382,0,0,0,0,100,0), -- 16:11:07
(@PATH,17,381.9487,-334.1354,17.87497,0,0,0,0,100,0), -- 16:11:12
(@PATH,18,393.8716,-322.5054,17.69732,0,0,0,0,100,0), -- 16:11:17
(@PATH,19,412.3383,-311.7506,17.58051,0,0,0,0,100,0), -- 16:11:21
(@PATH,20,423.361,-308.4557,17.6968,0,0,0,0,100,0), -- 16:11:26
(@PATH,21,428.361,-307.4557,17.9468,0,0,0,0,100,0), -- 16:11:26
(@PATH,22,423.8289,-308.1609,17.72783,0,0,0,0,100,0), -- 16:11:32
(@PATH,23,403.0539,-316.1074,17.86351,0,0,0,0,100,0), -- 16:11:35
(@PATH,24,394.0146,-322.5777,17.75302,0,0,0,0,100,0), -- 16:11:40
(@PATH,25,381.8382,-334.0474,17.83417,0,0,0,0,100,0), -- 16:11:45
(@PATH,26,371.0694,-364.8433,17.48853,0,0,0,0,100,0), -- 16:11:49
(@PATH,27,371.0801,-380.4205,17.45639,0,0,0,0,100,0), -- 16:11:54
(@PATH,28,379.2573,-404.1338,17.39072,0,0,0,0,100,0), -- 16:11:59
(@PATH,29,387.2876,-413.9666,17.47128,0,0,0,0,100,0), -- 16:12:05
(@PATH,30,396.0376,-422.4666,17.47128,0,0,0,0,100,0), -- 16:12:05
(@PATH,31,424.8217,-433.5346,17.49184,0,0,0,0,100,0), -- 16:12:14
(@PATH,32,456.0426,-429.2732,17.36312,0,0,0,0,100,0), -- 16:12:22
(@PATH,33,460.5426,-427.7732,17.36312,0,0,0,0,100,0), -- 16:12:22
(@PATH,34,476.0071,-414.7808,17.28578,0,0,0,0,100,0), -- 16:12:29
(@PATH,35,479.7571,-410.0308,17.03578,0,0,0,0,100,0), -- 16:12:29
(@PATH,36,485.7571,-402.5308,17.28578,0,0,0,0,100,0), -- 16:12:29
(@PATH,37,490.2571,-397.2808,17.28578,0,0,0,0,100,0), -- 16:12:29
(@PATH,38,494.1788,-380.7926,17.42046,0,0,0,0,100,0), -- 16:12:39
(@PATH,39,494.2377,-364.9676,17.32992,0,0,0,0,100,0); -- 16:12:45

-- Remove bad spawns
DELETE FROM `creature` WHERE `guid` IN (12546, 12545, 12460, 12459, 12547, 12548, 12571, 12572);
DELETE FROM `linked_respawn` WHERE `guid` IN (12546, 12545, 12460, 12459, 12547, 12548, 12571, 12572);

-- Set right entry
UPDATE `creature` SET `id`=20050 WHERE `guid`=12465;
UPDATE `creature` SET `id`=20048 WHERE `guid`=12463;
UPDATE `creature` SET `id`=20048 WHERE `guid`=12464;
UPDATE `creature` SET `id`=20031 WHERE `guid`=12485;
UPDATE `creature` SET `id`=20031 WHERE `guid`=12484;

DELETE FROM `creature_formations` WHERE `leaderGUID`=12465;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(12465, 12465, 0, 0, 1),
(12465, 12463, 3, 270, 2),
(12465, 12464, 3, 90, 2);

-- Pathing for Crimson Hand Inquisitor Entry: 20050 'TDB FORMAT' 
SET @NPC := 12465;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=655.5598,`position_y`=-74.22478,`position_z`=47.05975 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,655.5598,-74.22478,47.05975,0,0,0,0,100,0), -- 16:08:34
(@PATH,2,651.4869,-79.5063,47.04427,0,0,0,0,100,0), -- 16:08:41
(@PATH,3,631.1815,-102.5708,47.03273,0,0,0,0,100,0), -- 16:08:45
(@PATH,4,619.0531,-111.1841,46.42092,0,0,0,0,100,0), -- 16:08:51
(@PATH,5,617.8031,-111.9341,45.92092,0,0,0,0,100,0), -- 16:08:51
(@PATH,6,606.8416,-117.8403,41.57663,0,0,0,0,100,0), -- 16:08:56
(@PATH,7,589.9025,-125.8981,36.43072,0,0,0,0,100,0), -- 16:09:01
(@PATH,8,580.551,-129.5958,36.31794,0,0,0,0,100,0), -- 16:09:03
(@PATH,9,579.801,-129.8458,36.31794,0,0,0,0,100,0), -- 16:09:03
(@PATH,10,573.301,-132.3458,35.06794,0,0,0,0,100,0), -- 16:09:03
(@PATH,11,580.7385,-129.5231,36.23978,0,0,0,0,100,0), -- 16:09:10
(@PATH,12,594.8942,-123.7401,37.95549,0,0,0,0,100,0), -- 16:09:14
(@PATH,13,606.4921,-118.0775,41.48959,0,0,0,0,100,0), -- 16:09:17
(@PATH,14,619.0924,-111.1047,46.4275,0,0,0,0,100,0), -- 16:09:21
(@PATH,15,633.9102,-99.63002,47.15026,0,0,0,0,100,0), -- 16:09:25
(@PATH,16,653.5164,-77.03735,47.0669,0,0,0,0,100,0); -- 16:09:31

SET @CGUID := 86939;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(@CGUID+0, 20048, 550, 615.408, 108.1827, 45.53154, 5.798159, 7200), -- 20048 (Area: -1)
(@CGUID+1, 20050, 550, 621.3588, 107.9806, 46.45268, 5.711797, 7200), -- 20050 (Area: -1)
(@CGUID+2, 20048, 550, 617.9949, 113.5776, 45.32596, 5.797285, 7200), -- 20048 (Area: -1)
(@CGUID+3, 20048, 550, 651.4778, 85.3616, 46.98529, 2.460914, 7200), -- 20048 (Area: -1)
(@CGUID+4, 20048, 550, 644.955, 78.4049, 46.925, 2.181662, 7200), -- 20048 (Area: -1)
(@CGUID+5, 20048, 550, 590.4993, 115.3127, 37.52827, 2.478368, 7200), -- 20048 (Area: -1)
(@CGUID+6, 20048, 550, 598.2206, 130.2819, 37.6214, 3.211406, 7200), -- 20048 (Area: -1)
(@CGUID+7, 20049, 550, 641.1609, 77.83035, 46.88414, 2.076942, 7200), -- 20049 (Area: -1)
(@CGUID+8, 20049, 550, 594.7014, 114.7355, 38.61783, 2.670354, 7200), -- 20049 (Area: -1)
(@CGUID+9, 20049, 550, 654.7372, 88.48184, 46.82887, 2.583087, 7200), -- 20049 (Area: -1)
(@CGUID+10, 20049, 550, 601.0374, 127.5763, 38.66954, 3.054326, 7200), -- 20049 (Area: -1)
(@CGUID+11, 20047, 550, 651.4259, 87.75813, 46.89581, 2.321288, 7200), -- 20047 (Area: -1) (Auras: )
(@CGUID+12, 20047, 550, 642.4025, 80.52879, 46.89103, 2.146755, 7200), -- 20047 (Area: -1) (Auras: )
(@CGUID+13, 20047, 550, 597.9776, 114.9579, 39.38305, 2.792527, 7200), -- 20047 (Area: -1) (Auras: )
(@CGUID+14, 20047, 550, 603.4946, 125.0622, 39.5998, 2.9147, 7200); -- 20047 (Area: -1) (Auras: )

DELETE FROM `creature_formations` WHERE `leaderGUID`=86940;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(86940, 86940, 0, 0, 1),
(86940, 86939, 3, 270, 2),
(86940, 86941, 3, 90, 2);

-- Pathing for Crimson Hand Inquisitor Entry: 20050 'TDB FORMAT' 
SET @NPC := 86940;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=655.5364,`position_y`=72.95763,`position_z`=47.05836 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,655.5364,72.95763,47.05836,0,0,0,0,100,0), -- 16:08:23
(@PATH,2,651.3881,78.08571,47.05026,0,0,0,0,100,0), -- 16:08:30
(@PATH,3,630.8481,100.8367,47.02984,0,0,0,0,100,0), -- 16:08:35
(@PATH,4,618.8256,109.6938,46.47087,0,0,0,0,100,0), -- 16:08:40
(@PATH,5,617.3256,110.6938,45.72087,0,0,0,0,100,0), -- 16:08:40
(@PATH,6,606.6226,116.3986,41.5707,0,0,0,0,100,0), -- 16:08:45
(@PATH,7,589.7452,124.2339,36.51868,0,0,0,0,100,0), -- 16:08:50
(@PATH,8,580.804,128.0832,36.30165,0,0,0,0,100,0), -- 16:08:52
(@PATH,9,580.054,128.5832,36.30165,0,0,0,0,100,0), -- 16:08:52
(@PATH,10,577.9855,129.5036,35.95486,0,0,0,0,100,0), -- 16:08:55
(@PATH,11,573.9855,129.7536,35.20486,0,0,0,0,100,0), -- 16:08:55
(@PATH,12,573.3516,129.5648,35.01861,0,0,0,0,100,0), -- 16:09:00
(@PATH,13,579.8276,128.5876,36.13748,0,0,0,0,100,0), -- 16:09:02
(@PATH,14,580.5776,128.0876,36.13748,0,0,0,0,100,0), -- 16:09:02
(@PATH,15,595.2676,121.8818,37.90141,0,0,0,0,100,0), -- 16:09:04
(@PATH,16,606.479,116.8065,41.47223,0,0,0,0,100,0), -- 16:09:07
(@PATH,17,618.7388,110.0541,46.44956,0,0,0,0,100,0), -- 16:09:12
(@PATH,18,635.658,96.03332,46.94309,0,0,0,0,100,0), -- 16:09:17
(@PATH,19,653.3979,75.61298,47.06518,0,0,0,0,100,0); -- 16:09:21
 
 
/* 
* sql\updates\world\2015_11_03_00_world.sql 
*/ 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=50556;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,50556,0,0,31,0,3,28054,0,0,0,0,'','Only Lucky Wilhelm is a target for the spell Ride Wilhelm');
 
 
/* 
* sql\updates\world\2015_11_03_01_world.sql 
*/ 
SET @CGUID:=86954;

DELETE FROM `creature` WHERE `id` IN (30655, 30640, 30832, 30646, 30651, 30707, 30649, 30749, 30700, 30699, 30690, 31246, 31353, 30589, 30588, 30476, 30559);
DELETE FROM `creature` WHERE `guid` IN (122568, 122569, 122570);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+29;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 30640, 623, 1, 1, 35.03846, 36.06336, 25.11708, 5.288348, 120, 0, 0), -- 30640 (Area: 4508) (possible waypoints or random movement)
(@CGUID+1, 30640, 623, 1, 1, 6.909693, 9.529325, 20.54005, 2.303835, 120, 0, 0), -- 30640 (Area: 4508) (possible waypoints or random movement)
(@CGUID+2, 30640, 623, 1, 1, -27.16368, 2.981263, 20.54094, 0.122173, 120, 0, 0), -- 30640 (Area: 4508) (possible waypoints or random movement)
(@CGUID+3, 30640, 623, 1, 1, -56.31194, 12.39219, 31.00466, 3.281219, 120, 0, 0), -- 30640 (Area: 4537) (possible waypoints or random movement)
(@CGUID+4, 30646, 623, 1, 1, -30.25571, 31.80029, 12.35424, 1.605703, 120, 0, 0), -- 30646 (Area: 4508) (possible waypoints or random movement)
(@CGUID+5, 30646, 623, 1, 1, -5.325279, 31.62501, 12.34004, 1.500983, 120, 0, 0), -- 30646 (Area: 4508) (possible waypoints or random movement)
(@CGUID+6, 30651, 623, 1, 1, -40.68238, 29.21558, 12.33503, 1.919862, 120, 0, 0), -- 30651 (Area: 4508) (possible waypoints or random movement)
(@CGUID+7, 30651, 623, 1, 1, -17.81335, 32.07878, 12.3449, 1.553343, 120, 0, 0), -- 30651 (Area: 4508) (possible waypoints or random movement)
(@CGUID+8, 30651, 623, 1, 1, 5.88316, 30.50419, 12.34755, 1.32645, 120, 0, 0), -- 30651 (Area: 4508) (possible waypoints or random movement)
(@CGUID+9, 30655, 623, 1, 1, 6.662919, 19.23895, 10.05156, 0.5061455, 120, 0, 0), -- 30655 (Area: 4509)
(@CGUID+10, 30655, 623, 1, 1, -43.53964, 18.66365, 9.692578, 3.246312, 120, 0, 0), -- 30655 (Area: 4509) (possible waypoints or random movement)
(@CGUID+11, 30559, 623, 1, 1, 38.16154, -0.040522, 40.16801, 4.223697, 120, 0, 0), -- 30559 (Area: 4508) (possible waypoints or random movement)
(@CGUID+12, 30476, 623, 1, 1, 31.41805, 0.126893, 41.69821, 0.05235988, 120, 0, 0), -- 30476 (Area: 4508) (Auras: 56852 - 56852) (possible waypoints or random movement)
(@CGUID+13, 31353, 623, 1, 1, -21.7234, 19.33753, 9.687197, 1.64061, 120, 0, 0), -- 31353 (Area: 4509) (Auras: 57726 - 57726)
(@CGUID+14, 30690, 622, 1, 1, 15.24723, 32.37709, 10.63188, 1.553343, 120, 0, 0), -- 30690 (Area: 4533) (possible waypoints or random movement)
(@CGUID+15, 30690, 622, 1, 1, -11.22309, 32.91199, 10.55865, 1.58825, 120, 0, 0), -- 30690 (Area: 4533) (possible waypoints or random movement)
(@CGUID+16, 30649, 622, 1, 1, 4.109683, 19.52689, 34.74765, 3.752458, 120, 0, 0), -- 30649 (Area: 4533) (possible waypoints or random movement)
(@CGUID+17, 30649, 622, 1, 1, -32.53434, 24.30232, 33.9708, 3.211406, 120, 0, 0), -- 30649 (Area: 4533) (possible waypoints or random movement)
(@CGUID+18, 30649, 622, 1, 1, 50.99569, 46.95655, 23.41373, 2.583087, 120, 0, 0), -- 30649 (Area: 4533) (possible waypoints or random movement)
(@CGUID+19, 30649, 622, 1, 1, 2.006737, 15.73845, 9.250069, 3.368485, 120, 0, 0), -- 30649 (Area: 4533) (possible waypoints or random movement)
(@CGUID+20, 30699, 622, 1, 1, 1.853844, 32.8888, 10.02361, 1.58825, 120, 0, 0), -- 30699 (Area: 4533) (possible waypoints or random movement)
(@CGUID+21, 30700, 622, 1, 1, -35.66628, 29.43331, 1.87925, 1.745329, 120, 0, 0), -- 30700 (Area: 0) (possible waypoints or random movement)
(@CGUID+22, 30700, 622, 1, 1, 7.417077, 32.82674, 38.35604, 1.553343, 120, 0, 0), -- 30700 (Area: 0) (possible waypoints or random movement)
(@CGUID+23, 30700, 622, 1, 1, -55.9708, 28.44186, 18.02501, 2.268928, 120, 0, 0), -- 30700 (Area: 0) (possible waypoints or random movement)
(@CGUID+24, 30700, 622, 1, 1, 38.76255, 30.09343, 2.308181, 1.134464, 120, 0, 0), -- 30700 (Area: 4533) (possible waypoints or random movement)
(@CGUID+25, 30707, 622, 1, 1, 19.47087, 27.5296, 10.64527, 1.396263, 120, 0, 0), -- 30707 (Area: 4533) (possible waypoints or random movement)
(@CGUID+26, 30707, 622, 1, 1, -15.3085, 30.59285, 11.11614, 2.635447, 120, 0, 0), -- 30707 (Area: 0) (possible waypoints or random movement)
(@CGUID+27, 31353, 622, 1, 1, -7.999845, 17.85185, 35.04856, 2.460914, 120, 0, 0), -- 31353 (Area: 0) (possible waypoints or random movement)
(@CGUID+28, 30588, 622, 1, 1, -18.10283, -0.042108, 45.31725, 1.762783, 120, 0, 0), -- 30588 (Area: 4533) (Auras: 57424 - 57424) (possible waypoints or random movement)
(@CGUID+29, 30589, 622, 1, 1, -11.83204, -0.019289, 43.11467, 4.153883, 120, 0, 0); -- 30589 (Area: 4533) (possible waypoints or random movement)

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (30690, 30699);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (30700, 30646,30651,31353);

DELETE FROM `creature_addon` WHERE `guid` IN (122568, 122569, 122758, 122777, 124002, 124113);
 
 
/* 
* sql\updates\world\2015_11_03_02_world.sql 
*/ 
-- 
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=16573 AND `source_type`=0 AND `id`=7;
 
 
/* 
* sql\updates\world\2015_11_06_00_world_335.sql 
*/ 
--
DELETE FROM `gameobject_template` where `entry` =191146;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `VerifiedBuild`) VALUES
(191146, 6, 7205, 'Ensnaring Trap', '', '', '', 0, 0, 1, 12, 0, 5, 53077, 0, 0, -1, -18019);
 
 
/* 
* sql\updates\world\2015_11_07_00_world.sql 
*/ 
-- Page text: Saga of the Sin'dorei

DELETE FROM `page_text` WHERE `ID` IN (2823, 2824, 2825, 2826, 2827);
INSERT INTO `page_text` (`ID`, `TEXT`, `NextPageID`) VALUES
(2823, "Thousands of years ago, the exiled Highborne landed on the shores of Lordaeron and founded the enchanted kingdom of Quel'Thalas. These high elves, as they called themselves, created a fount of vast, magical energies within the heart of their land - the Sunwell. Over time, they grew dependant on the Sunwell's unstable energies- regardless of the bitter lessons they'd learned in ages past.", 2824),
(2824, "During the Third War, the villainous Prince Arthas invaded Quel'Thalas and reduced the once-mighty realm to rubble and ashes. His undead army decimated nearly ninety percent of the high elven population. In addition, he used the Sunwell's energies to resurrect Kel'thuzad - a powerful undead Lich - thereby fouling the Sunwell's mystical waters. The few elven survivors, realizing that they had been cut off from the source of their arcane power, grew increasingly volatile and desperate.", 2825),
(2825, "In the midst of the elves' darkest hour came Kael'thas Sunstrider - the last of Quel'Thalas' royal bloodline. Kael, as he was commonly known, knew that the remnants of his people would not long survive without the nourishing magics that once empowered them. Renaming his people blood elves, in honor of their fallen countrymen, he taught them how to tap into ambient mystical energies- even demonic energies - in order to sate their terrible thirst for magic.", 2826),
(2826, "In search of a new destiny for his people - referred to in the elven vernacular now as the Sin'dorei - Kael'thas ventured to the remote world of Outland where he encountered the fallen night elf, Illidan. Under Illidan's tutelage, Kael and his blood elves have regained much of their former power.", 2827),
(2827, "Unfortunately, the blood elves' practice of embracing demonic energies resulted in them being shunned by their former comrades in the Alliance. Thus, he remaining blood elves on Azeroth look desperately to the Horde to help them reach Outland, where they can reunite with Kael'thas and achieve the golden destiny he promised them.", 0);
 
 
/* 
* sql\updates\world\2015_11_07_01_world.sql 
*/ 
-- 
SET @Guid=144801;
DELETE FROM `creature` WHERE `guid` BETWEEN @Guid+0 and @Guid+41;
DELETE FROM `creature` WHERE `id`=22175;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(@Guid+0, 22175, 530, 1, 1, 0, 0, 2608.55, 7075.41, 364.496, 5.71923, 300, 5, 0, 7181, 0,  1),
(@Guid+1, 22175, 530, 1, 1, 0, 0, 2238.57, 7119.23, 365.84, 3.09914, 300, 5, 0, 7181, 0,  1),
(@Guid+2, 22175, 530, 1, 1, 0, 0, 2218.84, 7276.48, 366.109, 3.94579, 300, 5, 0, 7181, 0, 1),
(@Guid+3, 22175, 530, 1, 1, 0, 0, 2154.76, 7242.51, 371.791, 1.50713, 300, 5, 0, 7181, 0, 1),
(@Guid+4, 22175, 530, 1, 1, 0, 0, 1991.99, 7364.78, 366.955, 1.9501, 300, 5, 0, 7181, 0, 1),
(@Guid+5, 22175, 530, 1, 1, 0, 0, 2076.62, 7337.08, 365.808, 0.65419, 300, 5, 0, 7181, 0, 1),
(@Guid+6, 22175, 530, 1, 1, 0, 0, 4079.29, 5129.22, 268.446, 1.09823, 600, 5, 0, 7181, 0, 1),
(@Guid+7, 22175, 530, 1, 1, 0, 0, 2270.3, 7189.96, 364.752, 6.06008, 300, 5, 0, 7181, 0, 1),
(@Guid+8, 22175, 530, 1, 1, 0, 0, 2202.82, 7237.79, 375.415, 2.95619, 300, 5, 0, 7181, 0, 1),
(@Guid+9, 22175, 530, 1, 1, 0, 0, 2008.2, 7182.08, 369.87, 5.39014, 300, 5, 0, 7181, 0, 1),
(@Guid+10, 22175, 530, 1, 1, 0, 0, 1952.68, 7216.42, 368.281, 4.71862, 300, 5, 0, 7181, 0, 1),
(@Guid+11, 22175, 530, 1, 1, 0, 0, 2129.63, 7169.39, 366.483, 2.49909, 300, 5, 0, 7181, 0, 1),
(@Guid+12, 22175, 530, 1, 1, 0, 0, 2494.71, 7263.55, 367.219, 5.21106, 300, 5, 0, 7181, 0, 1),
(@Guid+13, 22175, 530, 1, 1, 0, 0, 2054.45, 7271.76, 365.238, 2.8211, 300, 5, 0, 7181, 0, 1),
(@Guid+14, 22175, 530, 1, 1, 0, 0, 2483.08, 7057.84, 364.585, 3.86333, 300, 5, 0, 7181, 0, 1),
(@Guid+15, 22175, 530, 1, 1, 0, 0, 2525.27, 7252.78, 365.323, 4.43352, 300, 5, 0, 7181, 0, 1),
(@Guid+16, 22175, 530, 1, 1, 0, 0, 2455.15, 7057.42, 366.643, 0.409148, 300, 5, 0, 7181, 0, 1),
(@Guid+17, 22175, 530, 1, 1, 0, 0, 2050.88, 7172.54, 369.315, 4.41232, 300, 5, 0, 7181, 0,  1),
(@Guid+18, 22175, 530, 1, 1, 0, 0, 2402.86, 7068.99, 369.09, 2.95541, 300, 5, 0, 7181, 0, 1),
(@Guid+19, 22175, 530, 1, 1, 0, 0, 2383.77, 7040.89, 379.688, 2.85331, 300, 5, 0, 7181, 0, 1),
(@Guid+20, 22175, 530, 1, 1, 0, 0, 2345.61, 7026.68, 387.225, 2.59727, 300, 5, 0, 7181, 0, 1),
(@Guid+21, 22175, 530, 1, 1, 0, 0, 2209.37, 7124.08, 364.438, 5.00765, 300, 5, 0, 7181, 0, 1),
(@Guid+22, 22175, 530, 1, 1, 0, 0, 1843.45, 7310.6, 369.195, 1.96894, 300, 5, 0, 7181, 0, 1),
(@Guid+23, 22175, 530, 1, 1, 0, 0, 1847.23, 7324.28, 368.691, 5.12624, 300, 5, 0, 7181, 0, 1),
(@Guid+24, 22175, 530, 1, 1, 0, 0, 1853.72, 7366.1, 366.072, 1.24245, 300, 5, 0, 7181, 0, 1),
(@Guid+25, 22175, 530, 1, 1, 0, 0, 2148.09, 7282.4, 368.747, 6.10328, 300, 5, 0, 7181, 0, 1),
(@Guid+26, 22175, 530, 1, 1, 0, 0, 2596.27, 7200.13, 367.541, 1.25031, 300, 5, 0, 7181, 0, 1),
(@Guid+27, 22175, 530, 1, 1, 0, 0, 2176.91, 7309.42, 372.694, 5.73415, 300, 5, 0, 7181, 0, 1),
(@Guid+28, 22175, 530, 1, 1, 0, 0, 2745.14, 7230.82, 368.577, 3.98822, 300, 5, 0, 7181, 0, 1),
(@Guid+29, 22175, 530, 1, 1, 0, 0, 2725.08, 7244.41, 369.344, 6.08051, 300, 5, 0, 7181, 0, 1),
(@Guid+30, 22175, 530, 1, 1, 0, 0, 2591.54, 7220.81, 364.005, 5.91165, 300, 5, 0, 7181, 0, 1),
(@Guid+31, 22175, 530, 1, 1, 0, 0, 2305.98, 7154.86, 365.855, 0.25991, 300, 5, 0, 7181, 0, 1),
(@Guid+32, 22175, 530, 1, 1, 0, 0, 2337.79, 7148.06, 368.183, 1.28878, 300, 5, 0, 7181, 0, 1),
(@Guid+33, 22175, 530, 1, 1, 0, 0, 2425.56, 7173.66, 366.865, 6.19438, 300, 5, 0, 7181, 0, 1),
(@Guid+34, 22175, 530, 1, 1, 0, 0, 2460.97, 7128.22, 367.7, 1.39166, 300, 5, 0, 7181, 0, 1),
(@Guid+35, 22175, 530, 1, 1, 0, 0, 2491.67, 7155.23, 369.61, 3.2884, 300, 5, 0, 7181, 0, 1),
(@Guid+36, 22175, 530, 1, 1, 0, 0, 2451.01, 7296.84, 365.796, 2.66794, 300, 5, 0, 7181, 0, 1),
(@Guid+37, 22175, 530, 1, 1, 0, 0, 2439.87, 7254.54, 369.234, 2.22419, 300, 5, 0, 7181, 0, 1),
(@Guid+38, 22175, 530, 1, 1, 0, 0, 1945.76, 7133.53, 367.456, 3.74865, 300, 5, 0, 7181, 0, 1),
(@Guid+39, 22175, 530, 1, 1, 0, 0, 2037.34, 7265.44, 367.727, 0.68482, 300, 5, 0, 7181, 0, 1),
(@Guid+40, 22175, 530, 1, 1, 0, 0, 1993.1, 7143.76, 373.431, 5.6768, 300, 5, 0, 7181, 0, 1),
(@Guid+41, 22175, 530, 1, 1, 0, 0, 1948.44, 7203.54, 366.609, 1.46472, 300, 5, 0, 7181, 0, 1);
 
 
