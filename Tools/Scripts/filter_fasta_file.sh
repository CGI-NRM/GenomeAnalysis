# Edit and change names for input and output, as well as sequence length to filter by (by default sequences equal to or longer than 500 is kept in output)
awk -vRS=">" -vORS="" -vFS="\n" -vOFS="\n" '{fasta=$0; $1=""; if(length-NF+1 >= 500) print ">"fasta}' input.fasta > output.fasta
