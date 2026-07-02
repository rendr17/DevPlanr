# SpecPilot Workspace Rules

These guidelines are automatically applied to all tasks performed within the SpecPilot workspace.

## 1. Coding Style & Language Requirements
- **Strict TypeScript**: Do not use `any` casting. Properly type all Svelte components, helper utilities, and database adapters.
- **SvelteKit Server Actions**: Use server actions for form posts (e.g., in `+page.server.ts`). Avoid using generic client-side REST calls for forms unless asynchronous search/filtering is requested.
- **API Error Handling**: All endpoints under `/api/*` must return the standard `{ error: { code: string, message: string } }` pattern.

## 2. Row Level Security (RLS) & Security Audits
- **RLS Guard**: RLS is enabled on all tables in Supabase. Any SQL/Drizzle query MUST explicitly filter by `user_id = session.user.id`.
- **Secret Leaks**: Never print, log, or commit private keys (`service_role` key, OpenAI/Anthropic API keys). Ensure they are loaded via `$env/static/private` or `$env/dynamic/private`.

## 3. UI/UX & Design Alignment
- **Aesthetic Excellence**: Follow the sleek, premium dark-mode theme instructions.
- **Tailwind**: Utilize Tailwind CSS classes. Use the `dark:` prefix for dark mode capability.
- **Visual Skeletons & Code Highlighting**: Use skeleton screens for loading generated documents and always embed code snippets in copyable, formatted markdown code-blocks.

## 4. Development Workflow
- **Database Schema Verification**: If you modify any table structures, update `DATABASE_SCHEMA.sql` first, run `npx drizzle-kit generate` to build migration files, and inspect the generated SQL before modifying server actions or routes.
- **Commit Safety**: Ensure no temporary developer tokens or test environment variables are stored in the repo.

## 5. Automatic Custom Skill Triggering
- **Workflow Protocol**: Setiap kali Anda memberikan instruksi tugas baru atau ketika ada perubahan pada proyek:
  1. **Memeriksa Spesifikasi**: Saya akan selalu memeriksa file dokumentasi yang relevan di folder `docs/` terlebih dahulu (seperti `PRD.md`, `SPRINT_PLAN.md`, `DATABASE_SCHEMA.sql`, dll.) untuk memahami kebutuhan teknis dan alur sprint secara mendalam.
  2. **Menggunakan Keahlian yang Sesuai**: Saya akan merujuk ke pustaka keahlian kustom di direktori `.agents/skills/` sesuai dengan tipe tugas yang akan dilakukan:
      - Jika menyusun langkah kerja, merujuk ke `plan-maker/SKILL.md`.
      - Jika membangun fitur, merujuk ke `feature-creator/SKILL.md`.
      - Jika menulis UI & Styling Svelte, merujuk ke `frontend-developer/SKILL.md` dan `designer/SKILL.md`.
      - Jika menulis API & Controller, merujuk ke `backend-developer/SKILL.md` dan `sveltekit-action-api-builder/SKILL.md`.
      - Jika memodifikasi Drizzle & DB, merujuk ke `drizzle-schema-manager/SKILL.md`.
      - Jika berurusan dengan Vercel AI SDK & prompt LLM, merujuk ke `ai-generation-core/SKILL.md`.
      - Jika mengaudit keamanan atau kunci lingkungan, merujuk ke `supabase-security-auditor/SKILL.md`.
      - Jika menguji aplikasi, merujuk ke `automated-tester/SKILL.md`.
      - Jika memecahkan masalah atau melacak bug, merujuk ke `bug-hunter/SKILL.md`.
      - Jika melakukan pengecekan kualitas kode, merujuk ke `code-reviewer/SKILL.md`.


