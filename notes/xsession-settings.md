# Xsession-Settings.Md

----------------------------------------- 

## Place:
The sessions listed in lightdm are located in:
``` bash
/usr/share/xsessions
```
you can can edit the desktop files and use startx intead of directly calling wm:

```bash
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=startx
TryExec=startx
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
```

## /etc/X11/Xsession

``` bash
systemctl --user enable dunst.service
systemctl --user start dunst.service

-----------------------------------------
2018-06-09 13:43:19
