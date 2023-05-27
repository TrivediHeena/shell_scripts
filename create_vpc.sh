#!/bin/bash

#Create VPC

read -p "Enter your region " region
read -p "Enter VPC Name " vpc_name

$VPC_CREATED=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specification ResourceType=vpc,Tags=[{Key=Name,Value=${vpc_name}}])

echo " VPC Created '$VPC_CREATED' in the AWS Region '$region'"
