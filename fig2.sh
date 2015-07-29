#1: field
#2: timestep
#3: state #
#4: state E
#5: occupied or not
#6: exciton or ct

rm fig2f*

for ((f=-6;f<8;f+=2))
do
	cd f$f
	for ((t=0;t<300;t++))
	do
		echo "f: $f t: $t"
		count=0
		if [ $f -eq -4 ]; then
			for ((n=0;n<97;n++))
			do #don't put space between = and `, or else it doesn't work
				num=`awk -v t=$t 'BEGIN{c=0}{if ($2==t && $5==1 && $6==1) c=1}END{print c}' master_$n`
				let "count += $num"
			done
			echo $t $count >> ../initfig2f$f
		else
			for ((n=0;n<100;n++))
			do
				num=`awk -v t=$t 'BEGIN{c=0}{if ($2==t && $5==1 && $6==1) c=1}END{print c}' master_$n`
				let "count += $num"
			done
			echo $t $count >> ../initfig2f$f
		fi
	done
	cd ..
	if [ $f -eq -4 ]; then
		awk '{print $1, -$2/97}' initfig2f$f > fig2f$f
	else
		awk '{print $1, -$2/100}' initfig2f$f > fig2f$f
	fi
	rm initfig2f$f		
done
