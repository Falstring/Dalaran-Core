DELETE FROM gameobject WHERE id=193772;

DELETE FROM creature_text WHERE entry IN(32169, 32170);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(32169, 0, 0, "Reinforcements are needed on the Wintergrasp battlefield! I have opened a portal for quick travel to the battle at The Silver Enclave.", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP BATTLE START"),
(32169, 1, 0, "The battle for control of Wintergrasp will begin in 5 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 5 minutes"),
(32169, 2, 0, "The battle for control of Wintergrasp will begin in 10 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 10 minutes"),
(32169, 3, 0, "The battle for control of Wintergrasp will begin in 15 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 15 minutes"),
(32170, 0, 0, "Reinforcements are needed on the Wintergrasp battlefield! I have opened a portal for quick travel to the battle at The Sunreaver's Sanctuary.", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP BATTLE START"),
(32170, 1, 0, "The battle for control of Wintergrasp will begin in 5 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 5 minutes"),
(32170, 2, 0, "The battle for control of Wintergrasp will begin in 10 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 10 minutes"),
(32170, 3, 0, "The battle for control of Wintergrasp will begin in 15 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 15 minutes");




UPDATE quest_template SET prevquestid=0 WHERE ID IN(13631, 13819);