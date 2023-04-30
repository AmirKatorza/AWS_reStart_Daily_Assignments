#! /bin/bash

authorized_users=(alice bob charlie)
read -p "Please enter your username: " user

flag=0
for name in ${authorized_users[@]}
do 
	if [ "$user" == "$name" ];
	then
		echo "valid"
		flag=1
		break
	fi
done

if [ $flag -eq 0 ];
then
	echo "invalid"
fi

