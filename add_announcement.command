#!/bin/zsh
 
BASEDIR=$(dirname "$0")
cd $BASEDIR/_news

now=$(date "+%F-%H-%M-%Z")
basic1="---\nlayout: post\ndate: "
basic2="\ninline: true\n---\n\n"

echo "\nDo you wish to add a new announcement?\n"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "\nEnter announcement:\n";read new; 
		
		echo "${basic1}${now}${basic2}${new}" > "$now.md"; break;;
        No ) break;;
    esac
done


kill -9 $PPID

osascript -e 'tell application "Terminal" to close first window' & exit