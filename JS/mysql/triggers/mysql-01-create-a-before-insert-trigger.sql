-- Create a BEFORE INSERT trigger.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS trigger_demo;
CREATE TABLE trigger_demo(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),created_at DATETIME);
DROP TRIGGER IF EXISTS before_trigger_demo;
DELIMITER //
CREATE TRIGGER before_trigger_demo BEFORE INSERT ON trigger_demo
FOR EACH ROW SET NEW.created_at=NOW()//
DELIMITER ;
INSERT INTO trigger_demo(name) VALUES('Sample');
SELECT * FROM trigger_demo;
