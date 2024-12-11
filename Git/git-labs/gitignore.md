# What is Git Ignore?
- A .gitignore file specifies intentionally untracked files or directories that Git should ignore.

---

### 1. **Blank Lines and Comments**
- **Blank lines** do nothing; they help with readability.
- **Lines starting with `#`** are comments.

**Example:**
```gitignore
# Ignore build files
/build/
```

---

### 2. **Negating a Pattern with `!`**
A `!` at the beginning of a pattern **re-includes** files that were previously excluded.

**Example:**
```gitignore
# Ignore all .log files
*.log

# But include important.log
!important.log
```
- This ignores all `.log` files except `important.log`.

---

### 3. **Directory Matching with `/`**
A slash `/` specifies **directories**.

**Example:**
```gitignore
# Ignore the entire build directory
/build/

# Ignore a specific file in the root directory
/config.yaml
```
- `/build/` ignores the `build` directory.
- `/config.yaml` only ignores `config.yaml` in the root, not in subdirectories.

---

### 4. **Wildcard Patterns**
- `*` matches any characters except `/`.
- `?` matches exactly one character.
- `[a-z]` matches a single character in the specified range.

**Examples:**
```gitignore
# Ignore all .txt files
*.txt

# Ignore files starting with 'temp' and ending with any character and '.log'
temp?.log

# Ignore files starting with 'config' and ending in a letter
config[a-z].json
```
- `*.txt` ignores all `.txt` files.
- `temp?.log` ignores `temp1.log`, `temp2.log`, etc.
- `config[a-z].json` ignores `configa.json`, `configb.json`, but not `config1.json`.

---

### 5. **Double Asterisks `**` for Recursion**
- `**` matches files and directories **at any level**.

**Examples:**
```gitignore
# Ignore all files named 'debug.log' anywhere
**/debug.log

# Ignore everything inside 'logs' folders at any level
logs/**

# Ignore any 'b' file inside an 'a' directory at any depth
a/**/b
```
- `**/debug.log` ignores `debug.log` in any directory.
- `logs/**` ignores everything inside `logs/` folders.
- `a/**/b` ignores `a/b`, `a/x/b`, `a/x/y/b`, etc.

---

### 6. **Combining Patterns**
You can combine patterns to create powerful rules.
- Ignores everything in `docs/` except `README.md`.
**Example:**
```gitignore
# Ignore all files except README.md in the docs directory
/docs/*
!/docs/README.md
- Ignores everything in `docs/` except `README.md`.
```
---

### Practical Example `.gitignore` File:
```gitignore
# Ignore all node_modules directories
node_modules/

# Ignore all log files but keep logs in 'special_logs'
*.log
!special_logs/*.log

# Ignore everything in temp folders but keep README.txt
temp/**/*
!temp/**/README.txt
```
---
