# Module 08 — Tailwind with Frameworks & Ecosystem

> Take everything you've learned into real projects: React, Vue, React Native, component libraries, and the official ecosystem.

## 📌 Overview

Modules 01–07 taught Tailwind itself. This module teaches how it **fits into the tools you ship with**: Vite + React, Vue and Nuxt, NativeWind for React Native, the class-composition helpers (`clsx`, `tailwind-merge`, `cva`), UI libraries (Headless UI, shadcn/ui, daisyUI), and the official plugins and commercial offerings.

## 📚 Lessons

| # | Lesson | What you'll learn |
|---|---|---|
| 01 | Tailwind with React & Vite | `@tailwindcss/vite`, template-CSS cleanup, CSS variables, attribute-driven state, tooling |
| 02 | Tailwind with Vue | Vue/Nuxt setup, `:class` binding, class-merging components, `@reference`, `<Transition>` |
| 03 | Conditional Classes: clsx, tailwind-merge & cva | `cn()`, variants, merge conflicts, cva 0.7 vs v1 beta, custom-token config |
| 04 | Headless UI, shadcn/ui & daisyUI | The component-library spectrum and how to choose |
| 05 | NativeWind for React Native | v4 vs v5, Expo setup, RN differences, platform variants, dark mode |
| 06 | Tailwind Plus & Official Plugins | `@plugin`, typography, forms, what's now core, integrations, Plus |

## 🎯 Prerequisites

- Book 04 — JavaScript; React and Vue basics from the framework books
- Book 06, Modules 01–07 (especially Module 06 tokens/`@source`/`@reference` and Module 07 component patterns)

## ✅ What you'll be able to do

- Start a Tailwind v4 project in React, Vue, Nuxt or Expo with correct tooling
- Build components whose styles can be overridden predictably (`cn()` + variants)
- Pick between hand-built, headless, copy-in and class-based component approaches
- Know the real version status of the tools you depend on, and check it before upgrading

## 📌 Version notes (checked October 2026)

| Tool | Status |
|---|---|
| Tailwind CSS | **v4.3.x** current; v4.2 added `@tailwindcss/webpack`, v4.3 added `scrollbar-*` utilities |
| `class-variance-authority` | **0.7.x**, stable, maintenance mode |
| `cva` | **1.0.0-beta.x** (pre-release) |
| `tailwind-merge` | Use **v3+** with Tailwind v4 |
| NativeWind | **4.2.7** stable (Tailwind v3) · **5.0.0-rc.0** release candidate (Tailwind v4.1+, not for production) |
| daisyUI | **5**, requires Tailwind v4 |
| Headless UI | **v2** for React (`data-*` state attributes) |
| shadcn/ui | CLI **v4**, Tailwind v4 CSS-first, Radix or Base UI primitives |

> ⚠️ This is the most version-sensitive module in the book. Always check each project's current docs and release notes before copying commands.

## 🗂️ Module Contents

- `lesson-01` … `lesson-06` — the lessons
- `cheatsheet.md` — setup commands and helper patterns
- `exercises.md` — hands-on practice
- `interview.md` — interview questions & answers
- `quiz.md` — self-check quiz

## 🧭 How to study

1. Create a fresh project for each framework lesson. Don't reuse one, so you practice the setup.
2. Do Lesson 03 in **both** React and Vue.
3. Build the dropdown three ways in Lesson 04's practical.
4. Finish with exercises and the quiz.

## ➡️ Next

Module 09 — the production, accessibility and migration module.
