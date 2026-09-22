-- Create a Student Management CRUD database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

DROP TABLE IF EXISTS student_crud;
CREATE TABLE student_crud(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(150) UNIQUE,marks DECIMAL(5,2));
INSERT INTO student_crud(name,email,marks) VALUES('Charan','charan@demo.com',90);
SELECT * FROM student_crud;
UPDATE student_crud SET marks=95 WHERE id=1;
DELETE FROM student_crud WHERE id=1;
