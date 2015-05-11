##########################
# Find path to this repo #
##########################

SCRIPT=$(readlink ~/.zshrc -f)                                                   
SCRIPTPATH=$(dirname "$SCRIPT")  
CONFIGPATH=$SCRIPTPATH/configs

mkdir -p $HOME/bin

echo "Config path = $CONFIGPATH"

#######################
# tkman configuration #
#######################
rm $HOME/.tkman
ln -s $CONFIGPATH/tkman/tkman.config $HOME/.tkman
echo "tkman configuration linked"

#############
# todo.text #
#############
rm $HOME/bin/todo.sh
ln -s $HOME/Dropbox/Apps/todotxttdi/todo.sh $HOME/bin/todo.sh
mkdir -p $HOME/.todo
rm $HOME/.todo/config
ln -s $HOME/Dropbox/Apps/todotxttdi/todo.cfg $HOME/.todo/config
rm -rf $HOME/git/todo
ln -s $HOME/Dropbox/Apps/todotxttdi/ $HOME/git/todo
echo "todo.text configuration linked"

#######
# pal #
#######
rm -rf $HOME/.pal
ln -s $CONFIGPATH/pal $HOME/.pal
echo "pal configuration linked"
