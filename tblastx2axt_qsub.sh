#!/bin/bash

#$ -N tblast2axt

#$ -j y




FILE=$(cat command_tblastx2axt.temp | head -n $SGE_TASK_ID | tail -n 1)

$FILE 



#sh -c "/usr/local/blast+/bin/${FILE}"

