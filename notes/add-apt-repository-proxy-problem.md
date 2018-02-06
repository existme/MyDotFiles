#add-apt-repository proxy problem

-----------------------------------------

find the signiture online for ppa in this case: ppa:nilarimogard/webupd8


sudo apt-key adv --keyserver-options http-proxy=http://wwwproxy.axis.com:3128/ \
--keyserver keyserver.ubuntu.com \
--recv-keys 1DB29AFFF6C70907B57AA31F531EE72F4C9D234C

## Updated solution

The following solution worked perfectly, although I can do some more digging to
see how it can be done without modifying the file

I managed to workaround this by editing /usr/lib/python3/dist-packages/softwareproperties/ppa.py and adding

"--keyserver-options", "http-proxy=<proxy_url>",
under the following line

"--keyserver", self.keyserver,

More background information

`ppa.py` is the python script that is used by `add-apt-repository` to call `gpg`. 
There sometimes seem to be a bug with gpg where it does not use the `http_proxy`
environment variable. This can be confirmed by viewing the file `/root/.gnupg/`
`dirmngr.conf` and checking to see that honor-http-proxy is not commented out.

-----------------------------------------
Tuesday 29 August 2017, 10:52:25
