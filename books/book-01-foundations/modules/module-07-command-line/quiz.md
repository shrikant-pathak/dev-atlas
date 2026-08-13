cat > quiz.md << 'EOF'
# Quiz — Command Line

## Multiple Choice
1. Which command moves you to your home directory?
   a) cd ..  b) cd ~  c) cd -  d) pwd

2. Which command is used for BOTH moving and renaming a file?
   a) cp  b) rn  c) mv  d) rename

3. What does the `-r` flag mean when used with `cp` or `rm`?
   a) Rename  b) Recursive  c) Read-only  d) Restore

4. What numeric value represents the permission `rwx`?
   a) 5  b) 6  c) 7  d) 4

---

## True / False
1. `rm` sends deleted files to a recoverable trash/recycle bin by default. (True/False)
2. `mkdir -p a/b/c` creates all missing parent folders automatically. (True/False)
3. Packages listed under `devDependencies` are shipped to production. (True/False)

---

## Short Answer
1. Explain the difference between `rmdir` and `rm -r`.
2. What does `grep -rn "text" .` do, broken down flag by flag?
3. Why should most npm packages be installed locally rather than globally?

---

## Coding Questions
1. Write the command to create a file called `app.js` and make it executable.
2. Write the command to search recursively for the word "error" across all `.log` files in the current directory.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-c

**True/False:** 1-False (rm deletes permanently, no trash bin), 2-True, 3-False (devDependencies are development-only, not shipped to production)

**Coding Question 1:**
```bash
touch app.js
chmod +x app.js
```

**Coding Question 2:** `grep -r "error" --include="*.log" .`

</details>
EOF