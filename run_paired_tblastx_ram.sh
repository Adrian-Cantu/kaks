#!/bin/bash
for q in $( ls phage_fa ); do
	for s in $( ls fasta_filter ); do
	echo "tblastx -query phage_fa/$q -subject fasta_filter/$s -outfmt "'"'"6 qseqid sseqid qseq qstart qend qframe sseq sstart send sframe qlen slen length evalue"'"'" -evalue 0.01 -out result_tblastx/$q"_"vs_$s"".tblastx"
    done
done
