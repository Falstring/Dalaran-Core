-- -------------------------------------------
-- THE VIOLET HOLD
-- -------------------------------------------


-- Add missing reputation to creatures in heroic mode.

DELETE FROM creature_onkill_reputation WHERE creature_id IN(31502, 31501, 31503, 31504, 31493, 31486, 31490, 31491, 32192);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`)
VALUES
    (31502, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31501, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31503, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31504, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31493, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31486, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31490, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31491, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31492, 1037, 1052, 7, 0, 15, 7, 0, 15, 1);
