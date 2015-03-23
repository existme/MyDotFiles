git reset --hard HEAD
git checkout -b temporary
git checkout temporary
git branch -D master
#git checkout -b master
git co -b master remotes/origin/master
git pull 
git submodule update
git br -D temporary

