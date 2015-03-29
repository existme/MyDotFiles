tput setaf 16
tput bold
for i in $(seq 0 255)
do
	tput setab $i
	printf " %3d " $i 
done 
tput setab 0 
echo
