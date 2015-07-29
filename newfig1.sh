rm average0tot
rm evsf_exciton
rm evsf_ct

for ((f=-6;f<8;f+=2))
do
    cd f$f
    rm average0
    cat master_* > fmaster
    
    if [ $f -eq 6 ] then
	awk -v f=$f 'BEGIN {c=0} {if ($2==0 && $3==1) {e1+=$4; o1+=$6; c++;} else if ($2==0 && $3==2) {e2+=$4; o2+=$6;} else if ($2==0 && $3==3) {e3+=$4; o3+=$6;} else if ($2==0 && $3==4) {e4+=$4; o4+=$6;} else if ($2==0 && $3==5) {e5+=$4; o5+=$6;} else if ($2==0 && $3==6) {e6+=$4; o6+=$6;} else if ($2==0 && $3==7) {e7+=$4; o7+=$6;} else if ($2==0 && $3==8) {e8+=$4; o8+=$6;} else if ($2==0 && $3==9) {e9+=$4; o9+=$6;} else if ($2==0 && $3==10) {e10+=$4; o10+=$6;}} END {print f, e1/c, o1/c; print f, e2/c, o2/c; print f, e3/c, o3/c; print f, e4/c, o4/c; print f, e5/c, o5/c; print f, e6/c, o6/c; print f, e7/c, o7/c; print f, e8/c, o8/c; print f, e9/c, o9/c; print f, e10/c, o10/c;}' fmaster >> average0
    elif [ $f -eq 4 ] then
	awk -v f=$f 'BEGIN {c=0} {if ($2==0 && $3==1) {e1+=$4; o1+=$6; c++;} else if ($2==0 && $3==2) {e2+=$4; o2+=$6;} else if ($2==0 && $3==3) {e3+=$4; o3+=$6;} else if ($2==0 && $3==4) {e4+=$4; o4+=$6;} else if ($2==0 && $3==5) {e5+=$4; o5+=$6;} else if ($2==0 && $3==6) {e6+=$4; o6+=$6;} else if ($2==0 && $3==7) {e7+=$4; o7+=$6;} else if ($2==0 && $3==8) {e8+=$4; o8+=$6;} else if ($2==0 && $3==9) {e9+=$4; o9+=$6;} else if ($2==0 && $3==10) {e10+=$4; o10+=$6;}} END {print f, e1/c, o1/c; print f, e2/c, o2/c; print f, e3/c, o3/c; print f, e4/c, o4/c; print f, e5/c, o5/c; print f, e6/c, o6/c; print f, e7/c, o7/c; print f, e8/c, o8/c; print f, e9/c, o9/c; print f, e10/c, o10/c;}' fmaster >> average0
    else
	awk -v f=$f 'BEGIN {c=0} {if ($2==0 && $3==1) {e1+=$4; o1+=$6; c++;} else if ($2==0 && $3==2) {e2+=$4; o2+=$6;} else if ($2==0 && $3==3) {e3+=$4; o3+=$6;} else if ($2==0 && $3==4) {e4+=$4; o4+=$6;} else if ($2==0 && $3==5) {e5+=$4; o5+=$6;} else if ($2==0 && $3==6) {e6+=$4; o6+=$6;} else if ($2==0 && $3==7) {e7+=$4; o7+=$6;}} END {print f, e1/c, o1/c; print f, e2/c, o2/c; print f, e3/c, o3/c; print f, e4/c, o4/c; print f, e5/c, o5/c; print f, e6/c, o6/c; print f, e7/c, o7/c;}' fmaster >> average0
    fi
    
    cat average0 >> ../average0tot
    cd ..
    
done

awk '{if ($3<0.5) print}' average0tot >> evsf_exciton
awk '{if ($3>0.5) print}' average0tot >> evsf_ct
