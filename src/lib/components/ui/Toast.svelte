<script lang="ts">
  import { slide } from 'svelte/transition';

  interface Props {
    show: boolean;
    message: string;
    type?: 'success' | 'error' | 'info';
    duration?: number;
    onclose?: () => void;
  }

  let {
    show = $bindable(false),
    message = '',
    type = 'info',
    duration = 3000,
    onclose,
  }: Props = $props();

  $effect(() => {
    if (show) {
      const timer = setTimeout(() => {
        show = false;
        if (onclose) {
          onclose();
        }
      }, duration);
      return () => clearTimeout(timer);
    }
  });

  const typeStyles = {
    success: 'bg-emerald-950/90 text-emerald-300 border-emerald-500/30',
    error: 'bg-rose-950/90 text-rose-300 border-rose-500/30',
    info: 'bg-zinc-900/95 text-zinc-200 border-zinc-700',
  };

  const typeIcons = {
    success: `<svg class="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`,
    error: `<svg class="w-5 h-5 text-rose-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`,
    info: `<svg class="w-5 h-5 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`,
  };
</script>

{#if show && message}
  <div
    transition:slide={{ axis: 'y' }}
    class="fixed bottom-5 right-5 z-50 flex items-center gap-3 px-4 py-3 border rounded-xl shadow-2xl backdrop-blur-md max-w-sm {typeStyles[type]}"
  >
    <!-- Icon -->
    {@html typeIcons[type]}
    
    <!-- Text -->
    <p class="text-sm font-medium leading-normal flex-1 truncate">{message}</p>
    
    <!-- Close button -->
    <button
      type="button"
      aria-label="Close"
      class="text-zinc-400 hover:text-white transition-colors focus:outline-none"
      onclick={() => { show = false; if (onclose) onclose(); }}
    >
      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
    </button>
  </div>
{/if}
