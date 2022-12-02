#!/bin/bash
# Script for evaluation

touch marksheet.csv
touch distribution.txt
for dir in ./organised/*/     # list directories in the form "/organised/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    folder=${dir##*/}    # store everything after the final "/"
    cd organised
    cd $folder
    MARKS=0
    mkdir student_outputs
    for file in *.cpp
    do
	g++ $file -o executable 2> /dev/null
    done
    cd ..
    cd ..
    cd mock_grading
    cd inputs
    for entry in *.in
    do
	output=$(echo "$entry" | cut -d "." -f 1)
	timeout 5 ../../organised/$folder/executable < $entry > ../../organised/$folder/student_outputs/$output.out 2> /dev/null |:
	FILE1=../outputs/$output.out
	FILE2=../../organised/$folder/student_outputs/$output.out
	if cmp --silent -- "$FILE1" "$FILE2"; then
	   ((MARKS=MARKS+1))
        else
	   ((MARKS=MARKS+0))
        fi
    done
    cd ..
    cd ..
    echo "$folder,$MARKS" >> marksheet.csv
    sort -nr --field-separator=',' --key=2 marksheet.csv | cut -d "," -f 2 > distribution.txt
done

