# Misc-Audible-Download.Md

----------------------------------------- 
## [how-to-listen-to-audible-files](https://askubuntu.com/questions/16918/how-to-listen-to-audible-files)

In your library, near the right top corner, you can select "Format 4" (instead of
.aax or .aax+). The download links will change to .aa files. From what I 
understand, they're a weird kind if mp3 which is easily converted using ffmpeg.
This option (to pick `Format 4`) is only available if your browser's user agent 
looks like a Linux system.

```bash
ffmpeg -i downloaded_file.aa output.mp3
```

The -i option just specifies the input file. The output file apparently needs 
no -option. This is the simplest usage of ffmpeg, but it will re-encode the file 
(loses a little bit of quality, and it's slow).

It is better (10× faster) to use the 'stream copy' feature:

```
ffmpeg -i downloaded_file.aa -codec copy output.mp3
```

-----------------------------------------
2018-02-13 06:54:05
