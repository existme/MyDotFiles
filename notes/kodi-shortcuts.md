# Kodi-Shortcuts.Md

----------------------------------------- 
Kodi keymapping is located in:
``` bash
/usr/share/kodi/system/keymaps/keyboard.xml
```

To add something like shortcut for adjusting the volume you can add the following
snippet:

``` xml
<keymap>
  <global>
    <keyboard>
      <left mod="ctrl">subtitledelayminus</left>
      <right mod="ctrl">subtitledelayplus</right>
      <left mod="ctrl,shift">audiodelayminus</left>
      <right mod="ctrl,shift">audiodelayplus</right>
      <t mod="ctrl">SubtitleDelay</t>
    </keyboard>
  </global>
</keymap>
```
-----------------------------------------
2018-06-23 07:28:04
