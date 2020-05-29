#!/bin/bash

apt update
apt install unzip wget -y
wget -q https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip terraform_0.12.26_linux_amd64.zip
mv terraform /usr/local/bin
