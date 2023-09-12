#! /bin/bash -l
#SBATCH -A PROJECT
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 2:50:00
#SBATCH -J bwa_mem2_map

# go to directory containing filtered data:
cd path/to/Filtered_data

# load software modules:
module load bioinfo-tools
module load bwa-mem2
module load samtools

for filename in *1.fq.gz
do
	read1=$filename
	read2="${read1/1.fq.gz/2.fq.gz}"
	outname=$(echo $read1 | cut -d "E" -f 1)
	# json="${read1/1.fq.gz/.json}"
	# html="${read1/1.fq.gz/.html}"
	bwa-mem2 mem ../Reference/ref -t 20 $read1 $read2 | samtools sort --threads 20 -o ../Mapped/$outname.bam -
done
