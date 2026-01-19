#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/STAR_trimmed.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/STAR_trimmed.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at


###ENVIRONMENT

module load STAR
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106/doloi"
outDir="/lisc/data/scratch/course/2025w300106/doloi/results/map/trimmed_SRR36631310_WBCel"

###EXECUTION

echo "Job started on $(date)"
STAR --genomeDir $wd/Celegans_STAR --runThreadN 16 --readFilesIn $wd/results/trimmomatic/SRR36631310__1P $wd/results/trimmomatic/SRR36631310__2P --outFileNamePrefix $outDir --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate
echo "Job finished on $(date)"
