-- Alter table structure using ALTER TABLE.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE alter_demo (id INT PRIMARY KEY, name VARCHAR(50));
ALTER TABLE alter_demo ADD COLUMN email VARCHAR(100);
ALTER TABLE alter_demo MODIFY COLUMN name VARCHAR(100) NOT NULL;
ALTER TABLE alter_demo DROP COLUMN email;
DESCRIBE alter_demo;
