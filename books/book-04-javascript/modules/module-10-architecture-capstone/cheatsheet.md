# Module 10 Cheatsheet: JS Architecture & Capstone Project

## Layered Architecture

src/
api/ → external data (fetch calls)
state/ → application state + change notifications
storage/ → localStorage read/write (wrapped in try/catch)
ui/ → DOM rendering + event handling
utils/ → pure helper functions, no dependencies on the above
main.js → entry point; the only file that knows about everything


Rule of thumb: each file should only import what it strictly needs, and lower layers (utils, api) should never import from higher layers (ui).

## Minimal State Store (Observer Pattern)

```js
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

export const store = createStore({ /* initial state */ });

// Anywhere else:
store.subscribe((state) => { /* re-render, persist, log, etc. */ });
store.setState({ someKey: newValue });
```

## Safe Storage Pattern (Module 07)

```js
function loadFromStorage(key) {
  try {
    const raw = localStorage.getItem(key);
    return raw ? JSON.parse(raw) : null;
  } catch (error) {
    console.error('Storage read failed:', error);
    return null;
  }
}

function saveToStorage(key, value) {
  try {
    localStorage.setItem(key, JSON.stringify(value));
  } catch (error) {
    console.error('Storage write failed:', error);
  }
}
```

## Safe API Pattern (Module 05 + 07)

```js
async function fetchData(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Request failed: ${response.status}`);
  }
  return response.json();
}

async function loadData() {
  try {
    const data = await fetchData('/api/resource');
    store.setState({ data, error: null });
  } catch (error) {
    store.setState({ error: error.message });
  }
}
```

## Event Delegation for Dynamic Lists (Module 04)

```js
container.addEventListener('click', (event) => {
  const item = event.target.closest('li');
  if (!item) return;
  const id = item.dataset.id;
  // handle the click based on what was clicked inside the item
});
```

## What Frameworks Automate (Mental Map)

| Hand-built concept | Framework equivalent |
|---|---|
| `createStore` + `subscribe` | React `useState`, Vue `reactive()`/`ref()` |
| Manual `innerHTML` re-render | Virtual DOM diffing (React), reactive updates (Vue) |
| Separate `ui/*.js` files | Components (`.jsx` / `.vue`) |
| `main.js` wiring everything | The framework's render tree / app instance |

## Capstone Checklist

- [ ] State layer with `getState`/`setState`/`subscribe`
- [ ] Storage layer wrapped in `try`/`catch`
- [ ] API layer using `async`/`await` with proper error handling
- [ ] UI layer using event delegation, subscribed to state changes
- [ ] Custom error class for at least one failure case
- [ ] `main.js` as the single wiring/entry point
- [ ] `type="module"` on the script tag in `index.html`
