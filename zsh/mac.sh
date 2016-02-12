echo "Loading Mac-specific configuration..."

export http_proxy=http://wwwproxy.axis.com:3128
export https_proxy=http://wwwproxy.axis.com:3128
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3
export M2=$M2_HOME/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home

# Custom Paths
export PATH=$M2:$PATH
export ATOM_NODE_URL=http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist
#ZSH_THEME="amuse"

alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias gitall="git config --list | grep alias"
alias gitk="/Applications/SmartGit.app/Contents/Resources/git/bin/gitk &"
bindkey -e 
bindkey '\e\e[C' forward-word 
bindkey '\e\e[D' backward-word

source $SCRIPTPATH/zsh/shell-prompt-mac.sh
