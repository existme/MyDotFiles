# This script generates different available color combinations in .dircolors
# file so we can view it in vim

rm .dircolors
for i in $(seq 0 255)
do
	echo "test\t\t38;5;$i" >> .dircolors
done

for i in $(seq 0 255)
do
	echo "test\t\t48;5;234;38;5;$i" >> .dircolors
	echo "test\t\t48;5;234;38;5;$i;1" >> .dircolors
done
