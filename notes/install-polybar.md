# Install-Polybar.Md

----------------------------------------- 

```bash
sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libpulse-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libxcb-cursor-dev

git clone --recursive https://github.com/jaagr/polybar

mkdir polybar/build
cd polybar/build
cmake ..
sudo make install

```

-----------------------------------------
2018-02-20 22:19:42
