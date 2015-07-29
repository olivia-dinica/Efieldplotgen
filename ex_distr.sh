rm eng* distr* head_fmaster*

head -25 f-4/master* >> head_fmaster-4
head -25 f-2/master* >> head_fmaster-2
head -25 f6/master* >> head_fmaster6
head -20 f-6/master* >> head_fmaster-6
head -20 f0/master* >> head_fmaster0
head -20 f2/master* >> head_fmaster2
head -20 f4/master* >> head_fmaster4   

for ((f=-6;f<8;f+=2))
do

    awk -v f=$f '{if ($5==1 && $6==0) print f, $3, $4}' head_fmaster$f >> eng$f
    
    echo "done first part"
    
    for ((i=120; i<201; i+=9)) 
    do
	so=0
	se=0
#	awk -v i=$i -v so=$so -v se=$se '{if ($3>(i-4) && $3<(i+4)) {so++; se+=$3;}} END{print se/(96.48*so), so}' eng$f >> distr$f
    awk -v i=$i -v so=$so -v se=$se '{if ($3<=(i+10) && $3>=i) {so++; se+=$3;}} END{print se/(96.48*so), so}' eng$f >> distr$f
    done
    
#96.48 is factor to convert kj/mol to ev
#gap.dat is in kj/mol
#119705/i is to convert to nm
done