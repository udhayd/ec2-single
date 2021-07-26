#! /bin/bash
set -e

#### Function for help
usage() {
echo "Usage: $0 [options]"
echo " -n, --name  name of stack"
	}

#### To validate the Arguments
if [ $# -eq 2 ]
then
  echo "Executing Stack"
  echo 
else
usage
exit
fi

#### Wrapper script Execution
AWS_DEFAULT_REGION=us-west-2
AWS_REGION=us-west-2
cd ./vpc
bash provision.sh  $1  $2
cd ../ec2
bash provision.sh  $1  $2
