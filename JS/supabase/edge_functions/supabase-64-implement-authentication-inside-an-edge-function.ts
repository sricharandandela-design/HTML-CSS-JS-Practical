import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { serve } from 'https://deno.land/std@0.224.0/http/server.ts';
serve(async (req) => {
  const auth = req.headers.get('Authorization') || '';
  const supabase = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {global:{headers:{Authorization:auth}}});
  const {data:{user}} = await supabase.auth.getUser();
  if(!user) return new Response(JSON.stringify({error:'Unauthorized'}),{status:401});
  return new Response(JSON.stringify({user_id:user.id}),{headers:{'Content-Type':'application/json'}});
});
