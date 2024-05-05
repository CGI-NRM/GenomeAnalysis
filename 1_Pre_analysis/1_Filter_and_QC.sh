#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 10:00:00
#SBATCH -J pre_analysis

# go to this directory
cd $PROJECT_DIR
cd 1_Pre_analysis

# load software modules
module load bioinfo-tools
module load FastQC
module load fastp
module load MultiQC

raw_folder="../0_Raw_data/"

# Create output folder if it does not exist:
mkdir -p ./QC_files/

# Evaluate raw data with fastqc:
for raw_file in $raw_folder*.fq.gz
do
	fastqc $raw_file --outdir="./QC_files/"
done

# Filter reads with fastp:
for read1 in $raw_folder*1.fq.gz
do
	file_name="${read1/$raw_folder/}"
	read2="${read1/1.fq.gz/2.fq.gz}"
	json="./QC_files/${file_name/1.fq.gz/.fastp.json}"
	html="./QC_files/${file_name/1.fq.gz/.fastp.html}"
	output1="filtered_${file_name}"
	output2="filtered_${file_name/1.fq.gz/2.fq.gz}"
	fastp --json $json --html $html --overrepresentation_analysis --length_required 40 --thread 20 --in1 $read1 --in2 $read2 --out1 $output1 --out2 $output2
done

mv filtered_* ../1_Filtered_data

# Run multiqc on all log-files:
#multiqc ./QC_files
