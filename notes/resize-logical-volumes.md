# Resize Logical Volumes

----------------------------------------- 

Use either of these:

```bash

sudo lvextend --size +40G /dev/mapper/vg0-root
   # or for fixed size:
   sudo lvextend --size 55G /dev/mapper/vg0-root

or

sudo lvresize --size +40G /dev/mapper/vg0-root
   # or for fixed size:
   sudo resize2fs -size 55G /dev/mapper/vg0-root

#lvresize can also reduce the size
```

`lvdisplay` can now show the size of logical volume (LV)

```bash
sudo lvdisplay /dev/mapper/vg0-root
```

but yet, `df` reports the old size because we are not finished yet. Continue 
to step 2.

## Step 2 - Resize filesystem
After doing this, you need to resize filesystem:

```bash
sudo resize2fs /dev/mapper/vg0-root
```

If you don't do this the size of logical volume is not yet extended.

`df` should now shows the correct size

# Graphical user interface:

for graphical user interface install `system-config-lvm` and then run it with:

```bash
system-config-lvm
```

-----------------------------------------
2017-09-28 16:46:54
