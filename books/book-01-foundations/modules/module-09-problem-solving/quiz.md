# Quiz — Problem Solving

## Multiple Choice
1. Which of these is NOT one of the three core logic building blocks?
   a) Sequence  b) Selection  c) Recursion  d) Iteration

2. Which flowchart shape represents a decision point?
   a) Oval  b) Rectangle  c) Diamond  d) Parallelogram

3. Which type of bug is usually caught before the program even runs?
   a) Logic error  b) Runtime error  c) Syntax error  d) None of these

4. What is the primary goal of writing pseudocode?
   a) To run directly as code  b) To describe logic clearly without strict syntax rules  c) To replace flowcharts entirely  d) To document finished code only

---

## True / False
1. An algorithm must be tied to a specific programming language to be valid. (True/False)
2. A logic error can cause a program to run without crashing but still produce the wrong result. (True/False)
3. Print debugging (using `console.log()`) is considered an unprofessional or outdated technique. (True/False)

---

## Short Answer
1. Explain, in your own words, the difference between a runtime error and a logic error.
2. Why might a developer choose to write pseudocode before jumping into actual code?
3. Describe the first two steps of a systematic debugging approach.

---

## Coding Questions
1. Write pseudocode for a function that checks whether a number is even or odd.
2. Identify the bug in this pseudocode and explain the fix:

FUNCTION countDown(n)
WHILE n > 0
OUTPUT n
END WHILE
END FUNCTION

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-c, 3-c, 4-b

**True/False:** 1-False (algorithms are language-independent concepts), 2-True, 3-False (it's a simple but genuinely effective and widely used technique)

**Coding Question 1:**

FUNCTION isEven(number)
IF number MOD 2 EQUALS 0 THEN
RETURN true
ELSE
RETURN false
END IF
END FUNCTION

**Coding Question 2:** The bug is that `n` is never decremented inside the loop, causing an infinite loop. Fix: add `SET n TO n - 1` inside the `WHILE` loop.

</details>
