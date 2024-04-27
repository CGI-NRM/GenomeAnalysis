# Settings (edit if necessary):
pop_file="popfile.txt"
k_value="5"

# Load modules:
module load bioinfo-tools
module load R_packages

# Download script for plotting if it does not exist:
if ! test -f "plotADMIXTURE.r"
then
  wget https://raw.githubusercontent.com/CGI-NRM/scripts_fork/master/plotADMIXTURE.r
fi

# Find file prefix in directory:
bim_file=$(ls *.bim | head -n 1)
file_name=${bim_file/".bim"/""}

# Extract unique populations:
populations=$(awk '{print $2}' $pop_file | sort | uniq -d | tr '\n' ',')
populations=${populations/%,/""} # remove trailing comma

# Create admixture plot:
Rscript ./plotADMIXTURE.r -p $file_name -i $pop_file -k $k_value -l $populations
