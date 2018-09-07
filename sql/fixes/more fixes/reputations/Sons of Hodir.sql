
-- Mending Fences and A Spark of Hope reputation correction.
UPDATE quest_template SET RewardFactionOverride1=2860000 WHERE id IN(12915, 12956);


-- Hot and cold, Krolmir, Hammer of storms, Spy Hunter, Polishing the helm
UPDATE quest_template SET RewardFactionOverride1=45500 WHERE id IN(12981, 13010, 12994, 13006);


-- Raising Hodir's Spear,
UPDATE quest_template SET RewardFactionOverride1=32500 WHERE id IN(13001);


-- Thrusting Hodir's Spear, Hodir's Tribute
UPDATE quest_template SET RewardFactionOverride1=65000 WHERE id IN(13003, 13559);