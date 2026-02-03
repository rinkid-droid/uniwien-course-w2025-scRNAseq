#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/trimmomatic.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/trimmomatic.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at

### ENVIRONMENT

module load Trimmomatic/0.40-Java-17 
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106/doloi"
outDir="$wd/results/trimmomatic"

### EXECUTION

## MINLEN - minimum read length to be kept
## SLIDINGWINDOW - windowSize = to specify the number of bases to average: requiredQuality = to specify the average quality
## ILLUMINACLIP - seed mismatches = specify the maximum mismatch count to allow a full match, not more than 2: palindrome clip threshold = 30, accuracy between adapters: simple clip threshold = 10, accuracy between adapter against read


echo "Started job on $(date)"
mkdir -p $outDir

trimmomatic PE -threads 4 -summary $outDir/SRR36631310_summary.txt $wd/SRR36631310_1.fastq $wd/SRR36631310_2.fastq -baseout $outDir/SRR36631310_ ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75
echo "Finished job on $(date)"
