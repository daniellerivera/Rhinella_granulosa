# Rhinella granulosa - Introgressive Hybridization Analysis

Code and data for phylogenetic and population genetic analyses of the *Rhinella granulosa* species group.

## Citation

Rivera D, Prates I, Caldwell JP, Rodrigues MT, Fujita MK. 2022. Testing assertions of widespread introgressive hybridization in a clade of neotropical toads with low mate selectivity (_Rhinella granulosa_ species group). _Heredity_ 130: 14-21.

**DOI:** https://doi.org/10.1038/s41437-022-00571-9  
**PDF:** https://daniellerivera.org/wp-content/uploads/2022/11/rivera-et-al.-2022.-heredity.pdf

## Overview

This repository contains all code and scripts used to perform the analyses in Rivera et al. (2022), including admixture analysis, introgression tests, phylogenetic inference, and spatial genetic clustering.

## Requirements

### Software Dependencies
- **ADMIXTURE** - for ancestry inference
- **D-Suite** - for introgression analysis
- **R** (≥3.5) with packages:
  - `adegenet` (for DAPC)
  - `tess3r` (for spatial analysis)
  - Additional packages listed in individual R scripts
- **G-PhoCS** - for demographic inference
- **IQ-TREE** - for maximum likelihood phylogenies
- **MrBayes** - for Bayesian phylogenies
- **PAUP*** - for SVDQuartets analysis
- **Python** (for ADMIXTURE processing)
- **Bash** (for running analysis scripts)

## Repository Structure

### 1. Admixture
Ancestry inference analysis using ADMIXTURE.
- `Analysis/` - Input files and bash scripts to run ADMIXTURE
- `R_processing/` - R scripts and files to process ADMIXTURE output and generate figures

### 2. D-Suite
Introgression testing using D-statistics.
- `Dsuite-master/` - D-Suite program
- Input and output files from D-Suite analyses

### 3. DAPC
Discriminant Analysis of Principal Components.
- `DAPC.R` - R script for analysis
- Input files and output figures

### 4. G-PhoCS
Demographic inference analysis.
- `gramir_mercenhum_maj_nomig_1mg_alp2_bet30/` - G-PhoCS output files
- Input files and bash scripts for running G-PhoCS

### 5. Phylogenies
Phylogenetic reconstructions using two approaches and two datasets.
- `Rgranulosa_IQTree_16S/` - Maximum likelihood analysis of 16S data
- `Rgranulosa_IQTree_ddRADseq/` - Maximum likelihood analysis of ddRADseq data
- `Rgranulosa_Mrbayes_16S/` - Bayesian analysis of 16S data
- `Rgranulosa_MrBayes_ddRADseq/` - Bayesian analysis of ddRADseq data

### 6. SVDQuartets
Species tree inference using SVDQuartets in PAUP*.
- Input and output files
- Bash script for running the analysis

### 7. TESS3r
Spatial population genetic analysis.
- `TESS3r.r` - R script for analysis
- Input files and output figures

## Usage

Each analysis folder contains the necessary input files and scripts. To reproduce the analyses:

1. **ADMIXTURE**: Navigate to `Admixture/Analysis/` and run the bash scripts
2. **D-Suite**: Navigate to `D-Suite/` and follow D-Suite documentation
3. **DAPC**: Run `DAPC/DAPC.R` in R
4. **G-PhoCS**: Navigate to `G-PhoCS/` and run the provided bash script
5. **Phylogenies**: Use the input files with IQ-TREE or MrBayes as appropriate
6. **SVDQuartets**: Navigate to `SVDQuartets/` and run the bash script with PAUP*
7. **TESS3r**: Run `TESS3r/TESS3r.r` in R

## Data Availability

Original data are available from Dryad: DOI: 10.5061/dryad.p2ngf1vtc

## Contact

For questions about the code or analyses, please open an issue or contact:
- Danielle Rivera: drivera2288[at]gmail.com
