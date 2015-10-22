

all:
	qsub -cwd -e sge -o sge -t 1-87 ./tblastx_qsub.sh

test:
	qsub -cwd -e sge -o sge -t 1-3 ./tblastx_qsub.sh

test2:
	qsub -q important -cwd  -e sge -o sge ./tblastx_qsub.tmp

clean:
	rm sge/*
