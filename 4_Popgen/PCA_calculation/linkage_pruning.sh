#! /bin/bash -l 
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1:00:00
#SBATCH -J linkage_pruning

# go to the correct directory:
cd $PROJECT_DIR
cd 4_Popgen/PCA_calculation/

# load software modules:
module load bioinfo-tools
module load plink

# prepare file names:
vcf_folder="$PROJECT_DIR/3_Variant_calling/Filtering/"
vcf_file=$(ls $vcf_folder*.vcf.gz | head -1)
out_file=${vcf_file/$vcf_folder/""}
out_file=${out_file/".vcf.gz"/""}

# perform linkage pruning:
plink --vcf $vcf_file --double-id --allow-extra-chr --set-missing-var-ids @:# --indep-pairwise 50 10 0.1 --out $out_file
