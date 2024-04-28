# Fastq_screen
Run fastq_screen with the script "fqs_script.sh" (make sure that "fastq_screen.conf" points to the locations of the relevant reference genomes):
```bash
sbatch fqs_script.sh
```

Run fastq_cherry.py with the script "pick_cheries.sh" in order to filter out reads that was mapped to any reference genome during the screening:
```bash
sbatch pick_cherries.sh
```
