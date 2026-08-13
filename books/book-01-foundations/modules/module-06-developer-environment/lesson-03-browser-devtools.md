cat > lesson-03-browser-devtools.md << 'EOF'
# Lesson 03: Browser DevTools

## Learning Objectives
By the end of this lesson, you will be able to:
- Open and navigate a browser's Developer Tools.
- Use the Elements, Console, and Network panels for debugging.
- Understand why DevTools is one of the most important tools a web developer uses daily.

---

# Introduction

You've already been referencing "DevTools" throughout earlier modules — inspecting network requests, checking cookies, watching the rendering pipeline. This lesson formally introduces it as a core part of your development environment, alongside your code editor.

---

# What Are Browser DevTools?

**DevTools** (Developer Tools) is a built-in suite of debugging and inspection tools included in every modern browser (Chrome, Firefox, Safari, Edge). It lets you inspect and modify a live webpage, monitor network activity, debug JavaScript, and analyze performance — all without leaving the browser.

**Opening DevTools:**
- Right-click anywhere on a page → "Inspect"
- Keyboard shortcut: `Cmd+Option+I` (macOS) or `Ctrl+Shift+I` (Windows/Linux)
- `F12` on most browsers

---

# Core DevTools Panels

- **Elements** — view and live-edit the page's HTML and CSS; changes here are temporary (reset on reload) but excellent for experimenting.
- **Console** — run JavaScript directly against the page, view logged output (`console.log()`), and see error messages.
- **Network** — inspect every HTTP request the page makes, including headers, timing, and response data (used extensively in Modules 04–05).
- **Sources** — view and debug the page's actual JavaScript files, including setting breakpoints to pause code execution.
- **Application** — inspect cookies, local storage, session storage, and cached files (also used in Module 05).
- **Performance** — record and analyze rendering performance, useful for diagnosing slow or janky pages.

---

# A Basic Debugging Workflow

1. Something looks or behaves wrong on a page.
2. Open the **Elements** panel to confirm the HTML/CSS is what you expect.
3. Open the **Console** to check for JavaScript errors.
4. If needed, open **Sources**, find the relevant script, and set a breakpoint to pause execution and inspect variable values at that exact moment.
5. Use **Network** to confirm any API calls are returning the expected data.

This workflow — inspect, check console, set breakpoints — becomes second nature and is one of the most-used skills in real-world development.

---

# Practical Example

```javascript
// Type directly into the Console panel
console.log("Hello from DevTools");
document.body.style.backgroundColor = "lightblue"; // live-edit the page
```

---

# Revision Questions

1. What are two ways to open DevTools in a browser?
2. What's the difference between the Elements panel and the Sources panel?
3. What is a breakpoint, and what panel would you use to set one?

<details><summary>Answers</summary>

1. Right-click → Inspect, or the keyboard shortcut (Cmd+Option+I on macOS, Ctrl+Shift+I on Windows/Linux).
2. The Elements panel shows/edits the live HTML/CSS (changes are temporary); the Sources panel shows the actual JavaScript files and allows debugging with breakpoints.
3. A breakpoint pauses JavaScript execution at a specific line, letting you inspect variable values at that moment; set in the Sources panel.

</details>
EOF