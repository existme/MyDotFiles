echo "Loading Mac-specific configuration..."

export http_proxy=http://wwwproxy.axis.com:3128
export https_proxy=http://wwwproxy.axis.com:3128
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3
export M2=$M2_HOME/bin

# Custom Paths
export PATH=$M2:$PATH
export ATOM_NODE_URL=http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist
#ZSH_THEME="amuse"

alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias gitall="git config --list | grep alias"
alias gitk="/Applications/SmartGit.app/Contents/Resources/git/bin/gitk &"
export IDEAPATH="/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea"
bindkey -e 
bindkey '\e\e[C' forward-word 
bindkey '\e\e[D' backward-word

source $SCRIPTPATH/zsh/powerthemes/reza-min
export NVM_DIR="/Users/rezasa/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
