# Unix-Smenu.Md

----------------------------------------- 
# smenu samples

```bash
RES=$(smenu -2 "^Y" -1 "^N" -3 "^C" -s "/^N" -m "Please confirm your choice:" <<< "YES NO CANCEL")
[[ -z "$RES" ]] && echo "'q' was hit, exiting without selecting anything" \
                || echo "You selected: $RES"

# Using additional styling you can change bg color
read R <<< $(/bin/ls /sys/class/block/ | smenu -4 "^sd" 16/6,b -s "/^sd" -t 4)

# Exclude some words using regular expression
read R <<< $(locale -a| smenu -n 7 -e 'utf.$' -s en_ZM)

# With -d the window can be removed
read R <<< $(cal | smenu -M -d -c -w -Rd1-2 -n 9 -m "Please choose a day")


# Using -T you can multiselect options, by pressing t (tag/untag)
# The tagged words are separated by the optional argument of the -T option
echo $(echo A B D E F | smenu -T, )

```

-----------------------------------------
2018-02-07 23:26:02
