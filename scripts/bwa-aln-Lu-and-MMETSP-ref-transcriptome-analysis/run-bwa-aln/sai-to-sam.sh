#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=samse # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=50gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=samse_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs/bwa-output
module load anaconda/5.1
source activate genex
cat ../2nd-sai-fq-index.txt | while read sample; do sai=$(echo "$sample" | awk '{print $1}'); fq=$(echo "$sample" | awk '{print $2}'); \
out=$(echo "$sample" | awk '{print $1}' | sed 's\.sai\\'); bwa samse alexandrium-ref-trans-combined-all-fw-reads-and-lu.fa "$sai" \
../"$fq" > "$out".sam; done
