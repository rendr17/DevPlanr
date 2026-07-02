# DevPlanr

**DevPlanr** is an AI-powered project planner for developers. It transforms rough app ideas into developer-ready technical documents such as PRDs, user stories, database schemas, API endpoints, task breakdowns, AI coding prompts, test cases, and sprint estimations.

Example input:

```txt
Saya ingin membuat aplikasi pickup barang.
```

Example output:

```txt
- Product Requirements Document
- User stories
- Database schema
- API endpoints
- Task breakdown
- Prompt for Codex/Claude
- Test cases
- Sprint estimation
```

## Product Vision

DevPlanr helps developers start projects with better planning instead of jumping directly into code. The goal is to make AI-assisted development more structured by producing clear specifications that can be used by developers and AI coding agents.

## Target Users

- Solo developers
- Full-stack developers
- Product managers
- Startup founders
- Technical leads
- Students and bootcamp graduates
- AI-assisted developers using Codex, Claude, Cursor, Windsurf, or similar tools

## Core Features

### MVP

- Landing page
- User authentication
- Protected dashboard
- Create project brief
- Generate technical documentation using AI
- View generated documents in tabs
- Copy each document section
- Edit generated documents
- Export all documents as Markdown
- Save projects and generated documents to database

### Generated Documents

DevPlanr generates:

1. Product overview
2. PRD
3. User stories with acceptance criteria
4. Database schema
5. API endpoints
6. Task breakdown
7. Prompt for Codex/Claude
8. Test cases
9. Sprint estimation

## Recommended Tech Stack

```txt
Frontend      : SvelteKit + TypeScript
Styling       : Tailwind CSS
UI Components : shadcn-svelte or custom components
Icons         : Lucide Icons
Backend       : SvelteKit server routes/actions
AI Layer      : Vercel AI SDK
Database      : Supabase PostgreSQL
Auth          : Supabase Auth
ORM           : Drizzle ORM
Validation    : Zod
Deployment    : Vercel
```

## Repository Documentation

```txt
README.md
PRD.md
TECHNICAL_SPEC.md
DATABASE_SCHEMA.sql
API_SPEC.md
SPRINT_PLAN.md
AI_PROMPTS.md
design.md
```

## Suggested Project Structure

```txt
src/
├── lib/
│   ├── components/
│   │   ├── ui/
│   │   ├── layout/
│   │   ├── project/
│   │   ├── documents/
│   │   └── generation/
│   ├── server/
│   │   ├── ai/
│   │   ├── auth/
│   │   ├── db/
│   │   └── services/
│   ├── schemas/
│   ├── types/
│   └── utils/
├── routes/
│   ├── +layout.svelte
│   ├── +page.svelte
│   ├── login/
│   ├── register/
│   ├── app/
│   │   ├── dashboard/
│   │   ├── projects/
│   │   ├── projects/new/
│   │   └── projects/[id]/
│   └── api/
│       └── projects/
└── app.css
```

## Environment Variables

```env
PUBLIC_SUPABASE_URL=
PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
DATABASE_URL=
AI_PROVIDER_API_KEY=
```

Notes:

- `PUBLIC_SUPABASE_URL` can be used on the client.
- `PUBLIC_SUPABASE_ANON_KEY` can be used on the client.
- `SUPABASE_SERVICE_ROLE_KEY` must only be used on the server.
- `AI_PROVIDER_API_KEY` must only be used on the server.

## MVP Development Order

1. Setup SvelteKit project.
2. Setup Tailwind CSS.
3. Setup Supabase Auth.
4. Setup database schema.
5. Build landing page.
6. Build authentication pages.
7. Build protected dashboard.
8. Build project CRUD.
9. Build AI generation endpoint.
10. Build document viewer.
11. Build copy and Markdown export.
12. Add security policies.
13. Deploy to Vercel.

## Definition of Done

The MVP is done when:

- Users can register and login.
- Users can create a project brief.
- Users can generate technical documents from a rough idea.
- Generated documents are saved to the database.
- Users can view generated documents in tabs.
- Users can copy each section.
- Users can export all documents as Markdown.
- Users can only access their own projects.
- The app is responsive.
- The app is deployed to production.
