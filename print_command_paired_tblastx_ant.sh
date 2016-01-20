#!/bin/bash
for q in $( ls in_genes ); do
	for s in $( ls in_metagenome ); do
	echo "tblastx -query in_genes/$q -subject in_metagenomes/$s -outfmt "'"'"6 qseqid sseqid qseq qstart qend qframe sseq sstart send sframe qlen slen length evalue"'"'" -evalue 0.01 -out out_tblastx/$q"_"vs_$s"".tblastx"
    done
done
