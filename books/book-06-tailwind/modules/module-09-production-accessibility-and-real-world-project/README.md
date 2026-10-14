# Module 09 — Production, Accessibility & Real-World Project

> Ship it well: accessible, fast, compatible, maintainable. Then build a real two-page product and review it like a pro.

## 📌 Overview

The final module of Book 06 turns what you know into **production habits**: accessibility, user preferences (motion, contrast, forced colors), build optimization, browser support and fallbacks, migrating from Tailwind v3 and from Bootstrap (including RTL), design-system structure, a capstone project, and a code-review practice.

## 📚 Lessons

| # | Lesson | What you'll learn |
|---|---|---|
| 01 | Accessibility with Tailwind | Semantics after Preflight, hiding techniques, focus, targets, contrast, order, testing |
| 02 | Motion, Contrast & Forced Colors | `motion-*`, `contrast-more:`, `forced-colors:`, pointer variants, DevTools emulation |
| 03 | Build Optimization & Bundle Size | Measuring CSS, budgets, bloat causes, fonts, images, runtime CSS cost |
| 04 | Browser Support & Fallbacks | v4 baseline, Baseline data, `supports-*`, no-JS/no-hover design, print, testing |
| 05 | Migrating from v3 and from Bootstrap | Upgrade tool, renames and defaults, leftovers, layered coexistence, mappings, RTL |
| 06 | Design System & Project Structure | Token layers, CSS/file structure, component API rules, shared themes, governance |
| 07 | Capstone: Landing Page & Dashboard | Build "Atlas Analytics" with a rubric |
| 08 | Best Practices & Code Review | Checklist, smells, v3-ism review, automation, PR template, style guide |

## 🎯 Prerequisites

- Book 06, Modules 01–08
- Book 03 (CSS) for the underlying features; Book 05 (Bootstrap) for the migration comparisons, including Module 11 (RTL)

## ✅ What you'll be able to do

- Ship pages that work with keyboards, screen readers, reduced motion, high contrast and forced colors
- Measure and control CSS size; optimize fonts and images
- Decide whether v4 fits your browser matrix and add fallbacks where needed
- Migrate a v3 or Bootstrap codebase safely and incrementally, including RTL
- Structure a shared design system and enforce it with CI guards
- Review Tailwind code (human or AI-generated) with a repeatable checklist

## 📌 Version notes (checked October 2026)

| Topic | Status |
|---|---|
| Tailwind | v4.3.x current |
| v4 browser baseline | Safari 16.4+, Chrome 111+, Firefox 128+ (check the Compatibility page; minimums rise over time) |
| Core variants used here | `forced-colors`, `contrast-more/less`, `pointer-*` and `any-pointer-*`, `user-valid/invalid`, `noscript`, `inverted-colors` (the last four from v4.1) |
| Upgrade tool | `npx @tailwindcss/upgrade` (needs Node 20+) |
| `start-*` / `end-*` utilities | Deprecated in newer v4.x releases for more explicit logical names — check your version's docs |

## 🗂️ Module Contents

- `lesson-01` … `lesson-08` — the lessons
- `cheatsheet.md` — checklists and migration tables
- `exercises.md` — hands-on practice
- `interview.md` — interview questions & answers
- `quiz.md` — self-check quiz

## 🧭 How to study

1. Do Lessons 01–02 with a keyboard and DevTools' Rendering panel open.
2. Measure before optimizing (Lesson 03).
3. Migrate a *copy* of a real project in Lesson 05, using the greps.
4. Build the capstone (Lesson 07) and review it with Lesson 08's checklist.

## ➡️ Next

This completes **Book 06 — Tailwind CSS**. Continue with the next book in the roadmap.
