GENERAL-INFO-START

		seq-file		gran_ingrps_sub_gphocs.gphocs
		trace-file		gramir_mercenhum_maj_nomig_200kgen_all-loc_alp2_bet30_run13.out
		num-loci		2744
		burn-in			20000
		
		mcmc-iterations		200000
		iterations-per-log	1000
		logs-per-line		1000

		tau-theta-print		1
		tau-theta-alpha		2
		tau-theta-beta		30 
		
		mig-rate-print		1
		mig-rate-alpha		1
		
		mig-rate-beta		0.0000001
		
		#start-mig		10000

		locus-mut-rate		CONST

		find-finetunes		TRUE
		find-finetunes-num-steps		500
		find-finetunes-samples-per-step		500


GENERAL-INFO-END


CURRENT-POPS-START

		POP-START
				name		gra
				samples		R_granulosa_MTR12027 d R_granulosa_MTR12028 d R_granulosa_MTR12059 d R_granulosa_MTR12175 d R_granulosa_MTR16052 d R_granulosa_MTR22936 d R_granulosa_MTR22988 d
		POP-END

		POP-START
				name		mer
				samples		R_merianae_LSUMZH-12458 d R_merianae_LSUMZH-12483 d R_merianae_LSUMZH-12484 d  R_merianae_LSUMZH-12492 d R_merianae_MTR20519 d R_merianae_MTR23148 d
		POP-END
		
		POP-START
				name		hum
				samples		R_humbolti_ENS11142 d 
		POP-END

		POP-START
				name		cen
				samples		R_centralis_ENS11296 d
		POP-END
				POP-START
				name		mir
				samples		R_mirandaribeiroi_AF725 d R_mirandaribeiroi_AF745 d R_mirandaribeiroi_AF746 d R_mirandaribeiroi_LAJ406 d R_mirandaribeiroi_MRT2120 d R_mirandaribeiroi_MRT2716 d R_mirandaribeiroi_MRT7135 d R_mirandaribeiroi_MRT8997 d R_mirandaribeiroi_MTR26991 d R_mirandaribeiroi_PHV4041 d
		POP-END

				POP-START
				name		maj
				samples		R_major_BM395 d R_major_BM410 d R_major_H3058 d R_major_H4920 d R_major_LSUMZH-15119 d R_major_LSUMZH-15120 d R_major_LSUMZH-15121 d R_major_LSUMZH-15122 d
		POP-END
CURRENT-POPS-END


ANCESTRAL-POPS-START

		POP-START
				name		gramir
				children		gra		mir
				tau-initial		0.002
		POP-END

		POP-START
				name		humcen
				children		hum		cen
				tau-initial		0.004
		POP-END

		POP-START
				name		humcenmer
				children		humcen		mer
				tau-initial		0.005
		POP-END

		POP-START
				name		humcenmermaj
				children		humcenmer	maj
				tau-initial		0.006
		POP-END

		POP-START
				name		root
				children		humcenmermaj	gramir
				tau-initial		0.008
				
	  	POP-END
		

ANCESTRAL-POPS-END


MIG-BANDS-START


MIG-BANDS-END

