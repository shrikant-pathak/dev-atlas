# Module 06 Interview Questions: ES6+ Modern Features

## Conceptual Questions

**1. What's the difference between a named export and a default export, and when would you use each?**
Named exports allow multiple values per module and must be imported using the exact name (or an alias via `as`); useful for utility modules with several related exports. Default exports allow exactly one per module and can be imported under any name; typically used for a module's single "main" thing, like a component or class.

**2. Is `class` syntax a new feature at the engine level, or syntactic sugar?**
Syntactic sugar over JavaScript's existing prototype-based inheritance. `class` methods still live on `.prototype`, and `instanceof` still walks the same prototype chain that existed before ES6.

**3. Why was optional chaining (`?.`) added when `&&` chaining already existed?**
`&&` chaining (`a && a.b && a.b.c`) works but becomes verbose and repetitive with deep nesting, and it has to repeat each intermediate expression. `?.` expresses the same safe-access intent far more concisely and short-circuits the same way.

**4. Explain why `??` is preferred over `||` for default values in many cases.**
`||` substitutes its right-hand value for ANY falsy left-hand value, including legitimate values like `0`, `''`, or `false`. `??` only substitutes when the left-hand value is `null` or `undefined`, which better matches the intent of "use a default only when there's genuinely no value."

**5. What problem do private class fields (`#field`) solve?**
Prior to `#field`, JavaScript had no true encapsulation for object properties — the common underscore convention (`_field`) was just a naming signal, not an enforced restriction; external code could still read/write it. `#field` is enforced by the language itself and throws a `SyntaxError` on external access.

## Practical / Coding Questions

**6. Write a regex that validates a string is exactly 5 digits.**
```javascript
/^\d{5}$/.test(str)
```

**7. Given `const user = { profile: { social: { twitter: '@sam' } } }`, write a one-line safe access to `user.profile.social.instagram` that returns `'none'` if missing.**
```javascript
const instagram = user?.profile?.social?.instagram ?? 'none';
```

**8. Write a base class `Employee` and a subclass `Manager` where `Manager` adds a `teamSize` field and overrides a `describe()` method while still including the base description.**
```javascript
class Employee {
  constructor(name) { this.name = name; }
  describe() { return `${this.name} is an employee.`; }
}
class Manager extends Employee {
  constructor(name, teamSize) {
    super(name);
    this.teamSize = teamSize;
  }
  describe() {
    return `${super.describe()} Manages a team of ${this.teamSize}.`;
  }
}
```

**9. What does this code log, and why?**
```javascript
const arr = [];
console.log(arr.length || 10);
console.log(arr.length ?? 10);
```
Both log `0`. `arr.length` is `0` (falsy but not nullish), so `||` incorrectly treats it as "missing" — but in this specific case `10` is NOT logged because `0 || 10` evaluates to `10`... actually walk through it: `0 || 10` → `10` (first line logs `10`), `0 ?? 10` → `0` (second line logs `0`, since `0` is not nullish). This is the classic gotcha demonstrating why `??` is safer for numeric defaults.

**10. Why might a project still run code through Babel even when targeting only modern evergreen browsers?**
JSX (React) and framework-specific template syntax (Vue) are not part of ECMAScript and always require a build step regardless of target browser; teams may also want a single build pipeline that works across web and React Native (which uses a different engine) without maintaining separate toolchains.
