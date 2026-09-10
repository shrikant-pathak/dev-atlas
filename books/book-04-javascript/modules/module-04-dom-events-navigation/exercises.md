# Module 04 Exercises — DOM, Events & Navigation

## Exercise 1: Selector Practice (Lesson 01)
Given a page with several `<div class="card">` elements, select all of them with `querySelectorAll`, then again with `getElementsByClassName`. Log both lengths, dynamically add a new `.card` via JavaScript, and log both lengths again to observe the live vs. static difference.

## Exercise 2: Build a Breadcrumb (Lesson 02)
Given a deeply nested element, write a function that walks upward using `.parentElement` and builds an array of each ancestor's tag name, stopping at `<body>`.

## Exercise 3: Toggle-able Accordion (Lesson 03)
Build a simple accordion: clicking a `.accordion-header` should toggle a `.open` class on its next sibling `.accordion-body`. Use event delegation on the accordion's container rather than attaching a listener to each header individually.

## Exercise 4: Login Form Validator (Lesson 04)
Build a login form with `email` and `password` fields. On submit, prevent the default behavior, and show a custom error message if the email fails `checkValidity()` or the password is under 8 characters.

## Exercise 5: Loading Order Experiment (Lesson 05)
Create a page with three scripts: one with no attributes, one with `defer`, and one with `async`, each just logging its own name to the console immediately when it runs. Reload the page a few times and observe (and explain) the difference in logged order between the `defer`/`async` scripts and the plain one.

## Challenge: Delegated Todo List
Build a todo list where clicking an item toggles a "completed" style, and clicking an "×" inside an item removes it entirely — both handled through a single delegated event listener on the list's container, using `closest()` to distinguish the two click targets.
