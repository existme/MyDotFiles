echo "Loading Linux-specific configuration..."

export DISPLAY=:0.0

#export ZSH_THEME="blinks"
export ZSH_THEME="agnoster"

eval $( dircolors -b ~/.dircolors)

export PATH=$PATH:'/opt/argy11/bin'
alias crmdoc="texstudio ~/Dropbox/Work/crmdoc/crmdoc.tex > /dev/null 2>&1 &"
alias sublime='/opt/sublime_text/sublime_text $1> /dev/null 2>&1'
alias sublime='/opt/sublime_text/subl $1> /dev/null 2>&1'
# Use custom shell prompt

echo $OTERM
if [[ $OTERM == 'xterm' || $OTERM == 'xterm-256color' || $OTERM == 'rxvt-256color' ]]; then
	source $SCRIPTPATH/zsh/shell-prompt.sh
	#echo "--- Shell prompt loaded ---"
else
	echo "Shell prompt not loaded"
	export ZSH_THEME="norm"
fi
