-- spell_hun_savagery
DELETE FROM `spell_script_names` WHERE `spell_id`=50871;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(50871, 'spell_hun_savagery');

-- Savage Rend
DELETE FROM `spell_proc_event` WHERE (`entry`='50871');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask1`, `procEx`, `CustomChance`) VALUES ('50871', '9', '1342177280', '2', '0');

-- Pet Scaling
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('34902', '34903', '34904', '61017');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('34902', 'spell_hun_pet_scaling'),
('34903', 'spell_hun_pet_scaling'),
('34904', 'spell_hun_pet_scaling'),
('61017', 'spell_hun_pet_scaling');

-- Roar of Sacrifice
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_hun_roar_of_sacrifice';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(53480, 'spell_hun_roar_of_sacrifice');


INSERT INTO `spell_bonus_data` VALUES ('24423', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('24577', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('24578', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('24579', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('27051', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('55487', '0.1196582', '0', '0.07', '0', 'Pet Skills - Demoralizing Screech');
INSERT INTO `spell_bonus_data` VALUES ('54680', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('55495', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('55496', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('55497', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('55498', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('55499', '0.1196582', '0', '0.07', '0', 'Pet Skills - Monstrous Bite');
INSERT INTO `spell_bonus_data` VALUES ('50518', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('53558', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('53559', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('53560', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('53561', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('53562', '0.1196582', '0', '0.07', '0', 'Pet Skills - Ravage');
INSERT INTO `spell_bonus_data` VALUES ('50498', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('53578', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('53579', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('53580', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('53581', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('53582', '0.1196582', '0', '0.07', '0', 'Pet Skills - Savage Rend');
INSERT INTO `spell_bonus_data` VALUES ('50256', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('53526', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('53528', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('53529', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('53532', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('53533', '0.1196582', '0', '0.07', '0', 'Pet Skills - Swipe');
INSERT INTO `spell_bonus_data` VALUES ('35290', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('35291', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('35292', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('35293', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('35294', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('35295', '0.1196582', '0', '0.07', '0', 'Pet Skills - Gore');
INSERT INTO `spell_bonus_data` VALUES ('49966', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49967', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49968', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49969', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49970', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49971', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49972', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49973', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('49974', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('52475', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('52476', '0.1196582', '0', '0.07', '0', 'Pet Skills - Smack');
INSERT INTO `spell_bonus_data` VALUES ('63900', '0.1196582', '0', '0.07', '0', 'Pet Skills - Thunderstomp');
INSERT INTO `spell_bonus_data` VALUES ('50541', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('53537', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('53538', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('53540', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('53542', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('53543', '0.1196582', '0', '0.07', '0', 'Pet Skills - Snatch');
INSERT INTO `spell_bonus_data` VALUES ('27049', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16827', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16828', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16829', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16830', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16831', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('16832', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('3009', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('3010', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('52471', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');
INSERT INTO `spell_bonus_data` VALUES ('52472', '0.1196582', '0', '0.07', '0', 'Pet Skills - Claw');




INSERT INTO `spell_bonus_data` VALUES ('59881', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('59882', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('59883', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('59884', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('59885', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('59886', '0.0299', '0.0299', '0.0175', '0.0175', 'Pet Skills - Rake');
INSERT INTO `spell_bonus_data` VALUES ('55749', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('55750', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('55751', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('55752', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('55753', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('55754', '0.333', '0', '0', '0', 'Pet Skills - Acid Spit');
INSERT INTO `spell_bonus_data` VALUES ('34889', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('35323', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('55482', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('55483', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('55484', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('55485', '0.333', '0.167', '0', '0', 'Pet Skills - Fire Breath');
INSERT INTO `spell_bonus_data` VALUES ('54644', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('55488', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('55489', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('55490', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('55491', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('55492', '0.333', '0', '0', '0', 'Pet Skills - Froststorm Breath');
INSERT INTO `spell_bonus_data` VALUES ('58604', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('58607', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('58608', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('58609', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('58610', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('58611', '0.333', '0', '0', '0', 'Pet Skills - Lava Breath');
INSERT INTO `spell_bonus_data` VALUES ('24844', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('25008', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('25009', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('25010', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('25011', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('25012', '0.333', '0', '0', '0', 'Pet Skills - Lightning Breath');
INSERT INTO `spell_bonus_data` VALUES ('50479', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('53584', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('53586', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('53587', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('53588', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('53589', '0.333', '0', '0', '0', 'Pet Skills - Nether Shock');
INSERT INTO `spell_bonus_data` VALUES ('50245', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('53544', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('53545', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('53546', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('53547', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('53548', '0.333', '0', '0', '0', 'Pet Skills - Pin');
INSERT INTO `spell_bonus_data` VALUES ('35387', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('35389', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('35392', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('55555', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('55556', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('55557', '0', '0.067', '0', '0', 'Pet Skills - Poison Spit');
INSERT INTO `spell_bonus_data` VALUES ('24640', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('24583', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('24586', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('24587', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('27060', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('55728', '0', '0.067', '0', '0', 'Pet Skills - Scorpid Poison');
INSERT INTO `spell_bonus_data` VALUES ('50519', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('53564', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('53565', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('53566', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('53567', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('53568', '0.333', '0', '0', '0', 'Pet Skills - Sonic Blast');
INSERT INTO `spell_bonus_data` VALUES ('61193', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('61194', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('61195', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('61196', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('61197', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('61198', '0.333', '0.333', '0', '0', 'Pet Skills - Spirit Strike');
INSERT INTO `spell_bonus_data` VALUES ('50274', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('53593', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('53594', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('53596', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('53597', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('53598', '0', '0.333', '0', '0', 'Pet Skills - Spore Cloud');
INSERT INTO `spell_bonus_data` VALUES ('57386', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('57389', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('57390', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('57391', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('57392', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('57393', '0.333', '0', '0', '0', 'Pet Skills - Stampede');
INSERT INTO `spell_bonus_data` VALUES ('56626', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('56627', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('56628', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('56629', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('56630', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('56631', '0.333', '0', '0', '0', 'Pet Skills - Sting');
INSERT INTO `spell_bonus_data` VALUES ('50271', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('53571', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('53572', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('53573', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('53574', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('53575', '0.333', '0', '0', '0', 'Pet Skills - Tendon Rip');
INSERT INTO `spell_bonus_data` VALUES ('54706', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');
INSERT INTO `spell_bonus_data` VALUES ('55505', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');
INSERT INTO `spell_bonus_data` VALUES ('55506', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');
INSERT INTO `spell_bonus_data` VALUES ('55507', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');
INSERT INTO `spell_bonus_data` VALUES ('55508', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');
INSERT INTO `spell_bonus_data` VALUES ('55509', '0', '0.333', '0', '0', 'Pet Skills - Venom Web Spray');

-- Explosive Trap
UPDATE `spell_bonus_data` SET ap_dot_bonus = 0.05 WHERE entry = 13812;

-- Freezing Trap
UPDATE `gameobject_template` SET `Data7`='1' WHERE (`entry`=185946);

-- Mend Pet
DELETE FROM `spell_threat` WHERE `entry` IN (57894, 136, 3111, 3661, 3662, 13542, 13543, 13544, 27046, 33976, 48989, 48990);
INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES 
(57894, 0, 0, 0),
(136, 0, 0, 0),
(3111,0, 0, 0),
(3661, 0, 0, 0),
(3662, 0, 0, 0),
(13542, 0, 0, 0),
(13543, 0, 0, 0),
(13544, 0, 0, 0),
(27046, 0, 0, 0),
(33976, 0, 0, 0),
(48989, 0, 0, 0),
(48990, 0, 0, 0);

-- [Hunter] Pet's Cover
DELETE FROM spell_script_names WHERE spell_id IN(1742);
INSERT INTO spell_script_names VALUES (1742, 'spell_hun_cower');

-- Bite
DELETE FROM `spell_bonus_data` WHERE `entry` IN (17253, 17255, 17256, 17257, 17258, 17259, 17260, 17261, 27050, 52473, 52474);
