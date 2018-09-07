-- 'Carrot on a stick' 
SET @SPELL := 48402; -- new spell which actually do not have those dummy effects mentioned in the ticket
DELETE FROM spell_script_names WHERE spell_id = @SPELL;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(@SPELL, 'spell_item_carrot_on_a_stick');
UPDATE item_template SET spellid_1 = @SPELL WHERE entry = 11122; -- Item spell needs to be updated
-- Alchemist's Stone
DELETE FROM `spell_proc_event` WHERE `entry`=17619;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(17619, 0, 13, 0, 0, 0, 34816, 3, 0, 0, 0);
-- Dislodged Foreign Object (HC) (NH)
DELETE FROM `spell_proc_event` WHERE `entry` IN (71578, 71576);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(71578, 0, 0, 0, 0, 0, 0, 64, 0, 60, 0),
(71576, 0, 0, 0, 0, 0, 0, 64, 0, 60, 0);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (45043, 45044);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('45043', 'spell_item_shifting_naaru_silver'),
('45044', 'spell_item_shifting_naaru_silver');


-- Crazy Alchemist's Potion - http://www.wowhead.com/item=40077/crazy-alchemists-potion

DELETE FROM `spell_script_names` WHERE `spell_id`=53750;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('53750', 'spell_item_crazy_alchemists_potion');

-- [Engineering/Jewelcrafting] Crafted items
-- Rough Stone Statue SAI
SET @ENTRY := 18372;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,11,32253,0,0,0,0,0,23,0,0,0,0,0,0,0,"Rough Stone Statue - Out of Combat - Cast 'Stone Healing'"),
(@ENTRY,0,1,2,63,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rough Stone Statue - On Just Created - Set Reactstate Passive");

-- Coarse Stone Statue (25880)
-- Coarse Stone Statue SAI
SET @ENTRY := 18734;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,0,0,0,0,0,11,32787,0,0,0,0,0,23,0,0,0,0,0,0,0,"Coarse Stone Statue - Out of Combat - Cast 'Stone Healing'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Coarse Stone Statue - Out of Combat - Set Reactstate Passive");

-- Heavy Stone Statue (25881)
-- Heavy Stone Statue SAI
SET @ENTRY := 18735;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,0,0,0,0,0,11,32788,0,0,0,0,0,23,0,0,0,0,0,0,0,"Heavy Stone Statue - Out of Combat - Cast 'Stone Healing'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Heavy Stone Statue - Out of Combat - Set Reactstate Passive");

-- Solid Stone Statue (25882)
-- Solid Stone Statue SAI
SET @ENTRY := 18736;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,0,0,0,0,0,11,32790,0,0,0,0,0,23,0,0,0,0,0,0,0,"Solid Stone Statue - Out of Combat - Cast 'Stone Healing'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Solid Stone Statue - Out of Combat - Set Reactstate Passive");

-- Dense Stone Statue (25883)
-- Dense Stone Statue SAI
SET @ENTRY := 18737;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,0,0,0,0,0,11,32791,0,0,0,0,0,23,0,0,0,0,0,0,0,"Dense Stone Statue - Out of Combat - Cast 'Stone Healing'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dense Stone Statue - Out of Combat - Set Reactstate Passive");

-- Goblin Land Mine (4395)
DELETE FROM `creature_text` WHERE entry=7527;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`) VALUES 
(7527, 0, 0, '%s will be armed in 10 seconds!', 16, 0, 100, 0, 0, 0, 0, 'Goblin Land Mine'),
(7527, 1, 0, '%s will be armed in 5 seconds!', 16, 0, 100, 0, 0, 5871, 0, 'Goblin Land Mine'),
(7527, 2, 0, '%s is now armed!', 16, 0, 100, 0, 0, 0, 0, 'Goblin Land Mine');
UPDATE creature_template SET unit_flags = unit_flags|4|131072, AIName='', ScriptName='npc_goblin_land_mine' WHERE entry=7527;
DELETE FROM smart_scripts WHERE entryorguid=7527 AND source_type=0;

-- Goblin Bomb Dispenser (10587), trinket
-- Explosive Sheep (4384)
UPDATE creature_template SET AIName="", ScriptName="npc_pet_gen_target_following_bomb" WHERE entry IN(2675, 8937); -- sheep, bomb

-- Steam Tonk Controller (22728)
-- Battered Steam Tonk Controller (31666)
UPDATE creature_template SET spell1=24933, spell2=25024, spell3=0, spell4=27746 WHERE entry=19405; -- Steam Tonk
UPDATE creature_template SET unit_flags=4|131072, flags_extra=2, AIName='SmartAI', ScriptName='' WHERE entry=15368; -- Tonk Mine
DELETE FROM smart_scripts WHERE entryorguid=15368 AND source_type=0;
INSERT INTO smart_scripts VALUES (15368, 0, 0, 1, 60, 0, 100, 0, 3000, 3000, 1, 1, 11, 25099, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell'); -- 3 sec arming time
INSERT INTO smart_scripts VALUES (15368, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Despawn Self');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry IN(24933, 25099, 27745);
INSERT INTO conditions VALUES(13, 1, 24933, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
INSERT INTO conditions VALUES(13, 1, 25099, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
INSERT INTO conditions VALUES(13, 1, 27745, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND sourceEntry=15368;
INSERT INTO conditions VALUES(22, 1, 15368, 0, 0, 29, 1, 19405, 2, 0, 0, 0, 0, "", "Requires Steam Tonk nearby");

-- Target Dummy (4366)
-- Advanced Target Dummy (4392)
-- Masterwork Target Dummy (16023)
REPLACE INTO creature_template_addon VALUES (2673, 0, 0, 0, 0, 0, '4044');
REPLACE INTO creature_template_addon VALUES (2674, 0, 0, 0, 0, 0, '4048');
REPLACE INTO creature_template_addon VALUES (12426, 0, 0, 0, 0, 0, '19809');
UPDATE creature_template SET lootid = entry, mechanic_immune_mask = mechanic_immune_mask|32, flags_extra = flags_extra | 262144, AIName='', ScriptName='npc_target_dummy' WHERE entry IN(2673, 2674, 12426);
UPDATE creature_template SET HealthModifier=18.3809 WHERE entry=2673;
UPDATE creature_template SET HealthModifier=63.619 WHERE entry=2674;
UPDATE creature_template SET HealthModifier=124.4762 WHERE entry=12426;
DELETE FROM `creature_loot_template` WHERE entry IN(2673, 2674, 12426);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `MinCount`, `MaxCount`) VALUES 
(2673, 2592, 0, 1, 1, 1, 1),
(2673, 2841, 0, 1, 1, 1, 1),
(2673, 4359, 0, 1, 1, 1, 2),
(2673, 4363, 0, 1, 1, 1, 1),
(2673, 7191, 20, 1, 0, 1, 1),
(2674, 4234, 0, 1, 1, 2, 4),
(2674, 4382, 0, 1, 1, 1, 1),
(2674, 4387, 0, 1, 1, 1, 1),
(2674, 4389, 0, 1, 1, 1, 1),
(2674, 7191, 20, 1, 0, 1, 1),
(12426, 7191, 20, 1, 0, 1, 1),
(12426, 8170, 0, 1, 1, 1, 2),
(12426, 10561, 0, 1, 1, 1, 1),
(12426, 14047, 0, 1, 1, 2, 4),
(12426, 15994, 0, 1, 1, 1, 2),
(12426, 16000, 0, 1, 1, 1, 1);

-- DB/Dislodged Foreign Object (HC) (NH)
-- Now procs on normal, critical and blocked hits #19884
DELETE FROM `spell_proc_event` WHERE `entry` IN (71578, 71576);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(71578, 0, 0, 0, 0, 0, 0, 67, 0, 60, 0),
(71576, 0, 0, 0, 0, 0, 0, 67, 0, 60, 0);

-- Flare of the Heavens + Elemental Focus Stone + Embrace of the Spider
DELETE FROM `spell_proc_event` WHERE `entry` IN (64714, 65005, 60490);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(64714, 0, 0, 0, 0, 0, 327680, 65536, 0, 0, 45),
(65005, 0, 0, 0, 0, 0, 65536, 65536, 0, 0, 45),
(60490, 0, 0, 0, 0, 0, 81920, 65536, 0, 0, 45);

-- [Item] Bryntroll (50415) (50709)
UPDATE item_template SET spellppmRate_1=2, spellcooldown_1=500 WHERE entry IN(50415, 50709); -- 500ms cooldown just in case

-- http://www.wowhead.com/item=18645/gnomish-alarm-o-bot#created-by-spell
-- Alarm-o-Bot SAI
SET @ENTRY := 14434;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,63,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alarm-o-Bot - On Just Created - Start Random Movement"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,75,23003,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alarm-o-Bot - On Just Created - Add Aura 'Gnomish Alarm-o-Bot'");

-- [Item] Val'anyr -- http://www.wowhead.com/item=46017/valanyr-hammer-of-ancient-kings#comments:id=705194
DELETE FROM `spell_proc_event` WHERE `entry` IN (64411, 64415);
INSERT INTO `spell_proc_event` VALUES (64411, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `spell_proc_event` VALUES (64415, 0, 0, 0, 0, 0, 0, 524288, 0, 0, 45000);