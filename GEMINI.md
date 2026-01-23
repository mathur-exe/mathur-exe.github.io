# Project Context: Personal Website (Astro)

## Project Overview
This is a personal website built with [Astro](https://astro.build/). It features a clean, typography-focused design inspired by "Thinking Machines," utilizing a sidenote layout for desktop and a single-column layout for mobile. The project supports MDX for content and KaTeX for mathematical notation.

## Tech Stack
*   **Framework**: Astro v5
*   **Language**: TypeScript
*   **Styling**: Global CSS with CSS Variables (Thinking Machines palette)
*   **Content**: MDX (`@astrojs/mdx`) with Zod schema validation
*   **Math**: KaTeX (`katex`, `rehype-katex`, `remark-math`)

## Building and Running

| Command | Description |
| :--- | :--- |
| `npm install` | Install dependencies |
| `npm run dev` | Start local development server (localhost:4321) |
| `npm run build` | Build for production (`dist/`) |
| `npm run preview` | Preview the production build locally |
| `npm run astro` | Run Astro CLI commands |

## Project Structure

*   **`src/content/`**: Contains the content collections.
    *   `blog/`: MDX files for blog posts.
    *   `config.ts`: Defines the Zod schema for the `blog` collection.
*   **`src/layouts/`**: Astro layout components.
    *   `BaseLayout.astro`: Main HTML shell, imports global CSS and KaTeX CSS.
*   **`src/styles/`**:
    *   `global.css`: Contains all styling, including the "Thinking Machines" layout variables, typography, and sidenote logic.
*   **`astro.config.mjs`**: Astro configuration file (currently configured with MDX).

## Development Conventions

### Styling
*   **Methodology**: Plain CSS using CSS Variables (`:root`).
*   **Typography**: Uses "Charter" (serif) for body and system sans-serif for headings.
*   **Layout**:
    *   Desktop: centered text column (`660px`) with right-aligned sidenotes (`200px`) in the margins.
    *   Mobile (`< 1100px`): Sidenotes are hidden by default; text occupies full width.
*   **Variables**: Key layout dimensions and colors are defined in `src/styles/global.css`.

### Content (Blog)
*   Located in `src/content/blog/`.
*   Uses `.mdx` format.
*   **Frontmatter Schema**:
    *   `title` (string, required)
    *   `description` (string, optional)
    *   `pubDate` (date, optional)
    *   `updatedDate` (date, optional)
    *   `heroImage` (string, optional)

### Math Support
*   Dependencies (`remark-math`, `rehype-katex`) are installed.
*   KaTeX CSS is imported globally in `BaseLayout.astro`.
*   *Note: Ensure `remark-math` and `rehype-katex` are properly added to `astro.config.mjs` `markdown` configuration if not already set up.*
