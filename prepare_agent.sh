#!/bin/bash

yum install unzip wget

wget -q https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip terraform_0.12.26_linux_amd64.zip
mv terraform /usr/local/bin
