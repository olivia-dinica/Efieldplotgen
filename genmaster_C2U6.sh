#1: field
#2: step
#3: state #
#4: excited state energy
#5: occupied [yes(1)no(0)]
#6: 6T_EX(0) CT(1) 6T_CT(2) C60_EX(3) other(4)  

f=0

for ((n=0;n<100;n++)) 
do

awk -v f=$f '{if($3<21) print f, $1*1000, $3, $4}' outdira$n/gap.dat >> 1234_$n
awk -v f=$f '{if($3<21) print f, $1*1000+100, $3, $4}' outdirb$n/gap.dat >> 1234_$n
awk -v f=$f '{if($3<21) print f, $1*1000+200, $3, $4}' outdirc$n/gap.dat >> 1234_$n

cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > exstateTOT

./../../../Utils/adamstuff/ExState $n > 5_$n 

for ((s=1;s<21;s++))
do
awk '{print $1+100, $2, $3, $4, $5, $6, $7, $8, $9}' outdirb$n/gtemp_$s > outdirb$n/gtempf_$s
awk '{print $1+200, $2, $3, $4, $5, $6, $7, $8, $9}' outdirc$n/gtemp_$s > outdirc$n/gtempf_$s
cat outdira$n/gtemp_$s outdirb$n/gtempf_$s outdirc$n/gtempf_$s >> gtempTOT_$n
done

sort -k1n,1 gtempTOT_$n > gtempTOTf_$n

#0: 6T_EX
#1: CT
#2: 6T_CT
#3: C60_EX
#4: other
awk -v n=$n '{if(($3>$5 && $3>$7 && $4>$6 && $4>$8) || ($5>$3 && $5>$7 && $6>$4 && $6>$8)) print 0; else if(($3>$5 && $3>$7 && $8>$6 && $8>$4) || ($5>$3 && $5>$7 && $8>$4 && $8>$6)) print 1; else if(($3>$5 && $3>$7 && $6>$4 && $6>$8) || ($5>$3 && $5>$7 && $4>$6 && $4>$8)) print 2; else if($7>$5 && $7>$3 && $8>$6 && $8>$4) print 3; else print 4;}' gtempTOTf_$n > 6_$n 

paste 1234_$n 5_$n 6_$n > 123456_$n

awk '{print}' 123456_$n > master_$n

rm 1234_$n 5_$n 6_$n 123456_$n gtempTOT_$n gtempTOTf_$n

done
