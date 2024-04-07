#! /bin/bash

#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0-00:30
#SBATCH -p shared
#SBATCH --mem=8000

singularity exec /n/boslfs02/LABS/sfortune_lab/Lab/containers/busco_v5.6.1_cv1.sif busco -f -c 8 -m genome -i ./polished.fasta -o BuscoPolishedAssembly --auto-lineage-prok
