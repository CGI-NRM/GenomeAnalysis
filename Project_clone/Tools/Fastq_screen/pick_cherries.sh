#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 2:00:00
#SBATCH -J pick_cherries

# go to this directory:
cd $PROJECT_DIR
cd Tools/Fastq_screen/

# load software modules
module load bioinfo-tools
module load python

# run fastq_cherry.py:
python fastq_cherry.py

# move the filtered data to Cherry_data/:
mv *_cherries_* Cherry_data/
