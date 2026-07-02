## Project Configuration

- **Language**: TypeScript
- **Package Manager**: npm
- **Add-ons**: tailwindcss

---

# SpecPilot - Project Instructions & Guidelines

Welcome to the SpecPilot repository! This document serves as the central guidance hub (`GEMINI.md`) for developers and AI assistants working on this codebase. It outlines the architecture, coding standards, database guidelines, API protocols, and UI design patterns required to build SpecPilot.

---

## 1. Project Overview & Architecture

**SpecPilot** is an AI-powered project planner that converts raw app ideas into structured, developer-ready technical documentation.

### Recommended Tech Stack
- **Frontend Framework**: SvelteKit (with TypeScript)
- **Styling**: Tailwind CSS
- **UI Components**: custom components or shadcn-svelte
- **Icons**: Lucide Icons
- **Backend Service**: SvelteKit Server Routes & Form Actions
- **AI Integration Layer**: Vercel AI SDK
- **Database**: Supabase PostgreSQL
- **Database ORM**: Drizzle ORM
- **Input Validation**: Zod
- **Authentication**: Supabase Auth
- **Deployment Platform**: Vercel

### System Flow
```txt
User Input (UI) ➔ SvelteKit Server Actions (Zod Validation) ➔ AI Generation Service ➔ Vercel AI SDK (Structured JSON Response) ➔ Supabase Database (Drizzle ORM) ➔ Document Viewer UI
```

---

## 2. Directory Structure Conventions

We strictly follow SvelteKit's standard directory structure. Maintain the codebase layout according to these conventions:

```txt
src/
├── lib/
│   ├── components/       # Reusable UI components (buttons, cards, forms, etc.)
│   ├── db/               # Database config, Drizzle schemas, and migrations
│   │   ├── schema.ts     # Drizzle schemas matching DATABASE_SCHEMA.sql
│   │   └── index.ts      # Supabase connection/Drizzle client initialization
│   ├── services/         # Business logic (AI generation, prompt assembly)
│   │   ├── ai.ts         # Vercel AI SDK wrapper and structured output logic
│   │   └── prompt.ts     # System & user prompt compilers
│   └── utils/            # Helper functions, type definitions, and formatting
├── routes/
│   ├── (auth)/           # Route grouping for Authentication
│   │   ├── login/        # Login page + action
│   │   └── register/     # Register page + action
│   ├── (app)/            # Route grouping for Protected Application
│   │   ├── dashboard/    # User workspace dashboard
│   │   └── project/
│   │       ├── [id]/     # Project details & document viewer
│   │       └── new/      # Form to create new project brief
│   ├── api/              # API endpoints for async client operations
│   │   ├── projects/     # Project and document retrieval endpoints
│   │   └── auth/         # Auth helper endpoints
│   ├── +layout.svelte    # Global layout (navbar, theme, user state)
│   ├── +page.svelte      # Landing page
│   └── hooks.server.ts   # Server-side hooks (auth session resolution, route guarding)
```

---

## 3. Core Coding & Engineering Standards

### 3.1 SvelteKit & Frontend Guidelines
- **TypeScript First**: Absolutely NO `any` casting. Define interfaces and types in `src/lib/types/` or directly within component scripts when scoped locally.
- **Server Actions vs. API Endpoints**:
  - Prefer **SvelteKit Server Actions** for form submissions (`+page.server.ts` or `+page.server.js`), such as creating projects or editing documents.
  - Use **API Routes (`/api/...`)** for asynchronous operations, polling, and data fetching requested dynamically via frontend JS.
- **Reactive State**: Keep state as local as possible. When sharing across components, utilize Svelte stores (or Svelte 5 runes if transitioned) within `src/lib/stores/`.

### 3.2 Database & ORM (Drizzle)
- **Supabase Integration**: Utilize the official `@supabase/supabase-js` client combined with Srizzle ORM.
- **Schema Alignment**: Your Drizzle schema definitions (`src/lib/db/schema.ts`) must mirror `DATABASE_SCHEMA.sql` exactly, incorporating proper foreign key constraints, default values, and indexes.
- **Database Safety & RLS**:
  - Row Level Security (RLS) is strictly enabled on all tables (except public configurations if any).
  - All queries made in SvelteKit server hooks or routes must assert ownership based on the authenticated user's ID (`user_id`).
  - Never execute DB queries bypassing the owner checks.

### 3.3 Security & Environment Isolation
- **API and Secret Keys**: Under no circumstance should the Supabase `service_role` key or any LLM API provider keys (OpenAI, Anthropic, etc.) be exposed to the client-side bundle. All interactions with these keys must happen strictly in `*.server.ts` routes/actions or secure API endpoints.
- **Input Validation**: Every form submission and API body payload must be validated server-side using **Zod**. Maintain shared schemas in `src/lib/utils/validation.ts`.

---

## 4. API & Error Formatting

To keep responses consistent across the platform, strictly enforce the following patterns:

### 4.1 API Error Pattern
All API endpoints (`/api/*`) must return a JSON error payload matching this signature upon failure:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable explanation of what went wrong."
  }
}
```

Standard error codes include:
- `UNAUTHORIZED`: When session or credentials are missing/invalid.
- `FORBIDDEN`: When the user tries to access a project they do not own.
- `NOT_FOUND`: When a requested resource (project, document) does not exist.
- `VALIDATION_ERROR`: When request payload fails Zod schema validations.
- `AI_GENERATION_FAILED`: When the LLM provider or parser fails.
- `INTERNAL_SERVER_ERROR`: Generic system failures.

---

## 5. UI/UX & Design Guidelines

As established in `design.md`, SpecPilot aims to deliver a premium, minimal, developer-focused dark-mode friendly user interface.

### 5.1 Color Palette Usage
- Make extensive use of Tailwind class names.
- Provide a clean and responsive dark mode using tailwind's `dark:` modifier.
- Maintain CSS variables for themes if using custom UI blocks to ensure easy adjustments.

### 5.2 Key Visual Requirements
- **Code Highlighting**: Always render generated AI prompts, database schemas, and API lists within a styled code-block with a copy-to-clipboard trigger.
- **Responsive Workspace**: The dashboard and document viewer must be highly responsive, optimized for both wide monitors (for side-by-side editing/viewing) and mobile screens.

---

## 6. Sprints & Workspace Workflow

When working on active development:
1. Refer to `SPRINT_PLAN.md` to see the tasks and deliverables mapped for the current phase.
2. Prioritize empirical verification. If a database modification is requested, execute migrations and verify the local schema before updating frontend pages.
3. Write automated unit/integration tests (using Vitest or Playwright) for key user workflows (e.g., authentication state, project creation, API schemas).
4. Do not commit or push any changes containing hardcoded test tokens or private credentials.

---

*This document is a foundational mandate for the SpecPilot project. Update it only when project-wide conventions or tech stack requirements are formally modified.*
