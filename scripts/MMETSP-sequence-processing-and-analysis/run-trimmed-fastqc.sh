#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=f_qc # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=logs/refSeq_trimmed_fastqc_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/ref-transcriptome-data/
module load anaconda/5.1
source activate downloading
for i in fastq_files/trimmed_refseqs/*.gz
do fastqc ${i} -o refseqs-fastqc-after-trimming -t 8
done
