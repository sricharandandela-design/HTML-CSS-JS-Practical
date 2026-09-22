-- Use aggregate functions such as COUNT, SUM, AVG, MIN, and MAX.

SELECT COUNT(*) AS total, AVG(age) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age FROM public.students;
