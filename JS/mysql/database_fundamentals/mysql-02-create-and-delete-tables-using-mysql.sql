-- Create and delete tables using MySQL.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE IF NOT EXISTS demo_table (id INT PRIMARY KEY, name VARCHAR(50));
SHOW TABLES;
DROP TABLE IF EXISTS demo_table;
