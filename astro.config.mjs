// @ts-check
import { defineConfig } from 'astro/config';

import mdx from '@astrojs/mdx';
import remarkMath from 'remark-math';
import { remarkMark } from 'remark-mark-highlight';
import rehypeKatex from 'rehype-katex';

// https://astro.build/config
export default defineConfig({
  markdown: {
    remarkPlugins: [remarkMath, remarkMark],
    rehypePlugins: [rehypeKatex],
  },
  integrations: [mdx({
    remarkPlugins: [remarkMath, remarkMark],
    rehypePlugins: [rehypeKatex],
  })]
});
