-- Warlock pets expertise + hit aura calculation.

DELETE FROM spell_script_names WHERE spell_id IN(34947, 34956, 34957, 34958,61013);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(61013, 'spell_warl_pet_scaling_05')
;


-- Felguard base stats corrected.

UPDATE pet_levelstats SET str=314, agi=130, spi=209,armor=14033 WHERE creature_entry=17252 AND level=80;


/*61013 has quitado este (61013, 'spell_gen_pet_calculate'), 19591,35695,61017, 61783, (19591, 'spell_gen_pet_calculate'), (61783, 'spell_gen_pet_calculate');
(35695, 'spell_gen_pet_calculate'),
(61017, 'spell_gen_pet_calculate'),
(61697, 'spell_gen_pet_calculate'),*/

DELETE FROM `spell_script_names` WHERE `spell_id` IN (61697);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(61697, 'spell_gen_pet_calculate');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (35695);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(35695, 'spell_gen_pet_calculate');


DELETE FROM `spell_linked_spell` WHERE `spell_trigger` =54566;
INSERT INTO `spell_linked_spell` (`spell_trigger` ,`spell_effect` ,`type` ,`comment`) VALUES
(54566,61697,0,'Death Knight Pet Scaling 03'); -- Risen Ghoul

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` =61697;
INSERT INTO `spell_linked_spell` (`spell_trigger` ,`spell_effect` ,`type` ,`comment`) VALUES
(61697,35695,0,'Pet Passive Crit'); -- Risen Ghoul


/*DELETE FROM `creature_template_addon` WHERE `entry` = 29264;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29264,0,0,0,1,0,'61783'); -- Spirit Wolf
*/
