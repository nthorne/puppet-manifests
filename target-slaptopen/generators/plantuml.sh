#!/bin/bash

if [[ ! -f $1/files/generated/plantuml.jar ]]
then
  wget --no-check-certificate -O $1/files/generated/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download
fi
