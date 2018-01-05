#compdef takenote 

# dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
#zle reset-prompt 
#compadd $dir
# comparguments (arg|ARG)/:arg:
# zstyle ":completion:*:descriptions" format "%B%d%b"
# _arguments "1: :(World)"\
#     "2:Countries:(France Germany Italy)"\
#     "*:Cities:((Paris\:France Berlin:\Germany Rome:\Italy))"
# TRAPWINCH() {
#    zle && { zle reset-prompt; zle -R }
# }
# echo $dir
# vared fzf-file-widget
setopt localoptions norcexpandparam extendedglob
autoload -U _tt
function _tt()
{
   
      zle reset-prompt 
      local cur dir
      COMPREPLY=()
      cur="${COMP_WORDS[COMP_CWORD]}"
      dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
      local opts="$dir"
      # COMPREPLY=( $(compgen -f  -- ${cur}) )
      COMPREPLY=$dir
      # zle-line-finish
      return 1
}
#
zle -N _tt
bindkey '^@' _tt
# complete -F _takenote takenote
zstyle ':completion:*' verbose yes
local curcontext="$curcontext" line state ret=1
local all=$(find -L "$HOME/notes/" -print 2> /dev/null)
local dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
SUFFIX=$dir
emulate -LR zsh
# _message Reza     #works!
comp=$dir
# local id=10
# _description $dir id 'action'
# _describe -t values value dir
eval "$_comp_setup"
zle -R "takenote "
# echo -n -e "${bR}Editing${bW}... $BUFFER$cZ "
REPLY=$dir
nmatches=1
compstate[insert]=3
compstate[match]=$dir
# echo $compstate
_lastcomp=( $dir 0 $dir 1 ) 
# RBUFFER=$dir
# compadd $dir 
words[2]=$dir
# compadd  $dir
echo -n "\e[39m"
# autoload -Uz _widgets
# zle execute-named-cmd _tt
local res
res=${dir}
# compset -P '*,'
zle -R ""
zle -M ""
# _values -s , '_tt' '_tt'
bindkey '^T' complete-man
zle -C complete_man expand-or-complete _tt
compadd -U -i "$IPREFIX" -I "$ISUFFIX" -f -Q - $dir
#         '_tt' \ 
# compctl -x _tt
return 1
