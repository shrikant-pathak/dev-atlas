cat > lesson-03-labels-fieldsets-accessibility.md << 'EOF'
# Lesson 03: Labels, Fieldsets & Accessibility Basics

## Learning Objectives
By the end of this lesson, you will be able to:
- Correctly associate labels with form inputs.
- Group related fields using `<fieldset>` and `<legend>`.
- Explain why proper form labeling is a genuine accessibility requirement, not decoration.

---

# Introduction

An input without a properly associated label is a genuine accessibility failure — not a minor style choice. This lesson covers the two correct ways to associate labels, and the semantic grouping elements that make complex forms navigable.

---

# The `<label>` Element

A `<label>` describes what an input field is for — and critically, clicking a properly associated label activates its input (checking a checkbox, focusing a text field), which matters enormously for usability, especially for small checkboxes/radio buttons that are hard to click precisely.

**Method 1 — the `for`/`id` pairing (most explicit, most flexible):**
```html
<label for="username">Username</label>
<input type="text" id="username" name="username">
```
The label's `for` attribute must exactly match the input's `id` attribute.

**Method 2 — wrapping the input directly:**
```html
<label>
  Username
  <input type="text" name="username">
</label>
```
No `for`/`id` needed, since the association is implicit through nesting — but this is less flexible for styling and less common in larger, more structured forms.

---

# Why This Isn't Optional

Without a properly associated label:
- **Screen readers** announce the input with no description at all, or fall back to a generic, unhelpful announcement.
- **Clicking near, but not exactly on, a checkbox/radio button** does nothing — a real usability cost for anyone with limited motor precision, not just an edge case.
- **Placeholder text is not a substitute for a label** — placeholders disappear once the user starts typing, and screen readers often don't treat them the same as a real label at all.

```html
<!-- Bad: placeholder is NOT a label -->
<input type="text" name="username" placeholder="Username">

<!-- Good: proper label AND optional placeholder -->
<label for="username">Username</label>
<input type="text" id="username" name="username" placeholder="e.g. shrikant_dev">
```

---

# Grouping Related Fields: `<fieldset>` and `<legend>`

For forms with logically related groups of fields (like a set of radio buttons, or a shipping address section), `<fieldset>` groups them semantically, with `<legend>` providing a group label:

```html
<fieldset>
  <legend>Choose your plan</legend>
  <input type="radio" name="plan" value="free" id="plan-free">
  <label for="plan-free">Free</label>
  <input type="radio" name="plan" value="pro" id="plan-pro">
  <label for="plan-pro">Pro</label>
</fieldset>
```

Screen readers announce the `<legend>` when entering the fieldset, giving context to every field within it — genuinely useful for radio button groups in particular, where "which question is this answering?" isn't otherwise obvious out of context.

---

# Practical Example

```html
<form action="/signup" method="POST">
  <fieldset>
    <legend>Account Details</legend>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>
  </fieldset>

  <fieldset>
    <legend>Notification Preferences</legend>
    <input type="checkbox" id="email-notif" name="notifications" value="email">
    <label for="email-notif">Email me updates</label>
  </fieldset>
</form>
```

---

# Revision Questions

1. What are the two correct ways to associate a `<label>` with an input?
2. Why is placeholder text not an acceptable substitute for a `<label>`?
3. What does `<fieldset>` + `<legend>` accomplish that individual labels alone don't?

<details><summary>Answers</summary>

1. Using `for` on the label matching the input's `id`, or wrapping the input directly inside the `<label>` element.
2. Placeholder text disappears once the user starts typing, and screen readers often don't treat it equivalently to a real label — leaving the field effectively unlabeled once interacted with.
3. It groups logically related fields together with a shared, announced group description, giving context that individual field labels alone can't provide (especially useful for radio button groups).

</details>
EOF