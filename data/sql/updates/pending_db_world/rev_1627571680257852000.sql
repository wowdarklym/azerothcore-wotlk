INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1627571680257852000');

-- Added roaming movement and increased spawn time to 24h
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `spawntimesecs` = 86400 WHERE (`id` = 14339) AND (`guid` = 40656);

-- Added 2 more spawn points to Death Howl. One slightly southwest of this spawn point, and one south at the broken shrine near entrance of felwood
DELETE FROM `creature` WHERE (`guid` IN (152290, 152291));
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(152290, 14339, 0, 0, 0, 1, 1, 11412, 0, 4079.03, -1199.045, 287.02, 0, 86400, 5, 0, 1, 0, 1, 0, 0, 0, '', 0), --  Southwest
(152291, 14339, 0, 0, 0, 1, 1, 11412, 0, 3854.92,-1665.23,257.232, 0, 86400, 5, 0, 1, 0, 1, 0, 0, 0, '', 0); -- Broken shrine on Morlos Aran

-- Added his 3 spawn points to the pool creature and added those 3 to a common pool template (367), with a max of 1 spawn at the same time
DELETE FROM `pool_template` WHERE `entry` = 367;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)  VALUES (367, 1, "Death Howl Spawns");

DELETE FROM `pool_creature` WHERE `guid` IN (40656, 152290 ,152291);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
(40656, 367, 0, "Death Howl Spawn 1"),
(152290, 367, 0, "Death Howl Spawn 2"),
(152291, 367, 0, "Death Howl Spawn 3");

