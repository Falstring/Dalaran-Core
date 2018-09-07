-- Health Funnel
DELETE FROM `spell_bonus_data` WHERE `entry` IN (755, 3698, 3699, 3700, 11693, 11694, 11695, 27259, 47856);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
(755, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3698, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3699, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(3700, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11693, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11694, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(11695, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(27259, 0, 0.548, 0, 0, 'Warlock - Health Funnel'),
(47856, 0, 0.548, 0, 0, 'Warlock - Health Funnel');

-- Soulstone Ressurection
DELETE FROM `spell_ranks` WHERE (`first_spell_id`='20707');
INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
('20707', '20707', '1'),
('20707', '20762', '2'),
('20707', '20763', '3'),
('20707', '20764', '4'),
('20707', '20765', '5'),
('20707', '27239', '6'),
('20707', '47883', '7');

-- Pet Scaling
DELETE FROM spell_script_names WHERE spell_id IN(34947, 34956, 34957, 34958, 61013, -34947, -34956, -34957, -34958, -61013);
INSERT INTO spell_script_names VALUES (34947, 'spell_warl_pet_scaling');
INSERT INTO spell_script_names VALUES (34956, 'spell_warl_pet_scaling');
INSERT INTO spell_script_names VALUES (34957, 'spell_warl_pet_scaling');
INSERT INTO spell_script_names VALUES (34958, 'spell_warl_pet_scaling');
INSERT INTO spell_script_names VALUES (61013, 'spell_warl_pet_scaling');

-- [Warlock] Eye of Kilrogg
DELETE FROM spell_script_names WHERE spell_id IN(126);
INSERT INTO spell_script_names VALUES (126, 'spell_warl_eye_of_kilrogg');

-- [Warlock] Glyph of Shadowflame
DELETE FROM spell_proc_event WHERE `entry`=63310;
INSERT INTO spell_proc_event VALUES (63310, 0, 5, 0, 65536, 0, 65536, 1+2+1024, 0, 0, 0);