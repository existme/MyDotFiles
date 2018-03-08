# Unix-Autofs.Md

----------------------------------------- 
## installation

```bash
s apt install autofs
```

## /etc/auto.master 

```bash
+auto.master
/home/existme/mnt/    /etc/autofs/auto.ssh   --timeout=120
```

## /etc/autofs/auto.ssh ( you should create yourself )

```bash
wd -fstype=fuse,rw,allow_other,IdentityFile=/home/existme/.ssh/id_rsa :sshfs\#root@192.168.0.50\:/DataVolume/shares/WD/
```

## Try out
```bash
s service autofs stop
s automount -f -v
```

## Service
```bash
s service autofs restart
```

## Tips
- `exa` might not work correctly, use /bin/ls instead
- `/usr/local/bin/autosshfs-map root@192.168.0.50` can generated the needed line for mounting

-----------------------------------------
2018-03-08 00:49:20
