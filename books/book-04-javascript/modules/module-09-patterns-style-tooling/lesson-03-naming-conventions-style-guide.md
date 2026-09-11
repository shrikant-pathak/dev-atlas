# Lesson 3: Naming Conventions & Style Guide

## Learning Objectives
- Understand why consistent naming and style conventions matter in team codebases
- Apply standard JavaScript naming conventions (camelCase, PascalCase, CONSTANT_CASE)
- Recognize common style guide rules (Airbnb, Standard) and what problems they solve
- Understand the difference between a style guide and a linter (setting up Lesson 6)

## Introduction

Code is read far more often than it's written. A naming and style convention isn't about personal preference or aesthetics for their own sake — it's about reducing the mental overhead of reading code you didn't write, including code *you* wrote six months ago. This lesson is less about new syntax and more about the unwritten (and often written-down) rules professional JavaScript teams agree on, so that a codebase reads consistently no matter who touched which file.

## Casing Conventions

JavaScript code generally follows a few consistent casing rules:

| Convention | Used for | Example |
|---|---|---|
| `camelCase` | variables, function names | `userName`, `calculateTotal` |
| `PascalCase` | classes, components, constructors | `class UserAccount`, `UserProfile` (React/Vue component) |
| `CONSTANT_CASE` | true constants that never change | `MAX_RETRIES`, `API_BASE_URL` |
| `kebab-case` | file names (in many projects), CSS classes | `user-profile.js`, `.nav-bar` |

```js
// camelCase — variables and functions
const userName = 'Ada';
function calculateTotal(items) { /* ... */ }

// PascalCase — classes and components
class ShoppingCart { /* ... */ }
function UserProfile() { /* React component */ }

// CONSTANT_CASE — values that never change, known at write-time
const MAX_RETRIES = 3;
const API_BASE_URL = 'https://api.example.com';
```

A subtlety worth internalizing: `const` alone does **not** mean something should be `CONSTANT_CASE`. `const` just means the *binding* can't be reassigned (Module 02) — it says nothing about whether the value represents a true, fixed constant.

```js
// const, but NOT a "constant" in the naming sense — it's just a normal value that happens not to be reassigned in this scope
const total = calculateTotal(cart);

// const AND a true constant — a fixed, known value
const MAX_RETRIES = 3;
```

## Naming Things Well

Beyond casing, the *content* of a name matters. A few widely-agreed principles:

**Booleans should read like yes/no questions.**
```js
// Unclear
const status = true;

// Clear
const isActive = true;
const hasPermission = false;
const canEdit = true;
```

**Functions should be named as verbs describing what they do.**
```js
// Unclear — noun, not obviously an action
function userValidation(user) { /* ... */ }

// Clear — verb, describes the action
function validateUser(user) { /* ... */ }
```

**Avoid meaningless or overly abbreviated names**, especially in anything beyond a very short loop scope:
```js
// Avoid
const d = new Date();
const arr = getUsers();

// Prefer
const currentDate = new Date();
const users = getUsers();

// Short names are fine for genuinely tiny, obvious scopes
for (let i = 0; i < items.length; i++) { /* i is a well-understood convention here */ }
```

**Avoid names that lie about type or contents.**
```js
// Misleading — sounds like a single user, but holds an array
const user = getAllUsers();

// Accurate
const users = getAllUsers();
```

## Popular Style Guides

You don't need to invent these conventions yourself — most teams adopt an existing, published style guide and enforce it automatically (Lesson 6 covers the *automatic enforcement* part with ESLint). Two you'll encounter constantly:

**Airbnb JavaScript Style Guide** is one of the most widely adopted in the industry. It's opinionated and fairly strict, covering everything from variable declarations (prefer `const`/`let`, never `var`) to quote style (single quotes), semicolons (always required), and much more.

**StandardJS** takes a different philosophy: zero configuration, and notably, **no semicolons** — relying on JavaScript's automatic semicolon insertion (ASI) instead. It trades a small amount of unfamiliarity for the argument that a single obvious set of rules, with no configuration decisions to make, keeps a whole ecosystem of projects visually consistent.

```js
// Airbnb style
const greet = (name) => {
  return `Hello, ${name}!`;
};

// Standard style — no semicolons
const greet = (name) => {
  return `Hello, ${name}!`
}
```

Neither is objectively "correct" — what matters far more than *which* guide you pick is that a team picks **one** and applies it consistently, so that pull requests aren't full of unrelated style-only diffs and nobody has to relearn a new dialect switching between files.

## Consistency Over Personal Preference

A theme worth stating directly: style guides exist to eliminate a category of debate ("should this have a semicolon?") so teams can spend their attention on things that actually matter (does this code work correctly?). Joining an existing codebase means adopting *its* conventions, even where you personally would have chosen differently — the value of the convention comes specifically from everyone following the *same* one, not from any individual rule being objectively best.

## Practical Example

A short "before and after" applying the conventions from this lesson to a real snippet:

```js
// Before — inconsistent casing, unclear names, no clear boolean semantics
function calc(itms, disc) {
  var t = 0;
  for (var i = 0; i < itms.length; i++) {
    t += itms[i].price;
  }
  if (disc == true) {
    t = t * 0.9;
  }
  return t;
}

// After — consistent conventions applied
const DISCOUNT_RATE = 0.9;

function calculateTotal(items, hasDiscount) {
  let total = 0;

  for (const item of items) {
    total += item.price;
  }

  if (hasDiscount) {
    total *= DISCOUNT_RATE;
  }

  return total;
}
```

Nothing about the *logic* changed — this is purely style and naming — but the second version is immediately more readable to anyone opening the file for the first time, which is the entire point of a style guide.

## Revision Questions

<details>
<summary>1. Why doesn't using const automatically mean a variable should be written in CONSTANT_CASE?</summary>

`const` only guarantees the binding itself can't be reassigned — it says nothing about whether the value represents a genuinely fixed, known-in-advance constant. `CONSTANT_CASE` is reserved specifically for true constants (like `MAX_RETRIES`), not every `const` declaration, most of which are just ordinary values that happen not to be reassigned.
</details>

<details>
<summary>2. What convention should a boolean variable's name generally follow, and why?</summary>

It should read like a yes/no question — prefixed with something like `is`, `has`, or `can` (e.g., `isActive`, `hasPermission`). This makes its meaning and possible values (`true`/`false`) immediately obvious from the name alone, without needing to check its type.
</details>

<details>
<summary>3. What's the core philosophical difference between the Airbnb style guide and StandardJS?</summary>

Airbnb is opinionated and configurable, covering a wide range of stylistic rules including semicolons and quote style. StandardJS aims for zero configuration and notably omits semicolons entirely, relying on automatic semicolon insertion, trading some unfamiliarity for having no configuration decisions left to make.
</details>

<details>
<summary>4. Why does it matter more that a team picks one style guide than which specific one they pick?</summary>

The value of a style guide comes from consistency — eliminating unrelated style debates and diffs so teams can focus attention on whether code actually works correctly. Any reasonably sound style guide achieves that benefit as long as everyone on the team follows the same one.
</details>
