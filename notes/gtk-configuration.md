# Gtk-Configuration

----------------------------------------- 

- lookat https://wiki.archlinux.org/index.php/GTK%2B#Configuration
```bash
export GTK_THEME=Gnome-OSX-II-2-6
```

You could find what themes installed on your system have both an GTK+ 2 and GTK+ 3 :

```bash
find $(find ~/.themes /usr/share/themes/ -wholename "*/gtk-3.0" | sed -e "s/^\(.*\)\/gtk-3.0$/\1/") -wholename "*/gtk-2.0" | sed -e "s/.*\/\(.*\)\/gtk-2.0/\1"/
```

Themes not applied to root applications
```bash
sudo ln -s $HOME/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -s $HOME/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
```

-----------------------------------------
2017-11-01 03:32:47
