<script lang="ts">
  import Sidebar from './Sidebar.svelte';
  import Topbar from './Topbar.svelte';

  let { children } = $props();
</script>

<div class="flex h-screen bg-zinc-950 text-zinc-100 overflow-hidden">
  <!-- Sidebar -->
  <Sidebar />

  <!-- Main Content Area -->
  <div class="flex-1 flex flex-col overflow-hidden">
    <!-- Topbar -->
    <Topbar />

    <!-- Main Viewport -->
    <main class="flex-1 overflow-y-auto p-6 md:p-8">
      {@render children()}
    </main>
  </div>
</div>
