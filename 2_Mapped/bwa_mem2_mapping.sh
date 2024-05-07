#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 3:00:00
#SBATCH -J bwa_mem2_map

# settings (edit if necessary):
ref_dir="0_Reference/" # folder containing the indexed refenrece genome
fas_dir="1_Filtered_data/" # folder containing reads to me mapped
out_dir="2_Mapped/" # folder where the bam files will be written

# go to directory containing filtered data:
cd $PROJECT_DIR
cd $fas_dir

# load software modules:
module load bioinfo-tools
module load bwa-mem2
module load samtools

# get reference path:
ref_path=$(ls $PROJECT_DIR/$ref_dir*.ann | head -1)
ref_path=${ref_path/".ann"/""}

for filename in *1.fq.gz
do
  read1=$filename
  read2="${read1/1.fq.gz/2.fq.gz}"
  outname=$(echo $read1 | cut -d "E" -f 1)
  # json="${read1/1.fq.gz/.json}"
  # html="${read1/1.fq.gz/.html}"
  bwa-mem2 mem $ref_path -t 20 $read1 $read2 | samtools sort --threads 20 -o $PROJECT_DIR/$out_dir/$outname.bam -
done
