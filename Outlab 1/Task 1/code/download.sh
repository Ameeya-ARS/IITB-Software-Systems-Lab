#!/bin/bash
#download script

LINK=$1
VALUE=$2

if(($# == 2))
then
    wget -q -r -np -nH --reject html --cut-dirs=$VALUE "$LINK"
    find . -name "*.tmp" | xargs rm
else
    echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
    exit 1
fi

FOLDER=$(ls -d */ | cut -d "/" -f 1)
FOLDER_NAME="$FOLDER"

if [ "$FOLDER_NAME" != "mock_grading" ]; then
    mv ./$FOLDER_NAME ./mock_grading
else
    :
fi
#END of download script

