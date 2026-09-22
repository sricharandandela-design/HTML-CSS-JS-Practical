-- Restrict users to their own records.

ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
CREATE POLICY "users read own profile" ON public.students
FOR SELECT TO authenticated
USING (auth.uid() = id);
