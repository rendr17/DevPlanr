<script lang="ts">
  import type { Snippet } from 'svelte';

  interface Props {
    variant?: 'draft' | 'generating' | 'ready' | 'failed' | 'archived' | 'info' | 'success' | 'danger';
    class?: string;
    text?: string;
    children?: Snippet;
  }

  let {
    variant = 'draft',
    class: className = '',
    text = '',
    children,
  }: Props = $props();

  const variantStyles = {
    draft: 'bg-zinc-800 text-zinc-300 border-zinc-700',
    generating: 'bg-indigo-950/50 text-indigo-300 border-indigo-500/30 animate-pulse',
    ready: 'bg-emerald-950/40 text-emerald-350 border-emerald-500/20',
    failed: 'bg-rose-950/40 text-rose-350 border-rose-500/20',
    archived: 'bg-zinc-900 text-zinc-500 border-zinc-850',
    info: 'bg-sky-950/40 text-sky-350 border-sky-500/20',
    success: 'bg-emerald-950/40 text-emerald-350 border-emerald-500/20',
    danger: 'bg-rose-950/40 text-rose-350 border-rose-500/20',
  };
</script>

<span
  class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold border transition-all duration-200 {variantStyles[variant]} {className}"
>
  {#if children}
    {@render children()}
  {:else}
    {text}
  {/if}
</span>
