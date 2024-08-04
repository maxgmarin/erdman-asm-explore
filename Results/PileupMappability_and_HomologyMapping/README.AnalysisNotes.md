##  Notes for processing of the new Erdman assembly

I ran the pupmapper tool to calculate pileup mappability across the new Erdman genome.

Next, I used minimap2 to generate a homology map of the new Erdman assembly.


#### PLEASE NOTE, I renamed the chromosome of the Erdman assembly to `>ErdmanV2`. This can be found in the FASTA file in this directory.


#### Code run to perform analysis

```
## Gameplan:

# Step 1: Download ErdmanAsm.V2 & Rename Chr name to be compatible with Genmap

# Step 2: Run Pupmapper (all steps) on ErdmanAsm.V2 FASTA

# Step 3: Run Minimap2 (v2.26) homology mapping on ErdmanAsm



#### Step 1: Download ErdmanAsm.V2 & Rename Chr name to be compatible with Genmap ####

Erdman_Proc_Dir="/Users/mgmarin/Documents/Bioinfo/ErdmanV2_Processing_V1"

mkdir ${Erdman_Proc_Dir}

cd ${Erdman_Proc_Dir}

Erdman_FA="ErdmanPolished.circ.Renamed.fasta"

grep ^">" $Erdman_FA



####  Step 2: Run Pupmapper (all steps) on ErdmanAsm.V2 FASTA ####

conda activate pupmap_v1 

Erdman_Proc_Dir="/Users/mgmarin/Documents/Bioinfo/ErdmanV2_Processing_V1"

cd ${Erdman_Proc_Dir}

Erdman_FA="ErdmanPolished.circ.Renamed.fasta"

RunAllSteps_OutDir="Erdman_RunGenmapAndPmap_K50E4"

time pupmapper run_all -i ${Erdman_FA} -o ${RunAllSteps_OutDir} -k 50 -e 4

# It took 95 seconds to run all of the steps

cd Erdman_RunGenmapAndPmap_K50E4
gzip -c < ErdmanPolished.circ.Renamed.PileupMap.K50_E4.bedgraph > ErdmanPolished.circ.Renamed.PileupMap.K50_E4.bedgraph.gz


# genmap --version                         
GenMap version: 1.3.0
SeqAn version: 2.4.1




#### Step 3: Run Minimap2 (v2.26) homology mapping on ErdmanAsm ####

Erdman_Proc_Dir="/Users/mgmarin/Documents/Bioinfo/ErdmanV2_Processing_V1"

cd ${Erdman_Proc_Dir}

Erdman_FA="${Erdman_Proc_Dir}/ErdmanPolished.circ.Renamed.fasta"


mkdir ${Erdman_Proc_Dir}/ErdmanV2.HomologyMap
cd ${Erdman_Proc_Dir}/ErdmanV2.HomologyMap


AsmID="ErdmanV2"

Input_Asm_FA=${Erdman_FA}



mm2_aln_params="-k19 -w19" 

Hmap_SAM="${AsmID}.HomologyMap.sam"
Hmap_PAF="${AsmID}.HomologyMap.paf"
Hmap_Merged_BED="${AsmID}.HomologyMap.merged.WiCounts.bed"


minimap2 --MD -DP ${mm2_aln_params} -a --cs ${Input_Asm_FA} ${Input_Asm_FA} > ${Hmap_SAM}

minimap2 -DP ${mm2_aln_params} -c --cs ${Input_Asm_FA} ${Input_Asm_FA} > ${Hmap_PAF}

bedtools bamtobed -i ${Hmap_SAM} | cut -f 1-3 | sort -k2,2n -k3,3n | bedtools merge -c 1 -o count > ${Hmap_Merged_BED}


### Version notes:

minimap2 2.26
samtools 1.18
Using htslib 1.17
bedtools v2.31.1

##################################################################
```