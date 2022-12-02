#!/bin/bash
rm -f del.txt
rm -f data.txt
rm -f output.txt

cat covid_status.html | sed "s/<[^>]\+>// g" > del.txt

sed -i -e "s/&nbsp;/ / g" del.txt           #removing unwanted character string
sed -i -e '/^[[:space:]]*$/d' del.txt       #removing empty lines
sed -i -e 's/^[ \t]*//' del.txt             #removing spaces at beginning of line
sed -i -e '/State Name/!d' del.txt          #removing the unwanted lines
sed -i -r 's/([0-9])([a-zA-Z])/\1 \2/g; s/([a-zA-Z])([0-9])/\1 \2/g' del.txt  #insert space between digit and alphabet
sed -i 's/\([^[:blank:]]\)\([[:upper:]]\)/\1 \2/g' del.txt  #insert space before capital letters
sed -i 's/: /:/ g' del.txt
sed -i 's/ Total/:Total/ g' del.txt
sed -i 's/ Cured/:Cured/ g' del.txt

while read line; do
v=$line
awk -v v="$v" '
BEGIN {
        FS=":"
}
{
        if(v==$2) {
                arr[$2]=$4
        }
}
END {
        for(i in arr)
        {
                printf("%s %d \n", i,arr[i])
        }
}' del.txt >> data.txt
done < sample.txt
awk '{print $NF,$0}' data.txt | sort -n | cut -f2- -d' ' > output.txt
rm -f del.txt
rm -f data.txt
