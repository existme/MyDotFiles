# Dunst

----------------------------------------- 
Either remove the following service or change it to use `dunst`

```bash
/usr/share/dbus-1/services/org.freedesktop.Notifications.service
```

As an example you change it to this:

```bash
[D-BUS Service]
Name=org.freedesktop.Notifications
#Exec=/usr/lib/x86_64-linux-gnu/notify-osd
Exec=/usr/bin/dunst
```

Or the better way is to disable the service by renaming it to
`/usr/share/dbus-1/services/org.freedesktop.Notifications.service.disable`
Also notice that there already exists a service called:
`org.knopwob.dunst.service`

containing the following:

```bash
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/bin/dunst
```
-----------------------------------------
2017-11-30 00:35:23
