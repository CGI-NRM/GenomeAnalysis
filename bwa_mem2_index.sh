#! /bin/bash -l 
#SBATCH -A snic2022-22-1115
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1:00:00
#SBATCH -J bwa-mem2_index

# go to some directory

# load software modules
module load bioinfo-tools
module load bwa-mem2

# Example for Bombus soroensis reference genome from NCBI
# -p "Name of ref" file reference
# NB! bwa-mem2 generates an index file different from bwa

bwa-mem2 index -p Bsoroensis Bsoroensis/GCA_014737365.1_ASM1473736v1_genomic.fna.gz
