# Chromium-Tips.Md

----------------------------------------- 
# Chromium flags

1. [chrome_switches.cc](https://chromium.googlesource.com/chromium/src.git/+/master/chrome/common/chrome_switches.cc)
1. [List of Chromium Command Line Switches](https://peter.sh/experiments/chromium-command-line-switches/)

Sample:

```bash
chromium-browser --enable-webgl \
     --user-data-dir="$HOME"/.config/chromium-presentation --force-app-mode  \
     --force-device-scale-factor=1.5 --force-app-mode --use-skia-renderer http://localhost:80/
```

-----------------------------------------
2018-01-20 17:59:08
