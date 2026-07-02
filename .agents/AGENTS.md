# SpecPilot Workspace Rules

These guidelines are automatically applied to all tasks performed within the SpecPilot workspace.

## 1. Coding Style & Language Requirements
- **Strict TypeScript**: Do not use `any` casting. Properly type all Svelte components, helper utilities, and database adapters.
- **SvelteKit Server Actions**: Use server actions for form posts (e.g., in `+page.server.ts`). Avoid using generic client-side REST calls for forms unless asynchronous search/filtering is requested.
- **API Error Handling**: All endpoints under `/api/*` must return the standard `{ error: { code: string, message: string } }` pattern.

## 2. Row Level Security (RLS) & Security Audits
- **RLS Guard**: RLS is enabled on all tables in Supabase. Any SQL/Drizzle query MUST explicitly filter by `user_id = session.user.id`.
- **Secret Leaks**: Never print, log, or commit private keys (`service_role` key, OpenAI/Anthropic API keys). Ensure they are loaded via `$env/static/private` or `$env/dynamic/private`.

## 3. UI/UX & Design Alignment
- **Aesthetic Excellence**: Follow the sleek, premium dark-mode theme instructions.
- **Tailwind**: Utilize Tailwind CSS classes. Use the `dark:` prefix for dark mode capability.
- **Visual Skeletons & Code Highlighting**: Use skeleton screens for loading generated documents and always embed code snippets in copyable, formatted markdown code-blocks.

## 4. Development Workflow
- **Database Schema Verification**: If you modify any table structures, update `DATABASE_SCHEMA.sql` first, run `npx drizzle-kit generate` to build migration files, and inspect the generated SQL before modifying server actions or routes.
- **Commit Safety**: Ensure no temporary developer tokens or test environment variables are stored in the repo.

## 5. Automatic Custom Skill Triggering
- **Proactive Skill Usage**: Before starting any task or whenever a change is requested, you MUST evaluate the available project skills in `.agents/skills/` and proactively read the corresponding `SKILL.md` instructions using `view_file` to guide your implementation:
  - For project planning: read `plan-maker`
  - For implementing new features: read `feature-creator`
  - For frontend pages, CSS, Svelte stores, and views: read `frontend-developer` and `designer`
  - For backend routes, load functions, and server-side logic: read `backend-developer` and `sveltekit-action-api-builder`
  - For database operations, Drizzle ORM, schema changes, and query design: read `drizzle-schema-manager`
  - For Vercel AI SDK setup, structured generation, or prompt templates: read `ai-generation-core`
  - For testing flows (Vitest / Playwright): read `automated-tester`
  - For security policies and environment validation: read `supabase-security-auditor`
  - For code optimization and final checking: read `code-reviewer`
  - For debugging errors or fixing test failures: read `bug-hunter`

