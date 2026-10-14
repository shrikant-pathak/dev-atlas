# Lesson 08 — Best Practices & Code Review

## 🎯 Learning Objectives

- Apply the core Tailwind best practices as a checklist
- Recognize common code smells and their fixes
- Review Tailwind code (including AI-generated code) for v3-isms and accessibility problems
- Automate what can be automated: formatting, linting, size, accessibility tests
- Write a team style guide and a pull-request checklist
- Know where to go next

---

## Introduction

You've now seen the whole toolchain. This final lesson turns the book into **habits**: what to do by default, what to question in review, and what to automate so reviews can focus on judgment.

---

## 1. Twelve best practices

1. **Mobile-first.** Unprefixed = smallest screen; add `sm:`/`md:` as space grows.
2. **Semantic HTML first**, utilities second. Style the right element, don't pick the element for its look.
3. **Tokens over magic values.** Repeated values belong in `@theme`; one-offs may be arbitrary (`w-[117px]`).
4. **Semantic color tokens in app code** (`bg-surface`, `text-foreground`), raw palette only inside the theme.
5. **State in attributes** (`aria-*`, `data-*`, `[open]`, `:checked`), styled with variants. Avoid duplicate class toggling.
6. **Components, not `@apply`.** Extract UI pieces into React/Vue components; reach for `@utility` for style groups needing variants; use `@apply`/`@layer components` only for markup you can't change.
7. **Complete class strings.** Never build class names dynamically; use maps, CSS variables or `@source inline()`.
8. **Merge classes with `cn()`** (`clsx` + `tailwind-merge`) in components that accept overrides.
9. **Focus is always visible**; prefer `outline` for it; one global `:focus-visible` rule.
10. **Respect preferences**: reduced motion, contrast, forced colors, dark mode, touch.
11. **Measure** CSS size and run accessibility checks in CI.
12. **Write down your decisions** (style guide, token table, browser policy).

---

## 2. Code smells and fixes

| Smell | Why it hurts | Fix |
|---|---|---|
| `` `bg-${color}-500` `` | Class never generated | Lookup map / CSS variable / `@source inline()` |
| Same 30-class string in 8 files | Edits miss spots | Extract a component (Module 07, lesson 08) |
| `@apply` everywhere | Rebuilds Bootstrap-style CSS, duplicates rules | Components, or `@utility` |
| Many `w-[137px] mt-[13px]` | Off-scale, inconsistent design | Use the scale or add tokens |
| `!important` suffix (`p-4!`) sprinkled around | Cascade fights | Fix layer order / specificity, remove the conflicting CSS |
| `bg-blue-500` in feature code | Breaks themes and rebrands | `bg-primary` (semantic token) |
| `outline-none` (v3) / removed focus | Keyboard users lost | `outline-hidden` + a visible `focus-visible` style |
| `<div onClick>` styled like a button | Not focusable, no semantics | `<button>` |
| `opacity-0` to hide interactive content | Still tabbable/announced | `hidden`, `invisible`, `inert` |
| `flex-row-reverse`/`order-*` changing meaning | Focus order ≠ visual order | Reorder DOM |
| `text-[12px]` | Ignores user font size | `text-xs` (rem) |
| `transition-all` on everything | Animates unintended properties | Specific `transition-*` |
| Color-only state (`border-red-500` alone) | Fails color-blind and forced-colors users | Add text/icon, border/outline |
| `ml-*`/`left-*` in a multilingual product | Breaks RTL | `ms-*`/`start-*`, `rtl:` |
| Class order chaos | Noisy diffs | `prettier-plugin-tailwindcss` |
| `ring-*` as the only focus style | Disappears in forced colors | `outline` |
| `hover:` hiding essential info | Unreachable on touch | Show on focus/persistently |

---

## 3. Reviewing for v3-isms (especially in AI-generated code)

Assistants and older tutorials still produce Tailwind **v3** code with confidence. In review, scan for:

```bash
rg -n "@tailwind (base|components|utilities)" src                     # old directives
rg -n "tailwind\.config\.(js|ts|cjs|mjs)" .                           # JS config for a v4 project?
rg -n "bg-opacity-|text-opacity-|border-opacity-" src                 # removed
rg -n "flex-(shrink|grow)(-|\b)|overflow-ellipsis" src                # removed/renamed
rg -n "\boutline-none\b" src                                          # should be outline-hidden
rg -n "bg-gradient-to-" src                                           # legacy gradient names
rg -n "\[--[a-z0-9-]+\]" src                                          # old [--var] syntax → (--var)
rg -n "autoprefixer|postcss-import" package.json postcss.config.* 2>/dev/null
rg -n "darkMode|content:\s*\[" . --glob '!node_modules'               # v3 config keys
```

Also question these claims in generated code: "install `tailwindcss-animate`" (→ `tw-animate-css`), "add a `safelist`" (→ `@source inline`), "set `theme.extend.colors`" (→ `@theme`), and "`shadow-sm` = small" (scale shifted in v4).

---

## 4. Automate

| Check | Tool |
|---|---|
| Class sorting | `prettier-plugin-tailwindcss` (`tailwindStylesheet`, `tailwindFunctions`) |
| Editor warnings (conflicts, unknown classes) | Tailwind CSS IntelliSense |
| Accessibility lint (JSX) | `eslint-plugin-jsx-a11y` |
| Accessibility tests | `@axe-core/playwright`, Storybook a11y add-on |
| Visual regression | Playwright screenshots, Chromatic |
| CSS budget | The gzip script from Lesson 03 |
| Banned patterns | `rg` guards from Lessons 05–06 in CI |
| Cross-browser | Playwright (Chromium, WebKit, Firefox) |
| Pre-commit | `lint-staged` + husky (format + guards on changed files) |

```yaml
# .github/workflows/ci.yml (sketch)
name: ci
on: [pull_request]
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 22, cache: npm }
      - run: npm ci
      - run: npx prettier --check .
      - run: npm run build
      - run: node scripts/check-css-budget.mjs
      - run: bash scripts/guards.sh
      - run: npx playwright install --with-deps && npx playwright test
```

Automation covers the mechanical; **review** covers judgment.

---

## 5. Pull-request checklist

Copy this into `.github/pull_request_template.md`:

```markdown
## Tailwind / UI review checklist

**Structure & semantics**
- [ ] Correct elements (button/a/label/headings/landmarks), no clickable divs
- [ ] Heading levels follow the outline, not the visual size

**Styling**
- [ ] Mobile-first; tested at 320px, tablet, desktop
- [ ] Semantic color tokens only (no raw palette in feature code)
- [ ] No dynamic class names; variants are full strings (map / cva)
- [ ] No unexplained `!`, `@apply`, or arbitrary values (promote repeats to tokens)
- [ ] Components accept `className` and merge with `cn()`
- [ ] Logical properties (`ms-*`, `text-start`) unless direction is intentional

**Accessibility**
- [ ] Keyboard-only walkthrough done; focus visible and in logical order
- [ ] Targets ≥ 24px (44px for touch); contrast ≥ AA in every theme
- [ ] State isn't color-only; errors have text and `aria-describedby`
- [ ] Hidden content uses `hidden`/`invisible`/`inert` (not `opacity-0`)

**Preferences & browsers**
- [ ] Checked: reduced motion, increased contrast, forced colors, dark mode
- [ ] Features beyond the support baseline have fallbacks (`supports-*`)

**Performance**
- [ ] CSS budget unchanged or explained; images sized; no layout shift
- [ ] No `transition-all`/animated layout properties on heavy elements

**v4 hygiene**
- [ ] No v3 syntax (`@tailwind`, `*-opacity-*`, `flex-shrink`, `outline-none`, `bg-gradient-to-*`)
```

---

## 6. Refactoring example

**Before:**

```jsx
function Notice({ type, text }) {
  return (
    <div onClick={() => dismiss()} className={`p-4 rounded ${type === "error" ? "bg-red-500 text-white" : "bg-" + type + "-500 text-white"} cursor-pointer outline-none`}>
      {text}
    </div>
  );
}
```

Problems: clickable `div`, dynamic class, `outline-none`, raw palette colors, no role, color-only meaning, no merge.

**After:**

```jsx
import { cva } from "class-variance-authority";
import { cn } from "@/lib/utils";

const notice = cva("flex items-start gap-3 rounded-lg border p-4 text-sm", {
  variants: {
    tone: {
      info: "border-border bg-surface-muted text-foreground",
      success: "border-success text-foreground",
      error: "border-danger text-foreground",
    },
  },
  defaultVariants: { tone: "info" },
});

const labels = { info: "Information", success: "Success", error: "Error" };

export function Notice({ tone = "info", onDismiss, className, children }) {
  return (
    <div role={tone === "error" ? "alert" : "status"} className={cn(notice({ tone }), className)}>
      <p className="flex-1"><span className="font-semibold">{labels[tone]}: </span>{children}</p>
      {onDismiss && (
        <button type="button" onClick={onDismiss} aria-label="Dismiss"
                className="grid size-8 place-items-center rounded-md hover:bg-surface-muted">×</button>
      )}
    </div>
  );
}
```

Semantic tokens, text label (not color-only), proper roles, real button with a name, `cn()` merge, static class strings, global focus style.

---

## 7. A team style guide template

Put this in `STYLEGUIDE.md` and keep it short enough that people read it:

```markdown
# Frontend style guide

## Stack
Tailwind CSS v4 (CSS-first), React/Vue, Vite. Class helpers: `cn()` (clsx + tailwind-merge).

## Supported browsers
Safari 16.4+, Chrome 111+, Firefox 128+ (Tailwind v4 baseline). Newer features need fallbacks.

## Tokens
- App code uses semantic tokens only: `bg-surface`, `text-foreground`, `bg-primary`, …
- New tokens: add to `src/styles/themes.css` for **every** theme, include contrast pairing, get design review.

## Components
- Live in `components/ui` (no product logic) or `components/patterns`.
- Variants via `cva`; accept `className`; merge with `cn()`; no outer margins.

## Rules
- No dynamic class names. No `@apply` outside CMS/markdown content. No `!` without a comment explaining why.
- Arbitrary values are OK once; at 3 uses, create a token.
- Logical properties (`ms-*`, `pe-*`, `text-start`).

## Accessibility (definition of done)
Keyboard walkthrough · visible focus · AA contrast in all themes · not color-only · reduced motion, contrast, forced colors checked.

## Performance
CSS ≤ 25 kB gzip (CI-enforced). Fonts: WOFF2, subset. Images sized.

## Tooling
Prettier + tailwind plugin, IntelliSense, CI guards (`scripts/guards.sh`).
```

---

## 8. Where to go next

- **Frameworks in depth:** the React/Vue/Next/Nuxt books apply this toolchain at scale.
- **Component libraries:** study shadcn/ui and Catalyst source to see these patterns professionally executed.
- **Accessibility:** WCAG 2.2 quick reference, the APG patterns (ARIA Authoring Practices), and learning a screen reader.
- **CSS itself:** every Tailwind utility is plain CSS. The better you know CSS (Book 03), the better your Tailwind.
- **Stay current:** read the Tailwind blog and release notes every few months. Core keeps absorbing ecosystem features.

---

## 🧪 Practical Example — Review a pull request

Take the capstone (Lesson 07) and **review it as if a teammate submitted it**:

1. Run the v3-isms greps and the raw-color grep.
2. Do the keyboard walkthrough and the five-preferences pass.
3. Fill in the PR checklist honestly. Where does the capstone fail?
4. Fix three issues, then write a PR description summarizing what changed and why.

---

## 📝 Revision Questions

<details>
<summary>1. Why avoid raw palette colors like `bg-blue-500` in feature code?</summary>

They don't change with themes and spread brand decisions across the codebase. Use semantic tokens such as `bg-primary`.
</details>

<details>
<summary>2. What are four quick signs of Tailwind v3 code in a v4 project?</summary>

`@tailwind base;` directives, a JS `tailwind.config.js` for design tokens, `bg-opacity-*`/`flex-shrink-*`/`outline-none`, and `bg-gradient-to-*`.
</details>

<details>
<summary>3. Which checks should be automated, and which need human review?</summary>

Automate formatting, banned patterns, CSS budget, accessibility scans, cross-browser tests. Humans review semantics, design fit, component API and real keyboard/screen-reader experience.
</details>

<details>
<summary>4. When is an arbitrary value acceptable, and when should it become a token?</summary>

A one-off is fine; at about three uses or when it's part of the design, create a token.
</details>

<details>
<summary>5. What belongs in a team style guide?</summary>

Stack and browser support, token rules, component conventions, banned patterns, accessibility definition of done, performance budget and tooling.
</details>
