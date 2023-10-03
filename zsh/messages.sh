echoMe $0

# Cosmetics
stackMsg $msgRGB
stackMsg "${bW}$(date '+%D %T')${cZ}";

# The TOOLBOX variable should be set in zshrc.local.sh to something like this: 
# TOOLBOX=/Users/(uid)/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0
# or in Linux:
# TOOLBOX=/opt/JetBrains/Toolbox/apps/IDEA-U/ch-0
if [ $TOOLBOX ]; then
   IDEA_INFO_FILE="$TOOLBOX/product-info.json"

   export IDEA_VERSION=$(jq -r '.version' $IDEA_INFO_FILE)
   export IDEA_BIN="$TOOLBOX/$(jq -r '.launch[0].launcherPath' $TOOLBOX/product-info.json)"
   # IDEA_POSTIFIX should also be set in zshrc.local.sh ex:
   # IDEA_POSTIFIX=IntelliJ\ IDEA.app/Contents/MacOS/idea
   export IDEA_PATH=$TOOLBOX
   APPS+="$APP_SEP ${bB} ${bW}IDEA$cZ v${bW}$IDEA_VERSION${cZ} "
   APPS+="$APP_SEP ${bG} ${bW}$(python3 --version)${cZ} "
   APPS+="$APP_SEP ${bY} ${bW}NodeJs $(node --version)${cZ} "
fi
[ $(command -v grc) ] || stackMsg "Package$bR grc$cZ is not installed:$bW sudo apt install grc$cZ"
[ $(command -v highlight) ] || stackMsg "Package$bR highlight$cZ is not installed:$bW sudo apt install highlight$cZ"


