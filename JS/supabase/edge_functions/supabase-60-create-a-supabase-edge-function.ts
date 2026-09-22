import { serve } from "https://deno.land/std@0.224.0/http/server.ts";
serve(async (req) => {
  const body = req.method === 'POST' ? await req.json().catch(() => ({})) : {};
  return new Response(JSON.stringify({message:'Supabase Edge Function response', body}),
    {headers:{'Content-Type':'application/json'}});
});
