#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=hmmscan # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run one task
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=2-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=hmmscan_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/results-trinity-2nd-run
module load anaconda/5.1
source activate downloading
hmmscan --cpu 36 \
--domtblout TrinotatePFAM.out Pfam-A.hmm alexandrium-ref-trans-combined-all-fw-reads-and-lu.fa.transdecoder.pep > pfam.log
