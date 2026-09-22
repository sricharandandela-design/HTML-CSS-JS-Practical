-- Implement NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE constraint_demo (
 id INT PRIMARY KEY,
 username VARCHAR(50) NOT NULL UNIQUE,
 age INT CHECK (age >= 17),
 city VARCHAR(50) DEFAULT 'Chennai'
);
INSERT INTO constraint_demo(id,username,age) VALUES (1,'charan',18);
SELECT * FROM constraint_demo;
