-- Earth Shield
UPDATE `spell_bonus_data` SET `direct_bonus`='0.5371' WHERE (`entry`='974');
DELETE FROM `spell_custom_attr` WHERE `entry` IN (974, 32593, 32594);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
(974, 8388608),
(32593, 8388608),
(32594, 8388608);

-- Stoneclaw Totem
DELETE FROM `spell_custom_attr` WHERE `entry` IN (5729,6393,6394,6395,10423,10424,23790,25512,58586,58587,58588,58639);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
(5729,  64),
(6393,  64),
(6394,  64),
(6395,  64),
(10423, 64),
(10424, 64),
(23790, 64),
(25512, 64),
(58586, 64),
(58587, 64),
(58588, 64),
(58639, 64);

-- Pet Scaling
DELETE FROM spell_script_names WHERE spell_id IN(35674, 35675, 35676, 61783, -35674, -35675, -35676, -61783);
INSERT INTO spell_script_names VALUES (35674, 'spell_sha_feral_spirit_scaling');
INSERT INTO spell_script_names VALUES (35675, 'spell_sha_feral_spirit_scaling');
INSERT INTO spell_script_names VALUES (35676, 'spell_sha_feral_spirit_scaling');
INSERT INTO spell_script_names VALUES (61783, 'spell_sha_feral_spirit_scaling');
DELETE FROM spell_script_names WHERE spell_id IN(35665, 35666, 35667, 35668, -35665, -35666, -35667, -35668);
INSERT INTO spell_script_names VALUES (35665, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (35666, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (35667, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (35668, 'spell_sha_elemental_scaling');
DELETE FROM spell_script_names WHERE spell_id IN(65225, 65226, 65227, 65228, -65225, -65226, -65227, -65228);
INSERT INTO spell_script_names VALUES (65225, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (65226, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (65227, 'spell_sha_elemental_scaling');
INSERT INTO spell_script_names VALUES (65228, 'spell_sha_elemental_scaling'); 

-- Earth shield heal is DAMAGE_CLASS_NONE, it won't scale
-- Entry is unneeded
DELETE FROM `spell_bonus_data` WHERE `entry`=379;