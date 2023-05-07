#! /bin/bash

num_inst=$(aws ec2 describe-instances \
--query 'Reservations[*].Instances[*].[InstanceId]' \
--output text | wc -l)

echo "Number of Instances: $num_inst"

num_run_inst=$(aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" \
--query 'Reservations[*].Instances[*].State.Name' \
--output text | wc -l)


echo "Number of running Instances: $num_run_inst"

echo "Public IP addresses of running instances: "

aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" \
--query 'Reservations[*].Instances[*].[PublicIpAddress]' \
--output text

num_stop_instance=$(aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=stopped" \
--query 'Reservations[*].Instances[*].State.Name' \
--output text | wc -l)
echo "Number of stopped instances: $num_stop_instance"

