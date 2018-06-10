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
```

## trouble shooting

```
lnav ~/.xsession-errors
```
## trouble shooting sound

Pulsaudio might be only played on certain tty after using `xinit`
to fix it first of follow this greate [page][snd-fix].
but in the nutshell this is what needs to be done:

`aplay -l`

lists your sound cards

if you find nothing then try
`sudo aplay -l`
if you saw the list then this should fix your problem:

``` bash
sudo usermod -aG audio `whoami`

sudo alsa force-reload;killall pulseaudio ; pulseaudio --start
```
logout and login


[snd-fix]: https://lkubuntu.wordpress.com/2011/07/20/sound-troubleshooting/
-----------------------------------------
2018-06-09 13:43:19
