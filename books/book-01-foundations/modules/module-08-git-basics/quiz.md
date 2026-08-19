# Quiz — Git Basics

## Multiple Choice
1. Who created Git?
   a) Bill Gates  b) Linus Torvalds  c) Mark Zuckerberg  d) Tim Berners-Lee

2. What command creates a new Git repository?
   a) git start  b) git new  c) git init  d) git create

3. Which command creates AND switches to a new branch in one step?
   a) git branch -c  b) git checkout -b  c) git switch -m  d) git merge -b

4. What is GitHub's equivalent of GitLab's "Merge Request"?
   a) Push Request  b) Pull Request  c) Commit Request  d) Branch Request

---

## True / False
1. Git requires an internet connection to make commits. (True/False)
2. A fast-forward merge creates a new merge commit. (True/False)
3. Deleting the `.git` folder removes your project's version history but leaves the current files untouched. (True/False)

---

## Short Answer
1. Explain the purpose of the staging area in Git's commit workflow.
2. What causes a merge conflict, and how would you resolve one?
3. Why might a team require Pull Requests even for small changes?

---

## Coding Questions
1. Write the commands to create a new branch called `fix/typo` and switch to it in one step.
2. Write the commands to stage and commit a file called `notes.txt` with the message "Add project notes".

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-b

**True/False:** 1-False (Git works fully offline; only push/pull need internet), 2-False (fast-forward merges don't create a new commit), 3-True

**Coding Question 1:** `git checkout -b fix/typo`

**Coding Question 2:**
```bash
git add notes.txt
git commit -m "Add project notes"
```

</details>
