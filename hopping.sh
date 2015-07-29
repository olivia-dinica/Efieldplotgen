#rm switch
rm state
for ((traj=0; traj<100; traj++))
do

rm justoccup_$traj
awk '{if($5==1) print}' master_$traj >> justoccup_$traj

#0: no switch and in EX1 or CT
#1: switch into EX1 or CT
#2: switch in EX2
#awk -v traj=$traj 'BEGIN{type=0;}{if($6==type) print $2, traj, 0; else if($6!=type && ($6==0 || $6==1) && (type==0 || type==1)) {print $2, traj, 1; type=$6} else if ($6!=type && ($6==0 || $6==5)  && (type==0 || type==5)) {print $2, traj, 2; type=$6} else if ($6!=type && ($6==1 || $6==5)  && (type==1 || type==5)) {print $2, traj, 3; type=$6} else {print $2, traj, 4; type=$6}}' justoccup_$traj >> switch

awk -v traj=$traj '{if($6==0) print $2, traj, 1; else if($6==1 && $3>4) print $2, traj, 0.5; else if ($6==1 && $3<5) print $2, traj, 0; else if($6==5) print $2, traj, 2; else print $2, traj, 3;}' justoccup_$traj >> state


done

#f-2 has file 29 missing time step info at end
#f-4 has the 3 files missing to begin with, plus file 6 is missing end time step info
