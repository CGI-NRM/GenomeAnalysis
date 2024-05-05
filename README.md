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
