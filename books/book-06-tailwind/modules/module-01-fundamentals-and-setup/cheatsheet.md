# Module 01 Cheatsheet — Tailwind Fundamentals & Setup

## Installation Quick Reference

| Method | Install | Config |
|---|---|---|
| Vite plugin | `npm install -D tailwindcss @tailwindcss/vite` | Add `tailwindcss()` to `vite.config.ts` plugins |
| Standalone CLI | `npm install -D tailwindcss @tailwindcss/cli` | `npx @tailwindcss/cli -i input.css -o output.css --watch` |
| PostCSS plugin | `npm install -D tailwindcss @tailwindcss/postcss` | Add `'@tailwindcss/postcss': {}` to `postcss.config.mjs` |
| Play CDN (demos only) | `<script src="https://cdn.tailwindcss.com"></script>` | None — never use in production |

## The CSS Entry Point
```css
@import "tailwindcss";
```
This one line = Preflight (base reset) + theme variables + on-demand utilities. Replaces v3's three `@tailwind` directives.

## Preflight Quick Facts
- Removes default margins on all elements
- Headings inherit `font-size`/`font-weight` instead of using browser defaults → style them explicitly
- Removes default list bullets/numbers
- Sets `border-width: 0` by default so `border` utilities behave predictably

## On-Demand Generation
- Tailwind only generates CSS for classes it finds as **complete literal strings** in your source
- v4 auto-detects which files to scan — no `content` array needed
- ❌ `` className={`bg-${color}-500`} `` — silently fails, no CSS generated
- ✅ Lookup object mapping values to complete class name strings
- Escape hatch for unavoidable cases: `@source inline("bg-red-500", "bg-green-500");`

## Editor Setup
- Install: **Tailwind CSS IntelliSense** (VS Code / JetBrains) — autocomplete, hover previews, linting
- Fixes "unknown at-rule" squiggles on `@theme`, `@apply`, etc.
- Install: `prettier-plugin-tailwindcss` — auto-sorts classes on save
```bash
  npm install -D prettier prettier-plugin-tailwindcss
```
```json
  { "plugins": ["prettier-plugin-tailwindcss"] }
```

## Utility-First vs. Bootstrap (quick contrast)
| | Bootstrap | Tailwind |
|---|---|---|
| Ships components? | Yes (`.btn`, `.card`) | No — you build your own (Module 07) |
| Default visual identity | Recognizable | None |
| Customization | Sass variables | Compose utilities directly |
