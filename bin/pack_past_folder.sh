#!/bin/bash

# This script aggregate past folder like as each month in @index folder.
SCRIPT_DIR=$(cd $(dirname $0); pwd)

INDEX_DIR=$SCRIPT_DIR/../@index
OLD_DIR=$SCRIPT_DIR/../old
THIS_MONTH=`echo $(date +"%Y%m%d") | cut -c1-6`

for DIR in `ls $INDEX_DIR`; do
  TARGET_MONTH=`echo $DIR | cut -c1-6`

  if [[ "$TARGET_MONTH" == "$THIS_MONTH" ]]; then
    continue
  fi

  PACKED_DIR=$OLD_DIR/$TARGET_MONTH
  mkdir -p $PACKED_DIR
  mv $INDEX_DIR/$DIR $PACKED_DIR
  echo "$DIR was packed in $PACKED_DIR"
done
