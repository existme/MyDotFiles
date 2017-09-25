#Go to public network

-----------------------------------------

- move the files in `/etc/ssl/private/*` to some place safe

~~~bash
sudo mkdir -p /root/backup
sudo mv /etc/ssl/private/* /root/backup/
sudo service restart networking
~~~

- do your stuff and then move the files back

~~~bash
sudo mv /root/backup/* /etc/ssl/private/
sudo service restart networking
~~~

-----------------------------------------
Wednesday 23 August 2017, 16:51:03
