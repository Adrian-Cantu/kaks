

all:
	qsub -cwd -e sge -o sge -t 1-87 ./tblastx_qsub.sh

test:
	qsub -cwd -e sge -o sge -t 1-3 ./tblastx_qsub.sh

clean:
	rm sge/*
