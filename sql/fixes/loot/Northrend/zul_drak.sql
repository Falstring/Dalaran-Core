-- [Quest Item][WoTLK][Zul'Drak] Unliving Choker -- http://www.wowhead.com/item=38660/unliving-choker
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=28519 AND `SourceEntry`=38660;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1, 28519, 38660, 0, 0, 9, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon taken'),
(1, 28519, 38660, 0, 1, 28, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon completed'),
(1, 28519, 38660, 0, 2, 14, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon none');