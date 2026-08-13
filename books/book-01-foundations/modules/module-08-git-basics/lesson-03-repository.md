cat > lesson-03-repository.md << 'EOF'
# Lesson 03: Repository

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a Git repository actually is.
- Understand the role of the hidden `.git` folder.
- Distinguish between tracked, untracked, and ignored files.

---

# Introduction

You've used the word "repository" (or "repo") constantly throughout this roadmap already. This lesson makes sure you understand exactly what it means at a technical level, not just as a vague term for "a project on GitHub."

---

# What Is a Repository?

A **repository** is a project folder that Git is tracking — containing not just your current files, but the *entire history* of every change ever committed to those files. Creating a repository is as simple as running one command inside any folder:

```bash
git init
```

This creates a hidden `.git` folder inside your project — this folder *is* the repository, technically speaking. It contains the complete history, all branches, all commits, and all configuration Git needs.

---

# The Hidden `.git` Folder

```bash
ls -la     # the -a flag reveals hidden files/folders, including .git
```

Inside `.git`, Git stores everything: commit history, branch information, configuration, and the actual compressed snapshots of your files at each commit. You'll almost never need to manually touch anything inside `.git` directly — all of it is managed through Git commands.

**Warning:** deleting the `.git` folder removes all version history permanently, while leaving your current files untouched (since they're separate from the `.git` folder itself).

---

# Tracked, Untracked, and Ignored Files

Every file in a Git repository falls into one of these categories:

- **Tracked** — files Git is actively monitoring for changes (already added/committed at some point).
- **Untracked** — new files Git sees but isn't yet tracking (hasn't been added via `git add`).
- **Ignored** — files explicitly excluded from tracking via `.gitignore` (covered in Module 06), like `node_modules/` or `.env`.

```bash
git status     # shows tracked (modified), untracked, and staged files
```

---

# Practical Example

```bash
mkdir my-repo && cd my-repo
git init                       # creates the .git folder — now a repository
echo "# My Project" > README.md
git status                      # README.md shows as "untracked"
git add README.md                # now staged
git status                        # README.md shows as staged for commit
git commit -m "Initial commit"      # now tracked and committed
```

---

# Revision Questions

1. What command turns a regular folder into a Git repository?
2. What is the `.git` folder, and what happens if you delete it?
3. What's the difference between an untracked file and an ignored file?

<details><summary>Answers</summary>

1. `git init`
2. It's the actual repository data — commit history, branches, configuration. Deleting it permanently removes all version history, though your current files remain untouched.
3. An untracked file is one Git sees but isn't yet monitoring (simply hasn't been added yet); an ignored file is explicitly excluded from tracking altogether via `.gitignore`, so Git won't flag it as untracked either.

</details>
EOF