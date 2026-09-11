# Module 09 Interview Questions

### 1. What problem does the Observer pattern solve, and name one real API or library you've likely used that implements it.
**Answer:** It lets one object notify a list of interested listeners about an event without needing to know anything specific about who's listening or what they'll do with it. `addEventListener`/`removeEventListener` on DOM elements implements exactly this pattern natively; React and Redux's state-update/re-render mechanisms are a larger-scale application of the same idea.

### 2. Why is the classic class-based Singleton pattern less commonly needed in modern JavaScript?
**Answer:** ES modules are evaluated only once per application and then cached, so a module that exports a single object already behaves like a Singleton by default — every importer gets the same object reference — without needing special constructor logic to enforce a single instance.

### 3. What does a Proxy's get trap intercept, and what should you typically do inside it to preserve default behavior?
**Answer:** It intercepts property reads on the proxied object. To preserve correct default behavior (including edge cases like prototype chain lookups), you should call `Reflect.get(target, prop, receiver)` inside the trap rather than manually reimplementing the read yourself.

### 4. At a conceptual level, how does Vue 3 use Proxy for its reactivity system?
**Answer:** It wraps reactive data in a Proxy; the `get` trap tracks which parts of a component depend on a property as it's read, and the `set` trap, triggered on assignment, notifies only those dependent parts to re-render, without manual subscribe/notify calls in component code.

### 5. Why doesn't using const automatically mean a value should be named in CONSTANT_CASE?
**Answer:** `const` only prevents the binding from being reassigned; it says nothing about whether the value is a genuinely fixed, known-in-advance constant. `CONSTANT_CASE` is reserved for true constants, not every non-reassigned value.

### 6. What's the difference between dependencies and devDependencies in package.json, and why does it matter for production deployments?
**Answer:** `dependencies` are required for the application to actually run; `devDependencies` are only needed during development (testing, linting, build tools). Production deployments can skip installing `devDependencies`, keeping the shipped application's footprint smaller.

### 7. Explain the difference between what ^1.2.3 and ~1.2.3 allow in a package.json version range.
**Answer:** `^1.2.3` allows minor and patch updates within the same major version (up to but not including 2.0.0). `~1.2.3` allows only patch updates within the same minor version (up to but not including 1.3.0) — a narrower range.

### 8. Why should package-lock.json be committed to version control?
**Answer:** package.json specifies version ranges, not exact versions, so different installs could theoretically resolve to slightly different actual dependency versions. package-lock.json records the exact resolved versions of every dependency, guaranteeing identical installs across machines and over time.

### 9. Why can't a real-world application typically skip bundling and just rely on native browser ES module support?
**Answer:** At scale, this breaks down because of too many individual network requests for every file, npm packages often being written in formats browsers don't natively understand, the inability to run JSX/TypeScript directly in a browser, and the lack of built-in minification for production.

### 10. What is fundamentally different about how Vite serves files in development compared to a traditional bundler?
**Answer:** Vite serves source files as native ES modules directly to the browser, transforming each file on-demand only as requested, rather than bundling the whole application upfront — which is why its dev server can start almost instantly regardless of project size. It still uses a full bundler (Rollup) for production builds.

### 11. What's the difference between ESLint and Prettier, and why are they often used together?
**Answer:** ESLint focuses on code quality and correctness (catching bugs, enforcing patterns); Prettier focuses purely on formatting (indentation, line breaks, quote style). They're often used together with ESLint's formatting rules disabled (via `eslint-config-prettier`) so each tool owns a distinct, non-overlapping concern.

### 12. What distinguishes a unit test from an integration or end-to-end test?
**Answer:** A unit test verifies one small, isolated piece of code (typically a single function) with no real dependencies on other systems. Integration tests verify multiple pieces working together, and end-to-end tests verify a full real user flow through the entire running application.

### 13. Why would expect({ a: 1 }).toBe({ a: 1 }) fail in a test, and what should be used instead?
**Answer:** `toBe` checks strict reference equality, and the two objects are different references in memory even though their contents match, so the check fails. `toEqual` performs deep/structural equality instead, comparing actual values, and would pass here.

### 14. What is mocking, and why would you mock a function like fetch in a unit test?
**Answer:** Mocking replaces a real dependency with a fake, controlled stand-in for the duration of a test. You'd mock `fetch` so the test verifies only your own function's logic in isolation, without making real network requests, which would make the test slow, unreliable, and dependent on external systems being available.
