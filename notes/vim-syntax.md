# vim: set filetype=markdown :tw=14
# Vim-Syntax.Md

----------------------------------------- 

## Location of existing mappings:
```bash
vim /usr/share/vim/vim80/filetype.vim
```

## How to set a filetype:

Either use this:

```bash
set syn=desktop
set syn=sh
```
Or add this comment to the top of your file:

```bash
# vim: set filetype=sh :

or

# vim: set filetype=sh 

or

# vim: set ft=sh :
```

if you are reading from stdin you can use the following:

```bash
ls -la | vim +'nnoremap q :q!<enter>' +'set tm=0' +'setf dts' -R -
```
-----------------------------------------
2017-12-23 20:05:38
