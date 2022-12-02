#!/bin/sh
cp sample.txt output.txt

sed -i -e "s/^/ / g" output.txt
sed -i -e 's/$/ / g' output.txt

sed  -i -e 's!www.[^[:space:]]*!!g' -e 's!http\(s\)\{0,1\}:[^[:space:]]*!!g' -e "s/[^ a-zA-Z]//g" -e 's/\(.*\)/\L\1/' -e 's/\s\+/ /g' -e 's/ [a-zA-Z0-9]\{2\} / /g' -e 's/ [a-zA-Z0-9]\{1\} / /g' -e '/^[[:space:]]*$/d' output.txt

while read p; do
   var=$p
   sed -i -e "s/ $var / / g" output.txt
done < stopwords.txt

while read p; do
	var=$p
	sed -i -e "s/$var /-/ g" output.txt
done < suffixes.txt

sed -i -e "s/-/ / g" output.txt

sed -i -e "s/  */ /g" output.txt
sed -i -e "s/^.// g" output.txt
sed -i -e '/^[[:space:]]*$/d' output.txt
sed -i 's/[[:blank:]]*$//' output.txt
