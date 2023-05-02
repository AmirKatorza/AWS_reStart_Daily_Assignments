#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p grocery/{bakery/bread/{focaccia,challa},drinks/juices/{pepsi,coke}}
    tree grocery/
    echo

    echo "2. Create file coke_not_healthy.txt in Coke."
    touch grocery/drinks/juices/coke/coke_not_healthy.txt
    tree grocery/
    echo
    
    echo "3. Change file permissions to r-xr-xr-x (file coke_not_healthy.txt)."
    chmod 555 grocery/drinks/juices/coke/coke_not_healthy.txt
    ls -l grocery/drinks/juices/coke/
    echo
    
    echo "4. Create file pepsi_zero."
    touch grocery/drinks/juices/pepsi/pepsi_zero.txt
    tree grocery/
    echo

    echo "5. Change file permissions to rwxrwxr-x (file pepsi_zero.txt)." 
    chmod 775 grocery/drinks/juices/pepsi/pepsi_zero.txt
    ls -l grocery/drinks/juices/pepsi/    
    echo    

    echo "6.Copy the file pepsi_zero.txt in bread subdirectories."
    parallel cp -v grocery/drinks/juices/pepsi/pepsi_zero.txt ::: grocery/bakery/bread/focaccia/ grocery/bakery/bread/challa/
    tree grocery/
    echo

    echo "7. Rename Challa to Petta"
    mv grocery/bakery/bread/challa/ grocery/bakery/bread/petta/
    tree grocery
    echo

    echo "8. Move dir Petta to Drinks."
    mv grocery/bakery/bread/petta/ grocery/drinks/
    tree grocery/
    echo

    echo "9. Delete grocery Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf grocery/
    fi     
}

# Write a while loop that prompts the user to enter a sentence and prints out only the
# words that contain the letter "e".
function print_e_words() {
    read -p "Please Enter sentence: " sentence  
    echo $sentence | grep -oi '\w*e\w*' > temp.txt
    while read p
    do
        echo $p
    done < temp.txt
    
    echo
    
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Do you want to delete temp.txt?: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
      rm -rvf temp.txt   
    fi                 
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. print words containig e"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                print_e_words 
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