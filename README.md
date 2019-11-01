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

### definition of the problem 
A RENTALCAR company need a program to record the trips, give summary of the car, in other words, a program that a user can use and create, edit and delete cars or keep informatiom of the cars that belong to their company.

### proposed solution
we propose a new program in bash, inside terminal, a easy program to handle and it is in all computers , inside this program we can create new cars,record trips, give the summary and information about the car, the user should be able to handle the program we provide information to user achieve this and solve all issues that he face without this program.


### success criteria 
these outcomes that can be measured 
1. A car can be created 
1. A trip can be recored for a given car 
1. A summary ( total distance travel, averege)
1. A car information can be edited 
1. A basic working backup system is available 
1. the user can easily ( name notation, documentation)
1. Installation is **simple**, it does not require additional software, one step process 
1. A car information can be deleted 
1. the application can be uninstalled 

Design
--------
### First sketch of system 
![SystemDiagram](system.jpg)
### Flow diagram 

### Table/flow chart for test plan 
![SystemDiagram](system123.jpg)

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
```sh
#!/bin/bash

#this program creates a car given four arguments
#licence maker model passangers

if [ $# -ne 4 ]; then
        echo "Error with the number of arguments"
        echo "Enter license maker model passengers"
        exit
fi

#number of arguments is correct, continue
license=$1
maker=$2
model=$3
pp=$$

#this create a new line in the file maincarfile.txt inside CarRentalApp
echo "$license $maker $model $pp" >> ../Database/maincarfile.txt
echo "" > ../Database/$license.txt

bash frame1.sh "New car created successfully"

```
### developing records of the news cars 
this program involves the inputs _,_,_,_, and the outputs:
the following steps describe the algorithm 
1 get the arguments $1 $2 and chec them 
2 check if the car exist, if the file exist in the bash 
3 add a new line to the file license.txt 
```sh
#!/bin/bash

#this programs record a trip in the file of a car provided
if [ $# -ne 2 ]; then
         echo " error with the number of arguments"
         echo "enter license distance"
         exit
fi
km=$2
license=$1
#check if the file exist
cd ../Database
if [ ! -f "$license.txt" ]; then
         echo "car does not exist"
         exit
fi
cd ../scripts
echo "$license $km" >> ../Database/maincarfile.txt
echo "$km" >> ../Database/$license.txt
bash frame1.sh "trip recorded successfully"

```
### developing delete of the new cars 
this program involve inputs _,_,_,_,
the following steps describe the algorithm 
1-- get input ( #licence )
2-- flow diagram : if [ $# -ne 1], then rm -rf
2.1-- check if the car exist 
2.2-- if the car doesn’t exist then show a message to user to put the right arg or lic
3-- delete a new car inside maincarfile 
```sh
#!/bin/bash

#this program delete a car given one argument
#licences
cd ../Database
if [ $# -ne 1 ]; then rm -rf
        echo "error with the number of arguments"
        echo " enter license"
        exit
fi
cd ../scripts
#number of the arguments is correct, continue
license=$1

#this delete an existing file maincarfile.txt inside CarRentalApp
echo "$license" > ../Database/maincarfile.txt
echo "" > ../database/$license.txt

bash frame1.sh "car deleted successufully"
```
### developing summary of the new car 
this program involve inputs_,_,_,_,
the following steps describe the algorithm 
1-- get inputs ( #license )
2-- flow diagram: if [ $# -ne 1] 
3-- check if the car exist 
4-- if the car doesn’t exist then show a message to user to put the right arg or lic
5-- after the user enter the right license the program will show the summary of the car that the user write 
```sh
#!/bin/bash
#This program summarizes the total distance traveled by a car.

total=0
lic=$1
#Read through the car's file
FILE="../Database/$1.txt"
while read line
do
  #Bash splits a line by spaces
  for word in $line
  do
    km=$word
#Calculate the total distance traveled
    (( total=$total + $km ))
    break
  done
done < ../Database/$FILE

#Print the car's file
echo "Trips:"
cd ../Database/
cat $1.txt

#Print the car's total distance travelled
echo "Total distance travelled:"$total "km"
```
### developing backup of the cars 
```sh
#!/bin/bash

# This program creates a backup of the database folder in the app folder
# Either backs up to the desktop, or to an USB stick

# Starting
echo "Backup starting"

##### Save to the desktop
# Navigate to the desktop to create a new folder (backup/)
cd ~/desktop/
# If theres already a folder called "backup", it is removed
rm -r backup
mkdir backup
# Creats subfolder (backup/Database/)
cd backup
mkdir Database

# Copies all (*) the files from the Database folder
# to the new folder (backup/) and subfolder (backup/Database/)
cp ~/desktop/CarRentalApp/Database/* ~/desktop/backup/Database/

### NOT NECESSARY, ONLY FOR AESTHETIC PURPOSES
# Prints the car's file
# Navigates to the folder of the frame1.sh script
cd ~/Desktop/CarRentalApp/scripts/
echo  "Installation complete"


##### Save to a usb stick
# MULTILINE COMMENT
: '
echo -n "What is your USB stick called? "
read usbName

cd /Volumes/%usbName/
# If theres already a folder called "backup", it is removed
rm -r backup
mkdir backup
# Creats subfolder (backup/Database/)
cd backup
mkdir Database

# Copy files to USB stick
cp ~/desktop/CarRentalApp/Database/* /Volumes/$usbName/backup/Database/

' # MULTILINE COMMENT
```
### Script for uninstallation
```.sh
#!/bin/bash

#this program will delete the created folders for the minimal rental app

echo "Starting to uninstall"
echo "uninstalling in the desktop (default). press enter"
read
cd ~/Desktop

rm -r RentalCarApp


echo "uninstallation complete successfully
```

### developing Edit of new cars 
this program involve inputs_,_,_,_,
the following steps describe the algorithm 
1-- get inputs ( #license #model #red #pp )  
```sh
#!/bin/bash
#This program edit the information of an exiting car in the
#maincarfile
#user enters [license place] [model] [red] [pp]

if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Model Passengers"
  exit
fi

license=$1
maker=$2
model=$3
pp=$4

cd ../Database

if [ ! -f "$license.txt" ]; then
  echo "File not found!"
fi

#find the line with the given car plate and delete it
sed -i '' "/^$license/d" maincarfile.txt
#add the new information
echo "$license $maker $model $pp" >> maincarfile.txt
cd ../scripts
bash frame1.sh "Car edited successfully"
```
### problem solving 
1 how to detect is a word's lenght is ood or even 
     if [ $len%2 -eg 0 ]
     
2 how to create a unstall program 
  rm -r App 
  
  ![SystemDiagram](system1.jpg)  
  
  ![SystemDiagram](system2.jpg)

### Developping user help files 

- link to man webpage https://www.cyberciti.biz/faq/linux-unix-creating-a-manpage/ this give more information about man protocal 
- we are using man page protoical to provide help to the users, a manuel of all the commands that we can use in the terminal, this show to user the commands which includes NAME, SYNOPSIS, DESCRIPTIONS, OPTIONS, EXIT STATUS, ERRORS, FILES, EXAMPLES, AUTHORS.( adapted from GeeksforGeeks.com)

Test 1: a car can be created and stored in the dabase 
For this purpose we will create the file testCreate.sh. this is called software testing 

the first step is to check for this file 
```.sh 
cd ../scripts/ 
if [ -f "create.sh" ]; then 
          echo "file exist, test will start now"
else 
          echo "file create.sh does not exist, test failed 
fi 
```
here the option -f in the if condition checks for a file in the wor

this corresponds to Dynamic testing instead of static, alpha testing, white-box and automated testing 


Evaluation
-----------

these outcomes that can be measured 
1. A car can be created 
YES 
2. A trip can be recored for a given car
YES
3. A summary ( total distance travel, averege)
YES
4. A car information can be edited 
YES
5. A basic working backup system is available 
YES
6. the user can easily ( name notation, documentation)
YES
7. Installation is **simple**, it does not require additional software, one step process 
YES
8. A car information can be deleted 
YES 
9. the application can be uninstalled 
YES 

### what we can do to improve this program?
### A:
To improve this program we can create a program that translate the program to, at least, 5 more language therefore we can expand more our program and we should create more programs that give to us more information about the car if there is any damage or something wrong with any of them.
