-- Implement an audit table using triggers.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS audit_log,audit_demo;
CREATE TABLE audit_demo(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100));
CREATE TABLE audit_log(id INT PRIMARY KEY AUTO_INCREMENT,action_name VARCHAR(50),record_id INT,logged_at DATETIME);
DROP TRIGGER IF EXISTS audit_after_insert;
DELIMITER //
CREATE TRIGGER audit_after_insert AFTER INSERT ON audit_demo
FOR EACH ROW INSERT INTO audit_log(action_name,record_id,logged_at) VALUES('INSERT',NEW.id,NOW())//
DELIMITER ;
INSERT INTO audit_demo(name) VALUES('Charan');
SELECT * FROM audit_log;
