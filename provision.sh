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
if [ $# -ne 2 ]
then
    usage
    exit
fi

env|egrep -w 'AWS_CONTAINER_AUTHORIZATION_TOKEN|AWS_DEFAULT_REGION' >/dev/null 2>&1 || env|egrep -w 'AWS_ACCESS_KEY_ID|AWS_SECRET_ACCESS_KEY|AWS_DEFAULT_REGION' >/dev/null 2>&1

if [ $? -ne 0 ]
then
    echo "One of following variables missing 'AWS_ACCESS_KEY_ID|AWS_SECRET_ACCESS_KEY|AWS_DEFAULT_REGION', Please configure the same"
    exit
fi

echo "Executing Script"
aws cloudformation list-exports|grep "MyVPCID" >/dev/null 2>&1
if [ $? -ne 0 ]
then
    echo ""
    echo "Network stack doesnt exist, Executing VPC Stack First ..."
    export VPC_STACK_NAME=$2-vpc;echo "VPC_STACK_NAME=$2-vpc" >vars.sh && bash vpc/provision.sh -n $2
else
    echo ""
    echo "Executing EC2 Stack ..."
    export EC2_STACK_NAME=$2-ec2;echo "EC2_STACK_NAME=$2-ec2" >>vars.sh && bash ec2/provision.sh -n $2
    echo ""
fi
