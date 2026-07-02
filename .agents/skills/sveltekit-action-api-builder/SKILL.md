---
name: sveltekit-action-api-builder
description: Standards and templates for SvelteKit Server Actions, API routes, Zod validation, and error payload formatting in SpecPilot.
---

# SvelteKit Actions & API Builder - Instructions & Guidelines

Use this skill when implementing SvelteKit Server Actions (for forms) and API endpoints (for async tasks), validating inputs with Zod, and formatting responses.

## 1. Choosing Between Actions and API Endpoints

Refer to the SpecPilot architectural standards:
- **Use Server Actions** (`+page.server.ts` or `+page.server.js`) for standard form submissions (e.g., login, register, new project form, updates).
- **Use API Endpoints** (`src/routes/api/...`) for async operations, client-side fetches, polling, generation triggers, or exporting.

## 2. Input Validation with Zod

All forms and API payloads must be validated server-side using Zod. Define schemas in `src/lib/schemas/` or `src/lib/utils/validation.ts`.

### Example Validation Schema (`src/lib/schemas/project.ts`):
```typescript
import { z } from 'zod';

export const createProjectSchema = z.zodObject({
  name: z.string().min(1, 'Project name is required').max(100),
  description: z.string().optional(),
  appType: z.string().min(1, 'Application type is required'),
  platform: z.string().min(1, 'Platform is required'),
  rawIdea: z.string().min(10, 'Please describe your idea with at least 10 characters'),
  targetUsers: z.string().optional(),
  mainFeatures: z.string().optional(),
  businessContext: z.string().optional(),
  technicalPreferences: z.string().optional(),
});
```

## 3. Server Action Template
Implement server actions in `+page.server.ts`:

```typescript
import { fail, redirect } from '@sveltejs/kit';
import type { Actions } from './$types';
import { createProjectSchema } from '$lib/schemas/project';
import { db } from '$lib/server/db';
import { projects } from '$lib/server/db/schema';

export const actions: Actions = {
  create: async ({ request, locals }) => {
    // 1. Authenticate user
    const session = await locals.getSession();
    if (!session?.user) {
      return fail(401, { error: 'Unauthorized' });
    }

    // 2. Validate form input
    const formData = await request.formData();
    const data = Object.fromEntries(formData.entries());
    const parseResult = createProjectSchema.safeParse(data);

    if (!parseResult.success) {
      return fail(400, {
        error: 'Validation failed',
        validationErrors: parseResult.error.flatten().fieldErrors
      });
    }

    // 3. Perform database operations
    try {
      const [newProject] = await db.insert(projects).values({
        userId: session.user.id,
        name: parseResult.data.name,
        appType: parseResult.data.appType,
        platform: parseResult.data.platform,
        status: 'draft',
      }).returning();

      return { success: true, project: newProject };
    } catch (err) {
      return fail(500, { error: 'Internal database error' });
    }
  }
};
```

## 4. Standard API Error Pattern

All API endpoints under `/api/*` MUST return standard error payloads when failing.

### Error Signature:
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable explanation of what went wrong."
  }
}
```

### Standard Error Codes:
- `UNAUTHORIZED`: Session or credentials missing.
- `FORBIDDEN`: User does not own the project.
- `NOT_FOUND`: Project or document does not exist.
- `VALIDATION_ERROR`: Zod validation fails.
- `AI_GENERATION_FAILED`: LLM failure.
- `INTERNAL_SERVER_ERROR`: Generic database or code crashes.

### API Endpoint Example (`src/routes/api/projects/[id]/generate/+server.ts`):
```typescript
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ params, locals }) => {
  const session = await locals.getSession();
  if (!session?.user) {
    return json({
      error: { code: 'UNAUTHORIZED', message: 'You must be logged in.' }
    }, { status: 401 });
  }

  // ... (ownership & existence checks)
  
  return json({ success: true });
};
```
