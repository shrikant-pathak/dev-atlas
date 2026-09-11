# Lesson 2: Proxy and Reflect

## Learning Objectives
- Understand what a `Proxy` is and how it intercepts fundamental object operations
- Use common traps: `get`, `set`, `has`, `deleteProperty`
- Understand what `Reflect` is for and why it's typically used alongside `Proxy`
- Recognize real-world uses of `Proxy` (validation, reactivity systems, logging)

## Introduction

Every object operation you've used so far — reading a property, setting one, checking `in`, deleting a key — happens invisibly, handled directly by the JavaScript engine. `Proxy` lets you insert your own code in between an object and anyone interacting with it, intercepting these fundamental operations and running custom logic before (or instead of) the default behavior.

This might sound abstract, but it's the exact mechanism behind Vue's reactivity system (Vue 3 rewrote its reactivity core around `Proxy`, replacing the older `Object.defineProperty`-based approach) and behind various validation and logging libraries. Since you already work in Vue, understanding `Proxy` demystifies something you're relying on directly, even if you've never written one yourself.

## Creating a Proxy

A `Proxy` wraps a target object with a **handler** object containing **traps** — functions that intercept specific operations.

```js
const target = { name: 'Ada', age: 30 };

const handler = {
  get(obj, prop) {
    console.log(`Reading property: ${prop}`);
    return obj[prop];
  }
};

const proxy = new Proxy(target, handler);

console.log(proxy.name);
// Reading property: name
// Ada
```

Every read through `proxy` — not `target` — passes through the `get` trap first. The original `target` object is completely unaffected and unaware any of this is happening.

## Common Traps

### `get` — intercepting property reads

```js
const user = { name: 'Grace', role: 'admin' };

const proxy = new Proxy(user, {
  get(obj, prop) {
    if (prop in obj) {
      return obj[prop];
    }
    return `Property "${String(prop)}" does not exist`;
  }
});

console.log(proxy.name); // Grace
console.log(proxy.email); // Property "email" does not exist
```

### `set` — intercepting property writes (validation)

```js
const person = {};

const validated = new Proxy(person, {
  set(obj, prop, value) {
    if (prop === 'age' && typeof value !== 'number') {
      throw new TypeError('age must be a number');
    }
    obj[prop] = value;
    return true; // must return true to indicate success
  }
});

validated.age = 25;      // works fine
validated.age = 'young'; // throws TypeError: age must be a number
```

### `has` — intercepting the `in` operator

```js
const restricted = new Proxy({ password: '1234', name: 'Ada' }, {
  has(obj, prop) {
    if (prop === 'password') return false; // hide this key from `in` checks
    return prop in obj;
  }
});

console.log('name' in restricted);     // true
console.log('password' in restricted); // false, even though it's really there
```

### `deleteProperty` — intercepting `delete`

```js
const protectedObj = new Proxy({ id: 1, locked: true }, {
  deleteProperty(obj, prop) {
    if (prop === 'id') {
      console.log('Cannot delete id');
      return false;
    }
    delete obj[prop];
    return true;
  }
});

delete protectedObj.id; // Cannot delete id
```

## Reflect: The Natural Partner to Proxy

`Reflect` is a built-in object with methods that mirror the default behavior of the operations `Proxy` intercepts — `Reflect.get()`, `Reflect.set()`, `Reflect.has()`, `Reflect.deleteProperty()`, and more. Its main purpose, in practice, is to let a trap fall back to the *default* behavior cleanly, instead of manually reimplementing it.

Compare the earlier `get` trap written manually (`return obj[prop]`) versus using `Reflect`:

```js
const handler = {
  get(obj, prop, receiver) {
    console.log(`Reading: ${prop}`);
    return Reflect.get(obj, prop, receiver); // equivalent to obj[prop], but correctly forwards `receiver`
  }
};
```

For simple cases, `obj[prop]` and `Reflect.get(obj, prop)` behave the same. But `Reflect` methods correctly handle trickier edge cases — like inheritance through the prototype chain (Module 02) — that manually reimplementing the operation can get subtly wrong. The convention in real-world `Proxy` code is: **always use `Reflect` inside your traps to perform the actual default operation**, rather than writing it yourself.

```js
const logged = new Proxy({ count: 0 }, {
  get(target, prop, receiver) {
    console.log(`get: ${String(prop)}`);
    return Reflect.get(target, prop, receiver);
  },
  set(target, prop, value, receiver) {
    console.log(`set: ${String(prop)} = ${value}`);
    return Reflect.set(target, prop, value, receiver);
  }
});

logged.count = 5;  // set: count = 5
console.log(logged.count); // get: count \n 5
```

## Real-World Uses

**Reactivity systems (Vue 3).** Vue's reactivity system wraps your component's `data` in a `Proxy`. When your template reads a reactive property, the `get` trap records "this component depends on this property." When you assign a new value, the `set` trap knows exactly which components depend on that property and triggers only those to re-render. This is conceptually the Observer pattern from Lesson 1, implemented using `Proxy` as the mechanism that detects reads and writes automatically, without you manually calling `.subscribe()` anywhere in your component code.

**Validation layers.** As shown above, a `set` trap can enforce rules (type checks, required fields, immutability) on every write to an object, centralizing validation logic instead of scattering `if` checks across every place the object gets modified.

**Default values / negative array indexing.** A `get` trap can provide fallback behavior the language doesn't support natively:

```js
function createArrayWithNegativeIndices(array) {
  return new Proxy(array, {
    get(target, prop, receiver) {
      const index = Number(prop);
      if (Number.isInteger(index) && index < 0) {
        return target[target.length + index];
      }
      return Reflect.get(target, prop, receiver);
    }
  });
}

const arr = createArrayWithNegativeIndices(['a', 'b', 'c']);
console.log(arr[-1]); // 'c' — plain arrays don't support this natively
```

## Practical Example

A simple "read-only" object guard, useful when you want to expose configuration data that consuming code should never accidentally mutate:

```js
function makeReadOnly(obj) {
  return new Proxy(obj, {
    set(target, prop) {
      console.warn(`Cannot modify read-only property: ${String(prop)}`);
      return false; // signals the assignment failed (throws in strict mode/modules)
    },
    deleteProperty(target, prop) {
      console.warn(`Cannot delete read-only property: ${String(prop)}`);
      return false;
    }
  });
}

const config = makeReadOnly({ apiUrl: 'https://api.example.com', retries: 3 });

config.retries = 10; // Cannot modify read-only property: retries
console.log(config.retries); // 3 — unchanged
```

This achieves something similar to `Object.freeze()`, but with the flexibility to add custom logging, custom error messages, or selectively allow certain properties to change — control that `Object.freeze()` doesn't offer.

## Revision Questions

<details>
<summary>1. What does a Proxy actually do, conceptually?</summary>

It wraps a target object so that fundamental operations on it — reading a property, writing one, checking `in`, deleting a key — are intercepted by custom "trap" functions you define, before (or instead of) the engine's default behavior runs.
</details>

<details>
<summary>2. Why is it recommended to use Reflect inside a Proxy trap instead of manually reimplementing the default behavior?</summary>

`Reflect` methods correctly handle subtle edge cases, such as behavior involving the prototype chain, that a hand-rolled implementation (like a plain `obj[prop]`) can get wrong. Using `Reflect` inside a trap ensures the "fall through to default behavior" path behaves exactly as the engine intends.
</details>

<details>
<summary>3. How does Vue 3's reactivity system use Proxy, at a conceptual level?</summary>

It wraps a component's reactive data in a Proxy. The `get` trap tracks which parts of the template depend on which properties as they're read, and the `set` trap, triggered on assignment, notifies only the dependent parts to re-render — without any manual subscribe/notify calls in your component code.
</details>

<details>
<summary>4. How does the read-only Proxy example differ from using Object.freeze() to achieve similar protection?</summary>

`Object.freeze()` only provides a fixed, built-in immutability behavior. A Proxy's `set`/`deleteProperty` traps let you add custom logic — logging a warning, choosing a custom error message, or allowing some properties to change while blocking others — giving finer control than a single freeze operation.
</details>
