# X-Theme.Md

----------------------------------------- 
## Theme manager

The best theme manager so far is, `mate-appearance-properties`, which
can be installed using:

```bash
sudo apt install mate-control-center
```

Others are:
1. lxappearance
1. gtk-theme-config
1. gtk-chtheme
1. qtconfig-qt4
1. xfce4-appearance-settings

## Changing cursor
All the programs should be restarted for cursor to be effective

## Icon theme

Use:
``` bash
gsettings list-recursively | grep icon-theme
```
To list all themes in use.
To change theme use:

```
gsettings set org.gnome.desktop.interface gtk-theme "custom-desktop-theme"
```

### Folders:

System wide: `/usr/share/icons`
User: `~/.icons`

-----------------------------------------
2017-12-26 09:53:49
