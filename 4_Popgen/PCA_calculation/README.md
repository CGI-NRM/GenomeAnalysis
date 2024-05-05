# PCA calculation

Perform a PCA on a VCF-file using plink and evaluate results in R.

First perform linkage pruning (edit to change pruning settings):
```bash
sbatch linkage_pruning.sh # submits a SLURM-job
```

Make sure that linkage pruning is done and then perform PCA with plink:
```bash
sbatch calculate_pca.sh # submits a SLURM-job
```

Note, the analyses might be light enough for you to run both scripts directly
on the login node without submitting jobs. In that case:
```bash
bash linkage_pruning.sh
bash calculate_pca.sh
```

When you have your `*.eigenvec` and `*.eigenval` files you can plot and
evaluate the results in R with `pca_evaluation.rmd` using a suitable IDE.
