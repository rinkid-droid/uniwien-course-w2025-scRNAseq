#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/stringtie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/stringtie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at


###ENVIRONMENT

module load StringTie/3.0.3-GCC-14.3.0
module list

### VARIABLES

# -l to start the gene annotations with
# -j to minimize junction coverage to 5
# -g = 100 to allow max gapping between read mappings since its worm genome
# -m = 200 max transcript length as is usually considered 

inputbam="/lisc/data/scratch/course/2025w300106/doloi/results/map/filtered_trimmed_SRR36631310_WBCel.bam"

stringtie $inputbam -l C_elegans_1 -o bioDATAAnalysis_Cel.gtf -p 4 -j 5 -g 100 -m 200
