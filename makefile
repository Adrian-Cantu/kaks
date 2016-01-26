

all:
	echo 'need a command'
	cat makefile

tblastx2axt_qsub: tblastx2axt_qsub.sh command_tblastx2axt.temp
	qsub -cwd -e sge -o sge -t 1-10 ./tblastx2axt_qsub.sh

test3:
	qsub -cwd -e sge -o sge -t 1-3 ./tblastx_qsub.sh

test:
	qsub -q important -cwd  -e sge -o sge ./tblastx_qsub.temp

test_single: single_job_submmit.temp
	qsub -q important -cwd  -e sge -o sge ./single_job_submmit.temp

kaks_single: axt_onejob_sub.temp
	qsub -q important -cwd  -e sge -o sge axt_onejob_sub.temp


clean:
	rm sge/*
	rm *.temp

commands: print_command_paired_tblastx_ant.sh
	print_command_paired_tblastx_ant.sh > command.temp
	cat command.temp | command2singlejob.pl > single_job_submmit.temp
	./print_command_paired_tblastx2axt_ant.sh > command_tblastx2axt.temp
	./print_command_kaks_calculator.sh | command2singlejob_general.pl > axt_onejob_sub.temp
