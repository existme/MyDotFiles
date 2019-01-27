# Setup fzf
# ---------
_fzf_complete_t2() {
  _fzf_complete "--multi --reverse --header-lines=3" "$@" < <(
    ls -al
  )
}

_fzf_complete_t2_post() {
  awk '{print $NF}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_t2 -o default -o bashdefault t2


export FZF_COMPLETION_TRIGGER='~~'
if [[ ! "$PATH" == *$SCRIPTPATH/zsh/completion/plugins/fzf/bin* ]]; then
  export PATH="$PATH:$SCRIPTPATH/zsh/completion/plugins/fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && 
source "$SCRIPTPATH/zsh/completion/plugins/fzf/shell/completion.zsh" #2> /dev/null

# Key bindings
# ------------
source "$SCRIPTPATH/zsh/completion/plugins/fzf/shell/key-bindings.zsh"

local color00='#282828'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'
# export FZF_DEFAULT_COMMAND="find . -type d \( -path '*/\.*' -path $HOME/mnt -path ./.git \)  -prune -o -print 2> /dev/null"
export FZF_DEFAULT_COMMAND="ag --hidden -g '' --path-to-ignore ~/.hgignore"
export FZF_DEFAULT_OPTS="
   -e -x --algo=v2 +m --cycle
  --height 40% --border
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color07,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color08
  --bind 'f2:execute(vim -)+abort'
  --ansi
"
# see man page: https://www.mankier.com/1/fzf#Key_Bindings
#fzf --bind 'f2:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
# FZF configuration                                                              
export FZF_CTRL_T_COMMAND='ag --hidden -g "" --path-to-ignore ~/.hgignore'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_CTRL_T_OPTS="--select-1 --exit-0"                                    
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'" 

# fzf-history-widget() {
#   LBUFFER=$(fc -l 1 | fzf +s +m -n2..,.. | sed "s/ *[0-9*]* *//")
#   zle redisplay
# }
# zle     -N   fzf-history-widget
# bindkey '^E' fzf-history-widget

fzf-find-widget() {
  _fzf_complete '+m' "$2" < <(
    ag "$dir"
  )
}

fzz(){
  _fzf_complete '+m' "$1" < <(
     find -L "$HOME/notes/" 
  )
}
zle      -N    fzz
bindkey '^F'   fzz
#compdef fzz takenote

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
unfunction fzf-open-file-or-dir nul
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf-tmux --exit-0)
  zle .accept-line
  BUFFER=$out
  if [ -f "$out" ]; then
    $EDITOR "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir
# zle -A fzf-open-file-or-dir takenote 

_fzf_complete_t2() {
  _fzf_complete "--multi --reverse --header-lines=3" "$@" < <(
    ls -al
  )
}

_fzf_complete_t2_post() {
  awk '{print $NF}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_t2 -o default -o bashdefault t2
