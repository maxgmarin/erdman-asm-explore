#! /bin/bash

#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0-01:00
#SBATCH -p shared
#SBATCH --mem=16000

#medaka 1.9.1
exec /n/boslfs02/LABS/sfortune_lab/Lab/containers/medaka.sif medaka_consensus -i ./LibSingle_combo_nanopore.fastq.gz -d ./flye_assembly_nano_corr/assembly.fasta \
	-m r1041_e82_400bps_sup_v4.1.0 -t 8 -o medaka2


