#! /bin/bash -l
#SBATCH -A PROJECT
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1:00:00
#SBATCH -J bwa-mem2_index

# go to some directory
cd path/to/Reference

# load software modules
module load bioinfo-tools
module load bwa-mem2

# index reference
bwa-mem2 index -p ref_name reference.fna 
