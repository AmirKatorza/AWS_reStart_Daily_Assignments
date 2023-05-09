#! /bin/bash

function start_instances() {
    stopped_instances_list=( $(aws ec2 describe-instances \
    --filter "Name=instance-state-name,Values=stopped" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text) )
    
    if [ ${#stopped_instances_list[@]} -eq 0 ]; then
        echo "All instances are running! No stopped instances."
        exit 0
    fi
    
    echo "Turning on stopped instances ids: "
    for instance in ${stopped_instances_list[@]}; do
        echo "Turning on instanceId: $instance"
        aws ec2 start-instances --instance-ids $instance 
    done
    echo                
}

function stop_instances() {
    running_instances_list=( $(aws ec2 describe-instances \
    --filter "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text) )
    
    local arr_len=${#running_instances_list[@]}
    
    if [ $arr_len -eq 0 ]; then
        echo "All instances are Stopped! No running instances."
        exit 0
    fi
    
    echo "Listing Running instances ids:"
    for ((i = 1 ; i <= $arr_len ; i++)); do
        echo "$i. ${running_instances_list[$i-1]}"
    done
    echo "$i. All"   
    
    local flag=0
    local pat="[1-$arr_len]"
    while [ $flag -eq 0 ]
    do
        read -p "Which instace would you like to stop? " choice
        if [[ $choice =~ $pat ]]; then
            if [[ $choice -eq $arr_len+1 ]]; then
                echo "Stopping ALL instances!!!!"
                aws ec2 stop-instances --instance-ids ${running_instances_list[@]}
            else
                echo "Stopping instance: ${running_instances_list[$choice-1]}"
                aws ec2 stop-instances --instance-ids ${running_instances_list[$choice-1]}
            fi
            flag=1
        else
            echo "Invalid input please enter a number between 1 - $arr_len"
        fi
    done
    echo
}

function terminate_instance() {
    instances_list=( $(aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text) )
    
    local arr_len=${#instances_list[@]}
    
    if [ $arr_len -eq 0 ]; then
        echo "No instances to show."
        exit 0
    fi
    
    echo "Listing instances ids:"
    for ((i = 1 ; i <= $arr_len ; i++)); do
        echo "$i. ${instances_list[$i-1]}"
    done
    echo "$i. All"   
    
    local flag=0
    local pat="[1-$arr_len]"
    while [ $flag -eq 0 ]
    do    
        read -p "Which instace would you like to terminate? " choice
        if [[ $choice =~ $pat ]]; then
            if [[ $choice -eq $arr_len+1 ]]; then
                echo "Terminating ALL instances!!!!"
                aws ec2 terminate-instances --instance-ids ${instances_list[@]}
            else
                echo "Terminating instance: ${instances_list[$choice-1]}"
                aws ec2 terminate-instances --instance-ids ${instances_list[$choice-1]}
            fi
            flag=1
        else
            echo "Invalid input please enter a number between 1 - $arr_len"
        fi
    done
    echo                                         
}

function create_EBS() {
    
    echo "Creating EBS Volume..."
    local vol_id=$(aws ec2 create-volume \
    --volume-type gp2 \
    --size 10 \
    --availability-zone us-west-2b | grep -Eo 'vol-[0-9a-zA-Z]+')

    local instances_list=( $(aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text) )
    
    local arr_len=${#instances_list[@]}
    
    if [ $arr_len -eq 0 ]; then
        echo "No instances to show."
        exit 0
    fi
    
    echo "Listing instances ids:"
    for ((i = 1 ; i <= $arr_len ; i++)); do
        echo "$i. ${instances_list[$i-1]}"
    done
    
    local flag=0
    local pat="[1-$arr_len]"
    while [ $flag -eq 0 ]
    do    
        read -p "For which instace would you like to attach the EBS volume? " choice
        if [[ $choice =~ $pat ]]; then
            echo "Attaching EBS volume to instance: ${instances_list[$choice-1]}"
            aws ec2 attach-volume --volume-id $vol_id --instance-id ${instances_list[$choice-1]} --device /dev/sdf
            flag=1
        else
            echo "Invalid input please enter a number between 1 - $arr_len"
        fi
    done
    echo      
}

function main() {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Start Instances"
            echo "2. Stop Intances"
            echo "3. Terminate an instance"
            echo "4. Create a new EBS volume and attach to instance"
            echo "5. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) start_instances ;;
            2 ) stop_instances ;;                 
            3 ) terminate_instance ;;
            4 ) create_EBS ;;
            5 ) 
                flag=1 
                ;;
            * ) 
                echo "Invalid Choice, Please try again!"
                echo 
                ;;            
            esac
        done
}

main