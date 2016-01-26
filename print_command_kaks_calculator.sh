#!/bin/bash
for q in $( ls axt ); do
	echo "/home/acantu/bin/KaKs_Calculator -i axt/$q -o result_kaks/$q.kaks -m ALL"
done
