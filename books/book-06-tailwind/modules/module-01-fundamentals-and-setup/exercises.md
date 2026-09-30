# Module 01 Exercises — Tailwind Fundamentals & Setup

## Exercise 1: Utility-First Translation
Take this traditional CSS rule and rewrite the element using only Tailwind utility classes (no custom CSS):
```css
.alert {
  background-color: #fef2f2;
  border: 1px solid #fecaca;
  border-radius: 0.5rem;
  padding: 1rem;
  color: #991b1b;
}
```
Verify your class list against the official docs if you're unsure of a color/spacing scale name.

## Exercise 2: Install Tailwind Three Ways
Scaffold three tiny throwaway projects and get Tailwind running in each:
1. A Vite + React project, using the Vite plugin
2. A plain HTML file with no bundler, using the standalone CLI
3. A single HTML file using the Play CDN

For each, confirm a simple utility class (`bg-blue-500`) actually renders. Note which method required the least setup, and why you'd never ship the third to production.

## Exercise 3: Find the Preflight Effect
In a fresh Tailwind project, add a bare `<h1>Hello World</h1>` with no classes. Observe how it renders. Then open your browser's dev tools and inspect the computed `font-size` and `font-weight` — explain, in your own words, why they look the way they do given what Preflight does.

## Exercise 4: Break (and Fix) a Dynamic Class
Write a small React or Vue component that takes a `status` prop (`"success"`, `"error"`, `"warning"`) and tries to set the background color using string interpolation (`` bg-${status === 'success' ? 'green' : 'red'}-500 ``). Confirm the styling doesn't apply. Then refactor it to use a lookup object of complete class names, and confirm it now works.

## Exercise 5: Editor Setup Audit
Install the Tailwind CSS IntelliSense extension and the Prettier plugin in a real project. Deliberately write a class list in a scrambled order (e.g., `hover:bg-blue-700 text-white flex p-4`), save the file, and confirm Prettier reorders it automatically. Take a screenshot of the before/after.
