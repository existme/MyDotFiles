# Fix-Ubuntu-Crash.Md

----------------------------------------- 
First clean the crash folder

``` bash
sudo rm /var/crash/*
```

to fix it permanently, edit apport:

``` bash
sudo vim /etc/default/apport
```

and change `enabled=1` to `enabled=0`

-----------------------------------------
2018-05-21 04:09:13
