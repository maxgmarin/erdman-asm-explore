# Erdman ONT assembly processing scripts
Order of scripts run
1) 1.fastp.sh : Runs fastp for trimming and filtering of paired-end short reads (Illumina WGS)
2) 2.flye_assembly.sh : Run Flye and medaka for de novo assembly and polishing of de novo long read (ONT) assembly output by Flye
3) 4.run_polypolish.sh : Run polypolish to polish assembly with short-read WGS data
4) 5.run_circulator.sh : Run circlator to set the start of the circular genome assembly to dnaA (`Rv0001`).
5) 6.run_busco.sh: Run BUSCO tool to calculate a BUSCO score as a assembly QC metric.
