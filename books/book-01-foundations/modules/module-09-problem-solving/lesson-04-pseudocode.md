# Lesson 04: Pseudocode

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what pseudocode is and why developers use it.
- Write basic pseudocode for a simple algorithm.
- Translate pseudocode into an actual programming language.

---

# Introduction

Flowcharts represent logic visually; **pseudocode** represents it in structured, code-like text — without needing to follow any specific programming language's exact syntax rules. It's the bridge between "plain English logic" and "actual working code," and a skill you'll lean on constantly, especially once you begin learning JavaScript in Book 04.

---

# What Is Pseudocode?

Pseudocode is an informal, high-level description of an algorithm's logic, written in a structured way that resembles code, but without strict syntax rules. It's meant to be read easily by humans while still capturing precise logical steps — the goal is clarity, not compliance with any language's actual grammar.

---

# Common Pseudocode Conventions

While there's no single official standard, most pseudocode follows familiar patterns:

START
INPUT numbers (a list)
SET largest TO numbers[0]
FOR each number IN numbers
IF number > largest THEN
SET largest TO number
END IF
END FOR
OUTPUT largest
END

Common keywords: `START`/`END`, `INPUT`/`OUTPUT`, `SET`, `IF`/`THEN`/`ELSE`, `FOR`/`WHILE`, `FUNCTION`.

---

# Worked Example: From Problem to Pseudocode to Code

**Problem:** "Check if a given number is prime."

**Step 1 — Plain English logic:**
A number is prime if it's greater than 1 and has no divisors other than 1 and itself.

**Step 2 — Pseudocode:**

FUNCTION isPrime(number)
IF number <= 1 THEN
RETURN false
END IF
FOR i FROM 2 TO number - 1
IF number MOD i EQUALS 0 THEN
RETURN false
END IF
END FOR
RETURN true
END FUNCTION

**Step 3 — Actual JavaScript (a preview of Book 04):**
```javascript
function isPrime(number) {
  if (number <= 1) return false;
  for (let i = 2; i < number; i++) {
    if (number % i === 0) return false;
  }
  return true;
}
```

Notice how closely the actual code mirrors the pseudocode — this is exactly the point. Working out the logic in pseudocode first makes writing the real code afterward far more mechanical and far less error-prone.

---

# Why Pseudocode Matters for Interviews

Technical interviews frequently ask candidates to "talk through your approach" or write pseudocode before diving into actual code — interviewers want to see clear logical thinking *before* worrying about a specific language's exact syntax. This is a real, practical skill worth deliberately practicing.

---

# Revision Questions

1. What is pseudocode, and how does it differ from actual code?
2. Why might a developer write pseudocode before writing real code?
3. In the prime number example, what does the FOR loop's condition check?

<details><summary>Answers</summary>

1. Pseudocode is an informal, structured description of an algorithm's logic, resembling code but without strict syntax rules; actual code must follow a specific language's exact grammar to run.
2. It separates logical thinking from syntax concerns, making it easier to catch flawed logic early and translate correct logic into real code more mechanically.
3. It checks every number from 2 up to (but not including) the number itself, to see if any of them evenly divide it (which would mean it's not prime).

</details>
