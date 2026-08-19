# Lesson 02: Algorithms

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what an algorithm is in precise terms.
- Explain the characteristics every good algorithm should have.
- Compare multiple algorithms for the same problem conceptually.

---

# Introduction

The last lesson introduced logic building — breaking a problem into steps. This lesson formalizes that idea into the concept of an **algorithm**, a term you'll hear constantly throughout your development career, especially in technical interviews.

---

# What Is an Algorithm?

An **algorithm** is a precise, finite sequence of steps for solving a specific problem or performing a specific task. A recipe is a good everyday analogy: a defined starting point (ingredients), a precise sequence of steps, and a defined end result (a finished dish).

Importantly, an algorithm is not tied to any particular programming language — like logic building, it's a conceptual description of *how* to solve a problem, which can then be implemented in any language.

---

# Characteristics of a Good Algorithm

- **Finite** — it must eventually terminate, not run forever.
- **Precise/unambiguous** — each step must be clearly defined, with no room for interpretation.
- **Correct** — it must actually produce the right result for all valid inputs, not just some of them.
- **Efficient** — it should use a reasonable amount of time and resources (you'll explore this formally as "Big O notation" in later, more advanced books).

---

# Multiple Algorithms, Same Problem

A key insight: there's often more than one valid algorithm to solve the same problem, and they can differ significantly in efficiency.

**Example: Finding the largest number in a list.**

**Algorithm A (naive):** Compare every number to every other number, keeping track of the largest found so far.

**Algorithm B (efficient):** Walk through the list exactly once, keeping a single "largest so far" variable, updating it whenever a bigger number is found.

Both algorithms produce the correct answer, but Algorithm B does far less work, especially as the list grows larger. This tradeoff between different valid approaches — and reasoning about which is "better" and why — is a core skill you'll develop increasingly as you write more code.

---

# Everyday Algorithm Examples

You interact with algorithms constantly without necessarily calling them that:
- Sorting a deck of cards
- Following a recipe
- A GPS calculating the fastest route
- A search engine ranking results

---

# Revision Questions

1. What is an algorithm, in your own words?
2. Name three characteristics of a good algorithm.
3. Why might two different algorithms that both produce the correct answer still not be equally "good"?

<details><summary>Answers</summary>

1. A precise, finite sequence of steps for solving a specific problem, independent of any particular programming language.
2. Any three of: finite, precise/unambiguous, correct, efficient.
3. They may differ significantly in efficiency — how much time or resources they use, especially as the size of the input grows.

</details>
