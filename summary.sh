#!/bin/bash
#this is an example script that solves the smaller
#problems for the actions summary
#1. read a txt file line by line
#2. split a line by spaces
#3. add the firts word in the line

if [ $# -ne 1 ]; then
        echo "Error with the name of arguments"
        echo "Enter license"
        exit
fi
lic=$1
FILE="../Database/$lic.txt"
totalkm=0
while read line
do
    echo $line
    #bash splits a line by spaces
    for km in $line
    do
      echo $km
      #add all the km
      ((totalkm=$km+$totalkm))
      break
    done
done < $FILE
#4. show very nicely the total km traveled
bash frame1 "total km traveled $totalkm"
