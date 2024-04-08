# First copy the bed-files from the PLINK-run to this folder.

awk '{$1="0";print $0}' pphocoena_1.bim > pphocoena_1.bim.tmp
mv pphocoena_1.bim.tmp pphocoena_1.bim

for i in {1..5}
do
admixture --cv pphocoena_1.bed $i > log$i.out
done
