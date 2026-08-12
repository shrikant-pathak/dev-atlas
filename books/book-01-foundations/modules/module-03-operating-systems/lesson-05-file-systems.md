# Lesson 05: File Systems

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a file system is and why it's necessary.
- Compare the major file systems used by Windows, macOS, and Linux.
- Understand file paths, both absolute and relative.
- Explain basic file permissions.

---

# Introduction

Every file you save — a photo, a code file, a document — needs to be physically stored somewhere on a disk and later retrieved reliably. The system responsible for organizing, naming, storing, and retrieving that data is called a **file system**. Without one, a disk would just be an undifferentiated block of binary data with no way to know where one file ends and another begins.

---

# What a File System Actually Does

A file system handles:
- **Naming** — giving files and folders human-readable names.
- **Organization** — arranging files into a hierarchy of directories (folders).
- **Storage allocation** — tracking which physical parts of the disk are used by which file.
- **Metadata** — storing information about each file: size, creation date, last modified date, and permissions.
- **Retrieval** — quickly locating and reading a file's data when requested.

---

# Common File Systems

| File System | Used By | Notes |
|---|---|---|
| NTFS | Windows | Supports permissions, encryption, large files |
| APFS | macOS | Optimized for SSDs, supports snapshots |
| ext4 | Linux (most distros) | Fast, reliable, widely used on servers |
| FAT32 / exFAT | Cross-platform (USB drives) | Simple, compatible across OSes, but limited features |

---

# File Paths: Absolute vs. Relative

A **path** describes a file's location in the file system hierarchy.

- **Absolute path** — the full path from the root of the file system.
  - macOS/Linux: `/Users/shrikant/projects/dev-atlas/README.md`
  - Windows: `C:\Users\Shrikant\projects\dev-atlas\README.md`
- **Relative path** — a path relative to your current location.
  - If you're inside `dev-atlas/`, the relative path to the README is just `README.md`.
  - `../` means "go up one directory."

Relative paths are used constantly in web development — for example, linking a CSS file from an HTML document (`<link href="./styles/main.css">`).

---

# File Permissions (Unix-based systems)

On macOS and Linux, every file has permissions controlling who can read, write, or execute it, shown in a format like: