# Lesson 02 — Tailwind with Vue

## 🎯 Learning Objectives

- Set up Tailwind v4 in Vue + Vite and in Nuxt
- Bind classes with `:class` (strings, arrays, objects) without breaking Tailwind's scanner
- Build reusable Vue components with props, slots and class merging
- Use `@apply` correctly inside `<style scoped>` with `@reference`
- Use Vue's `<Transition>` with Tailwind classes
- Avoid the Vue 3 attribute-boolean gotcha

---

## Introduction

Tailwind doesn't care which framework renders your HTML — it only scans source files for class strings. In Vue, the templates are `.vue` files, so the integration is nearly identical to React. The differences are in **how Vue binds classes**, **scoped styles**, and **component class merging**.

---

## 1. Setup: Vue + Vite

```bash
npm create vite@latest my-app -- --template vue
cd my-app
npm install
npm install tailwindcss @tailwindcss/vite
```

```js
// vite.config.js
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [vue(), tailwindcss()],
});
```

```css
/* src/style.css  (or src/assets/main.css with create-vue) */
@import "tailwindcss";
```

```js
// src/main.js
import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";

createApp(App).mount("#app");
```

> ⚠️ Like the React template, Vue's starters ship base CSS (`style.css` / `assets/base.css`, `main.css`) with body, `#app` and link styles that fight Tailwind. Replace it with the single `@import` line and remove the template's `#app { … }` rules.

### Nuxt

```bash
npm install tailwindcss @tailwindcss/vite
```

```ts
// nuxt.config.ts
import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  css: ["~/assets/css/main.css"],
  vite: { plugins: [tailwindcss()] },
});
```

```css
/* app/assets/css/main.css */
@import "tailwindcss";
```

---

## 2. Binding classes with `:class`

Static classes go in `class`; dynamic ones in `:class`. Both can coexist and Vue merges them.

```vue
<template>
  <!-- array syntax -->
  <button :class="['rounded-lg px-4 py-2 text-sm font-medium', active ? 'bg-indigo-600 text-white' : 'bg-slate-100 text-slate-700']">
    Save
  </button>

  <!-- object syntax: key = full class string, value = condition -->
  <li :class="{ 'font-semibold text-indigo-600': isCurrent, 'opacity-50': disabled }">Item</li>

  <!-- lookup map -->
  <span :class="tones[tone]">{{ label }}</span>
</template>

<script setup>
const tones = {
  info: "bg-sky-50 text-sky-800 ring-1 ring-sky-600/20 ring-inset",
  error: "bg-red-50 text-red-800 ring-1 ring-red-600/20 ring-inset",
};
</script>
```

Same rule as always: **every class must exist as a complete string** somewhere in the file. Template literals like `` `bg-${color}-500` `` inside `:class` fail for the same reason.

---

## 3. Components with props, slots and class merging

```vue
<!-- src/components/BaseButton.vue -->
<script setup>
import { computed } from "vue";
import { cn } from "@/lib/utils";   // clsx + tailwind-merge (Lesson 03)

const props = defineProps({
  variant: { type: String, default: "solid" },
  size: { type: String, default: "md" },
  class: { type: null, default: undefined },   // accept a class from the parent
});

const base =
  "inline-flex cursor-pointer items-center justify-center gap-2 rounded-lg font-medium transition " +
  "outline-hidden focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 " +
  "disabled:pointer-events-none disabled:opacity-50";

const variants = {
  solid: "bg-indigo-600 text-white hover:bg-indigo-700",
  outline: "border border-slate-300 bg-white text-slate-700 hover:bg-slate-50",
  danger: "bg-red-600 text-white hover:bg-red-700",
};
const sizes = { sm: "px-3 py-1.5 text-xs", md: "px-4 py-2 text-sm", lg: "px-6 py-3 text-base" };

const classes = computed(() => cn(base, variants[props.variant], sizes[props.size], props.class));
</script>

<template>
  <button :class="classes"><slot /></button>
</template>
```

```vue
<BaseButton variant="danger" class="ml-auto px-8">Delete</BaseButton>
```

Because `class` is declared as a prop, the parent's `px-8` goes through `cn()`/`twMerge` and correctly replaces `px-4`. (Without `tailwind-merge`, both classes would exist and **stylesheet order**, not class order, decides the winner — Module 07, lesson 08.)

### Slots for composition

```vue
<!-- Card.vue -->
<template>
  <article class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-xs">
    <header v-if="$slots.header" class="border-b border-slate-100 px-5 py-3 font-medium"><slot name="header" /></header>
    <div class="p-5"><slot /></div>
    <footer v-if="$slots.footer" class="border-t border-slate-100 bg-slate-50 px-5 py-3 text-sm"><slot name="footer" /></footer>
  </article>
</template>
```

---

## 4. `<style scoped>` and `@apply` — `@reference` is required

A Vue `<style>` block is processed **in isolation**. It doesn't know your theme or utilities, so `@apply` fails unless you point it at your CSS entry (Module 06, lesson 07):

```vue
<style scoped>
@reference "../assets/main.css";

.title {
  @apply text-2xl font-bold text-brand-600;
}
</style>
```

Alternatives that don't need `@reference`: use CSS variables directly (`color: var(--color-brand-600)`), or avoid `<style>` entirely and use utilities in the template — which is the Tailwind way.

> 💡 Scoped styles add a `data-v-xxxx` attribute selector, which raises specificity. That's another reason utilities in the template are usually less surprising than scoped CSS.

---

## 5. State → attributes → variants

```vue
<template>
  <button
    :aria-expanded="open"
    class="group flex w-full items-center justify-between p-4"
    @click="open = !open"
  >
    {{ title }}
    <span class="transition-transform group-aria-expanded:rotate-180">⌄</span>
  </button>
  <div v-show="open" class="px-4 pb-4"><slot /></div>
</template>

<script setup>
import { ref } from "vue";
defineProps({ title: String });
const open = ref(false);
</script>
```

### ⚠️ Vue 3 attribute booleans

In Vue 3, binding `false` to a **non-boolean attribute** renders it as the string `"false"` (Vue 2 removed it). Only `null` and `undefined` remove the attribute:

```vue
<li :data-active="isActive" />                  <!-- ❌ data-active="false" still matches data-active: -->
<li :data-active="isActive ? '' : undefined" /> <!-- ✅ -->
<li :data-active="String(isActive)" class="data-[active=true]:bg-indigo-50" />  <!-- ✅ explicit -->
```

`:aria-expanded="open"` is fine (`"true"`/`"false"` are valid ARIA values).

---

## 6. `<Transition>` with Tailwind classes

Vue's transition component handles **enter and leave** for `v-if`, and its hook classes accept utilities directly:

```vue
<Transition
  enter-active-class="transition duration-200 ease-out"
  enter-from-class="opacity-0 translate-y-2"
  enter-to-class="opacity-100 translate-y-0"
  leave-active-class="transition duration-150 ease-in"
  leave-from-class="opacity-100"
  leave-to-class="opacity-0"
>
  <div v-if="open" class="rounded-xl border bg-white p-4 shadow-lg">Hello</div>
</Transition>
```

Compare with `starting:` (Module 05, lesson 03): `starting:` is CSS-only and handles **entry**; `<Transition>` also controls **exit** by delaying DOM removal. Use `<Transition>` when you need both and the browser support of CSS exit animations isn't there yet.

---

## 7. Dark mode

`@vueuse/core` provides `useDark`, which toggles a class on `<html>` and persists the choice:

```js
import { useDark, useToggle } from "@vueuse/core";

const isDark = useDark();            // adds/removes class="dark" on <html>, saved in localStorage
const toggleDark = useToggle(isDark);
```

It pairs with `@custom-variant dark (&:where(.dark, .dark *));` from Module 06, lesson 01. (Still add the blocking `<head>` script for SSR/first paint.)

---

## 8. Editor tooling

- **Volar** (Vue language tools) + **Tailwind CSS IntelliSense**. IntelliSense understands `.vue` files.
- Same `tailwindCSS.classFunctions` and Prettier setup as Lesson 01 (`prettier-plugin-tailwindcss` works with Vue templates).

---

## 🧪 Practical Example — Alert component with slots and a dismiss transition

```vue
<!-- AlertBanner.vue -->
<script setup>
import { ref } from "vue";
import { cn } from "@/lib/utils";

const props = defineProps({
  tone: { type: String, default: "info" },
  dismissible: Boolean,
  class: { type: null, default: undefined },
});

const tones = {
  info: "bg-sky-50 text-sky-800 ring-sky-600/20",
  success: "bg-green-50 text-green-800 ring-green-600/20",
  error: "bg-red-50 text-red-800 ring-red-600/20",
};

const visible = ref(true);
</script>

<template>
  <Transition leave-active-class="transition duration-200" leave-to-class="opacity-0 -translate-y-1">
    <div
      v-if="visible"
      :role="tone === 'error' ? 'alert' : 'status'"
      :class="cn('flex gap-3 rounded-lg p-4 text-sm ring-1 ring-inset', tones[tone], props.class)"
    >
      <div class="flex-1"><slot /></div>
      <button v-if="dismissible" aria-label="Dismiss" class="-m-1 grid size-7 place-items-center rounded-md hover:bg-black/5" @click="visible = false">×</button>
    </div>
  </Transition>
</template>
```

```vue
<AlertBanner tone="error" dismissible class="mb-4">Payment failed. Try another card.</AlertBanner>
```

---

## 📝 Revision Questions

<details>
<summary>1. What goes in `vite.config.js` for Tailwind v4 with Vue?</summary>

`plugins: [vue(), tailwindcss()]` with `tailwindcss` imported from `@tailwindcss/vite`.
</details>

<details>
<summary>2. Why does `@apply` fail in a `<style scoped>` block, and what fixes it?</summary>

The block is compiled in isolation and doesn't know your theme/utilities. Add `@reference "path/to/main.css";` (or use CSS variables instead).
</details>

<details>
<summary>3. How do you let a parent override a child component's padding reliably?</summary>

Accept a `class` prop and merge with `cn()` (`clsx` + `tailwind-merge`) so conflicting utilities are resolved.
</details>

<details>
<summary>4. What does Vue 3 render for `:data-active="false"`?</summary>

`data-active="false"` (the attribute stays). Use `undefined`/`null` to remove it.
</details>

<details>
<summary>5. When would you choose `<Transition>` over `starting:`?</summary>

When you need an animated **exit** too (v-if removal) or can't rely on CSS entry/exit support.
</details>
