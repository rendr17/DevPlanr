---
name: supabase-security-auditor
description: Security scanner and auditor for ensuring Supabase Row Level Security (RLS) policies are active and that environment variables are isolated safely.
---

# Supabase Security Auditor - Security Checklist

Use this skill when designing tables, updating SQL definitions, deploying the Supabase backend, or auditing authentication routines in SpecPilot.

## 1. Row Level Security (RLS) Verification
Every database table created in Supabase (with the exception of read-only public lookup tables if necessary) MUST have RLS enabled.

- **Check SQL**: Verify that `ALTER TABLE <table_name> ENABLE ROW LEVEL SECURITY;` is included in all migration files.
- **Check SELECT/INSERT/UPDATE/DELETE Policies**:
  - Direct ownership: `auth.uid() = user_id`.
  - Joined table ownership:
    ```sql
    CREATE POLICY "Users can edit inputs of owned projects"
    ON project_inputs
    FOR UPDATE
    USING (
      EXISTS (
        SELECT 1
        FROM projects
        WHERE projects.id = project_inputs.project_id
          AND projects.user_id = auth.uid()
      )
    );
    ```

## 2. Secrets Leak Prevention
SpecPilot utilizes two tiers of keys for Supabase:
- **`PUBLIC_SUPABASE_ANON_KEY`**: Safe to expose to the client browser. Can only access tables matching RLS policies.
- **`SUPABASE_SERVICE_ROLE_KEY`**: Bypasses all RLS policies. **NEVER** expose this key to client-side code.

- **Check**: Audit imports of `SUPABASE_SERVICE_ROLE_KEY` or LLM API keys (`OPENAI_API_KEY`). They must only be loaded in server routes (`*.server.ts` or `/api/*` endpoints).
- **Rule**: If a key is loaded in a standard `.svelte` file or non-server `.ts` file, refactor it immediately to use SvelteKit's `$env/static/private`.

## 3. Route Guard Audits
- **Check**: Verify that `src/hooks.server.ts` blocks requests to protected routes early on when no user session exists.
- **Check**: In SvelteKit API endpoints, do not rely solely on the browser-side session. Always resolve the auth session server-side from headers/cookies via Supabase SDK helper utilities to verify project ownership.
