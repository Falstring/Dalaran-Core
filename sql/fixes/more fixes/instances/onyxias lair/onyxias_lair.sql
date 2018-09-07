-- Onyxia's Hitbox.
UPDATE creature_model_info SET combatreach=14.0 WHERE DisplayID=8570;

UPDATE creature_template SET ScriptName="npc_onyxia_whelp" WHERE entry=11262;

-- Laird Guard immunities.

UPDATE creature_template SET mechanic_immune_mask=650854267, flags_extra=2097152 WHERE entry IN(36571, 36561);
UPDATE creature_template SET AIName="", ScriptName="npc_onyxian_lair_guard" WHERE entry=36561;



-- Buffs

/* 10 Players Buff: 35% extra */


-- Onyxia
UPDATE creature_template SET HealthModifier=450, DamageModifier=65  WHERE entry=10184;

-- Lair Guard
UPDATE creature_template SET HealthModifier=23, DamageModifier=23 WHERE entry=36561;

-- Whelp
UPDATE creature_template SET HealthModifier=7, DamageModifier=2.3  WHERE entry=11262;



-- Onyxian Warder TRASH.
UPDATE creature_template SET HealthModifier=90, DamageModifier=14 WHERE entry=12129;



/* 25 Players 40 %*/

-- Onyxia
UPDATE creature_template SET HealthModifier=2100, DamageModifier=105  WHERE entry=36538;

-- Lair Guard
UPDATE creature_template SET HealthModifier=70, DamageModifier=50  WHERE entry=36571;

-- Whelp
UPDATE creature_template SET HealthModifier=20, DamageModifier=3.5  WHERE entry=36566;


-- Onyxian Warder TRASH.
UPDATE creature_template SET HealthModifier=200, DamageModifier=22 WHERE entry=36572;



-- She Deep Breaths More (10 player) (4404)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12566);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12566);
REPLACE INTO achievement_criteria_data VALUES(12566, 12, 0, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12566, 18, 0, 0, "");

-- She Deep Breaths More (25 player) (4407)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12569);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12569);
REPLACE INTO achievement_criteria_data VALUES(12569, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12569, 18, 0, 0, "");


-- Many Whelps! Handle It! (10 player) (4403)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12565);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12565);
REPLACE INTO achievement_criteria_data VALUES(12565, 12, 0, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12565, 18, 0, 0, "");

-- Many Whelps! Handle It! (25 player) (4406)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12568);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12568);
REPLACE INTO achievement_criteria_data VALUES(12568, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12568, 18, 0, 0, "");





-- Correction.
 UPDATE creature_loot_template SET QuestRequired=0 WHERE item=21108 AND entry  IN(10184,  36538);
 
 
 -- Onyxia text.
UPDATE creature_text SET TextRange=3 WHERE entry=10184;




-- Enable Onyxia.
--DELETE FROM disables WHERE entry=249;



DELETE FROM access_requirement WHERE mapid=249;
INSERT INTO `access_requirement` VALUES (249, 1, 80, 0, 0, 0, 0, 0, 0, 2895, 'You must complete The Secrets of Ulduar (25 players) first.', 'Onyxia - Ulduar 25 achievement.');
INSERT INTO `access_requirement` VALUES (249, 0, 80, 0, 0, 0, 0, 0, 0, 2894, 'You must complete The Secrets of Ulduar (10 players) first.', 'Onyxia - Ulduar 10 achievement.');



/* MISCELANEOUS, ONYXIA WHELPING ON THE SHOP */

/*INSERT INTO `item_template` VALUES (49362, 15, 2, -1, 'Onyxian Whelpling', 51621, 1, 134217792, 0, 1, 0, 0, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, 0, 0, -1, 0, -1, 69002, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this companion.', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340, 1, 1);*/
