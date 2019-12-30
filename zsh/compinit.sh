echoMe $0
# Allow zsh to expand star
unsetopt no_match
# Allow caseincensitive globing
setopt nocaseglob
# autoload predict-on
# predict-on
CASE_SENSITIVE="false"
zstyle ':completion:*' completer _complete

autoload -Uz   promptinit && promptinit
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit 
zmodload -i    zsh/complist
# enable automatic rehash
zstyle ':completion:*' rehash true

zstyle ':completion:*'                 auto-description 'specify: %d'
zstyle ':completion:*'                 completer _expand _complete _correct _approximate
zstyle ':completion:*::::'             completer _expand _complete _ignored _approximate
zstyle ':completion:*'                 menu select=1   _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*:options' list-colors '=(#b)(--#)([a-zA-Z0-9-]#)*=1;32=1;33=34'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:descriptions'    format $'\e[1;31m-<<\e[0;34m%d\e[1;31m>>-\e[0m'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion::complete:*'       use-cache on
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:warnings'        format 'No matches for: %d'
zstyle ':completion:*:corrections'     format '%B%d (errors: %e)%b'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")';

# Fix default zstyle for tab completion
zstyle ':completion:*' format ''
zstyle ':completion:*' menu select auto
#proper tabing for directorys ../ is niiice
zstyle ':completion:*' special-dirs true

#nice for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd|grep --color=none -Eo "^[^ ]*"| grep --color=none -Eo "[^/]*$"|sed -e 1d'
#
##tabing for man pages
zstyle ':completion:*:man:*' separate-sections true

# completion
# #if
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete # _correct  _approximate
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/5 )) numeric )'
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#cd into folder only
zstyle ':completion:*:*:cd_wrapper:*:*' file-patterns '*(-/):directories'
# automatic rehash on completion
zstyle ":completion:*:commands" rehash 1
# Adding autocomplete for aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -x "$(command -v wmctrl)" ] && wm=$(wmctrl -m|awk 'NR==1{print $2}')

if [[ "$wm" == "i3" ]]; then
   source $SCRIPTPATH/zsh/completion/i3_completion.sh
   APPS+="$APP_SEP ${bW}i3${cZ} "
fi

compdef s=sudo
compdef dq=dpkg-reconfigure
compdef kk=pkill
compdef sc=systemctl
compdef jj=journalctl
compdef _path_commands mank
compdef _path_commands mann
compdef _path_commands vf
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:vf:*:_path_commands' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#parameter completions for programms that understand --hrlp
compdef _gnu_generic df wc tar make date mv cp grep sed feh awk tail head watch unzip unrar ln ssh diff cdrecord nc strings objdump od


alias k=kubectl
source $SCRIPTPATH/zsh/completion/_kube-completion 
complete -F __start_kubectl k

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

__fdnote(){
   local dir
   zle kill-whole-line
   dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m )
   zle .accept-line
}
zle -N __fdnote
zle -C note_complete 'menu-select'  __fdnote
autoload -Uz expand-or-complete-with-dots
complete-history () { compgen -d 0 '' }

autoload edit-command-line; zle -N edit-command-line

_switch_prompt(){source $HOME/bin/,switch-prompt; zle .accept-line }

if [ -e ~/Dropbox/Apps/todotxttdi/todo_completion ]; then
   export TODOTXT_DEFAULT_ACTION=ls
   export TODO_SH="~/Dropbox/Apps/todotxttdi/todo.sh"
   export TODOTXT_CFG_FILE="~/Dropbox/Apps/todotxttdi/todo.cfg"
   # sort todos by priority then by number
   export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
   export TODO_ACTIONS_DIR="$SCRIPTPATH/zsh/addons/todo.actions.d/"
   # todo_completion needs BASH_VERSION to be set
   export BASH_VERSION="4.4.19(1)-release"
   source ~/Dropbox/Apps/todotxttdi/todo_completion
   export BASH_VERSION=
   _todo2()
   {
      local _todo_sh=$TODO_SH
      _todo "$@"
   }
   complete -F _todo2 t
fi

# helper function to search for all packages using fzf
unfunc _aps
function _aps(){
    local CMD=$(echo "$BUFFER" | egrep -o "^[[:space:]]*[^[:space:]]*")        # the first word of buffer, here it should be takenote
    local PARAM=${BUFFER:$(expr $(echo "$CMD" | wc -c) - 1)}                   # the rest of the buffer, parameters supplied

    local p=$(apt-cache search . |fzf -e -x --algo=v2 +m --cycle --print-query -q "$PARAM" |tail -n 1|cut -d' ' -f 1)
    # echo "[$p]"
    compadd -U -- "$p"
    return 0
}

apt_pref_compdef ,pkg-graph "install"
compdef _aps ,pkg-info
