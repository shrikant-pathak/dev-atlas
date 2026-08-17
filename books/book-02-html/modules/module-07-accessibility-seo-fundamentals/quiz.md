cat > quiz.md << 'EOF'
# Quiz — Accessibility & SEO Fundamentals

## Multiple Choice
1. What is the "First Rule of ARIA"?
   a) Always add ARIA to every element  b) Use native HTML first, ARIA only to fill gaps  c) ARIA replaces semantic HTML  d) ARIA is only for forms

2. What format does Google recommend for structured data?
   a) XML  b) CSV  c) JSON-LD  d) YAML

3. Which meta tag controls social media link preview images?
   a) `<meta name="description">`  b) `<meta property="og:image">`  c) `<link rel="icon">`  d) `<meta name="robots">`

4. What key do many screen readers use to jump between headings?
   a) Tab  b) H  c) Space  d) Arrow keys

---

## True / False
1. `aria-hidden="true"` removes an element visually from the page. (True/False)
2. Structured data directly changes how a page looks to sighted users. (True/False)
3. "Click here" is considered poor anchor text for both SEO and accessibility. (True/False)

---

## Short Answer
1. Explain the difference between `aria-label` and `aria-labelledby`.
2. What does `<meta name="robots" content="noindex, nofollow">` do?
3. Name two things beyond HTML structure that affect real-world SEO.

---

## Coding Questions
1. Write an `aria-label` for an icon-only "menu" button.
2. Write a `<meta name="robots">` tag that prevents a page from being indexed.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-b

**True/False:** 1-False (only hides it from assistive technology, remains visually visible), 2-False (it's a machine-readable data layer, doesn't affect visual rendering), 3-True

**Coding Question 1:** `<button aria-label="Menu">☰</button>`

**Coding Question 2:** `<meta name="robots" content="noindex, nofollow">`

</details>
EOF