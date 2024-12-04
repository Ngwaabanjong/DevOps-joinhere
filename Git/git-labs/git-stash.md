# What is git stash?
- The art of taking off uncompleted files from the working directory and saving them in a stash area. 
- The stash command works like a .gitinore in your working directory. 

## 1 - Steps to stach file:
- Files most be tracked by git to use this option.
- $ git stash                 = (Will delete latest changes) this will help you choose y and n to file you wish to stash. When this operation happens the data is moved to .git/refs in stash@{}. 
- $ git stash list            = stash@{0} WIP on master: {stash id} added (listing stashed files)
- $ git stash show stash@{0}  = will show details {git stash show}
- $ git stash -p              = when you have many files to choose which to stash.

## 2 - Pop Stach files:
- $ git stash pop stash{0}    = bring the changes back to the working directory 
- $ git stash apply stash@{1} = will move the changes back also
- $ cd /.git/refs             = to find the stash location

## Optional 
- These can be use when you want to name your stach actions.
- let's say you have a file called stach, you can stach the file with an identifier name.
- Git stach index stash number will pop it too.
```
git stach -m "stash V1"
git stach list 
git stach --index 0
```

## Delete stash:
- Drop will drop a specific file.
- Clear will clear every stash.
```
git stash drop stash@{0}
git stash clear
```