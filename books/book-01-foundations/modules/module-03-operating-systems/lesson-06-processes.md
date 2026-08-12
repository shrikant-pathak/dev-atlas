# Lesson 06: Processes

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what a process is.
- Explain how an OS runs multiple processes seemingly simultaneously.
- Describe the basic lifecycle of a process.
- Use basic commands to inspect running processes.

---

# Introduction

Every time you open an app — a browser, a code editor, a terminal — the operating system creates a **process** to run it. Understanding processes is central to understanding how your computer manages to run dozens of programs "at once," even though most computers have far fewer CPU cores than the number of programs running.

---

# What Is a Process?

A process is an instance of a running program. It includes:
- The program's code, loaded into memory
- Its own private memory space (so it can't accidentally interfere with other processes)
- Its current state: what instruction it's executing, what data it's working with
- Resources it holds: open files, network connections, etc.

Opening the same application twice (say, two Chrome windows, or two terminal tabs) creates two separate processes, each with their own memory and state.

---

# How Multiple Processes Run "At Once"

Most computers have a limited number of CPU cores — often far fewer than the number of active processes. The OS handles this through **multitasking**: rapidly switching the CPU between processes, giving each a tiny slice of time (milliseconds). This happens so fast it creates the illusion that everything is running simultaneously.

This switching is managed by the OS's **scheduler**, which decides which process gets the CPU next, based on priority and fairness rules.

---

# The Process Lifecycle

A process typically moves through these states:

1. **New** — the process is being created.
2. **Ready** — the process is loaded into memory and waiting for CPU time.
3. **Running** — the process is actively executing on the CPU.
4. **Waiting/Blocked** — the process is paused, waiting on something (like a file read or network response).
5. **Terminated** — the process has finished or been closed.

A process can cycle between Ready, Running, and Waiting many times before eventually terminating.

---

# Practical Example

```bash
# macOS/Linux
ps aux                 # list all running processes
top                     # live view of processes and resource usage
kill 1234               # terminate the process with ID 1234

# Windows (PowerShell)
Get-Process              # list running processes
Stop-Process -Id 1234     # terminate a process by ID
```

Every process has a unique **Process ID (PID)**, which is how the OS and other tools refer to it.

---

# Why This Matters for Web Development

When your Node.js server "hangs" or a build process won't stop, you're dealing directly with process management — finding its PID and killing it is a routine debugging skill. Understanding that each running `npm start` or `node server.js` command is its own OS-level process (with its own memory and lifecycle) demystifies a lot of "why won't this port free up" issues you'll hit later.

---

# Revision Questions

1. What is a process, and how is it different from a program on disk?
2. What is the role of the OS scheduler?
3. What are the main states in a process's lifecycle?

<details><summary>Answers</summary>

1. A process is a running instance of a program, with its own memory and state; the program on disk is just static code until it's loaded and executed.
2. The scheduler decides which process gets CPU time and when, enabling multitasking across more processes than there are CPU cores.
3. New, Ready, Running, Waiting/Blocked, and Terminated.

</details>