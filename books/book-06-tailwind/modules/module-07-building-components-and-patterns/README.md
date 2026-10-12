# Module 07 — Building Components & Patterns

> Put everything together: build the real UI pieces every product needs — accessibly, responsively, and with the least JavaScript possible.

## 📌 Overview

Modules 01–06 gave you utilities, variants and your own design tokens. This module uses them to build **buttons, badges, cards, navbars, forms, modals, dropdowns, tabs, accordions, tables, lists and alerts**, and then shows how to stop repeating yourself without losing Tailwind's benefits.

The recurring theme: **state lives in attributes** (`aria-*`, `data-*`, `[open]`, `:checked`), and Tailwind variants style from them.

## 📚 Lessons

| # | Lesson | What you'll build |
|---|---|---|
| 01 | Buttons & Badges | Variants, sizes, icon buttons, loading state, groups, count/removable badges |
| 02 | Cards | Image cards, equal-height grids, stretched links, container-query cards |
| 03 | Navbars & Responsive Menus | Sticky navbar, `aria-current`, accessible mobile toggle |
| 04 | Forms & Input Styling | Inputs, error states, custom checks, auto-growing textarea |
| 05 | Modals with `<dialog>` | Native modal, backdrop, animation, scroll lock, React wrapper |
| 06 | Dropdowns, Tabs & Accordions | `<details name>`, disclosure dropdown, ARIA tabs |
| 07 | Tables, Lists & Alerts | Responsive tables, divided/description lists, alert variants |
| 08 | Extracting Components & Managing Repetition | Refactor ladder, React/Vue components, conflicts, data-variants |

## 🎯 Prerequisites

- Book 04 — JavaScript (DOM events, `matchMedia`)
- Book 05 — Bootstrap, Modules 05–08 (for the "how Bootstrap did it" comparisons)
- Book 06, Modules 01–06 (especially Module 05 variants and Module 06 tokens/`@utility`/`@layer`)

## ✅ What you'll be able to do

- Build every common UI pattern from utilities, with accessible keyboard and ARIA behavior
- Use native HTML (`<dialog>`, `<details>`, `popover`) before reaching for libraries
- Drive visual state from attributes instead of toggling classes
- Extract React/Vue components with variant props and avoid dynamic class pitfalls
- Know exactly when `@utility`, `@apply` or a component is the right abstraction

## 🗂️ Module Contents

- `lesson-01` … `lesson-08` — the lessons
- `cheatsheet.md` — copy-paste recipes
- `exercises.md` — hands-on practice
- `interview.md` — interview questions & answers
- `quiz.md` — self-check quiz

## 🧭 How to study

1. Build each component in a scratch project. Don't copy-paste; type it.
2. Test with **keyboard only** (Tab, Shift+Tab, Enter, Space, Escape, arrows) and with the browser's "emulate vision deficiencies" and reduced-motion toggles.
3. Do the revision questions, then the exercises, then the quiz.

## ➡️ Next

Module 08 — Tailwind with Frameworks & Ecosystem: React + Vite, Vue, `clsx`/`tailwind-merge`/`cva`, Headless UI, shadcn/ui, daisyUI, NativeWind and the official plugins.
