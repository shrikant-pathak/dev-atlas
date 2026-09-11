# Lesson 1: Organizing Large Vanilla JS Apps

## Learning Objectives
- Understand why organization becomes critical as an application grows beyond a few files
- Apply separation of concerns to structure code into logical layers
- Use the Module pattern (Module 09) and ES modules (Module 06) together to build a scalable file structure
- Understand basic state management and a simple component-like structure in plain JavaScript
- Recognize what frameworks like React and Vue are actually automating for you

## Introduction

Every module in this book has taught you a piece — variables and functions (Module 01–02), the DOM (Module 04), async data (Module 05), modern syntax (Module 06), error handling and storage (Module 07), binary/legacy tech (Module 08), and patterns/tooling (Module 09). This lesson is where those pieces come together: how do you actually structure a real, multi-feature application using nothing but vanilla JavaScript, before reaching for a framework?

This matters even though you already work in React and Vue (per your own stack) for a specific reason: frameworks solve organizational problems that exist in *plain* JavaScript first. Understanding how to solve them manually — how you'd build a small app's structure, state, and rendering without any framework — makes you a sharper user of the frameworks that automate it, because you'll understand *why* they're built the way they are, not just how to use their APIs.

## The Problem: Why Structure Matters

A single `<script>` tag with a few hundred lines works fine for a small page. It stops working the moment an application has multiple features, shared state between them, and more than one person touching the code. Left unstructured, you get:

- **Global namespace pollution** — every variable and function competing for the same global scope, risking silent overwrites
- **Tangled dependencies** — code in one part of the app reaching directly into another part's internals, so changing anything risks breaking something unrelated and non-obvious
- **No clear ownership** — nobody can look at the file structure and immediately tell where a given piece of functionality lives

Organizing an app is really about answering one question consistently: **where does this piece of logic belong, and what is it allowed to know about?**

## Separation of Concerns

The foundational idea is splitting code into layers with distinct responsibilities, each depending on the layer below it but not the reverse:

UI Layer → renders things, listens for user input
State Layer → holds the application's data, notifies about changes
API/Data Layer → talks to external sources (fetch calls, localStorage)
Utility Layer → pure helper functions with no dependencies on the above


A concrete file structure applying this, using ES modules from Module 06:

src/
api/
users.js // fetch calls related to users
state/
store.js // application state + Observer-style notifications
ui/
userList.js // renders the user list to the DOM
userForm.js // handles the "add user" form
utils/
formatDate.js // pure helper functions
main.js // wires everything together, the entry point


Each file has one clear job, and — crucially — each file only imports what it actually needs, using the `import`/`export` syntax from Module 06.

## A Simple State Layer (Observer Pattern, Module 09)

Directly building on the Observer pattern from Module 09, here's a minimal but real state store: the exact core idea behind how React's `useState` and Vue's reactive `ref`/`reactive` work internally, just without the abstraction layer they provide on top.

```js
// state/store.js
function createStore(initialState) {
  let state = initialState;
  const listeners = [];

  function getState() {
    return state;
  }

  function setState(partialState) {
    state = { ...state, ...partialState };
    listeners.forEach(listener => listener(state));
  }

  function subscribe(listener) {
    listeners.push(listener);
    return () => { // unsubscribe function
      const index = listeners.indexOf(listener);
      listeners.splice(index, 1);
    };
  }

  return { getState, setState, subscribe };
}

export const store = createStore({ users: [], loading: false });
```

Any part of the app can now read the current state, update it, or subscribe to changes — without those parts needing to know about each other at all.

## A Simple UI Layer

The UI layer's job is purely: read from state, render DOM (Module 04), and forward user actions back into the state layer or API layer.

```js
// ui/userList.js
import { store } from '../state/store.js';

function renderUserList() {
  const container = document.getElementById('user-list');
  const { users, loading } = store.getState();

  if (loading) {
    container.innerHTML = '<p>Loading...</p>';
    return;
  }

  container.innerHTML = users
    .map(user => `<li>${user.name}</li>`)
    .join('');
}

// Re-render automatically whenever state changes
store.subscribe(renderUserList);

export { renderUserList };
```

Notice this file has zero knowledge of *how* users get fetched, or what the "add user" form does — it only knows how to render whatever's currently in `store`. That's separation of concerns doing its job: this file could be swapped out entirely (change the markup, change the layout) without touching anything else in the app.

## The API/Data Layer

```js
// api/users.js
import { store } from '../state/store.js';

export async function loadUsers() {
  store.setState({ loading: true });

  try {
    const response = await fetch('/api/users'); // Module 05
    const users = await response.json();
    store.setState({ users, loading: false });
  } catch (error) {
    console.error('Failed to load users:', error);
    store.setState({ loading: false });
  }
}
```

This file knows about `fetch` and the shape of the API response — details the UI layer deliberately doesn't need to know about.

## Wiring It Together: main.js

```js
// main.js
import { loadUsers } from './api/users.js';
import { renderUserList } from './ui/userList.js';

document.addEventListener('DOMContentLoaded', () => {
  renderUserList(); // initial render (empty state)
  loadUsers();       // triggers fetch → state update → automatic re-render via subscribe
});
```

`main.js` is the only file that knows about *everything* — it's the entry point, wiring independent pieces together, while each individual piece stays focused and unaware of the others' internals.

## What Frameworks Are Actually Automating

Looking back at what was just built by hand, you can now recognize exactly what React and Vue are doing for you automatically:

- **State + re-rendering**: `createStore`'s `subscribe`/`setState` pattern is the manual version of React's `useState` or Vue's `reactive()` — both trigger a re-render automatically when state changes, using mechanisms you now understand conceptually (Observer pattern, and for Vue specifically, `Proxy` from Module 09).
- **Component boundaries**: splitting `ui/userList.js` and `ui/userForm.js` into separate files with focused responsibilities is the same instinct that leads to separate `UserList.jsx` and `UserForm.jsx` components — frameworks formalize this instinct with an actual `Component` concept.
- **Efficient re-rendering**: this example's `renderUserList` crudely rebuilds the entire list's HTML on every state change via `innerHTML`. React's virtual DOM and Vue's reactivity system exist specifically to make this **efficient** — updating only what actually changed, rather than regenerating everything — a real, meaningful optimization frameworks provide over this hand-rolled version.

None of this makes frameworks unnecessary — quite the opposite. It shows that frameworks aren't magic; they're a highly refined, battle-tested version of the exact same organizational instincts you just built manually, with performance and ergonomics handled for you.

## Practical Example

Extending the example above with a form that adds a new user, tying every layer together in one flow:

```js
// ui/userForm.js
import { store } from '../state/store.js';

function initUserForm() {
  const form = document.getElementById('add-user-form');

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Module 04
    const input = form.querySelector('input[name="name"]');
    const newUser = { id: Date.now(), name: input.value };

    const { users } = store.getState();
    store.setState({ users: [...users, newUser] });

    input.value = '';
  });
}

export { initUserForm };
```

```js
// main.js (updated)
import { loadUsers } from './api/users.js';
import { renderUserList } from './ui/userList.js';
import { initUserForm } from './ui/userForm.js';

document.addEventListener('DOMContentLoaded', () => {
  renderUserList();
  initUserForm();
  loadUsers();
});
```

Submitting the form updates `store`, which automatically triggers `renderUserList` via the subscription set up earlier — the UI updates itself, without `userForm.js` needing any direct reference to `userList.js` at all. That decoupling is the entire payoff of the structure built in this lesson.

## Revision Questions

<details>
<summary>1. What question does "separation of concerns" really ask you to answer for every piece of code you write?</summary>

Where does this piece of logic belong, and what is it allowed to know about? Each layer (UI, state, API, utilities) should only know what it strictly needs to do its own job, and nothing about the internal details of other layers.
</details>

<details>
<summary>2. In the hand-built store example, what mechanism allows the UI layer to automatically re-render whenever state changes, without main.js manually calling render functions after every update?</summary>

The `subscribe` function, which is a direct application of the Observer pattern from Module 09 — the UI layer registers a listener once, and `setState` calls every registered listener automatically whenever state changes.
</details>

<details>
<summary>3. What does this lesson's hand-built store fail to do efficiently that a framework like React or Vue specifically improves on?</summary>

It re-renders by rebuilding the entire list's HTML from scratch on every state change (via `innerHTML`), rather than updating only the specific parts of the DOM that actually changed. React's virtual DOM and Vue's reactivity system are built specifically to make updates efficient by targeting only what changed.
</details>

<details>
<summary>4. Why does understanding this manual structure make someone a better user of React or Vue, even though they'll rarely build apps this way again?</summary>

It reveals that a framework's core concepts (state, components, automatic re-rendering) aren't arbitrary magic — they're refined, optimized versions of the same organizational instincts (separation of concerns, the Observer pattern) applied manually here, which makes the framework's behavior and design choices easier to reason about rather than treating them as a black box.
</details>
