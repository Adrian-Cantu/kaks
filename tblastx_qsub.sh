#!/bin/bash

#$ -N tblast_axt_

#$ -j y




FILE=$(cat command.temp | head -n $SGE_TASK_ID | tail -n 1)

sh -c "/usr/local/blast+/bin/${FILE}"

