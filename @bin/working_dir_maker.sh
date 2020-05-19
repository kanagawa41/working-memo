#!/bin/bash -xe

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

cp -r $ORIGIN_DIR/ $DIR

# 05/19(new) 05/18(get this) 05/17...
LAST_PATH=`ls -d $SCRIPT_DIR/../20* | sort -nr | head -2 | tail -1`
if [ -d "$LAST_PATH" ]; then
  cp -f $LAST_PATH/todo.md $DIR
  echo "todo.md was copied from $LAST_DIR."
fi
