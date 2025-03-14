# Run RATT on the new Erdmann ASM

### RATT Documentation: https://vcru.wisc.edu/simonlab/bioinformatics/programs/ratt/Documentation.html#How_to_call_the_program


# Request resources & Activate Ratt v1.0.3 Conda ENV
```
srun -p priority --pty -n 1 --mem 8G -t 0-04:59 /bin/bash

conda activate /home/mm774/conda3/envs/Ratt_v1_0_3
```


## Define needed paths
```
RepoDir="/n/data1/hms/dbmi/farhat/mm774/Projects/ErdmanV2_Processing_V1/erdman-asm-explore"

i_ASM_FA="${RepoDir}/Results/ErdmanPolished.circ.fasta"

cd $RepoDir/Results

Rv_embl_dir="/n/data1/hms/dbmi/farhat/mm774/References/H37Rv_Anno_EMBL/"

mkdir $RepoDir/Results/RATT
```

### A) Run RATT Anno (Rv based) - Strain Repetitive Setting ###
```
i_Target_OutDir="$RepoDir/Results/RATT/RATT_StrainRepetitive"

mkdir ${i_Target_OutDir}
cd ${i_Target_OutDir}

# build ratt command
time ratt ${Rv_embl_dir} $i_ASM_FA -t 'Strain.Repetitive' -p Erdmann.Strain.Repetitive
```



### B) Run RATT Anno (Rv based) - Assembly.Repetitive Setting ###

```
i_Target_OutDir="$RepoDir/Results/RATT/RATT_AssemblyRepetitive"

mkdir ${i_Target_OutDir}
cd ${i_Target_OutDir}

# build ratt command
time ratt ${Rv_embl_dir} $i_ASM_FA -t 'Assembly.Repetitive' -p Erdmann.Assembly.Repetitive
```




### C) Run RATT Anno (Rv based) - Assembly.Repetitive Setting ###

````
i_Target_OutDir="$RepoDir/Results/RATT/RATT_SpeciesRepetitive"

mkdir ${i_Target_OutDir}
cd ${i_Target_OutDir}

# Run ratt command ( 256m38.672s)
time ratt ${Rv_embl_dir} $i_ASM_FA -t 'Species.Repetitive' -p Erdmann.Species.Repetitive
```

