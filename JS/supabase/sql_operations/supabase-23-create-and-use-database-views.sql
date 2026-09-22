-- Create and use database views.

CREATE OR REPLACE VIEW public.student_summary AS SELECT department,COUNT(*) AS total FROM public.students GROUP BY department;
SELECT * FROM public.student_summary;
