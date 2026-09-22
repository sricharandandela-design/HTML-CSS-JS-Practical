-- Implement authenticated-user policies.

ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated read" ON public.students
FOR SELECT TO authenticated USING (auth.role()='authenticated');
