# Zsh-Completion

----------------------------------------- 
References
1. [Writing zsh completion for PADRINO][padrino]
1. [zsh completion - the best so far][zsh0]
1. [zsh compsys man page][zshcompsys]
1. [A User's guide to the Z-Shell][zsh1] 
1. [A User's guide to the Z-Shell][zsh2] 
1. help zshzle
1. [mann zshcompwid][zsh3]
1. [zshexpn - zsh expansion and substitution][zshexpn]

The completion scripts are locate in:

```bash
  cd /usr/share/zsh/functions/Completion/Unix
```

You can list the existing widgets by using `zle -l` although often `zle -lL` is 
a better choice since the output format is then the same as the form you would 
use to define the widget.


```bash
  my-widget() {
    zle backward-word
  }
  zle -N my-widget
```
Then you can bind it to a key for example: (ctrl+x)
`bindkey '^x' my-widget` 

## How can we see which widget is being used to complete a command?

```bash
print $_comps[kill]
_kill

print $_comps[takenote]
_takenote.zsh
```

also to find out what is binded to a function press <alt-x> and then
type `where-is` and then type the function name.


# Examples: 

## 1- First list all object files then other files (for rm)
For example, to make the rm command first complete only names of object files 
and then the names of all files if there is no matching object file:

```bash
zstyle ':completion:*:*:rm:*' file-patterns \
    '*.o:object-files' '%p:all-files'
```

## 2- 
-----------------------------------------
2017-10-04 23:41:19

[padrino]: https://wikimatze.de/writing-zsh-completion-for-padrino/
[zsh0]: https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
[zsh1]: http://zsh.sourceforge.net/Guide/zshguide04.html#l103
[zsh2]: http://zsh.sourceforge.net/Guide/zshguide06.html
[zsh3]: https://manned.org/zshcompwid 
[zshexpn]: https://manned.org/zshexpn
[zshcompsys]: https://linux.die.net/man/1/zshcompsys
# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=markdown sw=2 ts=2 et
