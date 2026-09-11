# Module 09 Cheatsheet: Patterns, Style & Tooling

## Design Patterns

```js
// Module pattern (pre-ES-modules privacy via closure)
const Counter = (function () {
  let count = 0;
  return { increment: () => ++count };
})();

// Observer pattern
class EventEmitter {
  listeners = {};
  on(event, cb) { (this.listeners[event] ??= []).push(cb); }
  emit(event, data) { this.listeners[event]?.forEach(cb => cb(data)); }
}

// Factory pattern
function createUser(type, name) {
  switch (type) {
    case 'admin': return { name, role: 'admin' };
    default: return { name, role: 'viewer' };
  }
}

// Singleton pattern
class Logger {
  static instance;
  constructor() {
    if (Logger.instance) return Logger.instance;
    Logger.instance = this;
  }
}
// Note: an ES module exporting a single object is already a Singleton for free.
```

## Proxy & Reflect

```js
const proxy = new Proxy(target, {
  get(obj, prop, receiver) { return Reflect.get(obj, prop, receiver); },
  set(obj, prop, value, receiver) { return Reflect.set(obj, prop, value, receiver); },
  has(obj, prop) { return Reflect.has(obj, prop); },
  deleteProperty(obj, prop) { return Reflect.deleteProperty(obj, prop); },
});
```
Always call the matching `Reflect.*` method inside a trap to fall back to default behavior correctly.

## Naming Conventions

| Convention | Used for |
|---|---|
| `camelCase` | variables, functions |
| `PascalCase` | classes, components |
| `CONSTANT_CASE` | true, fixed constants only |
| `kebab-case` | file names, CSS classes |

Booleans: `isActive`, `hasPermission`, `canEdit`. Functions: verbs (`validateUser`, not `userValidation`).

## npm & package.json

```json
{
  "dependencies": { "react": "^18.2.0" },
  "devDependencies": { "eslint": "^8.50.0" },
  "scripts": { "start": "node index.js", "test": "jest" }
}
```

| Prefix | Meaning |
|---|---|
| `^18.2.0` | minor + patch updates allowed |
| `~4.17.21` | patch updates only |
| `18.2.0` | exact version only |

`package-lock.json` = exact resolved versions, always commit it.

```bash
npm install               # install from package.json
npm install <pkg>         # add to dependencies
npm install <pkg> -D      # add to devDependencies
npm run <script>          # run a package.json script
npx <cli-tool>            # run a CLI tool without installing globally
```

## Bundlers

| Tool | Dev-server approach | Notes |
|---|---|---|
| Webpack | Bundles upfront | Highly configurable, large plugin ecosystem |
| Vite | Native ESM, on-demand per file | Fast dev startup; uses Rollup for production build |
| esbuild | Go-based, very fast | Often used as an engine inside other tools |

Tree shaking = removing unused exports (needs static ESM imports). Code splitting = loading bundles on demand (`await import(...)`).

## ESLint

```js
// eslint.config.js
export default [
  { rules: {
    'no-unused-vars': 'warn',
    'eqeqeq': 'error',
    'quotes': ['error', 'single'],
  }}
];
```

Severity: `'off'` / `'warn'` / `'error'`. `extends`/preset = adopt a published rule set (e.g., `eslint-config-airbnb`). ESLint = code quality/correctness; Prettier = formatting only.

## Unit Testing (Jest/Vitest-style)

```js
describe('add', () => {
  test('adds numbers', () => {
    expect(add(2, 3)).toBe(5);
  });

  test('async example', async () => {
    const result = await fetchUser(1);
    expect(result).toEqual({ id: 1 });
  });
});
```

| Matcher | Use |
|---|---|
| `.toBe(x)` | strict equality — primitives |
| `.toEqual(x)` | deep equality — objects/arrays |
| `.toBeTruthy()` / `.toBeFalsy()` | truthiness |
| `.toThrow()` | function throws |
| `.toHaveBeenCalledWith(x)` | mock called with specific args |

Mocking: `jest.fn(() => fakeValue)` replaces a real dependency for isolated testing.
