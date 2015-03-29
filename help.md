## Prerequirements 

256 color term:
	sudo apt-get install ncurses-term
then use
	export TERM=xterm-256color
you shoud have
	$ tput colors
	256

# Install help
	> Submodule Help
	
	+ To add a new plugin from git use the following command:
		git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
	+ To update all submodules:
		git submodule foreach git pull origin master
	+ In order to update submodules correctly and avoid empty folders:
		git submodule update --init
	+ In order to remove a submodule
		git submodule deinit asubmodule
		git rm asubmodule
		# Note: asubmodule (no trailing slash)
		# or, if you want to leave it in your working tree
		git rm --cached asubmodule
		But you seem to still need a:

rm -rf .git/modules/asubmodule
## Mac configuration
	In order that cursor movement works correctly in iTerm2, you should send
	an escape sequence for the right movement sequence. For example to simulate
	ctrl+arrow movment (since for some reason ctrl+arrow is not catched by
	iterm2) we can use:
	
	Key combination					Action
	===================================================================
	command+ctrl+<right cursor>	Send [1;5C
	command+ctrl+<left cursor>		Send [1;5D

	For getting the full list of these key combination code see :
	http://wiki.bash-hackers.org/scripting/terminalcodes

	ctrl+a (0x01) for home 
	ctrl+e (0x05) for end 
	ctrl+d (0x04) for delete

## FUGITIVE help
	> see fugitive help for using git with vim:
	http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

	update help file using:
	vim -u NONE -c "helptags vim/bundle/vim-fugitive/doc" -c q

## Vim-Sorround
use cs"' to change sorrounding " to '

## VIM help
	> Powerline fonts in mac:
		after installing it's important to set both fonts in iterm2

Paste in command line				:CTRL-R "
Show help in vertical mode			:vert help e
Open another file in vertical w	:vsp ~/.zshrc
Set files to open in right			:set splitright

Move to next buffer					CTRL+ -> / <-
Close current window					CTRL w+c

Toggle previouse buffer				,,				#, is <leader>
Toggle spell checker					,s
Toggle white space					,l
Set Pasting & PasteClipboard		,p
Close current buffer					:bd
Delete current buffer and move	,q

Toggle highlight						F4
Select all occurance of word		*

Vertical split							:vsp {filename}
Vertical split buffer #				:vsp#2				# 2 is an example


