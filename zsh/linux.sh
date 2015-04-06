echo "Loading Linux-specific configuration..."

export DISPLAY=:0.0

export ZSH_THEME="blinks"

eval $( dircolors -b ~/.dircolors)

export PATH=$PATH:'/opt/argy11/bin'
alias crmdoc="texstudio ~/Dropbox/Work/crmdoc/crmdoc.tex > /dev/null 2>&1 &"
alias sublime='/opt/sublime_text/sublime_text > /dev/null 2>&1 &'
# Use custom shell prompt

print $OTERM
if [[ $OTERM == 'xterm' ]]; then
	source $SCRIPTPATH/zsh/shell-prompt.sh
else
	echo "Shell prompt not loaded"
	export ZSH_THEME="norm"
fi
