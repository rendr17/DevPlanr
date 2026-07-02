---
name: backend-developer
description: Backend developer guidelines for database design, services logic, Vercel AI SDK calls, Supabase auth sessions, and SvelteKit endpoints.
---

# Backend Developer - Server Implementation Guidelines

Use this skill when designing backend APIs, handling authentication checks, database query transactions, and calling LLM APIs in DevPlanr.

## 1. Authentication & Guarding in SvelteKit
We utilize Supabase Auth with custom middleware in `src/hooks.server.ts` to check sessions.

- **Check Session**: Use `event.locals.getSession()` to retrieve user information.
- **Route Guarding**:
  - Automatically redirect unauthenticated requests targeting `/app/...` or `/api/...` to `/login`.
  - In server actions, check session first:
    ```typescript
    const session = await event.locals.getSession();
    if (!session) {
      throw redirect(303, '/login');
    }
    ```

## 2. Drizzle Query Guidelines
- **Schema Alignment**: Write all new schemas directly matching [DATABASE_SCHEMA.sql](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/DATABASE_SCHEMA.sql).
- **Enforce Constraints**:
  - Always implement checks for status types (e.g. check constraints on project states: `'draft'`, `'generating'`, `'ready'`, `'failed'`, `'archived'`).
  - Use exact indexing and foreign key constraints.
- **Query Projection**: Only select the columns you need for the list/dashboard views to reduce memory and CPU overhead.
  ```typescript
  // Project list projection
  const projectList = await db
    .select({
      id: projects.id,
      name: projects.name,
      status: projects.status,
      createdAt: projects.createdAt
    })
    .from(projects)
    .where(eq(projects.userId, session.user.id));
  ```

## 3. External API Integration (Vercel AI SDK)
- Standardize AI calls in services files (`src/lib/server/services/`).
- Use the standard `openai` or model wrappers to invoke structured generators.
- Log error messages, completion token counts, and input snapshots in `generation_runs`.
- Run database inserts for generated documents inside transaction blocks.
