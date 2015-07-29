rm fig1_pavex fig1_avex
for ((f=-6;f<8;f+=2))
do
    cd f$f
    echo $f
    for ((s=1;s<26;s++))
    do
	echo $s
	awk -v f=$f -v s=$s '{if($2==0 && $3==s && $6==0 && $5==1) {e0+=$4; c0+=1;}} END{print f, e0/c0, c0}' fmaster >> ../fig1_pavex
    done
    
    awk -v f=$f  'BEGIN{c=0;e=0;}{if(f==$1 && $2>0) {c+=$3;e+=$2*$3;}} END{print f, e/c}' ../fig1_pavex >> ../fig1_avex
    cd ..
done