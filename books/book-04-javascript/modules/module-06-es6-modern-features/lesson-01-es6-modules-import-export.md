# Lesson 1: ES6 Modules (import/export)

## Learning Objectives
- Understand why JavaScript needed a native module system
- Use named exports and imports
- Use default exports and imports
- Understand the difference between `export`/`export default` and how to mix them
- Understand module scope, static analysis, and live bindings
- Know the difference between ES Modules and CommonJS (`require`/`module.exports`)
- Understand how `<script type="module">` behaves differently in the browser

## Introduction

Back in Module 01 you learned that every `<script>` tag on a page shares the same global scope — a variable declared in one file is visible to every other script after it. That's convenient for a 20-line page and a nightmare for a real application. As codebases grew, developers built their own module systems (CommonJS in Node, AMD in the browser, IIFEs as a stopgap — you saw IIFEs in Module 02) just to get files that could keep their own private variables and explicitly share only what they intended to.

ES6 (2015) finally gave JavaScript a *native* module system: `import` and `export`. This is the system that powers every `import React from 'react'` and every `import { useState } from 'react'` you've already been typing. In this lesson we go under the hood of that syntax.

## 1. Turning a file into a module

Any file that uses `import` or `export` is automatically treated as a module, not a regular script. Modules differ from regular scripts in a few important ways:

- Every module has its **own scope** — top-level variables are NOT added to the global object, unlike classic scripts.
- Modules are **automatically in strict mode** (recall strict mode from Module 01 — no more accidental globals).
- Modules are only **executed once**, no matter how many times they're imported elsewhere; the result is cached and shared.
- `this` at the top level of a module is `undefined`, not the global object.

In the browser, you opt a script into being a module explicitly:

```html
<script type="module" src="app.js"></script>
```

In a Node/bundler project (React, Vue, React Native), the whole toolchain assumes ES Modules by default once your `package.json` has `"type": "module"`, or when using a bundler like Vite/webpack, which is the setup behind every React and Vue project you've built.

## 2. Named exports

A **named export** lets a module export multiple, individually-named values.

```javascript
// mathUtils.js
export const PI = 3.14159;

export function square(n) {
  return n * n;
}

export function circleArea(radius) {
  return PI * square(radius);
}
```

You can also declare everything first and export a batch at the bottom — many teams (and most React component libraries) prefer this style because all the public exports are visible in one place:

```javascript
// mathUtils.js
const PI = 3.14159;

function square(n) {
  return n * n;
}

function circleArea(radius) {
  return PI * square(radius);
}

export { PI, square, circleArea };
```

Importing named exports uses curly braces, and the names must match:

```javascript
// app.js
import { PI, circleArea } from './mathUtils.js';

console.log(circleArea(4));
```

You can rename an import to avoid a naming collision using `as`:

```javascript
import { circleArea as getCircleArea } from './mathUtils.js';
```

This is exactly the same syntax you've already used with libraries — `import { useState, useEffect } from 'react'` is importing two named exports from React's module.

## 3. Default exports

A module can also have **one** default export — the "main thing" the file provides. This is the pattern behind every React component file you've written: `export default function App() { ... }`.

```javascript
// UserCard.js
export default function UserCard({ name }) {
  return `<div class="user-card">${name}</div>`;
}
```

Default imports don't use curly braces, and the imported name can be **anything you want** — it doesn't have to match anything in the source file:

```javascript
// app.js
import UserCard from './UserCard.js';
import Card from './UserCard.js'; // also valid — same thing, different local name
```

A file can mix one default export with any number of named exports:

```javascript
// UserCard.js
export const CARD_MAX_WIDTH = 320;

export default function UserCard({ name }) {
  return `<div style="max-width:${CARD_MAX_WIDTH}px">${name}</div>`;
}
```

```javascript
// app.js
import UserCard, { CARD_MAX_WIDTH } from './UserCard.js';
```

## 4. Import everything as a namespace

Sometimes you want every export from a module bundled into a single object:

```javascript
import * as MathUtils from './mathUtils.js';

console.log(MathUtils.PI);
console.log(MathUtils.circleArea(2));
```

This is common with utility modules and with libraries like `import * as d3 from 'd3'`.

## 5. Re-exporting (barrel files)

A module can import from one file and immediately export it from another — useful for creating a single "barrel" entry point for a folder of components, which you've likely seen in React/Vue project structures as `index.js`:

```javascript
// components/index.js
export { default as Button } from './Button.js';
export { default as Card } from './Card.js';
export * from './helpers.js';
```

```javascript
// app.js
import { Button, Card } from './components/index.js';
```

## 6. Live bindings, not copies

This is a subtle but important difference from how, say, a returned object works (Module 02). An imported binding is **live** — if the exporting module later updates the value, every importer sees the new value:

```javascript
// counter.js
export let count = 0;
export function increment() {
  count++;
}
```

```javascript
// app.js
import { count, increment } from './counter.js';

console.log(count); // 0
increment();
console.log(count); // 1 — the import reflects the module's internal change
```

You cannot, however, reassign an imported binding yourself from the importing file — `count = 5` in `app.js` would throw an error. Imports are read-only views into the exporting module.

## 7. Static analysis and tree-shaking

Because `import`/`export` statements must appear at the top level of a file with literal names (you can't do `import { Math.random() ? 'a' : 'b' }`), tools can analyze your module graph *without running any code*. This is what enables:

- **Tree-shaking** — a bundler (webpack, Vite, Metro for React Native) can detect that you only imported `circleArea` and not `square`, and exclude `square` from your final bundle if it's unused.
- Editor autocomplete for what a module exports.
- Faster build tooling in general.

This static structure is also why dynamic imports need separate syntax (see below) — they intentionally opt out of static analysis.

## 8. Dynamic imports

Sometimes you don't want to load a module until it's actually needed — for example, loading a heavy chart library only when the user opens a "Reports" tab. The `import()` function (note: called like a function, not the `import` statement) returns a Promise, tying directly back to Module 05:

```javascript
button.addEventListener('click', async () => {
  const { renderChart } = await import('./chartModule.js');
  renderChart(data);
});
```

This is the mechanism behind `React.lazy()` and Vue's `defineAsyncComponent()` for code-splitting — both are built on top of dynamic `import()`.

## 9. ES Modules vs. CommonJS

Before ES Modules existed, Node.js used **CommonJS**:

```javascript
// CommonJS (older Node style)
const { circleArea } = require('./mathUtils.js');

module.exports = { circleArea };
```

Key differences:

| | ES Modules | CommonJS |
|---|---|---|
| Import keyword | `import` | `require()` |
| Export keyword | `export` | `module.exports` |
| Loading | Static, analyzed before execution | Dynamic, runs at call time |
| Top-level `await` | Supported | Not supported |
| Browser support | Native (`type="module"`) | Not supported natively |

Modern Node.js, and every tool in the React/Vue/React Native ecosystem, supports ES Modules, but you'll still see `require()` in older codebases and some Node tooling scripts — recognizing both styles is a practical necessity.

## Practical Example

A small "shopping cart" set of modules showing named exports, a default export, and a dynamic import for an optional discount feature:

```javascript
// cartUtils.js
export const TAX_RATE = 0.08;

export function subtotal(items) {
  return items.reduce((sum, item) => sum + item.price * item.qty, 0);
}

export function total(items) {
  return subtotal(items) * (1 + TAX_RATE);
}

export default class Cart {
  constructor() {
    this.items = [];
  }
  add(item) {
    this.items.push(item);
  }
}
```

```javascript
// app.js
import Cart, { total, TAX_RATE } from './cartUtils.js';

const cart = new Cart();
cart.add({ name: 'Keyboard', price: 60, qty: 1 });
cart.add({ name: 'Mouse', price: 25, qty: 2 });

console.log(`Tax rate: ${TAX_RATE * 100}%`);
console.log(`Total: $${total(cart.items).toFixed(2)}`);

// Only load the discount module if the user has a promo code
async function applyPromo(code) {
  if (!code) return;
  const { getDiscount } = await import('./discounts.js');
  console.log('Discount:', getDiscount(code));
}
```

## Revision Questions

<details>
<summary>1. What is the key difference between a named export and a default export?</summary>

A module can have any number of named exports, each imported with a matching name inside curly braces (or renamed with `as`). A module can have only **one** default export, imported without curly braces under any name the importer chooses.
</details>

<details>
<summary>2. Why are top-level variables in a module not added to the global object?</summary>

Each module has its own module-level scope, separate from the global scope. This is one of the core reasons ES Modules replaced plain scripts — it prevents naming collisions across files.
</details>

<details>
<summary>3. What does it mean that an imported binding is "live"?</summary>

The imported value is a read-only view into the exporting module's actual variable. If the exporting module changes that variable internally, every file that imported it sees the updated value automatically — it isn't a one-time copy.
</details>

<details>
<summary>4. Why does `import()` (as a function call) exist alongside the `import` statement?</summary>

The `import` statement is static — it must be evaluated at build time so tools can analyze the module graph and tree-shake unused code. `import()` is a function that returns a Promise and can be called conditionally or lazily at runtime, enabling code-splitting (like `React.lazy()`).
</details>

<details>
<summary>5. Name two differences between ES Modules and CommonJS.</summary>

Any two of: ES Modules use `import`/`export`, CommonJS uses `require()`/`module.exports`; ES Modules are statically analyzed while CommonJS resolves at runtime; ES Modules support native browser loading via `type="module"`, CommonJS does not; ES Modules support top-level `await`, CommonJS does not.
</details>
