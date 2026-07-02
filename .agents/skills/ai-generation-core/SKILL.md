---
name: ai-generation-core
description: Guidelines for compiling prompts, calling the Vercel AI SDK with structured outputs, saving generated documents, and tracking token metadata.
---

# AI Generation Core - Instructions & Guidelines

Use this skill when implementing or updating the AI generation engine, prompt templates, structured output configuration, or token logging in SpecPilot.

## 1. Directory & File Placement
- **AI Service / Wrapper**: [src/lib/server/ai/index.ts](file:///C:/Users/kueoi/Downloads/Rendi_/RENDI/Portofolio/ai_spec/specpilot-app-structure/src/lib/server/ai/index.ts) or equivalent under `src/lib/server/services/`.
- **System & User Prompt Compilers**: `src/lib/server/services/prompt.ts`.
- **Output Zod Schema**: `src/lib/schemas/generation.ts`.

## 2. Structured Output Zod Schema

The AI response must be structured to match the layout defined in `AI_PROMPTS.md`. Use Vercel AI SDK's `generateObject` along with Zod to enforce this.

### Zod Schema Definition:
```typescript
import { z } from 'zod';

const documentSchema = z.object({
  title: z.string(),
  content_markdown: z.string(),
});

export const generationOutputSchema = z.object({
  product_overview: documentSchema,
  prd: documentSchema,
  user_stories: documentSchema,
  database_schema: documentSchema,
  api_endpoints: documentSchema,
  task_breakdown: documentSchema,
  ai_agent_prompt: documentSchema,
  test_cases: documentSchema,
  sprint_estimation: documentSchema,
});
```

## 3. Vercel AI SDK Execution Template

Below is a template for the generation service that compiles prompts, runs the LLM, saves documents, and logs token usage in a single transaction.

```typescript
import { generateObject } from 'ai';
import { openai } from '@ai-sdk/openai'; // Or preferred model provider
import { db } from '$lib/server/db';
import { projects, generated_documents, generation_runs } from '$lib/server/db/schema';
import { generationOutputSchema } from '$lib/schemas/generation';
import { eq } from 'drizzle-orm';

export async function generateProjectSpecs(projectId: string, userId: string, inputs: any) {
  // 1. Create generation run (Pending status)
  const [run] = await db.insert(generation_runs).values({
    projectId,
    userId,
    status: 'pending',
    inputSnapshot: inputs,
  }).returning();

  // 2. Set project status to generating
  await db.update(projects).set({ status: 'generating' }).where(eq(projects.id, projectId));

  try {
    // 3. Compile prompts
    const systemPrompt = `You are a senior product manager, solution architect, and technical lead...`;
    const userPrompt = `Project Name: ${inputs.name}\nRaw Idea: ${inputs.rawIdea}...`;

    // 4. Call LLM with generateObject
    const { object, usage } = await generateObject({
      model: openai('gpt-4o'),
      schema: generationOutputSchema,
      prompt: userPrompt,
      system: systemPrompt,
    });

    // 5. Insert documents & update run status in a transaction
    await db.transaction(async (tx) => {
      // Save generated documents
      for (const [type, doc] of Object.entries(object)) {
        await tx.insert(generated_documents).values({
          projectId,
          documentType: type,
          title: doc.title,
          contentMarkdown: doc.content_markdown,
          version: 1,
        });
      }

      // Update generation run
      await tx.update(generation_runs).set({
        status: 'success',
        outputSnapshot: object,
        promptTokens: usage.promptTokens,
        completionTokens: usage.completionTokens,
        completedAt: new Date(),
      }).where(eq(generation_runs.id, run.id));

      // Set project status to ready
      await tx.update(projects).set({ status: 'ready' }).where(eq(projects.id, projectId));
    });

    return { success: true };
  } catch (error: any) {
    // 6. Handle failure gracefully
    await db.update(generation_runs).set({
      status: 'failed',
      errorMessage: error.message || 'Unknown error during generation',
      completedAt: new Date(),
    }).where(eq(generation_runs.id, run.id));

    await db.update(projects).set({ status: 'failed' }).where(eq(projects.id, projectId));

    throw error;
  }
}
```

## 4. Key Performance / Reliability Tips
- **Timeout management**: Set appropriate timeouts (e.g., 60-90 seconds) as generating 9 documents can be token-heavy and slow.
- **Loading states**: Ensure the frontend shows an active loading/generating state by checking project status in real-time or via polling/server-sent events.
- **Failures validation**: If parsing fails or the LLM times out, preserve the user's `project_inputs` in the DB so they can re-try without re-typing.
