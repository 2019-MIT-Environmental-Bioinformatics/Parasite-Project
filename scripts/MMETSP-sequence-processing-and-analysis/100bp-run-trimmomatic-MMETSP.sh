#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=trim # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=logs/100bp_trimmomatic_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/ref-transcriptome-data/fastq_files
module load anaconda/5.1
source activate downloading
#
#trimming 100bp reads from one of the MMETSP samples to min length of 70 with phred33 score of at least 24
# chose 24 vs lower score such as 20  because overall read quality is so high to begin with
#
trimmomatic PE -threads 36 raw_refseqs/SRR1294390_1.fastq.gz raw_refseqs/SRR1294390_2.fastq.gz \
trimmed_refseqs/SRR1294390_1.trimmed.fastq.gz untrimmed_refseqs/SRR1294390_1.untrimmed.fastq.gz \
trimmed_refseqs/SRR1294390_2.trimmed.fastq.gz untrimmed_refseqs/SRR1294390_2.untrimmed.fastq.gz \
SLIDINGWINDOW:4:24 MINLEN:70

