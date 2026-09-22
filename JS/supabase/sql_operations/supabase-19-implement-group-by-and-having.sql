-- Implement GROUP BY and HAVING.

SELECT department, COUNT(*) AS total FROM public.students GROUP BY department HAVING COUNT(*)>0;
