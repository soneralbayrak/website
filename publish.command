#!/bin/zsh
 
BASEDIR=$(dirname "$0")
cd $BASEDIR

bundle install
rm Gemfile.lock
cp necessary Gemfile.lock
nohup bundle exec jekyll serve > my.log 2>&1 &
echo $! > save_pid.txt




while ! (grep -Fq "ctrl-c" my.log)
do
    sleep 0.1
done
open http://127.0.0.1:4000/website/

kill -9 $PPID

osascript -e 'tell application "Terminal" to close first window' & exit