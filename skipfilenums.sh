for ((l=32;l<53;l++))
do
new=$(($l-1))
mv master_$l master_$new
mv exstateTOT_$l exstateTOT_$new
done

for ((l=54;l<71;l++))
do
new=$(($l-2))
mv master_$l master_$new
mv exstateTOT_$l exstateTOT_$new
done

for ((l=72;l<100;l++))
do
new=$(($l-3))
mv master_$l master_$new
mv exstateTOT_$l exstateTOT_$new
done


