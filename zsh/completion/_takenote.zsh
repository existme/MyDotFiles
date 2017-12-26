#compdef takenote

dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
#zle reset-prompt 
#compadd $dir
# comparguments (arg|ARG)/:arg:
zstyle ":completion:*:descriptions" format "%B%d%b"
_arguments "1: :(World)"\
    "2:Countries:(France Germany Italy)"\
    "*:Cities:((Paris\:France Berlin:\Germany Rome:\Italy))"

