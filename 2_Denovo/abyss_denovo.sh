#! /bin/bash -l 
#SBATCH -p node
#SBATCH -n 1
#SBATCH -C mem256GB
#SBATCH -t 5-00:00:00
#SBATCH -J abyss_denovo_assembly

# Navigate to the correct directory:
cd $PROJECT_DIR
cd Denovo/

# load software modules:
module load bioinfo-tools
module load abyss

# run denovo assembly
abyss-pe k=113 name=sample1 B=100G in='../Filtered_data/sample1_1.fq.gz ../Filtered_data/sample1_2.fq.gz'
