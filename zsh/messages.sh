echoMe $0

# Cosmetics
stackMsg $msgRGB
stackMsg "${bW}$(date '+%D %T')${cZ}";

# The TOOLBOX variable should be set in zshrc.local.sh to something like this: 
# TOOLBOX=/Users/(uid)/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0
# or in Linux:
# TOOLBOX=/opt/JetBrains/Toolbox/apps/IDEA-U/ch-0
if [ $TOOLBOX ]; then   
   export IDEA_VERSION=$(/bin/ls -ltx $TOOLBOX|awk '{print $NF}')
   # IDEA_POSTIFIX should also be set in zshrc.local.sh ex:
   # IDEA_POSTIFIX=IntelliJ\ IDEA.app/Contents/MacOS/idea
   export IDEA_PATH=$TOOLBOX/$IDEA_VERSION/$IDEA_POSTIFIX
   APPS+="$APP_SEP ${bB} ${bW}IDEA$cZ v${bW}$IDEA_VERSION${cZ} "
fi
[ $(command -v grc) ] || stackMsg "Package$bR grc$cZ is not installed:$bW sudo apt install grc$cZ"
[ $(command -v highlight) ] || stackMsg "Package$bR highlight$cZ is not installed:$bW sudo apt install highlight$cZ"


