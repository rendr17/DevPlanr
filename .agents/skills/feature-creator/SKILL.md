---
name: feature-creator
description: Step-by-step feature implementation guide for scaffolding pages, writing business logic, and integrating UI components with Tailwind and Lucide.
---

# Feature Creator - Implementation Guide

Use this skill when developing a new feature from scratch or expanding an existing feature (such as adding document history, public shares, or export styles) in DevPlanr.

## 1. Feature Architecture Workflow

Follow this sequence for standard feature building:

```txt
1. Database (Drizzle schema + Migrations)
2. Backend Services & Zod Schemas
3. Route Load functions & Actions (+page.server.ts)
4. UI Components & Svelte Page (+page.svelte)
```

## 2. Scaffolding SvelteKit Routes
When adding new routes, place them under the correct route group:
- **`(auth)/`**: For authentication routes (`login`, `register`, `forgot-password`).
- **`(app)/`**: For protected, auth-guarded application routes (`dashboard`, `project/[id]`, `project/new`).
- **`api/`**: For client actions like `/api/projects/[id]/generate`.

Each route folder should contain:
- `+page.svelte` (frontend UI markup).
- `+page.server.ts` (load function and form actions, if loading data or handling forms).
- `+layout.svelte` / `+layout.server.ts` (if scoped layouts are needed).

## 3. Reusable UI Components
Scaffold reusable components under `src/lib/components/ui/` (buttons, dialogs, forms) and compound components under `src/lib/components/` (sidebar, project card, document viewer).

### Standard Component Format
Use TypeScript inside the script block and export props cleanly:
```html
<script lang="ts">
  import { createEventDispatcher } from 'svelte';
  
  export let label: string;
  export let disabled = false;
  export let variant: 'primary' | 'secondary' = 'primary';

  const dispatch = createEventDispatcher();
</script>

<button
  type="button"
  {disabled}
  class="px-4 py-2 rounded-lg font-medium transition-all duration-200
         {variant === 'primary' ? 'bg-indigo-600 text-white hover:bg-indigo-500' : 'bg-zinc-800 text-zinc-300 hover:bg-zinc-700'}
         disabled:opacity-50 disabled:cursor-not-allowed"
  on:click={() => dispatch('click')}
>
  {label}
</button>
```

## 4. UI Icons Integration
Always use **Lucide Icons** (`lucide-svelte`) for standard glyphs, following the DevPlanr aesthetic.
```html
<script lang="ts">
  import { Plus, FolderPlus, Settings } from 'lucide-svelte';
</script>

<div class="flex items-center gap-2">
  <FolderPlus class="w-5 h-5 text-indigo-400" />
  <span>New Project</span>
</div>
```
