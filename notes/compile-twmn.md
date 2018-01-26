# Compile-Twmn.Md

----------------------------------------- 

```bash
s apt install libboost-dev libboost-program-options-dev libboost-system-dev
s vim /usr/include/c++/7/cmath
   change #include_next <math.h> to #include <math.h>

qmake
make
```


```bash
s mv ~/.icons/Paper /usr/share/icons/
s chown root /usr/share/icons/Paper
s ln -s /usr/share/icons/Paper ~/.icons
```
-----------------------------------------
2018-01-25 21:02:49
