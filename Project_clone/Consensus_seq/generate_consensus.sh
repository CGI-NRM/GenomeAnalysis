#! /bin/bash -l
#SBATCH -A PROJECT
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 0:15:00
#SBATCH -J generate_consensus_seq

# go to the correct directory:
cd /path/to/Consensus_seq

# load software modules:
module load bioinfo-tools
module load samtools

# merge bam-files (if needed):
samtools merge merged.bam path/to/*.bam

# generate consensus sequence:
samtools consensus --format fasta sample1.bam --min-depth 5 --output sample1_mindpth_5.fa
samtools consensus --format fasta sample2.bam --min-depth 5 --output sample2_mindpth_5.fa
samtools consensus --format fasta merged.bam --min-depth 5 --output merged_mindpth_5.fa 
