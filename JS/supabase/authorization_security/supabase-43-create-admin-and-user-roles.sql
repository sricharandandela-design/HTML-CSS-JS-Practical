-- Create Admin and User roles.

CREATE TABLE IF NOT EXISTS public.profiles(
 id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
 role text NOT NULL DEFAULT 'user' CHECK(role IN ('user','admin'))
);
