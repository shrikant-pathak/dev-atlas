# Lesson 02: GitHub

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what GitHub is and its role in modern software development.
- Identify GitHub's core features beyond simply hosting code.
- Understand the difference between a local repository and a remote repository.

---

# Introduction

Now that Git itself is clear, this lesson focuses on **GitHub** — the platform where the vast majority of the world's open-source (and much private) code lives, and where you'll actually be pushing your `dev-atlas` project throughout this roadmap.

---

# What Is GitHub?

GitHub is a cloud-based platform for hosting Git repositories, built around collaboration. Beyond just storing your code remotely, it adds:

- **Pull Requests** — a structured way to propose, review, and discuss code changes before merging them (covered in Lesson 07).
- **Issues** — a built-in system for tracking bugs, feature requests, and tasks.
- **Actions** — automation for running tests, builds, and deployments automatically.
- **GitHub Pages** — free static website hosting directly from a repository.
- **Social/discovery features** — stars, forks, followers, making it easy to find and contribute to open-source projects.

---

# Local vs. Remote Repository

- **Local repository** — the Git repository living on your own computer, where you actually make commits.
- **Remote repository** — a copy of that repository hosted elsewhere (like GitHub), used for backup, collaboration, and sharing.

The connection between them:

```bash
git remote -v                          # view configured remote repositories
git remote add origin <repo-url>        # connect a local repo to a GitHub repo
git push origin main                      # send local commits to the remote
git pull origin main                       # fetch and merge remote changes into your local copy
```

`origin` is simply the conventional name given to your primary remote repository — you'll see it constantly in Git commands and tutorials.

---

# Cloning vs. Initializing

There are two common ways a local repository gets connected to GitHub:

- **Cloning** — downloading an existing GitHub repository to your machine, automatically setting up the remote connection:
```bash
  git clone https://github.com/username/repo-name.git
```
- **Initializing + connecting** — starting a brand-new local repository and manually connecting it to an empty GitHub repository (the workflow used to set up `dev-atlas` originally):
```bash
  git init
  git remote add origin https://github.com/username/repo-name.git
```

---

# Why GitHub Specifically Matters for Your Career

Beyond just backing up code, a public GitHub profile often functions as a developer's portfolio — potential employers and collaborators frequently look at your GitHub activity, repositories, and contribution history as evidence of real skill and consistency, which is part of why building `dev-atlas` publicly is genuinely valuable beyond just learning the material.

---

# Revision Questions

1. What does GitHub add on top of plain Git?
2. What's the difference between a local and a remote repository?
3. What's the difference between `git clone` and `git init` + `git remote add`?

<details><summary>Answers</summary>

1. Collaboration features like Pull Requests, Issues, Actions (automation), Pages (hosting), and social/discovery tools — none of which are part of Git itself.
2. A local repository lives on your own machine where you make commits; a remote repository is a hosted copy (e.g., on GitHub) used for backup, sharing, and collaboration.
3. `git clone` downloads an existing GitHub repository and automatically sets up the remote connection; `git init` + `git remote add` starts a new local repository from scratch and manually connects it to an (often empty) GitHub repository.

</details>
