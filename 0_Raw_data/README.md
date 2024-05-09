# Raw data
Place your raw fastq files in this directory. To filter your fastq files for downstream analysys run (the script will assume that the file endings are `*.fq.gz`):
```bash
cd ..
source set_variables.sh # edit script first if you have not already
cd ./1_Pre_analysis
sbatch 1_Filter_and_QC.sh
```
This will write your filtered fastq files to `../1_Filtered_data` and QC log files to `../1_Pre_analysis/QC_files`.
