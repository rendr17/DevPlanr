<script lang="ts">
  import Button from './Button.svelte';

  interface Props {
    title: string;
    description: string;
    actionText?: string;
    icon?: 'folder' | 'document' | 'info';
    class?: string;
    onclick?: (event: MouseEvent) => void;
  }

  let {
    title,
    description,
    actionText = '',
    icon = 'folder',
    class: className = '',
    onclick,
  }: Props = $props();

  const icons = {
    folder: `<svg class="w-8 h-8 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path></svg>`,
    document: `<svg class="w-8 h-8 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>`,
    info: `<svg class="w-8 h-8 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`,
  };
</script>

<div class="flex flex-col items-center justify-center text-center p-8 border border-dashed border-zinc-850 rounded-2xl bg-zinc-900/25 {className}">
  <!-- Icon circle background -->
  <div class="w-16 h-16 rounded-2xl bg-zinc-900 border border-zinc-850 flex items-center justify-center mb-4">
    {@html icons[icon]}
  </div>

  <!-- Title -->
  <h3 class="text-base font-bold text-white mb-1.5">{title}</h3>

  <!-- Description -->
  <p class="text-xs text-zinc-400 max-w-sm mb-6 leading-relaxed">{description}</p>

  <!-- Optional Action Button -->
  {#if actionText && onclick}
    <Button variant="primary" size="sm" {onclick}>
      {actionText}
    </Button>
  {/if}
</div>
