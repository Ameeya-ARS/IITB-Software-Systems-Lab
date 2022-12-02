#!/bin/bash
#organising script

mkdir organised
while read line; do mkdir ./organised/$line; done < ./mock_grading/roll_list
cd mock_grading/
FOLDER=$(head -n 1 roll_list)
FOLDER_LEN=${#FOLDER}
cd ../organised
mkdir temp
cd temp
ln -s ../../mock_grading/submissions/* ../../organised/temp/

for file in *; do
	folder=${file:0:$FOLDER_LEN}
	mv $file ../$folder
done

cd ..
rm -r temp
#END of the script
