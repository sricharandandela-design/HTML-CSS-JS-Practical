-- Implement SQL joins.

SELECT s.name,d.name AS department FROM public.students s LEFT JOIN public.departments d ON s.department=d.name;
