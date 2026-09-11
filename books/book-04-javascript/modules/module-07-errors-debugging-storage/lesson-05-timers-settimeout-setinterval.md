# Lesson 5: Timers — setTimeout/setInterval

## Learning Objectives
- Schedule delayed code with `setTimeout()`
- Schedule repeating code with `setInterval()`
- Cancel timers with `clearTimeout()`/`clearInterval()`
- Understand that timer delays are a *minimum*, not a guarantee
- Understand how timers interact with the event loop and microtasks
- Implement debounce and throttle patterns using timers

## Introduction

You've used the event loop concepts implicitly since Module 05's coverage of Promises and `async`/`await`. Timers — `setTimeout()` and `setInterval()` — are the other major piece of asynchronous JavaScript, and understanding exactly how they queue up relative to Promises is essential for debugging timing-related bugs.

## 1. `setTimeout()`

Runs a function once, after at least the specified delay (in milliseconds):

```javascript
console.log('Start');

setTimeout(() => {
  console.log('This runs after ~1 second');
}, 1000);

console.log('End');

// Logs: 'Start', 'End', then 1 second later: 'This runs after ~1 second'
```

`setTimeout(fn, 0)` schedules `fn` to run as soon as possible, but NOT immediately — it still waits for the current synchronous code to finish first:

```javascript
console.log('1');
setTimeout(() => console.log('2'), 0);
console.log('3');
// Logs: 1, 3, 2 — even a 0ms timeout is deferred until the call stack clears
```

## 2. Passing arguments to `setTimeout`

Extra arguments after the delay are passed through to the callback:

```javascript
function greet(name, greeting) {
  console.log(`${greeting}, ${name}!`);
}
setTimeout(greet, 1000, 'Sam', 'Hello'); // logs "Hello, Sam!" after 1 second
```

## 3. Canceling with `clearTimeout()`

`setTimeout()` returns an ID you can use to cancel it before it fires:

```javascript
const timerId = setTimeout(() => console.log('You will never see this'), 5000);
clearTimeout(timerId); // canceled before it had a chance to run
```

## 4. `setInterval()`

Repeats a function every N milliseconds until explicitly stopped:

```javascript
let count = 0;
const intervalId = setInterval(() => {
  count++;
  console.log(`Tick ${count}`);
  if (count === 3) {
    clearInterval(intervalId); // stop after 3 ticks — otherwise it repeats forever
  }
}, 1000);
```

**Important:** unlike `setTimeout`, `setInterval` keeps running indefinitely until you call `clearInterval()`. Forgetting to clear an interval (e.g., when a component unmounts in React) is a very common source of memory leaks and "ghost" behavior in single-page apps.

## 5. Timer delay is a *minimum*, not exact

JavaScript is single-threaded. If the call stack is busy running other synchronous code, a timer's callback waits until the stack is clear, even past its nominal delay:

```javascript
console.log('Start');
setTimeout(() => console.log('Timeout fired'), 100);

// Simulate a long, blocking synchronous operation
const start = Date.now();
while (Date.now() - start < 500) {} // blocks the thread for 500ms

console.log('Blocking done');
// Logs: 'Start', 'Blocking done', then immediately 'Timeout fired'
// even though it was scheduled for only 100ms — it had to wait for the block to finish
```

## 6. Timers vs. Promises in the event loop

This connects directly to Module 05. The event loop processes two different queues:

- **Microtask queue** — Promise `.then()`/`.catch()` callbacks, `async`/`await` continuations
- **Macrotask (task) queue** — `setTimeout`/`setInterval` callbacks, DOM events

**Microtasks always run before the next macrotask**, even if the timer was scheduled first:

```javascript
console.log('1');

setTimeout(() => console.log('2 (macrotask)'), 0);

Promise.resolve().then(() => console.log('3 (microtask)'));

console.log('4');

// Logs: 1, 4, 3 (microtask), 2 (macrotask)
// Even with a 0ms delay, the Promise callback always wins
```

## 7. Recursive `setTimeout` vs. `setInterval`

A recursive `setTimeout` is often preferred over `setInterval` for tasks whose duration might vary (like a `fetch()` call), because it guarantees a gap between the END of one run and the START of the next — `setInterval` can queue up overlapping calls if a single run takes longer than the interval:

```javascript
function poll() {
  setTimeout(async () => {
    await checkForUpdates(); // might take 200ms, might take 3 seconds
    poll(); // schedule the NEXT check only after this one finishes
  }, 5000);
}

async function checkForUpdates() {
  console.log('Checking...');
}

poll();
```

## 8. Debounce and throttle

Two extremely common patterns built on timers, both frequently needed for UI event handling (Module 04):

**Debounce** — wait until the user *stops* triggering an event for N ms before running the callback (e.g., search-as-you-type, waiting for the user to stop typing before firing an API call):

```javascript
function debounce(fn, delay) {
  let timerId;
  return function (...args) {
    clearTimeout(timerId); // cancel any pending call
    timerId = setTimeout(() => fn.apply(this, args), delay);
  };
}

const debouncedSearch = debounce((query) => console.log('Searching for:', query), 300);
debouncedSearch('a');
debouncedSearch('ap');
debouncedSearch('app'); // only THIS call actually runs, 300ms after the last keystroke
```

**Throttle** — run the callback at most once every N ms, no matter how often the event fires (e.g., scroll or resize handlers):

```javascript
function throttle(fn, limit) {
  let waiting = false;
  return function (...args) {
    if (!waiting) {
      fn.apply(this, args);
      waiting = true;
      setTimeout(() => { waiting = false; }, limit);
    }
  };
}

const throttledScroll = throttle(() => console.log('Scroll handler ran'), 1000);
window.addEventListener('scroll', throttledScroll);
```

## Practical Example

A live countdown timer combining `setInterval`, `clearInterval`, and cleanup:

```javascript
function createCountdown(seconds, onTick, onComplete) {
  let remaining = seconds;
  const intervalId = setInterval(() => {
    remaining--;
    onTick(remaining);
    if (remaining <= 0) {
      clearInterval(intervalId);
      onComplete();
    }
  }, 1000);

  // Return a cancel function so the caller can stop early (e.g., component unmount)
  return () => clearInterval(intervalId);
}

const cancelCountdown = createCountdown(
  5,
  (secondsLeft) => console.log(`${secondsLeft} seconds remaining...`),
  () => console.log('Countdown complete!')
);

// Later, if needed: cancelCountdown();

// Debounced search box example
function debounce(fn, delay) {
  let timerId;
  return (...args) => {
    clearTimeout(timerId);
    timerId = setTimeout(() => fn(...args), delay);
  };
}

const handleSearchInput = debounce((value) => {
  console.log('Fetching results for:', value);
}, 400);
```

## Revision Questions

<details>
<summary>1. Does `setTimeout(fn, 0)` run `fn` immediately?</summary>

No. It defers `fn` to run after the current synchronous code finishes and the call stack is clear — "as soon as possible," not "right now."
</details>

<details>
<summary>2. Why is `setTimeout`'s delay described as a minimum rather than a guarantee?</summary>

JavaScript is single-threaded — if the call stack is busy with other synchronous work when the timer's delay elapses, the callback must wait until the stack clears before it can run, however long that takes.
</details>

<details>
<summary>3. If a `setTimeout(fn, 0)` and a `Promise.resolve().then(fn2)` are both scheduled, which runs first?</summary>

`fn2` (the Promise callback) runs first. Microtasks (Promise callbacks) are always fully drained before the event loop moves on to the next macrotask (timer callback), regardless of the timer's delay.
</details>

<details>
<summary>4. Why might recursive `setTimeout` be preferred over `setInterval` for polling a server?</summary>

`setInterval` fires on a fixed schedule regardless of how long each execution takes, which can cause overlapping/queued-up calls if one run takes longer than the interval. Recursive `setTimeout` only schedules the next call after the current one finishes, guaranteeing no overlap.
</details>

<details>
<summary>5. What's the functional difference between debounce and throttle?</summary>

Debounce waits until the triggering event stops firing for a set period before running the callback once (good for "wait until the user finishes typing"). Throttle runs the callback at a fixed maximum rate regardless of how often the event fires (good for limiting scroll/resize handler frequency).
</details>
