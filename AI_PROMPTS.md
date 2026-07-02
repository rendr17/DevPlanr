# AI Prompts - SpecPilot

## 1. Purpose

This document contains the prompt designs used by SpecPilot to generate developer-ready technical documents.

SpecPilot should avoid vague prompts. The AI must receive structured context and clear output expectations.

## 2. Main System Prompt

```txt
You are a senior product manager, solution architect, and full-stack technical lead.

Your task is to transform a rough software idea into a complete developer-ready technical specification.

The output must be practical, specific, and useful for real software development.

You must think like:
- A product manager defining scope and requirements.
- A software architect designing the system.
- A backend engineer designing data and APIs.
- A QA engineer defining test cases.
- A technical lead breaking work into tasks.
- An AI-assisted developer preparing prompts for coding agents.

Prioritize MVP first.
Separate MVP features from future features.
Avoid generic advice.
Use clear Markdown.
Make the output directly useful for developers and AI coding agents.
```

## 3. Main User Prompt Template

```txt
Project name:
{{project_name}}

Raw idea:
{{raw_idea}}

Application type:
{{app_type}}

Platform:
{{platform}}

Target users:
{{target_users}}

Main features:
{{main_features}}

Business context:
{{business_context}}

Technical preferences:
{{technical_preferences}}

Generate the following documents:

1. Product overview
2. PRD
3. User stories with acceptance criteria
4. Database schema
5. API endpoints
6. Task breakdown
7. Prompt for Codex/Claude
8. Test cases
9. Sprint estimation

Rules:
- Be specific.
- Prioritize MVP.
- Separate future scope.
- Include assumptions when information is missing.
- Do not over-engineer the MVP.
- Use Markdown headings.
- Make the result usable as a repo planning document.
```

## 4. Structured Output Format

The AI should produce a response that can be parsed into the following structure:

```json
{
  "product_overview": {
    "title": "Product Overview",
    "content_markdown": ""
  },
  "prd": {
    "title": "Product Requirements Document",
    "content_markdown": ""
  },
  "user_stories": {
    "title": "User Stories",
    "content_markdown": ""
  },
  "database_schema": {
    "title": "Database Schema",
    "content_markdown": ""
  },
  "api_endpoints": {
    "title": "API Endpoints",
    "content_markdown": ""
  },
  "task_breakdown": {
    "title": "Task Breakdown",
    "content_markdown": ""
  },
  "ai_agent_prompt": {
    "title": "Prompt for Codex/Claude",
    "content_markdown": ""
  },
  "test_cases": {
    "title": "Test Cases",
    "content_markdown": ""
  },
  "sprint_estimation": {
    "title": "Sprint Estimation",
    "content_markdown": ""
  }
}
```

## 5. Product Overview Prompt

```txt
Create a product overview for the following app idea.

Input:
{{project_context}}

The overview must include:
- Product name
- One-sentence summary
- Target users
- Core value proposition
- Main use cases
- MVP feature list
- Future feature list
- Assumptions

Use clear and practical Markdown.
```

## 6. PRD Prompt

```txt
Create a Product Requirements Document for the following app idea.

Input:
{{project_context}}

The PRD must include:
1. Background
2. Problem statement
3. Goals
4. Non-goals
5. Target users
6. Core user flow
7. Functional requirements
8. Non-functional requirements
9. Success metrics
10. Risks and mitigations
11. Definition of done

Prioritize MVP and avoid unnecessary enterprise complexity.
```

## 7. User Stories Prompt

```txt
Create user stories with acceptance criteria for the following app idea.

Input:
{{project_context}}

Rules:
- Group stories by epic.
- Use this format:
  As a [user], I want to [action], so that [benefit].
- Include clear acceptance criteria for each story.
- Include MVP stories first.
- Add future stories in a separate section.
```

## 8. Database Schema Prompt

```txt
Design a database schema for the following app idea.

Input:
{{project_context}}

The schema must include:
- Main entities
- Table names
- Columns
- Data types
- Primary keys
- Foreign keys
- Important indexes
- Status enums if needed
- Notes about security and ownership
- Suggested SQL schema if possible

Keep the schema practical for an MVP.
```

## 9. API Endpoints Prompt

```txt
Design REST-style API endpoints for the following app idea.

Input:
{{project_context}}

For each endpoint include:
- Method
- Path
- Purpose
- Auth requirement
- Request body example
- Response example
- Error cases

Group endpoints by module.
Keep the API simple and practical for an MVP.
```

## 10. Task Breakdown Prompt

```txt
Break down the following app idea into implementation tasks.

Input:
{{project_context}}

The task breakdown must include:
- Setup tasks
- Database tasks
- Backend tasks
- Frontend tasks
- AI/integration tasks if relevant
- Testing tasks
- Deployment tasks

Use checkboxes.
Group tasks by development phase.
Make the tasks suitable for Codex/Claude execution.
```

## 11. AI Agent Prompt Generator

This prompt generates a coding prompt for Codex, Claude, Cursor, Windsurf, or similar tools.

```txt
Create a high-quality implementation prompt for an AI coding agent.

Input:
{{generated_spec}}

The prompt must include:
- Role instruction
- Project summary
- Tech stack
- Required features
- Database schema
- API endpoints
- UI requirements
- Implementation order
- Coding rules
- Security rules
- Testing expectations

The result should be copy-paste ready for Codex or Claude.
```

## 12. Test Case Prompt

```txt
Create test cases for the following app idea and technical specification.

Input:
{{generated_spec}}

The test cases must include:
- Authentication tests
- CRUD tests
- API tests
- Permission/security tests
- UI tests
- Error handling tests
- Edge cases
- Acceptance tests

Use a table with:
- Test ID
- Scenario
- Steps
- Expected result
- Priority
```

## 13. Sprint Estimation Prompt

```txt
Create a sprint estimation for the following project.

Input:
{{generated_spec}}

The sprint plan must include:
- Sprint number
- Sprint goal
- Duration
- Scope
- Tasks
- Deliverables
- Acceptance criteria
- Dependencies
- Risks

Assume a solo developer or small team.
Prioritize MVP.
```

## 14. Regenerate Section Prompt

```txt
You are improving one section of a technical specification.

Project context:
{{project_context}}

Existing section:
{{existing_section}}

Section to regenerate:
{{document_type}}

User instruction:
{{instruction}}

Rules:
- Keep the output consistent with the rest of the project.
- Improve clarity and usefulness.
- Do not change unrelated scope.
- Use Markdown.
- Return only the regenerated section.
```

## 15. Example Input

```txt
Project name:
Pickup Management App

Raw idea:
Saya ingin membuat aplikasi pickup barang.

Application type:
Internal Logistics App

Platform:
Web App

Target users:
Customer, Admin, Driver

Main features:
Pickup request, driver assignment, status tracking, proof photo

Technical preferences:
SvelteKit, Supabase, Tailwind
```

## 16. Example Coding Agent Prompt Output

```txt
You are a senior full-stack engineer.

Build a production-ready MVP called Pickup Management App.

The app allows customers to request pickup, admins to assign drivers, and drivers to update pickup status with proof photo.

Tech stack:
- SvelteKit
- TypeScript
- Tailwind CSS
- Supabase Auth
- Supabase PostgreSQL
- Supabase Storage
- Drizzle ORM
- Zod

Requirements:
1. Implement authentication.
2. Create customer pickup request flow.
3. Create admin assignment flow.
4. Create driver task view.
5. Allow driver to upload proof photo.
6. Track pickup status.
7. Add dashboard summary.
8. Add role-based access.

Implementation rules:
- Work incrementally.
- Build reusable components.
- Validate all inputs server-side.
- Protect all private routes.
- Use RLS for database security.
- Do not expose secrets to the client.
- Add loading, empty, and error states.
```

## 17. Prompt Quality Rules

Good SpecPilot prompts must:

- Include clear project context.
- Avoid vague wording.
- Mention target users.
- Mention platform.
- Mention technical preferences.
- Ask for MVP first.
- Ask for acceptance criteria.
- Ask for implementation-ready details.
- Ask for AI coding agent prompt.
- Ask for test cases.

Bad prompt example:

```txt
Make a plan for my app.
```

Good prompt example:

```txt
Create a technical specification for a web app that helps customers request logistics pickup, admins assign drivers, and drivers upload proof photos. Prioritize MVP and include database schema, API endpoints, task breakdown, test cases, and a prompt for Codex.
```
