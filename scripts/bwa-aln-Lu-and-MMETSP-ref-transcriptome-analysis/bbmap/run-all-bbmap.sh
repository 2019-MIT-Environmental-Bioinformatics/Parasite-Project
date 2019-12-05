#!/bin/bash
#SBATCH --partition=scavenger # Queue selection
#SBATCH --job-name=bbmap # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run on one CPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=bbmap-all-%j.log# Standard output/error
#SBATCH --qos=scavenger
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/lu-et-al-data/trimmed-fastq-files
module load anaconda/5.1
source activate downloading
cat ../run-bbmap/contaminated-lu-samples.txt | while read file
do
bbmap.sh maxindel=100000 minid=0.95 ref=amoebophrya_genome.fa in="$file" outm="$file"-contam.fq.gz outu="$file"-decontam.fq.gz #recommended maxindel parameter by developer for RNASeq data mapping to eukaryotic genome, minid 95% because the parasite dinoflagellate is closely related to the host dinoflagellate alexandrium fundyense. amoebophyra reference genome used is the parasite reference genome.
rm -r ref
done
