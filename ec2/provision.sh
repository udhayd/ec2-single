#! /bin/bash

##################################################################################################################
####  Description: Wrapper Script to create a AWS Cloudformation Stack for ec2 instance with eip attached     ####
####  Version: 1.0v                                                                                           ####
####  Usage: ./provision.sh -n stackname                                                                      ####
##################################################################################################################


#### Function for help
usage() {
    echo "Usage: $0 [options]"
    
    echo " -n, --name  name of stack"
}

#### To validate the Arguments
if [ $# -eq 2 ]
then
  echo "Executing Script"
  aws cloudformation list-exports|grep "MyVPCID" >/dev/null 2>&1
  if [ $? -ne 0 ]
  then
    echo ""
    echo "Network stack doesnt exist, Executing VPC Stack First ..."
    cd ../vpc
    ./provision.sh -n $2-vpc
    echo ""
    cd ../ec2
    echo "Executing EC2 Stack ..."
    echo ""
  fi
  echo ""
  echo "Executing EC2 Stack ..."
else
    usage
    exit
fi

#### Varible Initialization
echo "EC2_STACK_NAME=$2-ec2" >vars.sh
source vars.sh
set -ex

# EC2 Stack Creation
aws cloudformation deploy --template-file ec2.yaml --stack-name $EC2_STACK_NAME --no-fail-on-empty-changeset --capabilities CAPABILITY_IAM
