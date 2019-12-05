#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=bwa-9 # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=bwa-9_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
module load anaconda/5.1
source activate genex
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs
#
cat sample-partitions/trimmed-samples-ai | while read sample
do
out=$(echo "$sample" | sed 's\-trimmed.fastq.gz\\')
bwa aln -t 36 bwa-output/alexandrium-ref-trans-combined-all-fw-reads-and-lu.fa "$sample" > bwa-output/"$out".sai
done
