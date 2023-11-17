# Adding Worker Node

## What to do.
  1. Add credentials
  2. Add node

## Add Credentials
  1. Manage Jenkins --> Manage Credentials --> System --> Global credentials --> Add credentials
  2. Provide the below info to add credentials
``````
kind:            ssh username with private key
Scope:           Global
ID:              maven_worker
Username:        ec2-user
private key:     key.pem key content
Add node
``````

## Setup steps to add a new worker node to Jenkins.
  1. Go to Manage Jenkins -> Manage nodes and clouds -> New node -> Permanent Agent
  2. Provide the below info to add the node
``````
Number of executors:   2
Remote root directory: /home/ec2-user/jenkins
Labels:                ec2-worker
Usage:                 Use this node as much as possible
Launch method:         Launch agents via SSH
Host:                  <Private_IP_of_Slave>
Credentials:           <ec2-worker-credentials>
Host Key Verification Strategy: Non verifying Verification Strategy
Availability:          Keep this agent online as much as possible
``````
