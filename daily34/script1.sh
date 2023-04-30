#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p BIG/{clothes/{mango,zara,sacara},cosmetics/{flormar,shilav}}
    touch BIG/clothes/zara/{zaraf.txt,zaraf2.txt} BIG/cosmetics/flormar/flormarf.txt
    echo

    echo "2. Display the lists of all bigs dir and subdir by one command."
    tree BIG/
    echo
    
    echo -e "3. Lets fix the mess:\n\
    Rename shilav to jade, In absolute path.\n\
    Go to scara.\n\
    In your current directory Move scara to cosmetics in relative path.\n"
    mv BIG/cosmetics/shilav BIG/cosmetics/jade
    tree BIG/
    cd BIG/clothes/sacara
    mv ../sacara/ ../../cosmetics/
    cd ../../../
    pwd    
    tree BIG/
    echo

    echo "4. Add the following text to zaraf.txt" 
    echo “Mango, is a Spanish clothing design and manufacturing company. Mango was \
    founded in Barcelona. Mango is located in Spain by brothers Isak Andic and \
    Nahman Andic. mango designs, manufactures and markets women's and men's \
    clothing and accessories.” >> BIG/clothes/zara/zaraf.txt
    cat BIG/clothes/zara/zaraf.txt
    echo

    echo "5. From your current directory, Copy the content of zaraf.txt to to flormarf.txt"
    cat BIG/clothes/zara/zaraf.txt >> BIG/cosmetics/flormar/flormarf.txt
    cat BIG/cosmetics/flormar/flormarf.txt
    echo
        
    echo "6. In the file flormarf.txt, replace the word Mango with flormar (include capital and small letters)"
    sed -i "s/mango/flormar/gI" BIG/cosmetics/flormar/flormarf.txt
    cat BIG/cosmetics/flormar/flormarf.txt
    echo

    echo "7. In the file flormarf.txt , replace the words spain and spanish with zanzibar."
    sed -i -E "s/spain|spanish/zanzibar/gI" BIG/cosmetics/flormar/flormarf.txt
    cat BIG/cosmetics/flormar/flormarf.txt
    echo
      
    echo "8. Delete BIG Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf BIG/
    fi     
}

function date_directory() {
# Write a script that creates a new directory with the current date as the name.
    backup_dir=$(date +'%d-%m-%Y')
    echo "Backup dir for today: /backups/${backup_dir}"
    mkdir -p backup/$backup_dir
    local choice="a"
    
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete backup directory: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf backup/
    fi             
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. create date directory"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                date_directory 
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