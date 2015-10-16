#!/bin/bash
for q in $( ls phage_fa ); do
	for s in $( ls fasta_filter ); do
	echo "tblastx -query phage_fa/$q -subject fastas_filtrados/$s -outfmt '6 qseqid sseqid qseq qstart qend qframe sseq sstart send sframe qlen slen length evalue' -evalue 0.01 -out result_tblastx/phage_tail_protein_fig""_vs_Timbebas2012_out.tblastx"
    done
done
