# Module 03 Exercises — Strings, Numbers, Dates & Collections

## Exercise 1: Slugify a Title (Lesson 01)
Write a function that takes a string like `"  Hello, World! "` and returns a URL-friendly slug: lowercase, trimmed, spaces replaced with hyphens, punctuation removed (`"hello-world"`).

## Exercise 2: Currency Formatter (Lesson 02)
Write a function that takes a raw string like `"1999.5"` and returns a properly formatted currency string, handling invalid input gracefully (e.g. return `"Invalid amount"` for non-numeric input).

## Exercise 3: Days Until Deadline (Lesson 03)
Write a function that takes a deadline `Date` and returns how many full days remain until it, based on the current date. Then write a second version that never mutates the deadline object passed in.

## Exercise 4: Shopping Cart Totals (Lesson 04)
Given an array of cart item objects (`{ name, price, quantity }`), use `.reduce()` to calculate the grand total, and `.filter()` + `.map()` to produce a list of just the names of items costing more than ₹1000 each.

## Exercise 5: Extract and Rebuild (Lesson 05)
Given a user object `{ id, name, email, password }`, use destructuring and rest to produce a new object containing everything except `password`, in one line.

## Exercise 6: Unique Visitor Counter (Lesson 06)
Given an array of visitor IDs (with duplicates), use a `Set` to count how many unique visitors there were. Then build a `Map` that counts how many times each individual visitor ID appears.

## Exercise 7: Custom Range Iterable (Lesson 07)
Write your own generator function `range(start, end, step)` that yields numbers from `start` to `end`, incrementing by `step` each time, and use it in a `for...of` loop.

## Challenge: Word Frequency Report
Given a paragraph of text, produce a `Map` of each unique word (lowercased, punctuation stripped) to how many times it appears, then log the 3 most frequent words using array sorting.
