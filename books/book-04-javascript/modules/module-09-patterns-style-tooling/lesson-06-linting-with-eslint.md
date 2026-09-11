# Lesson 6: Linting with ESLint

## Learning Objectives
- Understand what a linter is and how it differs from a style guide (Lesson 3) or a code formatter
- Set up and configure ESLint in a project
- Understand rules, severity levels, and how presets/extends work
- Understand the relationship between ESLint and Prettier

## Introduction

Lesson 3 covered *style guides* — human-agreed-upon conventions like "use camelCase" or "prefer const." Those conventions are only useful if they're actually followed, consistently, by every contributor, on every commit — which is unrealistic to enforce by manual code review alone. **ESLint** is the tool that automates that enforcement: it statically analyzes your JavaScript code, without running it, and flags violations of rules you configure, ranging from stylistic preferences to genuine bugs.

This is the natural next step after Lesson 3: a style guide tells you *what* the rules are; ESLint makes sure nobody — including you, six months from now, tired and rushing — accidentally breaks them.

## What ESLint Actually Catches

ESLint rules generally fall into two categories:

**Code-quality rules** that catch actual bugs or risky patterns, independent of any style preference:

```js
// no-unused-vars: flags a variable that's declared but never used
function greet(name) {
  const greeting = 'Hello'; // never used — ESLint flags this
  return name;
}

// no-undef: flags a reference to a variable that was never declared
console.log(totalPrice); // ESLint flags this if totalPrice is never defined

// eqeqeq: flags loose equality (==) in favor of strict equality (===)
if (value == null) { /* ... */ } // ESLint suggests === instead
```

**Stylistic rules** that enforce the conventions from Lesson 3 automatically:

```js
// quotes: enforce single or double quotes consistently
const name = "Ada"; // flagged if the rule requires single quotes

// semi: enforce (or forbid) semicolons
const x = 5 // flagged if the rule requires semicolons
```

## Configuration

ESLint is configured via a config file — in newer ESLint versions, `eslint.config.js` (the "flat config" format); in many existing projects, you'll still see the older `.eslintrc.json`. Both express the same underlying ideas.

```js
// eslint.config.js (flat config, modern ESLint)
import js from '@eslint/js';

export default [
  js.configs.recommended, // start from a sensible built-in preset
  {
    rules: {
      'no-unused-vars': 'warn',   // warn, don't error
      'no-console': 'off',        // allow console.log
      'eqeqeq': 'error',          // require === instead of ==
      'quotes': ['error', 'single'], // require single quotes
    }
  }
];
```

Each rule has a **severity level**:

| Severity | Meaning |
|---|---|
| `'off'` (or `0`) | rule is disabled |
| `'warn'` (or `1`) | reported, but doesn't fail a build/CI check |
| `'error'` (or `2`) | reported and typically fails a build/CI check |

## Presets: `extends`

Rather than configuring every single rule from scratch, most projects **extend** a preset — a curated, published set of rule configurations, often based on a style guide like the ones from Lesson 3:

```js
// Using Airbnb's published ESLint config as a starting point
import airbnb from 'eslint-config-airbnb';

export default [
  airbnb,
  {
    rules: {
      // override or add project-specific tweaks on top of the preset
      'no-console': 'warn',
    }
  }
];
```

This is the direct, practical link back to Lesson 3: adopting "the Airbnb style guide" in a real project usually *means*, concretely, installing `eslint-config-airbnb` and extending it — the style guide's rules become enforceable, automated ESLint rules rather than something contributors have to remember and self-police.

## Running ESLint

```bash
npx eslint src/               # lint every file under src/
npx eslint src/ --fix         # automatically fix anything ESLint can safely fix
```

Most projects wire this into an npm script (from Lesson 4):

```json
{
  "scripts": {
    "lint": "eslint src/",
    "lint:fix": "eslint src/ --fix"
  }
}
```

And commonly into editor integrations, showing warnings/errors inline as you type, and into CI pipelines, blocking a pull request from merging if linting fails.

## ESLint vs. Prettier

A common point of confusion: **ESLint** and **Prettier** solve different, complementary problems. ESLint focuses on code *quality* and *correctness* (catching bugs, enforcing patterns) — Prettier focuses purely on code *formatting* (indentation, line length, where to break long lines), reformatting your code automatically rather than just flagging violations.

Many real projects run both together: Prettier handles all formatting concerns automatically (so nobody argues about tab width), and ESLint is configured to focus on code-quality rules rather than duplicating formatting rules that Prettier already owns — commonly using `eslint-config-prettier` specifically to *disable* any ESLint formatting rules that would conflict with Prettier's own decisions.

## Practical Example

A realistic ESLint setup for a React project, tying this lesson to your own stated stack:

```js
// eslint.config.js
import js from '@eslint/js';
import reactPlugin from 'eslint-plugin-react';
import reactHooksPlugin from 'eslint-plugin-react-hooks';

export default [
  js.configs.recommended,
  {
    plugins: {
      react: reactPlugin,
      'react-hooks': reactHooksPlugin,
    },
    rules: {
      'react-hooks/rules-of-hooks': 'error',       // catches invalid Hook usage
      'react-hooks/exhaustive-deps': 'warn',       // catches missing useEffect dependencies
      'no-unused-vars': 'warn',
      'eqeqeq': 'error',
    }
  }
];
```

`react-hooks/rules-of-hooks` is a good concrete illustration of ESLint catching genuine bugs, not just style: it statically detects things like calling a Hook conditionally or inside a loop, which breaks React's internal Hook-tracking and causes real runtime bugs that could otherwise slip through code review unnoticed.

## Revision Questions

<details>
<summary>1. What's the fundamental difference between a style guide (Lesson 3) and ESLint?</summary>

A style guide is a human-agreed-upon set of conventions — documentation describing what the rules are. ESLint is a tool that automatically enforces those (and other) rules by statically analyzing code and flagging violations, removing the need to rely on manual review and memory to catch deviations.
</details>

<details>
<summary>2. What do the three ESLint severity levels (off, warn, error) each mean in practice?</summary>

`off` disables a rule entirely; `warn` reports a violation without failing a build or CI check; `error` reports a violation and typically fails a build or CI check, blocking merges until it's fixed.
</details>

<details>
<summary>3. What does "extending" a preset like eslint-config-airbnb actually do, and how does it connect to Lesson 3?</summary>

It applies a large, curated, pre-written set of rule configurations — based on that style guide's conventions — instead of requiring you to configure every individual rule yourself from scratch. It's the direct mechanism that turns a style guide's written conventions from Lesson 3 into automated, enforceable rules.
</details>

<details>
<summary>4. What problem does ESLint solve that Prettier does not, and vice versa?</summary>

ESLint focuses on code quality and correctness — catching real bugs and risky patterns (like calling a Hook conditionally). Prettier focuses purely on formatting — indentation, line breaks, quote style — reformatting code automatically rather than analyzing it for correctness. They're commonly used together, each covering the concern the other doesn't.
</details>
