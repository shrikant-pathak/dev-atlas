# Lesson 03: Directories

## Learning Objectives
By the end of this lesson, you will be able to:
- Create, copy, move, and delete directories from the command line.
- Understand the difference between deleting an empty directory and a non-empty one.
- Create nested directory structures in a single command.

---

# Introduction

Directories (folders) organize your files, and just like files, you'll manage them constantly from the command line rather than a graphical file browser once you're comfortable with terminal workflows.

---

# Creating Directories

```bash
mkdir project             # create a single new directory
mkdir -p src/components     # create nested directories in one command (creates 'src' AND 'components' inside it)
```

The `-p` flag ("parents") is especially useful — without it, `mkdir src/components` would fail if `src` didn't already exist. With `-p`, any missing parent directories are created automatically.

---

# Copying and Moving Directories

```bash
cp -r project project-backup     # copy a directory and everything inside it (recursive)
mv project archive/project        # move an entire directory into another folder
```

The `-r` (recursive) flag is required when copying directories — without it, `cp` will refuse, since directories can contain many files and subfolders that all need to be copied too.

---

# Deleting Directories

```bash
rmdir empty-folder         # delete a directory, but ONLY if it's completely empty
rm -r project               # delete a directory and everything inside it, recursively
rm -rf project                # same as above, but forces deletion without confirmation prompts
```

**Critical warning:** `rm -rf` is one of the most dangerous commands in all of computing if used carelessly. It deletes recursively (`-r`) and forcefully (`-f`, skipping confirmations) — always double, even triple-check the path before running it, especially if using wildcards or variables that could expand unexpectedly.

---

# Practical Example

```bash
mkdir -p my-app/src/components      # create nested folder structure in one command
cd my-app
ls -R                                 # list contents recursively, showing the full tree
cd ..
cp -r my-app my-app-backup             # back up the entire project
rm -r my-app-backup                     # remove the backup once no longer needed
```

---

# Revision Questions

1. What's the difference between `rmdir` and `rm -r`?
2. Why does `mkdir -p src/components` succeed even if `src` doesn't already exist, while `mkdir src/components` (without `-p`) would fail?
3. Why is `rm -rf` considered especially dangerous?

<details><summary>Answers</summary>

1. `rmdir` only deletes a directory if it's completely empty; `rm -r` deletes a directory and everything inside it, recursively, regardless of contents.
2. The `-p` flag automatically creates any missing parent directories along the path; without it, `mkdir` expects every parent folder to already exist.
3. Because it deletes recursively and without confirmation prompts, meaning a typo in the path (or an unexpectedly-expanded variable/wildcard) can permanently delete far more than intended, with no warning or undo.

</details>EOF