# Compile-Vim.Md

----------------------------------------- 
## How to compile vim with most features

This will install vim with most features enabled including lua

```bash
sudo apt remove vim-tiny vim-common vim-gui-common vim-nox xxd
#sudo apt-get install libncurses5-dev python-dev libperl-dev ruby-dev liblua5.2-dev
#sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/local/lib/liblua.so
./configure 	--prefix=/usr		\
		--with-features=huge	\
		--enable-pythoninterp 	\
		--enable-luainterp=yes 	\
      --with-lua-prefix=/usr/include/lua5.2 \
      --enable-perlinterp=yes   \
		--enable-pythoninterp=yes \
		--enable-rubyinterp=yes	\
		--enable-cscope		\
		--disable-netbeans	\
		--enable-multibyte	\
		--enable-largefile	\
		--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
		--enable-gui=gnome22	\
      --with-luajit --enable-fail-if-missing

sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80/
sudo apt install checkinstall
sudo checkinstall
```

-----------------------------------------
2017-12-23 15:38:29
