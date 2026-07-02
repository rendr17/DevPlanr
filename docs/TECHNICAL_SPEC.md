# Technical Specification - SpecPilot

## 1. Overview

SpecPilot is a full-stack AI-powered web application that converts rough software ideas into structured developer-ready documentation.

The app consists of:

- Public landing page
- Authentication
- Protected dashboard
- Project management
- AI generation service
- Document viewer
- Markdown export
- Database persistence
- Security policies

## 2. Recommended Tech Stack

### Frontend

- SvelteKit
- TypeScript
- Tailwind CSS
- shadcn-svelte or custom UI components
- Lucide Icons

### Backend

- SvelteKit server routes
- SvelteKit server actions
- Zod validation

### Database

- Supabase PostgreSQL
- Drizzle ORM

### Authentication

- Supabase Auth

### AI Layer

- Vercel AI SDK
- OpenAI, Anthropic, or another compatible LLM provider

### Deployment

- Vercel

## 3. Architecture

```txt
User
 ↓
SvelteKit UI
 ↓
Protected App Routes
 ↓
Project Brief Form
 ↓
SvelteKit Server API
 ↓
AI Generation Service
 ↓
LLM Provider
 ↓
Structured Output Parser
 ↓
Supabase PostgreSQL
 ↓
Document Viewer
```

## 4. Modules

### 4.1 Auth Module

Responsibilities:

- Register
- Login
- Logout
- Session check
- Route protection
- Profile creation

Pages:

```txt
/login
/register
/app/dashboard
```

Server utilities:

```txt
src/lib/server/auth/session.ts
src/lib/server/auth/guards.ts
```

### 4.2 Project Module

Responsibilities:

- Create project
- Read project list
- Read project detail
- Update project
- Archive project

Pages:

```txt
/app/projects
/app/projects/new
/app/projects/[id]
```

Server utilities:

```txt
src/lib/server/services/project-service.ts
```

### 4.3 AI Generation Module

Responsibilities:

- Build AI prompt
- Validate input
- Call AI provider
- Parse result
- Save documents
- Track generation runs
- Handle errors

Routes:

```txt
POST /api/projects/[id]/generate
POST /api/projects/[id]/regenerate
```

Files:

```txt
src/lib/server/ai/prompt-builder.ts
src/lib/server/ai/generate-spec.ts
src/lib/server/ai/output-schema.ts
```

### 4.4 Document Module

Responsibilities:

- Display generated documents
- Edit documents
- Copy sections
- Regenerate sections
- Export Markdown

Pages:

```txt
/app/projects/[id]
```

API:

```txt
GET   /api/projects/[id]/documents
PATCH /api/projects/[id]/documents/[documentId]
GET   /api/projects/[id]/export/markdown
```

## 5. Data Model

### Entity Overview

```txt
users_profile
projects
project_inputs
generated_documents
generation_runs
project_templates
```

### Relationships

```txt
auth.users 1 -> 1 users_profile
auth.users 1 -> many projects
projects 1 -> 1 project_inputs
projects 1 -> many generated_documents
projects 1 -> many generation_runs
```

## 6. Project Status

```txt
draft       : Project created but not generated yet
generating  : AI generation is in progress
ready       : Documents are generated
failed      : Last generation attempt failed
archived    : Project is archived
```

## 7. Generation Status

```txt
pending
running
success
failed
```

## 8. Document Types

```txt
product_overview
prd
user_stories
database_schema
api_endpoints
task_breakdown
ai_agent_prompt
test_cases
sprint_estimation
```

## 9. AI Generation Flow

1. User opens project detail.
2. User clicks Generate.
3. Client calls `POST /api/projects/[id]/generate`.
4. Server validates session.
5. Server verifies project ownership.
6. Server fetches project and project input.
7. Server creates generation run with status `running`.
8. Server builds prompt.
9. Server calls AI provider.
10. Server parses output.
11. Server saves each document section.
12. Server updates generation run to `success`.
13. Server updates project status to `ready`.
14. Client displays generated documents.

Failure flow:

1. AI call fails or returns invalid output.
2. Server updates generation run to `failed`.
3. Server stores error message.
4. Server updates project status to `failed`.
5. Client shows error and retry option.

## 10. Validation

Use Zod for:

- Project creation input
- Project update input
- AI generation request
- Document update request
- AI output structure

Example project schema:

```ts
import { z } from 'zod';

export const createProjectSchema = z.object({
  name: z.string().min(2).max(120),
  description: z.string().max(500).optional(),
  app_type: z.string().optional(),
  platform: z.string().optional(),
  raw_idea: z.string().min(10),
  target_users: z.string().optional(),
  main_features: z.string().optional(),
  business_context: z.string().optional(),
  technical_preferences: z.string().optional()
});
```

## 11. Security Requirements

### Route Protection

All `/app` routes require authenticated user session.

### API Protection

All `/api/projects/*` routes require authenticated user session.

### Ownership Check

Before reading, updating, generating, or exporting a project, the server must verify that:

```txt
project.user_id === current_user.id
```

### RLS

Supabase Row Level Security must be enabled for:

- users_profile
- projects
- project_inputs
- generated_documents
- generation_runs

### Secret Management

Never expose these to the client:

```env
SUPABASE_SERVICE_ROLE_KEY
DATABASE_URL
AI_PROVIDER_API_KEY
```

Only use server-side modules for AI provider calls.

## 12. Performance Requirements

- Use server-side pagination for project list.
- Avoid loading generated documents until project detail is opened.
- Lazy load Markdown renderer if needed.
- Use optimistic UI only for simple actions such as archive.
- Avoid heavy UI libraries.
- Keep initial landing page bundle small.

## 13. Error Handling

### User-Facing Errors

- Invalid login
- Project not found
- Unauthorized access
- Generation failed
- Export failed
- Document save failed

### System Logs

Track:

- Generation status
- AI model used
- Input snapshot
- Output snapshot
- Token usage if available
- Error messages

## 14. Environment Variables

```env
PUBLIC_SUPABASE_URL=
PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
DATABASE_URL=
AI_PROVIDER_API_KEY=
```

## 15. Suggested Folder Structure

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

## 16. Markdown Export Logic

Markdown export should combine all generated documents in a predictable order:

1. Product overview
2. PRD
3. User stories
4. Database schema
5. API endpoints
6. Task breakdown
7. AI agent prompt
8. Test cases
9. Sprint estimation

Output filename:

```txt
{project-slug}-spec.md
```

## 17. Definition of Done

Technical implementation is done when:

- Auth works.
- RLS works.
- Project CRUD works.
- AI generation works.
- Generated documents are saved.
- Document viewer works.
- Copy button works.
- Markdown export works.
- Errors are handled.
- Production deployment works.
