#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p AWS/{DB/{RDS,DynamDB},Deployment_model/{S3,Hybrid,RedShift,Cloud}}
    tree AWS/
    echo

    echo "2. Go to Hybrid"
    cd AWS/Deployment_model/Hybrid/
    pwd
    
    echo "3. From your current directory, move “Hybrid” to “DB” in relative path."
    mv ../Hybrid ../../DB/
    tree ../../../AWS
    pwd    

    echo "4. From your current directory, rename S3 to On-Premise" 
    mv ../../Deployment_model/S3 ../../Deployment_model/On-Premise
    tree ../../../AWS
    pwd

    echo "5. Copy the directory DB to Deployment_model."
    cd ../../
    pwd
    cp -r DB/ Deployment_model
    tree ../AWS/

    echo "6. Delete AWS Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf ../AWS/
    fi     
}

function print_uppercase() {
# Write a while loop that prompts the user to enter a name and prints out the name in
# uppercase, but only if the name is longer than 5 characters.

    flag=1
    while [ $flag -eq 1 ] 
    do
        read -p "Please enter your name: " name
        name_len=${#name}
        if [ $name_len -gt 5 ]; then
            echo ${name^^}
            flag=0
        else
            echo "Please try again!"
        fi
    done    
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. Print name in uppercase"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                print_uppercase 
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