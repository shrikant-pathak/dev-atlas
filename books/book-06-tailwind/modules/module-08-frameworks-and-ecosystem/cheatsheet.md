# Module 08 Cheatsheet — Tailwind with Frameworks & Ecosystem

## Setup (Tailwind v4)

| Stack | Install | Config |
|---|---|---|
| **React + Vite** | `npm i tailwindcss @tailwindcss/vite` | `plugins: [react(), tailwindcss()]`; CSS: `@import "tailwindcss";` |
| **Vue + Vite** | same | `plugins: [vue(), tailwindcss()]` |
| **Nuxt** | same | `css: ["~/assets/css/main.css"]`, `vite: { plugins: [tailwindcss()] }` |
| **Next.js** | `npm i tailwindcss @tailwindcss/postcss` | `postcss.config.mjs`: `plugins: { "@tailwindcss/postcss": {} }` |
| **No bundler** | `npm i tailwindcss @tailwindcss/cli` | `npx @tailwindcss/cli -i in.css -o out.css --watch` |
| **Webpack** | `@tailwindcss/webpack` (v4.2+) | add loader |

After setup: remove the starter template's base CSS (`index.css` body/button rules, `App.css`, `#app` styles).

## Class helpers

```js
// src/lib/utils.js
import { clsx } from "clsx";
import { twMerge } from "tailwind-merge";           // v3+ for Tailwind v4
export const cn = (...inputs) => twMerge(clsx(inputs));
```

```js
// custom tokens (e.g. --text-eyebrow)
import { extendTailwindMerge } from "tailwind-merge";
const twMerge = extendTailwindMerge({ extend: { classGroups: { "font-size": [{ text: ["eyebrow"] }] } } });
```

## cva

```js
// stable: class-variance-authority 0.7
const button = cva("base classes", {
  variants: { intent: { solid: "…", outline: "…" }, size: { sm: "…", md: "…" } },
  compoundVariants: [{ intent: "outline", size: "md", class: "…" }],
  defaultVariants: { intent: "solid", size: "md" },
});
cn(button({ intent, size }), className);
```

```js
// beta: cva@beta (1.0.0-beta.x)
import { defineConfig } from "cva/config";
export const { cva, cx: cn } = defineConfig({ cx: (...i) => twMerge(clsx(i)) });
cva({ base: "…", variants: { … }, defaultVariants: { … } });
```

`null` no longer disables a variant in v1 (use `undefined`/explicit "none" variant).

## Framework gotchas

| Issue | React | Vue |
|---|---|---|
| Class attr | `className` | `class` / `:class` |
| Conditional | `cn(a && "x")` | `:class="['x', a && 'y']"` |
| Boolean data attr | `data-x={on ? "" : undefined}` | `:data-x="on ? '' : undefined"` |
| `@apply` in scoped styles | CSS Modules: `@reference "../index.css"` | `<style scoped>`: `@reference "../assets/main.css"` |
| Merge parent classes | `cn(base, className)` | prop `class` + `cn(base, props.class)` |
| Enter/exit animation | `starting:` / library | `<Transition enter-from-class="opacity-0" …>` |

Never build class names dynamically: use full-string maps, CSS variables, or `@source inline()`.

## Tooling

```json
// .vscode/settings.json
{ "tailwindCSS.classFunctions": ["cva", "cx", "cn", "clsx"] }
```

```json
// .prettierrc
{ "plugins": ["prettier-plugin-tailwindcss"], "tailwindStylesheet": "./src/index.css", "tailwindFunctions": ["cn", "cva", "clsx"] }
```

## Component libraries

| Library | Install | Style hooks |
|---|---|---|
| **Headless UI v2** (React) | `npm i @headlessui/react` | `data-open:` `data-focus:` `data-hover:` `data-closed:` `data-checked:` `data-disabled:` |
| **Radix UI / Base UI** | `radix-ui` / Base UI | `data-[state=open]:…` (Radix) |
| **shadcn/ui** | `npx shadcn@latest init` then `add <component>` | Source copied into repo; `cn` + `cva`; tokens via `@theme inline` |
| **daisyUI 5** | `npm i -D daisyui@latest` | `@plugin "daisyui";` · `btn btn-primary` · `data-theme` · `bg-base-100` |

## NativeWind

| | v4 (stable) | v5 (RC) |
|---|---|---|
| Tailwind | v3 | v4.1+ |
| Config | `tailwind.config.js` | CSS (`global.css`) |
| Metro | `withNativeWind` | `withNativewind` |
| Custom components | `cssInterop` / `remapProps` | `styled()` |

v5 setup: `nativewind@5.0.0-rc.0` + `react-native-css@3.1.0-rc.0`, `tailwindcss@4.1.12`, `@tailwindcss/postcss`, `lightningcss` pinned, `postcss.config.mjs`, `global.css` imports (`tailwindcss/theme.css` layer(theme), `preflight.css` layer(base), `utilities.css`, `nativewind/theme`), Metro wrapper, import CSS once in the root layout.

RN differences: no grid, flex column default, `Text` doesn't inherit from `View`, platform variants `ios:` `android:` `native:` `web:`.

## Official plugins & core

```css
@plugin "@tailwindcss/typography";   /* prose, prose-lg, dark:prose-invert, not-prose */
@plugin "@tailwindcss/forms";
```

Now core: container queries, aspect-ratio, line-clamp. New in v4.2–4.3: `scrollbar-*`, `@container-size`, `font-features-*`, `zoom-*`, `@tailwindcss/webpack`.

Tailwind Plus = UI blocks + templates + Catalyst (React kit) + Plus Elements (vanilla JS), one-time purchase.
