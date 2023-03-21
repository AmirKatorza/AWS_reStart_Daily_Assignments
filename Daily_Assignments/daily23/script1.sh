#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p Cloud/{Services/CloudTrail,Region/{AvailabilityZone,LocalZone}}
    tree Cloud
    echo

    echo "2. Go to local_zone dir"
    cd ${PWD}/Cloud/Region/LocalZone
    echo
    
    echo "3. Add a new dir CloudWatch under Services"
    mkdir ../../Services/CloudWatch/
    tree ../../../Cloud
    echo

    echo "4. Add a new dir WaveLengthZone under LocalZone" 
    mkdir ${PWD}/Cloud/Region/LocalZone/WaveLengthZone
    tree ../../../Cloud
    echo

    echo "5. Insert the following text to a file Trail_VS_Watch under CloudTrail"
    echo -e "The Difference between CloudWatch and CloudTrail: 
             CloudWatch focuses on the activity of AWS services and resources, reporting
             on their health and performance. 
             On the other hand, CloudTrail is a log of all 
             actions that have taken place inside your AWS environment" > ../../Services/CloudTrail/Trail_VS_Watch.txt
    tree ../../../Cloud
    echo

    echo "6. Copy the file Trail_VS_Watch to CloudWatch"
    cp ../../Services/CloudTrail/Trail_VS_Watch.txt ../../Services/CloudWatch/
    tree ../../../Cloud
    echo
    
    echo "7. Print my home path"
    cd ../../../
    path=$(realpath "${BASH_SOURCE:-$0}")
    src_dir=$(dirname $path) 
    echo "$src_dir"
    echo

    echo "8. Delete Cloud Directory"
    read -p "Are you Sure you want to delete: [y/n] " choice
    if [ $choice == "y" ]
    then
        cd $src_dir/Cloud/
        rm -rvf $src_dir/Cloud/
    fi
}

function system_func() {
    # Write a script that asks the user to choose from multiple choice options, then executes
    # his choice.
    # The choices are:
    # 1. Show system information
    # 2. Update packages
    # 3. Reboot
    # 4. Quit

    local flag=0
    while [ $flag -eq 0 ]
    do 
        echo "-------------MENU---------------------"
        echo "1. Show System Information"
        echo "2. Update Packages"
        echo "3. Reboot"
        echo "4. Quit"    
        echo -e "--------------------------------------\n"
        read -p "Please enter you choice: " choice   
        case $choice in
        1 )
            echo "Display system information"
            uname -a
            echo
            ;;
        2 )
            echo "Updating Packages"
            sudo apt update -y
            sudo apt upgrade -y
            echo
            ;;
        3 ) echo "Rebooting"
            sudo reboot
            ;;
        4 ) echo "Quiting"
            flag=1
            ;;
        * )
            echo "Please enter a valid choice"
            # sleep 5
            ;;       
        esac
    done
    # main
}

function main () {

flag=0
while [ $flag -eq 0 ]
	do
		echo "-------------MENU---------------------"
        echo "1. Linux Drills"
        echo "2. System Functions"
        echo "3. Quit"
        echo -e "--------------------------------------\n"
        
        read -p "Please enter you choice: " user_choice           
        case $user_choice in
		1 ) 
            linux_drills 
            ;;
		2 ) 
            system_func 
            ;;
		3 ) 
            flag=1 
            ;;
		* ) 
            echo "Invalid Choice, Please try again!" 
            ;;            
		esac
	done
}

main