-- Implement subqueries.

SELECT * FROM public.students WHERE age > (SELECT AVG(age) FROM public.students);
