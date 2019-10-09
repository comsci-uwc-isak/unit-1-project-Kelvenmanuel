#!/bin/bash 

#This program create the folder structure for the minimal rental app
 
bash frame1 welcome

echo "Starting installation"
echo "installing in the desktop (default). Press enter"

cd ~/Desktop 

#create a folder 
mkdir RentalCarApp

cd RentalCarApp
mkdir database 
mkdir sripts 
echo "installation complete successfully" 
