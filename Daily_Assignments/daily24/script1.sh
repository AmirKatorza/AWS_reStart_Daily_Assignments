#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p Pokemon/{Squirtle/{Wartortle,Arbok},Caterpie/{Metapod,Butterfree}}
    tree Pokemon
    echo

    echo "2. Go to Arbok dir"
    cd ${PWD}/Pokemon/Squirtle/Arbok/
    pwd
    
    echo "3. Rename Arbok to Blastoise"
    mv ../Arbok ../Blastoise
    tree ../../../Pokemon/
    echo

    echo "4. Go to “Butterfree” using a relative path" 
    cd ../../Caterpie/Butterfree/
    pwd
    echo

    echo "5. Insert a sentence to a new file Factabtwar.txt"
    echo “Wartortle is a water pokemon in Pokedex” > Factabtwar.txt
    tree ../../../Pokemon/
    echo

    echo "6. Return back to Pokemon in relative path."
    cd ../../
    pwd
    echo
    
    echo "7. Move the file Factabtwar.txt from Butterfree to Wartortle"
    mv Caterpie/Butterfree/Factabtwar.txt Squirtle/Wartortle/
    tree ../Pokemon/
    echo

    echo "8. Display and save only the user permissions of files under Pokemon in iPokemon.txt file."
    ls -l | cut -c2-4 | tee iPokemon.txt
    cat iPokemon.txt

    echo "9. Delete Pokemon Directory"
    read -p "Are you Sure you want to delete: [y/n] " choice
    if [ $choice == "y" ]
    then
        cd ../
        rm -rvf Pokemon/
    fi    
}

function add_two() {
    # Create a new file named “numbers.txt” and insert the values from 1- 10 line by line.
    # Write a script as a function using for loop that adds 2 to every values in numbers.txt

    touch numbers.txt
    file=numbers.txt
    
    for i in {1..10}
    do
        echo "$i" >> $file
    done
    echo "---Print the original file---"
    cat $file    
    echo -e "-----------------------------\n"

    i=1        
    for line in $(cat $file)
    do
        new_num=$(( $line+2 ))
        sed -i "$i s/$line/$new_num/" $file
        (( i++ ))
    done  
    echo "---Print the modified file---"
    cat $file           
    echo -e "-----------------------------\n"
    rm -v $file
}

function main () {

flag=0
while [ $flag -eq 0 ]
	do
	    echo "-------------MENU---------------------"
        echo "1. Linux Drills"
        echo "2. Add two Function"
        echo "3. Quit"
        echo -e "--------------------------------------\n"
        
        read -p "Please enter you choice: " user_choice           
        case $user_choice in
		1 ) 
            linux_drills 
            ;;
		2 ) 
            add_two 
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