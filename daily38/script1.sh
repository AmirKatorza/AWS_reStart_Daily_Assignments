#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p aws/{compute/{mango,lambda},storage/{s3,vpc},database/rds,networking}
    tree aws/
    echo

    echo "2. Move vpc to networking."
    mv aws/storage/vpc aws/networking
    tree aws/
    echo
    
    echo "3. Rename mango to ec2."
    mv aws/compute/mango aws/compute/ec2
    tree aws/    
    echo
    
    echo "4. Create a new file named cloudcloud in networking"
    touch aws/networking/cloudcloud.txt
    tree aws/
    echo

    echo "5. Copy the file to compute subdir." 
    cp aws/networking/cloudcloud.txt aws/compute/
    tree aws/
    echo    

    echo "6.Copy the dir S3 to AWS"
    cp -r aws/storage/s3 aws/
    tree aws/
    echo

    echo "7. Delete aws Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf aws/
    fi     
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                flag=1 
                ;;
            * ) 
                echo "Invalid Choice, Please try again!" 
                ;;            
            esac
        done
}

main