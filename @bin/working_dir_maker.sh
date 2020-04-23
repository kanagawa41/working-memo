#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ -z "$1" ]
  then
    echo "No argument supplied. give me a direcotry name for copying direcotry from."
    exit 1
fi

ORIGIN_DIR=$SCRIPT_DIR/../$1
[ ! -d "$ORIGIN_DIR" ] && echo "Directory $ORIGIN_DIR DOES NOT exists." && exit 1

DIR=$SCRIPT_DIR/../$(date +"%Y%m%d")

while true; do
  read -p "Do you wish to create directory $DIR?: " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

cp -r $ORIGIN_DIR $DIR