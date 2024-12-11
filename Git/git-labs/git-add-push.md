# Git Clone - Git Add - Git Push

## 1 - CLI - Clone Remote Repository on Local:
- Create folder on PC for github repositories using CLI: 
```
mkdir github-folder-name
ls = to see the folder.
cd github-folder-name
git clone https://repo
ls = to see the github folder you just cloned.
```

## 2 - CLI - Creating a New File on Local and Pushing to Remote
```
cd github-folder-name
git branch -a
touch new-file
git status
git add .
git status
git commit -m “commit info”
git push origin main
```


## 1 - CLI - How to Create Repo on Local:
- Git init will initialize your directory by installing the git dependencies.
- You need to create a file after initializing your directory.
- And also add and commit the file to your local repository.
- Now, rename the master directory to use main.
```
mkdir coderepo
cd coderepo 
echo learning about git > file1
git init
git status
git add file1
git status
git commit -m "first commit"
git branch -M main
```

## 2 - How to Push Existing Repo to Remote:
- Create a repository on GitHub with the same name of the initialized directory.
- Now add the remote repository to your local repository.
- List repositories and now you can push to the remote repository.
```
git remote add origin https://repo
git remote show origin
git push 
```

## 3 - How to Push a Branch to Remote:
- Create a branch from your main branch.
- List branches
- Now push the branch to remote.
```
git checkout -b dev_b
git branch -a
git push origin main:dev_b
```

## 3 - GIT MERGE - BRANCH
- A branch is a copy of the main branch.
- Now, you can edit the code on the branch and commit. 
- Then checkout to the main branch before merging.
- You can use git diff to compare both branches.
- In a case of merging conflict, open the file and edit it, then commit.
```
nano codefile
git add .
git commit -m "updated codefile"
git checkout main
git diff
git merge dev_b
```