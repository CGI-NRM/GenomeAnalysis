#! /bin/bash -l
#SBATCH -A PROJECT
#SBATCH -p node
#SBATCH -t 5:00:00
#SBATCH -J download_sra

# settings:
sra_id="SRRXXXXXXXX"
out_folder="Tools/Download_SRA/"

# go to the scratch directory on the node:
cd $SNIC_TMP/

# load software modules:
module load bioinfo-tools
module load sratools

# download SRA:
fasterq-dump --split-files $sra_id -O $SNIC_TMP/ -t $SNIC_TMP/
echo "done"

# gzip fastq-files:
gzip $SNIC_TMP/*.fastq

# copy files:
cp $SNIC_TMP/*.gz $PROJECT_DIR/$out_folder
cp $SNIC_TMP/*.gzip $PROJECT_DIR/$out_folder

# wait just in case, so that you can manually move the files from scratch:
sleep 100000
