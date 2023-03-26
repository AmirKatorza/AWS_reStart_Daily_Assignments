#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p AWS/{EC2/{Instances,SecurityGroups},S3/{API,Images},RDS/{Instances,Snapshots,Objects}}
    tree AWS/
    echo

    echo "2. Move Objects/ to S3/"
    mv AWS/RDS/Objects/ AWS/S3
    tree AWS/
    
    echo "3. Rename api/ to Buckets/"
    mv AWS/S3/API/ AWS/S3/Buckets/
    tree AWS/

    echo "4. Copy Images/ to EC2 in absolute path" 
    cp -r ${PWD}/AWS/S3/Images ${PWD}/AWS/EC2/
    tree AWS/

    echo "5. Delete S3/Images in relative path"
    rm -rvf AWS/S3/Images/
    tree AWS/

    echo "6. Create a new file named RDS/rds.txt"
    touch AWS/RDS/rds.txt
    tree AWS/
    
    echo "7. Delete AWS Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf AWS/
    fi    
}

function check_file_exists_delete() {
    # Write a Bash script that prompts the user for a filename and checks if the file
    # exists in your current directory. If the file exists, prompt the user for confirmation
    # to delete it. If the user confirms, delete the file.

    touch test.txt
    
    local pattern="^\w+[.]?\w*$"
    local flag=0
    while [ $flag -eq 0 ]
    do
        read -p "Please Enter file name to search: " fname
        if [[ $fname =~ $pattern ]]; then    
            flag=1
            if [ -f "$fname" ]; then
                local choice="a"
                while [[ $choice =~ [^yYnN] ]]
                do
                    read -p "Are you Sure you want to delete the file: [Y/n] " choice
                done 
                if [[ $choice =~ [yY] ]]; then
                    rm -vf "$fname"
                fi
            fi
        else
            echo "Please enter a valid file name without spaces!"
        fi
    done       
}

function main () {

flag=0
while [ $flag -eq 0 ]
	do
	    echo "-------------MENU---------------------"
        echo "1. Linux Drills"
        echo "2. Check if file exists and delete"
        echo "3. Quit"        
        echo -e "--------------------------------------\n"
        
        read -p "Please enter your choice: " user_choice           
        case $user_choice in
		1 ) 
            linux_drills 
            ;;
		2 ) 
            check_file_exists_delete 
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