#!/bin/bash 
###edit filename and directory name

s=rgran_ref
dir=/home/lepidodactylus/Desktop/Danielle/admixture/granulosa/rgran_ref

### run Admixture on all recoded.ped files
python admixture-wrapper.py -i ${dir}/${s}/Populations/Output-Files --kmin 1 --kmax 15 --reps 20 --cv 10 -t 50
### copy Avg CV files and .ped files to base subdirectories for processing in R & organization 
cd ${dir}/${s}/Populations/Output-Files
mv *.ped ${dir}/${s}_Output-Files
scp *Avg.txt ${dir}/admix_cv

### zip all .Q files in each subdirectory and move them to folder (to use in programs like Clumpak)
for d in */; do
	echo ${d::-1}
	cd ${d}
	zip "${d::-1}".zip *.Q
	mv *zip ${dir}/qfiles ;
done
cd ${dir}


