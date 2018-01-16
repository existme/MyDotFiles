# Unix-Daemon-Singleton-Lock.Md

----------------------------------------- 
## A good reference?

After wandering a lot (24 complete hours), I found this source which
by far was the best so far:

[ProcessManagement](http://mywiki.wooledge.org/ProcessManagement)

## How do I make sure only one copy of my script can run at a time?

You could also run your program or shell script under the `setlock`
program from the `daemontools` package.

```bash
sudo apt install daemontools
```

Afterwards, you can use:
```bash
$ setlock -nX lockfile sleep 100 &
[1] 1169
$ setlock -nX lockfile sleep 100
setlock: fatal: unable to lock lockfile: temporary failure
```

## WrapperScript

Please see the [mywiki.wooledge.org/WrapperScript](http://mywiki.wooledge.org/WrapperScript)
for more detail.


-----------------------------------------
2018-01-16 08:38:56
