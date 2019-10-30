#!/bin/zsh

sudo apt install -y jq

mkdir /tmp/fontinstaller
cd /tmp/fontinstaller
curl https://api.github.com/repos/ryanoasis/nerd-fonts/releases | jq '.[].assets | .[] | .browser_download_url' | grep  v2.0.0 --color=never  > fonts
# if you want all, remove the middle grep
cat fonts | grep --color=never  "Fira\|Inconsolata\|SourceCodePro\|Roboto" | xargs wget
mkdir -p ~/.fonts/nerdfonts
unzip -o '*.zip' -d ~/.fonts/nerdfonts/
rm -rf /tmp/fontinstaller
fc-cache -fv

