---
name: code-reviewer
description: Technical code reviewer for assessing SvelteKit, Drizzle, and TypeScript code against optimization, performance, security, and styling guidelines.
---

# Code Reviewer - Code Quality & Security Checklist

Use this skill when reviewing pull requests, checking your own modifications before submitting, or verifying another agent's work in DevPlanr.

## 1. Security & Authorization Auditing
- **Check**: Look for any db queries to `projects`, `project_inputs`, `generated_documents`, or `generation_runs`.
  - *Rule*: They must filter by `user_id = session.user.id` or matching foreign keys (e.g. joined table checks).
  - *Incorrect*: `db.select().from(projects).where(eq(projects.id, id))`
  - *Correct*: `db.select().from(projects).where(and(eq(projects.id, id), eq(projects.userId, session.user.id)))`
- **Check**: Ensure all private keys like `SUPABASE_SERVICE_ROLE_KEY` or `OPENAI_API_KEY` are imported via `$env/static/private` or `$env/dynamic/private`.
  - *Rule*: Never import these in client components/scripts.

## 2. Strict Type Integrity
- **Check**: Scan for any instances of `any`.
  - *Rule*: Replace with accurate typed declarations or interfaces.
- **Check**: SvelteKit type helpers should be imported where applicable (`PageServerLoad`, `Action`, `Actions`, `RequestHandler`, etc.).

## 3. Styling & Styling Consistency
- **Check**: Tailwind usage. Make sure components use the `dark:` prefix for responsive dark mode styling.
- **Check**: Use semantic markup elements (`<header>`, `<main>`, `<footer>`, `<article>`, `<nav>`) and proper heading hierarchies (`<h1>`, `<h2>`).
- **Check**: All interactive items must have a unique `id` and descriptive attributes for accessibility.

## 4. Performance & Database Transaction Integrity
- **Check**: Multiple async queries should be combined with `Promise.all` if they are non-dependent, or run in a Drizzle transaction if dependent.
- **Check**: When saving documents from AI, ensure it runs inside `db.transaction(...)` so that project status updates and document insertions fail or succeed as a single block.
- **Check**: Large generated documents (markdown fields) should only be fetched when on the specific project viewer page. Use query projection (selecting only `id`, `name`, `status`, `createdAt` for dashboard views) to keep payload sizes small.
