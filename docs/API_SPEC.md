# API Specification - DevPlanr

## 1. Overview

This document describes the API endpoints required for DevPlanr MVP.

Base path:

```txt
/api
```

Authentication:

- All `/api/projects/*` routes require authenticated session.
- User must own the project being accessed.
- Server must never expose service role key or AI provider key.

## 2. Error Format

All API errors should follow this format:

```json
{
  "error": {
    "code": "UNAUTHORIZED",
    "message": "You must be logged in to access this resource."
  }
}
```

Common error codes:

```txt
UNAUTHORIZED
FORBIDDEN
NOT_FOUND
VALIDATION_ERROR
AI_GENERATION_FAILED
INTERNAL_SERVER_ERROR
```

## 3. Auth Endpoints

Auth is handled by Supabase Auth, but the app may expose helper routes or server actions.

### Get Current User

```txt
GET /api/auth/me
```

Response:

```json
{
  "user": {
    "id": "uuid",
    "email": "user@example.com"
  },
  "profile": {
    "full_name": "Rendi",
    "role": "user"
  }
}
```

## 4. Project Endpoints

### 4.1 Get Projects

```txt
GET /api/projects
```

Query parameters:

| Name | Type | Required | Description |
|---|---|---|---|
| page | number | no | Page number |
| limit | number | no | Items per page |
| status | string | no | Filter by project status |
| search | string | no | Search by project name |

Response:

```json
{
  "data": [
    {
      "id": "uuid",
      "name": "Pickup App",
      "description": "Aplikasi untuk mengelola pickup barang",
      "app_type": "Internal Logistics App",
      "platform": "Web App",
      "status": "ready",
      "created_at": "2026-07-02T00:00:00.000Z",
      "updated_at": "2026-07-02T00:00:00.000Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 1
  }
}
```

### 4.2 Create Project

```txt
POST /api/projects
```

Request:

```json
{
  "name": "Pickup App",
  "description": "Aplikasi untuk mengelola pickup barang",
  "app_type": "Internal Logistics App",
  "platform": "Web App",
  "raw_idea": "Saya ingin membuat aplikasi pickup barang.",
  "target_users": "Customer, Admin, Driver",
  "main_features": "Pickup request, driver assignment, status tracking, proof photo",
  "business_context": "Internal logistics operation",
  "technical_preferences": "SvelteKit, Supabase, Tailwind"
}
```

Response:

```json
{
  "id": "uuid",
  "message": "Project created successfully"
}
```

Validation:

- `name` is required.
- `raw_idea` is required and must be meaningful.
- `platform` is optional.
- `technical_preferences` is optional.

### 4.3 Get Project Detail

```txt
GET /api/projects/:id
```

Response:

```json
{
  "id": "uuid",
  "name": "Pickup App",
  "description": "Aplikasi untuk mengelola pickup barang",
  "app_type": "Internal Logistics App",
  "platform": "Web App",
  "status": "ready",
  "input": {
    "raw_idea": "Saya ingin membuat aplikasi pickup barang.",
    "target_users": "Customer, Admin, Driver",
    "main_features": "Pickup request, driver assignment, status tracking, proof photo",
    "business_context": "Internal logistics operation",
    "technical_preferences": "SvelteKit, Supabase, Tailwind"
  },
  "documents": [
    {
      "id": "uuid",
      "document_type": "prd",
      "title": "Product Requirements Document",
      "version": 1
    }
  ]
}
```

### 4.4 Update Project

```txt
PATCH /api/projects/:id
```

Request:

```json
{
  "name": "Pickup Management App",
  "description": "Aplikasi untuk request pickup, assignment driver, dan tracking.",
  "app_type": "Internal Logistics App",
  "platform": "Web App"
}
```

Response:

```json
{
  "message": "Project updated successfully"
}
```

### 4.5 Archive Project

```txt
DELETE /api/projects/:id
```

Behavior:

- Soft delete by setting project status to `archived`.

Response:

```json
{
  "message": "Project archived successfully"
}
```

## 5. Project Input Endpoints

### 5.1 Update Project Input

```txt
PATCH /api/projects/:id/input
```

Request:

```json
{
  "raw_idea": "Saya ingin membuat aplikasi pickup barang.",
  "target_users": "Customer, Admin, Driver",
  "main_features": "Pickup request, driver assignment, tracking, proof photo",
  "business_context": "Internal logistics team",
  "technical_preferences": "SvelteKit, Supabase, Tailwind",
  "output_preferences": {
    "include_prd": true,
    "include_user_stories": true,
    "include_database_schema": true,
    "include_api_endpoints": true,
    "include_task_breakdown": true,
    "include_ai_agent_prompt": true,
    "include_test_cases": true,
    "include_sprint_estimation": true
  }
}
```

Response:

```json
{
  "message": "Project input updated successfully"
}
```

## 6. AI Generation Endpoints

### 6.1 Generate Documents

```txt
POST /api/projects/:id/generate
```

Request:

```json
{
  "document_types": [
    "product_overview",
    "prd",
    "user_stories",
    "database_schema",
    "api_endpoints",
    "task_breakdown",
    "ai_agent_prompt",
    "test_cases",
    "sprint_estimation"
  ]
}
```

Response:

```json
{
  "generation_run_id": "uuid",
  "status": "success",
  "documents": [
    {
      "document_type": "prd",
      "title": "Product Requirements Document",
      "content_markdown": "# PRD\n\n..."
    }
  ]
}
```

Server behavior:

1. Validate session.
2. Check project ownership.
3. Create generation run.
4. Update project status to `generating`.
5. Build prompt.
6. Call AI provider.
7. Parse response.
8. Save each document.
9. Update generation run to `success`.
10. Update project status to `ready`.

Failure behavior:

1. Update generation run to `failed`.
2. Store error message.
3. Update project status to `failed`.
4. Return clear error response.

### 6.2 Regenerate Section

```txt
POST /api/projects/:id/regenerate
```

Request:

```json
{
  "document_type": "api_endpoints",
  "instruction": "Make the API endpoints more RESTful and include request/response examples."
}
```

Response:

```json
{
  "generation_run_id": "uuid",
  "document": {
    "id": "uuid",
    "document_type": "api_endpoints",
    "title": "API Endpoints",
    "content_markdown": "# API Endpoints\n\n...",
    "version": 2
  }
}
```

## 7. Document Endpoints

### 7.1 Get Documents

```txt
GET /api/projects/:id/documents
```

Response:

```json
{
  "data": [
    {
      "id": "uuid",
      "document_type": "prd",
      "title": "Product Requirements Document",
      "content_markdown": "# PRD\n\n...",
      "version": 1,
      "created_at": "2026-07-02T00:00:00.000Z",
      "updated_at": "2026-07-02T00:00:00.000Z"
    }
  ]
}
```

### 7.2 Get Single Document

```txt
GET /api/projects/:id/documents/:documentId
```

Response:

```json
{
  "id": "uuid",
  "document_type": "prd",
  "title": "Product Requirements Document",
  "content_markdown": "# PRD\n\n...",
  "content_json": {},
  "version": 1
}
```

### 7.3 Update Document

```txt
PATCH /api/projects/:id/documents/:documentId
```

Request:

```json
{
  "content_markdown": "# Updated PRD\n\n..."
}
```

Response:

```json
{
  "message": "Document updated successfully"
}
```

## 8. Export Endpoints

### 8.1 Export Markdown

```txt
GET /api/projects/:id/export/markdown
```

Response headers:

```txt
Content-Type: text/markdown
Content-Disposition: attachment; filename="pickup-app-spec.md"
```

Output:

```md
# Pickup App

## Product Overview

...

## PRD

...

## User Stories

...

## Database Schema

...

## API Endpoints

...

## Task Breakdown

...

## AI Agent Prompt

...

## Test Cases

...

## Sprint Estimation

...
```

## 9. Template Endpoints

### 9.1 Get Templates

```txt
GET /api/templates
```

Response:

```json
{
  "data": [
    {
      "id": "uuid",
      "name": "Logistics Pickup App",
      "category": "logistics",
      "description": "Template for pickup request, driver assignment, tracking, and proof upload."
    }
  ]
}
```

### 9.2 Use Template

```txt
POST /api/templates/:id/use
```

Response:

```json
{
  "project_input": {
    "app_type": "Internal Logistics App",
    "platform": "Web App",
    "target_users": "Customer, Admin, Driver",
    "main_features": "Pickup request, driver assignment, pickup status tracking, proof photo"
  }
}
```

## 10. Authorization Matrix

| Resource | Action | Rule |
|---|---|---|
| Project | Read | Owner only |
| Project | Create | Authenticated user |
| Project | Update | Owner only |
| Project | Archive | Owner only |
| Project Input | Read | Project owner only |
| Project Input | Update | Project owner only |
| Document | Read | Project owner only |
| Document | Update | Project owner only |
| Generation | Run | Project owner only |
| Template | Read | Authenticated user |

## 11. Rate Limiting Recommendation

For MVP:

```txt
Free user:
- Max 5 generation runs per day
- Max 3 regenerate actions per project per day
```

Rate limits can be stored later in a `usage_limits` table. For MVP, this may be handled at application level.
