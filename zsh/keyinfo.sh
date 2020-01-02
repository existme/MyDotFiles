echoMe $0
export KEYTIMEOUT=1
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

zle -N                 cdParentKey
zle -N                 cdUndoKey
zle -N                 deleteLine
zle -N                 deleteToStart
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey
bindkey '^_'           deleteToStart
bindkey "\e"           vi-cmd-mode      # Bind Escape to vi-cmd-mode

# Helper bindings to go to vi-mode
bindkey '^@'           vi-cmd-mode
bindkey -s '^q'        '^@l'            # calling vi-cmd-mod will send cursor
                                        # one character back this is a workaround to fix it

# ctrl+delete                           first go to vi-mode then delete the word and go back to insert mode
bindkey -s '^[[3;5~'   '^qdWi'

# ctrl+z                                first go to vi-mode then undo last change and then go back to insert mode
bindkey -s "^z"        '^qua'

# ctrl+  (currently disabled since it's slow)
# bindkey -s "^[[1;5D"   '^qbi'
# shift+ 
bindkey -s "^[[1;2D"   '^@lBi'
# ctrl+shift+ 
bindkey -s "^[[1;6D"   '^@lBi'

# ctrl+   (currently disabled since it's slow)
# bindkey -s "^[[1;5C"   '^qwi'
# shift+ 
bindkey -s "^[[1;2C"   '^@lWi'
# ctrl+shift+ 
bindkey -s "^[[1;6C"   '^@lWi'

bindkey '\t' expand-or-complete
bindkey '\e.' insert-last-word

# ctrl + back space should kill word
bindkey '^H' backward-kill-word
# alt+h for help file
bindkey -s '^[h' '^Uvim ~m/help.md^M'

# bindkey '^e' __fdnote
# bindkey '\ed' __fdnote

# Use either c-x c-e or Esc-v or c-` (grave) to edit the current line in vim
bindkey -M vicmd v edit-command-line
bindkey "^X^E" edit-command-line
# this is ctrl+grave typed by pressing ctrl+v in insert mode and then pressing ctrl+`
bindkey "" edit-command-line

zle -N _switch_prompt
bindkey "\ew" _switch_prompt

# alt+k        kill the whole line
bindkey '\ek'  kill-whole-line
# alt+s        git status
# bindkey -s '\es' '^Ugit status^M'
bindkey -s '\es' '^Utig status^M'

