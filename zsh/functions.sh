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

unfunc echoMsgs
echoMsgs(){
  echo
  echo "${cW}░▒▓   ${cZ}"
  local bar="${bgColorBorder}║${reset_color}"
  echo "${cW}╔══════╦══════╦══════╦══════╦══════╗${cZ}"
  echo ${bar====bar}
  echo "${bgColorBorder}╚══════╩══════╩══════╩══════╩══════╝${reset_color}"
  # local line="${bgColorBorder}╠══════╬══════╬══════╬══════╬══════╣${reset_color}"

  for s in $stack
  do
    echo $s
  done
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

unfunc git_prompt_info
# Fix  oh-myzsh git prompt slowness issue for some repos
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

# Search for all installed packages
unfunc as
function as(){
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
   locate -b "\\$1" | xargs -ri find {} -prune -type f -executable
}

unfunc mann
mann() {
   local man="https://www.manned.org/$1"
   echo "${bY}Opening ${bW}$man${cZ} for ${bB}'$1'${cZ} command."
   xdg-open $man > /dev/null 2>&1
}

unfunc mank
mank() {
   local man="https://www.mankier.com/1/$1"
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
