#!/bin/bash
begin=$(echo "2001 1 1 $2" | sed "s/:/ / g")
finish=$(echo "2001 1 1 $3" | sed "s/:/ / g")
awk '{if (NR!=1) {print}}' $1 > data.csv
sed -i -e "s/:/ / g" -e "s/\// /g" -e "s/, / / g" data.csv
v=0 
u=""
awk -v v="$v" -v u="$u" -v begin="$begin" -v finish="$finish" ' {
u=sprintf("2001 1 1 %d %d %d\n" ,$(NF-2) ,$(NF-1) ,$NF)
v=mktime(u)
NF-=5
NF+=1
$NF=mktime(begin)
NF+=1
$NF=mktime(finish)
if($(NF-3)=="Joined")
{
	if(v<$(NF-1))
	{
		v=$(NF-1)
	}
}
if($(NF-3)=="Left")
{
        if(v>$NF)
        {
                v=$NF
        }
}
$(NF-2)=v
print
}' data.csv > time_data.csv
awk '
{
	var=2
	name[$1]=$1
	for(i=1;i<=NF;i++)
	{
		if($i=="Joined" || $i=="Left")
		{
			var=i
		}
	}
	for(i=2;i<var;i++)
	{
		name[$1]=name[$1]" "$i
	}
	if($(NF-3)=="Joined")
	{
		arr[$1]-=$(NF-2)
	}
	if($(NF-3)=="Left")
        {
                arr[$1]+=$(NF-2)
        }
}
END {
	for(i in arr)
	{	
		if(arr[i]<0)
		{
			arr[i]+=$NF
		}
		if(arr[i]>($NF-$(NF-1)))
		{
			arr[i]-=$(NF-1)
		}
		sec=arr[i]
		if(sec>59)
		{
			min=int(sec/60)
			sec=sec%60
			if(min>59)
			{
				hour=int(min/60)
				min=min%60
			}
			else
			{
				hour=0
			}
		}
		else
		{
			min=0
			hour=0
		}
		printf("%s %02d:%02d:%02d\n",name[i],hour,min,sec)
	}
}' time_data.csv > require.csv
awk '{print|"sort -u"}' require.csv > output.txt

rm -f data.csv
rm -f time_data.csv
rm -f require.csv
