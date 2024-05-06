#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 2:50:00
#SBATCH -J bwa_mem2_map

# go to directory containing filtered data:
cd $PROJECT_DIR
cd 1_Filtered_data/

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
	bwa-mem2 mem ../0_Reference/ref -t 20 $read1 $read2 | samtools sort --threads 20 -o ../2_Mapped/$outname.bam -
done
