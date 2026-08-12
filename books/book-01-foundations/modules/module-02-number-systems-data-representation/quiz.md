# Quiz — Number Systems & Data Representation

## Multiple Choice
1. What is the base of the hexadecimal number system?
   a) 2  b) 8  c) 10  d) 16

2. Which of these is the correct binary representation of decimal 9?
   a) `1001`  b) `1010`  c) `1100`  d) `0110`

3. How many bits make up one byte?
   a) 4  b) 8  c) 16  d) 32

4. Which character encoding can represent the widest range of characters?
   a) ASCII  b) UTF-8/Unicode  c) Binary  d) Hexadecimal

---

## True / False
1. Computers use binary because it's easier for humans to read. (True/False)
2. 1 KB is equal to exactly 1000 bytes. (True/False)
3. Every hexadecimal digit corresponds to exactly 4 binary bits. (True/False)

---

## Short Answer
1. Explain, in 2–3 sentences, why hexadecimal is commonly used in web development.
2. What problem does Unicode solve that ASCII alone could not?
3. In your own words, describe what "data representation" means in the context of computing.

---

## Coding Questions
1. Write a short function (in JavaScript, or pseudocode if you haven't reached Book 04 yet) that converts a decimal number to its binary string representation.
2. Write a short function that takes a hex color string (e.g., `"#3498DB"`) and returns its individual R, G, B values as decimal numbers.

<details><summary>Answers</summary>

**Multiple Choice:** 1-d, 2-a, 3-b, 4-b

**True/False:** 1-False (it's because of transistor on/off states, not human readability), 2-False (it's 1024 bytes), 3-True

**Coding Question 1 (example, JavaScript):**
```javascript
function decimalToBinary(num) {
  return num.toString(2);
}
```

**Coding Question 2 (example, JavaScript):**
```javascript
function hexToRGB(hex) {
  hex = hex.replace('#', '');
  const r = parseInt(hex.substring(0, 2), 16);
  const g = parseInt(hex.substring(2, 4), 16);
  const b = parseInt(hex.substring(4, 6), 16);
  return { r, g, b };
}
```

</details>