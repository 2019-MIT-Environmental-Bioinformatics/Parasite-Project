#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=trim # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=logs/refSeqs_trimmomatic_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/ref-transcriptome-data/fastq_files
module load anaconda/5.1
source activate downloading
#
#trimming 50bp reads to min length of 37, with phred33 score of at least 20
#
cat refSeq-namePairs.txt | while read line
do
input1=$(echo "$line" | awk '{print $1}')
input2=$(echo "$line" | awk '{print $2}')
R1=$(echo "$line" | awk '{print $1}' | sed 's\.fastq.gz\\')
R2=$(echo "$line" | awk '{print $2}' | sed 's\.fastq.gz\\')
trimmomatic PE -threads 36 raw_refseqs/"$input1" raw_refseqs/"$input2" \
trimmed_refseqs/"$R1".trimmed.fastq.gz untrimmed_refseqs/"$R1".untrimmed.fastq.gz \
trimmed_refseqs/"$R2".trimmed.fastq.gz untrimmed_refseqs/"$R2".untrimmed.fastq.gz \
SLIDINGWINDOW:4:20 MINLEN:37
done
