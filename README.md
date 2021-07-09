# first

Please download the code from release branch and execute below steps.

PREQUISITES : aws cli to be installed (Or) please execute below steps from aws cloud shell .

$ git clone -b release https://github.com/udhayd/first

$ cd ec2-task/ec2

$ export AWS_DEFAULT_REGION=us-west-2

$ export AWS_ACCESS_KEY=

$ export AWS_SECRET_ACCESS_KEY=

$ ./provision.sh -n ec2-stack

Please verify the websever access through Elastic IP Address.
