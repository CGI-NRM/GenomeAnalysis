#! /bin/bash -l 
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1:00:00
#SBATCH -J calculate_pca

# go to the correct directory:
cd $PROJECT_DIR
cd Popgen/PCA_calculation/

# load software modules:
module load bioinfo-tools
module load plink

# prepare file names:
vcf_folder="$PROJECT_DIR/Variant_calling/Filtering/"
vcf_file=$(ls $vcf_folder*.vcf.gz | head -1)
out_file=${vcf_file/$vcf_folder/""}
out_file=${out_file/".vcf.gz"/""}

# calculate PCA:
plink --vcf $vcf_file --double-id --allow-extra-chr --set-missing-var-ids @:# --extract $out_file.prune.in --make-bed --pca --out $ORGANISM"_1"
