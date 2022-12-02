#!/bin/bash
N=$1
awk 'BEGIN{FS=OFS="|"} NR>0 && sub(/:/,"|",$1){print}' sample.txt > del.txt
awk '
BEGIN {
        FS="|"
}
{
        if($1==0)
        {
                for(i=2;i<=NF;i++)
                {
                        arr[$i]++
                }
        }
}
END {
        for(i in arr)
        {
                printf("%d %d \n", i,arr[i])
        }
}' del.txt > del0.txt

awk '
BEGIN {
        FS="|"
}
{
        if($1==1)
        {
                for(i=2;i<=NF;i++)
                {
                        arr[$i]++
                }
        }
}
END {
        for(i in arr)
        {
                printf("%d %d \n", i,arr[i])
        }
}' del.txt > del1.txt

while read a; do
        v1=$(echo $a | awk '{print $1;}')
        v2=$(echo $a | awk '{print $2;}')
        while read b; do
                p1=$(echo $b | awk -F "-" '{print $1;}')
                p2=$(echo $b | awk -F "-" '{print $2;}')
                if [ $v1 -eq $p2 ]; then
                        echo "$p1 $v2"
                fi
        done < word_token_mapping.txt
done < del0.txt > output0.txt
sort -k2nr output0.txt > output00.txt
awk -v N="$N" 'FNR <= N {print $1}' output00.txt > ham.txt

while read a; do
        v1=$(echo $a | awk '{print $1;}')
        v2=$(echo $a | awk '{print $2;}')
        while read b; do
                p1=$(echo $b | awk -F "-" '{print $1;}')
                p2=$(echo $b | awk -F "-" '{print $2;}')
                if [ $v1 -eq $p2 ]; then
                        echo "$p1 $v2"
                fi
        done < word_token_mapping.txt
done < del1.txt > output1.txt
sort -k2nr output1.txt > output11.txt
awk -v N="$N" 'FNR <= N {print $1}' output11.txt > spam.txt

rm -f del.txt
rm -f del0.txt
rm -f del1.txt
rm -f output0.txt
rm -f output00.txt
rm -f output1.txt
rm -f output11.txt
