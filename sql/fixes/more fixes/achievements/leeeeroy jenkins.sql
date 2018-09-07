UPDATE `gameobject_template` SET data7 = 2 WHERE entry = "175124";
DELETE FROM `gameobject_template` WHERE entry = "175622";
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, 
`flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, 
`data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, 
`data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, 
`VerifiedBuild`) VALUES('175622','22','0','Rookery Whelp Summoner','','','','0','4','1','0','0','0','0','0','0','15745','1','0','0','0','0','-1','0',
'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');
UPDATE `creature_template` SET unit_flags = "8" WHERE entry = "10161";