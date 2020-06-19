#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# This script has watched specifc file.
# Target file is made like below:
# [100951]
# -----------------------------------------------------------------------------------------------------------
# Somememo to write
#
#
#
# [100851]
# -----------------------------------------------------------------------------------------------------------
# Somememo to write
#
#
#
function watch_note {
  FILE="$1"
  echo "watch $FILE"
  LAST=`ls -l "$FILE"`
  while true; do
    NEW=`ls -l "$FILE"`
    LINE=`head -4 $FILE` # Adjust line num
    if [ "$NEW" != "$LAST" ] && [ ${#LINE} -gt 0 ]; then
      sleep 300
      echo -e "\n\n\n\n[$(date +'%H%M%S')]\n-----------------------------------------------------------------------------------------------------------\n\n$(cat $FILE)" > $FILE
      LAST=`ls -l "$FILE"`
    else
      sleep 10
    fi
  done
}

PID_FILE=/tmp/watch_file.pid
if [ -f "$PID_FILE" ]; then
  kill `cat $PID_FILE`
  echo "$(cat $PID_FILE) is killed."
fi

DIR=$SCRIPT_DIR/../@index/$(date +"%Y%m%d")

FILE=$DIR/note.md
echo "Target file: $FILE"
watch_note $FILE &

echo "${!}" > $PID_FILE
echo "pid: `cat $PID_FILE`"
