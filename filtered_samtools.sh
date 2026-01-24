#!/bin/bash

#SBATCH --job-name=samtools
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/samtools.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/samtools.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at


###ENVIRONMENT

module load SAMtools/1.23-GCC-14.2.0 
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106/doloi/results/map"
outDir="/lisc/data/scratch/course/2025w300106/doloi/results/map"

### EXECUTION

## -b gives a BAM output
## -q mapping quality filters
## -G excludes unmapped reads, see decoding sam flags by Broad Institute


echo "Job started on $(date)"

samtools view -b -@ 4 -o $outDir/filtered_trimmed_SRR36631310_WBCel.bam -q 20 -G 12 $wd/trimmed_SRR36631310_WBCelAligned.sortedByCoord.out.bam

echo "Job finished on $(date)"



