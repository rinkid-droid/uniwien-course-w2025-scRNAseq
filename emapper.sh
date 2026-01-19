#!/bin/bash

#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/emapper.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/emapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at

### ENVIRONMENT

module load eggnogmapper/2.1.13-foss-2024a
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106/doloi"
outDir="/lisc/data/scratch/course/2025w300106/doloi/results/map"

mkdir $outDir/emapper

## data dir already specified; check by echo in the lisc
## e-value to 0.006 to reduce the chance of random matches but also not too strict

echo "Job started on $(date)"

emapper.py --override --cpu 8 -i $wd/proteins.filtered.fasta --itype proteins -m diamond --evalue 1e-5 --seed_ortholog_evalue 0.006 --go_evidence experimental -o celegans_emapper  --output_dir $outDir/emapper

echo "Job finished on $(date)"

