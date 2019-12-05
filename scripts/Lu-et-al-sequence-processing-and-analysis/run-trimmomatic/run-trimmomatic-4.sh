#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=trim4 # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=trimmomatic_4_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data/fastq-files
module load anaconda/5.1
source activate downloading
cat ../lu-samplefullNames-04 | while read i
do
out=$(echo "$i" | sed 's\.fastq.gz\\')
trimmomatic SE -threads 36 "$i" ../trimmed-fastq-files/"$out"-trimmed.fastq.gz SLIDINGWINDOW:4:20 MINLEN:37
done

