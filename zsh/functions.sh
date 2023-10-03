# vim: set filetype=zsh

echoMe $0

# undeclare a function prevent warnings if it wasn't defined before
function unfunc(){
   unset -f $1 &>/dev/null
}

unfunc isSSH
isSSH(){
   export SESSION_TYPE=""
   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
     export SESSION_TYPE=ssh
   # many other tests omitted
   else
     case $(ps -o comm= -p $PPID) in
       sshd|*/sshd) export SESSION_TYPE=ssh;;
     esac
   fi
   [ "$SESSION_TYPE" = "ssh" ] && return 0 || return 1
}

unfunc stackMsg
stackMsg(){
  stack+=( $1 )
  export stack
}

unfunc prepend
function prepend() { while read line; do echo "${1}${line}"; done; }

unfunc echoMsgs
echoMsgs(){
  echo "${cW}░▒▓   ${cZ}"
  local bar="${bgColorBorder}║${reset_color}"
#  echo "${cW}╔══════╦══════╦══════╦══════╦══════╗${cZ}"
  local width_bar=$(printf -- "═%.0s" {1..80})
  echo "${cW}╔$width_bar╗${cZ}"
  # local line="${bgColorBorder}╠══════╬══════╬══════╬══════╬══════╣${reset_color}"

  for s in $stack
  do
    echo -n "${bar}"
    echo -n " $s"
    stripped=$(echo $s | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g")
    len=${#stripped}
    printf -- " %-.0s" {1..$((78-$len))}
    echo " ${bar}"
  done
#  echo "${bgColorBorder}╚══════╩══════╩══════╩══════╩══════╝${reset_color}"
  echo "${bgColorBorder}╚$width_bar╝${reset_color}"
  unset stack
}

unfunc cdUndoKey
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

unfunc cdParentKey
cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

unfunc deleteLine
deleteLine(){
 	zle     	kill-whole-line
   zle      reset-prompt
}

unfunc deleteToStart
deleteToStart(){
 	zle   	backward-kill-line
   zle      reset-prompt
}


unfunc rgrep
function rgrep(){
  grep --color=always -R -i "$1" *;
}

unfunc rfind
function rfind(){
   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: rfind readme ~/git/MyDotFiles"
      return
   fi
   echo "find $2 -iname \"*$1*\"|grep -i \"$1\" --color=always"
   find $2 -iname "*$1*"|grep -i "$1" --color=always
}

unfunc ff
function ff(){
   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: ff ${bY}<partial file name>${cZ}"
      ls -la
      return
   fi
   local fn=$(echo $@|sed 's/\ /\\ /g')
   find -iname "*$fn*"|grep -i "$fn" --color=always
}
unfunc ffb
function ffb(){
   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: ffb ${bY}<partial file name>${cZ}"
      ls -la
      return
   fi
   local fn=$(echo $@|sed 's/\ /\\ /g')
   find -iname "*$fn*"|grep -i "$fn" --color=never
}
# A macro to see the contents of a jar or war file
unfunc lessj
function lessj(){
	if [[ -z $1 ]]; then
		jar tvf *.jar|pygmentize -f "terminal" -l sv -f terminal256 -s|less
	else
		jar tvf $1|pygmentize -f "terminal" -l sv -f terminal256 -s|less
	fi
}
# easy archive extraction either use extract x.tar or extract x.tar "/your/destination
unfunc extract
function extract(){
	if [[ -z ${2+x} ]]; then
		tar xf $1;
	else
		tar xf $1 -C $2;
	fi
}

unfunc __is_slow_storage
#Return “yes” if the repository is on an “nfs” mount
function __is_slow_storage() {
   export STAT_OPT='-L --file-system --format="%T"'
   if [ $OSTYPE == "Darwin" ]; then
      STAT_OPT='-L -f "%HT"'
   fi
   RES=$(stat `echo $STAT_OPT` `echo $1`)

   if [[ $RES == "nfs" || $RES == "cifs" ]]; then
      echo "yes"
   else
      echo "no"
   fi
}

#unfunc git_prompt_info
## Fix  oh-myzsh git prompt slowness issue for some repos
#function git_prompt_info() {
#  local ref
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
#}

# function hh(){
#    # var=("${(f@)$(cat)}")
#    # echo Searching history for \"$var\"
#    #history | grep  | less
#    echo !!
# }

# Search for all installed packages
unfunc aps
function aps(){
   local p=$(apt-cache search . |fzf -e -x --algo=v2 +m --cycle --print-query -q "$1" |tail -n 1|cut -d' ' -f 1)
   [ -n "$p" ] && \
      { apt show $p ; echo "--------[ files ]-------" ; dpkg-query --listfiles $p } | vim +'nnoremap q :q!<enter>' +'set tm=0' +'setf dts' -R -
}

# Search through all installed files via packages
unfunc asf
function asf(){
   local p=$(dpkg -S "*"|fzf -e -x --algo=v2 +m --cycle --print-query -q "$1" --prompt "Executable name:" |tail -n 1|cut -d':' -f 1)
   [ -n "$p" ] && \
      { apt show $p ; echo "--------[ files ]-------" ; dpkg-query --listfiles $p } | vim +'nnoremap q :q!<enter>' +'set tm=0' +'setf dts' -R -
}

# ex open file
# Opens a binary using $1 supplying
#
# ex: alias gg="_ex '/usr/bin/geany' '&>/dev/null &' "
unfunc _ex
function _ex(){
   unsetopt multios
   cmd=$1                                          # The actual command to be executed
   postcmd=$2                                      # could be used for silencing and forking like '&>/dev/null &'
   param=${3:-}                                    # Filename or any prameter

   echo "\n${bP}AliasRunner${cZ}: ${bR}$cmd ${bW}$param ${bB}$postcmd${cZ}"
   (eval "$cmd $param $postcmd")                   # using subshell to hide job information
}

# Gamma handling for future use
# function increase_gamma() {
#     GAMMA_TEMP=$GAMMA_CURRENT
#     (( GAMMA_CURRENT=$GAMMA_TEMP+0.1 ))
#     xrandr --output $DP0 --gamma $GAMMA_CURRENT:$GAMMA_CURRENT:$GAMMA_CURRENT
# }
#
# function decrease_gamma() {
#     GAMMA_TEMP=$GAMMA_CURRENT
#     (( GAMMA_CURRENT=$GAMMA_TEMP-0.1 ))
#     xrandr --output $DP0 --gamma $GAMMA_CURRENT:$GAMMA_CURRENT:$GAMMA_CURRENT
# }
unfunc y
function y(){
   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: y i3"
      return
   fi
   yelp man:$1 &
}

# return file path
#
# Auto
unfunc p
function p(){
    echo `which $1`
}

# view files in path
#
# Auto
unfunc vf
function vf(){
    declare local filepath=$(p $1)
    if [[ $filepath =~ (not found)$ ]]; then
      (
        # It should be done like this otherwise IFS doesn't work
        IFS=: declare -a local arr=($=PATH)
        # Add home to path
        arr+=("$HOME")
        local file
        for p in $arr; do
          file=$p/$1
          if [ -f "$file" ]; then
            grc file $file
            grc ls -la $file
            # removed -q because then the deault will always be n
            read -k 1 -rs "pr?Do you want to edit it? (${bG}Y${cZ}/${bW}n${cZ})"
            echo
            if [[ $pr =~ ^[Nn]$ ]]; then
              exit
            fi
            vim $file
            exit
          fi
        done
        echo "File: ${bY}$1${cZ} ${bR}not found${cZ} in path!"
      )
      return
    else
      grc file $filepath
      grc ls -la $filepath
    fi

    if  [ -z "$(file $filepath|grep -E 'ASCII|UTF')" ]; then
        echo "${vR}Binary$cZ file."
        return
    fi
    vim $filepath
}

# Add a path if it already doesn't exists
unfunc pathadd
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}


# Fix  oh-myzsh git prompt slowness issue for some repos
unfunc git_prompt_info
function git_prompt_info() {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# function hh(){
#    # var=("${(f@)$(cat)}")
#    # echo Searching history for \"$var\"
#    #history | grep  | less
#    echo !!
# }

# simple yes no function, sample usage:
#
# yesno "delete me?"&&echo delete||echo canceled
unfunc yesno
function yesno(){
   local msg
   [[ -z "$1" ]] && msg="Please confirm your choice:" || msg=$1
   local RES=$(echo "YES" "NO" "CANCEL" | smenu -2 "^Y" -1 "^N" -3 "^C" -s "/^N" -m $msg)
   # echo "Result: $RES"
   if [[ "$RES" = "YES" ]]; then
      # echo "${bR}Canceling{$bW}...${cZ}"
      return 0
   fi
   return 1
}

unfunc elocate
elocate() {
   [[ -z "$1" ]] && { echo "elocate searches for executable files\n\nUsage: ${bW}elocate${bB} filename$cZ"; return 0;}
   echo "Searching for [${bY}$1${cZ}] in locate database:\n"
   sudo locate -b "\\$1" | xargs -ri find {} -prune -type f -executable
}

unfunc mank
mank() {
   local man="https://www.mankier.com/1/$1"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}

unfunc mand
mand() {
   local man="https://manpages.debian.org/jump?q=$1"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}

unfunc manm
manm() {
   page=$2
   if [[ -z "$page" ]]; then
      page=1
   fi
   local man="https://manpages.org/$1/$page"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}

unfunc manc
manc() {
   page=$2
   if [[ -z "$page" ]]; then
      page=1
   fi
   local man="https://linux.cn/man$page/$1.$page.html"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}

unfunc mann
mann() {
   local man="https://www.manned.org/$1"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}


#
# Registers a compdef for $1 that calls $apt_pref with the commands $2
# To do that it creates a new completion function called _apt_pref_$2
#
# sample : apt_pref_compdef ai  "install"
apt_pref='apt-get'
apt_pref='aptitude'
apt_upgr='safe-upgrade'

unfunc apt_pref_compdef
apt_pref_compdef() {
    local f fb
    f="_apt_pref_${2}"

    eval "function ${f}() {
        shift words;
        service=\"\$apt_pref\";
        words=(\"\$apt_pref\" '$2' \$words);
        ((CURRENT++));
        test \"\${apt_pref}\" = 'aptitude' && _aptitude || _apt
    }"
    compdef "$f" "$1"
}

unfunc pkg_install
function pkg_install(){
  service='apt-get';
  words=('apt-get' 'install');
  ((CURRENT++))  # this is increasing the level of service!
  _apt
}

unfunc run-bg
function run-bg(){
   local app=$1
   shift
   ( command $app $@ > /dev/null 2>&1 &)
}

alias dolphin="run-bg dolphin"
alias gedit="run-bg gedit"
alias code="run-bg code"
alias thunar="run-bg thunar"
alias geany="run-bg geany"
