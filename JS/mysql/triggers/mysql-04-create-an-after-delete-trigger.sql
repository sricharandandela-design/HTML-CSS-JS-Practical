-- Create an AFTER DELETE trigger.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS trigger_log,trigger_demo;
CREATE TABLE trigger_demo(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100));
CREATE TABLE trigger_log(message VARCHAR(255),created_at DATETIME);
INSERT INTO trigger_demo(name) VALUES('Delete Me');
DROP TRIGGER IF EXISTS after_delete_demo;
DELIMITER //
CREATE TRIGGER after_delete_demo AFTER DELETE ON trigger_demo
FOR EACH ROW INSERT INTO trigger_log VALUES(CONCAT('Deleted: ',OLD.name),NOW())//
DELIMITER ;
DELETE FROM trigger_demo WHERE id=1;
SELECT * FROM trigger_log;
