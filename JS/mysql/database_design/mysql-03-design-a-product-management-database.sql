-- Design a Product Management Database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE DATABASE IF NOT EXISTS product_management; USE product_management;
CREATE TABLE categories(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100) UNIQUE);
CREATE TABLE products(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(150),price DECIMAL(10,2),category_id INT,
 FOREIGN KEY(category_id) REFERENCES categories(id));
