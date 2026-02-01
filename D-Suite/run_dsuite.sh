#!/bin/bash
/Users/daniellerivera/Desktop/Dsuite-master/Build/Dsuite Dtrios -t tree.nwk -o rgran_1S rgran_ref_1SNP-locus.vcf sets.txt

#make a plot_order txt file from sets.txt
#cut -f 2 sets.txt | uniq | head -n 20 > plot_order.txt
ruby plot_d.rb rgran_1S_BBAA.txt plot_order.txt 0.5 rgran_0_5.svg
ruby plot_f4ratio.rb rgran_1S_BBAA.txt plot_order.txt 0.4 rgran_0.4_f4-ratios.svg


#assess gene flow events with Fbranch
/Users/daniellerivera/Desktop/Dsuite-master/Build/Dsuite Fbranch tree.nwk rgran_1S__tree.txt -p 0.05 > rgran_p0.05_Fbranch.txt
python /Users/daniellerivera/Desktop/Dsuite-master/utils/dtools.py rgran_p0.05_Fbranch.txt tree.nwk


