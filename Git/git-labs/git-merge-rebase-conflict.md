# Merge vs Rebase
- Merge works on a 3 way merge
- Rebase uses fast-foward merge
- Merge conflicts occur when the same file is edited on the same section in two branches.

# Lab
## 0 - Create dev_banch
- create directory name it lab1 & cd into the directory
- Initialize git
- Create a file1 and insert data
- Create dev_b and checkout to it.
```
mkdir lab1
cd lab1
git init
echo "Initial commit" > README.md
git commit -m "Initial commit"
git branch
echo "You & I" > file1
git checkout -b dev_b
```

## 1 - Merge Branch
- On dev_b edit file1 and add data (learning git)
- Checkout to main
- Merge branch
- add a commit message and submit.
```
git checkout main
git branch
git merge dev_b
git add .
git commit -m "merging dev"
```

## 2 - Merge Main
- Checkout to dev_b - add line 2. And we love it.
- Make changes to the file and commit.
- Then checkout to main and try to merge.
```
git checkout dev_b
git merge main
nano file1 = 2. And we love it.
git add .
git commit -m "new update"
```

## 3 - Merge Conflict - Solution:
- Checkout to main
- Edit the same line 2. Nice learning.
- try to merge dev_b now.
- Use git diff to compare both branches.
- Now the merge has imported the data from dev_b
- Open the file and edit it manually and commit the changes.
- Check merge logs to see the Conflicted files ID.
- Run status to see the unmerged files.
```
git checkout main
git merge dev_b 
git diff
git log --merge --oneline
nano file1
git status
git add .
git commit -m "merger dev_b"
```

## Merge on main and keep a copy in dev.
```
git checkout main
git merge dev_b --no-ff
```

## Commands:
- Abort will return the merge back to it previous state.
- Git Status will show you the conflict files.
```
git merge --Abort
git status 
```

# Git Rebase
- Git rebase is immutable
- ones you rebase you cannot rollback
- Rebase will create a new id and its not advisable to use when sharing the repository.
```
git rebase dev_b
```