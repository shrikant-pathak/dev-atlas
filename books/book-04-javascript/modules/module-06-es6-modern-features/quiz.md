# Module 06 Quiz: ES6+ Modern Features

1. What keyword is used to import everything from a module as a single namespace object?
   a) `import all`
   b) `import * as`
   c) `import { * }`
   d) `import all from`

2. How many default exports can a single module have?
   a) 0
   b) 1
   c) Unlimited
   d) Depends on the bundler

3. What must a subclass constructor call before using `this`?
   a) `this.init()`
   b) `parent()`
   c) `super()`
   d) Nothing — `this` is always available

4. Which field declaration creates a truly private class member?
   a) `_balance`
   b) `private balance`
   c) `#balance`
   d) `const balance`

5. What does `user?.address?.city` evaluate to if `user.address` is `undefined`?
   a) Throws a TypeError
   b) `null`
   c) `undefined`
   d) `''`

6. Which value does `??` treat as needing a fallback?
   a) `0`
   b) `''`
   c) `false`
   d) `null`

7. What does `count ??= 5` do if `count` is currently `0`?
   a) Sets `count` to `5`
   b) Leaves `count` as `0`
   c) Throws an error
   d) Sets `count` to `undefined`

8. In regex, what does `\d{2,4}` match?
   a) Exactly 2 digits
   b) Exactly 4 digits
   c) Between 2 and 4 digits
   d) 2 or more of any character

9. What does the `g` flag do on a regex?
   a) Makes matching case-insensitive
   b) Finds all matches instead of stopping at the first
   c) Enables multiline mode
   d) Makes `.` match newlines

10. Which ES version introduced optional chaining and nullish coalescing?
    a) ES2015 (ES6)
    b) ES2017
    c) ES2020
    d) ES2022

---

## Answer Key
1. b) `import * as`
2. b) 1
3. c) `super()`
4. c) `#balance`
5. c) `undefined`
6. d) `null`
7. b) Leaves `count` as `0` (0 is not nullish)
8. c) Between 2 and 4 digits
9. b) Finds all matches instead of stopping at the first
10. c) ES2020
