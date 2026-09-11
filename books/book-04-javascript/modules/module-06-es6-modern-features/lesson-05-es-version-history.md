# Lesson 5: ES Version History

## Learning Objectives
- Understand what ECMAScript is and how it relates to JavaScript
- Know the major features introduced in each significant ES version
- Understand TC39's yearly release process and "stages"
- Understand what transpilers (like Babel) and bundlers do and why they still matter
- Know how to check feature support across browsers/environments

## Introduction

Throughout this book you've used features like `const`, arrow functions, template literals, `async`/`await`, optional chaining, and classes — all of which came from specific, dated additions to the JavaScript language. This lesson connects the dots: which version introduced what, how new features get approved at all, and why your build tools (Vite, webpack, Babel, Metro for React Native) still matter even though modern browsers support most of this natively.

## 1. What is ECMAScript?

**ECMAScript (ES)** is the official language specification that JavaScript implements. "JavaScript" is the popular name; "ECMAScript" is the standard defined by TC39, a technical committee under Ecma International. Every engine — V8 (Chrome/Node), SpiderMonkey (Firefox), JavaScriptCore (Safari) — implements the ECMAScript spec, sometimes with vendor extensions.

## 2. Before ES6: ES5 (2009)

ES5 was the baseline for years and is still the compilation target for maximum compatibility. Notable ES5 additions: `Array.prototype.forEach/map/filter/reduce`, `JSON.parse`/`JSON.stringify`, strict mode, `Object.create`, `Object.defineProperty`.

## 3. ES6 / ES2015 — the big one

ES2015 was such a massive release that it's still often just called "ES6," and it's the foundation for almost everything you've learned in this book:

- `let` and `const` (Module 01)
- Arrow functions (Module 02)
- Template literals (Module 03)
- Destructuring, spread/rest (Module 03)
- Classes (this module, Lesson 2)
- Modules — `import`/`export` (this module, Lesson 1)
- Promises (Module 05)
- Default parameters
- `Map` and `Set` (Module 03)
- Generators and iterators (Module 03)

## 4. Yearly releases since ES2016

After ES6's massive scope, TC39 switched to smaller, **yearly** releases, each adding a handful of features:

- **ES2016 (ES7):** `Array.prototype.includes()`, exponentiation operator (`**`)
- **ES2017 (ES8):** `async`/`await` (Module 05), `Object.entries()`/`Object.values()`, string padding (`padStart`/`padEnd`)
- **ES2018 (ES9):** Rest/spread for objects (`{ ...obj }`), asynchronous iteration (`for await...of`), named capture groups in regex (this module, Lesson 4)
- **ES2019 (ES10):** `Array.prototype.flat()`/`flatMap()`, `Object.fromEntries()`, optional `catch` binding (`catch {}` without an error parameter)
- **ES2020 (ES11):** Optional chaining (`?.`), nullish coalescing (`??`), `Promise.allSettled()`, `BigInt`, dynamic `import()`, `globalThis`
- **ES2021 (ES12):** Logical assignment operators (`??=`, `&&=`, `||=`), `String.prototype.replaceAll()`, numeric separators (`1_000_000`)
- **ES2022 (ES13):** Class fields and private fields (`#field`, this module Lesson 2), top-level `await`, `Array.prototype.at()`, `Object.hasOwn()`
- **ES2023 (ES14):** `Array.prototype.toSorted()`/`toReversed()`/`with()` (non-mutating array methods), `Array.prototype.findLast()`/`findLastIndex()`
- **ES2024 (ES15):** `Object.groupBy()`/`Map.groupBy()`, `Promise.withResolvers()`, `ArrayBuffer` resizing
- **ES2025 (ES16):** Iterator helper methods (`.map()`/`.filter()` directly on iterators), `Set` composition methods (`.union()`, `.intersection()`, `.difference()`)
- **ES2026 (ES17):** The `Temporal` API reached Stage 4 and shipped as part of this release (as you saw in Module 03, Lesson 3) — a modern, immutable replacement for the old `Date` object

## 5. The TC39 process (how a feature becomes JavaScript)

Every new feature moves through five stages before it ships:

| Stage | Meaning |
|---|---|
| Stage 0 | Strawperson — just an idea |
| Stage 1 | Proposal — a champion is assigned, problem is defined |
| Stage 2 | Draft — syntax is worked out |
| Stage 3 | Candidate — spec is complete, browsers begin implementing and testing |
| Stage 4 | Finished — ready to be included in the next yearly ECMAScript release |

`Temporal`, mentioned above, spent years moving through these stages before reaching Stage 4 in 2026. This is also why some features you'll see discussed online (like the Pipeline Operator `|>` or Records & Tuples) are NOT yet usable in production — they're still stuck at Stage 1 or 2, sometimes for years.

## 6. Why transpilers and bundlers still matter

Even though modern evergreen browsers (recent Chrome, Firefox, Safari, Edge) support almost everything through ES2023+, you still can't just ship raw modern syntax in every real project, because:

- **Older or embedded browsers** (older Safari versions, in-app WebViews, some smart-TV browsers) lag behind the latest spec.
- **React Native** doesn't run in a browser at all — it runs on Hermes or JSC, JavaScript engines with their own support timelines, so newer syntax sometimes needs transpiling for RN too.
- Some syntax (JSX in React/Vue, TypeScript types) was never part of ECMAScript at all and always requires a build step.

**Babel** is the standard transpiler — it converts modern JS syntax down to an older, more widely-supported syntax (e.g., turning class fields into constructor assignments for an older target). **Bundlers** like Vite and webpack typically run Babel (or a faster equivalent like esbuild/SWC) as part of their build pipeline automatically, which is why you rarely configure this by hand in a modern React or Vue project — it's already wired in.

## 7. Checking feature support

Two go-to resources for "can I use this yet?":

- **caniuse.com** — browser-by-browser support tables for web platform features
- **MDN Web Docs** — every method/feature page includes a browser compatibility table at the bottom

A good habit: whenever you use a newer method (like `Array.prototype.toSorted()`, still relatively new as of this writing), a quick compatibility check saves you from a runtime surprise in production.

## Practical Example

A short timeline-style summary script — the kind of thing you might build to display "what's new" info in a docs app — showing how you'd model this version history as data using features from across these ES versions:

```javascript
const esVersions = [
  { year: 2015, name: 'ES6', highlights: ['let/const', 'classes', 'modules', 'promises'] },
  { year: 2017, name: 'ES8', highlights: ['async/await'] },
  { year: 2020, name: 'ES11', highlights: ['optional chaining', 'nullish coalescing'] },
  { year: 2022, name: 'ES13', highlights: ['private class fields', 'top-level await'] },
  { year: 2026, name: 'ES17', highlights: ['Temporal API'] },
];

// Using ES2019's flatMap alongside ES2015 template literals and destructuring
const allHighlights = esVersions.flatMap(({ year, highlights }) =>
  highlights.map(h => `${year}: ${h}`)
);

console.log(allHighlights);

// Using ES2022's Object.hasOwn and ES2020 optional chaining together
function findVersion(name) {
  return esVersions.find(v => v.name === name) ?? null;
}

const es11 = findVersion('ES11');
console.log(es11?.highlights.join(', ')); // 'optional chaining, nullish coalescing'
```

## Revision Questions

<details>
<summary>1. What is the relationship between "JavaScript" and "ECMAScript"?</summary>

ECMAScript is the official language specification maintained by TC39; JavaScript is the common name for engines/implementations of that specification (with occasional extra, non-standard extensions).
</details>

<details>
<summary>2. Why is ES2015 still commonly called "ES6" even though later versions switched to year-based names?</summary>

ES2015 was the sixth edition of the spec and was released before TC39 moved to the current yearly cadence; the "ES6" name stuck due to how significant and widely-discussed that release was.
</details>

<details>
<summary>3. What are the five TC39 proposal stages, in order?</summary>

Stage 0 (strawperson), Stage 1 (proposal), Stage 2 (draft), Stage 3 (candidate), Stage 4 (finished/ready for inclusion in a yearly release).
</details>

<details>
<summary>4. Why might a React Native app still need syntax transpiled even though its target JS engine is modern?</summary>

React Native runs on engines like Hermes or JSC rather than a standard browser, and JSX/TypeScript are not part of ECMAScript at all — both require a build step (Babel/Metro) regardless of how modern the runtime otherwise is.
</details>

<details>
<summary>5. Name two features introduced in ES2020.</summary>

Any two of: optional chaining (`?.`), nullish coalescing (`??`), `Promise.allSettled()`, `BigInt`, dynamic `import()`, `globalThis`.
</details>
