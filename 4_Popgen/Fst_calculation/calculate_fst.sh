#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J fst_calculation

# go to the correct directory:
cd $PROJECT_DIR
cd 4_Popgen/Fst_calculation/

# load software modules:
module load bioinfo-tools
module load vcftools

## calculate fst:
# group1.txt and group2.txt are text files with sample names from each group
vcftools --gzvcf ../../3_Variant_calling/Filtered/filtered_vcf_name.vcf.gz --weir-fst-pop group1.txt --weir-fst-pop group2.txt --out ./group1_group2
