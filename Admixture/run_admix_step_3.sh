#!/bin/bash 
###edit filename and directory name

s=rgran_ref
dir=/home/lepidodactylus/Desktop/Danielle/admixture/granulosa/rgran_ref

cd ${dir}/${s}_Output-Files
mv *_recoded.ped ${dir}/${s}/Populations/Output-Files
cd ${dir}
bash ${dir}/run_admix_step_4.sh

