# Module 06 — Customization & Dark Mode

> Turn Tailwind from "a utility library" into **your** design system: your tokens, your utilities, your variants, your themes.

## 📌 Overview

Tailwind v4 moved configuration from `tailwind.config.js` into **CSS**. This module teaches the CSS-first toolbox — `@theme`, `@utility`, `@custom-variant`, `@layer`, `@apply`, `@source`, `@plugin`, `@config` — and uses it to build dark mode and multi-theme support.

## 📚 Lessons

| # | Lesson | What you'll learn |
|---|---|---|
| 01 | Dark Mode & Color Scheme | `dark:`, manual toggles, FOUC fix, `scheme-*` |
| 02 | The `@theme` Directive & Design Tokens | Namespaces, `static`, `inline`, resetting defaults, `--default-*` |
| 03 | Customizing Colors, Spacing & Fonts | Brand scales (OKLCH), `--spacing`, custom fonts and sizes |
| 04 | Arbitrary Values & Properties | `[...]`, `(--var)`, `!` modifier, `prefix()`, dynamic-class pitfall |
| 05 | Custom Utilities with `@utility` | Simple and functional utilities, `--value()` |
| 06 | Custom Variants with `@custom-variant` | Shorthand, `@slot`, attribute state variants, `@variant` |
| 07 | `@layer`, `@apply` & Base Styles | Cascade layers, `@reference`, unlayered-CSS trap, CSS functions |
| 08 | `@source`, `@plugin` & Legacy Config | Source detection, `@source inline()`, `@plugin`, `@config` |
| 09 | Multi-theme & CSS Variables | Semantic tokens, `@theme inline`, scoped & runtime themes |

## 🎯 Prerequisites

- Book 03 — CSS (custom properties, cascade layers)
- Book 04, Module 07 — `localStorage` (theme persistence)
- Book 05, Module 10 — Bootstrap color modes (for comparison)
- Book 06, Modules 01–05

## ✅ What you'll be able to do

- Build a complete design token set in one CSS file
- Add dark mode with a persisted, flash-free light/dark/system toggle
- Create custom utilities and variants that work with every existing variant
- Control exactly which files Tailwind scans and which classes it generates
- Ship multi-theme UIs where components never mention the theme

## 🗂️ Module Contents

- `lesson-01` … `lesson-09` — the lessons
- `cheatsheet.md` — directives and patterns at a glance
- `exercises.md` — hands-on practice
- `interview.md` — interview questions & answers
- `quiz.md` — self-check quiz

## 🧭 How to study

1. Keep a Vite + Tailwind v4 project open (Module 01) and one CSS entry file you can edit freely.
2. Type each CSS snippet — then change a value and watch what moves.
3. Answer the revision questions before opening the answers.
4. Finish with the exercises, then the quiz.

> ⚠️ A few features need recent v4 releases: `@source inline()` (v4.1+) and `scheme-*` utilities. Check your installed version with `npm ls tailwindcss`.

## ➡️ Next

Module 07 — Building Components & Patterns: use everything so far to build real buttons, cards, navbars, forms and modals.
