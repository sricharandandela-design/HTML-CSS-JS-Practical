-- Create a Product Management CRUD database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE IF NOT EXISTS product_crud(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),price DECIMAL(10,2));
INSERT INTO product_crud(name,price) VALUES('Notebook',120);
SELECT * FROM product_crud;
UPDATE product_crud SET price=150 WHERE id=1;
DELETE FROM product_crud WHERE id=1;
