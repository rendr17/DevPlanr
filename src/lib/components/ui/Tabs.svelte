<script lang="ts">
  interface Tab {
    id: string;
    name: string;
  }

  interface Props {
    tabs: Tab[];
    activeTab: string;
    class?: string;
    onchange?: (tabId: string) => void;
  }

  let {
    tabs = [],
    activeTab = $bindable(),
    class: className = '',
    onchange,
  }: Props = $props();

  function selectTab(id: string) {
    activeTab = id;
    if (onchange) {
      onchange(id);
    }
  }
</script>

<div class="w-full overflow-x-auto scrollbar-none border-b border-zinc-850 {className}">
  <div class="flex space-x-6 min-w-max pb-0.5">
    {#each tabs as tab}
      <button
        type="button"
        class="pb-3 text-sm font-semibold transition-all relative focus:outline-none 
               {activeTab === tab.id ? 'text-white font-bold' : 'text-zinc-400 hover:text-zinc-200'}"
        onclick={() => selectTab(tab.id)}
      >
        {tab.name}
        {#if activeTab === tab.id}
          <div class="absolute bottom-0 left-0 right-0 h-0.5 bg-indigo-500 rounded-full"></div>
        {/if}
      </button>
    {/each}
  </div>
</div>

<style>
  /* Hide scrollbar for Chrome, Safari and Opera */
  .scrollbar-none::-webkit-scrollbar {
    display: none;
  }
  /* Hide scrollbar for IE, Edge and Firefox */
  .scrollbar-none {
    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */
  }
</style>
