-- Create an BEFORE UPDATE trigger.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS trigger_demo;
CREATE TABLE trigger_demo(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),updated_at DATETIME);
INSERT INTO trigger_demo(name) VALUES('Old Name');
DROP TRIGGER IF EXISTS before_update_demo;
DELIMITER //
CREATE TRIGGER before_update_demo BEFORE UPDATE ON trigger_demo
FOR EACH ROW SET NEW.updated_at=NOW()//
DELIMITER ;
UPDATE trigger_demo SET name='New Name' WHERE id=1;
SELECT * FROM trigger_demo;
