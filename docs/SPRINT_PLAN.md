# Sprint Plan - DevPlanr

## 1. Overview

This sprint plan breaks DevPlanr MVP into 5 development sprints. Each sprint is designed to produce a usable increment.

Estimated total duration:

```txt
4 to 5 weeks
```

## 2. Sprint 1 - Foundation and Auth

Duration: 1 week

### Goal

Set up the foundation of the app and implement authentication.

### Scope

- Initialize SvelteKit project.
- Setup TypeScript.
- Setup Tailwind CSS.
- Setup base layout.
- Setup Supabase project.
- Setup Supabase client.
- Setup Drizzle ORM.
- Create database migration structure.
- Create login page.
- Create register page.
- Create protected dashboard route.
- Create user profile table.
- Implement logout.

### Tasks

```txt
[ ] Create SvelteKit project
[ ] Install Tailwind CSS
[ ] Configure TypeScript
[ ] Configure environment variables
[ ] Setup Supabase client
[ ] Setup Drizzle ORM
[ ] Create base UI components
[ ] Create landing page placeholder
[ ] Create login page
[ ] Create register page
[ ] Create auth session helper
[ ] Create protected route guard
[ ] Create dashboard page
[ ] Test register/login/logout
```

### Deliverables

- App runs locally.
- User can register.
- User can login.
- User can logout.
- Dashboard is protected.

### Acceptance Criteria

- Unauthenticated users cannot open `/app/dashboard`.
- Authenticated users can open dashboard.
- Login errors are shown clearly.
- Register errors are shown clearly.

---

## 3. Sprint 2 - Project Management

Duration: 1 week

### Goal

Allow users to create and manage project briefs.

### Scope

- Project database tables.
- New project form.
- Project list.
- Project detail page.
- Edit project.
- Archive project.
- Dashboard recent projects.

### Tasks

```txt
[ ] Create projects table
[ ] Create project_inputs table
[ ] Add RLS policies for projects
[ ] Add RLS policies for project_inputs
[ ] Create project validation schema
[ ] Create new project page
[ ] Create project form component
[ ] Create create project API/server action
[ ] Create project list page
[ ] Create project detail page
[ ] Create update project feature
[ ] Create archive project feature
[ ] Add empty state
[ ] Add loading state
```

### Deliverables

- User can create project.
- User can view project list.
- User can open project detail.
- User can edit project input.
- User can archive project.

### Acceptance Criteria

- User cannot see another user's project.
- Project creation validates required fields.
- Project list displays only current user's projects.

---

## 4. Sprint 3 - AI Generation Core

Duration: 1 week

### Goal

Generate developer-ready technical documents using AI.

### Scope

- AI prompt builder.
- Generation API route.
- AI output schema.
- Save generated documents.
- Save generation run.
- Error handling.

### Tasks

```txt
[ ] Create generated_documents table
[ ] Create generation_runs table
[ ] Add RLS policies
[ ] Create AI prompt builder
[ ] Create AI output schema
[ ] Create generation service
[ ] Create POST /api/projects/[id]/generate
[ ] Validate user session
[ ] Validate project ownership
[ ] Create generation run before AI call
[ ] Update project status to generating
[ ] Call AI provider
[ ] Parse AI response
[ ] Save generated documents
[ ] Update generation run status
[ ] Update project status to ready or failed
[ ] Add client loading state
[ ] Add error UI
```

### Deliverables

- User can generate technical documents from a project brief.
- AI result is saved in the database.
- Generation failures are logged.

### Acceptance Criteria

- Generate button works.
- Loading state appears during generation.
- Output includes all selected document types.
- Error state appears if AI fails.
- Project data is not deleted when generation fails.

---

## 5. Sprint 4 - Document Viewer and Export

Duration: 1 week

### Goal

Allow users to read, edit, copy, regenerate, and export generated documents.

### Scope

- Document tabs.
- Markdown rendering.
- Copy section.
- Edit document.
- Regenerate document section.
- Markdown export.

### Tasks

```txt
[ ] Create document viewer layout
[ ] Create document tab navigation
[ ] Create Markdown renderer
[ ] Create copy button
[ ] Create edit document mode
[ ] Create update document API
[ ] Create regenerate section API
[ ] Create export Markdown API
[ ] Create download Markdown button
[ ] Add empty document state
[ ] Add success/error toast
```

### Deliverables

- User can view generated documents in tabs.
- User can copy document section.
- User can edit generated content.
- User can export all documents as Markdown.

### Acceptance Criteria

- Copy button writes to clipboard.
- Edited content persists after refresh.
- Exported Markdown contains all sections in correct order.
- Regenerate creates a new version.

---

## 6. Sprint 5 - Polish, Security, and Deployment

Duration: 1 week

### Goal

Prepare the app for portfolio/demo production.

### Scope

- Landing page polish.
- Responsive UI.
- Dark mode.
- Loading skeletons.
- Empty states.
- Security checks.
- RLS verification.
- Production deployment.

### Tasks

```txt
[ ] Polish landing page
[ ] Add responsive sidebar
[ ] Add mobile navigation
[ ] Add dark mode
[ ] Add loading skeletons
[ ] Add empty states
[ ] Add error states
[ ] Verify all RLS policies
[ ] Verify API authorization checks
[ ] Verify environment variables
[ ] Deploy to Vercel
[ ] Test production auth
[ ] Test production project creation
[ ] Test production AI generation
[ ] Test Markdown export
[ ] Update README
```

### Deliverables

- App is deployed.
- App is responsive.
- App is secure enough for MVP.
- Repo documentation is complete.

### Acceptance Criteria

- Production app works.
- No API keys exposed in client bundle.
- User cannot access another user's project.
- App is ready to be shown in a portfolio.

---

## 7. Backlog

### High Priority

```txt
[ ] AI generation
[ ] Markdown export
[ ] Auth and RLS
[ ] Document viewer
[ ] Project CRUD
```

### Medium Priority

```txt
[ ] Regenerate per section
[ ] Edit generated document
[ ] Template examples
[ ] Dark mode
[ ] Usage limit
```

### Low Priority

```txt
[ ] PDF export
[ ] DOCX export
[ ] GitHub issue export
[ ] Team workspace
[ ] Public share link
[ ] ERD generator
[ ] Architecture diagram
```

## 8. Test Plan

### Auth

```txt
[ ] Register with valid email
[ ] Register with invalid email
[ ] Login with correct credentials
[ ] Login with wrong password
[ ] Access dashboard without login
[ ] Logout
```

### Project

```txt
[ ] Create project with valid input
[ ] Create project without name
[ ] Create project without raw idea
[ ] View project list
[ ] Open project detail
[ ] Edit project
[ ] Archive project
```

### AI Generation

```txt
[ ] Generate documents from complete input
[ ] Generate documents from short input
[ ] Handle AI provider error
[ ] Handle invalid AI response
[ ] Save generation run
[ ] Save generated documents
```

### Documents

```txt
[ ] View PRD tab
[ ] View user stories tab
[ ] View database schema tab
[ ] View API endpoints tab
[ ] Copy document content
[ ] Edit document content
[ ] Export Markdown
```

### Security

```txt
[ ] User A cannot access User B project
[ ] Unauthenticated API request is rejected
[ ] Client cannot access service role key
[ ] RLS policies are active
```

## 9. Definition of Ready

A sprint is ready when:

- User stories are clear.
- Acceptance criteria are defined.
- Required database changes are known.
- API requirements are known.
- UI direction is clear.

## 10. Definition of Done

A feature is done when:

- It works locally.
- It is validated.
- It has loading/error states.
- It respects auth and ownership.
- It is responsive.
- It does not expose secrets.
- It is documented if needed.
