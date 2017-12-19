echoMe $0
# Allow zsh to expand star
unsetopt no_match
# Allow caseincensitive globing
setopt nocaseglob
# autoload predict-on
# predict-on
CASE_SENSITIVE="false"
zstyle ':completion:*' completer _complete

bindkey '\t' expand-or-complete


bindkey '\e.' insert-last-word
compinit -u

autoload -Uz promptinit
promptinit
autoload -U bashcompinit
bashcompinit

# enable automatic rehash
zstyle ':completion:*' rehash true

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")';

# Fix default zstyle for tab completion
zstyle ':completion:*' format ''
zstyle ':completion:*' menu select auto
#proper tabing for directorys ../ is niiice
zstyle ':completion:*' special-dirs true

#nice for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd|grep --color=none -Eo "^[^ ]*"| grep --color=none -Eo "[^/]*$"|sed -e 1d'
#
##tabing for man pages
zstyle ':completion:*:man:*' separate-sections true

# completion
# #if
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete # _correct  _approximate
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/5 )) numeric )'
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#cd into folder only
zstyle ':completion:*:*:cd_wrapper:*:*' file-patterns '*(-/):directories'
# automatic rehash on completion
zstyle ":completion:*:commands" rehash 1
# Adding autocomplete for aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

wm=$(wmctrl -m|awk 'NR==1{print $2}')
if [[ "$wm" == "i3" ]]; then
   source $SCRIPTPATH/zsh/completion/i3_completion.sh
   APPS+="$APP_SEP ${bW}i3${cZ} "
fi

compdef s=sudo
compdef dq=dpkg-reconfigure
compdef kk=pkill
compdef _path_commands mank
compdef _path_commands mann
compdef _path_commands vf
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:vf:*:_path_commands' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#parameter completions for programms that understand --hrlp
compdef _gnu_generic df wc tar make date mv cp grep sed feh awk tail head watch unzip unrar ln ssh diff cdrecord nc strings objdump od

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}
# ctrl+h for help file
bindkey -s '^h' '^Uvim ~mydotfiles/help.md^M'
unfunction __fdnote 
__fdnote(){
   # zle-line-init
   # zle-line-finish
   local dir
   dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
   #LBUFFER=$(echo $dir)
   # zle -N zle-line-init
   # zle -N zle-line-init
   # compadd -P '' -p '' $dir
   #zle reset-prompt 
   # _alternative "directories:user directory:($dir)" "options:comma-separated opt: _values -s , $dir"
   # builtin zle redisplay 
	compadd  "$dir" 
   # zle accept-and-menu-complete
   #echo $dir
}
zle -N __fdnote
autoload -Uz __fdnote 
bindkey '^e' __fdnote 
#compdef "_fzf_path_completion ~/notes/$@" takenote

compdef __fdnote takenote
bindkey -s '\es' '^Ugit status^M'
