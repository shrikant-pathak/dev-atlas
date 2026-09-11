# Lesson 3: Optional Chaining & Nullish Coalescing

## Learning Objectives
- Use optional chaining (`?.`) to safely access nested properties
- Use optional chaining with method calls and array/bracket access
- Use nullish coalescing (`??`) to provide fallback values
- Understand exactly what "nullish" means (`null` or `undefined`, not falsy)
- Understand why `??` is different from `||`
- Use the nullish assignment operator (`??=`)
- Combine `?.` and `??` in realistic data-handling code

## Introduction

In Module 03 and Module 04 you dealt with data that doesn't always have every property filled in — a user object that might not have an `address`, an API response where a nested field might be missing, a DOM query that might return `null`. Before ES2020, checking for this safely meant chains like:

```javascript
const city = user && user.address && user.address.city;
```

Every extra level of nesting meant another `&&` guard. ES2020 added two operators — optional chaining (`?.`) and nullish coalescing (`??`) — specifically to make this kind of defensive code shorter and clearer. You'll recognize these instantly from React/Vue code you've likely already written, like `props?.user?.name` or `data ?? []`.

## 1. The problem optional chaining solves

Recall from Module 03/04: trying to read a property off `null` or `undefined` throws:

```javascript
const user = { name: 'Sam' };
console.log(user.address.city); // TypeError: Cannot read properties of undefined
```

The old defensive fix:

```javascript
const city = user && user.address && user.address.city;
console.log(city); // undefined — no error
```

## 2. Optional chaining (`?.`)

`?.` short-circuits and returns `undefined` immediately if the value before it is `null` or `undefined`, instead of throwing:

```javascript
const user = { name: 'Sam' };
console.log(user?.address?.city); // undefined — no error
console.log(user?.name);          // 'Sam'
```

If `user` itself were `null` or `undefined`, it still works safely:

```javascript
const user = null;
console.log(user?.address?.city); // undefined
```

It stops evaluating the rest of the chain the moment it hits a nullish value — this is called **short-circuiting**, the same concept you learned with `&&`/`||` in Module 01.

## 3. Optional chaining with method calls

You can guard a method call the same way, useful when a function might not exist on an object (e.g., an optional callback prop in React):

```javascript
const config = {
  onSave: null,
};

config.onSave?.(); // does nothing — no error, since onSave is null

function process(options) {
  options?.onComplete?.('done');
}
process(); // safe even though options is undefined
```

This is extremely common in component props: `onPress?.()` in a React Native touchable, or `emit?.('event')`-style guards.

## 4. Optional chaining with brackets and arrays

Works with computed/bracket access too:

```javascript
const users = null;
console.log(users?.[0]?.name); // undefined, no error

const settings = { theme: { colors: ['red', 'blue'] } };
console.log(settings?.theme?.colors?.[1]); // 'blue'
console.log(settings?.theme?.colors?.[5]); // undefined — index out of range, still safe
```

## 5. Nullish coalescing (`??`)

`??` returns the right-hand value **only** when the left-hand value is `null` or `undefined` — nothing else:

```javascript
const count = 0;
console.log(count ?? 10); // 0 — 0 is not nullish, so the left side is kept
```

## 6. Why `??` is not the same as `||`

This is the single most important distinction in this lesson. `||` returns the right side for **any falsy** value (`0`, `''`, `false`, `NaN`, `null`, `undefined` — see Module 01's coverage of truthy/falsy). `??` only cares about `null`/`undefined`.

```javascript
const score = 0;
const volume = '';
const isActive = false;

console.log(score || 100);      // 100 — WRONG if 0 is a valid score!
console.log(score ?? 100);      // 0 — correct, 0 is a real value

console.log(volume || 'muted'); // 'muted' — WRONG if '' is intentional
console.log(volume ?? 'muted'); // '' — correct

console.log(isActive || true);  // true — WRONG, overwrites a real false
console.log(isActive ?? true);  // false — correct
```

This bug — using `||` for a default when `0`, `''`, or `false` are legitimate values — is one of the most common real-world JavaScript mistakes, and exactly why `??` was added.

## 7. Combining `?.` and `??`

The two operators are frequently used together: safely reach into a structure, then supply a fallback if the result is missing:

```javascript
function getDiscount(user) {
  return user?.membership?.discountPercent ?? 0;
}

console.log(getDiscount({ membership: { discountPercent: 15 } })); // 15
console.log(getDiscount({ membership: {} }));                       // 0 (discountPercent is undefined)
console.log(getDiscount({}));                                       // 0 (membership is undefined)
console.log(getDiscount(undefined));                                 // 0 (user itself is undefined)
```

Note: you **cannot** mix `??` directly with `||` or `&&` in the same expression without parentheses — `a || b ?? c` throws a `SyntaxError`, since JavaScript refuses to guess your intended precedence. You must write `(a || b) ?? c`.

## 8. Nullish assignment (`??=`)

Just like `+=` or `&&=`, `??=` assigns a value **only if** the current value is `null` or `undefined`:

```javascript
function createUser(options = {}) {
  options.role ??= 'guest'; // only sets 'role' if it's currently null/undefined
  return options;
}

console.log(createUser({ role: 'admin' })); // { role: 'admin' } — untouched
console.log(createUser({}));                // { role: 'guest' } — filled in
console.log(createUser({ role: '' }));      // { role: '' } — '' is NOT nullish, stays as-is
```

## Practical Example

Parsing a partially-filled API response — the kind of shape you'd get back from a `fetch()` call in Module 05 — safely, with sensible fallbacks:

```javascript
function formatUserProfile(apiResponse) {
  const name = apiResponse?.user?.name ?? 'Anonymous';
  const email = apiResponse?.user?.contact?.email ?? 'No email provided';
  const followerCount = apiResponse?.stats?.followers ?? 0;
  const bio = apiResponse?.user?.bio ?? '';
  const firstBadge = apiResponse?.user?.badges?.[0]?.label ?? 'No badges yet';

  // Optional chaining also guards a callback that might not exist
  apiResponse?.onLoaded?.();

  return { name, email, followerCount, bio, firstBadge };
}

console.log(formatUserProfile({
  user: { name: 'Priya', contact: {}, badges: [] },
  stats: { followers: 0 }, // note: 0 is a real value, must be preserved
}));
// { name: 'Priya', email: 'No email provided', followerCount: 0, bio: '', firstBadge: 'No badges yet' }

console.log(formatUserProfile(null));
// { name: 'Anonymous', email: 'No email provided', followerCount: 0, bio: '', firstBadge: 'No badges yet' }
```

## Revision Questions

<details>
<summary>1. What does `?.` do when the value on its left is `null` or `undefined`?</summary>

It short-circuits immediately and evaluates the whole chain to `undefined`, instead of throwing a `TypeError`. Any further `?.` or property access in the same chain is skipped.
</details>

<details>
<summary>2. What exactly counts as "nullish" for the `??` operator?</summary>

Only `null` and `undefined`. Values like `0`, `''`, `false`, and `NaN` are falsy but not nullish, so `??` treats them as valid, keepable values.
</details>

<details>
<summary>3. Why is `value ?? 100` usually safer than `value || 100` for numeric defaults?</summary>

Because `||` replaces the value for *any* falsy input, including a legitimate `0` — which would incorrectly become `100`. `??` only replaces `null`/`undefined`, so a real `0` is preserved.
</details>

<details>
<summary>4. Can you write `a || b ?? c` directly?</summary>

No — mixing `??` with `||` or `&&` without parentheses is a `SyntaxError`. You must be explicit: `(a || b) ?? c` or `a || (b ?? c)`.
</details>

<details>
<summary>5. What does `options.role ??= 'guest'` do?</summary>

It assigns `'guest'` to `options.role` only if `options.role` is currently `null` or `undefined`. If it already holds any other value — including `''` or `false` — it's left unchanged.
</details>
