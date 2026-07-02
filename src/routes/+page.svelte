<script lang="ts">
  import Button from '$lib/components/ui/Button.svelte';
  import Card from '$lib/components/ui/Card.svelte';
  import Badge from '$lib/components/ui/Badge.svelte';
  import PublicNav from '$lib/components/layout/PublicNav.svelte';

  // Stepper steps
  const steps = [
    { number: '01', title: 'Describe Your App', desc: 'Type a simple project brief or raw app idea in our editor.' },
    { number: '02', title: 'Refine Context', desc: 'Select target users, platform, database adapters, and features.' },
    { number: '03', title: 'Generate Specs', desc: 'Watch DevPlanr compile a full developer-ready package in seconds.' },
    { number: '04', title: 'Copy & Build', desc: 'Copy formatted markdown or custom system prompts directly into Claude/Cursor.' },
  ];

  // Features list
  const features = [
    { title: 'PRD Generator', desc: 'Compile full Product Requirements Documents mapping feature lists and assumptions.' },
    { title: 'User Story Builder', desc: 'Write precise user stories complete with structured acceptance criteria.' },
    { title: 'Database Schema Planner', desc: 'Design clean PostgreSQL schemas ready for Drizzle ORM.' },
    { title: 'API Endpoint Designer', desc: 'Map routes, validation structures, and consistent error payloads.' },
    { title: 'AI Agent Prompt Builder', desc: 'Generate system prompt context guides optimized for Cursor and Claude.' },
    { title: 'Test Case Planner', desc: 'Outline unit test instructions and automated Playwright workflows.' },
    { title: 'Sprint Estimator', desc: 'Formulate timeline milestones and task estimations for your MVP.' },
    { title: 'Markdown Exporter', desc: 'Export all compiled specifications as a single repository README.' },
  ];

  // User Personas
  const personas = [
    { role: 'Solo Developer', desc: 'Create structured starting specifications before writing your first line of code.' },
    { role: 'Product Manager', desc: 'Scaffold feature scope documents and user stories to present to engineers.' },
    { role: 'Startup Founder', desc: 'Convert rough ideas into clear technical specifications to share with contractors.' },
    { role: 'AI-Assisted Coder', desc: 'Supercharge Cursor or Claude with contextual project prompts to avoid code churn.' },
  ];
</script>

<div class="min-h-screen bg-zinc-950 text-zinc-100 flex flex-col selection:bg-indigo-500 selection:text-white">
  <!-- Public Navigation Header -->
  <PublicNav />

  <!-- 1. Hero Section -->
  <section class="relative flex-1 flex flex-col justify-center items-center px-6 py-24 text-center overflow-hidden">
    <div class="absolute inset-0 bg-[radial-gradient(circle_at_top,_var(--tw-gradient-stops))] from-indigo-500/10 via-transparent to-transparent -z-10"></div>
    
    <div class="max-w-5xl mx-auto space-y-8">
      <Badge variant="generating" text="Built for AI-assisted developers" />

      <h1 class="text-4xl sm:text-6xl font-extrabold tracking-tight text-white max-w-4xl mx-auto leading-[1.1]">
        From rough idea to <span class="bg-gradient-to-r from-indigo-400 to-violet-400 bg-clip-text text-transparent">developer-ready specification.</span>
      </h1>

      <p class="text-base sm:text-lg text-zinc-400 max-w-3xl mx-auto leading-relaxed">
        DevPlanr helps developers transform simple app ideas into PRDs, user stories, database schemas, API endpoints, test cases, sprint plans, and AI coding prompts.
      </p>

      <div class="flex flex-col sm:flex-row gap-4 justify-center items-center pt-4">
        <a href="/register">
          <Button variant="primary" size="lg" class="w-full sm:w-auto font-semibold">
            Start Planning
          </Button>
        </a>
        <a href="#example">
          <Button variant="outline" size="lg" class="w-full sm:w-auto font-semibold">
            View Example
          </Button>
        </a>
      </div>
    </div>
  </section>

  <!-- 2. Problem Statement -->
  <section class="max-w-7xl mx-auto px-6 py-20 w-full border-t border-zinc-900">
    <div class="text-center max-w-3xl mx-auto mb-16 space-y-3">
      <Badge variant="danger" text="The AI Developer Bottleneck" />
      <h2 class="text-3xl font-extrabold text-white">Your AI coding agent is only as good as your spec.</h2>
      <p class="text-sm text-zinc-400">Jumping straight to code without proper system specifications leads to endless cycles of refactoring.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <Card class="space-y-3 border-rose-500/20 bg-zinc-900/40">
        <div class="text-rose-400 font-bold">01 / Ideas are vague</div>
        <h3 class="text-lg font-bold text-white">Rough briefs build bugs</h3>
        <p class="text-xs text-zinc-400 leading-relaxed">
          AI coding agents lack the context of business validation. Without constraints, they generate bloated and misaligned architectures.
        </p>
      </Card>

      <Card class="space-y-3 border-rose-500/20 bg-zinc-900/40">
        <div class="text-rose-400 font-bold">02 / Generic prompts churn code</div>
        <h3 class="text-lg font-bold text-white">Infinite loops of refactoring</h3>
        <p class="text-xs text-zinc-400 leading-relaxed">
          Unstructured prompts force LLMs to guess key schemas. A tiny initial error compounds, leading to breaks in production.
        </p>
      </Card>

      <Card class="space-y-3 border-rose-500/20 bg-zinc-900/40">
        <div class="text-rose-400 font-bold">03 / Missing planning costs time</div>
        <h3 class="text-lg font-bold text-white">No roadmap, no deployment</h3>
        <p class="text-xs text-zinc-400 leading-relaxed">
          Failing to delineate your MVP scope leads to scope creep. You spend weeks building non-critical features instead of launching.
        </p>
      </Card>
    </div>
  </section>

  <!-- 3. How It Works -->
  <section class="max-w-7xl mx-auto px-6 py-20 w-full border-t border-zinc-900 bg-zinc-950/30">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="info" text="Execution Flow" />
      <h2 class="text-3xl font-extrabold text-white">How DevPlanr works</h2>
      <p class="text-sm text-zinc-400">A clean, visual pipeline from raw concepts to structured markdown specs.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each steps as step}
        <Card class="space-y-4 relative overflow-hidden bg-zinc-900/20">
          <div class="text-3xl font-black text-zinc-800 font-mono absolute top-2 right-4 select-none">
            {step.number}
          </div>
          <h3 class="text-base font-bold text-white mt-2">{step.title}</h3>
          <p class="text-xs text-zinc-450 leading-relaxed">{step.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 4. Example Input and Output -->
  <section id="example" class="max-w-7xl mx-auto px-6 py-20 w-full border-t border-zinc-900">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="ready" text="Direct Comparison" />
      <h2 class="text-3xl font-extrabold text-white">Example Input & Output</h2>
      <p class="text-sm text-zinc-400">See what DevPlanr compiles from a simple one-sentence prompt.</p>
    </div>

    <Card class="grid grid-cols-1 lg:grid-cols-2 gap-0 overflow-hidden divide-y lg:divide-y-0 lg:divide-x divide-zinc-800 p-0!">
      <!-- Input Panel -->
      <div class="p-8 space-y-4">
        <h3 class="text-sm font-semibold text-zinc-400 flex items-center gap-2">
          <span class="w-2.5 h-2.5 rounded-full bg-zinc-650"></span>
          User Input Idea
        </h3>
        <div class="p-4 bg-zinc-950 border border-zinc-850 rounded-xl">
          <p class="text-sm font-mono text-zinc-300">
            "Saya ingin membuat aplikasi pickup barang untuk driver kurir."
          </p>
        </div>
        <p class="text-xs text-zinc-500 leading-relaxed">
          DevPlanr evaluates this prompt, prompting the user for context details like platform preference (Web/Mobile) and preferred database models.
        </p>
      </div>

      <!-- Output Panel -->
      <div class="p-8 space-y-4 bg-zinc-900/30">
        <h3 class="text-sm font-semibold text-indigo-400 flex items-center gap-2">
          <span class="w-2.5 h-2.5 rounded-full bg-indigo-500 animate-pulse"></span>
          Generated Technical Specifications
        </h3>
        
        <ul class="space-y-2.5 text-xs text-zinc-300">
          <li class="flex items-start gap-2">
            <span class="text-emerald-450">✓</span>
            <div>
              <strong class="text-white">Product Requirements Document (PRD)</strong>: Mapped out target user profiles, primary user flows, and MVP vs future feature scopes.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-450">✓</span>
            <div>
              <strong class="text-white">User Stories</strong>: Modular stories with clean Given-When-Then acceptance criteria.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-450">✓</span>
            <div>
              <strong class="text-white">Database Schema</strong>: PostgreSQL statements mapping schema fields and Row Level Security (RLS) constraints.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-450">✓</span>
            <div>
              <strong class="text-white">API Endpoint Specifications</strong>: Complete REST routes spec detailing query parameters and standard validation schemas.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-450">✓</span>
            <div>
              <strong class="text-white">AI Agent Instructions</strong>: Pre-compiled markdown coding prompts designed for Claude-3.5 or Cursor.
            </div>
          </li>
        </ul>
      </div>
    </Card>
  </section>

  <!-- 5. Features -->
  <section class="max-w-7xl mx-auto px-6 py-20 w-full border-t border-zinc-900">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="generating" text="Comprehensive Suite" />
      <h2 class="text-3xl font-extrabold text-white">Full-fledged spec generators</h2>
      <p class="text-sm text-zinc-400">DevPlanr creates everything you need to kick off development.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each features as feat}
        <Card hoverable={true} class="space-y-2 bg-zinc-900/35 border-zinc-850 hover:border-zinc-800">
          <h3 class="text-sm font-bold text-white">{feat.title}</h3>
          <p class="text-xs text-zinc-450 leading-relaxed">{feat.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 6. Target Users -->
  <section class="max-w-7xl mx-auto px-6 py-20 w-full border-t border-zinc-900 bg-zinc-950/20">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="info" text="Who is this for?" />
      <h2 class="text-3xl font-extrabold text-white">Designed for developers & creators</h2>
      <p class="text-sm text-zinc-400">Specifying software layouts before coding leads to faster deployments.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each personas as pers}
        <Card class="space-y-3 bg-zinc-900/50">
          <h3 class="text-base font-bold text-white flex items-center gap-2">
            <span class="w-1.5 h-1.5 rounded-full bg-indigo-400"></span>
            {pers.role}
          </h3>
          <p class="text-xs text-zinc-450 leading-relaxed">{pers.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 7. CTA -->
  <section class="max-w-6xl mx-auto px-6 py-20 w-full border-t border-zinc-900 text-center">
    <Card class="bg-gradient-to-br from-indigo-950/20 via-zinc-900 to-zinc-950/80 border border-indigo-500/10 py-16 px-6 max-w-4xl mx-auto rounded-3xl space-y-8">
      <div class="space-y-3 max-w-2xl mx-auto">
        <h2 class="text-3xl sm:text-4xl font-extrabold text-white">Start Planning Your Next Project</h2>
        <p class="text-sm text-zinc-400 leading-relaxed">
          Ditch the blank page. Transform your next raw application idea into a clean, complete, and code-ready technical roadmap today.
        </p>
      </div>

      <div class="flex justify-center pt-2">
        <a href="/register">
          <Button variant="primary" size="lg" class="font-semibold px-8 py-3.5 hover:scale-[1.02] active:scale-[0.98]">
            Get Started for Free
          </Button>
        </a>
      </div>
    </Card>
  </section>

  <!-- Footer -->
  <footer class="border-t border-zinc-900 py-12 bg-zinc-950 text-center text-xs text-zinc-500 space-y-2">
    <div class="flex justify-center gap-6 text-zinc-450 mb-4">
      <a href="/login" class="hover:text-white transition-colors">Log In</a>
      <a href="/register" class="hover:text-white transition-colors">Register</a>
      <a href="/dev/ui" class="hover:text-white transition-colors">UI Preview</a>
    </div>
    <p>&copy; {new Date().getFullYear()} DevPlanr. All rights reserved.</p>
  </footer>
</div>
