-- Design a User Management Database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE DATABASE IF NOT EXISTS user_management; USE user_management;
CREATE TABLE users(id INT PRIMARY KEY AUTO_INCREMENT,username VARCHAR(50) UNIQUE,email VARCHAR(150) UNIQUE NOT NULL);
CREATE TABLE roles(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(50) UNIQUE);
CREATE TABLE user_roles(user_id INT,role_id INT,PRIMARY KEY(user_id,role_id),
 FOREIGN KEY(user_id) REFERENCES users(id),FOREIGN KEY(role_id) REFERENCES roles(id));
