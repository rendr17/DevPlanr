---
name: bug-hunter
description: Debugger and bug hunter for identifying typescript compilation issues, database connectivity/query errors, and SvelteKit route runtime errors.
---

# Bug Hunter - Debugging & Diagnostic Protocol

Use this skill when you encounter application crashes, database failures, hydration issues, compiler errors, or test suite failures in SpecPilot.

## 1. Strict TypeScript Diagnostics
SpecPilot enforces strict TypeScript with NO `any` casting.
- **Action**: Check types defined in `src/lib/types/` or locally.
- **Common Fix**: Define concrete interfaces or fetch DB-return types using Drizzle helper utilities:
  ```typescript
  import type { InferSelectModel } from 'drizzle-orm';
  import { projects } from '$lib/server/db/schema';
  export type Project = InferSelectModel<typeof projects>;
  ```

## 2. Database & SQL Diagnostics
If a database query returns empty or throws:
- **Action 1**: Inspect the Supabase logs or Drizzle output.
- **Action 2**: Verify if the Row Level Security (RLS) is filtering out records because the user's `session.user.id` or `auth.uid()` does not match the record's `user_id`.
- **Action 3**: Ensure schemas match [DATABASE_SCHEMA.sql](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/DATABASE_SCHEMA.sql) constraints exactly. Check constraints like `projects_status_check` or `generated_documents_document_type_check`.

## 3. SvelteKit & Session Diagnostics
- **Action 1**: Check `src/hooks.server.ts` to ensure session resolution is properly propagating to `event.locals.getSession()`.
- **Action 2**: Verify route guards. Ensure protected routes under `(app)/` redirect users to `/login` if `event.locals` is empty.
- **Action 3**: Hydration failures: If a browser UI differs from Server-Side Rendered (SSR) HTML, make sure timezone logic or localstorage data is scoped within Svelte's `onMount`.

## 4. API Response Verification
Ensure all endpoints throw structured JSON errors rather than text/HTML crashes:
```typescript
try {
  // logic...
} catch (error) {
  return json({
    error: {
      code: 'INTERNAL_SERVER_ERROR',
      message: error instanceof Error ? error.message : 'An unknown error occurred.'
    }
  }, { status: 500 });
}
```
