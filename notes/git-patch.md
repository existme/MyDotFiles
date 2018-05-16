# Git-Patch.Md

----------------------------------------- 

## Create patch from uncommitted but staged changes (See [src][r1])

``` bash
git diff --cached > /tmp/my.patch
```

or use `--binary` if you have a binary file like mp3 or pic:

``` bash 
git diff --cached --binary > /tmp/my.patch
```

then you can later apply the patch:

``` bash
git apply /tmp/my.patch
```

[r1]: https://stackoverflow.com/a/15438863/161312
-----------------------------------------
2018-05-14 21:58:38
