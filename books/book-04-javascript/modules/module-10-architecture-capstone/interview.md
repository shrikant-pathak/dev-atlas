# Module 10 Interview Questions

### 1. What core question does separation of concerns ask you to answer for every piece of code in an application?
**Answer:** Where does this piece of logic belong, and what is it allowed to know about? Each layer — UI, state, API, utilities — should only depend on what it strictly needs and stay unaware of other layers' internal details.

### 2. In a hand-built vanilla JS store, what pattern typically powers automatic re-rendering when state changes, and where else have you seen this pattern in this book?
**Answer:** The Observer pattern (Module 09) — a `subscribe` function registers listeners that get called automatically whenever `setState` runs. It's the same underlying idea behind `addEventListener` and behind how React and Vue trigger re-renders internally.

### 3. Why is a layered architecture (api/state/ui/utils) more maintainable at scale than one large file?
**Answer:** It gives every piece of logic one clear place to live and one clear responsibility, and it prevents tangled dependencies — code in one layer doesn't need to know the internal details of another layer, so changes in one area are far less likely to cause unexpected breakage elsewhere.

### 4. Concretely, what does React's or Vue's reactivity/rendering system do better than a hand-rolled store that rebuilds innerHTML on every change?
**Answer:** It updates only the specific parts of the DOM that actually changed (via a virtual DOM diff in React, or fine-grained reactive tracking in Vue), rather than regenerating the entire rendered output from scratch on every state change, which is significantly more efficient at scale.

### 5. Why should localStorage reads and writes be wrapped in try/catch in a real application?
**Answer:** `localStorage` operations can throw under real conditions — for example, in certain private/incognito browsing modes, or when storage quota is exceeded — so wrapping them defensively prevents a storage failure from crashing the whole application.

### 6. In the capstone project, why does the app skip fetching suggested tasks if the user already has saved tasks in localStorage?
**Answer:** It's an intentional design decision — the API call is meant only to give new users a helpful starting point on first use, not something that should run (and risk failing) on every load once real user data already exists locally.

### 7. What does event delegation buy you when rendering a dynamic, frequently-changing list of items?
**Answer:** A single event listener on the parent container handles clicks for every item — including ones added after the listener was set up — without needing to attach and remove individual listeners every time the list re-renders.

### 8. Why is type="module" required on the script tag for a project structured the way this module recommends?
**Answer:** The project structure relies on ES module `import`/`export` syntax across many separate files. `type="module"` tells the browser to treat the script (and everything it imports) as an ES module, enabling that syntax to work natively without a bundler.

### 9. What's the value in building an application manually with vanilla JS before or alongside learning a framework, if you already know React and Vue?
**Answer:** It demystifies what the framework is actually doing internally — state management, re-rendering, and component boundaries turn out to be refined, optimized versions of the same organizational patterns you can build by hand, which makes framework behavior and design decisions far easier to reason about rather than treating the framework as a black box.

### 10. Where does a custom error class (like TaskLoadError) provide value over just throwing a generic Error?
**Answer:** It gives errors a distinct, identifiable type (checkable via `error.name` or `instanceof`), letting calling code handle specific failure cases differently if needed, and makes error logs and debugging clearer by naming exactly what kind of failure occurred rather than a generic, undifferentiated error.
