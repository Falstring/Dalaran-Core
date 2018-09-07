-- Fix Hakkari items drop
DELETE FROM creature_loot_template WHERE item IN(10780,10781,10782);
UPDATE item_template SET RequiredLevel=46 WHERE entry IN(10780,10781,10782);