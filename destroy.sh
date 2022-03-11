#!/bin/bash
###########################################################################################################
####       Description : Script to remove the CFT Stacks from var.sh file                            ###### 
####       Version : 1.0v                                                                            ######
####       Usage : ./destroy.sh                                                                      ######
###########################################################################################################
set -ux

#### Variable file check
if [ ! -f vars.sh ]
then
echo -e '\n' "vars.sh File not found , Please create vars.sh file with appropriate variables" '\n'
exit 1
fi
source vars.sh

#### Deleting individuals CF stacks
if  grep STACK_NAME vars.sh >/dev/null 2>&1
then
    aws cloudformation delete-stack --stack-name $(grep EC2_STACK_NAME vars.sh|awk -F'=' '{print $2}')
    aws cloudformation delete-stack --stack-name $(grep VPC_STACK_NAME vars.sh|awk -F'=' '{print $2}')
else
   echo -e '\n' "No Stack Name Found in vars.sh file"  '\n'
fi
rm vars.sh
