# CHERRY PICK
- Allow you to pick only a specific commit from a branch and merge it to another branch.
- Cherry pick does not merge the whole branch like git merge or rebase. 

## LAB
## 1 - We are using 2 branches main and dev.
- View main logs. 
```
git log --oneline
```
## 2 - Checkout to dev 
- Update a file and commit.
- View dev logs 
- Copy the commit ID 
```
git checkout dev
git add .
git commit -m "cherry pick file"
git log dev --online
```

## 3 - Checkout to main
- Check status
- Now cherry pick the commit
```
git checkout main
git status
git cherry-pick 3324t34
```
- View main logs to see the picked file.
```
git log --oneline
```

## 4 - Cherry pick multiple files
- Insert multiple commit IDs to pick multiple files.
- This files will be added in the order you put.
```
git cherry-pick 3324t34 5510g28
```
