#!/bin/bash
#SBATCH --partition=compute # Queue selection
#SBATCH --job-name=trinity # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=1 # Run one task
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=180gb # Job memory request
#SBATCH --time=1-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=logs/trinity_%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/ref-transcriptome-data/fastq_files/trimmed_refseqs
module load bio
module load bowtie2/2.3.4.1
module load jellyfish/2.2.10
module load salmon/0.9.1
module load samtools/1.8
module load trinity/2.6.6
#
Trinity --seqType fq --left SRR1294385_1.trimmed.fastq.gz,SRR1294386_1.trimmed.fastq.gz,SRR1294387_1.trimmed.fastq.gz,SRR1294388_1.trimmed.fastq.gz,SRR1294389_1.trimmed.fastq.gz,SRR1294390_1.trimmed.fastq.gz,SRR1300214_1.trimmed.fastq.gz --right SRR1294385_2.trimmed.fastq.gz,SRR1294386_2.trimmed.fastq.gz,SRR1294387_2.trimmed.fastq.gz,SRR1294388_2.trimmed.fastq.gz,SRR1294389_2.trimmed.fastq.gz,SRR1294390_2.trimmed.fastq.gz,SRR1300214_2.trimmed.fastq.gz --CPU 36 --max_memory 180G --output trinity-refseq-assembly-output
