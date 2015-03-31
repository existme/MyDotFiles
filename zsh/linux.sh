echo "Loading Linux-specific configuration..."

export DISPLAY=:0.0

ZSH_THEME="blinks"

eval $( dircolors -b ~/.dircolors)


alias crmdoc="texstudio ~/Dropbox/Work/crmdoc/crmdoc.tex > /dev/null 2>&1 &"
alias sublime='/opt/sublime_text/sublime_text > /dev/null 2>&1 &'
# Use custom shell prompt
source $SCRIPTPATH/zsh/shell-prompt.sh
