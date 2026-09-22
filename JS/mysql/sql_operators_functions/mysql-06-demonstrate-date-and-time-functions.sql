-- Demonstrate date and time functions.
-- MySQL Practical Experiment
-- Run this file in MySQL Workbench / mysql client.

CREATE DATABASE IF NOT EXISTS web_practicals;
USE web_practicals;

SELECT NOW() AS current_datetime, CURDATE() AS current_date, CURTIME() AS current_time, YEAR(CURDATE()) AS current_year;
