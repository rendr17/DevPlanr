# Folder Structure — SpecPilot

Dokumen ini menjelaskan struktur folder yang disarankan untuk project **SpecPilot**.

Struktur ini dirancang untuk SvelteKit + TypeScript + Tailwind CSS + Supabase + Drizzle + Vercel AI SDK.

---

## Root Structure

```txt
specpilot/
├── docs/
│   ├── README.md
│   ├── PRD.md
│   ├── TECHNICAL_SPEC.md
│   ├── DATABASE_SCHEMA.sql
│   ├── API_SPEC.md
│   ├── SPRINT_PLAN.md
│   ├── AI_PROMPTS.md
│   ├── design.md
│   ├── STEP_BY_STEP_PROMPT.md
│   └── FOLDER_STRUCTURE.md
├── src/
│   ├── lib/
│   ├── routes/
│   ├── app.css
│   ├── app.d.ts
│   └── hooks.server.ts
├── supabase/
│   ├── migrations/
│   └── seed.sql
├── drizzle/
│   ├── meta/
│   └── migrations/
├── tests/
│   ├── unit/
│   └── e2e/
├── static/
│   ├── favicon.svg
│   └── images/
├── .env.example
├── .gitignore
├── drizzle.config.ts
├── package.json
├── svelte.config.js
├── tailwind.config.ts
├── tsconfig.json
└── vite.config.ts
```

---

## Source Folder Structure

```txt
src/
├── lib/
│   ├── components/
│   │   ├── ui/
│   │   │   ├── Button.svelte
│   │   │   ├── Input.svelte
│   │   │   ├── Textarea.svelte
│   │   │   ├── Select.svelte
│   │   │   ├── Card.svelte
│   │   │   ├── Badge.svelte
│   │   │   ├── Tabs.svelte
│   │   │   ├── Toast.svelte
│   │   │   ├── Skeleton.svelte
│   │   │   └── EmptyState.svelte
│   │   ├── layout/
│   │   │   ├── AppShell.svelte
│   │   │   ├── Sidebar.svelte
│   │   │   ├── Topbar.svelte
│   │   │   └── PublicNav.svelte
│   │   ├── project/
│   │   │   ├── ProjectForm.svelte
│   │   │   ├── ProjectCard.svelte
│   │   │   ├── ProjectTable.svelte
│   │   │   └── ProjectStatusBadge.svelte
│   │   ├── documents/
│   │   │   ├── DocumentTabs.svelte
│   │   │   ├── DocumentViewer.svelte
│   │   │   ├── MarkdownRenderer.svelte
│   │   │   ├── CopyButton.svelte
│   │   │   └── ExportButton.svelte
│   │   └── generation/
│   │       ├── GenerateButton.svelte
│   │       ├── GenerationStatus.svelte
│   │       └── GenerationError.svelte
│   ├── server/
│   │   ├── ai/
│   │   │   ├── prompt-builder.ts
│   │   │   ├── generate-spec.ts
│   │   │   ├── output-schema.ts
│   │   │   └── markdown-converter.ts
│   │   ├── auth/
│   │   │   ├── session.ts
│   │   │   └── require-user.ts
│   │   ├── db/
│   │   │   ├── index.ts
│   │   │   ├── schema.ts
│   │   │   └── queries/
│   │   │       ├── projects.ts
│   │   │       ├── documents.ts
│   │   │       └── generation-runs.ts
│   │   └── services/
│   │       ├── project-service.ts
│   │       ├── document-service.ts
│   │       └── export-service.ts
│   ├── schemas/
│   │   ├── auth.schema.ts
│   │   ├── project.schema.ts
│   │   ├── generation.schema.ts
│   │   └── document.schema.ts
│   ├── stores/
│   │   └── app.store.ts
│   ├── types/
│   │   ├── project.ts
│   │   ├── document.ts
│   │   ├── generation.ts
│   │   └── user.ts
│   └── utils/
│       ├── cn.ts
│       ├── dates.ts
│       ├── slugify.ts
│       └── clipboard.ts
├── routes/
│   ├── +layout.svelte
│   ├── +page.svelte
│   ├── login/
│   │   ├── +page.svelte
│   │   └── +page.server.ts
│   ├── register/
│   │   ├── +page.svelte
│   │   └── +page.server.ts
│   ├── app/
│   │   ├── +layout.svelte
│   │   ├── dashboard/
│   │   │   ├── +page.svelte
│   │   │   └── +page.server.ts
│   │   └── projects/
│   │       ├── +page.svelte
│   │       ├── +page.server.ts
│   │       ├── new/
│   │       │   ├── +page.svelte
│   │       │   └── +page.server.ts
│   │       └── [id]/
│   │           ├── +page.svelte
│   │           ├── +page.server.ts
│   │           └── documents/
│   │               ├── +page.svelte
│   │               └── +page.server.ts
│   └── api/
│       └── projects/
│           └── [id]/
│               ├── generate/
│               │   └── +server.ts
│               ├── documents/
│               │   ├── +server.ts
│               │   └── [documentId]/
│               │       └── +server.ts
│               └── export/
│                   └── markdown/
│                       └── +server.ts
├── app.css
├── app.d.ts
└── hooks.server.ts
```

---

## Folder Purpose

### `docs/`

Berisi dokumen planning project.

```txt
docs/
├── README.md
├── PRD.md
├── TECHNICAL_SPEC.md
├── DATABASE_SCHEMA.sql
├── API_SPEC.md
├── SPRINT_PLAN.md
├── AI_PROMPTS.md
├── design.md
├── STEP_BY_STEP_PROMPT.md
└── FOLDER_STRUCTURE.md
```

Gunakan folder ini sebagai dokumentasi utama project.

---

### `src/lib/components/ui/`

Berisi reusable UI components kecil dan ringan.

Contoh:

```txt
Button.svelte
Input.svelte
Textarea.svelte
Card.svelte
Badge.svelte
Tabs.svelte
```

Aturan:

- Jangan terlalu banyak logic di UI component.
- Jangan panggil API dari UI component dasar.
- Gunakan prop yang jelas.
- Styling harus konsisten.

---

### `src/lib/components/layout/`

Berisi layout shell aplikasi.

Contoh:

```txt
AppShell.svelte
Sidebar.svelte
Topbar.svelte
PublicNav.svelte
```

Digunakan untuk:

- Public landing page navigation.
- Protected dashboard layout.
- Sidebar app.
- Topbar project action.

---

### `src/lib/components/project/`

Berisi komponen khusus project.

Contoh:

```txt
ProjectForm.svelte
ProjectCard.svelte
ProjectTable.svelte
ProjectStatusBadge.svelte
```

Digunakan untuk:

- Create project.
- Edit project.
- Project list.
- Project dashboard.

---

### `src/lib/components/documents/`

Berisi komponen tampilan dokumen hasil AI.

Contoh:

```txt
DocumentTabs.svelte
DocumentViewer.svelte
MarkdownRenderer.svelte
CopyButton.svelte
ExportButton.svelte
```

Digunakan untuk:

- Menampilkan PRD.
- Menampilkan user stories.
- Menampilkan API spec.
- Copy section.
- Export Markdown.

---

### `src/lib/components/generation/`

Berisi komponen khusus AI generation.

Contoh:

```txt
GenerateButton.svelte
GenerationStatus.svelte
GenerationError.svelte
```

Digunakan untuk:

- Trigger generate.
- Menampilkan loading.
- Menampilkan status gagal/berhasil.

---

### `src/lib/server/ai/`

Berisi logic AI yang hanya berjalan di server.

Contoh:

```txt
prompt-builder.ts
generate-spec.ts
output-schema.ts
markdown-converter.ts
```

Aturan penting:

- Jangan import file ini dari client-side component.
- API key hanya digunakan di sini atau server route.
- Prompt builder harus mudah dites.
- Output AI harus divalidasi sebelum disimpan.

---

### `src/lib/server/auth/`

Berisi helper authentication.

Contoh:

```txt
session.ts
require-user.ts
```

Digunakan untuk:

- Mengambil current user.
- Melindungi route `/app`.
- Melindungi API route.

---

### `src/lib/server/db/`

Berisi konfigurasi database dan query.

Contoh:

```txt
index.ts
schema.ts
queries/projects.ts
queries/documents.ts
queries/generation-runs.ts
```

Aturan:

- Query database sebaiknya dikumpulkan di sini.
- Hindari query tersebar di banyak component.
- Gunakan fungsi service/query yang jelas.

---

### `src/lib/server/services/`

Berisi business logic level aplikasi.

Contoh:

```txt
project-service.ts
document-service.ts
export-service.ts
```

Digunakan untuk:

- Create project.
- Archive project.
- Generate documents.
- Export Markdown.

---

### `src/lib/schemas/`

Berisi Zod schema untuk validasi.

Contoh:

```txt
auth.schema.ts
project.schema.ts
generation.schema.ts
document.schema.ts
```

Aturan:

- Semua input dari user harus divalidasi.
- Schema dipakai di server action/API route.
- Jangan percaya data dari client.

---

### `src/lib/types/`

Berisi TypeScript types.

Contoh:

```txt
project.ts
document.ts
generation.ts
user.ts
```

Gunakan untuk menjaga konsistensi data antar module.

---

### `src/lib/utils/`

Berisi helper kecil.

Contoh:

```txt
cn.ts
dates.ts
slugify.ts
clipboard.ts
```

Aturan:

- Helper harus kecil.
- Jangan letakkan business logic berat di sini.

---

## Route Purpose

### Public Routes

```txt
src/routes/+page.svelte
src/routes/login/
src/routes/register/
```

Digunakan untuk:

- Landing page.
- Login.
- Register.

---

### Protected App Routes

```txt
src/routes/app/+layout.svelte
src/routes/app/dashboard/
src/routes/app/projects/
src/routes/app/projects/new/
src/routes/app/projects/[id]/
src/routes/app/projects/[id]/documents/
```

Digunakan untuk:

- Dashboard.
- Project management.
- Document viewer.

`src/routes/app/+layout.svelte` harus melakukan auth guard atau menerima data dari `+layout.server.ts`.

---

### API Routes

```txt
src/routes/api/projects/[id]/generate/+server.ts
src/routes/api/projects/[id]/documents/+server.ts
src/routes/api/projects/[id]/documents/[documentId]/+server.ts
src/routes/api/projects/[id]/export/markdown/+server.ts
```

Digunakan untuk:

- AI generation.
- Document API.
- Export Markdown.

Aturan:

- Semua API route harus cek session.
- Semua API route harus cek ownership project.
- Semua request body harus divalidasi.

---

## Supabase Folder

```txt
supabase/
├── migrations/
│   └── 0001_initial_schema.sql
└── seed.sql
```

Digunakan untuk:

- SQL migration.
- RLS policies.
- Seed template awal.

---

## Tests Folder

```txt
tests/
├── unit/
│   ├── prompt-builder.test.ts
│   ├── markdown-converter.test.ts
│   └── project-schema.test.ts
└── e2e/
    ├── auth.spec.ts
    ├── project.spec.ts
    └── generation.spec.ts
```

Prioritas test MVP:

1. Auth.
2. Create project.
3. Generate documents.
4. Export Markdown.
5. Access control.

---

## Naming Convention

### Files

```txt
Component files : PascalCase.svelte
Server files    : kebab-case.ts
Schema files    : feature.schema.ts
Types files     : feature.ts
Routes          : SvelteKit convention
```

Examples:

```txt
ProjectForm.svelte
project-service.ts
project.schema.ts
generate-spec.ts
```

---

### Database Tables

Use snake_case:

```txt
users_profile
projects
project_inputs
generated_documents
generation_runs
project_templates
```

---

### API Routes

Use REST-like route names:

```txt
/api/projects/[id]/generate
/api/projects/[id]/documents
/api/projects/[id]/export/markdown
```

---

## Import Rules

Recommended alias:

```ts
import Button from '$lib/components/ui/Button.svelte';
import { createProject } from '$lib/server/services/project-service';
import { projectSchema } from '$lib/schemas/project.schema';
```

Rules:

- UI components can import utils and types.
- UI components should not import server-only modules.
- Server routes can import server services.
- Server services can import database queries.
- AI provider code must stay inside server-only files.

---

## Minimal MVP Folder Checklist

Untuk MVP awal, minimal folder ini harus ada:

```txt
[ ] src/lib/components/ui
[ ] src/lib/components/layout
[ ] src/lib/components/project
[ ] src/lib/components/documents
[ ] src/lib/server/ai
[ ] src/lib/server/auth
[ ] src/lib/server/db
[ ] src/lib/server/services
[ ] src/lib/schemas
[ ] src/lib/types
[ ] src/lib/utils
[ ] src/routes/login
[ ] src/routes/register
[ ] src/routes/app/dashboard
[ ] src/routes/app/projects
[ ] src/routes/api/projects/[id]/generate
[ ] supabase/migrations
[ ] tests/unit
[ ] tests/e2e
```

---

## Actual Skeleton Included

Di dalam ZIP, saya juga menyertakan folder skeleton:

```txt
specpilot-app-structure/
```

Folder tersebut berisi struktur direktori kosong dengan file `.gitkeep`, supaya bisa langsung dicopy ke repo utama.
