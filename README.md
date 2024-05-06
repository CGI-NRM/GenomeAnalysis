# Genome Analysis

To set environmental variables, edit the file `set_variables.sh`, and run:
```bash
source set_variables.sh
```

The folder names in this repository are prefixed with a number to indicate
where its content is located in the pipeline: a lower number means earlier
in the pipeline and a higher number means later in the pipeline. For example,
the scripts in the folder `2_Mapped` will depend on the the folders starting
wih 0 and 1 to varying dregrees but not at all on the folders starting with
numbers 3 and above.

## The Pipeline
The the pipeline is described broadly here. See individual folders
for detailed instructions.

### Going from raw data to basic population genetics
This part currently only focuses on the mapping strategy (using a reference
genome).

1. Put your raw fastq-files in the folder `0_Raw_data` and your reference
genome in the folder `0_Reference`.
2. Index your reference using the script in the folder `0_Reference`.
3. Filter your samples using the script in the folder `1_Pre_analysis`.
4. Assemble your filtered reads and create BAM files by mapping to your
reference genome using the script in the folder `2_Mapped`.
5. Call variants and create a VCF file from the BAM files using a script in
the folder `3_Call_variants`.
6. Filter the VCF file using a different script in the folder
`3_Call_variants`.
7. Perform population genetic analyses of choice using the subdirectories of
`4_Popgen`.
