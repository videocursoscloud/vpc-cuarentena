#!/bin/bash
sudo yum install wget -y
wget https://releases.hashicorp.com/packer/1.5.5/packer_1.5.5_linux_amd64.zip
unzip packer_1.5.5_linux_amd64.zip
sudo mv packer /usr/local/bin/packer
sudo chmod +x /usr/local/bin/packer
