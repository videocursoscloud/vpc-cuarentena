#!/bin/bash
set +x
mkdir /tmp/packer
cd /tmp/packer
rm packer*

yum install wget -y
wget https://releases.hashicorp.com/packer/1.5.5/packer_1.5.5_linux_amd64.zip
unzip packer_1.5.5_linux_amd64.zip
chmod +x ./tmp/packer
