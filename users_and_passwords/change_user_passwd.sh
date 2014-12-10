#!/bin/bash
echo "Please enter username:"
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

# Does User exist?
id $username &> /dev/null
if [ $? -eq 0 ]; then
    echo "$username exists... changing password."
else
    echo "$username does not exist - Password could not be updated for $username"; exit 
fi

# Change password
echo -e "$password1\n$password1" | sudo passwd $username
