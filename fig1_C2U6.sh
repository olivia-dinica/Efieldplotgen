rm 0 1 2 3
for ((f=-6;f<8;f+=2))
do
    cd f$f
    rm master
    for ((n=0;n<100;n++))
    do
	head -20 master_$n >> master
    done

    sort -nk 3 master > fmaster

    for ((s=1;s<21;s++))
    do
	awk -v f=$f -v s=$s '{if($3==s && $6==0 && $5==1) {e0+=$4; c0+=1;} else if($3==s && $6==1) {e1+=$4; c1+=1;} else if($3==s && $6==2) {e2+=$4; c2+=1;} else if($3==s && $6==3) {e3+=$4; c3+=1;}}END{print f, e0/c0, c0 >> "../0"; print f, e1/c1, c1 >> "../1"; print f, e2/c2, c2 >> "../2"; print f, e3/c3 >> "../3";}' fmaster
    done
    cd ..
done

awk '{if ($3>12) print}' 0 > 0f
awk '{if ($3>40) print}' 1 > 1f
awk '{if ($3>20) print}' 2 > 2f