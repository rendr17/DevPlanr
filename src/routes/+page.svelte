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

<svelte:head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
  <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@500;600;700&family=Plus+Jakarta+Sans:wght@700;800;900&display=swap" rel="stylesheet">
</svelte:head>

<div class="min-h-screen bg-[#FAF9F6] text-neutral-900 font-body antialiased overflow-x-hidden" style="color-scheme: light;">
  <!-- Public Navigation Header -->
  <PublicNav />

  <!-- 1. Hero Section -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-16 md:py-24 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center relative">
    <!-- Left: Text Content -->
    <div class="flex flex-col items-start relative">
      <!-- Badge -->
      <div class="inline-flex items-center gap-3 p-1 pr-4 rounded-full border border-neutral-200 bg-white mb-8 shadow-sm">
        <span class="bg-[#D9F96D] text-neutral-950 font-bold text-[12px] px-3 py-1 rounded-full">2026 Release</span>
        <span class="text-xs font-semibold text-neutral-600 flex items-center gap-1 cursor-pointer hover:text-neutral-900 transition-colors">
          What's new in DevPlanr <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
        </span>
      </div>

      <!-- Headline -->
      <h1 class="font-display text-5xl sm:text-7xl font-black text-neutral-900 tracking-tight leading-[1.05] relative">
        <!-- Decorative sparkle strokes above header -->
        <div class="absolute -top-12 -left-6 text-indigo-500/60 hidden sm:block" aria-hidden="true">
          <svg class="w-10 h-10" viewBox="0 0 40 40" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round">
            <path d="M10,30 L6,18 M18,22 L18,8 M28,26 L34,18" />
          </svg>
        </div>
        
        AI planning<br>
        for <span class="bg-clip-text text-transparent bg-gradient-to-r from-[#ff8a65] to-[#ffb74d]">developer</span>
        <span class="relative inline-block">
          teams
          <!-- Blue swash underline under 'teams' -->
          <svg class="absolute -bottom-3 left-0 w-full h-4 text-indigo-500" viewBox="0 0 200 20" preserveAspectRatio="none" fill="none" aria-hidden="true">
            <path d="M5,12 C50,2 150,2 195,14 C140,14 80,12 30,14" stroke="currentColor" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </span>
      </h1>

      <!-- Subheadline -->
      <p class="text-base sm:text-lg text-neutral-600 mt-8 max-w-lg leading-relaxed">
        DevPlanr helps developer teams ideate, plan, and ship beautiful apps — faster, together.
      </p>

      <!-- Buttons -->
      <div class="mt-10 flex flex-col sm:flex-row gap-4 w-full sm:w-auto">
        <a href="/register" class="w-full sm:w-auto">
          <Button variant="primary" size="lg" class="w-full sm:w-auto font-semibold bg-neutral-900 text-white hover:bg-neutral-800 rounded-full py-4 px-8 shadow-md hover:scale-95 duration-200 transition-all">
            Start planning for free
          </Button>
        </a>
        <a href="#example" class="w-full sm:w-auto">
          <Button variant="outline" size="lg" class="w-full sm:w-auto font-semibold border border-neutral-300 text-neutral-850 hover:bg-neutral-50 px-8 py-4 rounded-full flex items-center justify-center gap-2 duration-200 transition-all">
            <svg class="w-5 h-5 opacity-75" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
            Watch demo
          </Button>
        </a>
      </div>
    </div>

    <!-- Right: 3D Illustration Image -->
    <div class="relative w-full h-[400px] md:h-[500px] flex justify-center items-center">
      <img
        alt="Glossy 3D shapes representing abstract collaboration"
        class="object-contain w-full h-full max-w-[460px] hover:-translate-y-2.5 transition-transform duration-700 ease-in-out drop-shadow-2xl"
        src="static/images/hero-illustration.png"
      />
    </div>
  </section>

  <!-- Social Proof Section -->
  <section class="py-12 border-t border-b border-neutral-200/50 bg-neutral-100/30">
    <div class="max-w-[1280px] mx-auto px-6 md:px-16">
      <p class="text-center text-xs font-semibold text-neutral-500 mb-8 tracking-wider uppercase">Trusted by innovative teams</p>
      <div class="flex flex-wrap justify-center md:justify-between items-center gap-8 md:gap-4 opacity-60 grayscale hover:grayscale-0 transition-all duration-500">
        <!-- Faux Logos -->
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" /></svg> superlist</div>
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" /></svg> Layers</div>
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 1121.21 8H18.2" /></svg> air</div>
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" /></svg> Rally</div>
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z" /></svg> FRAME</div>
        <div class="flex items-center gap-2 font-display text-xl font-bold text-neutral-850"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m0-12.728l.707.707m12.728 12.728l-.707.707M12 8a4 4 0 100 8 4 4 0 000-8z" /></svg> velocity</div>
      </div>
    </div>
  </section>

  <!-- Three Hero Overview Cards -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-16 w-full">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      
      <!-- Card 1: Roadmaps & PRDs -->
      <Card class="bg-white border border-neutral-200/80 rounded-[24px] p-8 min-h-[300px] flex flex-col justify-between shadow-sm hover:shadow-md transition-shadow relative">
        <div class="absolute top-6 right-6 text-neutral-850">
          <!-- 8-pointed star/asterisk SVG -->
          <svg viewBox="0 0 24 24" class="w-5 h-5 fill-none stroke-current stroke-[2.5]" aria-hidden="true">
            <path d="M12 3v18M3 12h18M5.636 5.636l12.728 12.728M5.636 18.364l12.728-12.728" />
          </svg>
        </div>
        <div>
          <h3 class="font-display text-xl font-extrabold text-neutral-900 mb-2">Roadmaps & PRDs</h3>
          <p class="text-sm text-neutral-600 leading-relaxed">Collect, organize and evolve visual requirements documents.</p>
        </div>
        <div class="mt-8">
          <p class="text-[11px] font-bold uppercase tracking-wider text-neutral-450 mb-2">Color palette</p>
          <div class="flex gap-2">
            <div class="w-8 h-8 rounded-full bg-neutral-900 border border-neutral-800"></div>
            <div class="w-8 h-8 rounded-full bg-indigo-500"></div>
            <div class="w-8 h-8 rounded-full bg-indigo-200"></div>
            <div class="w-8 h-8 rounded-full bg-neutral-150"></div>
          </div>
        </div>
      </Card>

      <!-- Card 2: Ship with confidence (Accent Lime Card) -->
      <Card class="bg-[#D9F96D] border-none rounded-[24px] p-8 min-h-[300px] flex flex-col justify-between relative overflow-hidden group">
        <div class="absolute top-6 right-6 text-neutral-900">
          <svg viewBox="0 0 24 24" class="w-5 h-5 fill-none stroke-current stroke-[2.5]" aria-hidden="true">
            <path d="M12 3v18M3 12h18M5.636 5.636l12.728 12.728M5.636 18.364l12.728-12.728" />
          </svg>
        </div>
        <div>
          <h3 class="font-display text-xl font-extrabold text-neutral-950 mb-2">Ship with confidence</h3>
          <p class="text-sm text-neutral-900/80 leading-relaxed">Organize assets, approvals and handoff — seamlessly.</p>
        </div>
        <div class="mt-8">
          <div class="inline-flex items-center gap-2 bg-white px-4 py-2 rounded-full shadow-sm">
            <svg class="w-5 h-5 text-emerald-600" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" /></svg>
            <span class="text-xs font-bold text-neutral-950">Approved</span>
          </div>
        </div>
      </Card>

      <!-- Card 3: AI Agent Prompts / Collaborative boards -->
      <Card class="bg-white border border-neutral-200/80 rounded-[24px] p-8 min-h-[300px] flex flex-col justify-between shadow-sm hover:shadow-md transition-shadow relative">
        <div class="absolute top-6 right-6 text-neutral-850">
          <svg viewBox="0 0 24 24" class="w-5 h-5 fill-none stroke-current stroke-[2.5]" aria-hidden="true">
            <path d="M12 3v18M3 12h18M5.636 5.636l12.728 12.728M5.636 18.364l12.728-12.728" />
          </svg>
        </div>
        <div>
          <h3 class="font-display text-xl font-extrabold text-neutral-900 mb-2">AI Agent Prompts</h3>
          <p class="text-sm text-neutral-600 leading-relaxed">Bring your team and ideas together in one shared prompt context space.</p>
        </div>
        <div class="mt-8 flex -space-x-2.5">
          <img class="w-9 h-9 rounded-full border-2 border-white object-cover" alt="Team avatar 1" src="static/images/avatar-1.jpg">
          <img class="w-9 h-9 rounded-full border-2 border-white object-cover" alt="Team avatar 2" src="static/images/avatar-2.jpg">
          <img class="w-9 h-9 rounded-full border-2 border-white object-cover" alt="Team avatar 3" src="static/images/avatar-3.jpg">
          <img class="w-9 h-9 rounded-full border-2 border-white object-cover" alt="Team avatar 4" src="static/images/avatar-4.jpg">
        </div>
      </Card>

    </div>
  </section>

  <!-- 2. Problem Statement -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60">
    <div class="text-center max-w-3xl mx-auto mb-16 space-y-3">
      <Badge variant="failed" text="The AI Developer Bottleneck" class="bg-rose-100 text-rose-700 border-rose-200" />
      <h2 class="font-display text-3xl md:text-4xl font-extrabold text-neutral-900">Your AI coding agent is only as good as your spec.</h2>
      <p class="text-sm text-neutral-500 max-w-2xl mx-auto">Jumping straight to code without proper system specifications leads to endless cycles of refactoring and code churn.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <Card class="bg-white border-neutral-200 space-y-3">
        <div class="text-rose-600 text-xs font-bold uppercase tracking-wider">01 / Vague Requirements</div>
        <h3 class="text-lg font-bold text-neutral-900">Rough briefs build bugs</h3>
        <p class="text-xs text-neutral-605 leading-relaxed">
          AI coding agents lack the context of business validation. Without specifications, they build generic and misaligned architectures.
        </p>
      </Card>

      <Card class="bg-white border-neutral-200 space-y-3">
        <div class="text-rose-600 text-xs font-bold uppercase tracking-wider">02 / Prompt Dilution</div>
        <h3 class="text-lg font-bold text-neutral-900">Infinite loops of refactoring</h3>
        <p class="text-xs text-neutral-605 leading-relaxed">
          Unstructured prompts force LLMs to guess key parameters. A tiny initial database schema error compounds, breaking downstream logic.
        </p>
      </Card>

      <Card class="bg-white border-neutral-200 space-y-3">
        <div class="text-rose-600 text-xs font-bold uppercase tracking-wider">03 / Scope Creep</div>
        <h3 class="text-lg font-bold text-neutral-900">No roadmap, no launch</h3>
        <p class="text-xs text-neutral-605 leading-relaxed">
          Failing to delineate your MVP boundaries leads to feature bloat. Developers spend weeks building non-critical features.
        </p>
      </Card>
    </div>
  </section>

  <!-- 3. How It Works -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60 bg-neutral-50/30">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="info" text="Execution Flow" class="bg-indigo-100 text-indigo-700 border-indigo-200" />
      <h2 class="font-display text-3xl md:text-4xl font-extrabold text-neutral-900">How DevPlanr works</h2>
      <p class="text-sm text-neutral-500">A clean, visual pipeline from raw concept to structured developer roadmap.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each steps as step}
        <Card class="bg-white border-neutral-200 space-y-4 relative overflow-hidden">
          <div class="text-3xl font-black text-neutral-200 font-mono absolute top-2 right-4 select-none">
            {step.number}
          </div>
          <h3 class="text-base font-bold text-neutral-900 mt-2">{step.title}</h3>
          <p class="text-xs text-neutral-500 leading-relaxed">{step.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 4. Example Input and Output -->
  <section id="example" class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="ready" text="Direct Comparison" class="bg-emerald-100 text-emerald-700 border-emerald-200" />
      <h2 class="font-display text-3xl md:text-4xl font-extrabold text-neutral-900">Example Input & Output</h2>
      <p class="text-sm text-neutral-500">See what DevPlanr compiles from a simple one-sentence prompt.</p>
    </div>

    <Card class="bg-white border-neutral-200 grid grid-cols-1 lg:grid-cols-2 gap-0 overflow-hidden divide-y lg:divide-y-0 lg:divide-x divide-neutral-200 p-0!">
      <!-- Input Panel -->
      <div class="p-8 space-y-4">
        <h3 class="text-sm font-semibold text-neutral-500 flex items-center gap-2">
          <span class="w-2.5 h-2.5 rounded-full bg-neutral-400"></span>
          User Input Idea
        </h3>
        <div class="p-4 bg-neutral-50 border border-neutral-200 rounded-xl">
          <p class="text-sm font-mono text-neutral-700">
            "Saya ingin membuat aplikasi pickup barang untuk driver kurir."
          </p>
        </div>
        <p class="text-xs text-neutral-550 leading-relaxed">
          DevPlanr evaluates this prompt and asks the user context details such as target database preference, layout constraints, and specific features.
        </p>
      </div>

      <!-- Output Panel -->
      <div class="p-8 space-y-4 bg-neutral-50/40">
        <h3 class="text-sm font-semibold text-indigo-650 flex items-center gap-2">
          <span class="w-2.5 h-2.5 rounded-full bg-indigo-500 animate-pulse"></span>
          Generated Technical Specifications
        </h3>
        
        <ul class="space-y-3 text-xs text-neutral-650">
          <li class="flex items-start gap-2">
            <span class="text-emerald-600 font-bold">✓</span>
            <div>
              <strong class="text-neutral-900">Product Requirements Document (PRD)</strong>: Outlined targeted profiles, core flowcharts, and MVP boundaries.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-600 font-bold">✓</span>
            <div>
              <strong class="text-neutral-900">User Stories</strong>: Created functional agile cards with structured Given-When-Then acceptance criteria.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-600 font-bold">✓</span>
            <div>
              <strong class="text-neutral-900">Database Schema</strong>: Mapped standard PostgreSQL drizzle schemas with relations.
            </div>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-emerald-600 font-bold">✓</span>
            <div>
              <strong class="text-neutral-900">API Endpoint Directory</strong>: Outlined endpoint routes, schemas, and consistent error patterns.
            </div>
          </li>
        </ul>
      </div>
    </Card>
  </section>

  <!-- 5. Features Section -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="generating" text="Comprehensive Suite" class="bg-indigo-100 text-indigo-700 border-indigo-200" />
      <h2 class="font-display text-3xl md:text-4xl font-extrabold text-neutral-900">Full-fledged spec generators</h2>
      <p class="text-sm text-neutral-500">DevPlanr creates everything you need to kick off development.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each features as feat}
        <Card hoverable={true} class="bg-white border-neutral-200 hover:border-neutral-350 space-y-2">
          <h3 class="text-sm font-bold text-neutral-900">{feat.title}</h3>
          <p class="text-xs text-neutral-500 leading-relaxed">{feat.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 6. Target Users -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60 bg-[#FAF9F6]">
    <div class="text-center max-w-2xl mx-auto mb-16 space-y-3">
      <Badge variant="info" text="Who is this for?" class="bg-indigo-100 text-indigo-700 border-indigo-200" />
      <h2 class="font-display text-3xl md:text-4xl font-extrabold text-neutral-900">Designed for developers & creators</h2>
      <p class="text-sm text-neutral-500">Delineating software flows early speeds up launch execution.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      {#each personas as pers}
        <Card class="bg-white border-neutral-200 space-y-3">
          <h3 class="text-base font-bold text-neutral-900 flex items-center gap-2">
            <span class="w-1.5 h-1.5 rounded-full bg-indigo-500"></span>
            {pers.role}
          </h3>
          <p class="text-xs text-neutral-500 leading-relaxed">{pers.desc}</p>
        </Card>
      {/each}
    </div>
  </section>

  <!-- 7. CTA -->
  <section class="max-w-[1280px] mx-auto px-6 md:px-16 py-20 w-full border-t border-neutral-200/60 text-center">
    <Card class="bg-neutral-900 border-none py-16 px-6 max-w-4xl mx-auto rounded-3xl space-y-8 shadow-xl">
      <div class="space-y-3 max-w-2xl mx-auto">
        <h2 class="font-display text-3xl sm:text-4xl font-extrabold text-white">Start Planning Your Next Project</h2>
        <p class="text-sm text-neutral-350 leading-relaxed">
          Ditch the blank page. Transform your next raw application idea into a clean, complete, and code-ready technical roadmap today.
        </p>
      </div>

      <div class="flex justify-center pt-2">
        <a href="/register">
          <Button variant="primary" size="lg" class="bg-[#D9F96D] text-neutral-950 hover:bg-[#cbf056] font-bold px-8 py-3.5 hover:scale-[1.02] active:scale-[0.98] rounded-full">
            Get Started for Free
          </Button>
        </a>
      </div>
    </Card>
  </section>

  <!-- Footer -->
  <footer class="border-t border-neutral-200/60 py-12 bg-white text-center text-xs text-neutral-550 space-y-2">
    <div class="flex justify-center gap-6 text-neutral-500 mb-4 font-semibold">
      <a href="/login" class="hover:text-neutral-900 transition-colors">Log In</a>
      <a href="/register" class="hover:text-neutral-900 transition-colors">Register</a>
      <a href="/dev/ui" class="hover:text-neutral-900 transition-colors">UI Preview</a>
    </div>
    <p>&copy; {new Date().getFullYear()} DevPlanr. All rights reserved.</p>
  </footer>
</div>

<style>
  :global(.font-display) {
    font-family: 'Plus Jakarta Sans', sans-serif;
  }
  :global(.font-body) {
    font-family: 'Manrope', sans-serif;
  }
</style>
