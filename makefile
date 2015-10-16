

all:
	qsub -cwd -e sge -o sge ./tblastx_qsub.sh

clean:
	rm sge/*
