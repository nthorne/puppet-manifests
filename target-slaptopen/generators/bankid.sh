#!/bin/bash

if [[ ! -f $1/files/generated/bankid.tar.gz ]]
then
  wget --no-check-certificate -O $1/files/generated/bankid.tar.gz "https://install.bankid.com/Download?defaultFileId=Linux"
  tar xf $1/files/generated/bankid.tar.gz -C $1/files/generated
fi
