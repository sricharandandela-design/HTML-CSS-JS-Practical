-- Create RLS policies.

ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can read students" ON public.students
FOR SELECT TO authenticated USING (true);
