#!/bin/bash
# this should be placed in /etc/pm/sleep.d/05_disable_usb3
# don't forget to do chmod ugo+x /etc/pm/sleep.d/05_disable_usb3
## Unload USB 3 module before sleep

case "$1" in
    suspend | hibernate)
        ;;
    thaw | resume)
		  /usr/sbin/rfkill block all
		  /usr/sbin/rfkill unblock all
		  /sbin/iwlist wlp4s0 scan
        ;;
esac
