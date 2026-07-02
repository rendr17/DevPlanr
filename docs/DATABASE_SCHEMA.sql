-- DevPlanr Database Schema
-- Target: Supabase PostgreSQL
-- Notes:
-- 1. Run this in Supabase SQL editor or through your migration tool.
-- 2. This schema assumes Supabase Auth is enabled.
-- 3. RLS policies are included for user-level data isolation.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Updated at trigger helper
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Users profile
CREATE TABLE IF NOT EXISTS users_profile (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name TEXT,
  avatar_url TEXT,
  role TEXT NOT NULL DEFAULT 'user',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

  CONSTRAINT users_profile_role_check CHECK (
    role IN ('user', 'admin', 'super_admin')
  )
);

CREATE TRIGGER trg_users_profile_updated_at
BEFORE UPDATE ON users_profile
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Projects
CREATE TABLE IF NOT EXISTS projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  app_type TEXT,
  platform TEXT,
  status TEXT NOT NULL DEFAULT 'draft',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

  CONSTRAINT projects_status_check CHECK (
    status IN ('draft', 'generating', 'ready', 'failed', 'archived')
  )
);

CREATE INDEX IF NOT EXISTS idx_projects_user_id ON projects(user_id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON projects(status);
CREATE INDEX IF NOT EXISTS idx_projects_created_at ON projects(created_at DESC);

CREATE TRIGGER trg_projects_updated_at
BEFORE UPDATE ON projects
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Project inputs
CREATE TABLE IF NOT EXISTS project_inputs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID NOT NULL UNIQUE REFERENCES projects(id) ON DELETE CASCADE,
  raw_idea TEXT NOT NULL,
  target_users TEXT,
  main_features TEXT,
  business_context TEXT,
  technical_preferences TEXT,
  output_preferences JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_project_inputs_project_id ON project_inputs(project_id);

CREATE TRIGGER trg_project_inputs_updated_at
BEFORE UPDATE ON project_inputs
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Generated documents
CREATE TABLE IF NOT EXISTS generated_documents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  document_type TEXT NOT NULL,
  title TEXT NOT NULL,
  content_markdown TEXT NOT NULL,
  content_json JSONB,
  version INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

  CONSTRAINT generated_documents_document_type_check CHECK (
    document_type IN (
      'product_overview',
      'prd',
      'user_stories',
      'database_schema',
      'api_endpoints',
      'task_breakdown',
      'ai_agent_prompt',
      'test_cases',
      'sprint_estimation'
    )
  )
);

CREATE INDEX IF NOT EXISTS idx_generated_documents_project_id ON generated_documents(project_id);
CREATE INDEX IF NOT EXISTS idx_generated_documents_document_type ON generated_documents(document_type);
CREATE UNIQUE INDEX IF NOT EXISTS uq_generated_documents_project_type_version
ON generated_documents(project_id, document_type, version);

CREATE TRIGGER trg_generated_documents_updated_at
BEFORE UPDATE ON generated_documents
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Generation runs
CREATE TABLE IF NOT EXISTS generation_runs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  model_name TEXT,
  status TEXT NOT NULL DEFAULT 'pending',
  input_snapshot JSONB,
  output_snapshot JSONB,
  error_message TEXT,
  prompt_tokens INTEGER,
  completion_tokens INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  completed_at TIMESTAMP WITH TIME ZONE,

  CONSTRAINT generation_runs_status_check CHECK (
    status IN ('pending', 'running', 'success', 'failed')
  )
);

CREATE INDEX IF NOT EXISTS idx_generation_runs_project_id ON generation_runs(project_id);
CREATE INDEX IF NOT EXISTS idx_generation_runs_user_id ON generation_runs(user_id);
CREATE INDEX IF NOT EXISTS idx_generation_runs_status ON generation_runs(status);
CREATE INDEX IF NOT EXISTS idx_generation_runs_created_at ON generation_runs(created_at DESC);

-- Project templates
CREATE TABLE IF NOT EXISTS project_templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  default_input JSONB DEFAULT '{}'::jsonb,
  default_prompt TEXT,
  is_public BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_project_templates_category ON project_templates(category);
CREATE INDEX IF NOT EXISTS idx_project_templates_is_public ON project_templates(is_public);

-- Optional: seed templates
INSERT INTO project_templates (name, category, description, default_input, default_prompt, is_public)
VALUES
(
  'Logistics Pickup App',
  'logistics',
  'Template for pickup request, driver assignment, tracking, and proof upload.',
  '{
    "app_type": "Internal Logistics App",
    "platform": "Web App",
    "target_users": "Customer, Admin, Driver",
    "main_features": "Pickup request, driver assignment, pickup status tracking, proof photo"
  }'::jsonb,
  'Generate a technical specification for a logistics pickup management application.',
  TRUE
),
(
  'SaaS Dashboard',
  'saas',
  'Template for a generic SaaS dashboard with auth, CRUD, reporting, and settings.',
  '{
    "app_type": "SaaS Web App",
    "platform": "Web App",
    "target_users": "Admin, User",
    "main_features": "Authentication, dashboard, CRUD, analytics, settings"
  }'::jsonb,
  'Generate a technical specification for a SaaS dashboard application.',
  TRUE
)
ON CONFLICT DO NOTHING;

-- Enable Row Level Security
ALTER TABLE users_profile ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_inputs ENABLE ROW LEVEL SECURITY;
ALTER TABLE generated_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE generation_runs ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_templates ENABLE ROW LEVEL SECURITY;

-- RLS: users_profile
CREATE POLICY "Users can view own profile"
ON users_profile
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own profile"
ON users_profile
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own profile"
ON users_profile
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- RLS: projects
CREATE POLICY "Users can view own projects"
ON projects
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own projects"
ON projects
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own projects"
ON projects
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own projects"
ON projects
FOR DELETE
USING (auth.uid() = user_id);

-- RLS: project_inputs
CREATE POLICY "Users can view own project inputs"
ON project_inputs
FOR SELECT
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = project_inputs.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can insert own project inputs"
ON project_inputs
FOR INSERT
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = project_inputs.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can update own project inputs"
ON project_inputs
FOR UPDATE
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = project_inputs.project_id
      AND projects.user_id = auth.uid()
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = project_inputs.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can delete own project inputs"
ON project_inputs
FOR DELETE
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = project_inputs.project_id
      AND projects.user_id = auth.uid()
  )
);

-- RLS: generated_documents
CREATE POLICY "Users can view own generated documents"
ON generated_documents
FOR SELECT
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = generated_documents.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can insert own generated documents"
ON generated_documents
FOR INSERT
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = generated_documents.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can update own generated documents"
ON generated_documents
FOR UPDATE
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = generated_documents.project_id
      AND projects.user_id = auth.uid()
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = generated_documents.project_id
      AND projects.user_id = auth.uid()
  )
);

CREATE POLICY "Users can delete own generated documents"
ON generated_documents
FOR DELETE
USING (
  EXISTS (
    SELECT 1
    FROM projects
    WHERE projects.id = generated_documents.project_id
      AND projects.user_id = auth.uid()
  )
);

-- RLS: generation_runs
CREATE POLICY "Users can view own generation runs"
ON generation_runs
FOR SELECT
USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own generation runs"
ON generation_runs
FOR INSERT
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own generation runs"
ON generation_runs
FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- RLS: project_templates
CREATE POLICY "Anyone authenticated can view public templates"
ON project_templates
FOR SELECT
USING (is_public = TRUE AND auth.role() = 'authenticated');
