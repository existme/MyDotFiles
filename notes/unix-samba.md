# Unix-Samba.Md

-----------------------------------------
## Set samba password

Set the password for vagrant user

```bash
sudo smbpasswd -a vagrant
```

**Tip1**: Note: Samba uses a separate set of passwords than the standard
				Linux system accounts (stored in /etc/samba/smbpasswd)
**Tip2**: Use the password for your own user to facilitate.

## Share folder for a user_name

- create folder : `mkdir /home/<user_name>/<folder_name>`
- edit `/etc/samba/smb.conf` and add this to the very end of the file:

```conf
[<folder_name>]
path = /home/<user_name>/<folder_name>
valid users = <user_name>
read only = no
```

- Restart samba: `sudo service smbd restart`
- Once Samba has restarted, use this command to check your `smb.conf`
	for any syntax errors: `testparm`
- To access your network share:

**Tip1**: Remember that your user must have permission to write and edit
		 the folder you want to share.

Eg.:

```bash
sudo chown <user_name> /var/opt/blah/blahblah
sudo chown :<user_name> /var/opt/blah/blahblah
```

**Tip2**: If you're using another user than your own, it needs to exist
		in your system beforehand, you can create it without a
		shell access using the following command :
		`sudo useradd USERNAME --shell /bin/false`

## To access your network share:

```
sudo apt-get install smbclient
# List all shares:
smbclient -L //<HOST_IP_OR_NAME>/<folder_name> -U <user>
# connect:
smbclient //<HOST_IP_OR_NAME>/<folder_name> -U <user>
```

or you can browse: `smb://192.168.0.128/`
**Note**: The default user group of samba is "WORKGROUP".
-----------------------------------------
2018-03-06 21:40:02
