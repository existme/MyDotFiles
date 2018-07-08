# Git-Dont-Track.Md

----------------------------------------- 
## Keep file in a Git repo, but don't track changes

First change the file you do not want to be tracked and use the following command:

``` bash
git update-index --assume-unchanged FILE_NAME
```

and if you want to track the changes again use this command:

``` bash
git update-index --no-assume-unchanged FILE_NAME
```
-----------------------------------------
2018-07-08 23:19:44
