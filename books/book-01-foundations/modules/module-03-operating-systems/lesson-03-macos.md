# Lesson 03: macOS

## Learning Objectives
By the end of this lesson, you will be able to:
- Describe macOS's Unix foundation and what that means practically.
- Identify key macOS developer tools and conventions.
- Understand why many web developers prefer macOS.

---

# Introduction

macOS is Apple's desktop operating system, and it holds a special place in web development: because it's built on a Unix foundation, its command line behaves almost identically to Linux — the OS that runs most production web servers. This is a major reason many professional developers choose Mac laptops.

---

# Unix Roots

macOS is built on **Darwin**, an open-source Unix-based operating system. This means the Terminal app on a Mac gives you a shell (by default, `zsh`) with the same core commands you'd use on a Linux server: `ls`, `cd`, `grep`, `chmod`, and so on — all the commands you practiced in Module 01's Command Line lesson work natively here.

This is different from Windows, which historically required extra tooling (like WSL) to get this same Unix-like command-line experience.

---

# Key Concepts for Developers

- **Terminal.app** — macOS's built-in terminal application, running `zsh` by default (as of macOS Catalina onward; older versions used `bash`).
- **Homebrew** — the most popular package manager for macOS, used to install developer tools from the command line (`brew install node`, for example).
- **File System (APFS)** — Apple File System, macOS's modern file system, optimized for SSDs.
- **Finder** — macOS's graphical file browser, equivalent to Windows' File Explorer.
- **Spotlight** — a fast, built-in search tool (Cmd+Space) useful for quickly launching apps or finding files.

---

# Practical Example

```bash
# Common macOS terminal commands
brew install git          # install a package via Homebrew
ls -la                    # list files, including hidden ones
open .                    # open the current folder in Finder
```

---

# Why Many Developers Prefer macOS

1. **Unix compatibility** — commands and scripts behave the same locally as they will on a Linux production server.
2. **Consistent hardware/software** — Apple controls both, generally leading to fewer driver/compatibility issues.
3. **Strong developer tooling ecosystem** — Homebrew, native Terminal, and broad support from most modern frameworks and languages.

This isn't to say Windows or Linux are worse choices — plenty of professional developers use both successfully. But understanding *why* macOS is popular in web dev circles helps explain tutorials and setup guides that assume a Mac.

---

# Revision Questions

1. What underlying system is macOS built on, and why does that matter for developers?
2. What is Homebrew, and what is it used for?
3. Name one command-line similarity between macOS and Linux.

<details><summary>Answers</summary>

1. Darwin, a Unix-based OS — this means macOS's command line closely matches Linux, which is what most production web servers run on.
2. A package manager for macOS, used to install developer tools and software via the command line.
3. Commands like `ls`, `cd`, `grep`, and `chmod` work identically on both.

</details>