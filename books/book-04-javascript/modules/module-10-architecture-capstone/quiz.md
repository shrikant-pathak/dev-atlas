# Module 10 Quiz

1. What question does separation of concerns ask you to answer for every piece of code?
2. In the layered architecture from Lesson 1, which layer is allowed to know about "everything"?
3. What pattern from Module 09 powers the hand-built store's automatic re-rendering?
4. What does the store's subscribe function return, and what is it used for?
5. Why is localStorage access wrapped in try/catch in the capstone project?
6. In the capstone project, under what condition does the app skip fetching suggested tasks?
7. What DOM technique lets a single event listener handle clicks on a dynamically changing list of items?
8. What HTML attribute on the script tag enables import/export syntax to work directly in the browser?
9. What does React's virtual DOM (or Vue's reactivity system) do more efficiently than the hand-rolled innerHTML re-render in this module?
10. What class of module content (Modules 01–09) is intentionally absent from this final module?
11. Why does the capstone wrap the fetchSuggestedTasks() failure in a custom TaskLoadError rather than letting the raw fetch error propagate?
12. What's the main point of comparing the hand-built vanilla project to a React/Vue rebuild, as suggested in the stretch goals?
13. Which layer in the architecture should never import from the UI layer?
14. What does the capstone project's filter feature (all/active/completed) rely on to compute the currently visible tasks?
15. Completing this module finishes which entire book?

---

## Answer Key

1. Where does this piece of logic belong, and what is it allowed to know about?
2. main.js — the entry point, which wires everything together.
3. The Observer pattern.
4. It returns an unsubscribe function, used to remove that specific listener from the store later if needed.
5. Because localStorage operations can throw in real conditions (e.g., private browsing modes, storage quota exceeded), and the try/catch prevents that from crashing the whole app.
6. When localStorage already contains saved tasks from a previous session.
7. Event delegation — attaching one listener to a parent container and checking event.target inside the handler.
8. type="module"
9. It updates only the specific parts of the DOM that actually changed, instead of regenerating the entire rendered output every time.
10. New syntax or APIs — this module focuses on architecture and integration of prior concepts, not new language features.
11. To give the error a distinct, identifiable type and a clearer, more specific message, making it easier to handle and debug than a raw, generic fetch error.
12. To make concrete exactly what a framework automates on your behalf (state management, re-rendering, component structure) compared to doing it by hand.
13. The api/, state/, storage/, and utils/ layers — none of them should import from or depend on the ui/ layer.
14. Deriving a filtered list based on store.getState().filter and store.getState().tasks (via .filter() on the tasks array) — the filter itself is stored as state, not computed once and cached.
15. Book 04 — JavaScript.
