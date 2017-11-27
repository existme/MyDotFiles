for cowsay in `ls -1 /usr/share/cowsay/cows | grep .cow | cut -d . -f 1`;
do echo; 
	cowsay -f $cowsay Me is "$cowsay"; 
done >> cowsay_creatures.txt;

echo "All cows are created in cowsay_creatures.txt"

