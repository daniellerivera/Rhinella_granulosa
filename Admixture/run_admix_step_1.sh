#!/bin/bash 
###edit filename and directory name

s=rgran_ref
dir=/home/lepidodactylus/Desktop/Danielle/admixture/granulosa/rgran_ref

mkdir ${s}
mkdir ${s}/Populations

### run populations
/home/lepidodactylus/Documents/stacks/stacks-2.54/populations -V ${s}.vcf -O ./${s}/Populations -M pops.txt -t 50
python Filter_All_tsv.py -i ${dir}/${s} -m 65 -s random --remove_singletons
### convert tsv files to additions output files for downdtream analyses and move them around to prep for Admixture
python Convert_All_tsv.py -i ${dir}/${s}
bash ${dir}/run_admix_step_2.sh