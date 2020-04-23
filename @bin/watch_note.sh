#!/bin/bash

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