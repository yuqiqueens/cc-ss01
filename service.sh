#!/bin/bash
# Swiftstack service
 

#if [ -n "$gitTag" ]; then
#    agentSendLogMessage  "Found gitTag parameter gitTag = ${gitTag}"
#else
#     agentSendLogMessage  "Didn't find custom parameter gitTag. Using gitTag=master"
#     gitTag="swiftstack container create"
#fi

sudo yum install -y python-pip
sudo pip install pip --upgrade
sudo pip install python-swiftclient

# Get the python code for the service
echo Getting external service ...
wget https://raw.githubusercontent.com/yuqiqueens/cc-ss01/master/ss01.py

# Run the Service
echo Running Python script ...
python ss01.py
