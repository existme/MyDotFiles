Note go to public network
prise le Wednesday 23 August 2017, 16:51:03
-----------------------------------------
# move the files in /etc/ssl/private/* to some place safe

sudo mkdir -p /root/backup
sudo mv /etc/ssl/private/* /root/backup/
sudo service restart networking

# do your stuff and then move the files back
sudo mv /root/backup/* /etc/ssl/private/
sudo service restart networking
-----------------------------------------
