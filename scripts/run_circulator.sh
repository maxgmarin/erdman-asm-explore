#! /bin/bash

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-0:20
#SBATCH -p shared
#SBATCH --mem=8000

genome=$1
prefix=$2
filename=/n/holyscratch01/sfortune_lab/mchase/Mtb/Mtb_dnaA_coding.fasta
img=/n/boslfs02/LABS/sfortune_lab/Lab/containers/circlator_latest.sif
singularity exec ${img} circlator fixstart \
	--genes_fa ${filename} ${genome} ${prefix}.circ








