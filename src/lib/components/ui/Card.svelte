<script lang="ts">
  import type { Snippet } from 'svelte';

  interface Props {
    hoverable?: boolean;
    class?: string;
    onclick?: (event: MouseEvent) => void;
    children?: Snippet;
  }

  let {
    hoverable = false,
    class: className = '',
    onclick,
    children,
  }: Props = $props();
</script>

<!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
<div
  role={onclick ? 'button' : 'region'}
  tabindex={onclick ? 0 : undefined}
  class="bg-zinc-900 border border-zinc-850 rounded-xl p-5 md:p-6 transition-all duration-200 
         {hoverable ? 'hover:border-zinc-800 hover:bg-zinc-900/80 cursor-pointer hover:scale-[1.01]' : ''} 
         {onclick ? 'cursor-pointer focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-zinc-950' : ''} 
         {className}"
  {onclick}
>
  {#if children}
    {@render children()}
  {/if}
</div>
