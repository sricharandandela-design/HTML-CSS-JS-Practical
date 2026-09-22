-- Use loops inside stored procedures.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP PROCEDURE IF EXISTS number_loop;
DELIMITER //
CREATE PROCEDURE number_loop()
BEGIN
 DECLARE i INT DEFAULT 1;
 DROP TEMPORARY TABLE IF EXISTS nums;
 CREATE TEMPORARY TABLE nums(n INT);
 WHILE i<=5 DO
   INSERT INTO nums VALUES(i);
   SET i=i+1;
 END WHILE;
 SELECT * FROM nums;
END//
DELIMITER ;
CALL number_loop();
