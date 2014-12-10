#!/bin/bash

# Make sure Fail2ban is installed
message="Fail2ban config file not found. Try installing Fail2ban with
the following command:\n\n\tsudo apt-get install fail2ban\n"
[ ! -f /etc/fail2ban/jail.conf ] && echo -e $message && exit

# Print welcome message
echo -e "\nWelcome to Fail2ban configuration.  Fail2ban blocks users from
being able to connect via SSH if they enter the wrong password 
more than 'maxretry' times in 10 minutes'.  They will be blocked 
for 'bantime' seconds.\n"

# Get user input
echo "Enter your value for 'maxretry':"
read maxretry

if [ -z "$maxretry" ]; then
    echo "Must enter a value for 'maxretry'. Exiting."
    exit
fi

echo "Enter your value for 'bantime':"
read bantime

if [ -z "$bantime" ]; then
    echo "Must enter a value for 'bantime'. Exiting."
    exit
fi

# Edit the config file
TARGET_KEY="maxretry"
REPLACEMENT_VALUE=$maxretry
CONFIG_FILE="/etc/fail2ban/jail.conf"
sudo sed -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE

TARGET_KEY="bantime"
REPLACEMENT_VALUE=$bantime
sudo sed -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE

