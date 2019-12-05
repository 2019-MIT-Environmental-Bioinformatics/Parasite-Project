#!/bin/bash
#SBATCH --partition=bigmem # Queue selection
#SBATCH --job-name=trinity # Job name
#SBATCH --mail-type=ALL# Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=dgellermcgrath@gmail.com # Where to send mail
#SBATCH --ntasks=70 # Run one task
#SBATCH --mem=2500gb # Job memory request
#SBATCH --time=2-00:00:00 # Time limit hrs:min:sec
#SBATCH --output=trinity_grandFinal_allSeqs%j.log# Standard output/error
#SBATCH --qos=unlim
#
cd /vortexfs1/scratch/dgellermcgrath/envBinf_finalProject/trinity-refseq-assembly-output/trinity-2nd-run-all-seqs
module load anaconda/5.1
source activate downloading
#
Trinity --seqType fq --single SRR3033460-trimmed.fastq.gz,SRR3033461-trimmed.fastq.gz,SRR3033462-trimmed.fastq.gz,SRR3033463-trimmed.fastq.gz,SRR3033464-trimmed.fastq.gz-decontam.fq.gz,SRR3033465-trimmed.fastq.gz-decontam.fq.gz,SRR3033466-trimmed.fastq.gz-decontam.fq.gz,SRR3033467-trimmed.fastq.gz-decontam.fq.gz,SRR3033468-trimmed.fastq.gz-decontam.fq.gz,SRR3033469-trimmed.fastq.gz-decontam.fq.gz,SRR3033470-trimmed.fastq.gz,SRR3033471-trimmed.fastq.gz,SRR3033472-trimmed.fastq.gz,SRR3033473-trimmed.fastq.gz,SRR3033474-trimmed.fastq.gz-decontam.fq.gz,SRR3033475-trimmed.fastq.gz-decontam.fq.gz,SRR3033476-trimmed.fastq.gz-decontam.fq.gz,SRR3033477-trimmed.fastq.gz,SRR3033478-trimmed.fastq.gz,SRR3033479-trimmed.fastq.gz,SRR3033480-trimmed.fastq.gz-decontam.fq.gz,SRR3033481-trimmed.fastq.gz-decontam.fq.gz,SRR3033482-trimmed.fastq.gz-decontam.fq.gz,SRR3033483-trimmed.fastq.gz,SRR3033484-trimmed.fastq.gz-decontam.fq.gz,SRR3033485-trimmed.fastq.gz-decontam.fq.gz,SRR3033486-trimmed.fastq.gz-decontam.fq.gz,SRR3033487-trimmed.fastq.gz,SRR3033488-trimmed.fastq.gz,SRR3033489-trimmed.fastq.gz-decontam.fq.gz,SRR3033490-trimmed.fastq.gz-decontam.fq.gz,SRR3033491-trimmed.fastq.gz-decontam.fq.gz,SRR3033492-trimmed.fastq.gz,SRR1294385_1.trimmed.fastq.gz,SRR1294386_1.trimmed.fastq.gz,SRR1294387_1.trimmed.fastq.gz,SRR1294388_1.trimmed.fastq.gz,SRR1294389_1.trimmed.fastq.gz,SRR1294390_1.trimmed.fastq.gz,SRR1300214_1.trimmed.fastq.gz --CPU 70 --max_memory 2500G --output trinity-allSeqs-assembly-output
