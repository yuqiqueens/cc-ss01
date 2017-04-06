#!/bin/bash
# Swiftstack service

. /utils.sh

#if [ -n "$gitTag" ]; then
#    agentSendLogMessage  "Found gitTag parameter gitTag = ${gitTag}"
#else
#     agentSendLogMessage  "Didn't find custom parameter gitTag. Using gitTag=master"
#     gitTag="swiftstack container create"
#fi

sudo yum install -y python-pip
sudo pip install pip --upgrade
sudo pip install python-swiftclient

cmd = $1

# Get the python code for the service
wget https://raw.githubusercontent.com/yuqiqueens/cc-ss01/master/ss01.py

# Run the Service
python ss01.py ${cmd}
