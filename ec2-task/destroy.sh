#! /bin/bash
#### Wrapper script Execution
AWS_DEFAULT_REGION=us-west-2
AWS_REGION=us-west-2

cd ./ec2
bash destroy.sh
sleep 200
cd ../vpc
bash destroy.sh
