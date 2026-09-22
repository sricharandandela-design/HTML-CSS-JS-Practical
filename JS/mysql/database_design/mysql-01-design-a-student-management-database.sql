-- Design a Student Management Database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE DATABASE IF NOT EXISTS student_management; USE student_management;
CREATE TABLE students(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100) NOT NULL,email VARCHAR(150) UNIQUE);
CREATE TABLE courses(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),credits INT);
CREATE TABLE enrollments(student_id INT,course_id INT,PRIMARY KEY(student_id,course_id),
 FOREIGN KEY(student_id) REFERENCES students(id),FOREIGN KEY(course_id) REFERENCES courses(id));
