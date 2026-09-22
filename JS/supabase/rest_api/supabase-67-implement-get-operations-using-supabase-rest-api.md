# Implement GET operations using Supabase REST API.

Supabase exposes REST endpoints for tables.

```text
GET  https://YOUR-PROJECT.supabase.co/rest/v1/students
POST https://YOUR-PROJECT.supabase.co/rest/v1/students
PATCH https://YOUR-PROJECT.supabase.co/rest/v1/students?id=eq.1
DELETE https://YOUR-PROJECT.supabase.co/rest/v1/students?id=eq.1
```

Use headers:

```text
apikey: YOUR_ANON_KEY
Authorization: Bearer YOUR_ANON_KEY
Content-Type: application/json
```

For pagination/filtering, use PostgREST query parameters such as `?department=eq.CSE` and `Range: 0-9`.
