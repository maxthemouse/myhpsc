#!/bin/bash
if [ ! -f ./libnuma.so ]; then
   ln -s /usr/lib64/libnuma.so.1 ./libnuma.so
fi
qsub -q gpu -l nodes=1:ppn=4:gpus=1,mem=7gb,walltime=03:00:00 -I
