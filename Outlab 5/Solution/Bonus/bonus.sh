#!/bin/bash
cp bonus_sample_input.txt data.txt
awk '{gsub("A", "10")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '{gsub("B", "11")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '{gsub("C", "12")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '{gsub("D", "13")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '{gsub("E", "14")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '{gsub("F", "15")}1' data.txt > data.dat_tmp &&  mv data.dat_tmp data.txt
awk '
BEGIN{
      FS=" "
      RS="\n"
      N=1
      ORS=""
      total=0
}
{
      if(NR==1) {
            testcase=$1
	    total=1+(3*$1)
      }
      else if(NR==3*N-1) {
            basei[N] = $1
            baseo[N] = $2
      }
      else if(NR==3*N) {
            for ( i = 1 ; i <= NF ; i++ ) {
                  num1[i] = $i 
            }
    	    len_num1=NF
      }
      else if(NR==3*N+1) {
            for ( i = 1 ; i <= NF ; i++ ) {
                  num2[i] = $i
            }
	    len_num2=NF
            p1=0
            p2=0
            n1=0
            n2=0 
            ans_index=0   
            for( i = len_num1 ; i >= 1 ; i-- )
            {
                  n1 += num1[i] * (basei[N]^p1)
                  p1++
            }
            for( i = len_num2 ; i >=1 ; i-- )
            {
                  n2 += num2[i] * (basei[N]^p2)
                  p2++
            }

            sum = n1 + n2
       
            #converting_to_binary
           
            while ( int(sum) > int(0) )
            {
                  ans[ans_index] = (int(sum%baseo[N]))
                  sum = sum / baseo[N]
                  ans_index++
            }
            
            for( i = length(ans)-1 ; i >= 0 ; i-- )
            {
		    if(i==0)
	  	    {
			printf("%s",ans[i])
		    }
	    	    else
		    {
		    	printf("%s ",ans[i])
	    	    }
            }
	    printf("\n")
            delete ans
            N++
      }
      
}' data.txt > output_temp.txt

awk '
{
        for(i=1;i<NF;i++)
        {
                if($i==10) printf("A ")
                else if($i==11) printf("B ")
		else if($i==12) printf("C ")
                else if($i==13) printf("D ")
                else if($i==14) printf("E ")
                else if($i==15) printf("F ")
                else printf("%d ", $i)
        }
	 if($i==10) printf("A ")
         else if($i==11) printf("B")
         else if($i==12) printf("C")
         else if($i==13) printf("D")
         else if($i==14) printf("E")
         else if($i==15) printf("F")
         else printf("%d", $i)
        printf("\n")
}' output_temp.txt > bonus_output.txt

rm -f data.txt
rm -f output_temp.txt
