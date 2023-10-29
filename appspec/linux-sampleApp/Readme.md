# Using Linux OS
- Always make sure the CodeDeploy Agent is installed

# Installing CodeDeploy Agent
This is a bash script for the installation. 
``````
#!/bin/bash
sudo yum update -y
sudo yum install -y ruby wget
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status
``````

# Installing Commands
SSH into ec2 server
- $ nano script.sh  = insert installation code
- $ chmod 755 script.sh
- $ ./script.sh

# Check CodeDeploy Agent Status
Check if the agent is running. 
- $ sudo service codedeploy-agent status
- $ sudo service codedeploy-agent start            = use this if agent is not running
