import os
import gzip
import re

file_folder = './Tagged_data'

for file in os.listdir(file_folder):
    if file.endswith('1.tagged.fastq.gz'):
        with gzip.open(file_folder + '/' + file) as forward_input:
            forward_text = forward_input.readlines()
        with gzip.open(file_folder + '/' + file.replace('1.tagged.fastq.gz', '2.tagged.fastq.gz')) as reverse_input:
            reverse_text = reverse_input.readlines()
        with gzip.open(file.replace('1.tagged.fastq.gz', 'cherries_1.fq.gz'), 'w') as forward_output:
            with gzip.open(file.replace('1.tagged.fastq.gz', 'cherries_2.fq.gz'), 'w') as reverse_output:
                counter = 0
                for line in forward_text:
                    if line.startswith(b'@') and re.match(b'.+:0+$', line):
                        forward_output.writelines(forward_text[counter:counter + 4])
                        reverse_output.writelines(reverse_text[counter:counter + 4])
                    counter = counter + 1
