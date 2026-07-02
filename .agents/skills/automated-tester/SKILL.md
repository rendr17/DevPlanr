---
name: automated-tester
description: Unit and integration testing guide utilizing Vitest and Playwright to verify authentication state, project creation, API endpoints, and export flows.
---

# Automated Tester - Testing Guidelines

Use this skill when writing unit tests for helper services (e.g. prompt compilation, markdown parsing) or integration tests for SvelteKit page routes and database actions in DevPlanr.

## 1. Unit Testing with Vitest
Use **Vitest** for testing business logic, prompts compilers, and schemas.
- Place tests close to the code under test (e.g., `src/lib/server/services/prompt.test.ts`) or in the `tests/` directory.

### Example Vitest Case:
```typescript
import { describe, it, expect } from 'vitest';
import { compileUserPrompt } from './prompt';

describe('compileUserPrompt', () => {
  it('should compile template fields correctly', () => {
    const inputs = {
      name: 'Test App',
      rawIdea: 'A web app for testing',
      appType: 'SaaS',
      platform: 'Web',
    };
    const result = compileUserPrompt(inputs);
    expect(result).toContain('Project name:\nTest App');
    expect(result).toContain('Raw idea:\nA web app for testing');
  });
});
```

## 2. Integration / End-to-End Testing with Playwright
Use **Playwright** to test full user journeys (Register, Login, Dashboard, Project Creation, and Exporting).
- Place Playwright files in the `tests/` directory (e.g., `tests/auth.spec.ts`).

### Key User Flows to Test:
1. **Authentication Redirect**: Unauthenticated user visits `/app/dashboard` -> gets redirected to `/login`.
2. **Project Creation Flow**: Logged in user fills the form -> submits -> redirected to project detail -> document view loading shows up.
3. **Copy / Download Verification**: User clicks "Copy Section" or "Download Markdown" -> verify action success.

### Example Playwright Test:
```typescript
import { test, expect } from '@playwright/test';

test('should redirect unauthenticated user to login', async ({ page }) => {
  await page.goto('/app/dashboard');
  await expect(page).toHaveURL(/\/login/);
});
```

## 3. Running Test Suites
Before merging any branches:
- Run Vitest unit tests:
  ```bash
  npm run test:unit
  ```
- Run Playwright integration tests:
  ```bash
  npx playwright test
  ```
- Verify all tests pass and no temporary mock objects are persisted.
