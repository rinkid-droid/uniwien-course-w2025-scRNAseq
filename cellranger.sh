#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/doloi/logs/cellranger.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/doloi/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=rinki.doloi@univie.ac.at

### ENVIRONMENT

module load CellRanger/10.0.0
module list

### VARIABLES

wd="/lisc/data/scratch/course/2025w300106"
index="${wd}/common/NV2_fluo"
fastq_dir="${wd}/common/blastula.12h/run1,${wd}/common/blastula.12h/run2,${wd}/common/blastula.12h/run3"
sample="89085"  ##name of the sample it starts with
outDir="${wd}/doloi/results/cellranger"
id="blastula.12h" ## name it accordingly

### EXECUTION

## --force-cells = restricts to 10000 cells
## --nosecondary good for bulkrnaseq data not for scRNAseq data
## --create-bam only if needed for alignment for downstream analysis like snp calling


echo "Started job on $(date)"

mkdir -p ${outDir}
cd ${outDir}

cellranger count --localcores 16 --transcriptome $index --fastqs $fastq_dir --sample $sample --nosecondary --force-cells 10000 --id $id --create-bam false

echo "Finished job on $(date)"
