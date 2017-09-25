#xsession sudo problem

-----------------------------------------

Some graphical applications on X environments need to run under sudo
priveleges. If that is not provided easily by the wm you can always use sudo.
But in special cases the graphical application running as sudo, will not
function properly, because it cannot connect correctly to the `DISPLAY`.
To fix this problem run:

```bash
sudo visudo
```

and add the following line:

```bash
Defaults env_keep = "http_proxy https_proxy DISPLAY Defaults XAUTHORIZATION XAUTHORITY TZ PS2 PS1 PATH LS_COLORS KRB5CCNAME HOSTNAME HOME DISPLA
```

-----------------------------------------
Tuesday 05 September 2017, 19:02:40
