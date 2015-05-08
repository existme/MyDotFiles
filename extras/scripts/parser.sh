#! /bin/bash
# cat UqzoXczS.m3u | awk 'match($0,/^.*\.mp3/) {print substr($0,1,RLENGTH)}'
file="playlist.m3u"
out="test.metalink"
exec 2<$file
rm $out
# Write metalink header
echo '<?xml version="1.0" encoding="UTF-8" ?>' >> $out
echo '<metalink version="3.0" xmlns="http://www.metalinker.org/">' >> $out
echo -e "\t"'<files>' >> $out
# Skip the first line of header "#EXTM3U"
read -u2 line
while read -u2 line
do
	  if [[ $line == '#'* ]] ; then
		  title=$(echo $line | cut -d',' -f 2)
		  read -u2 line
		  url=$line
		  printf '\t\t<file name="%s.mp3">\n' "$title" >> $out
		  echo -e "\t\t\t<resources>" >> $out
		  printf  '\t\t\t\t<url type="https" preference="100">%s</url>\n' "$url" >> $out
		  echo -e "\t\t\t</resources>" >> $out
		  echo -e "\t\t</file>" >> $out
	  fi
done 
echo -e "\t"'</files>' >> $out
echo '</metalink>' >> $out
