# Module 10 Quiz

1. What does `data-bs-theme="dark"` actually change under the hood?
   a) It loads a separate dark.css file  b) It redefines Bootstrap's CSS custom property values  c) It adds a `.dark` class to every element  d) It disables all component styling
   **Answer: b) It redefines Bootstrap's CSS custom property values**

2. Can `data-bs-theme` be scoped to something smaller than the whole page?
   a) No, it must be on `<html>`  b) Yes, it can be applied to any container element  c) Only to `<body>`  d) Only via JavaScript
   **Answer: b) Yes, it can be applied to any container element**

3. What is `prefers-color-scheme`?
   a) A Bootstrap-only JavaScript function  b) A standard CSS media feature reflecting OS-level theme setting  c) A jQuery plugin  d) An HTML attribute
   **Answer: b) A standard CSS media feature reflecting OS-level theme setting**

4. What does `window.matchMedia('(prefers-color-scheme: dark)').matches` return?
   a) A string  b) A boolean  c) A CSS object  d) undefined
   **Answer: b) A boolean**

5. In a custom color mode's CSS rule, what selector pattern is used?
   a) `.data-bs-theme-custom`  b) `[data-bs-theme="custom-name"]`  c) `#custom-name`  d) `data-bs-theme(custom-name)`
   **Answer: b) `[data-bs-theme="custom-name"]`**

6. What's the risk of overriding only `--bs-primary` for a custom mode, without touching derived variables?
   a) Nothing, it always fully re-themes everything  b) Some component internals use more specific Sass-derived variables that won't recalculate at runtime  c) It will throw a JavaScript error  d) Buttons will disappear entirely
   **Answer: b) Some component internals use more specific Sass-derived variables that won't recalculate at runtime**

7. What does `localStorage` provide that a normal JavaScript variable does not?
   a) Faster performance  b) Persistence across page reloads and browser restarts  c) Automatic encryption  d) Server-side syncing
   **Answer: b) Persistence across page reloads and browser restarts**

8. In the full theme-resolution priority order, which is checked first?
   a) System preference via matchMedia  b) A saved manual preference in localStorage  c) A random default  d) The current time of day
   **Answer: b) A saved manual preference in localStorage**

9. Why does clicking "Auto" call `localStorage.removeItem('theme')` rather than setting a value?
   a) It's a bug workaround  b) "Auto" isn't a real theme value; clearing the saved preference lets system detection take over  c) It resets all Bootstrap settings  d) It has no effect
   **Answer: b) "Auto" isn't a real theme value; clearing the saved preference lets system detection take over**

10. Why should the initial theme script run as an IIFE in the `<head>`?
    a) It's required syntax  b) To avoid a flash of the wrong theme before the page content renders  c) It makes the script run faster  d) It's not actually necessary
    **Answer: b) To avoid a flash of the wrong theme before the page content renders**
