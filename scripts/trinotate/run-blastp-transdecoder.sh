#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=blastp # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run one task
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=2-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=blastp-transdecoder_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/results-trinity-2nd-run
module load anaconda/5.1
source activate downloading
blastp -query alexandrium-ref-trans-combined-all-fw-reads-and-lu.fa.transdecoder.pep \
-db uniprot_sprot.pep \
-num_threads 36 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.outfmt6
