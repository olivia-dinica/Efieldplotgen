#finds attachment density for first 50 excited states
npi=90
norb=48
nci=128
step=1

gunzip CI_coefs.dat.gz

for((l = 1 ; l < 50 ; l++)) 
do
    echo $l 
    #./../../../../Utils/AD $npi $nci $norb $l > dtemp1
    ./../../../Utils/AD $npi $nci $norb $l > dtemp1
    
    #./../../../../Utils/ColMO $npi $norb $((step-1)) 0 < dtemp1 > atemp_$l
    ./../../../Utils/ColMO $npi $norb $((step-1)) 0 < dtemp1 > atemp_$l
    
    #awk -v x1=0 -v x2=0 -v y1=0 -v y2=0 -v z1=0 -v z2=0 '{if ($7){x1+=$5*$7;y1+=$5*$8;z1+=$5*$9;x2+=$6*$7;y2+=$6*$8;z2+=$6*$9};if($2==89){print sqrt((x1-x2)**2+(y1-y2)**2+(z1-z2)**2),x1,y1,z1,x2,y2,z2 ;x1=0;y1=0;z1=0;x2=0;y2=0;z2=0}}' atemp_$l > ctemp5
awk '{if ($7){x1+=$5*$7;y1+=$5*$8;z1+=$5*$9;x2+=$6*$7;y2+=$6*$8;z2+=$6*$9 ; if ($2>=30) {sum+=($5-$6) ; sum1+=$6 }} ; if($2==89){print sum,sum1,sqrt((x1-x2)**2+(y1-y2)**2+(z1-z2)**2);x1=0;y1=0;z1=0;x2=0;y2=0;z2=0;sum=0 ; sum1=0}}' atemp_$l > ctemp5

    
    awk -v n=$l -v s=0 '{if ($3==n) {print s,$4/96.48 ; s++}}' gap.dat > ctemp6
    
    paste ctemp6 ctemp5 > gtemp_$l
done

cat gtemp_? gtemp_?? > tempg

gzip CI_coefs.dat