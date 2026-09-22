-- Create a User Management CRUD database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE IF NOT EXISTS user_crud(id INT PRIMARY KEY AUTO_INCREMENT,username VARCHAR(50) UNIQUE,email VARCHAR(150));
INSERT INTO user_crud(username,email) VALUES('charan','charan@demo.com');
SELECT * FROM user_crud;
UPDATE user_crud SET email='new@demo.com' WHERE username='charan';
DELETE FROM user_crud WHERE username='charan';
