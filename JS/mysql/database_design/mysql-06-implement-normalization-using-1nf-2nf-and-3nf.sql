-- Implement normalization using 1NF, 2NF, and 3NF.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

-- 1NF: atomic values
CREATE TABLE student_1nf(student_id INT PRIMARY KEY,student_name VARCHAR(100),course VARCHAR(100));
-- 2NF: separate student and course entities from the relationship
CREATE TABLE student_2nf(id INT PRIMARY KEY,name VARCHAR(100));
CREATE TABLE course_2nf(id INT PRIMARY KEY,name VARCHAR(100));
CREATE TABLE enrollment_2nf(student_id INT,course_id INT,PRIMARY KEY(student_id,course_id));
-- 3NF: separate attributes that depend on non-key attributes
CREATE TABLE department_3nf(id INT PRIMARY KEY,name VARCHAR(100));
CREATE TABLE student_3nf(id INT PRIMARY KEY,name VARCHAR(100),department_id INT);
