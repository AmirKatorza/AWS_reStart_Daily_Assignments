#! /bin/bash

# Write a script that request from the user to select his favorite color from the
# following list: 1 - Blue 2 - Red 3 - Yellow 4 - Green.
# If 1, echos “ Blue is a primary color.” if 2, echos “Red is a primary color.", if 3,
# echos “Yellow is a primary color”. if 4, echos “Green is a secondary color.”.
# otherwise echos “This color is not available.

colors=(Blue Red Yellow Green)

select color in ${colors[@]}
do
    case $color in
    "Blue" )
        echo "$color is a primary color." ;;
    "Red" )
        echo "$color is a primary color." ;;
    "Yellow" ) 
        echo "$color is a primary color." ;;
    "Green" )
        echo "$color is a secondary color." ;;
    * )
        echo "This color is not available" ;;
    esac

done