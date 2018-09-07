DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (46924);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('46924', '-13810', '2', 'Bladestorm immune at Frost Trap'),
('46924', '-51514', '2', 'Bladestorm immune at Hex'),
('46924', '-116', '2', 'Bladestorm immune at FrostBolt'),
('46924', '-45524', '2', 'Bladestorm immune at Chains of Ice'),
('46924', '-68766', '2', 'Bladestorm immune at Desecration'),
('46924', '-8643', '2', 'Bladestorm immune at Kidney Shot'),
('46924', '-58617', '2', 'Bladestorm immune at Glyph of Heart Strike'),
('46924', '-33786', '2', 'Bladestorm immune at Cyclon');



DELETE FROM `spell_linked_spell` WHERE  `spell_trigger`=51722 AND `spell_effect`=-46924 ;
DELETE FROM `spell_linked_spell` WHERE  `spell_trigger`=676 AND `spell_effect`=-46924;
INSERT INTO `spell_linked_spell` VALUES (676, -46924, 1, '(War)Disarm Cancel Bladestorm');
INSERT INTO `spell_linked_spell` VALUES (51722, -46924, 1, '(Rogue)Dismantle Cancel Bladestorm');
INSERT INTO `spell_linked_spell` VALUES (64058, -46924, 1, '(Priest) Psychic Horror Cancel Bladestorm');
DELETE FROM `spell_linked_spell` WHERE  `spell_trigger`=64346 AND `spell_effect`=-46924;
INSERT INTO `spell_linked_spell` VALUES (64346, -46924, 1, '(Mage)Fiery Payback Cancel Bladestorm');
DELETE FROM `spell_linked_spell` WHERE  `spell_trigger`=53359 AND `spell_effect`=-46924;
INSERT INTO `spell_linked_spell` VALUES (53359, -46924, 1, '(Hunter)Chimera Shot(scorpid) Cancel Bladestorm');