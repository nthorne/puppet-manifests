#!/bin/bash

if [[ ! -f $1/files/generated/spideroak.deb ]]
then
  wget -O $1/files/generated/spideroak.deb https://spideroak.com/getbuild?platform=ubuntu&arch=i386
fi
