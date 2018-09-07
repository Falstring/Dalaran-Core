-- felmyst 
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x00000100, `modelid2`=22838, `InhabitType`=5 WHERE  `entry`=25038;
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=25267;
UPDATE `creature_template` SET `modelid2`=22838 WHERE `entry`=25038;
DELETE FROM `creature_text` WHERE `entry`=25038 AND `groupid`=7;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(25038, 7, 0, 'Felmyst takes a deep breath.', 41, 0, 100, 0, 0, 0, 'felmyst - BREATH_EMOTE');
UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=25038;