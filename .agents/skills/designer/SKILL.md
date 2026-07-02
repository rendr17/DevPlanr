---
name: designer
description: UI/UX designer instructions for implementing DevPlanr's premium developer-focused dark-mode theme, gradients, layout structures, and micro-animations.
---

# Designer - UI/UX Styling & Theme Guidelines

Use this skill when designing pages, mockups, or custom CSS definitions to ensure DevPlanr maintains a sleek, premium, developer-focused aesthetic.

## 1. Visual Aesthetics & Theme Guidelines
DevPlanr is built with a developer-first dark mode aesthetic. Keep design minimal, modern, and high-contrast.

- **Primary Background**: Use very dark zinc/slate shades (`bg-zinc-950` or `#09090b`).
- **Surface Panels**: Use slightly lighter shades (`bg-zinc-900` or `#18181b`) with thin borders (`border-zinc-800` or `border-zinc-850`).
- **Accents**: Use indigo, violet, or blue colors (`text-indigo-400`, `bg-indigo-600`) for primary buttons, selected tabs, or active highlights.
- **Success States**: Emerald or green (`text-emerald-400`).
- **Fail States**: Rose or red (`text-rose-400`).

## 2. Typography
- Standardize on modern fonts like **Inter** or **Outfit** (loaded via Google Fonts) for clean readability.
- Monospace font (`font-mono`, e.g., JetBrains Mono, Fira Code) for all database schemas, prompts, and API response listings.

## 3. Gradients & Micro-Animations
- **Gradients**: Add subtle gradients on landing pages or primary cards to create depth:
  ```html
  <div class="bg-gradient-to-br from-indigo-500/10 via-zinc-900 to-zinc-950 border border-indigo-500/20"></div>
  ```
- **Micro-Animations**: All interactive buttons, cards, and list items must transition smoothly:
  ```html
  <button class="transition-all duration-200 ease-in-out hover:scale-[1.02] active:scale-[0.98]">
    Create Brief
  </button>
  ```
- **Hover States**: Underline link text or dim button backgrounds slightly on hover.

## 4. UI Elements Mockup Reference
When designing generated document sections:
- **Code Block Formatting**: Wrap JSON or SQL snippets in code blocks with a title bar containing the syntax language (e.g. `SQL`, `TypeScript`, `JSON`) and a copy-to-clipboard button.
- **Side-by-Side Mode**: Use desktop layouts that place input briefs on the left and generated document tabs on the right, allowing developers to see both simultaneously.
- **Loading states**: Ensure pages don't abruptly change layouts. Use stable loading placeholders or skeleton boxes.
