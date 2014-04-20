#!/bin/bash

if [[ ! -f $1/files/generated/go_appengine_sdk_linux_386.zip ]]
then
  wget --no-check-certificate -O $1/files/generated/go_appengine_sdk_linux_386.zip "https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_386-1.9.3.zip"
fi
