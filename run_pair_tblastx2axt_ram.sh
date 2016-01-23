#!/bin/bash
for q in $( ls phage_fa ); do
	for s in $( ls fastas_filtrados ); do
		fq=$(echo $q | cut -f1 -d'.')
		fs=$(echo $s | cut -f1 -d'.')
		while [ $(ps -Af | grep "perl" | wc -l) -gt 18 ]
		do
			sleep 5
		done
		perl tblastx2axt.pl -q phage_fa/$q -s fastas_filtrados/$s -b  /home/acantu/metagenomes/ensambles/ensambles_elegidos/result_tblastx/$fq\_vs_$fs.tblastx > axt/$fq\_vs_$fs.axt  &
		sleep 1
	done
done
