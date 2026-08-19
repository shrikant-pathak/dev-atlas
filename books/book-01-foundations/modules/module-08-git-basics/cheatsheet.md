# 📄 Cheat Sheet — Git Basics

## Setup

| Command | Effect |
|---|---|
| `git --version` | Check Git is installed |
| `git config --global user.name "Name"` | Set your commit name |
| `git config --global user.email "email"` | Set your commit email |

## Repository

| Command | Effect |
|---|---|
| `git init` | Turn current folder into a repo |
| `git clone <url>` | Download an existing repo |
| `git status` | Show tracked/untracked/staged files |

## Staging & Committing

| Command | Effect |
|---|---|
| `git add <file>` | Stage a specific file |
| `git add .` | Stage all changes |
| `git commit -m "message"` | Commit staged changes |
| `git commit --amend` | Edit the last commit |
| `git log --oneline` | View condensed commit history |

## Branching

| Command | Effect |
|---|---|
| `git branch` | List local branches |
| `git branch <name>` | Create a new branch |
| `git checkout <name>` | Switch to a branch |
| `git checkout -b <name>` | Create + switch in one step |
| `git branch -d <name>` | Delete a merged branch |
| `git branch -D <name>` | Force-delete a branch |

## Merging

| Command | Effect |
|---|---|
| `git merge <branch>` | Merge a branch into the current one |
| Conflict markers | `<<<<<<<`, `=======`, `>>>>>>>` |
| Resolve | Edit file → `git add <file>` → `git commit` |

## Remote / GitHub

| Command | Effect |
|---|---|
| `git remote -v` | View configured remotes |
| `git remote add origin <url>` | Connect local repo to GitHub |
| `git push origin <branch>` | Push commits to GitHub |
| `git pull origin <branch>` | Fetch + merge remote changes |

## Branch Naming Conventions

feature/short-description
fix/short-description
chore/short-description
docs/short-description

## Pull Request Lifecycle

Branch → Commit → Push → Open PR → Review → Merge → Delete branch
