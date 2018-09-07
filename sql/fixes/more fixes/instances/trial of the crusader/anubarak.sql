
-- Correct the faction of the spheres so the permafrost also affects the burrowers and scarabs
UPDATE creature_template SET faction=1925 WHERE entry IN(34606, 34649);


-- Nerubian Burrower
UPDATE creature_template SET minlevel=82, maxlevel=82 WHERE entry IN(34607, 34648, 35655, 35656);


-- Nerubian burrower immune mechanic mask

UPDATE creature_template SET mechanic_immune_mask=617296767 WHERE entry IN(34607, 34648, 35655, 35656);



-- Make sure the spikes doesn't do damage if the player is under the ice patch, permafrost aura.
DELETE FROM spell_script_names where scriptname="spell_impale";
INSERT INTO `spell_script_names` VALUES (65919, 'spell_impale');
INSERT INTO `spell_script_names` VALUES (67858, 'spell_impale');
INSERT INTO `spell_script_names` VALUES (67859, 'spell_impale');
INSERT INTO `spell_script_names` VALUES (67860, 'spell_impale');


-- Permafrost trigger's must not be visible.
UPDATE creature_template SET modelid1=0 WHERE entry=24648;