# Lesson 07: Threads

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what a thread is and how it differs from a process.
- Explain the benefits and risks of multithreading.
- Understand why JavaScript is often described as "single-threaded."

---

# Introduction

In the last lesson, you learned that a process is a running program with its own private memory. But within a single process, work can often be split into smaller, independent units called **threads** — and understanding this distinction becomes especially important once you start working with JavaScript, which has a famously particular relationship with threading.

---

# What Is a Thread?

A thread is the smallest unit of execution within a process. A single process can have one thread (single-threaded) or many threads (multithreaded) running concurrently. Unlike separate processes, threads within the same process **share the same memory space** — which makes communication between them fast, but also introduces risk.

Think of a process as a company, and threads as employees within it. All employees (threads) share the same office resources (memory), which makes collaboration easy — but also means one employee's mistake (like corrupting shared data) can affect everyone else in that company.

---

# Process vs. Thread

| | Process | Thread |
|---|---|---|
| Memory | Private, isolated | Shared within the same process |
| Creation cost | Expensive | Cheap |
| Communication | Slower (needs OS-level mechanisms) | Fast (shared memory) |
| Crash impact | Doesn't affect other processes | Can affect other threads in the same process |

---

# Why Multithreading Exists

Multithreading lets a program do multiple things concurrently without the overhead of creating entirely separate processes. A word processor, for example, might use one thread to handle your typing and another to run spell-check in the background — both need access to the same document, so sharing memory (via threads) is far more efficient than using separate processes.

The main risk of multithreading is **race conditions** — bugs that occur when two threads try to read/modify the same shared data at the same time, producing unpredictable results.

---

# JavaScript and the "Single-Threaded" Model

JavaScript, the language you'll spend the most time in as a web developer, is famously **single-threaded** — it executes one operation at a time on a single main thread. This might sound like a limitation, but JavaScript compensates with an **event loop** and **asynchronous operations** (like `fetch` calls or `setTimeout`), which let it handle tasks like network requests without blocking that single thread while waiting.

This is a deep topic you'll cover properly in Book 04 (JavaScript) — but understanding processes and threads now gives you the conceptual foundation to actually understand *why* JavaScript's async model works the way it does, rather than just memorizing syntax.

---

# Revision Questions

1. What is the key difference between a process and a thread in terms of memory?
2. Why is thread creation generally cheaper than process creation?
3. What programming risk is unique to multithreading?

<details><summary>Answers</summary>

1. Processes have private, isolated memory; threads within the same process share memory.
2. Because threads don't require setting up a whole new isolated memory space — they reuse the process's existing memory.
3. Race conditions — unpredictable bugs caused by multiple threads accessing/modifying shared data simultaneously.

</details>