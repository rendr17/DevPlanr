<script lang="ts">
  interface Props {
    variant?: 'text' | 'rect' | 'circle';
    height?: string;
    width?: string;
    class?: string;
  }

  let {
    variant = 'text',
    height = '',
    width = '',
    class: className = '',
  }: Props = $props();

  const variantStyles = {
    text: 'h-4 rounded w-full',
    rect: 'rounded-xl',
    circle: 'rounded-full aspect-square',
  };
</script>

<div
  class="animate-pulse bg-zinc-800/80 {variantStyles[variant]} {height} {width} {className}"
></div>
