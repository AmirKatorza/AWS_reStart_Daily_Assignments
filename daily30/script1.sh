#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p WorldCup2022/{TeamF/{Belgium,Canada,Morocco},TeamG/{Brazil,Serbia,Cameroon}}
    tree WorldCup2022/
    echo

    echo "2. Write a fact about Canada in Toronto.txt File under Canada subdirectory"
    echo "The Capital city of Canada is Ottawa" >> WorldCup2022/TeamF/Canada/Toronto.txt
    cat WorldCup2022/TeamF/Canada/Toronto.txt
    tree WorldCup2022/
    
    echo "3. Rename Serbia to Switzerland"
    mv WorldCup2022/TeamG/Serbia/ WorldCup2022/TeamG/Switzerland/
    tree WorldCup2022/    

    echo "4. Create Files toto.txt followed by A-E (for ex, totoA. totoB…) in your current directory" 
    mkdir WorldCup2022/TOTO/
    touch WorldCup2022/TOTO/toto{A..E}.txt
    tree WorldCup2022/

    echo "5. Create a file named Cup and assign the permissions to -r--r--r Under WorldCup2022"
    touch WorldCup2022/Cup.txt;chmod 444 WorldCup2022/Cup.txt
    ls -l WorldCup2022/

    echo "6. Assign -rwx------- to Cup.txt"
    chmod 700 WorldCup2022/Cup.txt
    ls -l WorldCup2022/

    echo "7. Create a new user named FIFA."
    sudo useradd FIFA
    sudo id FIFA

    echo "8. Create a file by your regular user and make sure that FIFA user cannot read the content."
    touch WorldCup2022/Messi.txt
    setfacl -m u:FIFA:--- WorldCup2022/Messi.txt
    getfacl WorldCup2022/Messi.txt

    echo "9. Create another file named Maradona that the user FIFA can read but cannot write."
    touch WorldCup2022/Maradona.txt
    setfacl -m u:FIFA:r-- WorldCup2022/Maradona.txt
    getfacl WorldCup2022/Maradona.txt

    echo "10. Delete WorldCup2022 Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf WorldCup2022/
    fi

    echo "11. Delete the new users."
    choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete use FIFA: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        sudo userdel -r FIFA
    fi            
}

function check_PID_running() {
# Code a bash function which receives a PID.
# The function will check periodically (in a method of your choice - at, chron, sleep Etc. ... )
# whether the process is up.
# if the proccess is down - a new file named "WARNING - pid -number: [PID] is DOWN" will be
# created in the user home dir

    read -p "Please Enter service name: " SERVICE
    if pidof "$SERVICE" >/dev/null
    then
        echo "$SERVICE is running"
    else
        echo "$SERVICE stopped"          
    fi

    read -p "Please Enter PID number: " PID
    if ps -p $PID > /dev/null
    then
        echo "$PID is running"   # Do something knowing the pid exists, i.e. the process with $PID is running
    else
        touch ./WARNING-pid-number:[$PID]_is_DOWN.txt
    fi
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. check PID running"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                check_PID_running 
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