#!/bin/bash
fast_chr() {
    local __octal
    local __char
    printf -v __octal '%03o' $1
    printf -v __char \\$__octal
    REPLY=$__char
}

function unichr {
    local c=$1  # ordinal of char
    local l=0   # byte ctr
    local o=63  # ceiling
    local p=128 # accum. bits
    local s=''  # output string

    (( c < 0x80 )) && { fast_chr "$c"; echo -n "$REPLY"; return; }

    while (( c > o )); do
        fast_chr $(( t = 0x80 | c & 0x3f ))
        s="$REPLY$s"
        (( c >>= 6, l++, p += o+1, o>>=1 ))
    done

    fast_chr $(( t = p | c ))
    echo -n "$REPLY$s"
}

function print_range(){
	local from=$1
	local to=$2

	for (( i=$1 ; i<$2 ; i++ )); do
		 unichr $i
		 printf "     0x%X\n" $i
	done
}
## test harness 
print_range 0x2100 0x2C5E
print_range 0xE000 0xF8FF

