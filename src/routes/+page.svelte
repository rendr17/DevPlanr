<script lang="ts">
  import PublicNav from '$lib/components/layout/PublicNav.svelte';
</script>

<div class="min-h-screen bg-zinc-950 text-zinc-100 flex flex-col selection:bg-indigo-500 selection:text-white">
  <!-- Public Header Navigation -->
  <PublicNav />

  <!-- Hero Section -->
  <section class="relative flex-1 flex flex-col justify-center items-center px-6 py-20 text-center overflow-hidden">
    <!-- Background glow design token -->
    <div class="absolute inset-0 bg-[radial-gradient(circle_at_top,_var(--tw-gradient-stops))] from-indigo-500/10 via-transparent to-transparent -z-10"></div>
    
    <div class="max-w-4xl mx-auto space-y-8">
      <!-- Tagline badge -->
      <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-indigo-950 border border-indigo-500/30 text-indigo-300">
        AI-Powered Project Specification Engine
      </span>

      <!-- Main Headline -->
      <h1 class="text-4xl sm:text-6xl font-extrabold tracking-tight text-white max-w-3xl mx-auto leading-[1.1]">
        Transform Raw App Ideas into <span class="bg-gradient-to-r from-indigo-400 to-violet-400 bg-clip-text text-transparent">Developer-Ready Docs</span>
      </h1>

      <!-- Description -->
      <p class="text-base sm:text-lg text-zinc-400 max-w-2xl mx-auto leading-relaxed">
        Stop coding in the dark. SpecPilot compiles product specifications, database schemas, user stories, and complete prompt guides in minutes. Start projects with solid documentation.
      </p>

      <!-- CTA Buttons -->
      <div class="flex flex-col sm:flex-row gap-4 justify-center items-center pt-4">
        <a href="/register" class="w-full sm:w-auto bg-indigo-650 hover:bg-indigo-500 text-white font-semibold px-8 py-3.5 rounded-xl transition-all duration-200 hover:scale-[1.02] active:scale-[0.98] shadow-lg shadow-indigo-600/20">
          Get Started for Free
        </a>
        <a href="/login" class="w-full sm:w-auto bg-zinc-900 border border-zinc-800 hover:bg-zinc-850 hover:border-zinc-700 text-zinc-300 hover:text-white font-semibold px-8 py-3.5 rounded-xl transition-all duration-200">
          View Demo Workspace
        </a>
      </div>
    </div>
  </section>

  <!-- Core Deliverables / Features Grid -->
  <section class="max-w-7xl mx-auto px-6 py-16 w-full border-t border-zinc-900">
    <div class="text-center max-w-2xl mx-auto mb-12 space-y-2">
      <h2 class="text-2xl sm:text-3xl font-bold text-white">SpecPilot Deliverables</h2>
      <p class="text-sm text-zinc-400">Generate structural repo specification files instantly.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <!-- Feature Card 1 -->
      <div class="p-6 bg-zinc-900/50 border border-zinc-850 rounded-2xl space-y-4 hover:border-zinc-800 transition-all duration-200">
        <div class="w-10 h-10 rounded-lg bg-indigo-950 border border-indigo-500/20 flex items-center justify-center text-indigo-400 font-bold">
          PM
        </div>
        <h3 class="text-lg font-semibold text-white">PRD & User Stories</h3>
        <p class="text-sm text-zinc-400 leading-relaxed">
          Product Requirements Documents complete with targeted user personas, Core Value Propositions, and feature scope lists mapped for MVP.
        </p>
      </div>

      <!-- Feature Card 2 -->
      <div class="p-6 bg-zinc-900/50 border border-zinc-850 rounded-2xl space-y-4 hover:border-zinc-800 transition-all duration-200">
        <div class="w-10 h-10 rounded-lg bg-indigo-950 border border-indigo-500/20 flex items-center justify-center text-indigo-400 font-bold">
          DB
        </div>
        <h3 class="text-lg font-semibold text-white">Database Schema & APIs</h3>
        <p class="text-sm text-zinc-400 leading-relaxed">
          PostgreSQL Drizzle schema definitions and detailed REST API routing specs mapped out with correct ownership guard descriptions.
        </p>
      </div>

      <!-- Feature Card 3 -->
      <div class="p-6 bg-zinc-900/50 border border-zinc-850 rounded-2xl space-y-4 hover:border-zinc-800 transition-all duration-200">
        <div class="w-10 h-10 rounded-lg bg-indigo-950 border border-indigo-500/20 flex items-center justify-center text-indigo-400 font-bold">
          AI
        </div>
        <h3 class="text-lg font-semibold text-white">Developer Prompts & Tasks</h3>
        <p class="text-sm text-zinc-400 leading-relaxed">
          Pre-compiled instruction prompts ready to copy into Codex or Claude, along with sprint breakdowns and task estimates.
        </p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="border-t border-zinc-900 py-8 bg-zinc-950 text-center text-xs text-zinc-500">
    <p>&copy; {new Date().getFullYear()} SpecPilot. Ready for AI-assisted workspace planning.</p>
  </footer>
</div>
