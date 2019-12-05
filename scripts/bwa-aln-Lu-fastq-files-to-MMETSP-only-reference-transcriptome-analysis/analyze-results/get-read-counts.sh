#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=get-rc # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=get_read_count_%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data/bwa-output
module load anaconda/5.1
source activate genex
#
for seq in *.sam
do
name=${seq%.sam}
picard CleanSam I="$seq" O="${name}"-clean.sam 
picard SortSam I="${name}"-clean.sam O="${name}"-sorted.sam SORT_ORDER=coordinate
samtools view -F 260 "${name}"-sorted.sam | cut -f 3 | sort | uniq -c | awk '{printf("%s\t%s\n", $2, $1)}' > "${name}"-counts.txt
rm "${name}"-clean.sam
rm "${name}"-sorted.sam
done
