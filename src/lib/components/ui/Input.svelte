<script lang="ts">
  import type { HTMLInputAttributes } from 'svelte/elements';

  interface Props {
    label?: string;
    value?: string;
    type?: string;
    placeholder?: string;
    disabled?: boolean;
    required?: boolean;
    error?: string;
    helperText?: string;
    name?: string;
    id?: string;
    class?: string;
    autocomplete?: HTMLInputAttributes['autocomplete'];
  }

  let {
    label,
    value = $bindable(''),
    type = 'text',
    placeholder = '',
    disabled = false,
    required = false,
    error = '',
    helperText = '',
    name,
    id = Math.random().toString(36).substring(2, 9),
    class: className = '',
    autocomplete,
  }: Props = $props();
</script>

<div class="flex flex-col gap-1.5 w-full {className}">
  {#if label}
    <label for={id} class="text-xs font-semibold text-zinc-300">
      {label}
      {#if required}
        <span class="text-rose-400">*</span>
      {/if}
    </label>
  {/if}

  <input
    {id}
    {type}
    {name}
    {placeholder}
    {disabled}
    {required}
    {autocomplete}
    bind:value
    class="px-3 py-2 text-sm bg-zinc-900 border {error ? 'border-rose-500 focus:ring-rose-500' : 'border-zinc-800 focus:ring-indigo-500'} rounded-lg text-white placeholder-zinc-500 transition-all duration-200 outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-zinc-950 disabled:opacity-50 disabled:cursor-not-allowed"
  />

  {#if error}
    <span class="text-xs text-rose-400">{error}</span>
  {:else}
    {#if helperText}
      <span class="text-xs text-zinc-500">{helperText}</span>
    {/if}
  {/if}
</div>
