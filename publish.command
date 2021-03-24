#!/bin/zsh
 
BASEDIR=$(dirname "$0")
cd $BASEDIR

bundle install
rm Gemfile.lock
cp necessary Gemfile.lock

git add .
git commit -am "update"

yes | ./bin/deploy --user

kill -9 $PPID

osascript -e 'tell application "Terminal" to close first window' & exit