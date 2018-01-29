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
	# source $SCRIPTPATH/zsh/shell-prompt.sh
   source $SCRIPTPATH/zsh/powerthemes/reza
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
	# echo "--- Shell prompt loaded ---"
else
	# export ZSH_THEME="agnoster"

   #Fix ram problem due to grep alias
   source $SCRIPTPATH/zsh/powerthemes/xengine
   source $SCRIPTPATH/zsh/bundle/powerlevel9k/powerlevel9k.zsh-theme
   function prompt_ram() {
     local base=''
     local ramfree=0
     if [[ "$OS" == "OSX" ]]; then
       # Available = Free + Inactive
       # See https://support.apple.com/en-us/HT201538
       ramfree=$(vm_stat | /bin/grep "Pages free" | /bin/grep -o -E '[0-9]+')
       ramfree=$((ramfree + $(vm_stat | grep "Pages inactive" | /bin/grep -o -E '[0-9]+')))
       # Convert pages into Bytes
       ramfree=$(( ramfree * 4096 ))
     else
       if [[ "$OS" == "BSD" ]]; then
         ramfree=$(/bin/grep 'avail memory' /var/run/dmesg.boot | awk '{print $4}')
       else
         ramfree=$(/bin/grep -o -E "MemAvailable:\s+[0-9]+" /proc/meminfo | /bin/grep -o "[0-9]*")
         base='K'
       fi
     fi
     "$1_prompt_segment" "$0" "$2" "yellow" "$DEFAULT_COLOR" "$(printSizeHumanReadable "$ramfree" $base)" 'RAM_ICON'
   }
fi

