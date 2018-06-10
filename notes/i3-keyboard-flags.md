# I3-Keyboard-Flags.Md

----------------------------------------- 
# How to use flag icons with keyboard indicator

For details see this [page][flag-mate].

Link the flag icons to your home icon folder:

``` bash
ln -s ~/bini3/ext-icons/flags ~/.icons
```

then run `dconf-editor` and go to `/org/mate/desktop/peripherals/keyboard/indicator`
and set the `show-flags` to true.
or jusr run the following command:

``` sh
dconf write /org/mate/desktop/peripherals/keyboard/indicator/show-flags true
```

[flag-mate]: https://winaero.com/blog/flags-mate-keyboard-layout-indicator/
-----------------------------------------
2018-06-10 23:58:38
