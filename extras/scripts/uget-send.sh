#! /bin/bash
# cat UqzoXczS.m3u | awk 'match($0,/^.*\.mp3/) {print substr($0,1,RLENGTH)}'
file="playlist.m3u"
exec 2<$file
# Skip the first line of header "#EXTM3U"
$cnt=1
read -u2 line
while read -u2 line
do
	  if [[ $line == '#'* ]] ; then
		  title=$(echo $line | cut -d',' -f 2)
		  read -u2 line
		  url=$line
		  filename=$(printf '%04d - %s.mp3' "$cnt" "$title");
		  uget-gtk --filename="$filename" $url --category-index=1 --quiet
		  echo $filename 		  
		  ((cnt++))
	  fi
done 
