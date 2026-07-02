# Design Guide - DevPlanr

## 1. Design Direction

DevPlanr should feel like a modern developer SaaS product.

Design keywords:

```txt
Clean
Fast
Minimal
Developer-focused
Documentation-inspired
Dark-mode friendly
Premium but simple
```

The design should not feel like a generic admin dashboard. It should feel like a focused AI tool for developers.

## 2. Visual Identity

### Product Name

```txt
DevPlanr
```

### Tagline

```txt
From rough idea to developer-ready specification.
```

### Tone

- Clear
- Technical
- Confident
- Helpful
- Modern
- Not too playful

## 3. Color System

### Light Mode (Premium Theme)

```txt
Background      : #FAF9F6 (Warm off-white / cream)
Surface         : #FFFFFF (Pure White)
Surface Muted   : #F4F3EE (Soft Muted surface)
Border          : #EAEAE4 (Subtle warm border)
Text Primary    : #0D0D0D (Rich near-black)
Text Secondary  : #4D4D4D (Deep graphite)
Text Muted      : #808080 (Medium gray)
Primary         : #0D0D0D (Rich near-black button/actions)
Primary Hover   : #262626 (Slightly lighter primary hover)
Accent Lime     : #D9F96D (Lime green highlight)
Accent Blue     : #4648D4 (Underline swash / focus state)
Danger          : #EF4444
Warning         : #F59E0B
```

### Dark Mode

```txt
Background      : #020617
Surface         : #0F172A
Surface Muted   : #1E293B
Border          : #334155
Text Primary    : #F8FAFC
Text Secondary  : #CBD5E1
Text Muted      : #94A3B8
Primary         : #3B82F6
Primary Hover   : #60A5FA
Accent Green    : #22C55E
Accent Orange   : #FB923C
Danger          : #F87171
Warning         : #FBBF24
```

## 4. Typography

Recommended fonts:

```txt
Primary UI font : Inter
Alternative     : Geist
Alternative     : Plus Jakarta Sans
Code font       : JetBrains Mono / Fira Code
```

Font usage:

| Element | Size | Weight |
|---|---:|---:|
| Hero title | 48-64px | 700 |
| Page title | 28-36px | 700 |
| Section title | 20-24px | 600 |
| Body text | 14-16px | 400 |
| Small text | 12-13px | 400 |
| Button | 14px | 500 |
| Code | 13-14px | 400 |

## 5. Layout System

### Public Landing Page

```txt
Top Navigation
Hero Section
Problem Section
How It Works Section
Example Output Section
Feature Section
Use Case Section
CTA Section
Footer
```

### App Layout

```txt
Sidebar
Topbar
Main Content
Right Action Area / optional
```

Desktop layout:

```txt
+------------------------------------------------+
| Sidebar | Topbar                               |
|         |--------------------------------------|
|         | Main content                         |
|         |                                      |
+------------------------------------------------+
```

Mobile layout:

```txt
+--------------------------------------+
| Topbar                               |
|--------------------------------------|
| Main content                         |
|--------------------------------------|
| Bottom navigation or drawer menu     |
+--------------------------------------+
```

## 6. Landing Page Specification

### 6.1 Hero & Visual Style

Goal:

Explain the product in one glance using high-contrast bold typography and premium visual assets.

Content:

```txt
Badge:
[2026 Release] What's new in DevPlanr >

Title:
AI planning for developer teams

Subtitle:
DevPlanr helps developer teams ideate, plan, and structure beautiful apps — faster, together.

Primary CTA:
Start planning for free

Secondary CTA:
Watch demo
```

Visual idea:

- Background: Clean, warm off-white (`#FAF9F6`).
- Title: Heavy bold typography, "developer" highlighted with an orange-to-peach gradient, and "teams" underlined with a hand-drawn SVG loop.
- Icons: Purple hand-drawn style sparkles overlaying the top-left of the headline.
- Right side: Floating 3D illustration asset of glossy tubes and floral shapes.
- Under the Hero: Trusted-by section displaying tech logos in clean grayscale.
- Bottom of Hero: Three key feature overview cards:
  1. Roadmaps & PRD (white, asterisk icon, color palettes).
  2. Ship with Confidence (lime green background `#D4F973`, asterisk icon, "Approved" checkmark badge).
  3. AI Agent Prompts (white, asterisk icon, developer avatars).

### 6.2 Problem Section

Title:

```txt
Your AI coding agent is only as good as your spec.
```

Cards:

1. Rough ideas are hard to execute.
2. Generic prompts create messy code.
3. Missing planning creates rework.

### 6.3 How It Works

Steps:

1. Describe your idea.
2. Choose your app context.
3. Generate technical docs.
4. Copy to Codex/Claude and build.

### 6.4 Example Output

Use a split card:

Left:

```txt
Input:
Saya ingin membuat aplikasi pickup barang.
```

Right:

```txt
Generated:
- PRD
- User stories
- Database schema
- API endpoints
- Sprint plan
```

### 6.5 Feature Cards

Features:

- PRD Generator
- User Story Builder
- Database Schema Planner
- API Endpoint Designer
- AI Agent Prompt Builder
- Test Case Generator
- Sprint Estimator
- Markdown Export

## 7. App Pages

### 7.1 Dashboard

Purpose:

Give the user a quick overview and entry point.

Components:

- Welcome header
- New Project button
- Stats cards
- Recent projects
- Empty state

Stats cards:

```txt
Total Projects
Ready Specs
Drafts
Generation Runs
```

Empty state copy:

```txt
No projects yet.
Start with one rough idea and turn it into a complete technical spec.
```

### 7.2 New Project Page

Layout:

- Page title
- Short helper text
- Main form
- Example input sidebar
- Generate or Save button

Form fields:

```txt
Project name
Raw idea
Application type
Platform
Target users
Main features
Business context
Technical preferences
Output options
```

### 7.3 Project Detail Page

Main areas:

```txt
Project Header
Generate/Regenerate Actions
Document Tabs
Markdown Preview
Copy/Edit/Export Actions
```

Tabs:

```txt
Overview
PRD
User Stories
Database Schema
API Endpoints
Task Breakdown
AI Prompt
Test Cases
Sprint Plan
```

### 7.4 Document Viewer

Design goal:

Make generated documents easy to read, copy, and edit.

Components:

- Sticky tab navigation
- Markdown content area
- Copy button
- Edit button
- Regenerate button
- Export Markdown button

Markdown style:

- Clear headings
- Comfortable line height
- Code blocks with dark background
- Tables with borders
- Checklists for tasks

## 8. Component Guidelines

### Button

Variants:

```txt
primary
secondary
ghost
danger
outline
```

Usage:

- Primary: main action such as Generate.
- Secondary: Save draft.
- Ghost: navigation and small actions.
- Danger: archive/delete.

### Card

Use cards for:

- Stats
- Feature sections
- Recent projects
- Example output
- Generated document sections

Card style:

```txt
Rounded corners: 12px
Border: 1px solid border color
Shadow: subtle or none
Padding: 16-24px
```

### Badge

Badge statuses:

```txt
Draft       : gray
Generating  : blue
Ready       : green
Failed      : red
Archived    : muted
```

### Input

Requirements:

- Clear label.
- Helper text where needed.
- Error text below input.
- Focus state using primary color.

### Toast

Use for:

- Copy success.
- Save success.
- Generation failed.
- Export failed.

## 9. UX Details

### Loading State

AI generation may take time. Show:

```txt
Generating your technical specification...
Creating PRD...
Building user stories...
Designing database schema...
Preparing Codex/Claude prompt...
```

Use progress-like text even if exact progress is not known.

### Empty State

For first-time users:

```txt
Start with a rough idea.
DevPlanr will turn it into a complete developer-ready plan.
```

### Error State

For generation error:

```txt
Generation failed.
Your project was saved, but the AI generation did not complete. You can try again.
```

### Confirmation

Archive project should ask confirmation:

```txt
Archive this project?
You can still keep the record, but it will be hidden from active projects.
```

## 10. Responsive Behavior

### Desktop

- Sidebar always visible.
- Main content max width around 1200px.
- Document viewer uses tabs.

### Tablet

- Sidebar collapses.
- Document tabs scroll horizontally.

### Mobile

- Use topbar with menu button.
- Project actions go into dropdown.
- Document tabs become horizontal scroll.
- Copy/export buttons remain accessible.

## 11. Accessibility

Requirements:

- Buttons must have clear labels.
- Inputs must have labels.
- Color should not be the only status indicator.
- Focus states must be visible.
- Keyboard navigation should work for tabs and forms.
- Text contrast must be readable.

## 12. Motion

Use minimal motion:

```txt
- Fade in cards
- Subtle hover state
- Smooth tab transition
- Loading shimmer
```

Avoid heavy animation. The app should feel fast.

## 13. Design Priorities

Highest priority:

```txt
Readability
Speed
Developer trust
Clear document structure
Easy copy/export
```

Avoid:

```txt
Overly playful visuals
Too many gradients
Heavy animations
Dense dashboard widgets
Complex project management UI
```

## 14. Design Definition of Done

Design is complete when:

- Landing page clearly explains the product.
- Dashboard has clear empty and loaded states.
- New project form is easy to fill.
- Generated documents are easy to read.
- Copy/export actions are obvious.
- App works on desktop and mobile.
- Light and dark mode are readable.
