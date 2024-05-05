#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 3:00:00
#SBATCH -J fastp_filter

# go to this directory
cd $PROJECT_DIR
cd 0_Raw_data/

# load software modules
module load bioinfo-tools
module load fastp

for filename in *1.fq.gz
do
	read1=$filename
	read2="${read1/1.fq.gz/2.fq.gz}"
	json="${read1/1.fq.gz/.json}"
	html="${read1/1.fq.gz/.html}"
	output1="filtered_${read1}"
	output2="filtered_${read2}"
	fastp --json $json --html $html --overrepresentation_analysis --length_required 40 --thread 20 --in1 $read1 --in2 $read2 --out1 ../1_Filtered_data/$output1 --out2 ../1_Filtered_data/$output2
done
