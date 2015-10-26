

all:
	qsub -cwd -e sge -o sge -t 1-87 ./tblastx_qsub.sh

test3:
	qsub -cwd -e sge -o sge -t 1-3 ./tblastx_qsub.sh

test:
	qsub -q important -cwd  -e sge -o sge ./tblastx_qsub.temp

clean:
	rm sge/*

commands:
	./run_paired_tblastx_ram.sh > command.temp
