---
name: plan-maker
description: Plan creator for breaking down feature requests into detailed step-by-step implementation plans, aligned with the Sprint Plan and file structures.
---

# Plan Maker - Instructions & Guidelines

Use this skill when you need to design or draft an implementation plan for new features, tasks, or refactoring in SpecPilot.

## 1. Planning Methodology
Every plan must align with the MVP goals outlined in [SPRINT_PLAN.md](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/SPRINT_PLAN.md). Follow the "Definition of Ready" and "Definition of Done".

## 2. Plan Structure
When creating a plan, divide it into distinct phases:

### Phase 1: Database & Schemas (If applicable)
- Identify table alterations or additions in [DATABASE_SCHEMA.sql](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/DATABASE_SCHEMA.sql).
- Write/update Drizzle model schemas in `src/lib/server/db/schema.ts`.
- Run migrations: `npx drizzle-kit generate` & `npx drizzle-kit migrate`.

### Phase 2: Backend Logic & Business Services
- Define Zod validations in `src/lib/schemas/`.
- Build helper logic, AI service integrations, or database helper queries.
- Build server-side load functions or API endpoints.

### Phase 3: Frontend Views & Interactive Elements
- Design responsive UI layouts.
- Integrate Tailwind CSS variables, transitions, and loading states.
- Connect frontend handlers to Server Actions (`?/...`) or APIs.

### Phase 4: Verification & Automated Tests
- Test using manual workflows (Register, Login, Project Creation, and Export).
- Add integration/unit test cases using Playwright or Vitest in the `tests/` folder.

## 3. Example Plan Template
```markdown
# Implementation Plan: [Feature Name]

## 📋 Objectives
- [ ] List high-level feature requirements

## 🛠️ Step-by-Step Tasks
### Phase 1: DB Schema
- [ ] Define tables in `src/lib/server/db/schema.ts`
- [ ] Run migration commands

### Phase 2: API & Actions
- [ ] Create Zod schema in `src/lib/schemas/`
- [ ] Create endpoint `src/routes/api/...` with standardized error formatting

### Phase 3: Frontend
- [ ] Scaffold Svelte page in `src/routes/...`
- [ ] Add Tailwind dark-mode UI and transition animations

## 🧪 Testing Strategy
- [ ] Manual test: Verify [X]
- [ ] Automated test: Execute `npm run test`
```
