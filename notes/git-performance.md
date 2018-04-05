# Git-Performance.Md

----------------------------------------- 
## create orphan branch and keep git configuration
``` bash
git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit
git branch -D master  # Deletes the master branch
git branch -m master  # Rename the current branch to master
git push -f origin master  # Force push master branch to github
git gc --aggressive --prune=all     # remove the old files
```
## create a new branch with one commit that adds everything in HEAD.

``` sh
git branch new_branch_name $(echo "commit message" | git commit-tree HEAD^{tree})
```
-----------------------------------------
2018-04-03 12:07:21
