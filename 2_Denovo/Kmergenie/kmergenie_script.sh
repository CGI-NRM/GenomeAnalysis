#! /bin/bash -l 
#SBATCH -p node
#SBATCH -n 1
#SBATCH -C mem256GB
#SBATCH -t 10:00:00
#SBATCH -J kmer_estimation

# navigate to the correct directory:
cd $PROJECT_DIR
cd 2_Denovo/Kmergenie/

# load software modules:
module load bioinfo-tools
module load KmerGenie

# find fastq-files:
ls -1 ../../1_Filtered_data/*fq.gz > fastq_files.txt

# run kmergenie:
kmergenie fastq_files.txt
