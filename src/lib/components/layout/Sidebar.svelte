<script lang="ts">
  // Sidebar component for dashboard navigation
</script>

<aside class="w-64 bg-zinc-900 border-r border-zinc-800 flex flex-col h-full hidden md:flex">
  <div class="p-6 border-b border-zinc-800 font-bold text-xl text-white">
    <a href="/" class="flex items-center gap-2">
      <span class="text-indigo-500">Spec</span>Pilot
    </a>
  </div>
  <nav class="flex-1 p-4 space-y-1">
    <a href="/app/dashboard" class="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-zinc-300 hover:bg-zinc-850 hover:text-white transition-all">
      Dashboard
    </a>
    <a href="/app/projects" class="flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg text-zinc-300 hover:bg-zinc-850 hover:text-white transition-all">
      Projects
    </a>
  </nav>
  <div class="p-4 border-t border-zinc-800">
    <div class="flex items-center gap-3 px-4 py-2">
      <div class="w-8 h-8 rounded-full bg-indigo-650 flex items-center justify-center font-bold text-sm text-white">
        U
      </div>
      <div class="flex-1 overflow-hidden">
        <p class="text-sm font-medium text-white truncate">Demo User</p>
        <p class="text-xs text-zinc-400 truncate">demo@specpilot.dev</p>
      </div>
    </div>
  </div>
</aside>
