Note xsession environment variables
The date is: Tuesday 05 September 2017, 19:00:18
-----------------------------------------
It appears that the most important place to update your environment
variables to be captured by xsession based wms is:

vim /etc/profile.d/apps-bin-path.sh

**note**: your environment should be restarted for this settings be effective

another place which worth looking at is:

vim /etc/environment

you should note that `/etc/environment` is used by the pam_env module and is 
shell agnostic so scripting or glob expansion cannot be used. The file only
accepts variable=value pairs.


In this example, we add ~/bin directory to the PATH for respective user. To do 
this, just put this in your preferred global environment variable config file
 (/etc/profile or /etc/bash.bashrc):

# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
    export PATH="${PATH}:$HOME/bin"
fi

for more information see:
https://wiki.archlinux.org/index.php/environment_variables

-----------------------------------------
