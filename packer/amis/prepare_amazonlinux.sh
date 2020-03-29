#!/bin/bash
mkdir /tmp/packer
cd /tmp/packer
rm packer_1.5.5_linux_amd64.zip packer
yum install wget -y
wget https://releases.hashicorp.com/packer/1.5.5/packer_1.5.5_linux_amd64.zip
unzip packer_1.5.5_linux_amd64.zip
mv packer /usr/local/bin/packer
chmod +x /usr/local/bin/packer
