#! /bin/bash

read -p "What is your favorite color? " color

case $color in
	"red" ) 
		echo "Good choice! Red is a great color" ;;
	"blue" ) 
		echo "Blue is a nice color" ;;
	"green" ) 
		echo "Green  is a good choice too!" ;;
	* )
		echo "Sorry, I don't recognize that color." ;;
esac
