## Prerequirements 

256 color term:
	sudo apt-get install ncurses-term
then use
	export TERM=xterm-256color
you shoud have
	$ tput colors
	256

 ################
 # Install help #
 ################
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

 #####################
 # Mac configuration #
 #####################
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

 #################
 # FUGITIVE help #
 #################
	> see fugitive help for using git with vim:
	http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

	update help file using:
	vim -u NONE -c "helptags vim/bundle/vim-fugitive/doc" -c q

 ################
 # Vim-Sorround #
 ################

use cs"' to change sorrounding " to '

 ############
 # VIM help #
 ############

	> Powerline fonts in mac:
		after installing it's important to set both fonts in iterm2

 ################
 # todo.txt-vim #
 ################

Sorting tasks:
	/s		Sort the file
	/s+	Sort the file on +Projects
	/s@	Sort the file on @Contexts
	/sd	Sort the file on dates

Edit priority:
	/j		Decrease the priority of the current line
	/k		Increase the priority of the current line
	/a		Add the priority (A) to the current line
	/b		Add the priority (B) to the current line
	/c		Add the priority (C) to the current line

Date:
	/d		Set current task's creation date to the current date
	date<tab> (Insert mode) Insert the current date

Mark as done:
	/x		Mark current task as done
	/X		Mark all tasks as done
	/D		Move completed tasks to done.txt

 ############
 # tcomment #
 ############

Toggle comment							gc
Comment selected						g>

 #########
 # Boxes #
 #########
	add boxes							,mc
	remove boxes						,xc
	
 ##################
 # other commands #
 ##################

Editing
	To insert after a character	a
	To insert before a character	i
	To insert at the end of line	A
	To insert at the beg of line	I

File opening
	Show help in vertical mode		:vert help e
	Open another file in vertical :vsp ~/.zshrc
	Set files to open in right		:set splitright
	Vertical split						:vsp {filename}
	Vertical split buffer #			:vsp#2				# 2 is an example

Buffer commands
	Move to next buffer				CTRL+ -> / <-
	Close current window				CTRL w+c
	Toggle previouse buffer			,,						#, is <leader>
	Close current buffer				:bd
	Delete current buffer & move	,q

Toggle spell checker					,s
	When spell checking:
		Show the suggestions			z=
		Add to dictionary				zg		

Copy/Paste
	Set Pasting & PasteClipboard	,p
	Paste in command line			:CTRL-R "

Search * Replace
	Toggle highlight						F4
	Select all occurance of word		*
	----------
	Replace foo to bar current line	:s/foo/bar/g
	Replace foo to bar all line		:%s/foo/bar/g


Toggle white space					,l
Open this file(help.md)				<c-h>					
Close and save current buffer		<c-a>

######################
# Map an expression: #
######################

	:imap <expr> <F2> "\u611B"

#######################
# CYGWIN HELP         #
#######################

for using zsh shell in other console applications like conemu or console2
use the following command as 
C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico /bin/zsh --login
