local BLACK=$(tput setaf 232)
local RED=$(tput setaf 1)
local LIME_YELLOWB=$(tput setab 190)
# Setting up vim mode
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
export KEYTIMEOUT=1
autoload -U colors && colors

if __promptline; then
	__promptline
fi

vim_cmd_mode="%{$RED$LIME_YELLOWB%}[%{$BLACK%} NORMAL %{$RED%}]%{$reset_color%}"
vim_ins_mode=$RPROMPT
vim_mode=$vim_ins_mode;
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	 RPS2=$RPS1
setopt transientrprompt
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# ZLE_RPROMPT_INDENT=0				# this doesn't work on mac
