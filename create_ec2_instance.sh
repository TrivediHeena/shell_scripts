#!/bin/bash

echo "Enter ACCESS KEY"
read -s access_key
echo "Enter Secret Key"
read -s secret_key
read -p "Enter AMI " image_id
read -p "Enter number of instances that you want to create " count
read -p "Enter instance type " instance_type
read -p "Enter key/pair file name " key_name
read -p "Want to create a new key (Press c) or use existing (Press e)? " ch_key
if [ "$ch_key" == "c" ]
then
                aws ec2 create-key-pair --key-name ${key_name} --query 'KeyMaterial' --output text > ${key_name}.pem
fi
aws ec2 run-instances --image-id ${image_id} --count ${count} --instance-type ${instance_type} --key-name ${key_name}
