# Module 06 Cheatsheet: ES6+ Modern Features

## Modules
```javascript
// Named exports
export const PI = 3.14;
export function square(n) { return n * n; }
import { PI, square } from './file.js';
import { square as sq } from './file.js'; // rename

// Default export
export default function App() {}
import App from './file.js'; // any local name

// Mixed
export default class Cart {}
export const TAX = 0.08;
import Cart, { TAX } from './file.js';

// Namespace import
import * as Utils from './file.js';

// Re-export (barrel file)
export { default as Button } from './Button.js';

// Dynamic import (returns a Promise)
const mod = await import('./heavy.js');
```

## Classes
```javascript
class Animal {
  #secret = 'hidden';         // private field
  static count = 0;           // static field

  constructor(name) {
    this.name = name;
    Animal.count++;
  }

  speak() { return `${this.name} makes a sound`; }

  get info() { return `Name: ${this.name}`; }   // getter
  set info(val) { this.name = val; }            // setter

  static create(name) { return new Animal(name); } // static method
}

class Dog extends Animal {
  constructor(name) {
    super(name);         // must call before using `this`
  }
  speak() {
    return super.speak() + ' (bark!)'; // call parent method
  }
}
```

## Optional Chaining & Nullish Coalescing
```javascript
obj?.prop                 // safe property access
obj?.[key]                 // safe bracket access
obj?.method?.()             // safe method call
value ?? fallback            // fallback ONLY for null/undefined (not 0, '', false)
value ||= fallback // sets value if it's falsy
value &&= fallback // sets value if it's truthy
value ??= fallback // sets value only if it's null/undefined
```

| Operator | Triggers fallback on |
|---|---|
| `\|\|` | any falsy value (`0`, `''`, `false`, `NaN`, `null`, `undefined`) |
| `??` | only `null` or `undefined` |

## RegExp Quick Reference
```javascript
/\d/  \w/  \s/     // digit / word char / whitespace
/\D/  \W/  \S/     // negations of the above
[abc]  [^abc]  [a-z]  // set / negated set / range
a*  a+  a?  a{2,4}    // quantifiers: 0+, 1+, optional, range
^  $                     // start / end anchors
(group)  (?<name>group) // capture group / named capture group

regex.test(str)          // true/false
str.match(/x/g)          // all matches (array of strings)
str.match(/(x)/)         // first match with capture details
str.matchAll(/x/g)       // iterator of full match objects
str.replace(/x/, 'y')    // replace first match
str.replace(/x/g, 'y')   // replace all matches
str.split(/[,;]/)        // split on a pattern
```

## ES Version Highlights
| Version | Key Features |
|---|---|
| ES6 (2015) | let/const, arrow fns, classes, modules, promises, destructuring |
| ES2017 | async/await |
| ES2018 | object spread/rest, named regex groups |
| ES2019 | flat/flatMap, Object.fromEntries |
| ES2020 | optional chaining, nullish coalescing, dynamic import |
| ES2021 | logical assignment (??=, &&=, \|\|=), replaceAll |
| ES2022 | private fields (#x), top-level await |
| ES2023 | toSorted/toReversed/with (non-mutating array methods) |
| ES2026 | Temporal API (Stage 4) |
