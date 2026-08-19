# Lesson 01: Why Accessibility Matters

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what web accessibility means concretely.
- Identify the major categories of disability that affect web use.
- Understand accessibility as a natural extension of everything you've already learned.

---

# Introduction

Accessibility hasn't been a separate afterthought in this book — it's been woven into nearly every module: `alt` text (Module 03), form labels (Module 04), table `scope` (Module 05), semantic landmarks (Module 06). This module makes it the explicit main subject, filling in the remaining gaps and tying every earlier thread together.

---

# What Web Accessibility Actually Means

**Web accessibility (a11y** — "a," then 11 letters, then "y") means building websites usable by people with a wide range of abilities and disabilities. This isn't a narrow, edge-case concern — the World Health Organization estimates over a billion people worldwide live with some form of disability, and accessibility failures directly exclude real users from real content and services.

---

# Major Categories of Disability Affecting Web Use

- **Visual** — blindness, low vision, color blindness. Relies on screen readers, high contrast, zoom, and correct semantic structure (everything from Module 06).
- **Auditory** — deafness, hard of hearing. Relies on captions/transcripts for audio/video content (Module 03, Lesson 05).
- **Motor** — limited fine motor control, tremors, paralysis. Relies on full keyboard navigation (no mouse required), large clickable targets, and properly associated labels (Module 04, Lesson 03).
- **Cognitive** — dyslexia, ADHD, memory or processing differences. Relies on clear structure, consistent navigation, plain language, and avoiding unnecessary complexity.

Many accessibility needs are also **situational or temporary**, not just permanent — a broken arm limiting mouse use, a loud environment making audio unusable without captions, bright sunlight making low-contrast text unreadable. Building accessibly benefits far more people, far more often, than a narrow "disability" framing might suggest.

---

# Accessibility Isn't a New Topic — It's a Culmination

Look back at what you've already learned:

| Earlier Module | Accessibility Connection |
|---|---|
| Module 01 — `class`/`id`, global attributes | `tabindex` for keyboard navigation |
| Module 02 — Headings, `<strong>` vs `<b>` | Screen readers rely on genuine semantic meaning |
| Module 03 — `alt` text, `<iframe title>` | Non-visual content descriptions |
| Module 04 — `<label>`, `<fieldset>` | Forms usable without sight or a mouse |
| Module 05 — `scope`, `<caption>` | Tables navigable linearly by screen readers |
| Module 06 — Semantic landmarks | Skip-to-content, structural navigation |

This module isn't introducing an unfamiliar new discipline — it's naming and formalizing a thread that's been present throughout the entire book, and filling in what's still missing (ARIA, heading hierarchy for screen readers, and more, in the lessons ahead).

---

# The Legal and Business Case (Briefly)

Beyond the ethical case, many countries have legal accessibility requirements for certain types of websites (government services, larger businesses), and inaccessible sites face real legal risk. Beyond compliance, accessible sites also tend to have better SEO (Module 07, later lessons), better usability for everyone, and reach a meaningfully larger audience.

---

# Revision Questions

1. What does "a11y" stand for/reference?
2. Name the four major categories of disability affecting web use.
3. Give an example of a *situational* (not permanent) accessibility need.

<details><summary>Answers</summary>

1. "Accessibility" — "a," followed by 11 letters, followed by "y."
2. Visual, auditory, motor, and cognitive.
3. Any reasonable example: a broken arm limiting mouse use, a loud environment requiring captions instead of audio, bright sunlight making low-contrast text hard to read, a slow internet connection making heavy pages effectively "inaccessible."

</details>
