#! /bin/bash

#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0-01:00
#SBATCH -p shared
#SBATCH --mem=16000

module load python/3.10.9-fasrc01
source activate assembly

draft=./medaka/consensus.fasta
read1=./fastq/LibSingle_combo_S295.R1.trim.fastq.gz
read2=./fastq/LibSingle_combo_S295.R2.trim.fastq.gz

bwa index ${draft}
bwa mem -t 8 -a ${draft} ${read1} > alignments_1.sam
bwa mem -t 8 -a ${draft} ${read2} > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
#--careful
polypolish polish ${draft} filtered_1.sam filtered_2.sam > polished.fasta
#rm *.amb *.ann *.bwt *.pac *.sa *.sam

mamba deactivate

