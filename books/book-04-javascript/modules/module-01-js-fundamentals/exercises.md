# Module 01 Exercises — JavaScript Fundamentals

## Exercise 1: First Script (Lesson 01)
Create an `index.html` and a linked `script.js`. In the JS file, log a welcome message to the console, and add a button that shows an `alert()` when clicked.

## Exercise 2: Comment Cleanup (Lesson 02)
Take any 10-line snippet of JavaScript (yours or one from this module) and add comments that explain **why** each non-obvious line exists — not what it does. Then rewrite one multi-statement line into properly separated, semicolon-terminated statements.

## Exercise 3: Scope Investigation (Lesson 03)
Write a small script with a `var` and a `let` both declared inside an `if` block. Log both variable names from outside the block and observe/explain the different results. Then write an array declared with `const` and demonstrate one mutation (e.g. `.push()`) that succeeds and one reassignment attempt that throws an error.

## Exercise 4: Coercion Predictions (Lesson 04)
Without running the code, write down what each of these evaluates to, then check your answers in the console:
```js
"3" + 4;
"3" - 4;
"3" + 4 + 5;
3 + 4 + "5";
Boolean("");
Boolean("0");
[] == false;
```

## Exercise 5: Temperature Converter (Lesson 05)
Write an expression that converts a Celsius temperature to Fahrenheit (`F = C * 9/5 + 32`). Store the result in a variable and log it. Then use a ternary operator to log `"Hot"` if the Fahrenheit value is above 85, otherwise `"Comfortable"`.

## Exercise 6: Grade Calculator (Lesson 06)
Write an `if / else if / else` chain that converts a numeric score (0–100) into a letter grade (A/B/C/D/F) using whatever cutoffs you like. Then rewrite the same logic using a `switch` statement on a range bucket you compute first (e.g. `Math.floor(score / 10)`).

## Exercise 7: FizzBuzz (Lesson 07)
The classic loop exercise: loop from 1 to 30. For each number:
- If divisible by 3, log "Fizz"
- If divisible by 5, log "Buzz"
- If divisible by both, log "FizzBuzz"
- Otherwise, log the number itself

## Challenge: Input Validator
Write a script that takes several test values (`""`, `0`, `"0"`, `null`, `undefined`, `"hello"`, `false`) and, using a loop and truthy/falsy logic, logs whether each one would pass a basic "is this filled in?" check.
