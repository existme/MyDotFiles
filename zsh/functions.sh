cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

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
function p(){
    echo `which $1`
}

# view files in path
#
# Auto 
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
            ll $file
            read -k 1 -r "pr?Do you want to edit it?(${bG}y${cZ}/${bW}N${cZ})?" 
            echo
            if [[ ! $pr =~ ^[Yy]$ ]]; then
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
      ll $filepath
    fi
    
    if  [ -z "$(file $filepath|grep ASCII)" ]; then
        echo "${vR}Binary$cZ file."
        return
    fi
    vim $filepath
}

# Add a path if it already doesn't exists
pathadd() {                                                                      
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then                          
        export PATH="${PATH:+"$PATH:"}$1"                                        
    fi                                                                           
} 