# Unix-Git-Crypt.Md

----------------------------------------- 
# Using git-crypt
Installation:

```bash
sudo apt install git-crypt 

brew install git-crypt
```
## on the host machine [github-ref](https://help.github.com/articles/generating-a-new-gpg-key/)

**1- generate a gpg key**
```bash
# for local generation
gpg --gen-key

# for remote generation without access to gui:
 gpg --gen-key --pinentry-mode loopback --passphrase <passphrase>
```

**2- list gpg keys**

```bash
gpg --list-secret-keys --keyid-format LONG
```

**3- from the list of gpg keys, copy gpg key ID. see example below**

```conf
gpg --list-secret-keys --keyid-format LONG

/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```
here the key id is `3AA5C34371567BD2`

**4- extract the key. see the example below:**
```bash
gpg --armor --export 3AA5C34371567BD2

# Prints the GPG key ID, in ASCII armor format
```

**5- Copy your GPG key**, 

beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----`
and ending with `----END PGP PUBLIC KEY BLOCK-----.`

or simply either use:

```bash
gpg --armor --export 3AA5C34371567BD2 | xclip
```

or:

```bash
gpg --armor --export 3AA5C34371567BD2 > /tmp/key.acs
```

##On server machine [git-crypt intro](https://robertknight.me.uk/posts/git-crypt-intro/)



-----------------------------------------
2018-02-19 20:23:49
