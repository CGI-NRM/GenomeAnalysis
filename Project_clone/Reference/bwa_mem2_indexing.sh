#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1:00:00
#SBATCH -J bwa-mem2_index

# go to the correct directory:
cd $PROJECT_DIR
cd Reference/

# load software modules:
module load bioinfo-tools
module load bwa-mem2

# index the reference:
bwa-mem2 index -p ref_name reference.fna 
