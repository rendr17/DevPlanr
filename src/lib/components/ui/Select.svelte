<script lang="ts">
  interface Option {
    value: string;
    label: string;
  }

  interface Props {
    label?: string;
    value?: string;
    options?: Option[];
    disabled?: boolean;
    required?: boolean;
    error?: string;
    helperText?: string;
    name?: string;
    id?: string;
    class?: string;
  }

  let {
    label,
    value = $bindable(''),
    options = [],
    disabled = false,
    required = false,
    error = '',
    helperText = '',
    name,
    id = Math.random().toString(36).substring(2, 9),
    class: className = '',
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

  <div class="relative w-full">
    <select
      {id}
      {name}
      {disabled}
      {required}
      bind:value
      class="w-full px-3 py-2 text-sm bg-zinc-900 border {error ? 'border-rose-500 focus:ring-rose-500' : 'border-zinc-800 focus:ring-indigo-500'} rounded-lg text-white appearance-none transition-all duration-200 outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-zinc-950 disabled:opacity-50 disabled:cursor-not-allowed"
    >
      {#each options as option}
        <option value={option.value} class="bg-zinc-900 text-white">
          {option.label}
        </option>
      {/each}
    </select>
    
    <!-- Custom dropdown arrow -->
    <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-zinc-400">
      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </div>
  </div>

  {#if error}
    <span class="text-xs text-rose-400">{error}</span>
  {:else}
    {#if helperText}
      <span class="text-xs text-zinc-500">{helperText}</span>
    {/if}
  {/if}
</div>
