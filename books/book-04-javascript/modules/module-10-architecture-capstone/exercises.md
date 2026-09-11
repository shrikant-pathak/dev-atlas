# Module 10 Exercises

## Lesson 1: Organizing Large Vanilla JS Apps

**1. Refactor a tangled file**
Given a single 100-line file mixing DOM manipulation, a fetch call, and state variables all together, split it into `api/`, `state/`, and `ui/` files following this lesson's structure.

**2. Extend the store**
Add a `resetState()` method to the `createStore` function from the lesson that resets state back to its original `initialState`, and notifies all listeners.

**3. Multiple independent subscribers**
Using the store from the lesson, register two completely separate subscribers — one that logs every state change to the console, one that updates a "last updated" timestamp in the DOM — and confirm both fire independently on a single `setState` call.

**4. Identify the boundary**
Given a small snippet where a UI file directly calls `fetch()` inside a click handler, explain in a comment why this violates separation of concerns, then refactor it to go through a proper API layer file instead.

## Lesson 2: Capstone Project

**5. Build the full project**
Build the complete task tracker from the lesson, file by file, and confirm it runs correctly in a browser: adding, completing, deleting, filtering, and persisting tasks across a page refresh.

**6. Add a stretch feature**
Implement one of the lesson's suggested stretch goals — a "clear completed" button, or double-click-to-edit task text — following the same layered architecture (state change → automatic re-render).

**7. Add a unit test**
Using what you learned in Module 09 Lesson 7, write a unit test for `getFilteredTasks()` covering all three filter states (`all`, `active`, `completed`).

**8. Add a custom error scenario**
Modify `fetchSuggestedTasks()` to simulate a failure (e.g., point it at an invalid URL), and confirm the app still renders correctly with an empty task list and a visible error message, rather than crashing.

**9. Reflection: framework comparison**
Rebuild just the state and rendering portion of the task tracker (task list + toggling completion) in React or Vue. In 4–6 sentences, describe specifically what the framework handled for you that you had to write by hand in the vanilla version.

**10. Full review pass**
Run ESLint (Module 09, Lesson 6) against your finished capstone project, fix everything it flags, and write a short summary of what kinds of issues it caught.
