#!/bin/bash

#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/featureCounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at

### ENVIRONMENT

module load Subread/2.1.1-GCC-13.2.0
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106/doloi"
outDir="/lisc/data/scratch/course/2025w300106/doloi/results/map"


### EXECUTION

# -p for paired ends and count only a single read per template
# count only primary alignment
# ignoreDup to remove duplicated reads
# i think its a reverse stranded library

echo "Job started on $(date)"

featureCounts -p --countReadPairs --ignoreDup -C -T 4 -s 2 --primary -a $wd/bioDATAAnalysis_Cel.gtf -o $outDir/featureCounts_newAnnot.tsv $wd/results/map/filtered_trimmed_SRR36631310_WBCel.bam
echo "Job finished on $(date)"

