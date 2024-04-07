#! /bin/bash

#SBATCH -n 4
#SBATCH -N 1
#SBATCH -t 0-00:30
#SBATCH -p shared
#SBATCH --mem=16000

module load python/3.10.9-fasrc01
source activate fastp_qc


#mkdir trimmed
while IFS=$'\t' read -r -a array;
do
	fastp --detect_adapter_for_pe --thread 4 \
		--length_required 50 --dedup \
		-i ${array[1]} -I ${array[2]} \
		-o ${array[0]}.R1.trim.fastq.gz -O ${array[0]}.R2.trim.fastq.gz --failed_out ${array[0]}.fail.fastq.gz
done < $1

conda deactivate
