#! /bin/bash -l 
#SBATCH -A naiss2023-22-16
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 2:50:00
#SBATCH -J bwa_mem2_map_Ematurna
# go to some directory

# load software modules
module load bioinfo-tools
module load bwa-mem2
module load samtools


for filename in *1.fq.gz
do 
read1=$filename 
read2="${read1/1.fq.gz/2.fq.gz}"
outname=$(echo $read1 | cut -d "_" -f 1)
# json="${read1/1.fq.gz/.json}"
# html="${read1/1.fq.gz/.html}"
bwa-mem2 mem /home/thomask/snic2022-22-1115/nobackup/InsectData/Genomes/Ematurna/Ematurna -t 20 $read1 $read2 | samtools sort --threads 20 -o ../../../Mapping/Ematurna/$outname.bam -
