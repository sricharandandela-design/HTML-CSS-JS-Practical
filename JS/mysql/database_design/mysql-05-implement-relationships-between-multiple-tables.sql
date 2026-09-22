-- Implement relationships between multiple tables.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INT,
    department VARCHAR(50) DEFAULT 'CSE',
    marks DECIMAL(5,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3
);

CREATE TABLE IF NOT EXISTS enrollments (
    student_id INT,
    course_id INT,
    enrolled_on DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT IGNORE INTO students (id,name,email,age,department,marks) VALUES
(1,'Charan','charan@example.com',18,'CSE',86.5),
(2,'Hujefa','hujefa@example.com',19,'CSE',91),
(3,'Manvi','manvi@example.com',18,'ECE',78);
INSERT IGNORE INTO courses (course_id,course_name,credits) VALUES
(1,'Database Systems',4),(2,'Web Technology',3),(3,'Data Structures',4);
INSERT IGNORE INTO enrollments(student_id,course_id) VALUES (1,1),(1,2),(2,1),(3,3);

SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA='web_practicals' AND REFERENCED_TABLE_NAME IS NOT NULL;
