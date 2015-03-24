## Install help

To add a new plugin from git use the following command:

git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive

To update all submodules:

git submodule foreach git pull origin master

## FUGITIVE help

see fugitive help for using git with vim:
http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

update help file using:
vim -u NONE -c "helptags vim/bundle/vim-fugitive/doc" -c q

## Vim-Sorround
use cs"' to change sorrounding " to '

## VIM help

Paste in command line				:CTRL-R "
Show help in vertical mode			:vert help e

Move to next buffer					CTRL+ -> / <-
