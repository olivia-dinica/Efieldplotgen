cd NposC1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f6/exstateTOT_$n
done
cd ..

cd NposB1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f4/exstateTOT_$n
done
cd ..

cd NposA1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f2/exstateTOT_$n
done
cd ..

cd N1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f0/exstateTOT_$n
done
cd ..

cd NnegA1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f-2/exstateTOT_$n
done
cd ..

cd NnegB1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f-4/exstateTOT_$n
done
cd ..

cd NnegC1
for ((n=0;n<100;n++)) 
do
cat outdira$n/exstate outdirb$n/exstate outdirc$n/exstate > ../f-6/exstateTOT_$n
done
cd ..

