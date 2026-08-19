# Lesson 05: Permissions

## Learning Objectives
By the end of this lesson, you will be able to:
- Read and interpret Unix file permission strings.
- Change file permissions and ownership using `chmod` and `chown`.
- Understand common permission-related errors and how to resolve them.

---

# Introduction

Module 03 briefly introduced file permissions when discussing file systems. This lesson goes hands-on — actually reading, modifying, and troubleshooting permissions from the command line, a skill you'll need constantly once you start working with servers and deployment.

---

# Reading Permissions

```bash
ls -l
-rwxr-xr-x  1 shrikant  staff  1024 Aug 10 10:00 script.sh
```

Breaking down `-rwxr-xr-x`:
- Position 1: file type (`-` = file, `d` = directory)
- Positions 2–4 (`rwx`): **owner** permissions — read, write, execute
- Positions 5–7 (`r-x`): **group** permissions — read, execute (no write)
- Positions 8–10 (`r-x`): **others** permissions — read, execute (no write)

---

# Permission Values

Each permission can also be represented numerically:

| Permission | Value |
|---|---|
| Read (r) | 4 |
| Write (w) | 2 |
| Execute (x) | 1 |

Add these values together per group. For example, `rwx` = 4+2+1 = **7**, `r-x` = 4+0+1 = **5**, `r--` = 4+0+0 = **4**.

So `rwxr-xr-x` becomes the numeric permission `755` — a number you'll see constantly in server configuration and deployment documentation.

---

# Changing Permissions: `chmod`

```bash
chmod 755 script.sh          # owner: rwx, group: r-x, others: r-x
chmod +x script.sh            # add execute permission for everyone (without changing other permissions)
chmod -x script.sh             # remove execute permission
chmod u+w file.txt               # add write permission for the owner (user) only
```

A common real-world scenario: downloading or writing a shell script and getting a "permission denied" error when trying to run it — usually solved with `chmod +x script.sh` to make it executable.

---

# Changing Ownership: `chown`

```bash
chown shrikant file.txt              # change the file's owner
chown shrikant:staff file.txt         # change both owner and group
```

`chown` typically requires elevated (admin/root) privileges, often run with `sudo`:
```bash
sudo chown shrikant file.txt
```

---

# Practical Example

```bash
touch deploy.sh
ls -l deploy.sh              # -rw-r--r--  (not executable yet)
chmod +x deploy.sh            # add execute permission
ls -l deploy.sh                # -rwxr--r--  (now executable by owner)
./deploy.sh                     # run the script
```

---

# Revision Questions

1. What does the permission string `rw-r--r--` mean in plain English?
2. What numeric value represents `rwx`, and how is it calculated?
3. What command and flag would you use to make a script executable?

<details><summary>Answers</summary>

1. The owner can read and write; the group can only read; everyone else can only read. No one can execute it.
2. 7, calculated as read (4) + write (2) + execute (1).
3. `chmod +x filename`

</details>
