#!/bin/zsh
 
BASEDIR=$(dirname "$0")
cd $BASEDIR

bundle install
rm Gemfile.lock
cp necessary Gemfile.lock

git add .
git commit -am "update"

JEKYLL_GITHUB_TOKEN=a60240e8ec4d3a021a75a0784f9b18d91af947fe yes | ./bin/deploy --user

kill -9 $PPID

osascript -e 'tell application "Terminal" to close first window' & exit