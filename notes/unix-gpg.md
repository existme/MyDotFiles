# Unix-Gpg.Md                                                                    
                                                                                 
-----------------------------------------                                        
                                                                                 
```bash                                                                          
s apt-get install rng-tools                                                      
sudo rngd -r /dev/urandom                                                        
                                                                                 
gpg --list                                                                       
gpg --delete-secret-keys "existme@gmail.com"                                     
gpg --delete-key "existme@gmail.com"                                             
gpg --gen-key                                                                    
                                                                                 
```                                                                              
to run it `--gen-key` remotely without having the UI:

```
gpg --gen-key --pinentry-mode loopback --passphrase <pass>
```
-----------------------------------------                                        
2018-02-19 17:10:44
