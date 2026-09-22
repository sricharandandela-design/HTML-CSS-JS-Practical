-- Backup and restore a MySQL database.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

-- Backup: mysqldump -u root -p --routines --triggers web_practicals > backup.sql
-- Restore: mysql -u root -p web_practicals < backup.sql
