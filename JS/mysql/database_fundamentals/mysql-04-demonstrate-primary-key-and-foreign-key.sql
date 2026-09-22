-- Demonstrate primary key and foreign key.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE departments (id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees (id INT PRIMARY KEY, name VARCHAR(100), dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES departments(id));
