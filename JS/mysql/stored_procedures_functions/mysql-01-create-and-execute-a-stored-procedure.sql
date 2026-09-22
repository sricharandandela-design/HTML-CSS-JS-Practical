-- Create and execute a stored procedure.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP PROCEDURE IF EXISTS show_students;
DELIMITER //
CREATE PROCEDURE show_students()
BEGIN
 SELECT id,name,marks FROM students;
END//
DELIMITER ;
CALL show_students();
