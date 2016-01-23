#!/bin/bash
for q in $( ls in_genes ); do
	for s in $( ls in_metagenome ); do
#		fq=$(echo $q | cut -f1 -d'.')
#		fs=$(echo $s | cut -f1 -d'.')
		echo "perl tblastx2axt.pl -q in_genes/$q -s fasta_filter/$s -b out_tblastx/$q""_vs_$s.tblastx -o axt/$q""_vs_$s.axt"
	done
done
