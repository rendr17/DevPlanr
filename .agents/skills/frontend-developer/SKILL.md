---
name: frontend-developer
description: Frontend developer guidelines for building sleek, premium, responsive Svelte views, Tailwind classes, Lucide icons, loading skeletons, and interactive state management.
---

# Frontend Developer - UI Implementation Guidelines

Use this skill when designing Svelte pages, components, managing states, configuring interactive layouts, or applying styling classes.

## 1. Responsive & Premium Layouts
SpecPilot uses a developer-focused aesthetic (minimalist dark mode, sleek accents, clean fonts).
- Use Tailwind classes for flexible grids and flexbox structures.
- Support wide monitors (e.g. max-w-7xl centered layouts or dual-pane grids) and mobile viewports.
- Always wrap main workspaces with a responsive sidebar navigation component.

## 2. Interactive Features implementation

### Svelte Tabs Implementation (Document Viewer)
Use local state variables to control active tabs inside the project detail viewer:
```html
<script lang="ts">
  let activeTab = 'prd';
  const tabs = [
    { id: 'overview', name: 'Product Overview' },
    { id: 'prd', name: 'PRD' },
    { id: 'stories', name: 'User Stories' },
    { id: 'db', name: 'Database Schema' },
  ];
</script>

<div class="border-b border-zinc-850 flex gap-4">
  {#each tabs as tab}
    <button
      class="pb-2 text-sm font-medium transition-all {activeTab === tab.id ? 'border-b-2 border-indigo-500 text-white' : 'text-zinc-400 hover:text-zinc-200'}"
      on:click={() => activeTab = tab.id}
    >
      {tab.name}
    </button>
  {/each}
</div>

<div class="mt-6">
  {#if activeTab === 'prd'}
    <!-- Render PRD component -->
  {/if}
</div>
```

### Copy-To-Clipboard Helper
Provide copy triggers for all generated code blocks and technical documents:
```html
<script lang="ts">
  import { Check, Copy } from 'lucide-svelte';
  export let textToCopy: string;
  let copied = false;

  async function handleCopy() {
    await navigator.clipboard.writeText(textToCopy);
    copied = true;
    setTimeout(() => copied = false, 2000);
  }
</script>

<button on:click={handleCopy} class="p-2 hover:bg-zinc-800 rounded-lg text-zinc-400 hover:text-white">
  {#if copied}
    <Check class="w-4 h-4 text-green-400" />
  {:else}
    <Copy class="w-4 h-4" />
  {/if}
</button>
```

## 3. Visual Skeletons & State Indicators
- Show active loading indicators during AI generation.
- Use animated skeleton blocks for content loading screens:
  ```html
  <div class="animate-pulse space-y-4">
    <div class="h-6 bg-zinc-800 rounded w-1/3"></div>
    <div class="space-y-2">
      <div class="h-4 bg-zinc-800 rounded"></div>
      <div class="h-4 bg-zinc-800 rounded w-5/6"></div>
      <div class="h-4 bg-zinc-800 rounded w-4/5"></div>
    </div>
  </div>
  ```
- Use Svelte's transition modules for UI entry effects:
  ```html
  <script>
    import { fade, slide } from 'svelte/transition';
  </script>
  <div transition:fade={{ duration: 150 }}>
    <!-- Content -->
  </div>
  ```
