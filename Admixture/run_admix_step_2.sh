#!/bin/bash 
###edit filename and directory name

s=rgran_ref
dir=/home/lepidodactylus/Desktop/Danielle/admixture/granulosa/rgran_ref

mkdir ${dir}/${s}_Output-Files ${dir}/admix_cv ${dir}/qfiles
cd ${dir}/${s}/Populations/Output-Files
mv *.* ${dir}/${s}_Output-Files
bash ${dir}/run_admix_step_3.sh

