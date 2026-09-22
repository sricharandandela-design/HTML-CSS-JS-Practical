-- Demonstrate different MySQL data types.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE data_types_demo (
 id INT,
 student_name VARCHAR(100),
 dob DATE,
 fee DECIMAL(10,2),
 active BOOLEAN,
 joined_at DATETIME,
 notes TEXT
);
DESCRIBE data_types_demo;
