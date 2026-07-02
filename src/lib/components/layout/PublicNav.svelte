<script lang="ts">
  // PublicNav for landing, login, register pages
</script>

<header class="border-b border-neutral-200/60 bg-white/70 backdrop-blur-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
    <!-- Brand Logo -->
    <a href="/" class="flex items-center gap-2 font-extrabold text-xl text-neutral-900 tracking-tight transition-opacity hover:opacity-90">
      <!-- 8-pointed star/asterisk SVG -->
      <svg viewBox="0 0 24 24" class="w-5 h-5 text-neutral-900 fill-none stroke-current stroke-[2.5] stroke-linecap-round stroke-linejoin-round" aria-hidden="true">
        <path d="M12 3v18M3 12h18M5.636 5.636l12.728 12.728M5.636 18.364l12.728-12.728" />
      </svg>
      <span>DevPlanr</span>
    </a>

    <!-- Center Navigation Links (Hidden on mobile) -->
    <nav class="hidden md:flex items-center gap-8">
      <div class="relative group">
        <button class="text-sm font-medium text-neutral-600 hover:text-neutral-900 transition-colors flex items-center gap-1 cursor-pointer">
          Product
          <svg class="w-3 h-3 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" /></svg>
        </button>
      </div>
      <div class="relative group">
        <button class="text-sm font-medium text-neutral-600 hover:text-neutral-900 transition-colors flex items-center gap-1 cursor-pointer">
          Cases
          <svg class="w-3 h-3 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" /></svg>
        </button>
      </div>
      <div class="relative group">
        <button class="text-sm font-medium text-neutral-600 hover:text-neutral-900 transition-colors flex items-center gap-1 cursor-pointer">
          Resources
          <svg class="w-3 h-3 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" /></svg>
        </button>
      </div>
      <a href="#features" class="text-sm font-medium text-neutral-600 hover:text-neutral-900 transition-colors">Pricing</a>
      <a href="#about" class="text-sm font-medium text-neutral-600 hover:text-neutral-900 transition-colors">About</a>
    </nav>

    <!-- Right Actions -->
    <div class="flex items-center gap-5">
      <a href="/login" class="text-sm font-semibold text-neutral-850 hover:text-neutral-950 transition-colors">
        Log in
      </a>
      <a href="/register" class="bg-neutral-900 hover:bg-neutral-800 text-white px-5 py-2.5 rounded-full text-sm font-semibold transition-all shadow-sm active:scale-95">
        Get started
      </a>
    </div>
  </div>
</header>

