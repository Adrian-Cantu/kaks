#!/bin/bash

#$ -N tblast_axt_

#$ -j y

#$ -t 1-87



FILE=$(cat command.temp | head -n $SGE_TASK_ID | tail -n 1)
cd /home/acantu/metagenomes/ensambles/ensambles_elegidos/

$FILE
