.vim -> /Users/existme/.yadr/vim
.vimrc -> /Users/existme/.yadr/vimrc


ln -s ~/git/ExistmeVim/vim ~/.vim
ln -s ~/git/ExistmeVim/vimrc ~/.vimrc
ln -s ~/git/ExistmeVim/extras/dircolors ~/.dircolors

After cloning the repository you should run:
git submodule update --init

to move a line one row up/down use Ctrl+j/k

To update all submodules 
git submodule update --remote --merge


# Good colorschemes for diff mod in vim
- alduin
- blueshift
- ccascadia
- chrysoprase
- AutumnLeaf
- bluechia
- Cleanroom
- colorsbox-stbright
- colorsbox-stnight
- earthburn
