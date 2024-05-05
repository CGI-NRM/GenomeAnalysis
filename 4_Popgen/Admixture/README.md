# ADMIXTURE

Perform an ADMIXTURE analysis and plot it.

__Note:__ You will have do have generated bed, bim and fam files with plink before
running these scripts. This can be done while calculating PCA (see
`../PCA_calculation/README.md` for instructions). The `calculate_admixture.sh`
script will assume that these files will exist in the `../PCA_calculation/`
directory. Make sure to edit `calculate_admixture.sh` if this is not the case.

## Usage
First run ADMIXTURE for every K-value (default is up to K = 5):
```bash
bash calculate_admixture.sh
```

Then plot all ADMIXTURE results together:
```bash
bash make_admixture_plot.sh
```
