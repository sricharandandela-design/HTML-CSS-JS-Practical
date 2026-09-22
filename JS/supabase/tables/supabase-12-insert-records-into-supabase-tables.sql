-- Insert records into Supabase tables.

INSERT INTO public.students(name,email,age,department) VALUES
('Charan','charan@example.com',18,'CSE')
ON CONFLICT (email) DO NOTHING;
