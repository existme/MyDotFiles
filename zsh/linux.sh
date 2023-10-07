echoMe $0
# export DISPLAY=:0.0

eval $( dircolors -b ~/.dircolors)

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

if [ -n "$NO_ZSH_THEME" ]; then
   # kafeitu bira gentoo kafeitu lukerandall michelebologna obraun
   # mortalscumbag ys

   export ZSH_THEME="powerlevel10k/powerlevel10k"
   echoP "${bR}Not using any theme${cZ}"
   source $ZSH/oh-my-zsh.sh   
elif [[ $OTERM == 'xterm' || $OTERM == 'xterm-256color' || $OTERM == 'rxvt-256color' || $OTERM == 'screen-256color' ]] && ! isSSH ; then
#	 source $SCRIPTPATH/zsh/shell-prompt.sh
   echoP "${plugin}oh-my-zsh.sh"
   plugins=(git git-extras sudo history history-substring-search debian last-working-dir compleat)
   source $ZSH/oh-my-zsh.sh
   echoP "${plugin}powerlevel10k.zsh-theme"
   source $SCRIPTPATH/zsh/powerthemes/reza-p10
   source $SCRIPTPATH/zsh/bundle/powerlevel10k/powerlevel10k.zsh-theme
   add-zsh-hook -Uz precmd xterm_title_precmd
   add-zsh-hook -Uz preexec xterm_title_preexec
	# echo "--- Shell prompt loaded ---"
else
	# export ZSH_THEME="agnoster"

   #Fix ram problem due to grep alias"
   source $SCRIPTPATH/zsh/powerthemes/reza-p10
   source $SCRIPTPATH/zsh/bundle/powerlevel10k/powerlevel10k.zsh-theme
fi

