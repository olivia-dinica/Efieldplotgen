#1: timestep
#2: state
#3: type (0 EX, 1 CT, 5 CEX, 6 Other)
#4: energy
for ((f=-4;f<-2;f+=2))
do
    cd f$f
    for ((traj=0; traj<100; traj++))
    do
	rm justoccup_$traj move_$traj
	awk '{if($5==1) print}' master_$traj >> justoccup_$traj
	awk 'BEGIN {init=100;end=0;} {if($2==0) {print $2,$3,$6,$4/96.48; init=$6;} if (init!=100 && $6!=init && end==0) {print $2,$3,$6,$4/96.48; end=1;} if ($2==299) print $2,$3,$6,$4/96.48}' justoccup_$traj >> move_$traj
    done
    
    cd ..
done

#/96.48