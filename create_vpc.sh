#!/bin/bash

#Create VPC

read -p "Enter your region " region
read -p "Enter VPC Name " vpc_name

$VPC_CREATED=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specification ResourceType=vpc,Tags=[{Key=Name,Value=${vpc_name}}])

logger -i " VPC Created '$VPC_CREATED' in the AWS Region '$region'"

read -p "Enter availability zone to create subnet " subnet_public
# read -p "Enter the name of public subnet " subnet_public_name

$SUBNET_PUBLIC=$(aws ec2 create-subnet --vpc-id $VPC_CREATED --cidr-block 10.0.1.0/24 --availability-zone $subnet_public --region $region)

logger -i "Public Subnet Created '$SUBNET_PUBLIC'"
