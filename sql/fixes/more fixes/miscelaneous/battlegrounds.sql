UPDATE battleground_template SET MinPlayersPerTeam=7 WHERE id IN(3, 7, 9);

UPDATE battleground_template SET MinPlayersPerTeam=6 WHERE id IN(32);



UPDATE battleground_template SET weight=0 WHERE id=30;




UPDATE creature_template SET RegenHealth=0, mechanic_immune_mask=344276858 WHERE entry IN(28781, 32796);

UPDATE creature_template SET mechanic_immune_mask=617299967 WHERE entry IN(28781, 32796);