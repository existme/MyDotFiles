echo "Loading Windows-specific configuration..."

# Setting up environment specific paths

export PATH="/cygdrive/c/Program Files/Java/jdk1.8.0_25/bin/":$PATH
export PATH=/cygdrive/c/Java/maven/bin:/cygdrive/c/Java/glassfish4:/cygdrive/c/Java/glassfish4/bin:$PATH
export PATH="/cygdrive/c/Program Files/android-studio/gradle/gradle-2.2.1/bin":$PATH

ZSH_THEME="jispwoso"

# Since console in windows doesn't remember path these function help to
# store and retreive the last traversed folder
cdcopy() { cd "$@" ; pwd>~/.lastfolder}
cc() { pwd>~/.lastfolder}
usecopiedpath() {lastfolder=$(cat ~/.lastfolder) && cd $lastfolder }
usecopiedpath
alias uc=usecopiedpath
alias cd=cdcopy
alias pwd="pwd;cc"


export DISPLAY=localhost:0.0
export MAVEN_OPTS="-Xms256m -Xmx512m"
export M2HOME=/cygdrive/c/unix/apache-maven-3.3.9
export IDEAPATH="/cygdrive/c/Program\ Files\ \(x86\)/JetBrains/IntelliJ\ IDEA\ 15.0.3/bin/idea.bat"
alias sublime="/cygdrive/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias subl="/cygdrive/c/Program\ Files/Sublime\ Text\ 3/subl.exe"
alias start="cygstart"
alias cyg-get="/cygdrive/c/cygwin64/setup-x86_64.exe -q -P"
alias pygmentize="~/git/Pygments-2.1/pygmentize "
alias atom="/cygdrive/c/Users/Reza/AppData/Local/atom/app-1.4.3/resources/cli/atom.cmd"
alias idea="$SCRIPTPATH/extras/scripts/ideawin"

