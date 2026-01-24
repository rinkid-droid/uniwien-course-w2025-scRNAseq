#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/STAR.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=rinki.doloi@univie.ac.at

###ENVIRONMENT
module load STAR
module list


###EXECUTION

echo "Job started on $(date)"
STAR --genomeDir /lisc/data/scratch/course/2025w300106/doloi/Celegans_STAR --runThreadN 16 --readFilesIn /lisc/data/scratch/course/2025w300106/doloi/SRR36631310_1.fastq /lisc/data/scratch/course/2025w300106/doloi/SRR36631310_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/doloi/results/map/SRR36631310_WBCel --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate
