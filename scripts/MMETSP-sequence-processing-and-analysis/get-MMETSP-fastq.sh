#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=get-fq # Job name
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=15gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=logs/get-ref-fq_%j.log # Standard output/error
#SBATCH --qos=unlim
#
# fetch reference transcriptome fastq files from NCBI
#
cd /vortexfs1/scratch/dgellermcgrath/ref-transcriptome-data
module load anaconda/5.1
source activate downloading
#
cat ref-transcriptome-SRR-NCBI.txt | while read sample
do fastq-dump --defline-seq '@$sn[_$rn]/$ri' --outdir /vortexfs1/scratch/dgellermcgrath/ref-transcriptome-data/fastq_files/raw_refseqs --gzip --split-3 $sample
done
