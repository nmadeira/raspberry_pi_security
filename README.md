# Raspberry Pi Security

This project contains a handful of very simple bash scripts that are to be run on a Raspberry Pi.  The scripts allow for easy maintenance of basic security features involved with keeping a Raspberry Pi secure.  Below are descriptions of the scripts and the reasoning behind them:

#####users_and_passwords/add_user.sh
A wrapper around adding a new user to the Pi.  The default on the Pi user has username 'pi', which is widely known. Adding a new user and even removing the user 'pi' helps prevent SSH brute force attacks.

#####users_and_passwords/change_user_password.sh
A wrapper around changing the password for a user.  The default password for the user 'pi' is 'raspberry', so if you do not change your password then you are just asking for people to SSH into your Pi.

#####ssh_config/disable_ssh_password_authentication.sh
Edits the SSH config file to turn off password authentication.  This allows the use of SSH Key Pair Authentication, which is much more secure than password authentication.  See below for more details.

#####ssh_config/enable_ssh_password_authentication.sh
Edits the SSH config file to turn on password authentication.  See below for more details.

#####ssh_config/disable_ssh_root_login.sh
Edits the SSH config file to turn off the ability to SSH into the Pi as the root user.

#####ssh_config/enable_ssh_root_login.sh
Edits the SSH config file to turn on the ability to SSH into the Pi as the root user.

#####fail2ban/configure_fail2ban.sh
Configures the Fail2ban configuration file to set properies of Fail2ban

###What is SSH Key Pair Authentication?
SSH Key Pair Authentication allows you to SSH into your Pi without entering a password.  It uses a public/private key pair to authenticate whoever is attemping to SSH in.  Only those computers with the private key will be able to SSH into the Pi, which makes it incredibly secure.  But, if you would need to SSH into your Pi from a computer that does not have the private key on it, then you would not be able to.  This is more secure, but less flexable.  See the following guide for how to get started with SSH Key Pair Authentication: 

###What is Fail2ban?
Fail2ban is a service that blocks users from SSH-ing into your Pi if they incorrectly guess your password more than X times per 10 minutes.  This prevents brute force attacks.  The value 'X' and the amount of time people are blocked before they can try again are able to be set with the configure_fail2ban.sh script.

### Version
1.0

### Installation

No installation necessary.  They are just bash scripts, so get them onto your Pi and run them.  For instructions about getting up SSH Key Pair Authentication, see this:
* http://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md

To install Fail2ban, run the following:

```sh
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install fail2ban
```


