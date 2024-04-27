# First copy .bed, .bim and .fam files from the PCA-run to same folder.

# Load admixture:
module load bioinfo-tools
module load ADMIXTURE

# Find bim-file in directory:
bim_file=$(ls *.bim | head -n 1)

# Prepare bim-file:
awk '{$1="0";print $0}' $bim_file > $bim_file.tmp
mv $bim_file.tmp $bim_file

# Run admixture for every k-value:
for i in {1..5} # for k-values 1 to 5
do
  printf "\nRun $i:\n"
  admixture --cv ${bim_file/".bim"/".bed"} $i | tee log$i.out
done
