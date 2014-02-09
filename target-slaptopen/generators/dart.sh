#!/bin/bash

if [[ ! -f $1/files/generated/darteditor-linux-ia32.zip ]]
then
  wget --no-check-certificate -O $1/files/generated/darteditor-linux-ia32.zip "http://storage.googleapis.com/dart-archive/channels/stable/release/latest/editor/darteditor-linux-ia32.zip"
fi
