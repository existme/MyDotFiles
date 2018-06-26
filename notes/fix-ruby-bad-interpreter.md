# Fix-Ruby-Bad-Interpreter.Md

----------------------------------------- 
## When you running some apps like gollum you might get something like:
`/usr/local/bin/gollum: /usr/bin/ruby2.3: bad interpreter: No such file or directory`
to fix it use:

``` bash
sudo gem update
sudo gem pristine --all
sudo gem install gollum gollum-rugged_adapter omnigollum omniauth-ldap --no-ri --no-rdoc
sudo gem install awsome_print oj --no-ri --no-rdoc
```

-----------------------------------------
2018-06-26 11:01:33
