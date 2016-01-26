#!/bin/bash
for q in $( ls cat_axt ); do
	while [ $(ps -Af | grep "KaKs_Calculator" | wc -l) -gt 18 ]
	do
		sleep 5
	done
	KaKs_Calculator -i cat_axt/$q -o cat_result_kaks/$q.kaks -m LWL   2>&1 > cat_log_kaks/log_$q  &
	sleep 1

done
