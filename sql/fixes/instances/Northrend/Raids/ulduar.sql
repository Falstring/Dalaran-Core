-- -------------------------------------------
--                ULDUAR
-- -------------------------------------------


-- ###################
-- ### GENERAL VEZAX
-- ###################

UPDATE creature_template SET flags_extra=flags_extra|256 WHERE entry IN (33271, 33449);