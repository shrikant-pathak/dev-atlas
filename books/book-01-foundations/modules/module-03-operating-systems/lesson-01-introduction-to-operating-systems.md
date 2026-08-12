# Lesson 01: Introduction to Operating Systems

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what an operating system is and the core problems it solves.
- Explain the relationship between hardware, the OS, and applications.
- Identify the major functions every operating system provides.
- Name the most common operating systems in use today.

---

# Introduction

In Module 01, you learned that a computer is built from hardware — a CPU, RAM, storage, and I/O devices. But hardware alone can't run a web browser or a code editor. Something has to sit between the raw electronics and the software you actually use, translating your clicks and keystrokes into instructions the CPU can execute, and making sure a dozen programs can share the same limited hardware without stepping on each other.

That "something" is the **operating system (OS)** — the most important piece of software on any computer, because every other program depends on it.

---

# What Is an Operating System?

An operating system is system software that manages a computer's hardware and provides services for application programs. Without it, every app would need to know how to directly control the CPU, memory, disk, and screen — an enormous and error-prone burden. The OS abstracts all of that away.

Formally, an OS has three main jobs:

1. **Resource management** — deciding which program gets CPU time, how memory is divided up, and how storage is organized.
2. **Abstraction** — giving programs a simple, consistent way to interact with hardware (e.g., "save this file") without needing to know the physical details of the disk underneath.
3. **User interface** — providing a way for humans to interact with the machine, whether through a graphical desktop or a command line.

---

# The Layered View: Hardware → OS → Applications

Think of a computer as three layers stacked on top of each other: