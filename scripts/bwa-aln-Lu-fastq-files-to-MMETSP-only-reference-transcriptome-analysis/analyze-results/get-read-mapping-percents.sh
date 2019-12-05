#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=get-rmaps # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=get_read_mappings_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data/bwa-output
module load anaconda/5.1
source activate genex
#
for i in *[0-9].sam
do
echo "$i" >> read_mappings.txt
samtools flagstat "$i" >> read_mappings.txt
done
