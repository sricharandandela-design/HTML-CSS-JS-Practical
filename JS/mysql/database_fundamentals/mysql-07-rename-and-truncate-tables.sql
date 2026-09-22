-- Rename and truncate tables.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

CREATE TABLE old_table (id INT);
INSERT INTO old_table VALUES (1),(2),(3);
RENAME TABLE old_table TO renamed_table;
TRUNCATE TABLE renamed_table;
SELECT * FROM renamed_table;
