rm %HOMEPATH%\.vimrc
rm %HOMEPATH%\vimfiles
rm %HOMEPATH%\.gvimrc

ln -s %HOMEPATH%\git\MyVimConfig\vimrc %HOMEPATH%\.vimrc
mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\git\MyVimConfig\vim
ln -s %HOMEPATH%\git\MyVimConfig\gvimrc %HOMEPATH%\.gvimrc
