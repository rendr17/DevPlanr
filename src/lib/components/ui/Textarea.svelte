<script lang="ts">
  interface Props {
    label?: string;
    value?: string;
    placeholder?: string;
    disabled?: boolean;
    required?: boolean;
    rows?: number;
    error?: string;
    helperText?: string;
    name?: string;
    id?: string;
    class?: string;
  }

  let {
    label,
    value = $bindable(''),
    placeholder = '',
    disabled = false,
    required = false,
    rows = 4,
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

  <textarea
    {id}
    {name}
    {rows}
    {placeholder}
    {disabled}
    {required}
    bind:value
    class="px-3 py-2 text-sm bg-zinc-900 border {error ? 'border-rose-500 focus:ring-rose-500' : 'border-zinc-800 focus:ring-indigo-500'} rounded-lg text-white placeholder-zinc-500 transition-all duration-200 outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-zinc-950 resize-y disabled:opacity-50 disabled:cursor-not-allowed"
  ></textarea>

  {#if error}
    <span class="text-xs text-rose-400">{error}</span>
  {:else}
    {#if helperText}
      <span class="text-xs text-zinc-500">{helperText}</span>
    {/if}
  {/if}
</div>
