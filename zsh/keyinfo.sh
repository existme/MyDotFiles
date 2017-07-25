# If you dont't know what is the code for a key combination, use <ctrl-v> followed by the key sequence
# Enable vi-mode 
if [[ $EDITOR == 'enablevim' ]]; then
	source $SCRIPTPATH/extras/vi-mode.sh
	echo "VI mode ENABLED"
   export EDITOR = 'vim'
fi

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" history-beginning-search-forward
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Fixing history search
# bindkey '\eOA' history-beginning-search-backward
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\eOB' history-beginning-search-forward
# bindkey '\e[B' history-beginning-search-forward


# Custom key bindings for list of all commands see: 
#
# 		http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
#

cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

deleteLine(){
 	zle     	kill-whole-line 
   zle      reset-prompt
}
deleteToStart(){
 	zle   	backward-kill-line 
   zle      reset-prompt
}
zle -N                 cdParentKey
zle -N                 cdUndoKey
zle -N                 deleteLine
zle -N                 deleteToStart
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey
bindkey '^[[3;5~'  	  deleteLine
bindkey '^_'  	  		  deleteToStart 

