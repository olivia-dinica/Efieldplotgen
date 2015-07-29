rm fig1_ex1
rm fig1_ct
rm fig1tot
rm fig1_exc60 fig1_pexc60
rm fig1_ex2 fig1_pex2

for ((f=-6;f<8;f+=2))
do
    echo $f
    cd f$f
    rm average0
    cat master_* > fmaster
    
#COUNTING HIGH E EXs
    for ((s=8;s<26;s++))
    do
	echo $s
        awk -v f=$f -v s=$s '{if($2==0 && $3==s && $6==5) {e5+=$4; c5+=1;}} END{print f, e5/c5, c5}' fmaster >> ../fig1_pexc60;
	awk -v f=$f -v s=$s '{if($2==0 && $3==s && $6==0 && $5==1) {e0+=$4; c0+=1;}} END{print f, e0/c0, c0}' fmaster >> ../fig1_pex2;    
    done
    awk -v f=$f  'BEGIN{c=0;e=0;}{if(f==$1 && $2>0) {c+=$3;e+=$2*$3;}} END{print f, e/c}' ../fig1_pexc60 >> ../fig1_exc60
    awk -v f=$f  'BEGIN{c=0;e=0;}{if(f==$1 && $2>0) {c+=$3;e+=$2*$3;}} END{print f, e/c}' ../fig1_pex2 >> ../fig1_ex2
    
    
#COUNTING ONLY OCCUPIED STATES
    awk -v f=$f 'BEGIN {c=0; c2=0;} {if ($3<8 && $2==0 && $6==0 && $5==1) {e+=$4; o+=$6; c++;}} END {print f, e/c, o/c;}' fmaster >> average0 ;
    
    
#COUNTING ALL CT STATES
    awk -v f=$f 'BEGIN {c1=0; c2=0; c3=0; c4=0; c5=0; c6=0; c7=0}  {if ($2==0 && $6==1 && f<0) {if ($3==1) {e1+=$4; o1+=$6; c1++;} else if ($3==2) {e2+=$4; o2+=$6; c2++;} else if ($3==3) {e3+=$4; o3+=$6; c3++;} else if ($3==4) {e4+=$4; o4+=$6; c4++;}	else if ($3==5) {e5+=$4; o5+=$6; c5++;} else if ($3==6) {e6+=$4; o6+=$6; c6++;}} else if ($2==0 && $6==1) {if ($3==1) {e1+=$4; o1+=$6; c1++;} else if ($3==2) {e2+=$4; o2+=$6; c2++;} else if ($3==3) {e3+=$4; o3+=$6; c3++;} else if ($3==5) {e5+=$4; o5+=$6; c5++;} else if ($3==6) {e6+=$4; o6+=$6; c6++;} else if ($3==7) {e7+=$4; o7+=$6; c7++;}}} END {print f, e1/c1, o1/c1; print f, e2/c2, o2/c2; print f, e3/c3, o3/c3; print f, e4/c4, o4/c4; print f, e5/c5, o5/c5; print f, e6/c6, o6/c6; print f, e7/c7, o7/c7;}' fmaster >> average0 ;
    
    cat average0 >> ../fig1tot
    cd ..
    
done

awk '{if ($3<0.5) print}' fig1tot >> fig1_ex1
awk '{if ($3>0.5) print}' fig1tot >> fig1_ct
