
# Install latest version of ruby
```
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
rvm list known
rvm install ruby 2.4.1
rvm use 2.4.1 --create
s gem install rubygems-update
update_rubygems
gem pristine --all
s gem pristine --all
```

zzcpz57pf899

# Gollum installation

```bash
depending on the ruby version installed:
sudo apt-get install ruby2.1-dev
s apt install zlib1g-dev
apt-get install libicu-dev
s gem install bundle
bundle install
bundle exec bin/gollum

or
	
sudo gem install gollum

sudo gem install github-markdown


```

# Intresting pain points
/home/rezasa/.rvm/gems/ruby-2.4.1/gems/net-ldap-0.16.1/lib/net/ldap/connection.rb
/home/rezasa/.rvm/gems/ruby-2.4.1/gems/net-ldap-0.16.1/lib/net/ldap.rb

/home/rezasa/.rvm/gems/ruby-2.4.1/gems/omniauth-ldap-2.0.0/lib/omniauth/strategies/ldap.rb
/home/rezasa/.rvm/gems/ruby-2.4.1/gems/omniauth-ldap-2.0.0/lib/omniauth-ldap/adaptor.rb

/home/rezasa/.rvm/gems/ruby-2.4.1/gems/omnigollum-0.1.5/lib/omnigollum.rb
@name = hash['info']['first_name']+" "+ hash['info']['last_name'] 
