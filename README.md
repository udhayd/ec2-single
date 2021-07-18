# first

Please download the code from release branch and execute below steps.

PREQUISITES : aws cli to be installed (Or) please execute below steps from aws cloud shell .

## To download the script
$ git clone -b release https://github.com/udhayd/first

$ cd ec2-task

## To Create the Stack
$ ./provision.sh -n "name of stack"

## To Destroy the Stack
$ ./destroy.sh

## To Access the index.html
Please verify the websever access through Elastic IP Address http://ipaddress
