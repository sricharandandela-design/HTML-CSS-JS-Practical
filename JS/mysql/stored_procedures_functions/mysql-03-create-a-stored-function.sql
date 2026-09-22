-- Create a stored function.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP FUNCTION IF EXISTS grade_label;
DELIMITER //
CREATE FUNCTION grade_label(m DECIMAL(5,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
 RETURN CASE WHEN m>=90 THEN 'A' WHEN m>=80 THEN 'B' WHEN m>=70 THEN 'C' ELSE 'D' END;
END//
DELIMITER ;
SELECT name, marks, grade_label(marks) AS grade FROM students;
