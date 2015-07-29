#1: field
#2: step
#3: state #
#4: excited state energy
#5: occupied [yes(1)no(0)]
#6: exciton(0) ct(1) C60ex(5) other(6)

f=-6

for ((n=0;n<100;n++)) 
do

awk -v f=$f '{if($3<26) print f, $1*1000, $3, $4}' outdira$n/gap.dat >> 1234_$n
awk -v f=$f '{if($3<26) print f, $1*1000+100, $3, $4}' outdirb$n/gap.dat >> 1234_$n
awk -v f=$f '{if($3<26) print f, $1*1000+200, $3, $4}' outdirc$n/gap.dat >> 1234_$n

cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > exstateTOT

./../../../Utils/adamstuff/ExState $n > 5_$n 

for ((s=1;s<26;s++))
do
awk '{print $1+100, $2, $3, $4, $5, $6, $7}' outdirb$n/gtemp_$s > outdirb$n/gtempf_$s
awk '{print $1+200, $2, $3, $4, $5, $6, $7}' outdirc$n/gtemp_$s > outdirc$n/gtempf_$s
cat outdira$n/gtemp_$s outdirb$n/gtempf_$s outdirc$n/gtempf_$s >> gtempTOT_$n
done

sort -k1n,1 gtempTOT_$n > gtempTOTf_$n

#0: exciton
#1: CT
#5: C60 exciton
awk -v n=$n '{if($3>0.8 && $6>0.8) print 1; else if($3>0.8 && $4>0.8) print 0; else if($5>0.8 && $6>0.8) print 5; else print 6;}' gtempTOTf_$n > 6_$n 

paste 1234_$n 5_$n 6_$n > 123456_$n

awk '{print}' 123456_$n > master_$n

rm 1234_$n 5_$n 6_$n 123456_$n gtempTOT_$n gtempTOTf_$n

done


#in NnegB1 the master_31, 53, 71 are missing the first 100 fs
#now NnegB1 has only 96 files to loop through
