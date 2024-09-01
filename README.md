# Erdman *de novo* assembly, annotation, and analysis
This repository contains all code and analysis needed to reproduce the genome assembly and analysis of *<TITLE HERE>*. <br>

## Contents
- [Assembly pipeline](#assembly-pipeline)
- [Results](#Results)
  - [Curated Genome Annotation](#curated-genome-annotation)
  - [Automated Genome Annotation](#automated-genome-annotation)
  - [Supplemental Files](#supplemental-files)
- [License](#license)

## Assembly pipeline
All tools (+ parameters) used for producing the final Erdman assembly can be found in the [`scripts/`](scripts/) directory.
Information about individual steps can be found in [`scripts/README.md`](scripts/README.md).

## Results

### Curated Genome Annotation

To produce a high quality genome annotation of the new Erdman genome assembly, the following general steps were performed:

1) RATT was used for the initial liftover of H37Rv's annotated features.
2) In cases where genomic regions were not able to be annotated via liftover using RATT, automated annotations produced by Bakta were used instead.
3) This was followed by manual curation of the integrated plasmid sequence. 

The manual curation and matching of gene annotations to the H37Rv equivalent was done to maximize the utility of using this new Erdman genome as a reference.

All relevant code and analysis steps for can be found in ______.


### Automated Genome Annotation

Bakta (v1.5) was used to produce an automated genome annotation for the Erdman genome.
The output of Bakta can be found in [`Results/Bakta_annotation`](Results/Bakta_annotation).

### Supplemental Files
🚧 Check back soon 🚧

## License
This repository is distributed under the [MIT license terms](LICENSE).
