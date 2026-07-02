# Step-by-Step Prompt — DevPlanr

Dokumen ini berisi prompt bertahap untuk membangun **DevPlanr**, yaitu web app AI project planner untuk developer.

Gunakan prompt ini di Codex, Claude, Cursor, Windsurf, atau AI coding agent lain secara berurutan. Jangan langsung meminta AI membuat seluruh aplikasi dalam satu prompt besar. Kerjakan per phase agar hasil lebih rapi dan mudah dikontrol.

---

## Cara Menggunakan Dokumen Ini

1. Buat repository kosong.
2. Baca `README.md`, `PRD.md`, `TECHNICAL_SPEC.md`, `DATABASE_SCHEMA.sql`, `API_SPEC.md`, `SPRINT_PLAN.md`, `AI_PROMPTS.md`, dan `design.md`.
3. Jalankan prompt dari Phase 0 sampai Phase 10 secara berurutan.
4. Setelah setiap phase selesai, jalankan app, cek error, commit perubahan.
5. Jangan lanjut ke phase berikutnya sebelum phase sebelumnya stabil.

Recommended working style:

```txt
Prompt AI → Review perubahan → Run locally → Fix error → Commit → Next phase
```

---

## Phase 0 — Project Context Prompt

Gunakan prompt ini pertama kali agar AI memahami keseluruhan project.

```txt
You are a senior full-stack engineer, product-focused software architect, and AI application developer.

We are building an MVP web app called DevPlanr.

DevPlanr is an AI-powered project planner for developers. It transforms rough app ideas into developer-ready technical documents, including:
- Product overview
- PRD
- User stories with acceptance criteria
- Database schema
- API endpoints
- Task breakdown
- Prompt for Codex/Claude
- Test cases
- Sprint estimation

Read and use the following repository documents as the source of truth:
- README.md
- PRD.md
- TECHNICAL_SPEC.md
- DATABASE_SCHEMA.sql
- API_SPEC.md
- SPRINT_PLAN.md
- AI_PROMPTS.md
- design.md
- FOLDER_STRUCTURE.md

Tech stack:
- SvelteKit
- TypeScript
- Tailwind CSS
- Supabase Auth
- Supabase PostgreSQL
- Drizzle ORM
- Zod
- Vercel AI SDK
- Vercel deployment

Important rules:
1. Build incrementally.
2. Keep the MVP simple and maintainable.
3. Do not over-engineer.
4. Use reusable components.
5. Validate server input with Zod.
6. Do not expose secret keys to the client.
7. Use environment variables properly.
8. Follow the folder structure in FOLDER_STRUCTURE.md.
9. Explain important decisions before changing code.
10. After each phase, summarize what was changed and what should be tested.

Do not start coding yet. First, confirm the implementation order and list the files you expect to create or modify in Phase 1.
```

Expected output from AI:

```txt
- Ringkasan pemahaman project
- Urutan implementasi
- Daftar file untuk Phase 1
- Risiko awal
```

---

## Phase 1 — Initialize SvelteKit Project

```txt
Initialize the DevPlanr MVP project using SvelteKit, TypeScript, and Tailwind CSS.

Requirements:
1. Create or verify the SvelteKit project setup.
2. Configure TypeScript.
3. Configure Tailwind CSS.
4. Create the base app layout.
5. Create the initial folder structure based on FOLDER_STRUCTURE.md.
6. Add basic global styles.
7. Add a simple homepage placeholder.
8. Add a clean README setup section if missing.

Do not implement authentication or database yet.

After implementation, provide:
- Files created
- Files modified
- How to run locally
- What to test manually
```

Manual test checklist:

```txt
[ ] npm install works
[ ] npm run dev works
[ ] homepage opens
[ ] Tailwind styles work
[ ] no TypeScript error
```

Recommended commit: commit ke https://github.com/rendr17/DevPlanr.git

```txt
git add .
git commit -m "chore: initialize sveltekit project structure"
```

---

## Phase 2 — Base UI System

```txt
Build the base UI system for DevPlanr.

Create reusable components using Tailwind CSS only. Keep components lightweight.

Components to create:
- Button
- Input
- Textarea
- Select
- Card
- Badge
- Tabs
- Modal or Dialog placeholder
- Toast placeholder
- Loading skeleton
- Empty state

Design direction:
- Modern developer SaaS
- Clean
- Minimal
- Documentation-inspired
- Dark mode friendly

Requirements:
1. Put UI components in src/lib/components/ui.
2. Use TypeScript-friendly props.
3. Keep styles simple and consistent.
4. Create a small UI preview section on the homepage or a temporary /dev/ui route.
5. Do not install heavy UI libraries.

After implementation, explain each component and how it should be used.
```

Manual test checklist:

```txt
[ ] Button variants render properly
[ ] Form components are readable
[ ] Card and Badge styles are consistent
[ ] UI works on mobile width
[ ] no unnecessary dependencies added
```

Recommended commit:

```txt
git add .
git commit -m "feat: add base ui components"
```

---

## Phase 3 — Landing Page

```txt
Create the DevPlanr landing page.

Use the content and direction from README.md, PRD.md, and design.md.

Landing page sections:
1. Hero
2. Problem statement
3. How it works
4. Example input and output
5. Features
6. Target users
7. CTA

Hero copy:
Title: From rough idea to developer-ready specification.
Subtitle: DevPlanr helps developers transform simple app ideas into PRDs, user stories, database schemas, API endpoints, test cases, sprint plans, and AI coding prompts.
CTA: Start Planning
Secondary CTA: View Example

Requirements:
1. Build a polished but lightweight landing page.
2. Use reusable components where possible.
3. Make it responsive.
4. Add navigation links to Login and Register.
5. Do not implement auth yet.

After implementation, summarize the layout and responsive behavior.
```

Manual test checklist:

```txt
[ ] Landing page looks good on desktop
[ ] Landing page looks good on mobile
[ ] CTA buttons visible
[ ] Example input/output section readable
[ ] no broken navigation links
```

Recommended commit:

```txt
git add .
git commit -m "feat: create landing page"
```

---

## Phase 4 — Supabase and Environment Setup

```txt
Set up Supabase and environment configuration for DevPlanr.

Requirements:
1. Add Supabase client configuration.
2. Add server-only Supabase helper if needed.
3. Add .env.example with required variables.
4. Add environment variable documentation.
5. Prepare database connection for Drizzle ORM.
6. Do not expose service role key to the client.

Environment variables:
- PUBLIC_SUPABASE_URL
- PUBLIC_SUPABASE_ANON_KEY
- SUPABASE_SERVICE_ROLE_KEY
- DATABASE_URL
- AI_PROVIDER_API_KEY

Rules:
- PUBLIC variables may be used client-side.
- Secret variables must only be used server-side.
- Do not hardcode keys.

After implementation, explain where client-safe and server-only code lives.
```

Manual test checklist:

```txt
[ ] .env.example exists
[ ] Supabase client can be imported
[ ] secret keys are not used in client components
[ ] app still runs without production env values
```

Recommended commit:

```txt
git add .
git commit -m "chore: configure supabase environment"
```

---

## Phase 5 — Database Schema and Drizzle

```txt
Implement the database schema using DATABASE_SCHEMA.sql and Drizzle ORM.

Requirements:
1. Create Drizzle schema files.
2. Map the following tables:
   - users_profile
   - projects
   - project_inputs
   - generated_documents
   - generation_runs
   - project_templates
3. Add migration setup.
4. Add database helper utilities.
5. Keep table names and fields aligned with DATABASE_SCHEMA.sql.
6. Add indexes where useful.
7. Add notes for Supabase RLS policies.

Do not build UI features in this phase.

After implementation, provide migration instructions and explain how each table is used.
```

Manual test checklist:

```txt
[ ] database schema compiles
[ ] migration files are generated or SQL is ready
[ ] table names match docs
[ ] no schema drift from DATABASE_SCHEMA.sql
```

Recommended commit:

```txt
git add .
git commit -m "feat: add database schema and drizzle setup"
```

---

## Phase 6 — Authentication

```txt
Implement authentication using Supabase Auth.

Requirements:
1. Create /login page.
2. Create /register page.
3. Create logout action.
4. Create protected /app layout.
5. Redirect unauthenticated users to /login.
6. Redirect authenticated users to /app/dashboard.
7. Create user profile after registration or first login.
8. Add validation and error states.
9. Use clean UI components from src/lib/components/ui.

Routes:
- /login
- /register
- /app/dashboard

Security rules:
- Never expose service role key.
- Validate form input.
- Use server-side auth checks for protected routes.

After implementation, explain auth flow and session handling.
```

Manual test checklist:

```txt
[ ] user can register
[ ] user can login
[ ] user can logout
[ ] /app/dashboard is protected
[ ] invalid login shows error
[ ] authenticated user can access dashboard
```

Recommended commit:

```txt
git add .
git commit -m "feat: implement authentication"
```

---

## Phase 7 — Dashboard and Project CRUD

```txt
Build the dashboard and project management features.

Requirements:
1. Create /app/dashboard.
2. Create /app/projects.
3. Create /app/projects/new.
4. Create /app/projects/[id].
5. Implement project creation form.
6. Implement project list.
7. Implement project detail page.
8. Implement project update.
9. Implement project archive/delete as soft delete.
10. Validate inputs using Zod.
11. Only show projects owned by the current user.

Project fields:
- name
- description
- app_type
- platform
- raw_idea
- target_users
- main_features
- business_context
- technical_preferences

Dashboard should show:
- Total projects
- Ready projects
- Draft projects
- Recent projects
- New Project CTA

After implementation, explain the data flow from form to database.
```

Manual test checklist:

```txt
[ ] create project works
[ ] project appears in list
[ ] project detail opens
[ ] edit project works
[ ] archive project works
[ ] user cannot see another user's project
```

Recommended commit:

```txt
git add .
git commit -m "feat: add dashboard and project management"
```

---

## Phase 8 — AI Generation Core

```txt
Implement the AI generation core for DevPlanr.

Use AI_PROMPTS.md as the source of truth.

Requirements:
1. Create src/lib/server/ai/prompt-builder.ts.
2. Create src/lib/server/ai/generate-spec.ts.
3. Create a server API route for POST /api/projects/[id]/generate.
4. Fetch the project and project input from database.
5. Build a structured prompt.
6. Call the AI provider using Vercel AI SDK or a provider-compatible server-only function.
7. Generate the following documents:
   - Product overview
   - PRD
   - User stories
   - Database schema
   - API endpoints
   - Task breakdown
   - AI agent prompt
   - Test cases
   - Sprint estimation
8. Save each document into generated_documents.
9. Save generation status into generation_runs.
10. Handle AI errors gracefully.
11. Update project status to generating, ready, or failed.

Rules:
- API key must be server-only.
- Do not call AI directly from client components.
- Keep prompt builder testable.
- Add fallback if structured output parsing fails.

After implementation, explain how generation is triggered, saved, and displayed.
```

Manual test checklist:

```txt
[ ] generate button calls server route
[ ] loading state appears
[ ] generation_run is created
[ ] documents are saved
[ ] project status becomes ready
[ ] AI failure sets project status failed
[ ] no API key exposed to browser
```

Recommended commit:

```txt
git add .
git commit -m "feat: implement ai generation core"
```

---

## Phase 9 — Document Viewer and Editor

```txt
Build the generated document viewer and editor.

Requirements:
1. Create tab-based document viewer on /app/projects/[id].
2. Tabs:
   - Overview
   - PRD
   - User Stories
   - Database Schema
   - API Endpoints
   - Task Breakdown
   - AI Agent Prompt
   - Test Cases
   - Sprint Plan
3. Render Markdown content clearly.
4. Add copy-to-clipboard button for each tab.
5. Add edit mode for document content.
6. Save edited document to database.
7. Add regenerate button placeholder or working route if available.
8. Add empty state before generation.
9. Add error state if generation failed.

UI requirements:
- Documentation-like content area.
- Sticky top action bar.
- Clear tabs.
- Good mobile layout.

After implementation, explain the document lifecycle.
```

Manual test checklist:

```txt
[ ] generated documents appear in tabs
[ ] Markdown is readable
[ ] copy button works
[ ] edit mode works
[ ] save edit works
[ ] empty state appears before generation
```

Recommended commit:

```txt
git add .
git commit -m "feat: add document viewer and editor"
```

---

## Phase 10 — Markdown Export

```txt
Implement Markdown export for generated project documents.

Requirements:
1. Create export API route: GET /api/projects/[id]/export/markdown.
2. Fetch project and all generated documents.
3. Combine sections into one Markdown file.
4. Use clean heading structure.
5. Return file as attachment.
6. Add Export Markdown button in project detail page.
7. Ensure only project owner can export.

Export structure:
# Project Name

## Product Overview

## PRD

## User Stories

## Database Schema

## API Endpoints

## Task Breakdown

## AI Agent Prompt

## Test Cases

## Sprint Estimation

After implementation, explain the export flow.
```

Manual test checklist:

```txt
[ ] export button downloads .md file
[ ] file name is readable
[ ] all sections are included
[ ] headings are correct
[ ] unauthorized user cannot export
```

Recommended commit:

```txt
git add .
git commit -m "feat: add markdown export"
```

---

## Phase 11 — Security, RLS, and Validation

```txt
Harden DevPlanr security.

Requirements:
1. Enable Supabase RLS for all user-owned tables.
2. Add RLS policies for:
   - users_profile
   - projects
   - project_inputs
   - generated_documents
   - generation_runs
3. Ensure all server routes check the active user session.
4. Ensure users can only access their own projects.
5. Validate all API inputs with Zod.
6. Add basic generation rate limit placeholder if possible.
7. Review all environment variable usage.
8. Remove unused secrets and debug logs.

After implementation, list all security controls added.
```

Manual test checklist:

```txt
[ ] unauthenticated API requests are rejected
[ ] user cannot access another user's project
[ ] service role key is not exposed
[ ] invalid request body is rejected
[ ] RLS policies exist
```

Recommended commit:

```txt
git add .
git commit -m "chore: harden security and rls policies"
```

---

## Phase 12 — Polish and Deployment

```txt
Prepare DevPlanr for portfolio-ready deployment.

Requirements:
1. Polish landing page UI.
2. Polish dashboard UI.
3. Improve mobile responsiveness.
4. Add loading skeletons.
5. Add empty states.
6. Add user-friendly error messages.
7. Add dark mode if not yet added.
8. Update README with setup instructions.
9. Add deployment notes for Vercel.
10. Ensure production env variables are documented.
11. Run lint, typecheck, and build.

After implementation, provide final manual QA checklist and deployment instructions.
```

Manual test checklist:

```txt
[ ] npm run build succeeds
[ ] no TypeScript errors
[ ] landing page responsive
[ ] app dashboard responsive
[ ] auth works in production
[ ] generation works in production
[ ] export Markdown works in production
```

Recommended commit:

```txt
git add .
git commit -m "chore: polish and prepare deployment"
```

---

## Final QA Prompt

Gunakan prompt ini setelah semua phase selesai.

```txt
Review the entire DevPlanr codebase as a senior full-stack engineer.

Check for:
1. TypeScript errors
2. Security issues
3. Exposed secrets
4. Missing validation
5. Broken routes
6. Poor folder organization
7. Unused dependencies
8. Inconsistent UI components
9. Slow queries
10. Missing loading, empty, and error states
11. Incorrect Supabase RLS assumptions
12. Deployment risks

Return:
- Critical issues
- Important improvements
- Nice-to-have improvements
- Files that should be refactored
- Final readiness score from 1 to 10
```

---

## Recommended Commit History

```txt
chore: initialize sveltekit project structure
feat: add base ui components
feat: create landing page
chore: configure supabase environment
feat: add database schema and drizzle setup
feat: implement authentication
feat: add dashboard and project management
feat: implement ai generation core
feat: add document viewer and editor
feat: add markdown export
chore: harden security and rls policies
chore: polish and prepare deployment
```

---

## Development Rule

Jangan lanjut jika phase sebelumnya belum stabil. Untuk project portfolio, lebih baik MVP kecil tapi rapi daripada fitur banyak tapi tidak selesai.
