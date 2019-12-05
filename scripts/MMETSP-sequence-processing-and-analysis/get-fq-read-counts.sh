#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=ref_rc # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=2-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=get_refSeq_rc_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/ref-transcriptome-data
for i in *.gz
do zgrep -cH $(echo @"$i" | sed 's\_[0-9].fastq.gz\\') $i >> ref-fastq-read-counts.txt
done
