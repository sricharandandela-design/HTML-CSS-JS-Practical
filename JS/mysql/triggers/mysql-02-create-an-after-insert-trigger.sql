-- Create an AFTER INSERT trigger.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS trigger_log,trigger_demo;
CREATE TABLE trigger_demo(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100));
CREATE TABLE trigger_log(message VARCHAR(255),created_at DATETIME);
DROP TRIGGER IF EXISTS after_trigger_demo;
DELIMITER //
CREATE TRIGGER after_trigger_demo AFTER INSERT ON trigger_demo
FOR EACH ROW INSERT INTO trigger_log VALUES(CONCAT('Inserted: ',NEW.name),NOW())//
DELIMITER ;
INSERT INTO trigger_demo(name) VALUES('Sample');
SELECT * FROM trigger_log;
