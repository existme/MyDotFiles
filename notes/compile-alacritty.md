# Compile-Alacritty.Md
                     
-----------------------------------------
- refer to [manual installation](https://github.com/jwilm/alacritty#manual-installation)
   and make sure you have the prequisits.

- in breif you need these:
```bash
git clone https://github.com/jwilm/alacritty.git
cd alacritty

rustup override set stable
rustup update stable

s apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip

cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
cp Alacritty.desktop ~/.local/share/applications
```

Also there is a possibility of installation through `https://github.com/alexcrichton/cargo-vendor`
(haven't tried)

-----------------------------------------
2018-01-31 00:15:57

