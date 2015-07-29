#1: field
#2: timestep                                                                                                                        
#3: state #                                                                                                                        
#4: state E                                                                                                                        
#5: occupied or not                                                                                                                
#6: exciton or ct  

rm initfig3_coldCT initfig3_hotCT initfig3_ddCT initns

for ((f=-6;f<8;f+=2))
do
	num1=0
	num2=0
	num3=0
	num4=0
	count1=0
	count2=0
	count3=0
	count4=0
	cd f$f
	for ((n=50;n<100;n++))
	do #don't put space between = and `, or else it doesn't work
	
	    rm justoccup_$n
	    awk '{if($5==1) print}' master_$n >> justoccup_$n
	    

	    num1=`awk 'BEGIN{a=0; c=0; num=0;} 
	    {if (c==0) 
		if ($2==0) {ex=$1; a++;} 
		else if (a>0 && $6==1 && $3<=6) {num=1; c++;}
		else if (a>0 && $6==1 && $3>6) {num=0; c++;}
		else if (a>0 && $6==2) {num=0; c++;}
	    }
	    END{print num}' justoccup_$n`
	    let "count1 += $num1"
	    
	    num2=`awk 'BEGIN{a=0; c=0; num=0;} 
	    {if (c==0) 
		if (a==0) {ex=$1; a++;} 
		else if (a>0 && $6==1 && $3<=6) {num=0; c++;}                                                                     
		else if (a>0 && $6==1 && $3>6) {num=1; c++;}                          
		else if (a>0 && $6==2) {num=0; c++;}}
	    END{print num}' justoccup_$n`
	    let "count2 += $num2"
	    
            num3=`awk 'BEGIN{a=0; c=0; num=0;} {if (c==0)                                                                       
                if (a==0) {ex=$1; a++;}                                                             
                else if (a>0 && $6==1 && $3<=6) {num=0; c++;}                                                                       
		else if (a>0 && $6==1 && $3>6) {num=0; c++;}
		else if (a>0 && $6==2) {num=1; c++;}}
            END{print num}' justoccup_$n`
            let "count3 += $num3"
	    
	    #num4=`awk 'BEGIN{a=0; c=0; num=0;} {if (c==0)                                 
            #    if (a==0) {ex=$1; a++;}
            #    else if (a>0 && $6==1 && $3<=6) {num=0; c++;}                                                                      
            #    else if (a>0 && $6==1 && $3>6) {num=0; c++;}                                                                       
            #    else if (a>0 && $6==2) {num=0; c++;}                                                                               
            #    else if (a>0 && $6>0) {num=1; c++;}}
            #END{print num}' justoccup_$n`
            #let "count4 += $num4"

	    num4=`awk 'BEGIN{num=0} {if($6!=0) num=1;} END{print num}' justoccup_$n`
	    let "count4 += $num4"

	done
	cd ..
	echo $f $count1 >> initfig3_coldCT
	echo $f $count2 >> initfig3_hotCT
	echo $f $count3 >> initfig3_ddCT
	echo $f $count4 >> initns
done

awk '{print $1/10, $2/50}' initfig3_coldCT > fig3_coldCT
awk '{print $1/10, $2/50}' initfig3_hotCT > fig3_hotCT
awk '{print $1/10, $2/50}' initfig3_ddCT > fig3_ddCT
awk '{print $1/10, $2/50}' initns > fig3_ns
