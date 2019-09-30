![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
### Definition of the problem 
The company wants to create a new system that should provide them information about the car, how many kms the cars run, record, summary and history of their cars. This system should be better than the last one or a new one that come to improve the company and make the process easier for their workers. However, there are many factors that influence the system or the decision to use it.
	
Sometimes new systems can fail, if this happens the company can be damaged or loose data which will cost money and time. On the other hand, the new system can also be a source of income. For instance, if it’s used efficiently, they can increase the value of their cars. When we decide to use a new system, we should consider all the outcomes for upmost efficiency.  

Design
--------
### First sketch of system 
![SystemDiagram](system.jpg)
### Flow diagram 


Development
--------
###1. Script for installation 
```.sh
#!/bin/bash

#This program create the folder structure for the minimal rental app

echo "Starting installation"
echo "installing in the desktop (default). Press enter"

cd ~/Desktop

#create a folder
mkdir RentalCarApp

cd RentalCarApp
mkdir database
mkdir sripts
echo "installation complete successfully"

```
This script meets the requirement of the client for a simple installation however, it could be simplified so that the user does not need to execute the program by typing ``bash install.sh`` 

### developing the action create new car 
This process involves the inputs _,_,_,_, and the outputs: 
the following steps describe the algorithm 
1 Get the inpusts as the argument '$1 $2 $3 $4'
2 check number of arguments. In bash this case can be done as 'if [ $# -eq 4 ]'
3 store new car inside maincarFile.txt 
4 create file for recording trips as plate.txt

### developing records of the news cars 
this program involves the inputs _,_,_,_, and the outputs:
the following steps describe the algorithm 
1 get the arguments $1 $2 and chec them 
2 check if the car exist, if the file exist in the bash 
3 add a new line to the file license.txt 



### problem solving 
1 how to detect is a word's lenght is ood or even 
     if [ $len%2 -eg 0 ]
     
2 how to create a unstall program 
  rm -r App 
  
  ![SystemDiagram](system1.jpg)  
  
  ![SystemDiagram](system2.jpg)

Evaluation
-----------





