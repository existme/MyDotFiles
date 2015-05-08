#!/bin/bash
# replace Chopin / to nothing in $1

newfile=$(cat ../playlist\ \(1\).sh|grep $1|cut -d'"' -f4 | sed "s/Chopin\ \/\ //")
echo $1 " -> "$newfile
mv $1 "$newfile"
