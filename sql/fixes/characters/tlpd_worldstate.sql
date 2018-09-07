-- TLPD / Vyragosa Worldstate

DELETE FROM `worldstates` WHERE  `entry`=30001;
INSERT INTO `worldstates` (`entry`, `comment`) VALUES
(30001, 'Vyragosa and TLPD - respawn time');
