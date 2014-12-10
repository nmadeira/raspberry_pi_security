#!/bin/bash

sudo sed -i 's/#PermitRootLogin no/PermitRootLogin no/' /etc/ssh/sshd_config

sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo sed -i 's/#PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config

sudo sed -i 's/#PermitRootLogin forced-commands-only/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin forced-commands-only/PermitRootLogin no/' /etc/ssh/sshd_config

