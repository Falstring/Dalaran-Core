-- Fel Infernal proper immunities.

UPDATE creature_template SET mechanic_immune_mask=617166847 WHERE entry IN(34815, 35262);

UPDATE creature_template SET mechanic_immune_mask=617299967 WHERE entry IN(35263, 35264);



UPDATE creature_template SET mechanic_immune_mask=617299967 where entry IN(34825, 35278, 35279, 35280, 34813, 35265, 35266, 35267);


-- Portals

UPDATE creature_template SET healthmodifier=23 where entry IN(35279, 35266);

UPDATE creature_template SET healthmodifier=80 where entry IN(35280, 35267);




UPDATE creature_template SET flags_extra=130 WHERE entry IN(34825, 35278, 35279, 35280);