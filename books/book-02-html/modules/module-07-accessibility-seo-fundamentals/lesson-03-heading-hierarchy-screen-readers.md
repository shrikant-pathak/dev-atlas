cat > lesson-03-heading-hierarchy-screen-readers.md << 'EOF'
# Lesson 03: Heading Hierarchy & Screen Readers

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain concretely how screen readers use heading hierarchy for navigation.
- Understand landmark navigation alongside heading navigation.
- Test your own pages' accessibility using free, real tools.

---

# Introduction

Module 02, Lesson 01 taught you the *rules* of heading hierarchy. This lesson finally explains the concrete *mechanism* — exactly how a screen reader user actually uses that hierarchy, moment to moment, to navigate a page.

---

# How Screen Reader Users Actually Navigate

A sighted user visually scans a page in seconds — glancing at the layout, spotting a heading of interest, jumping straight there. A screen reader user achieves the *same speed and control* through a completely different mechanism: **heading navigation**.

Screen readers (like VoiceOver on macOS, NVDA/JAWS on Windows) let users press a single key (commonly "H") to jump directly to the next heading on the page, skipping everything in between. Pressing "H" repeatedly cycles through every heading in document order — effectively giving a blind user the same "scan the page structure at a glance" ability a sighted user has, just through hearing instead of sight.

**This is exactly why the rules from Module 02 matter so concretely:**
- Skipping heading levels (e.g., `<h2>` straight to `<h4>`) breaks the logical structure users are navigating by ear.
- Using headings purely for visual size (rather than genuine structure) produces a nonsensical, disorienting outline when navigated this way.

---

# Landmark Navigation

Beyond headings, screen readers also let users jump directly between **landmarks** — exactly the semantic elements from Module 06:

Press a key to cycle through: <header>, <nav>, <main>, <aside>, <footer>

A user can jump straight to `<main>` immediately upon page load, skipping repeated header/navigation content entirely — this is the concrete mechanism behind the "skip to main content" benefit mentioned in Module 06, Lesson 03.

---

# Combining Both Navigation Modes

An experienced screen reader user typically combines both: landmark navigation to jump to the right general area of the page (e.g., `<main>`), then heading navigation within that area to find the specific section they want — mirroring, almost exactly, how a sighted user's eyes first find the right region of a page, then scan headings within it.

---

# Testing Your Own Pages

You don't need to be blind to test this yourself — genuinely useful, free tools exist:

- **Built-in screen readers** — macOS includes VoiceOver (Cmd+F5 to toggle); Windows includes Narrator. Try navigating one of your own pages with the display turned off, using only heading/landmark navigation.
- **Browser DevTools Accessibility panel** — Chrome and Firefox DevTools include an "Accessibility" tab showing the exact accessibility tree (the structure assistive technology actually sees), directly alongside the visual DOM you learned about in Book 01.
- **Automated checkers** — browser extensions like axe DevTools or Lighthouse (built into Chrome DevTools) automatically flag common accessibility issues, like missing `alt` text or skipped heading levels.

---

# Practical Example

Open Chrome DevTools on any of your own `dev-atlas` HTML files (once you have some to test) → Lighthouse tab → run an Accessibility audit → review the flagged issues. This is genuinely how professional developers verify accessibility in real projects, not just theoretical best practice.

---

# Revision Questions

1. What key do many screen readers use to jump between headings, and what does this reveal about why heading hierarchy rules matter?
2. What is "landmark navigation," and how does it relate to Module 06's semantic elements?
3. Name one free tool you can use right now to test a page's accessibility.

<details><summary>Answers</summary>

1. Commonly "H" — this reveals that heading hierarchy isn't just a style guideline, but the literal mechanism by which screen reader users scan and understand a page's structure at speed.
2. The ability to jump directly between semantic landmark elements (`<header>`, `<nav>`, `<main>`, `<aside>`, `<footer>`) — this is the exact mechanism behind the accessibility benefits described in Module 06.
3. Any of: built-in OS screen readers (VoiceOver/Narrator), browser DevTools' Accessibility panel, or automated checkers like axe DevTools or Lighthouse.

</details>
EOF
