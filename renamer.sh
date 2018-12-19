#!/bin/bash

FILES=*.RFMETA
[ ! -d "$DIRECTORY" ] && mkdir processed

echo "Started at $(date)"

for f in $FILES
do
  COMPLETEFILE=$(echo $f | rev | cut -c8- | rev)
  UUIDFILE=$(echo $COMPLETEFILE | cut -c-36)
  FILENAME=$(echo $COMPLETEFILE | cut -c38-)
  echo -n "Renaming $UUIDFILE to $FILENAME "
  mv $UUIDFILE $FILENAME
  mv $f processed/
  echo " DONE!"
done

echo "Finished at $(date)"
