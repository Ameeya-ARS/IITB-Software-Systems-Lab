#!/bin/sh
awk '
BEGIN {
        n=1;case=0;
	arr[0]="t$e%s@t^i%n#g"
}
{
        for(i=1;i<=NF;i++)
        {
                for (j=0;j<n;j++)
                {
                        if($i==arr[j])
                        {
                                printf ("%d ", j-1)
                                case=1
                                break
                        }
                        else
                        {
                                case=0
                        }
                }
                if(case==0)
                {
                        arr[n]=$i
                        printf ("%d ", n-1)
                        n++
                }
        }
        printf "\n"
}' sample.txt > output.txt
