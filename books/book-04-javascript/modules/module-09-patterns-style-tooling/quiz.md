# Module 09 Quiz

1. What JavaScript feature does the Module pattern rely on to keep variables private?
2. What pattern is directly analogous to addEventListener/removeEventListener?
3. Why is the classic Singleton pattern less necessary in modern JavaScript?
4. What does a Proxy's `get` trap intercept?
5. What should you call inside a Proxy trap to correctly fall back to default behavior?
6. What real-world framework feature is built on Proxy, as covered in this module?
7. What casing convention is used for classes and components?
8. Does using `const` automatically mean a name should be CONSTANT_CASE?
9. What's the difference between `dependencies` and `devDependencies`?
10. In semver, what does the MAJOR number changing indicate?
11. What's the difference between `^1.2.3` and `~1.2.3`?
12. Why should `package-lock.json` be committed to version control?
13. Name one concrete reason browsers can't just run a real app's ES modules natively without bundling.
14. What bundler does Vite use for its production builds?
15. What does tree shaking remove from a final bundle?
16. What's the difference in purpose between ESLint and Prettier?
17. What does "extending" an ESLint preset like eslint-config-airbnb do?
18. What's the difference between a unit test and an integration test?
19. Between `toBe` and `toEqual`, which should you use to compare two structurally-identical-but-different-reference objects?
20. What is mocking, and why is it useful in unit tests?

---

## Answer Key

1. Closures (via an IIFE that returns an object exposing only selected methods/values).
2. The Observer pattern.
3. Because ES modules are evaluated once and cached, so a module exporting a single object already behaves like a Singleton without extra class logic.
4. Property reads on the proxied object.
5. The matching `Reflect` method (e.g., `Reflect.get`, `Reflect.set`).
6. Vue 3's reactivity system.
7. PascalCase.
8. No — `const` only prevents reassignment of the binding; CONSTANT_CASE is reserved for true, fixed constants.
9. `dependencies` are needed to run the app in production; `devDependencies` are only needed during development.
10. Breaking changes — code that worked before might not work with the new version.
11. `^1.2.3` allows minor and patch updates; `~1.2.3` allows only patch updates.
12. It locks the exact resolved version of every dependency, ensuring identical installs across machines and time, since package.json only specifies ranges.
13. Any of: too many network requests for individual files, npm packages using formats browsers don't understand, inability to run JSX/TypeScript directly, no built-in minification.
14. Rollup.
15. Code that's imported/exported but never actually used (dead code).
16. ESLint focuses on code quality/correctness; Prettier focuses purely on formatting.
17. It applies a large, pre-written, curated set of rule configurations instead of requiring every rule to be configured manually.
18. A unit test verifies one small, isolated piece of code alone; an integration test verifies multiple pieces working together.
19. `toEqual` (deep/structural equality), not `toBe` (strict reference equality).
20. Mocking replaces a real dependency with a fake, controlled stand-in, so a test can verify a function's logic in isolation without real-world side effects like network calls.
