#! /bin/bash

#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0-01:00
#SBATCH -p shared
#SBATCH --mem=16000

module load python/3.10.9-fasrc01
source activate assembly
#--nano-corr
#2.9.2-b1786
flye --nano-corr ./fastq/LibSingle_combo_nanopore.fastq.gz -t 8 -g 4m -o ./flye_assembly_nano_corr 

mamba deactivate

#medaka 1.9.1
exec /n/boslfs02/LABS/sfortune_lab/Lab/containers/medaka.sif medaka_consensus -i ./fastq/LibSingle_combo_nanopore.fastq.gz -d ./flye_assembly_nano_corr/assembly.fasta \
	-m r1041_e82_400bps_sup_v4.1.0 -t 8 -o medaka

