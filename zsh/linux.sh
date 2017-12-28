echoMe $0
export DISPLAY=:0.0

#export ZSH_THEME="blinks"
export ZSH_THEME="agnoster"

eval $( dircolors -b ~/.dircolors)

alias crmdoc="texstudio ~/Dropbox/Work/crmdoc/crmdoc.tex > /dev/null 2>&1 &"
alias sublime='/opt/sublime_text/sublime_text $1> /dev/null 2>&1'
alias sublime='/opt/sublime_text/subl $1> /dev/null 2>&1'
# Use custom shell prompt
autoload -Uz add-zsh-hook
function xterm_title_precmd () {
	print -Pn '\e]2;%n@%m %1~\a'
}

function xterm_title_preexec () {
	print -Pn '\e]2;%n@%m %1~ %# '
	print -n "${(q)1}\a"
}
local dist;
dist=($(lsb_release -a 2>&1 |sed "1d;"| cut -d':' -f2))
stackMsg "${bW}${dist[2]}-${dist[4]} ${dist[5]}${cZ} - Kernel: ${bW}`uname --kernel-release`${cZ}, $OTERM"
unset dist

if [[ $OTERM == 'xterm' || $OTERM == 'xterm-256color' || $OTERM == 'rxvt-256color' || $OTERM == 'screen-256color' ]] && ! isSSH ; then
	source $SCRIPTPATH/zsh/shell-prompt.sh
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
	# echo "--- Shell prompt loaded ---"
else
	export ZSH_THEME="agnoster"
fi
