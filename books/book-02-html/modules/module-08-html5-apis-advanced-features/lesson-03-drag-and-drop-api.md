cat > lesson-03-drag-and-drop-api.md << 'EOF'
# Lesson 03: Drag & Drop API

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what the native Drag & Drop API provides.
- Identify the HTML attribute and events involved.
- Recognize the difference between HTML's role and JavaScript's role in this feature.

---

# Introduction

This lesson previews the **Drag and Drop API** — a genuinely native HTML5/browser capability, not something requiring an external library, for building drag-and-drop interfaces (reordering lists, dragging files into an upload zone, Kanban-style boards).

---

# The HTML Side: `draggable`

The only piece of this feature that's pure HTML is a single attribute:

```html
<div draggable="true">Drag me</div>
```

`draggable="true"` (a boolean-style attribute, Module 01, Lesson 03) marks an element as capable of being dragged. Without it, an element cannot be picked up for dragging at all, regardless of any JavaScript written for it.

**A relevant detail:** images and links are draggable by default in most browsers, even without this attribute explicitly set — you'd need `draggable="false"` to disable that default behavior if it interferes with custom drag logic.

---

# The JavaScript Side (Preview Only)

The actual drag-and-drop *behavior* — what happens when dragging starts, what happens when something is dropped, and where — is controlled entirely through JavaScript event listeners (full depth in Book 04). This is just enough to recognize the pattern when you encounter it later:

```html
<div id="drag-item" draggable="true">Drag me</div>
<div id="drop-zone">Drop here</div>

<script>
  const dragItem = document.getElementById('drag-item');
  const dropZone = document.getElementById('drop-zone');

  dragItem.addEventListener('dragstart', (e) => {
    e.dataTransfer.setData('text/plain', 'dragged-item');
  });

  dropZone.addEventListener('dragover', (e) => {
    e.preventDefault(); // required to allow dropping
  });

  dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    console.log('Item dropped!');
  });
</script>
```

---

# The Relevant Drag & Drop Events (For Recognition, Not Mastery Yet)

| Event | Fires when |
|---|---|
| `dragstart` | Dragging begins on the draggable element |
| `dragover` | A dragged item is being moved over a potential drop target |
| `drop` | A dragged item is released over a valid drop target |
| `dragend` | Dragging operation finishes (successfully or not) |

You don't need to memorize these yet — the goal here is recognizing that this is a native browser capability with a specific, standardized set of events, so when you meet it properly in Book 04, it won't feel like an entirely unfamiliar topic.

---

# HTML's Role vs. JavaScript's Role — A Recurring Pattern

This lesson highlights a pattern you've now seen repeatedly throughout Book 02: HTML provides the *hook/attribute* (`draggable`), while JavaScript provides the actual *logic and behavior*. The same division of responsibility you saw with `<button type="button">` (Module 04) needing JavaScript to actually do anything meaningful, or `<dialog>` (Module 06) needing JavaScript to open/close it programmatically.

---

# Practical Example

```html
<ul id="task-list">
  <li draggable="true">Design homepage</li>
  <li draggable="true">Write documentation</li>
  <li draggable="true">Fix login bug</li>
</ul>
```
This HTML alone marks each task as draggable — a real, working foundation for a reorderable to-do list, which you'll bring fully to life with JavaScript in Book 04.

---

# Revision Questions

1. What single HTML attribute makes an element draggable?
2. Are images and links draggable by default, or only with the `draggable` attribute explicitly set?
3. What handles the actual drag-and-drop *behavior* — HTML or JavaScript?

<details><summary>Answers</summary>

1. `draggable="true"`.
2. They are draggable by default in most browsers, even without the attribute explicitly set.
3. JavaScript — HTML only provides the `draggable` attribute marking an element as capable of being dragged; the actual behavior (what happens on drag/drop) is handled via JavaScript event listeners.

</details>
EOF