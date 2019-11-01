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
