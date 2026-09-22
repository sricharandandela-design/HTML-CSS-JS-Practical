-- Design a Library Management Database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE DATABASE IF NOT EXISTS library_management; USE library_management;
CREATE TABLE books(id INT PRIMARY KEY AUTO_INCREMENT,title VARCHAR(200),author VARCHAR(100));
CREATE TABLE members(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(150) UNIQUE);
CREATE TABLE loans(id INT PRIMARY KEY AUTO_INCREMENT,book_id INT,member_id INT,loan_date DATE,
 FOREIGN KEY(book_id) REFERENCES books(id),FOREIGN KEY(member_id) REFERENCES members(id));
