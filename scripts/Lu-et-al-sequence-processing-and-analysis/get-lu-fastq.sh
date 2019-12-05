#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=get-fq-1 # Job name
#SBATCH --mail-type=ALL # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=40gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=fastq_dump_%j.log # Standard output/error
#SBATCH --qos=scavenger
#
# fetch fastq files from NCBI
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data
module load anaconda/5.1
source activate downloading
#
cat SRR_Acc_List.txt | while read sample
do fastq-dump --defline-seq '@$sn[_$rn]/$ri' --outdir /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data/fastq-files --gzip --split-3 $sample
done
