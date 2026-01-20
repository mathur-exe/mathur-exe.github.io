# Project Progress: Website Migration & Evolution

## Overview

This document tracks the migration of the personal website from a Notion-based redirect to a high-performance, Astro-powered static site with a custom design inspired by **Thinking Machines**.

---

## Tasks & Solutions

### 1. Astro Project Initialization

- **Task**: Set up a modern SSG framework.
- **Solution**: Initialized Astro v5 with MDX and KaTeX integration.
- **Edits**: Created `astro.config.mjs`, `package.json`, and basic folder structure.

### 2. Thinking Machines Design Replication

- **Task**: Implement the "Float & Outdent" margin notes and minimalist typography.
- **Solution**:
  - Analyzed [Thinking Machines](https://thinkingmachines.ai/blog/on-policy-distillation/) layout via browser inspection.
  - Implemented a CSS system using `max-width: 660px` for text and `990px` for the container.
  - Built a `Sidenote.astro` component to handle sidebar commentary.
- **Edits**: `src/styles/global.css`, `src/layouts/BaseLayout.astro`, `src/components/Sidenote.astro`.

### 3. Content Migration (Notion -> MDX)

- **Task**: Port existing content from Notion.
- **Solution**:
  - Used automated scraping (via browser agent) to extract text and structure from the Notion public site.
  - Manually refined the conversion to ensure slugs and links worked in the new Astro routing system.
- **Edits**:
  - `src/pages/index.astro` (Home page reconstruction)
  - `src/content/blog/continuous-latent-space.mdx` (Blog post port)

### 4. Cloudflare Deployment

- **Task**: Host the site for free without overwriting the existing redirect.
- **Solution**:
  - Created a new branch `v2-astro` in the `mathur-exe.github.io` repository.
  - Connected Cloudflare Pages to the `v2-astro` branch.
  - Configured build settings (`npm run build` -> `dist`).
- **Edits**: Git branch management and Cloudflare dashboard configuration.

---

## Recent Edits (Layout Optimization)

- **Date**: 2026-01-20
- **Task**: Refine the width of the text column and margins to match Thinking Machines' "tight" aesthetic.
- **Changes**:
  - Changed `--container-max-width` from `1200px` to `990px`.
  - Changed `article` `max-width` to a fixed `660px` (centered).
  - Adjusted `.sidenote` negative margin to `-235px` with a `35px` gutter.
- **Result**: Content no longer feels spread out on wide monitors; achieves the high-fidelity scientific report look.
