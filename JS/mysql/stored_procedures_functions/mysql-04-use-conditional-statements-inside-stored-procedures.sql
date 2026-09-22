-- Use conditional statements inside stored procedures.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP PROCEDURE IF EXISTS classify_mark;
DELIMITER //
CREATE PROCEDURE classify_mark(IN m INT)
BEGIN
 IF m>=90 THEN SELECT 'Excellent' AS result;
 ELSEIF m>=75 THEN SELECT 'Good' AS result;
 ELSE SELECT 'Needs Improvement' AS result;
 END IF;
END//
DELIMITER ;
CALL classify_mark(86);
