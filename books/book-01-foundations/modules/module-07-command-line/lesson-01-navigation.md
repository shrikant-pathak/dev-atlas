cat > lesson-01-navigation.md << 'EOF'
# Lesson 01: Navigation

## Learning Objectives
By the end of this lesson, you will be able to:
- Confidently move between directories using the command line.
- Understand the concept of the current working directory.
- Use shortcuts to navigate more efficiently.

---

# Introduction

You got a first taste of command-line navigation back in Book 01's very first module. This module goes deeper, building genuine fluency — the kind where you navigate a filesystem via terminal without needing to think about each command individually.

---

# The Current Working Directory

Every terminal session has a **current working directory (CWD)** — the folder you're "standing in" at any given moment. Nearly every command operates relative to this location unless you specify an absolute path.

```bash
pwd    # print working directory — shows your current location
```

---

# Core Navigation Commands

```bash
cd folder-name      # move into a folder (relative path)
cd /Users/name       # move to an absolute path
cd ..                 # move up one directory level
cd ../..               # move up two directory levels
cd ~                    # jump to your home directory
cd -                     # jump back to the previous directory you were in
cd                        # (no argument) also jumps to home directory
```

---

# Listing Contents While Navigating

```bash
ls              # list files/folders in current directory
ls -la          # list all, including hidden files, with detailed info
ls ../          # list contents of the parent directory without moving into it
```

---

# Navigation Shortcuts Worth Memorizing

| Shortcut | Effect |
|---|---|
| `cd ~` | Home directory |
| `cd -` | Previous directory |
| `cd ..` | Up one level |
| Tab key | Auto-complete folder/file names as you type |

The **Tab key** is genuinely one of the highest-leverage habits to build — instead of typing a full folder name, type the first few letters and press Tab to auto-complete it (pressing twice shows all matching options if there's ambiguity).

---

# Practical Example

```bash
pwd                        # /Users/shrikant/Developer
cd dev-atlas                # move into dev-atlas
pwd                          # /Users/shrikant/Developer/dev-atlas
cd books/book-01-foundations   # move two levels deeper at once
cd ../..                        # jump back up two levels
cd -                              # jump back to books/book-01-foundations
```

---

# Revision Questions

1. What is the "current working directory," and what command shows it?
2. What's the difference between `cd ..` and `cd ~`?
3. What does pressing Tab do while typing a command?

<details><summary>Answers</summary>

1. The folder you're currently "in" within the terminal; shown with `pwd`.
2. `cd ..` moves up one directory level relative to where you are; `cd ~` jumps directly to your home directory regardless of where you currently are.
3. It auto-completes the file or folder name you're typing, saving time and reducing typos.

</details>
EOF