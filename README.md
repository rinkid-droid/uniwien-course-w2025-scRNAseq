# uniwien-course-w2025-scRNAseq
Scripts used for the first part of the scRNAseq course (w300106) by jdmontenegro
## Content of the repository
| **Files**  | **Description** |
| ------------- | ------------- |
| emapper.sh  | Contains slurm script from eggnogmapper module for functional annotations of proteins |
| featurecounts.sh  | Contains slurm script for featurecounts from the Subread module for getting counts from mapped reads |
| filtered.proteins.py  | Contains python script for seqIO from the Biopython module for filtering '.' |
| filtered_samtools.sh | Contains slurm script from SAMtools view module for filtering reads |
| star_align.sh and star_trimmed_align.sh  | Contains slurm script from STAR module for alignment with and without trimmed reads, respectively |
| stringtie.sh  | Contains slurm script from Stringtie module for assembling reads |
| trimmomatic.sh  | Contains slurm script from Trimmomatic for trimming reads |
