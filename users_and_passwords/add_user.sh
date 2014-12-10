#!/bin/bash
echo "Please new enter username:"
read username
echo "Please enter the new password:"
read -s password1
echo "Please repeat the new password:"
read -s password2

# Check both passwords match
if [ $password1 != $password2 ]; then
    echo "Passwords do not match"
     exit    
fi

# Create the home directory
sudo mkdir /home/$username

# Create the user
sudo useradd $username -d /home/$username

# Set the user's password
echo -e "$password1\n$password1" | sudo passwd $username
