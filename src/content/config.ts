import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
    type: 'content',
    // Type-check frontmatter using a schema
    schema: z.object({
        title: z.string(),
        description: z.string().optional(),
        // Transform string to Date object
        pubDate: z.coerce.date().optional(),
        updatedDate: z.coerce.date().optional(),
        heroImage: z.string().optional(),
        // Layout config
        layoutType: z.enum(['council']).optional(),
        tabs: z.array(z.object({
            label: z.string(),
            id: z.string(),
            items: z.array(z.string()).optional(),
        })).optional(),
    }),
});

export const collections = { blog };
