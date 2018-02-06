x-x11-forwarding.md+                                                                                                                            [buffers] 
# Unix-X11-Forwarding.Md                                                         
                                                                                 
-----------------------------------------                                        
Enable clipboard copy on remote sessions                                         
Remember to turn on X-Forwarding in /etc/ssh/ssh_config                          
                                                                                 
```bash                                                                          
ForwardX11 yes                                                                   
```                                                                              
                                                                                 
use `ssh -X remote -vvv` to diagnose the problems                                

See this [question][q1] for furthur information, run xeyes for test


[q1]: https://serverfault.com/questions/51005/how-to-use-xauth-to-run-graphical-application-via-other-user-on-linux
-----------------------------------------                                        
2018-02-06 17:56:10    
