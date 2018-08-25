echoMe $0
# add scripts folder to path variable to use commands like cleanmem
pathadd $SCRIPTPATH/extras/scripts
pathadd $HOME/bin
pathadd $HOME/bin/git-scripts
pathadd /usr/local/bin
pathadd /usr/bin
pathadd /bin
pathadd /usr/sbin
pathadd /sbin
pathadd /opt/local/bin
pathadd /opt/local/sbin
pathadd $HOME/local/stow
if [ "${PATH#*$HOME/bini3}" = "${PATH}" ]; then
    pathadd $HOME/bini3
fi
if [ -e $HOME/Dropbox/Apps/todotxttdi/todo_completion ]; then
   pathadd $HOME/Dropbox/Apps/todotxttdi/
fi
