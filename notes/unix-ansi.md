# Unix-Ansi.Md

----------------------------------------- 
## Print at specific column in the same row

```bash
printf "$sha   $file";
tput cr;tput cuf 80;
printf "$size\n"
```
## Set tabstops

```bash
tabs -3
printf "reza\t\tshams"
```

## Position cursor at a specific location and print a multiline command
See [ref1][ref1]

```bash

trap 'tabs -8' EXIT INT TERM # restore to default tab stops every 8 columns
                             # upon exit or signal

tput tbc # clear tab stops
tput cup 5 15
tput hts # set one and only tab stop
printf '\r' # move back to the beginning of the line
printf '\t%s\n' foo bar baz
ping www.google.com | paste /dev/null -

```
-----------------------------------------

[ref1]: https://unix.stackexchange.com/questions/405244/is-multi-line-alignment-possible-with-tput/405410

2018-02-07 04:47:13
