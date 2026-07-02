<script lang="ts">
  import Button from '$lib/components/ui/Button.svelte';
  import Input from '$lib/components/ui/Input.svelte';
  import Textarea from '$lib/components/ui/Textarea.svelte';
  import Select from '$lib/components/ui/Select.svelte';
  import Card from '$lib/components/ui/Card.svelte';
  import Badge from '$lib/components/ui/Badge.svelte';
  import Tabs from '$lib/components/ui/Tabs.svelte';
  import Modal from '$lib/components/ui/Modal.svelte';
  import Toast from '$lib/components/ui/Toast.svelte';
  import Skeleton from '$lib/components/ui/Skeleton.svelte';
  import EmptyState from '$lib/components/ui/EmptyState.svelte';

  // Interactive states using Svelte 5 runes
  let activeTab = $state('overview');
  let openModal = $state(false);
  let showToast = $state(false);
  let toastType = $state<'success' | 'error' | 'info'>('success');
  let toastMessage = $state('Copied component code to clipboard!');
  
  let textInput = $state('');
  let textareaInput = $state('');
  let selectValue = $state('web');

  const demoTabs = [
    { id: 'overview', name: 'Overview' },
    { id: 'prd', name: 'Product Spec' },
    { id: 'schema', name: 'Database Schema' },
    { id: 'api', name: 'API Endpoints' },
  ];

  const selectOptions = [
    { value: 'web', label: 'Web Application' },
    { value: 'mobile', label: 'Mobile App' },
    { value: 'desktop', label: 'Desktop Utility' },
  ];

  function triggerToast(type: 'success' | 'error' | 'info', message: string) {
    toastType = type;
    toastMessage = message;
    showToast = true;
  }
</script>

<div class="min-h-screen bg-zinc-950 text-zinc-100 flex flex-col selection:bg-indigo-500 selection:text-white p-6 md:p-12">
  <div class="max-w-6xl mx-auto w-full space-y-12">
    <!-- Header -->
    <header class="border-b border-zinc-900 pb-6 flex flex-col md:flex-row md:items-center justify-between gap-4">
      <div>
        <div class="flex items-center gap-2 mb-1">
          <span class="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-indigo-950 border border-indigo-500/20 text-indigo-400">DevPlanr UI Kit</span>
          <span class="text-xs font-mono text-zinc-500">Svelte 5 + Tailwind v4</span>
        </div>
        <h1 class="text-3xl font-extrabold text-white">Component Preview Workspace</h1>
        <p class="text-sm text-zinc-400 mt-1">Lightweight, accessible, and dark-mode friendly components for DevPlanr.</p>
      </div>
      <div class="flex gap-2">
        <a href="/" class="text-xs bg-zinc-900 hover:bg-zinc-850 border border-zinc-800 text-zinc-300 hover:text-white px-4 py-2 rounded-lg font-medium transition-all">
          Back to Homepage
        </a>
      </div>
    </header>

    <!-- Component Showcase Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
      
      <!-- Section 1: Buttons -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">1. Buttons</h2>
        <Card class="space-y-6">
          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Variants</h3>
            <div class="flex flex-wrap gap-2">
              <Button variant="primary">Primary</Button>
              <Button variant="secondary">Secondary</Button>
              <Button variant="outline">Outline</Button>
              <Button variant="ghost">Ghost</Button>
              <Button variant="danger">Danger</Button>
            </div>
          </div>

          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Sizes</h3>
            <div class="flex flex-wrap items-center gap-2">
              <Button variant="primary" size="sm">Small</Button>
              <Button variant="primary" size="md">Medium</Button>
              <Button variant="primary" size="lg">Large</Button>
            </div>
          </div>

          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Interactive States</h3>
            <div class="flex flex-wrap gap-2">
              <Button variant="primary" loading={true}>Generating</Button>
              <Button variant="secondary" disabled={true}>Disabled</Button>
            </div>
          </div>
        </Card>
      </section>

      <!-- Section 2: Badges -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">2. Badges</h2>
        <Card class="space-y-6">
          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Project Status Mappings</h3>
            <div class="flex flex-wrap gap-3">
              <Badge variant="draft" text="Draft" />
              <Badge variant="generating" text="Generating" />
              <Badge variant="ready" text="Ready" />
              <Badge variant="failed" text="Failed" />
              <Badge variant="archived" text="Archived" />
            </div>
          </div>

          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Alert Semantics</h3>
            <div class="flex flex-wrap gap-3">
              <Badge variant="info" text="Info Notification" />
              <Badge variant="success" text="Success Active" />
              <Badge variant="danger" text="High Risk Warning" />
            </div>
          </div>
        </Card>
      </section>

      <!-- Section 3: Inputs & Forms -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">3. Form Components</h2>
        <Card class="space-y-6">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Input
              label="Project Name"
              placeholder="e.g. Pickup Logistics App"
              bind:value={textInput}
              helperText="Enter a descriptive title for your workspace."
            />
            <Input
              label="API Access Token"
              placeholder="Ex: pk_live_..."
              type="password"
              error="API key format is invalid."
            />
          </div>

          <Textarea
            label="Raw Idea Description"
            placeholder="Explain the application you wish to design..."
            bind:value={textareaInput}
            helperText="Write at least 15 characters describing target audience and primary flows."
          />

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Select
              label="Application Category"
              options={selectOptions}
              bind:value={selectValue}
            />
            <Select
              label="Database Adapter"
              options={[{ value: 'pg', label: 'PostgreSQL (Neon/Supabase)' }]}
              disabled={true}
              helperText="Configured to Neon/Supabase PostgreSQL by default."
            />
          </div>
        </Card>
      </section>

      <!-- Section 4: Cards & Click Actions -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">4. Cards & Actions</h2>
        <Card class="space-y-6">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Card hoverable={true}>
              <h3 class="font-bold text-white mb-1">Hoverable Card</h3>
              <p class="text-xs text-zinc-400 leading-relaxed">
                Subtle zoom-scale, border transition, and pointer indicator. Ideal for project dashboard directories.
              </p>
            </Card>

            <Card
              hoverable={true}
              onclick={() => triggerToast('info', 'Click action successfully triggered!')}
            >
              <h3 class="font-bold text-indigo-400 mb-1">Clickable Card</h3>
              <p class="text-xs text-zinc-400 leading-relaxed">
                Support accessibility keyboard triggers, active scale depress, and mouse clicking callbacks.
              </p>
            </Card>
          </div>
          
          <div class="space-y-2">
            <h3 class="text-xs font-semibold text-zinc-400">Interactive Dynamic Overlays</h3>
            <div class="flex flex-wrap gap-2">
              <Button variant="secondary" onclick={() => openModal = true}>
                Open Interactive Modal
              </Button>
              <Button variant="outline" onclick={() => triggerToast('success', 'Workspace specs successfully generated!')}>
                Trigger Success Toast
              </Button>
              <Button variant="outline" onclick={() => triggerToast('error', 'OpenAI Connection Timeout.')}>
                Trigger Error Toast
              </Button>
            </div>
          </div>
        </Card>
      </section>

      <!-- Section 5: Tabs -->
      <section class="space-y-4 lg:col-span-2">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">5. Tabs Navigation</h2>
        <Card class="space-y-4">
          <Tabs tabs={demoTabs} bind:activeTab />
          <div class="p-6 bg-zinc-900 border border-zinc-850 rounded-xl">
            <p class="text-xs font-mono text-indigo-400 mb-2">Active Tab ID: {activeTab}</p>
            {#if activeTab === 'overview'}
              <h3 class="font-bold text-white mb-1">Product Overview</h3>
              <p class="text-sm text-zinc-300 leading-relaxed">This tab contains the primary value proposition, targeted profiles, and MVP scope outlines.</p>
            {:else if activeTab === 'prd'}
              <h3 class="font-bold text-white mb-1">Product Requirements Document (PRD)</h3>
              <p class="text-sm text-zinc-300 leading-relaxed">Full scope specification of user stories, error states, and release conditions.</p>
            {:else if activeTab === 'schema'}
              <h3 class="font-bold text-white mb-1">Database Schema</h3>
              <p class="text-sm text-zinc-300 leading-relaxed">Drizzle ORM statements mapping exact tables, constraints, and Row Level Security definitions.</p>
            {:else if activeTab === 'api'}
              <h3 class="font-bold text-white mb-1">API Endpoints</h3>
              <p class="text-sm text-zinc-300 leading-relaxed">REST routing specifications outlining validation schemas and error patterns.</p>
            {/if}
          </div>
        </Card>
      </section>

      <!-- Section 6: Loading Skeletons -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">6. Loading Skeletons</h2>
        <Card class="space-y-6">
          <div class="space-y-4">
            <h3 class="text-xs font-semibold text-zinc-400">Card Layout Placeholder</h3>
            <div class="p-5 border border-zinc-850 bg-zinc-900/50 rounded-xl space-y-4">
              <div class="flex items-center gap-3">
                <Skeleton variant="circle" height="h-10" />
                <div class="space-y-1.5 flex-1">
                  <Skeleton variant="text" height="h-4" width="w-1/3" />
                  <Skeleton variant="text" height="h-3" width="w-1/4" />
                </div>
              </div>
              <div class="space-y-2">
                <Skeleton variant="text" height="h-3.5" />
                <Skeleton variant="text" height="h-3.5" width="w-5/6" />
              </div>
            </div>
          </div>
        </Card>
      </section>

      <!-- Section 7: Empty States -->
      <section class="space-y-4">
        <h2 class="text-sm font-semibold text-zinc-500 uppercase tracking-wider">7. Empty States</h2>
        <EmptyState
          title="No Active Projects"
          description="Create your first rough idea brief and DevPlanr will transform it into complete technical specifications."
          actionText="Create Project"
          icon="folder"
          onclick={() => triggerToast('info', 'Redirecting to creation workspace...')}
        />
      </section>

    </div>
  </div>

  <!-- Interactive Modal -->
  <Modal
    bind:open={openModal}
    title="DevPlanr Terms of Service"
  >
    <p class="mb-4">
      Welcome to DevPlanr! This AI engine parses raw briefs to formulate code-ready specifications. All AI-generated data is stored securely in Supabase PostgreSQL under strict owner validation filters (RLS).
    </p>
    <p>
      By using this service, you acknowledge that prompt tokens are calculated dynamically to evaluate the overall resource metrics of each compilation.
    </p>
    {#snippet footer()}
      <Button variant="secondary" onclick={() => openModal = false}>Cancel</Button>
      <Button variant="primary" onclick={() => { openModal = false; triggerToast('success', 'Terms accepted!'); }}>
        Accept Terms
      </Button>
    {/snippet}
  </Modal>

  <!-- Interactive Toast Notification -->
  <Toast bind:show={showToast} type={toastType} message={toastMessage} />
</div>
