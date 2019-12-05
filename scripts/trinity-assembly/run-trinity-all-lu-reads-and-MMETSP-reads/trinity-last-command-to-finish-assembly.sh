#!/bin/bash
#SBATCH --partition=bigmem # Queue selection
#SBATCH --job-name=trinity # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=70 # Run one task
#SBATCH --mem=2500gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=trinity_gf_lastCommand_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs/trinity-allSeqs-assembly-output/read_partitions/Fb_0/CBin_437
module load anaconda/5.1
source activate downloading
#
Trinity --single "/vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs/trinity-allSeqs-assembly-output/read_partitions/Fb_0/CBin_437/c43704.trinity.reads.fa" --output "/vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs/trinity-allSeqs-assembly-output/read_partitions/Fb_0/CBin_437/c43704.trinity.reads.fa.out" --CPU 70 --max_memory 2500G --seqType fa --trinity_complete --full_cleanup
