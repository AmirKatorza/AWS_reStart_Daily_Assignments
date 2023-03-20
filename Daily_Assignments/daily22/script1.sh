#! /bin/bash

i=1
for f in dir/* 
do
    $(mv $f dir/document$i.txt)
    (( i++ ))
done