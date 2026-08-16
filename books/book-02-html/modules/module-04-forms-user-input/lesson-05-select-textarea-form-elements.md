cat > lesson-05-select-textarea-form-elements.md << 'EOF'
# Lesson 05: Select, Textarea & Other Form Elements

## Learning Objectives
By the end of this lesson, you will be able to:
- Build dropdown menus using `<select>` and `<option>`.
- Use `<textarea>` for multi-line text input.
- Use `<datalist>` to provide autocomplete suggestions.

---

# Introduction

Beyond `<input>` and `<button>`, HTML provides a handful of other genuinely important form elements — dropdowns, multi-line text areas, and a lesser-known but useful autocomplete tool. This lesson rounds out your form-building vocabulary.

---

# The `<select>` Dropdown

```html
<label for="country">Country</label>
<select id="country" name="country">
  <option value="">-- Select a country --</option>
  <option value="us">United States</option>
  <option value="in">India</option>
  <option value="uk">United Kingdom</option>
</select>
```

- `<select>` is the container; each `<option>` is one choice.
- The `value` attribute is what's actually submitted; the text between the tags is what the user sees (they can differ — genuinely useful when displayed labels need to be more descriptive than the underlying stored value).
- An empty first `<option value="">` acts as a natural "please choose" placeholder.

**Grouping options:**
```html
<select name="language">
  <optgroup label="Frontend">
    <option value="html">HTML</option>
    <option value="css">CSS</option>
  </optgroup>
  <optgroup label="Backend">
    <option value="node">Node.js</option>
  </optgroup>
</select>
```

**Multiple selection:**
```html
<select name="skills" multiple>
  <option value="html">HTML</option>
  <option value="css">CSS</option>
  <option value="js">JavaScript</option>
</select>
```
`multiple` lets users select more than one option (typically via Ctrl/Cmd+click).

---

# The `<textarea>` Element

For multi-line text input — comments, messages, descriptions:

```html
<label for="message">Message</label>
<textarea id="message" name="message" rows="5" cols="40" placeholder="Type your message..."></textarea>
```

Unlike `<input>`, `<textarea>` is a paired element — any default text goes *between* the opening and closing tags, not in a `value` attribute:

```html
<textarea name="bio">Default bio text here</textarea>
```

`rows` and `cols` suggest initial dimensions (ultimately overridable with CSS, Book 03).

---

# Autocomplete Suggestions: `<datalist>`

A genuinely underused element that pairs a regular text input with a list of suggested (but not restricted) values:

```html
<label for="browser">Favorite browser</label>
<input type="text" id="browser" name="browser" list="browser-options">
<datalist id="browser-options">
  <option value="Chrome">
  <option value="Firefox">
  <option value="Safari">
  <option value="Edge">
</datalist>
```

Unlike `<select>`, the user can still type any free-text value — `<datalist>` just offers suggestions as they type, connected via the input's `list` attribute matching the datalist's `id`. This is genuinely different from `<select>`: it constrains nothing, it only assists.

---

# `<select>` vs. `<datalist>` vs. Radio Buttons

| Situation | Best Choice |
|---|---|
| User must pick exactly one from a fixed list | `<select>` |
| User can pick multiple from a fixed list | `<select multiple>` or checkboxes |
| A small number of visible options (2–5) | Radio buttons (Lesson 02) |
| Free text input, with helpful suggestions | `<input>` + `<datalist>` |

---

# Practical Example

```html
<form action="/feedback" method="POST">
  <label for="topic">Topic</label>
  <select id="topic" name="topic">
    <option value="">-- Choose a topic --</option>
    <option value="bug">Bug Report</option>
    <option value="feature">Feature Request</option>
  </select>

  <label for="browser">Browser</label>
  <input type="text" id="browser" name="browser" list="browser-list">
  <datalist id="browser-list">
    <option value="Chrome">
    <option value="Firefox">
  </datalist>

  <label for="details">Details</label>
  <textarea id="details" name="details" rows="4"></textarea>
</form>
```

---

# Revision Questions

1. What's the difference between an `<option>`'s `value` attribute and its visible text?
2. Why is `<textarea>` a paired element rather than using a `value` attribute like `<input>`?
3. What's the key behavioral difference between `<select>` and `<input>` + `<datalist>`?

<details><summary>Answers</summary>

1. The `value` is what's actually submitted with the form; the text between the tags is what's visually displayed to the user — they can differ.
2. Because its default content can be substantial multi-line text, which is more naturally represented as element content than crammed into a single attribute.
3. `<select>` restricts the user to only the listed options; `<datalist>` merely suggests options while still allowing any free-text value to be entered and submitted.

</details>
EOF