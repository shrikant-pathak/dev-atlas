# Lesson 02: Windows

## Learning Objectives
By the end of this lesson, you will be able to:
- Describe the history and evolution of Microsoft Windows.
- Identify Windows' key features relevant to developers.
- Navigate basic Windows developer tooling (Task Manager, File Explorer, Windows Terminal).

---

# Introduction

Windows is the most widely used desktop operating system in the world, developed by Microsoft since 1985. For most beginner developers, especially outside of Apple's ecosystem, Windows is the first OS they ever code on — so it's worth understanding both its strengths and its quirks from a developer's point of view.

---

# A Brief History

Windows began as a graphical layer on top of MS-DOS in 1985. Over the decades it evolved through major versions — Windows 95 introduced the Start menu and taskbar most people still recognize today; Windows XP became one of the most widely adopted operating systems ever; Windows 10 and 11 modernized the interface and, critically for developers, introduced the **Windows Subsystem for Linux (WSL)** — letting developers run a real Linux environment directly inside Windows.

---

# Key Concepts for Developers

- **File System (NTFS)** — Windows uses NTFS as its primary file system, which supports permissions, encryption, and large file sizes.
- **Drive Letters** — unlike macOS/Linux's single unified folder tree, Windows organizes storage into lettered drives (`C:`, `D:`, etc.).
- **Windows Terminal / PowerShell** — the modern command-line environment for Windows, more powerful than the older Command Prompt (`cmd.exe`).
- **WSL (Windows Subsystem for Linux)** — allows running an actual Linux distribution (like Ubuntu) alongside Windows, widely used by web developers so their local dev environment matches Linux production servers.
- **Task Manager** — shows running processes, CPU/RAM usage, and lets you force-quit unresponsive programs.

---

# The Developer Workflow on Windows

Many modern web developers on Windows don't develop directly in the native Windows command line — they install WSL and effectively run a Linux environment for their actual coding work, while still using Windows for their desktop apps, browser, and editor (like VS Code, which integrates directly with WSL). This gives the best of both worlds: Windows' hardware/driver support and app ecosystem, with a Linux-compatible development environment.

---

# Practical Example

```powershell
# PowerShell commands
Get-Process              # list running processes
Get-ChildItem             # list files in current directory (like 'ls')
New-Item -ItemType Directory -Name "my-project"   # create a folder
```

---

# Revision Questions

1. What file system does Windows use by default?
2. What is WSL, and why do web developers commonly use it?
3. What's the difference between Command Prompt and Windows Terminal/PowerShell?

<details><summary>Answers</summary>

1. NTFS.
2. Windows Subsystem for Linux — it lets developers run a real Linux environment inside Windows, useful because most production servers run Linux, so local development can closely match the deployment environment.
3. Command Prompt (`cmd.exe`) is the older, more limited command-line shell; PowerShell/Windows Terminal is more modern, scriptable, and closer in power to Unix shells.

</details>