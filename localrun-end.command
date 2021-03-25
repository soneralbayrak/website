#!/bin/zsh
 
BASEDIR=$(dirname "$0")
cd $BASEDIR

# kill -9 `cat save_pid.txt`
kill $(lsof -t -i:4000)
# rm save_pid.txt
rm my.log

kill -9 $PPID

osascript -e 'tell application "Terminal" to close first window' & exit