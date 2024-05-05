#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 2:00:00
#SBATCH -J fastq_screen

# go to this directory:
cd $PROJECT_DIR
cd Tools/Fastq_screen/

# load software modules:
module load bioinfo-tools
module load fastq_screen
module load bowtie2

# run fastq_screen:
fastq_screen --conf fastq_screen.conf --aligner bowtie2 --tag ../1_Filtered_data/*.fq.gz 
