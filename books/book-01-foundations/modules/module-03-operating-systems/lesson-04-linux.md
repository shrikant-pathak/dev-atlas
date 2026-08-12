# Lesson 04: Linux

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what Linux is and how it differs from Windows/macOS.
- Understand the concept of Linux "distributions."
- Explain why Linux dominates web servers and cloud infrastructure.

---

# Introduction

If Windows and macOS are the operating systems developers use on their laptops, Linux is the operating system their code actually runs on. The overwhelming majority of web servers, cloud infrastructure (AWS, Google Cloud, Azure), and even the Android phone in your pocket run on Linux or a Linux-based kernel. Understanding it isn't optional for a web developer — it's foundational.

---

# What Is Linux?

Linux is a free, open-source, Unix-like operating system kernel, originally created by Linus Torvalds in 1991. Unlike Windows or macOS, Linux itself is just the **kernel** — the core piece that manages hardware and processes. Complete operating systems are built by combining this kernel with other software, forming what's called a **distribution** (or "distro").

---

# Popular Linux Distributions

- **Ubuntu** — one of the most beginner-friendly distros, widely used for both desktops and servers.
- **Debian** — known for stability, and the base that Ubuntu itself is built on.
- **Fedora** — closely tracks newer software versions, popular among developers wanting cutting-edge tools.
- **CentOS / Rocky Linux / AlmaLinux** — enterprise-focused distros commonly used on production servers.

As a web developer, you'll most commonly encounter **Ubuntu** or **Debian**-based servers when deploying applications.

---

# Why Linux Dominates Servers

1. **Free and open-source** — no licensing costs at scale, which matters enormously when running thousands of servers.
2. **Stability and uptime** — Linux servers can run for months or years without needing a restart.
3. **Security** — a smaller attack surface by default, and a large community rapidly patching vulnerabilities.
4. **Customizability** — a server only needs to run what it needs; Linux lets you strip away anything unnecessary.
5. **Command-line first design** — ideal for automation, scripting, and remote management, which is exactly how servers are operated.

---

# Key Concepts for Developers

- **The Shell** — Linux is typically operated via a command-line shell like `bash` or `zsh` — the same commands you learned in Module 01's Command Line lesson.
- **Package Managers** — Linux distros use package managers to install software, e.g., `apt` (Debian/Ubuntu) or `dnf`/`yum` (Fedora/CentOS).
- **File System Hierarchy** — a single unified tree starting at `/` (root), unlike Windows' separate drive letters.
- **SSH (Secure Shell)** — the standard way developers remotely connect to and control a Linux server from their own machine.

---

# Practical Example

```bash
# Connecting to and managing a remote Linux server
ssh username@your-server-ip     # connect remotely
sudo apt update                 # update package lists (Debian/Ubuntu)
sudo apt install nginx          # install a web server
systemctl status nginx          # check if a service is running
```

---

# Revision Questions

1. What's the difference between the Linux kernel and a Linux distribution?
2. Name two reasons Linux dominates server/cloud infrastructure.
3. What tool do developers typically use to remotely connect to a Linux server?

<details><summary>Answers</summary>

1. The kernel is the core software managing hardware and processes; a distribution combines the kernel with additional software (package managers, utilities, sometimes a GUI) into a complete, usable OS.
2. Any two of: free/open-source (no licensing costs at scale), stability/uptime, strong security, high customizability, command-line-first design suited to automation.
3. SSH (Secure Shell).

</details>