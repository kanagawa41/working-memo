#!/bin/bash
##!/bin/bash -xe

SCRIPT_DIR=$(cd $(dirname $0); pwd)

YES_FLAG=false
while (( $# > 0 ))
do
    case "$1" in
        -y)
          YES_FLAG=true
          shift
          ;;
        *)
            ((++argc))
            argv=("${argv[@]}" "$1")
            shift
            ;;
    esac
done

ORIGIN_DIR=$SCRIPT_DIR/../origin
[ ! -d "$ORIGIN_DIR" ] && echo "Directory $ORIGIN_DIR DOES NOT exists." && exit 1

INDEX_DIR=$SCRIPT_DIR/../@index
TODAY_DIR=$INDEX_DIR/$(date +"%Y%m%d")

while [ "$YES_FLAG" = false ]; do
  read -p "Do you wish to create directory $DIR?: " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

cp -r $ORIGIN_DIR/ $TODAY_DIR

# execute this in 05/19
# Folderes are 05/17, 05/16, 05/15 etc...
#
# 05/17 is be selected.
LAST_PATH=`ls -d $INDEX_DIR/20* | sort -nr | head -2 | tail -1`
if [ -d "$LAST_PATH" ]; then
  cp -f $LAST_PATH/todo.md $TODAY_DIR
  # Clear list of "DONE"
  head -`grep -n "# DONE" $TODAY_DIR/todo.md | cut -d: -f1` $TODAY_DIR/todo.md > $TODAY_DIR/todo.md.tmp
  mv $TODAY_DIR/todo.md.tmp $TODAY_DIR/todo.md
  echo "todo.md was copied from $LAST_DIR."

  # WARN: not add Brackets in this condition
  if ls $LAST_PATH/over_*.md 1> /dev/null 2>&1; then
    cp -f $LAST_PATH/over_*.md $TODAY_DIR
    echo "over_*.md was copied from $LAST_DIR."
  fi
fi
