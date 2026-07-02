<script lang="ts">
  import type { Snippet } from 'svelte';

  interface Props {
    variant?: 'primary' | 'secondary' | 'ghost' | 'danger' | 'outline';
    size?: 'sm' | 'md' | 'lg';
    disabled?: boolean;
    loading?: boolean;
    type?: 'button' | 'submit' | 'reset';
    class?: string;
    onclick?: (event: MouseEvent) => void;
    children?: Snippet;
  }

  let {
    variant = 'primary',
    size = 'md',
    disabled = false,
    loading = false,
    type = 'button',
    class: className = '',
    onclick,
    children,
  }: Props = $props();

  const variantStyles = {
    primary: 'bg-indigo-650 text-white hover:bg-indigo-500 shadow-md shadow-indigo-600/10 focus:ring-indigo-500',
    secondary: 'bg-zinc-800 text-zinc-300 hover:bg-zinc-700 hover:text-white focus:ring-zinc-700',
    outline: 'border border-zinc-700 bg-transparent text-zinc-300 hover:bg-zinc-900 hover:text-white focus:ring-zinc-700',
    ghost: 'bg-transparent text-zinc-400 hover:bg-zinc-900 hover:text-zinc-200 focus:ring-zinc-800',
    danger: 'bg-rose-600 text-white hover:bg-rose-500 shadow-md shadow-rose-600/10 focus:ring-rose-500',
  };

  const sizeStyles = {
    sm: 'px-3 py-1.5 text-xs rounded-md',
    md: 'px-4 py-2 text-sm rounded-lg',
    lg: 'px-6 py-3 text-base rounded-xl',
  };
</script>

<button
  {type}
  disabled={disabled || loading}
  class="inline-flex items-center justify-center font-medium transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-zinc-950 active:scale-[0.98] disabled:opacity-50 disabled:pointer-events-none gap-2 {variantStyles[variant]} {sizeStyles[size]} {className}"
  {onclick}
>
  {#if loading}
    <svg class="animate-spin -ml-1 mr-2 h-4 w-4 text-current" fill="none" viewBox="0 0 24 24">
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
    </svg>
  {/if}
  {#if children}
    {@render children()}
  {/if}
</button>
