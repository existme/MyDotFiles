#Unix environment

-----------------------------------------

## /etc/environment

   
## /etc/profile and /etc/profile.d

   These settings are effective only when X is restarted

## /etc/zsh/zshenv and the others
   
   These settings would be executed on any new terminal

   Order: 

	/etc/zsh/[zshenv, zprofile, zshrc, zlogin]

## From (man zsh):
```bash
FILES
       $ZDOTDIR/.zshenv
       $ZDOTDIR/.zprofile
       $ZDOTDIR/.zshrc
       $ZDOTDIR/.zlogin
       $ZDOTDIR/.zlogout
       ${TMPPREFIX}*   (default is /tmp/zsh*)
       /etc/zsh/zshenv
       /etc/zsh/zprofile
       /etc/zsh/zshrc
       /etc/zsh/zlogin
       /etc/zsh/zlogout    (installation-specific - /etc is the default)
```
	
## PATH
For convenience create a file in `/etc/zsh/mypath` containing:

```bash
# put all paths in the same place
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathadd "/home/existme/bin/"
pathadd "/home/existme/git/MyDotFiles/extras/bin"
pathadd "/home/existme/bini3/"
pathadd "/home/existme/.cargo/bin/"
```

then in `/etc/zsh/zshenv` and `/etc/zsh/mypath` source it:

```bash
source /etc/zsh/mypath
```   
## sudo path

for path to be included when using sudo you should use:

```bash
sudo visudo
```

and add your path to `secure_path`:

```bash
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/existme/bin:/home/existme/bini3:/home/existme/.cargo/bin/"
```

-----------------------------------------
2017-09-10 18:38:49)
