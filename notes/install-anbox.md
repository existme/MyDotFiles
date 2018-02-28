# Install-Anbox.Md

----------------------------------------- 

```bash
snap install --edge --devmode anbox
sudo add-apt-repository -y ppa:morphis/anbox-support
sudo apt update
sudo apt install -y anbox-modules-dkms

anbox session-manager

sudo apt install android-tools-adb android-tools-fastboot
sudo apt install lzip
```

-----------------------------------------
2018-02-24 10:54:29
