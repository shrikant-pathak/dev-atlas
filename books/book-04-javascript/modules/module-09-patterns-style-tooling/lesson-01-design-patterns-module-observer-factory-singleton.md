# Lesson 1: Design Patterns — Module, Observer, Factory, Singleton

## Learning Objectives
- Understand what a design pattern is and why they matter beyond "just writing code that works"
- Implement the Module pattern for encapsulation
- Implement the Observer pattern for decoupled event-driven communication
- Implement the Factory pattern for flexible object creation
- Implement the Singleton pattern and understand its trade-offs

## Introduction

By now you've written a lot of JavaScript — functions (Module 02), objects and prototypes (Module 02), classes (Module 06), async code (Module 05). Design patterns aren't new syntax or a new API; they're **recurring solutions to recurring problems**, expressed using the language features you already know. Learning them gives you a shared vocabulary with other developers ("just use an observer here") and a mental toolkit for structuring code that would otherwise grow tangled and hard to reason about.

This lesson covers four foundational patterns you will genuinely see and use in real codebases — including in React, which you already work with, whose entire re-render mechanism is essentially a large-scale application of the Observer pattern.

## The Module Pattern

You already understand *why* this pattern exists from Module 06: ES modules (`import`/`export`) solve the problem of keeping variables private and exposing only what's needed. The Module pattern is the technique developers used to achieve this *before* ES modules existed, using closures (Module 02) instead.

```js
const Counter = (function () {
  let count = 0; // private — inaccessible from outside

  function increment() {
    count += 1;
    return count;
  }

  function reset() {
    count = 0;
  }

  return { increment, reset }; // only these are exposed
})();

Counter.increment(); // 1
Counter.increment(); // 2
console.log(Counter.count); // undefined — truly private
```

This is an **IIFE** (Module 02) that returns an object — the closure keeps `count` alive and private, while only `increment` and `reset` are exposed on the returned object. If you're working in a modern codebase with ES modules, you rarely need to reach for this manually — a module file with unexported variables already gives you the same privacy. But you'll still see this pattern in older code, and it's the direct conceptual ancestor of what `import`/`export` now does natively.

## The Observer Pattern

The Observer pattern lets one object (the **subject**) notify a list of other objects (**observers**) whenever something happens, without the subject needing to know any specifics about who's listening or what they'll do. This should sound familiar — it's exactly the shape of `addEventListener` from Module 04.

```js
class EventEmitter {
  constructor() {
    this.listeners = {};
  }

  on(eventName, callback) {
    if (!this.listeners[eventName]) {
      this.listeners[eventName] = [];
    }
    this.listeners[eventName].push(callback);
  }

  emit(eventName, data) {
    if (!this.listeners[eventName]) return;
    this.listeners[eventName].forEach(callback => callback(data));
  }

  off(eventName, callback) {
    if (!this.listeners[eventName]) return;
    this.listeners[eventName] = this.listeners[eventName].filter(cb => cb !== callback);
  }
}

const emitter = new EventEmitter();

function logOrder(order) {
  console.log('New order:', order);
}

emitter.on('order:created', logOrder);
emitter.emit('order:created', { id: 42, item: 'Widget' });
// New order: { id: 42, item: 'Widget' }

emitter.off('order:created', logOrder);
```

Notice this is, structurally, exactly what `document.addEventListener` / `removeEventListener` gives you natively for DOM events — the Observer pattern is the general-purpose version of that idea, usable for *any* kind of event, not just DOM events. This is also the underlying idea behind how React's state updates trigger re-renders, and how libraries like Redux notify subscribed components of state changes — the "subject" is the store, and connected components are the "observers."

## The Factory Pattern

A **factory** is a function whose entire job is creating and returning objects, hiding the details of *how* the object gets built. Instead of calling `new SomeClass()` directly everywhere in your code, you call a factory function that decides what kind of object to create and configures it for you.

```js
function createUser(type, name) {
  const base = { name, createdAt: new Date() };

  switch (type) {
    case 'admin':
      return { ...base, role: 'admin', permissions: ['read', 'write', 'delete'] };
    case 'editor':
      return { ...base, role: 'editor', permissions: ['read', 'write'] };
    case 'viewer':
    default:
      return { ...base, role: 'viewer', permissions: ['read'] };
  }
}

const admin = createUser('admin', 'Ada');
const viewer = createUser('viewer', 'Grace');
```

The value of a factory shows up as complexity grows: if creating a "user" object later requires validation, default values, or choosing between several different underlying classes, callers of `createUser()` never need to change — only the factory's internals do. Compare this to scattering `new AdminUser()`, `new EditorUser()`, `new ViewerUser()` calls throughout a codebase, where changing the creation logic means hunting down every call site.

## The Singleton Pattern

A **Singleton** guarantees that a class or module has exactly one instance, shared everywhere it's used — useful for things like a single shared configuration object, a single database connection, or a single logging service.

```js
class Logger {
  static instance;

  constructor() {
    if (Logger.instance) {
      return Logger.instance; // return the existing instance instead of creating a new one
    }
    this.logs = [];
    Logger.instance = this;
  }

  log(message) {
    this.logs.push(message);
    console.log(`[LOG]: ${message}`);
  }
}

const logger1 = new Logger();
const logger2 = new Logger();

logger1.log('First message');
console.log(logger1 === logger2); // true — same instance
console.log(logger2.logs);        // ['First message'] — shared state
```

In practice, since ES modules (Module 06) are only ever evaluated once and then cached, a module that exports a single object *is already a Singleton* without any special class logic:

```js
// config.js
const config = { apiUrl: 'https://api.example.com', timeout: 5000 };
export default config;

// Every file that imports config.js gets the exact same object reference
```

This is worth internalizing: in modern JavaScript, you rarely need the class-based Singleton pattern shown above, because ES modules give you the same guarantee for free. Understanding the classic version still matters, though, both for reading older code and for languages/environments where modules don't provide this guarantee automatically.

**A word of caution:** Singletons are one of the most debated patterns in software design. They introduce shared, global-like state, which can make code harder to test (you can't easily swap in a fresh instance for each test) and can hide dependencies between parts of your code that aren't obvious from function signatures alone. Use them deliberately, not as a default.

## Practical Example

A small pub/sub notification system combining Factory and Observer — a shape you'll recognize from real applications with different notification types (toast, banner, modal) all funneled through one event system:

```js
class NotificationCenter {
  constructor() {
    this.subscribers = [];
  }

  subscribe(callback) {
    this.subscribers.push(callback);
  }

  notify(notification) {
    this.subscribers.forEach(callback => callback(notification));
  }
}

function createNotification(type, message) {
  const base = { message, timestamp: new Date() };

  switch (type) {
    case 'error':
      return { ...base, type, icon: '❌', duration: 6000 };
    case 'success':
      return { ...base, type, icon: '✅', duration: 3000 };
    default:
      return { ...base, type: 'info', icon: 'ℹ️', duration: 4000 };
  }
}

const center = new NotificationCenter();

center.subscribe(notification => {
  console.log(`${notification.icon} ${notification.message}`);
});

center.notify(createNotification('success', 'Profile saved'));
// ✅ Profile saved
```

The Factory decides *what* gets created; the Observer decides *who finds out about it*. Keeping those two concerns separate is exactly what makes each piece easy to change independently later.

## Revision Questions

<details>
<summary>1. What problem does the Module pattern solve, and what modern JavaScript feature makes it largely unnecessary to write by hand?</summary>

It solves the problem of keeping some variables private while exposing only a controlled public interface, using a closure inside an IIFE. ES modules (`import`/`export`) now provide the same privacy natively — anything not exported from a module file is already private to that file.
</details>

<details>
<summary>2. How is the Observer pattern similar to addEventListener, and where else have you likely already seen this pattern used?</summary>

Both let one piece of code (the subject/DOM element) notify a list of interested listeners without knowing anything about them in advance. It's the same underlying idea behind how React and state-management libraries like Redux notify components when data changes, triggering re-renders.
</details>

<details>
<summary>3. What's the main benefit of using a factory function instead of calling `new SomeClass()` directly everywhere in your code?</summary>

If the object-creation logic needs to change later — new validation, new default values, choosing between different classes — only the factory function needs to change. Code that calls the factory doesn't need to know or care how the object gets built.
</details>

<details>
<summary>4. Why is the classic class-based Singleton pattern less necessary in modern JavaScript than it used to be?</summary>

ES modules are only ever evaluated once per application and then cached, so any module that exports a single object already behaves like a Singleton — every file that imports it gets the exact same reference — without needing any special constructor logic to enforce a single instance.
</details>
