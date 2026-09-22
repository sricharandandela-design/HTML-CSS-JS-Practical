-- Create a stored procedure with parameters.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP PROCEDURE IF EXISTS get_students_by_department;
DELIMITER //
CREATE PROCEDURE get_students_by_department(IN dept VARCHAR(50))
BEGIN
 SELECT * FROM students WHERE department=dept;
END//
DELIMITER ;
CALL get_students_by_department('CSE');
