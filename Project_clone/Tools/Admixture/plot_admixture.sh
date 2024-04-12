module load bioinfo-tools
module load R_packages

# Download script for plotting:
wget https://raw.githubusercontent.com/CGI-NRM/scripts_fork/master/plotADMIXTURE.r

# Run script, make sure that you have prepared a popfile.txt corresponding to "-l":
Rscript ./plotADMIXTURE.r -p pphocoena_1 -i popfile.txt -k 5 -l population1,population2
