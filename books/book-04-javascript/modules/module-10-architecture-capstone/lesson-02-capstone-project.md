# Lesson 2: Capstone Project

## Learning Objectives
- Design and build a complete, multi-feature JavaScript application from scratch
- Apply the architectural structure from Lesson 1 to a real, non-trivial project
- Integrate concepts from across the entire book: async/APIs, error handling, storage, patterns, and tooling
- Practice the full workflow of a real project: planning, building, testing, and reflecting

## Introduction

This is the final lesson of Book 04 — and it's deliberately different from every lesson before it. There's no new syntax or API to learn here. Instead, this lesson is a single integrated project designed to pull together nearly everything from Modules 01 through 09, built using the architectural approach from Lesson 1. Consider this the practical proof that you can take a real, moderately complex idea and build it end-to-end, the way you'd actually be expected to on the job.

## The Project: A Task Tracker with Persistence, Filtering, and a Live API Sync

You'll build a task tracker application with the following features:

1. Add, complete, and delete tasks
2. Filter tasks by status (all / active / completed)
3. Persist tasks to `localStorage` so they survive a page refresh
4. Fetch an initial set of "suggested tasks" from a public API on first load
5. Handle errors gracefully (a failed API call shouldn't crash the app)
6. Structured using the layered architecture from Lesson 1

This intentionally isn't a framework project — it's built in vanilla JavaScript specifically so every concept from this book has somewhere concrete to show up, unobscured by a framework's abstractions.

## Step 1: Project Structure

Following Lesson 1's layered approach:

src/
api/
suggestions.js
state/
store.js
storage/
persistence.js
ui/
taskList.js
taskForm.js
filterControls.js
utils/
generateId.js
main.js
index.html


## Step 2: The State Layer

```js
// state/store.js
function createStore(initialState) {
  let state = initialState;
  const listeners = [];

  return {
    getState: () => state,
    setState(partial) {
      state = { ...state, ...partial };
      listeners.forEach(fn => fn(state));
    },
    subscribe(fn) {
      listeners.push(fn);
      return () => listeners.splice(listeners.indexOf(fn), 1);
    }
  };
}

export const store = createStore({
  tasks: [],
  filter: 'all', // 'all' | 'active' | 'completed'
  loading: false,
  error: null,
});
```

## Step 3: Persistence (Module 07 — Browser Storage)

```js
// storage/persistence.js
const STORAGE_KEY = 'task-tracker-tasks';

export function loadTasksFromStorage() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch (error) {
    console.error('Failed to load tasks from storage:', error);
    return [];
  }
}

export function saveTasksToStorage(tasks) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(tasks));
  } catch (error) {
    console.error('Failed to save tasks to storage:', error);
  }
}
```

This directly reuses Module 07's `try`/`catch` pattern around storage operations — `localStorage` can throw (e.g., in private browsing mode, or when storage quota is exceeded), so every real read/write is wrapped defensively.

## Step 4: Utilities

```js
// utils/generateId.js
export function generateId() {
  return `${Date.now()}-${Math.random().toString(36).slice(2, 9)}`;
}
```

## Step 5: The API Layer (Module 05 — Async & fetch)

```js
// api/suggestions.js
export async function fetchSuggestedTasks() {
  const response = await fetch('https://jsonplaceholder.typicode.com/todos?_limit=5');

  if (!response.ok) {
    throw new Error(`Request failed with status ${response.status}`);
  }

  const data = await response.json();
  return data.map(item => ({
    id: `suggested-${item.id}`,
    text: item.title,
    completed: false,
  }));
}
```

## Step 6: Custom Error Handling (Module 07)

```js
// utils/errors.js
export class TaskLoadError extends Error {
  constructor(message) {
    super(message);
    this.name = 'TaskLoadError';
  }
}
```

## Step 7: Wiring State, Storage, and API Together

```js
// main.js (data-loading portion)
import { store } from './state/store.js';
import { loadTasksFromStorage, saveTasksToStorage } from './storage/persistence.js';
import { fetchSuggestedTasks } from './api/suggestions.js';
import { TaskLoadError } from './utils/errors.js';

async function initializeTasks() {
  const savedTasks = loadTasksFromStorage();

  if (savedTasks.length > 0) {
    store.setState({ tasks: savedTasks });
    return; // don't fetch suggestions if the user already has tasks
  }

  store.setState({ loading: true, error: null });

  try {
    const suggested = await fetchSuggestedTasks();
    store.setState({ tasks: suggested, loading: false });
  } catch (error) {
    // Wrap the low-level error in a custom, more descriptive error type
    const loadError = new TaskLoadError('Could not load suggested tasks. Starting with an empty list.');
    console.error(loadError.message, error);
    store.setState({ tasks: [], loading: false, error: loadError.message });
  }
}

// Persist to storage on every state change (Observer pattern, Module 09)
store.subscribe((state) => {
  saveTasksToStorage(state.tasks);
});
```

Notice the layered decision-making here: if there are already saved tasks, skip the network call entirely — an intentional product decision, not an accident, keeping the API call as a "first-run only" convenience rather than something that runs (and could fail) every single time.

## Step 8: The UI Layer (Module 04 — DOM & Events)

```js
// ui/taskList.js
import { store } from '../state/store.js';

function getFilteredTasks() {
  const { tasks, filter } = store.getState();
  if (filter === 'active') return tasks.filter(t => !t.completed);
  if (filter === 'completed') return tasks.filter(t => t.completed);
  return tasks;
}

function renderTaskList() {
  const container = document.getElementById('task-list');
  const { loading, error } = store.getState();

  if (loading) {
    container.innerHTML = '<p>Loading tasks...</p>';
    return;
  }

  const tasks = getFilteredTasks();
  const errorBanner = error ? `<p class="error">${error}</p>` : '';

  container.innerHTML = errorBanner + tasks.map(task => `
    <li data-id="${task.id}" class="${task.completed ? 'completed' : ''}">
      <input type="checkbox" ${task.completed ? 'checked' : ''} class="toggle" />
      <span>${task.text}</span>
      <button class="delete">✕</button>
    </li>
  `).join('');
}

function initTaskListEvents() {
  const container = document.getElementById('task-list');

  // Event delegation (Module 04) — one listener handles every task, present or future
  container.addEventListener('click', (event) => {
    const li = event.target.closest('li');
    if (!li) return;
    const id = li.dataset.id;
    const { tasks } = store.getState();

    if (event.target.classList.contains('toggle')) {
      const updated = tasks.map(t => t.id === id ? { ...t, completed: !t.completed } : t);
      store.setState({ tasks: updated });
    }

    if (event.target.classList.contains('delete')) {
      store.setState({ tasks: tasks.filter(t => t.id !== id) });
    }
  });
}

store.subscribe(renderTaskList);

export { renderTaskList, initTaskListEvents };
```

```js
// ui/taskForm.js
import { store } from '../state/store.js';
import { generateId } from '../utils/generateId.js';

function initTaskForm() {
  const form = document.getElementById('task-form');

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const input = form.querySelector('input[name="task-text"]');
    const text = input.value.trim();
    if (!text) return;

    const { tasks } = store.getState();
    const newTask = { id: generateId(), text, completed: false };
    store.setState({ tasks: [...tasks, newTask] });

    input.value = '';
  });
}

export { initTaskForm };
```

```js
// ui/filterControls.js
import { store } from '../state/store.js';

function initFilterControls() {
  const buttons = document.querySelectorAll('[data-filter]');

  buttons.forEach(button => {
    button.addEventListener('click', () => {
      store.setState({ filter: button.dataset.filter });
    });
  });
}

export { initFilterControls };
```

## Step 9: Final Entry Point

```js
// main.js (complete)
import { store } from './state/store.js';
import { loadTasksFromStorage, saveTasksToStorage } from './storage/persistence.js';
import { fetchSuggestedTasks } from './api/suggestions.js';
import { TaskLoadError } from './utils/errors.js';
import { renderTaskList, initTaskListEvents } from './ui/taskList.js';
import { initTaskForm } from './ui/taskForm.js';
import { initFilterControls } from './ui/filterControls.js';

async function initializeTasks() {
  const savedTasks = loadTasksFromStorage();

  if (savedTasks.length > 0) {
    store.setState({ tasks: savedTasks });
    return;
  }

  store.setState({ loading: true, error: null });

  try {
    const suggested = await fetchSuggestedTasks();
    store.setState({ tasks: suggested, loading: false });
  } catch (error) {
    const loadError = new TaskLoadError('Could not load suggested tasks. Starting with an empty list.');
    console.error(loadError.message, error);
    store.setState({ tasks: [], loading: false, error: loadError.message });
  }
}

document.addEventListener('DOMContentLoaded', () => {
  renderTaskList();       // initial render
  initTaskListEvents();
  initTaskForm();
  initFilterControls();

  store.subscribe((state) => saveTasksToStorage(state.tasks));

  initializeTasks();
});
```

## A Minimal index.html to Tie It All Together

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Task Tracker</title>
</head>
<body>
  <h1>Task Tracker</h1>

  <form id="task-form">
    <input type="text" name="task-text" placeholder="Add a task..." />
    <button type="submit">Add</button>
  </form>

  <div>
    <button data-filter="all">All</button>
    <button data-filter="active">Active</button>
    <button data-filter="completed">Completed</button>
  </div>

  <ul id="task-list"></ul>

  <script type="module" src="./main.js"></script>
</body>
</html>
```

Note `type="module"` on the script tag — this is what enables the `import`/`export` syntax (Module 06) used throughout every file in this project to actually work directly in the browser.

## Where Every Module in This Book Shows Up

Take a moment to trace it back:

- **Modules 01–02** (fundamentals, functions, objects, closures): every function, object literal, and the `createStore` closure itself
- **Module 03** (arrays, destructuring): `.map()`/`.filter()` on tasks, spread syntax in every `setState` call
- **Module 04** (DOM & events): all rendering, event delegation on the task list, form handling
- **Module 05** (async/fetch): `fetchSuggestedTasks`, `async`/`await`, error handling on the network call
- **Module 06** (ES6+): `import`/`export` throughout, template literals, optional data shapes
- **Module 07** (errors & storage): custom `TaskLoadError` class, `try`/`catch` around `localStorage`
- **Module 08** (typed arrays/legacy — less direct here, but conceptually): recognizing that this project's `fetch`-based approach is exactly what replaced the XHR/JSONP patterns from that module
- **Module 09** (patterns & tooling): the Observer pattern via `store.subscribe`, and everything here is exactly the kind of code ESLint/Jest from that module would lint and test in a real project
- **Module 10, Lesson 1** (architecture): the entire layered file structure this project is built on

## Extending the Project (Optional Stretch Goals)

If you want to push this further:
- Add a "clear completed" button
- Add task editing (double-click a task to rename it)
- Add unit tests (Module 09, Lesson 7) for `getFilteredTasks` and the store's `setState` logic
- Add ESLint (Module 09, Lesson 6) and fix everything it flags
- Rebuild this same app in React or Vue, and compare directly how much of Lesson 1's manual structure (state, subscriptions, rendering) the framework now handles for you

That last stretch goal is, in a real sense, the entire point of this book: once you can build this by hand and understand every line, picking the framework back up (which you already use daily) should feel less like memorizing an API and more like recognizing an old, more automated version of a language you already speak fluently.

## Revision Questions

<details>
<summary>1. Why does initializeTasks() skip fetching suggested tasks entirely if localStorage already has saved tasks?</summary>

It's a deliberate product decision: the API call is meant only as a first-run convenience to give new users a starting point, not something that should run — and risk failing — on every single load once the user already has their own real task data saved.
</details>

<details>
<summary>2. What module's pattern does store.subscribe(renderTaskList) directly apply, and how does it keep the UI and state layers decoupled?</summary>

The Observer pattern from Module 09. It keeps the layers decoupled because `taskList.js` never needs to be manually called after every state change elsewhere in the app — it registers itself once, and the store notifies it automatically whenever `setState` runs, regardless of which part of the app triggered that update.
</details>

<details>
<summary>3. Why is the localStorage read/write wrapped in try/catch in persistence.js?</summary>

`localStorage` operations can throw in real conditions — for example, in private/incognito browsing modes in some browsers, or when the storage quota has been exceeded — so wrapping them defensively (per Module 07) prevents a storage failure from crashing the entire application.
</details>

<details>
<summary>4. What does type="module" on the script tag in index.html enable, and why is it required for this project's file structure to work at all?</summary>

It enables native ES module syntax (`import`/`export`, Module 06) directly in the browser. It's required because the entire project is deliberately split across many small files that import from one another — without `type="module"`, none of those `import` statements would be recognized or resolved by the browser.
</details>
