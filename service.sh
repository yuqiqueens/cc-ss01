#!/bin/bash

. /utils.sh

env
print_log "$(env)"

cmd=$1
serviceStatus=""

print_log "Beginning Service Script"


sudo yum install -y python-pip
sudo pip install pip --upgrade
sudo pip install python-swiftclient

print_log "Downloading ss01.py"

# Get the python code for the service
wget -N https://raw.githubusercontent.com/yuqiqueens/cc-ss01/master/ss01.py

case $cmd in
    update)
	;;
    start)
	print_log "Beginning Start"
	print_log "Executing ss01.py"
	python ss01.py start
	print_log "Start Complete"
	sleep 6000
	;;
    stop)
	;;
    suspend)
	;;
    resume)
	;;
    *)
	serviceStatus="No Valid Script Argument"
	exit 127
	;;
esac
print_log "Ending Service Script"
