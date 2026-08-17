cat > quiz.md << 'EOF'
# Quiz — HTML5 APIs & Advanced Features

## Multiple Choice
1. What does `<canvas>` produce by itself, without any JavaScript?
   a) A blue rectangle  b) An empty, invisible drawing surface  c) A grid of pixels  d) An error

2. Which graphics technology produces real, inspectable DOM elements?
   a) Canvas  b) SVG  c) Both  d) Neither

3. Which storage type is cleared when the browser tab closes?
   a) localStorage  b) Cookies  c) sessionStorage  d) None of these

4. What attribute makes an element draggable?
   a) `drag="true"`  b) `draggable="true"`  c) `movable="true"`  d) `drop="true"`

---

## True / False
1. Web Storage data is automatically sent to the server with every HTTP request, like cookies. (True/False)
2. The Geolocation API can access a user's location without any permission prompt. (True/False)
3. SVG graphics scale to any size without quality loss. (True/False)

---

## Short Answer
1. Explain why SVG is generally preferred over canvas for icons and logos.
2. What UX mistake should be avoided when requesting geolocation access?
3. What tool checks an HTML page against the official specification, and why does it matter?

---

## Coding Questions
1. Write an SVG containing a single circle with radius 50, filled green.
2. Write the JavaScript line to store the value "dark" under the key "theme" in localStorage.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-b, 3-c, 4-b

**True/False:** 1-False (Web Storage stays purely client-side), 2-False (permission is always required), 3-True

**Coding Question 1:**
```html
<svg width="120" height="120">
  <circle cx="60" cy="60" r="50" fill="green" />
</svg>
```

**Coding Question 2:** `localStorage.setItem('theme', 'dark');`

</details>
EOF