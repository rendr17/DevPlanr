# DevPlanr

**DevPlanr** is an AI-powered project planner for developers. It transforms rough app ideas into developer-ready technical documents such as PRDs, user stories, database schemas, API endpoints, task breakdowns, AI coding prompts, test cases, and sprint estimations.

## 🚀 Quick Start & Local Setup

To run the SvelteKit + Tailwind CSS application locally:

### 1. Install Dependencies
```bash
npm install
```

### 2. Start the Development Server
```bash
npm run dev
```
The application will be running locally at [http://localhost:5173](http://localhost:5173).

### 3. Verify Code / Types Checking
```bash
npm run check
```

---

## 🛠️ Recommended Tech Stack

- **Frontend**: SvelteKit (TypeScript, Svelte 5)
- **Styling**: Tailwind CSS v4
- **UI Components**: custom components or shadcn-svelte
- **Icons**: Lucide Icons
- **Backend**: SvelteKit Server Routes & Form Actions
- **AI Layer**: Vercel AI SDK
- **Database**: Supabase PostgreSQL + Drizzle ORM
- **Authentication**: Supabase Auth
- **Validation**: Zod

---

## 📁 Repository Structure

```txt
DevPlanr/
├── .agents/              # AI custom skills and workspace rules
├── docs/                 # Product and technical specifications
├── src/
│   ├── lib/
│   │   ├── components/   # Svelte components (ui, layout, project, docs, generation)
│   │   ├── server/       # Server-only code (ai, auth, db, services)
│   │   ├── schemas/      # Zod validation schemas
│   │   ├── stores/       # Reactive Svelte state stores
│   │   ├── types/        # TypeScript models and mappings
│   │   └── utils/        # General utilities
│   ├── routes/           # SvelteKit page views and API routes
│   └── layout.css        # Global design tokens and Tailwind imports
├── supabase/             # Local database schemas and seeding scripts
├── drizzle/              # Drizzle migrations
└── tests/                # Vitest and Playwright test files
```

For a full breakdown of folders, please consult [docs/FOLDER_STRUCTURE.md](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/docs/FOLDER_STRUCTURE.md).
