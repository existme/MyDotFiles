# Raspberry-Troubleshooting.Md

----------------------------------------- 
## Doesn't boot

1- reboot, hold shift, change command.txt
1- add `init=/bin/sh` at the end of `cmdline.txt`, in the boot partition of the SD.
1- reboot
1- `mount -o remount,rw /`
1- `vim /etc/fstab`
1- comment out offending lines
1- save and reboot, remove the `init=/bin/sh` from `cmdline.txt`
1- reboot

## Mount problem

```bash
sudo vim /etc/fstab

/dev/sda1 /media/pi/My\040Book auto defaults,nofail,x-systemd.device-timeout=1 0 2
```
-----------------------------------------
2018-03-04 18:02:25
