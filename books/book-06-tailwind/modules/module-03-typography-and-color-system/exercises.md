# Module 03 Exercises — Typography & Color System

## Exercise 1: Typographic Hierarchy
Build a blog post header with: an eyebrow label (small, uppercase, `tracking-wide`), a large bold title (`text-balance`, tight leading/tracking), and a byline (smaller, muted color). Use only utilities from Lessons 1–3.

## Exercise 2: Card Grid with Consistent Heights
Build a 3-card grid where titles use `truncate` and descriptions use `line-clamp-3`, using source text of deliberately varying lengths. Confirm every card renders the same height regardless of content length.

## Exercise 3: Render Untrusted HTML
Install `@tailwindcss/typography`. Paste in a block of raw HTML (headings, paragraphs, a list, a blockquote) with no utility classes on any inner element, wrap it in `<article class="prose">`, and confirm it renders with sensible typographic styling automatically. Then add `prose-invert` on a dark background and confirm it remains readable.

## Exercise 4: Opacity Layering
Build a translucent modal: a `bg-black/50` full-screen backdrop, and a `bg-white/90` panel with a `border-white/20` border, with `backdrop-blur-sm` for a frosted-glass look. Explain, using Lesson 8's reasoning, why the slash syntax lets these three transparent layers coexist without interfering with each other.

## Exercise 5: Gradient Hero Banner
Build a hero section with a background image (`bg-[url(...)] bg-cover bg-center`), an absolutely positioned gradient overlay fading from `black/70` to `transparent`, and white heading text positioned at the bottom. Then build a second version using `bg-conic` for a decorative, non-photographic hero background instead.
