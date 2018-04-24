# Unix-Sudo-Without-Pass.Md

----------------------------------------- 
Inorder to not ask password for when running with sudo use `sudo visudo` and:

```bash
# change the following line from

%admin ALL=(ALL) ALL

# to:

%admin ALL=(ALL) NOPASSWD: ALL
```
or to enable it just for one user, add:

``` bash
existme ALL=(ALL:ALL) NOPASSWD: ALL
```

to remove the need of entering password for certain applications in `sudo visudo` add:

``` bash
existme ALL = (root) NOPASSWD: /home/existme/bin/scode                           
existme ALL = (root) NOPASSWD: /home/existme/bini3/i3exit                        
existme ALL = (root) NOPASSWD: /usr/bin/torguard                                 
existme ALL = (root) NOPASSWD: /usr/bin/htop
```
-----------------------------------------
2018-04-15 00:40:51
