# Zsh-Completion

----------------------------------------- 
References
0 - [zsh completion - the best so far][zsh0]
1 - [A User's guide to the Z-Shell][zsh1] 
2 - [A User's guide to the Z-Shell][zsh2] 
3 - help zshzle
4 = [mann zshcompwid][zsh3]

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

-----------------------------------------
2017-10-04 23:41:19


[zsh0]: https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
[zsh1]: http://zsh.sourceforge.net/Guide/zshguide04.html#l103
[zsh2]: http://zsh.sourceforge.net/Guide/zshguide06.html
[zsh3]: https://manned.org/zshcompwid 

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=markdown sw=2 ts=2 et
